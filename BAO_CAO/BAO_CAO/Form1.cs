using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BAO_CAO
{
    public partial class Form1: Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            InitializeComponent();
        }

        private void button5_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            string url = "https://www.facebook.com/nguyen.luan.754972";
            System.Diagnostics.Process.Start(new ProcessStartInfo
            {
                FileName = url,
                UseShellExecute = true
            });
        }

        private void linklbl_facebook_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            string url = "https://www.facebook.com/nguyen.luan.754972";
            System.Diagnostics.Process.Start(new ProcessStartInfo
            {
                FileName = url,
                UseShellExecute = true
            });
        }

        private void pictureBox4_Click(object sender, EventArgs e)
        {
            string url = "https://www.instagram.com/luanaderatta/";
            System.Diagnostics.Process.Start(new ProcessStartInfo
            {
                FileName = url,
                UseShellExecute = true
            });
        }

        private void linkLbl_Insta_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            string url = "https://www.instagram.com/luanaderatta/";
            System.Diagnostics.Process.Start(new ProcessStartInfo
            {
                FileName = url,
                UseShellExecute = true
            });
        }
    }
}
