using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.WebRequestMethods;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace WindowsFormsApp1
{
    public partial class Reports : Form
    {
        Quality qu2;

        public Reports(Quality parent)
        {
            InitializeComponent();
            qu2 = parent;
        }
        /*==================================================   데이터 불러오기 및 form 실행   ===========================================*/
        public void Show(string selectedData, bool append)
        {
            if (append)
                richTextBox2.Text += selectedData;
            else
                richTextBox2.Text = selectedData;
            Show();
        }

        /*========================================================   파일 저장   ========================================================*/
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                Stream myStream;
                SaveFileDialog saveFileDialog1 = new SaveFileDialog();

                saveFileDialog1.Filter = "txt files (*.txt)|*.txt|All files (*.*)|*.*";
                saveFileDialog1.FilterIndex = 1;
                saveFileDialog1.RestoreDirectory = true;

                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                {
                   
                    String txtSave = textBox1.Text + "\n\n작성일 : " + label8.Text + "\n\n작성자 : " + textBox2.Text + "\n\n개요\n" +
                    richTextBox1.Text + "\n\n품질 현황\n" + richTextBox2.Text + "\n\n문제점 및 개선 방향\n" +
                    richTextBox3.Text + "\n\n조치 및 결과\n" + richTextBox4.Text;

                    this.Text = saveFileDialog1.FileName;
                    using (StreamWriter sw = new StreamWriter(saveFileDialog1.FileName))
                    {
                        sw.Write(txtSave);
                    }
                    
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("오류 발생: " + ex.Message);
            }
            finally
            {
                Close();
            }
            
        }

        /*========================================================   현재 시간 =======================================================*/
        private void timer1_Tick(object sender, EventArgs e)
        {
            label8.Text = DateTime.Now.ToString("f");
        }
        private void Form1_Load_1(object sender, EventArgs e)
        {
            timer1.Interval = 100;
            timer1.Start();
        }

        /*
        private void Reports_FormClosed(object sender, FormClosedEventArgs e)
        {
            qu2.refreshForm();
        }
        */
    }
}
