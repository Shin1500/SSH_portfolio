using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp1
{
    public class DBManager
    {
        protected SqlConnection conn = new SqlConnection();
        private void ConnectDB()
        {
            conn.ConnectionString = $"Data Source=({"local"}); " +
                  $"Initial Catalog = {"ProductDataProject"}; Integrated Security = {"SSPI"}; Timeout={3}";
            conn.Open();
        }

        // 파일경로 받아와서 DB에 저장
        public void DBSave(string file)
        {
            try
            {
                ConnectDB();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                string sql = "";


                string[] csv = File.ReadAllLines(file);
                string[] data = csv.Skip(1).ToArray(); // 첫번째 줄 생략

                foreach (string item in data)
                {
                    string[] value = item.Split(',');
                    sql = "insert into productdata values (@val1, @val2, @val3, @val4, @val5, @val6, @val7, @val8, @val9)";
                    cmd.Parameters.AddWithValue("@val1", value[0]);
                    cmd.Parameters.AddWithValue("@val2", value[1]);
                    cmd.Parameters.AddWithValue("@val3", value[2]);
                    cmd.Parameters.AddWithValue("@val4", value[3]);
                    cmd.Parameters.AddWithValue("@val5", value[4]);
                    cmd.Parameters.AddWithValue("@val6", value[5]);
                    cmd.Parameters.AddWithValue("@val7", value[6]);
                    cmd.Parameters.AddWithValue("@val8", value[7]);
                    // 시간 없애고 날짜만 저장하는 코드
                    string date = "";
                    for (int i = 0; i < value[8].Length - 13; i++)
                    {
                        date += value[8][i];
                    }
                    value[8] = date;
                    cmd.Parameters.AddWithValue("@val9", value[8]);

                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
                System.Windows.Forms.MessageBox.Show("저장이 완료되었습니다");
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
                System.Windows.Forms.MessageBox.Show(ex.StackTrace);

            }
            finally
            {
                conn.Close();
            }
        }
    }
}