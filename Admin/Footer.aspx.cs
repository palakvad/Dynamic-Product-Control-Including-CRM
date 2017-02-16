﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Footer : System.Web.UI.Page
{
    Clsconnection cls = new Clsconnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        lblDeleteMsg.Text = "";

        if (!IsPostBack)
        {
            //if (!Utils.IsLoggedIn())
            //{
            //    Utils.LogOut();
            //}
            //else
            {
                Label lblFormTitle = (Label)this.Master.FindControl("lblFormTitle");
                lblFormTitle.Text = "Manage Footer";
                BindDescription();
            }
        }
    }
    public void clearall()
    {
        cls.ResetFormControlValues(this.Page);
        lblId.Text = "";
        txtDescription.Text = "";
    }
    protected void BindDescription()
    {
        DataSet ds = new DataSet();
        ds = cls.ReturnDataSet("RetriveData_Alias",
            new SqlParameter("@Field", "*"),
            new SqlParameter("@TblNm", "Footer"),
           new SqlParameter("@WhereClause", "where Footer.IsActive = 1"));

        rptr.DataSource = ds;
        rptr.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(lblId.Text))
        {
            lblMsg.Text = "You can not insert new Record. You can only update a record.";
            return;
        }
        else
        {
            cls.ExecuteDA("Update_Footer", new SqlParameter("@ID", lblId.Text),
                                               new SqlParameter("@Description", txtDescription.Text));


            lblMsg.Text = "Details updated successfully.";
            BindDescription();
            clearall();
        }
    }
    protected void rptr_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "EditGroup")
        {
            DataSet ds = new DataSet();
            ds = cls.ReturnDataSet("sp_RetriveDataWithField",
                 new SqlParameter("@Fields", "*"),
                new SqlParameter("@TblNm", "Footer"),
           new SqlParameter("@WhereClause", "Footer where Id ='" + e.CommandArgument + "' and Footer.IsActive = 1"));
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblId.Text = e.CommandArgument.ToString();
                txtDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            }
        }
    }
}