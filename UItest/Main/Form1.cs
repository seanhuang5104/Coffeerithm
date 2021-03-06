﻿using System;
using System.Collections.Generic;
//using System.ComponentModel;
//using System.Data;
using System.Drawing;
using System.Windows.Forms;
//using System.Threading;
using CLIPSNET;

namespace Main
{
    public partial class Form1 : Form
    {
        private CLIPSNET.Environment clips;
        private string picPath = "";
        private List<string> factsAssert = new List<string>();
        private List<string> options;
        private string question;
        private bool questionCompleted = false;
        public Form1()
        {
            InitializeComponent();
            button2.ForeColor = Color.FromArgb(225,226,210);
            button2.BackColor = Color.FromArgb(64,64,64);
            this.WindowState = FormWindowState.Maximized;
            clips = new CLIPSNET.Environment();

            //get CLP file names and load in CLIPS
            //OpenFileDialog ofd = new OpenFileDialog();
            string path = System.IO.Path.Combine(Application.StartupPath);
            //ofd.Filter = "CLP Files (*.clp)|*.CLP";
            //ofd.Title = "Choose clp file to open";
            //ofd.RestoreDirectory = true;
            //if (ofd.ShowDialog(this) == DialogResult.Cancel)
            //    return;
            //string[] clpFiles = ofd.FileNames;
            //for (int i = 0; i < clpFiles.Length; i++)
            //{
                clips.Load(path+ "\\coffee_bean_facts.clp");
            //}
            //Get directory for pictures
            //FolderBrowserDialog fbd = new FolderBrowserDialog();
            //fbd.SelectedPath = System.IO.Path.Combine(Application.StartupPath);
            //fbd.Description = "Select folder for all pictures";
            //if(fbd.ShowDialog(this) == DialogResult.Cancel)
            //    return;
            picPath = path+ "\\Images\\";
        }
        /// <summary>
        /// Start recommandation
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button1_Click(object sender, EventArgs e)
        {
            clips.Reset();
            button1.Visible = false;
            button2.Visible = false;
            question = "Amount of milk?";
            factsAssert.Clear();
            options = new List<string>() { "no-milk", "little", "milky" };

            while (!questionCompleted)
            {
                QuestionUI.UI uitest = new QuestionUI.UI(options, question, picPath);
                if (DialogResult.OK == uitest.ShowDialog())
                {
                    factsAssert.Add(uitest.Tag.ToString());
                    ProcessRules();
                };
            }

            QuestionUI.Result recommend = new QuestionUI.Result(options, picPath);
            if (DialogResult.OK == recommend.ShowDialog())
            {
                questionCompleted = false;
            };
            
            button1.Visible = true;
            button2.Visible = true;
        }


        /// <summary>
        /// Exit program
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        private void button2_Click(object sender, EventArgs e)
        {
            clips.Dispose();
            this.Close();
        }

        /// <summary>
        /// Reset CLIPS and assert new fact.
        /// </summary>
        private void ProcessRules()
        {
            //clips.Reset();
            foreach (String factString in factsAssert)
            {
                String assertCommand = "(assert (answer_of " + factString + "))";
                clips.Eval(assertCommand);
            }
            clips.Run();
            HandleResponse();
        }

        /// <summary>
        /// Check CLIPS for next question.and setup UI.
        /// </summary>
        private void HandleResponse()
        {
            //Get nextQuestion contents.
            String evalStr = "(find-fact ((?f nextQuestion)) TRUE)";
            FactAddressValue fv = (FactAddressValue)((MultifieldValue)clips.Eval(evalStr))[0];

            options.Clear();
            //Get question string .
            LexemeValue damf = (LexemeValue)fv.GetFactSlot("question");
            question = damf.GetLexemeValue();
            //Finish questioning if next question is finished.
            if (question == "finished")
            {
                questionCompleted = true;
                evalStr = "(find-fact ((?f profile)) TRUE)";
                fv = (FactAddressValue)((MultifieldValue)clips.Eval(evalStr))[0];
                string bean_name = ((LexemeValue)fv.GetFactSlot("bean_recommanded")).GetLexemeValue();
                string bean_remark = ((LexemeValue)fv.GetFactSlot("bean_remark")).GetLexemeValue();
                string brew_name = ((LexemeValue)fv.GetFactSlot("brew_recommanded")).GetLexemeValue();
                string brew_remark = ((LexemeValue)fv.GetFactSlot("brew_remark")).GetLexemeValue();
                string mood_modifier = ((LexemeValue)fv.GetFactSlot("mood_modifier")).GetLexemeValue();
                options.Add(bean_name);
                options.Add(bean_remark);
                options.Add(brew_name);
                options.Add(brew_remark);
                options.Add("C"+brew_name);
                options.Add(mood_modifier);

                return;
            }

            //Get available options
            MultifieldValue vamf = (MultifieldValue)fv.GetFactSlot("options");
         
            for (int i = 0; i < vamf.Count; i++)
            {
                LexemeValue va = (LexemeValue)vamf[i];
                options.Add(va.GetLexemeValue());
            }
        }

    }
}
