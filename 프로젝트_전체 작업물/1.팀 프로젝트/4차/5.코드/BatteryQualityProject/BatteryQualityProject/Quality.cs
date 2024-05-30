using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace WindowsFormsApp1
{
    public partial class Quality : Form
    {
        private SqlConnection conn = new SqlConnection();

        Reports report;

        private void ConnectDB()
        {
            conn.ConnectionString = $"Data Source=({"local"}); " +
                                    $"Initial Catalog = {"ProductDataProject"}; Integrated Security = {"SSPI"}; Timeout={3}";
            conn.Open();
        }
        public Quality()
        {
            InitializeComponent();
            chart2.Hide();
            button2.Hide();
            chart2.Series[0].Name = "양품";
            chart2.Series[1].Name = "불량품";
            chart2.Series[0].Color = Color.Blue;
            chart2.Series[1].Color = Color.Red;
            comboBox1.Items.Add("All");
            
            report = new Reports(this);

            FillComboBox();

            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                string sql = "";
                string sql2 = "";
                List<string> date = new List<string>();

                sql = "select count(*) as count, workingtime from productdata " +
                    "where(realpower between 1650 and 1750 or realpower between 670 and 720) " +
                    "group by workingtime order by workingtime"; // 양품
                cmd.CommandText = sql;
                SqlDataReader dr = cmd.ExecuteReader();


                while (dr.Read())
                {
                    date.Add(dr[1].ToString());
                    chart2.Series[0].Points.AddXY(DateTime.Parse(dr[1].ToString()), int.Parse(dr[0].ToString()));
                }
                dr.Close();

                sql2 = "select count(*) as count, workingtime from productdata " +
                            "WHERE([RealPower] < 1650 OR[RealPower] > 1750) AND([RealPower] < 670 OR[RealPower] > 720) " +
                            "group by workingtime order by workingtime"; // 불량품
                cmd.CommandText = sql2;
                SqlDataReader dr2 = cmd.ExecuteReader();
                while (dr2.Read())
                {
                    chart2.Series[1].Points.AddXY(DateTime.Parse(dr2[1].ToString()), int.Parse(dr2[0].ToString()));
                }
                dr2.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace);
                MessageBox.Show(ex.Message);
            }
            finally { conn.Close(); }


        }
        private void FillComboBox()
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "SELECT DISTINCT CONVERT(nvarchar, WorkingTime) AS WorkingTime FROM ProductData ORDER BY WorkingTime";
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    comboBox1.Items.Add(reader["WorkingTime"].ToString());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error");
            }
            finally
            {
                conn.Close();
            }           
        }

        private void All_button_Click(object sender, EventArgs e)
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                if (comboBox1.Text == "All")
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                      + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData order by WorkingTime";
                }
                else
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData"
                                + " WHERE CONVERT(date, WorkingTime) = @SelectedDate";

                    cmd.Parameters.AddWithValue("@selectedDate", comboBox1.SelectedItem.ToString());
                }                          

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "mytest");

                dataGridView1.DataSource = ds.Tables["mytest"];
            }
            catch (Exception ex)
            {
                MessageBox.Show("날짜를 선택해주세요");
            }
            finally
            {
                conn.Close();
            }
        }
        private void Chart_Click(object sender, EventArgs e)
        {
            // 불량품이 없을 때에는 양품만 보여주는 파이차트 코드
            try
            {
                ConnectDB();
                chart1.Series[0].Points.Clear();

                //양품 데이터
                SqlCommand cmdGood = new SqlCommand();
                cmdGood.Connection = conn;

                if (comboBox1.Text == "All")
                {
                    cmdGood.CommandText = "SELECT COUNT(*) AS TotalGoodCount FROM ProductData WHERE (RealPower BETWEEN 1650 AND 1750 OR RealPower BETWEEN 670 AND 720)";                                    
                }
                else
                {
                    cmdGood.CommandText = "SELECT COUNT(*) AS GoodCount FROM ProductData " +
                                          "WHERE CONVERT(date, WorkingTime) = @SelectedDate " +
                                         "AND (RealPower BETWEEN 1650 AND 1750 OR RealPower BETWEEN 670 AND 720)";

                    cmdGood.Parameters.AddWithValue("@SelectedDate", comboBox1.SelectedItem.ToString());
                }              

                int GoodCount = Convert.ToInt32(cmdGood.ExecuteScalar()); //ToInt32 - 문자형식을 숫자형식으로 변환

                //불량품 데이터
                SqlCommand cmdDefective = new SqlCommand();
                cmdDefective.Connection = conn;

                if (comboBox1.Text == "All")
                {
                    cmdDefective.CommandText = "SELECT COUNT(*) AS TotalDefectiveCount FROM ProductData WHERE ([RealPower] < 1650 OR [RealPower] > 1750) AND ([RealPower] < 670 OR [RealPower] > 720)";
                }
                else
                {
                    cmdDefective.CommandText = "SELECT COUNT(*) AS DefectiveCount FROM ProductData " +
                                           "WHERE CONVERT(date, WorkingTime) = @SelectedDate " +
                                           "AND ([RealPower] < 1650 OR [RealPower] > 1750) AND ([RealPower] < 670 OR [RealPower] > 720)";

                    cmdDefective.Parameters.AddWithValue("@SelectedDate", comboBox1.SelectedItem.ToString());
                }              

                int DefectiveCount = Convert.ToInt32(cmdDefective.ExecuteScalar());

                //전체 데이터
                SqlCommand cmdTotal = new SqlCommand();
                cmdTotal.Connection = conn;

                if (comboBox1.Text == "All")
                {
                    cmdTotal.CommandText = "SELECT COUNT(*) AS TotalAllCount FROM ProductData";
                }
                else
                {
                    cmdTotal.CommandText = "SELECT COUNT(*) AS TotalCount FROM ProductData " +
                                       "WHERE CONVERT(date, WorkingTime) = @SelectedDate";

                    cmdTotal.Parameters.AddWithValue("@SelectedDate", comboBox1.SelectedItem.ToString());
                }                

                int TotalCount = Convert.ToInt32(cmdTotal.ExecuteScalar());

                //양품, 불량품 퍼센트
                double GoodData = ((double)GoodCount / TotalCount) * 100.0;
                GoodData = Math.Round(GoodData, 1);
                double DefectiveData = ((double)DefectiveCount / TotalCount) * 100.0;
                DefectiveData = Math.Round(DefectiveData, 1);

                //양품, 불량품 개수
                int GoodDataCount = Convert.ToInt32(cmdGood.ExecuteScalar());
                int DefectiveDataCount = Convert.ToInt32(cmdDefective.ExecuteScalar());

                chart1.Series[0].Points.AddXY("양품: " + GoodDataCount + "개("+ GoodData + "%)", GoodCount);

                // 불량품이 있는 경우에만 파이차트에 추가
                if (DefectiveCount > 0)
                {
                    chart1.Series[0].Points.AddXY("불량품: " + DefectiveDataCount + "개("+ DefectiveData + "%)", DefectiveCount);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("날짜를 선택해주세요");
            }
            finally
            {
                conn.Close();
            }
        }
        private void GoodData_button_Click(object sender, EventArgs e)
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                if (comboBox1.Text == "All")
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                      + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData"
                                      + " WHERE (RealPower BETWEEN 1650 AND 1750 OR RealPower BETWEEN 670 AND 720) order by WorkingTime";
                }
                else
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency, " +
                                         "TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime " +
                                         "FROM ProductData " +
                                         "WHERE CONVERT(date, WorkingTime) = @SelectedDate " +
                                         "AND (RealPower BETWEEN 1650 AND 1750 OR RealPower BETWEEN 670 AND 720)";

                    cmd.Parameters.AddWithValue("@selectedDate", comboBox1.SelectedItem.ToString());
                }                             

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "mytest");

                dataGridView2.DataSource = ds.Tables["mytest"];
            }
            catch (Exception ex)
            {
                MessageBox.Show("날짜를 선택해주세요");
            }
            finally
            {
                conn.Close();
            }
        }

        private void DefectiveData_button_Click(object sender, EventArgs e)
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                if (comboBox1.Text == "All")
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                    + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData"
                                    + " WHERE ([RealPower] < 1650 OR [RealPower] > 1750) AND ([RealPower] < 670 OR [RealPower] > 720) order by WorkingTime";
                }
                else
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                    + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData"
                                    + " WHERE CONVERT(date, WorkingTime) = @SelectedDate"
                                    + " AND ([RealPower] < 1650 OR [RealPower] > 1750) AND ([RealPower] < 670 OR [RealPower] > 720)";

                    cmd.Parameters.AddWithValue("@selectedDate", comboBox1.SelectedItem.ToString());
                }                              

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "mytest");

                dataGridView2.DataSource = ds.Tables["mytest"];
            }
            catch (Exception ex)
            {
                MessageBox.Show("날짜를 선택해주세요");
            }
            finally
            {
                conn.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // 그래프 보기
            button1.Hide();
            button2.Show();
            chart2.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            button2.Hide();
            button1.Show();
            chart2.Hide();
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string selectedData = "";

            Form fc = Application.OpenForms["Reports"];

            if (report.IsDisposed)
                report = new Reports(this);

            if (fc != null)
            {
                if (e.RowIndex >= 0)
                {
                    selectedData = "\n";
                    DataGridViewRow selectedRow = dataGridView2.Rows[e.RowIndex];
                    for (int i = 0; i < 9; i++)
                    {
                        selectedData += selectedRow.Cells[i].Value.ToString() + "           ";
                    }
                    report.Show(selectedData, true);
                }
            }
            if (fc == null)
            {
                if (e.RowIndex >= 0)
                {
                    selectedData = "PageNO    Speed    Length    RealPower    SetFrequency    SetDuty    SetPower    GateOnTime    WorkingTime\n";
                    DataGridViewRow selectedRow = dataGridView2.Rows[e.RowIndex];
                    for (int i = 0; i < 9; i++)
                    {
                        selectedData += selectedRow.Cells[i].Value.ToString() + "           ";
                    }
                    report.Show(selectedData, false);
                }
            }
        }
    }
}


