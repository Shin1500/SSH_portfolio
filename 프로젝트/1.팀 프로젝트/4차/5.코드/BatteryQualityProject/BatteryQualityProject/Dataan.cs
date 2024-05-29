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
using System.Windows.Forms.DataVisualization.Charting;
using System.Net;
using System.Xml.Linq;

namespace WindowsFormsApp1
{
    public partial class Dataan : Form
    {
        private SqlConnection conn = new SqlConnection();

        private void ConnectDB()
        {
            conn.ConnectionString = $"Data Source=({"local"}); " +
                $"Initial Catalog = {"ProductDataProject"}; Integrated Security = {"SSPI"}; Timeout={3}";
            conn = new SqlConnection(conn.ConnectionString);
            conn.Open();
        }

        public Dataan()
        {
            InitializeComponent();

            /*===================================================================       comboBox1       =======================================================================================*/
            string[] items;
            try
            {
                /*ConnectDB(); //DBMS에 연결한 것
                SqlCommand cmd = new SqlCommand(); //SQL문 보낼 객체
                cmd.Connection = conn; //어디로 연결할 지 지정
                //cmd.CommandText = "select Distinct WorkingTime from ProductData"; //유탁님 코드 //전송할 SQL문 작성
                cmd.CommandText = "select Distinct WorkingTime from ProductData order by WorkingTime"; //오름차순 정렬 //전송할 SQL문 작성
                SqlDataAdapter da = new SqlDataAdapter(cmd); //SQL 데이터 처리할 변수
                DataSet ds = new DataSet(); //실제 데이터 저장할 객체
                da.Fill(ds, "mytest"); //da를 통해서 ds에 mytest라는 이름으로 sql 결과문을 넣음
                
                if (ds.Tables.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        DataRow dr = ds.Tables[0].Rows[i];
                        items = dr.ItemArray.Select(o => o == null ? string.Empty : o.ToString()).ToArray();
                        comboBox1.Items.Add(dr[0]);
                    }
                }*/

                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select Distinct WorkingTime from ProductData order by WorkingTime";
                SqlDataReader reader = cmd.ExecuteReader();
                comboBox1.Items.Add("All"); // comboBox에 All 모두보기 추가
                while (reader.Read())
                {
                    comboBox1.Items.Add(reader["WorkingTime"].ToString());
                }

            }
            catch (Exception ex)
            {
            }
            finally
            {
                conn.Close(); //java에서는 이 코드를 try catch 감싸야 하기도 함
            }

            /*===================================================================       comboBox2       =======================================================================================*/
            comboBox2.Items.Add("Speed");
            comboBox2.Items.Add("Length");
            comboBox2.Items.Add("RealPower");
            comboBox2.Items.Add("SetFrequency");
            comboBox2.Items.Add("SetDuty");
            comboBox2.Items.Add("SetPower");
            comboBox2.Items.Add("GateOnTime");
            // comboBox2.Items.Add("WorkingTime");

            /*===================================================================       comboBox3       =======================================================================================*/
            string[] pagedata = new string[39];
            
            for(int i = 1; i < 40; i++)
            {
                pagedata[i - 1] = i.ToString();
            }
            
            comboBox3.Items.AddRange(pagedata);
            comboBox4.Items.AddRange(pagedata);
            comboBox5.Items.AddRange(pagedata);
            comboBox6.Items.AddRange(pagedata);
            comboBox7.Items.AddRange(pagedata);
        }
        /*================================================================  날짜 별 데이터 띄우기  ====================================================================================*/
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                SqlParameter data = new SqlParameter("@Wt", comboBox1.Text);
                cmd.Parameters.Add(data);
                /*
                cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                      + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData"
                                      + " WHERE CONVERT(date, WorkingTime) = @Wt"; //내 코드를 참고해서 수정한 것 //공백제거
                */

                // 데이터 모두(All) 보기 추가
                if(comboBox1.Text == "All")
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                      + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData order by WorkingTime";
                }
                else
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                      + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData"
                                      + " WHERE WorkingTime = @Wt"; //유탁님 코드를 수정한 것 //공백제거
                }
                
                //cmd.CommandText = "select * from ProductData where WorkingTime = @Wt"; //유탁님 코드 원본

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "mytest");
                dataGridView1.DataSource = null;
                dataGridView1.DataSource = ds;
                dataGridView1.DataMember = "mytest";
            }
            catch (Exception ex)
            {
                MessageBox.Show("오류 발생: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        /*===================================================================       차트1       =======================================================================================*/
        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {           
            try
            {
                
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                // 모두 보기에서 차트 보기 추가
                if(comboBox1.Text == "All")
                {
                    cmd.CommandText = $"select {comboBox2.Text} from ProductData where PageNo = '{comboBox3.Text}' order by WorkingTime";
                }
                else
                {
                    cmd.CommandText = $"select {comboBox2.Text} from ProductData where convert(date, WorkingTime) = '{comboBox1.Text}' and PageNo = '{comboBox3.Text}'";
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "mytest");
           
                
                chart1.Series[0].Points.Clear();
                string[] ch1;
                if (ds.Tables.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        DataRow dr = ds.Tables[0].Rows[i];
                        ch1 = dr.ItemArray.Select(o => o == null ? string.Empty : o.ToString()).ToArray();
                        
                        foreach (var item in ch1)
                        {
                            chart1.Series[0].Points.AddXY("", item);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("오류 발생: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
        

        /*===================================================================       차트2       =======================================================================================*/
        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                //cmd.CommandText = $"select {comboBox2.Text} from ProductData where convert(date, WorkingTime) = '{comboBox1.Text}' and PageNo = '{comboBox4.Text}'";
                // 모두 보기에서 차트 보기 추가
                if (comboBox1.Text == "All")
                {
                    cmd.CommandText = $"select {comboBox2.Text} from ProductData where PageNo = '{comboBox4.Text}' order by WorkingTime";
                }
                else
                {
                    cmd.CommandText = $"select {comboBox2.Text} from ProductData where convert(date, WorkingTime) = '{comboBox1.Text}' and PageNo = '{comboBox4.Text}'";
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "mytest");


                chart2.Series[0].Points.Clear();
                string[] ch2;
                if (ds.Tables.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        DataRow dr = ds.Tables[0].Rows[i];
                        ch2 = dr.ItemArray.Select(o => o == null ? string.Empty : o.ToString()).ToArray();

                        foreach (var item in ch2)
                        {
                            chart2.Series[0].Points.AddXY("", item);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("오류 발생: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }


        /*===================================================================       차트3       =======================================================================================*/
        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                //cmd.CommandText = $"select {comboBox2.Text} from ProductData where convert(date, WorkingTime) = '{comboBox1.Text}' and PageNo = '{comboBox5.Text}'";
                // 모두 보기에서 차트 보기 추가
                if (comboBox1.Text == "All")
                {
                    cmd.CommandText = $"select {comboBox2.Text} from ProductData where PageNo = '{comboBox5.Text}' order by WorkingTime";
                }
                else
                {
                    cmd.CommandText = $"select {comboBox2.Text} from ProductData where convert(date, WorkingTime) = '{comboBox1.Text}' and PageNo = '{comboBox5.Text}'";
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "mytest");


                chart3.Series[0].Points.Clear();
                string[] ch3;
                if (ds.Tables.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        DataRow dr = ds.Tables[0].Rows[i];
                        ch3 = dr.ItemArray.Select(o => o == null ? string.Empty : o.ToString()).ToArray();

                        foreach (var item in ch3)
                        {
                            chart3.Series[0].Points.AddXY("", item);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("오류 발생: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }


        /*===================================================================       차트4       =======================================================================================*/
        private void comboBox6_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                //cmd.CommandText = $"select {comboBox2.Text} from ProductData where convert(date, WorkingTime) = '{comboBox1.Text}' and PageNo = '{comboBox6.Text}'";
                // 모두 보기에서 차트 보기 추가
                if (comboBox1.Text == "All")
                {
                    cmd.CommandText = $"select {comboBox2.Text} from ProductData where PageNo = '{comboBox6.Text}' order by WorkingTime";
                }
                else
                {
                    cmd.CommandText = $"select {comboBox2.Text} from ProductData where convert(date, WorkingTime) = '{comboBox1.Text}' and PageNo = '{comboBox6.Text}'";
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "mytest");

                chart4.Series[0].Points.Clear();
                string[] ch4;                
                if (ds.Tables.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        DataRow dr = ds.Tables[0].Rows[i];
                        ch4 = dr.ItemArray.Select(o => o == null ? string.Empty : o.ToString()).ToArray();

                        foreach (var item in ch4)
                        {
                            chart4.Series[0].Points.AddXY("", item);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("오류 발생: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        /*===================================================================       날짜와 페이지별로 자료 띄우기       =======================================================================================*/
        private void comboBox7_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                SqlParameter data = new SqlParameter("@Wt", comboBox1.Text);
                SqlParameter data2 = new SqlParameter("@Pn", comboBox7.Text);
                cmd.Parameters.Add(data);
                cmd.Parameters.Add(data2);
                /*
                cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                      + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData"
                                      + " WHERE CONVERT(date, WorkingTime) = @Wt"; //내 코드를 참고해서 수정한 것 //공백제거
                */

                if (comboBox1.Text == "All")
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                      + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData where PageNo = @Pn order by WorkingTime";
                }
                else
                {
                    cmd.CommandText = "SELECT TRIM(PageNo) AS PageNo, TRIM(Speed) AS Speed, TRIM(Length) AS Length, TRIM(RealPower) AS RealPower, TRIM(SetFrequency) AS SetFrequency,"
                                      + " TRIM(SetDuty) AS SetDuty, TRIM(SetPower) AS SetPower, TRIM(GateOnTime) AS GateOnTime, TRIM(WorkingTime) AS WorkingTime FROM ProductData"
                                      + " WHERE WorkingTime = @Wt AND PageNo = @Pn";
                }

                //cmd.CommandText = "select * from ProductData where WorkingTime = @Wt"; //유탁님 코드 원본

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "mytest");
                dataGridView1.DataSource = null;
                dataGridView1.DataSource = ds;
                dataGridView1.DataMember = "mytest";
            }
            catch (Exception ex)
            {
                MessageBox.Show("오류 발생: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
