using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace LAB5
{
    public partial class Form1 : Form
    {
        [System.Runtime.InteropServices.StructLayoutAttribute(System.Runtime.InteropServices.LayoutKind.Sequential)]
        struct Point
        {
            public UInt64 time;
            public Double value;
        }

        [System.Runtime.InteropServices.DllImport("lab5.dll")]
        private static extern Point get_value();

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            chart1.Series[0].Name = "native";
            chart1.Series[0].ChartType = SeriesChartType.FastLine;
            chart1.Series[0].XValueType = ChartValueType.DateTime;
            chart1.Series[0].YValueType = ChartValueType.Double;
            chart1.ChartAreas[0].AxisX.LabelStyle.Format = "hh:mm:ss.f";
            Timer MyTimer = new Timer();
            MyTimer.Interval = (1000);
            MyTimer.Tick += new EventHandler(TimerTick);
            MyTimer.Start();
        }

        private void TimerTick(object sender, EventArgs args)
        {
            Point p = get_value();
            DateTimeOffset dto = DateTimeOffset.FromUnixTimeMilliseconds((long)p.time);
            chart1.Series[0].Points.AddXY(dto.LocalDateTime, p.value);
            if(chart1.Series[0].Points.Count >= 10)
            {
                chart1.Series[0].Points.RemoveAt(0);
                chart1.ChartAreas[0].RecalculateAxesScale();
            }
        }
    }
}
