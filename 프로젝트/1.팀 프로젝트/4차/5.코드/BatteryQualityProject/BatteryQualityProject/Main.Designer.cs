namespace WindowsFormsApp1
{
    partial class Main
    {
        /// <summary>
        /// 필수 디자이너 변수입니다.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 사용 중인 모든 리소스를 정리합니다.
        /// </summary>
        /// <param name="disposing">관리되는 리소스를 삭제해야 하면 true이고, 그렇지 않으면 false입니다.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form 디자이너에서 생성한 코드

        /// <summary>
        /// 디자이너 지원에 필요한 메서드입니다. 
        /// 이 메서드의 내용을 코드 편집기로 수정하지 마세요.
        /// </summary>
        private void InitializeComponent()
        {
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.품질관리ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.데이터분석ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.데이터저장소ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // menuStrip1
            // 
            this.menuStrip1.Dock = System.Windows.Forms.DockStyle.None;
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.품질관리ToolStripMenuItem,
            this.데이터분석ToolStripMenuItem,
            this.데이터저장소ToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(480, 85);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(387, 36);
            this.menuStrip1.TabIndex = 11;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // 품질관리ToolStripMenuItem
            // 
            this.품질관리ToolStripMenuItem.BackColor = System.Drawing.SystemColors.Info;
            this.품질관리ToolStripMenuItem.Font = new System.Drawing.Font("맑은 고딕", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.품질관리ToolStripMenuItem.Name = "품질관리ToolStripMenuItem";
            this.품질관리ToolStripMenuItem.Size = new System.Drawing.Size(104, 32);
            this.품질관리ToolStripMenuItem.Text = "품질관리";
            this.품질관리ToolStripMenuItem.Click += new System.EventHandler(this.품질관리ToolStripMenuItem_Click);
            // 
            // 데이터분석ToolStripMenuItem
            // 
            this.데이터분석ToolStripMenuItem.BackColor = System.Drawing.SystemColors.Info;
            this.데이터분석ToolStripMenuItem.Font = new System.Drawing.Font("맑은 고딕", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.데이터분석ToolStripMenuItem.Name = "데이터분석ToolStripMenuItem";
            this.데이터분석ToolStripMenuItem.Size = new System.Drawing.Size(124, 32);
            this.데이터분석ToolStripMenuItem.Text = "데이터분석";
            this.데이터분석ToolStripMenuItem.Click += new System.EventHandler(this.데이터분석ToolStripMenuItem_Click);
            // 
            // 데이터저장소ToolStripMenuItem
            // 
            this.데이터저장소ToolStripMenuItem.BackColor = System.Drawing.SystemColors.Info;
            this.데이터저장소ToolStripMenuItem.Font = new System.Drawing.Font("맑은 고딕", 15F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.데이터저장소ToolStripMenuItem.Name = "데이터저장소ToolStripMenuItem";
            this.데이터저장소ToolStripMenuItem.Size = new System.Drawing.Size(151, 32);
            this.데이터저장소ToolStripMenuItem.Text = "데이터 저장소";
            this.데이터저장소ToolStripMenuItem.Click += new System.EventHandler(this.데이터저장소ToolStripMenuItem_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("굴림", 30F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.label1.Location = new System.Drawing.Point(12, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(537, 40);
            this.label1.TabIndex = 12;
            this.label1.Text = "배터리팩 품질관리 프로그램";
            // 
            // pictureBox3
            // 
            this.pictureBox3.Image = global::WindowsFormsApp1.Properties.Resources._2;
            this.pictureBox3.Location = new System.Drawing.Point(483, 343);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(418, 204);
            this.pictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox3.TabIndex = 15;
            this.pictureBox3.TabStop = false;
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = global::WindowsFormsApp1.Properties.Resources._1;
            this.pictureBox2.Location = new System.Drawing.Point(483, 124);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(417, 213);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 14;
            this.pictureBox2.TabStop = false;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::WindowsFormsApp1.Properties.Resources._3;
            this.pictureBox1.Location = new System.Drawing.Point(20, 85);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(457, 462);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 13;
            this.pictureBox1.TabStop = false;
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(968, 563);
            this.Controls.Add(this.pictureBox3);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Main";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "배터리팩 품질관리 프로그램";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.OpenFileDialog openFileDialog1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem 품질관리ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 데이터분석ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 데이터저장소ToolStripMenuItem;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.PictureBox pictureBox3;
    }
}

