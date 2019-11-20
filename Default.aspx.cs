using System;
using System.Collections.Generic;
using System.Windows.Forms;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //string DirectedAddress = "?site_id=8488&key=0b8da796b00334ae347";

         

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.Page.Form.Enctype = "multipart/form-data";

               
            }

           
        }

        protected void dwlSortBy_OnTextChanged(object rateSender, EventArgs f)
        {
            if(dwlSortBy.SelectedValue.ToString() == "Select One")
            {
                pnlSortDirection.Visible = false;
                pnlStatus.Visible = false;
                pnlSearchMatch.Visible = false;
                pnlMetaData.Visible = false;
            }

            if (dwlSortBy.SelectedValue.ToString() != "relevance" && dwlSortBy.SelectedValue.ToString() != "Select One")
            {
                pnlSortDirection.Visible = true;
                pnlStatus.Visible = true;
                pnlSearchMatch.Visible = true;
                pnlMetaData.Visible = true; 
            }
            else
            {
                pnlSortDirection.Visible = false;
                pnlStatus.Visible = false;
                pnlSearchMatch.Visible = false;
                pnlMetaData.Visible = false;


            }

        }

        protected void dwlUpdateType_OnTextChanged(object rateSender, EventArgs t)
        {
            if (dwlUpdateType.SelectedValue.ToString() == "Select One")
            {
                pnlLastUpdate.Visible = false;
            }
                

            if (dwlUpdateType.SelectedValue.ToString() == "last" )
            {
                pnlLastUpdate.Visible = true;
                txtLastUpdateLast.Visible = true;
                txtLastUpdateSince.Visible = false;
                txtLastUpdateSince.Text = null;
            }

            if (dwlUpdateType.SelectedValue.ToString() == "since")            
            {
                pnlLastUpdate.Visible = true;
                txtLastUpdateLast.Visible = false;
                txtLastUpdateLast.Text = null;
                txtLastUpdateSince.Visible = true;

            }


        }

        protected void txtSubjectID_OnTextChanged(object Sender, EventArgs x)
        {
            string l_string = "";

            if (!String.IsNullOrEmpty(txtSubjectID.Text) && txtSubjectID.Text.ToString().Substring(txtSubjectID.Text.ToString().Length - 1, 1) == ",")
            {
                l_string = txtSubjectID.Text.ToString().Substring(0, txtSubjectID.Text.ToString().Length - 1);
            }
            else
            {
                l_string = txtSubjectID.Text.ToString();
            }

           
       

            if (!String.IsNullOrEmpty(txtSubjectID.Text) && l_string.Contains(","))
            {
                pnlSubjectLogic.Visible = true;
            }
            else
            {
                pnlSubjectLogic.Visible = false;
            }


        }


        protected void txtTagName_OnTextChanged(object Sender, EventArgs c)
        {
           

            if (!String.IsNullOrEmpty(txtTagName.Text))
            {
                pnlTagNameMatch.Visible = true;
            }
            else
            {
                pnlTagNameMatch.Visible = false;
            }

        }

        protected string String_Clean(string txtObject)
        {
            string l_string;

            if (txtObject.Substring(txtObject.Length - 1, 1) == ",")
            {
                l_string = txtObject.Substring(0, txtObject.Length - 1);
            }
            else
            {
                l_string = txtObject;
            }

            return l_string;
        }

        protected void lbKey_OnLoad (object sender, EventArgs s)
        {
            txtKey.Text = Guid.NewGuid().ToString().Replace("-", string.Empty).Replace("+", string.Empty);
        }

        protected void btnSearch_OnClick(object sender, EventArgs s)
        {
            string DirectedAddress = "?";
            string SiteID = "";
            string Key = "";
            string SortBy = "";
            string SortDirection = "";
            string CountList = "";
            string GroupIDs = "";
            string SubjectIDs = "";
            string SubjectLogic = "";
            string TagNames = "";
            string TagNameMatch = "";
            string Status = "";
            string UpdateType = "";
            string LastUpdate = "";
            string SearchTerm = "";
            string SearchMatch = "";
            string GuideTypes = "";
            string MetaData = "";
            string Expand = "";



            if(!string.IsNullOrEmpty(txtSiteID.Text))
            {
                SiteID = "site_id=" + txtSiteID.Text.ToString();
            }

            if(!string.IsNullOrEmpty(txtKey.Text))
            {
                Key = '&' + "key=" + txtKey.Text.ToString();
            }

            

            if (!string.IsNullOrEmpty(dwlSortBy.Text) && dwlSortBy.SelectedValue.ToString() != "Select One")
            {
                SortBy = '&' + "sort_by=" + dwlSortBy.Text.ToString();

            }

            if (!string.IsNullOrEmpty(dwlSortDirection.Text) && dwlSortDirection.SelectedValue.ToString() != "Select One" && dwlSortDirection.Visible == true)
            {
                if(dwlSortDirection.SelectedValue.ToString() == "1")
                
                 SortDirection = '&' + "sort_dir=" + "asc";

                else if(dwlSortDirection.SelectedValue.ToString() == "2")

                 SortDirection = '&' + "sort_dir=" + "desc";

            }

        
            if (!string.IsNullOrEmpty(txtCountlist.Text))
            {
                
                string l_string = "";
                
                l_string = String_Clean(txtCountlist.Text.ToString());

                 List<string> stringList = new List<string>(l_string.Split(','));

                 foreach (var count in stringList)
                {
                  
                    CountList =   '&' + "account_ids[]" + count.ToString() + CountList;

                }

            }

            if (!string.IsNullOrEmpty(txtGroupID.Text))
            {
                string l_string = "";

                l_string = String_Clean(txtGroupID.Text.ToString());

                List<string> stringList = new List<string>(l_string.Split(','));

                foreach (var count in stringList)
                {

                    GroupIDs = '&' + "group_ids[]" + count.ToString() + GroupIDs;

                }

            }

            if (!string.IsNullOrEmpty(txtSubjectID.Text) )
            {
                string l_string = "";

                l_string = String_Clean(txtSubjectID.Text.ToString());

                List<string> stringList = new List<string>(l_string.Split(','));

                foreach (var count in stringList)
                {

                    SubjectIDs = '&' + "subject_ids[]" + count.ToString() + SubjectIDs;

                }

            }

            if (!string.IsNullOrEmpty(dwlSubjectLogic.Text) && dwlSubjectLogic.SelectedValue.ToString() != "Select One")
            {
                if (dwlSubjectLogic.SelectedValue.ToString() == "1")

                    SubjectLogic = '&' + "subject_logic=" + "and";

                else if (dwlSubjectLogic.SelectedValue.ToString() == "2")

                    SubjectLogic = '&' + "subject_logic=" + "or";

            }

            if (!string.IsNullOrEmpty(txtTagName.Text))
            {
                string l_string = "";

                l_string = String_Clean(txtTagName.Text.ToString());

                List<string> stringList = new List<string>(l_string.Split(','));

                foreach (var count in stringList)
                {

                    TagNames = '&' + "tag_names[]" + count.ToString() + TagNames;

                }

            }

            if (!string.IsNullOrEmpty(dwlTagNameMatch.Text) && dwlTagNameMatch.SelectedValue.ToString() != "Select One" && dwlTagNameMatch.Visible == true)
            {
                if (dwlTagNameMatch.SelectedValue.ToString() == "1")

                    TagNameMatch = '&' + "tag_name_match=" + "1";

                else if (dwlTagNameMatch.SelectedValue.ToString() == "2")

                    TagNameMatch = '&' + "tag_name_match=" + "2";

            }

            if (!string.IsNullOrEmpty(dwlStatus.Text) && dwlStatus.SelectedValue.ToString() != "Select One" && dwlStatus.Visible == true)
            {
                if (dwlStatus.SelectedValue.ToString() == "1")

                    Status = '&' + "status=" + "1";

                else if (dwlStatus.SelectedValue.ToString() == "2")

                    Status = '&' + "status=" + "2";

            }

            if (!string.IsNullOrEmpty(dwlUpdateType.Text) && dwlUpdateType.SelectedValue.ToString() != "Select One" )
            {
                if (dwlUpdateType.SelectedValue.ToString() == "last")

                    UpdateType = '&' + "update_type=" + "1";

                else if (dwlUpdateType.SelectedValue.ToString() == "since")

                    UpdateType = '&' + "update_type=" + "2";

            }

            if (!string.IsNullOrEmpty(txtLastUpdateLast.Text)  && txtLastUpdateLast.Visible== true )
            {
                
                LastUpdate = '&' + "last_update=" + txtLastUpdateLast.Text.ToString();
              
            }

            if(!string.IsNullOrEmpty(txtLastUpdateSince.Text) && txtLastUpdateSince.Visible == true)
            {
                LastUpdate = '&' + "last_update=" + txtLastUpdateSince.Text.ToString();
            }

            if (!string.IsNullOrEmpty(txtSearchTerms.Text))
            {
                SearchTerm = '&' + "search_term=" + txtSearchTerms.Text.ToString();
            }

            if (!string.IsNullOrEmpty(dwlSearchMatch.Text) && dwlSearchMatch.Visible == true && dwlSearchMatch.SelectedValue.ToString() != "Select One")
            {
                if (dwlSearchMatch.SelectedValue.ToString() == "1")

                    SearchMatch = '&' + "search_match=" + "1";

                else if (dwlUpdateType.SelectedValue.ToString() == "since")

                    SearchMatch = '&' + "search_match=" + "2";
            }

            if (!string.IsNullOrEmpty(dwlGuideTypes.Text) && dwlGuideTypes.SelectedValue.ToString() != "Select One")
            {
                if (dwlGuideTypes.SelectedValue.ToString() == "1")

                    GuideTypes = '&' + "guid_types=" + "1";

                else if (dwlGuideTypes.SelectedValue.ToString() == "2")

                    GuideTypes = '&' + "guid_types=" + "2";
            }

            if (!string.IsNullOrEmpty(txtMetaData.Text))
            {
                string l_string = "";

                l_string = String_Clean(txtMetaData.Text.ToString());

                
                List<string> stringList = new List<string>(l_string.Split(','));

                foreach (var count in stringList)
                {

                    MetaData = '&' + "metadata[]" + count.ToString() + MetaData;

                }

            }

            if(ckbOwner.Checked == true)
            {
                Expand = '&' + "expand[]" + "owner" + Expand; 

            }

            if (ckbGroup.Checked == true)
            {

                Expand = '&' + "expand[]" + "group" + Expand;
            }

            if (ckbPages.Checked == true)
            {
                Expand = '&' + "expand[]" + "pages" + Expand;

            }

            if (ckbPagesBoxes.Checked == true)
            {

                Expand = '&' + "expand[]" + "pages.boxes" + Expand;
            }


            if (ckbSubjects.Checked == true)
            {

                Expand = '&' + "expand[]" + "sujects" + Expand;
            }

            if (ckbTags.Checked == true)
            {
                Expand = '&' + "expand[]" + "tags" + Expand;

            }

            if (ckbMetaData.Checked == true)
            {

                Expand = '&' + "expand[]" + "meta_data" + Expand;
            }

            if(!string.IsNullOrEmpty(dwlSortBy.Text.ToString()) && dwlSortBy.SelectedValue.ToString() == "relevance" && string.IsNullOrEmpty(txtSearchTerms.Text.ToString()))
            {
                lbError.Visible = true;

                txtSearchTerms.Focus();

                return;
            }


            //lbTest.Text = HttpContext.Current.Request.Url.ToString();

            string address_parameter = DirectedAddress + SiteID + Key+ SortBy + SortDirection + CountList + GroupIDs + SubjectIDs + SubjectLogic + TagNames + TagNameMatch + Status + UpdateType + LastUpdate + SearchTerm +
                                       SearchMatch + GuideTypes + MetaData + Expand;


            string address = "Page2.aspx" + address_parameter;

            Response.Clear();

            Response.Redirect(address);
            
        }
    }
}