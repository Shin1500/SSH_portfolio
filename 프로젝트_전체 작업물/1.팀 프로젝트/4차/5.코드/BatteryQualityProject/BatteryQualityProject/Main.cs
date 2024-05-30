using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        private void 품질관리ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Quality quality = new Quality();
            quality.Show();
        }

        private void 데이터분석ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Dataan dataan = new Dataan();
            dataan.Show();
        }

        private void 데이터저장소ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Fileload fileload = new Fileload();
            fileload.Show();
        }
    }
}
