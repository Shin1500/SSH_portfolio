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

namespace WindowsFormsApp1
{
    public partial class Fileload : Form
    {
        
        public Fileload()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            DialogResult dr = ofd.ShowDialog();
            if (dr == DialogResult.OK)
            {
                string fileFullName = ofd.FileName;
                textBox1.Text = fileFullName;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                MessageBox.Show("파일을 선택해주세요");
            }
            else
            {
                DBManager db = new DBManager();
                db.DBSave(textBox1.Text);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "")
            {
                MessageBox.Show("파일을 선택해주세요");
            }
            else
            {
                dataGridView1.Rows.Clear();
                dataGridView1.DataSource = null;
                string[] csv = File.ReadAllLines(textBox1.Text);
                string[] data = csv.Skip(1).ToArray();
                foreach (string item in data)
                {
                    string[] value = item.Split(',');
                    string date = "";
                    for (int i = 0; i < value[8].Length - 13; i++)
                    {
                        date += value[8][i];
                    }
                    value[8] = date;
                    dataGridView1.Rows.Add(value[0], value[1], value[2], value[3], value[4], value[5], value[6], value[7], value[8]);

                }
            }
        }
    }
}
