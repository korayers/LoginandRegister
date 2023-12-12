using System;
using System.Data;
using System.Data.SqlClient;

namespace Login
{
    public partial class Login : System.Web.UI.Page
    {
        // Sayfa yüklendiğinde gerçekleşen olaylar
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Kullanıcı adı textbox'ındaki metin değiştiğinde gerçekleşen olay
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        // Login butonuna tıklandığında gerçekleşen olay
        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            // SqlConnection sınıfından bir nesne oluşturur
            SqlConnection con = new SqlConnection("Server=DESKTOP-DIDNVPT\\KORAY;Database=CMS;Trusted_Connection=True");

            // SqlCommand sınıfından bir nesne oluşturulur, SQL sorgusunu ve bağlantı nesnesini parametre olarak alır.
            // Bu sorgu "Users" tablosunda kullanıcı adı ve şifre alanlarına göre eşleşmeleri arar.
            SqlCommand cmd = new SqlCommand("Select * from Users where username=@username and password=@password", con);

            // SQL sorgusundaki parametreler, kullanıcı tarafından alınan kullanıcı adı ve şifre değerleri ile doldurulur.
            cmd.Parameters.AddWithValue("@username", TxtUsername.Text);
            cmd.Parameters.AddWithValue("@password", TxtPassword.Text);

            // SqlDataAdapter sınıfından bir nesne oluşturulur ve bu nesne "SqlCommand" nesnesi ve bağlantı nesnesi parametre olarak alınır.
            // Bu adapter, databaseden gelen verileri "DataSet" nesnesine doldurmak için kullanılır.
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet(); // DataSet sınıfından bir nesne oluşturulur, bu nesne veritabanından alınan verileri tutmak için kullanılır.

            try
            {
                con.Open(); // SqlConnection nesnesi ile veritabanına bağlantıyı açar.
                da.Fill(ds, "Users"); // "Users" tablosunu içeren DataSet'i doldurur.
            }
            catch (Exception ex)
            {
                // Bir hata durumunda, exception hata mesajını ekrana yazdırır.
                Response.Write("Error: " + ex.Message);
                return;
            }
            finally
            {
                con.Close(); // Her durumda try-catch bloklarının sonunda veritabanı bağlantısını kapatır.
            }

            // Eğer satır sayısı 0'a eşitse, girilen bilginin geçersiz olduğunu gösterir.
            if (ds.Tables["Users"].Rows.Count == 0)
            {
                Response.Write("Invalid username or password");
            }
            // Satır sayısı 0 değilse bilgiler doğru demektir ve "Users" tablosundaki bilgilerle eşleşirse kullanıcıyı "Dashboard.aspx" sayfasına yönlendirir.
            else
            {
                Response.Redirect("Dashboard.aspx");
            }
        }

        // Register butonuna tıklandığında gerçekleşen olay
        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            // Register butonu tıklandığında yapılacak işlemler // SqlConnection sınıfından bir nesne oluşturur
            SqlConnection con = new SqlConnection("Server=DESKTOP-DIDNVPT\\KORAY;Database=CMS;Trusted_Connection=True");

            // SqlCommand sınıfından bir nesne oluşturulur, SQL sorgusunu ve bağlantı nesnesini parametre olarak alır.
            // Bu sorgu "Users" tablosuna kullanıcı adı ve şifre alanlarına göre ekleme yapar
            string str = "Insert  into Users (username,password) VALUES ('" + TxtUsername.Text + "','" + TxtPassword.Text + "')";
            SqlCommand cmd = new SqlCommand(str, con);

            // SQL sorgusundaki parametreler, kullanıcı tarafından alınan kullanıcı adı ve şifre değerleri ile doldurulur.
            cmd.Parameters.AddWithValue("@username", TxtUsername.Text);
            cmd.Parameters.AddWithValue("@password", TxtPassword.Text);

            // SqlDataAdapter sınıfından bir nesne oluşturulur ve bu nesne "SqlCommand" nesnesi ve bağlantı nesnesi parametre olarak alınır.
            // Bu adapter, databaseden gelen verileri "DataSet" nesnesine doldurmak için kullanılır.
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet(); // DataSet sınıfından bir nesne oluşturulur, bu nesne veritabanından alınan verileri tutmak için kullanılır.

            try
            {
                con.Open(); // SqlConnection nesnesi ile veritabanına bağlantıyı açar.
                da.Fill(ds, "Users"); // "Users" tablosunu içeren DataSet'i doldurur.
            }
            catch (Exception ex)
            {
                // Bir hata durumunda, exception hata mesajını ekrana yazdırır.
                Response.Write("Error: " + ex.Message);
                return;
            }
            finally
            {
                con.Close(); // Her durumda try-catch bloklarının sonunda veritabanı bağlantısını kapatır.
            }

        }

    }
}
