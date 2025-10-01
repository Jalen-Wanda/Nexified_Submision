<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="CampusBookMarket.profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Profile</title>
    <link href="Styles/profile.css" rel="stylesheet" />
    <style>body {
    background-color: #f0f8ff;
    font-family: Arial, sans-serif;
    color: #003366;
    margin: 0;
    padding: 0;
}

.profile-container {
    width: 60%;
    margin: 50px auto;
    background-color: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0,0,128, 0.2);
}

h2 {
    color: #005cbf;
    text-align: center;
    margin-bottom: 30px;
}

.profile-box {
    font-size: 18px;
    line-height: 1.8;
}

.status {
    font-weight: bold;
    padding: 5px 10px;
    border-radius: 5px;
    display: inline-block;
}

.status.approved {
    background-color: #d4edda;
    color: #155724;
}

.status.pending {
    background-color: #fff3cd;
    color: #856404;
}

.status.rejected {
    background-color: #f8d7da;
    color: #721c24;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="HomeBtn" runat="server" Text="home" OnClick="HomeBtn_Click" />
        <asp:Button ID="AddProd" runat="server" Text="Add/Sell Product" OnClick="AddProd_Click" />
        <div class="profile-container">
            <h2>Welcome, <asp:Label ID="lblName" runat="server" Text=""></asp:Label>!</h2>
        </div>
    </form>
</body>
</html>&nbsp;<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0"/><title>Student Profile | Campus Essentials Market</title>

  <!-- FontAwesome (for icons) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

  <style>
    :root {
      --primary-color: #0d6efd;
      --secondary-color: #6c757d;
      --success-color: #28a745;
      --danger-color: #dc3545;
      --warning-color: #ffc107;
      --light-bg: #f8f9fa;
      --border-color: #dee2e6;
      --text-dark: #333;
      --text-light: #666;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      margin: 0;
      padding: 20px;
      min-height: 100vh;
      color: var(--text-dark);
    }

    .container {
      max-width: 900px;
      margin: 0 auto;
      background: #ffffff;
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .profile-header {
      background: linear-gradient(135deg, var(--primary-color), #0a58ca);
      color: white;
      padding: 40px 30px;
      text-align: center;
      position: relative;
    }

    .profile-header::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(90deg, #ffd700, #ffed4e, #ffd700);
    }

    .profile-header h2 {
      font-size: 2.5rem;
      font-weight: 300;
      margin: 0 0 10px 0;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 15px;
    }

    .profile-header p {
      font-size: 1.1rem;
      opacity: 0.9;
      margin: 0;
    }

    .profile-content {
      padding: 40px;
    }

    .section-title {
      font-size: 1.5rem;
      font-weight: 600;
      color: var(--primary-color);
      margin-bottom: 25px;
      padding-bottom: 10px;
      border-bottom: 3px solid var(--light-bg);
      position: relative;
    }

    .section-title::after {
      content: '';
      position: absolute;
      bottom: -3px;
      left: 0;
      width: 60px;
      height: 3px;
      background: var(--primary-color);
    }

    .info-grid {
      display: grid;
      grid-template-columns: 1fr;
      gap: 20px;
      margin-bottom: 40px;
    }

    .info-card {
      background: var(--light-bg);
      border-radius: 12px;
      padding: 25px;
      border-left: 4px solid var(--primary-color);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .info-card:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    .info-item {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
    }

    .info-item:last-child {
      margin-bottom: 0;
    }

    .info-icon {
      width: 40px;
      height: 40px;
      background: var(--primary-color);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      margin-right: 15px;
      flex-shrink: 0;
    }

    .info-content {
      flex: 1;
    }

    .info-label {
      font-weight: 600;
      color: var(--text-dark);
      margin-bottom: 5px;
      font-size: 0.9rem;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .info-value {
      font-size: 1.1rem;
      color: var(--text-dark);
      font-weight: 500;
    }

    .status-badge {
      display: inline-flex;
      align-items: center;
      padding: 8px 16px;
      border-radius: 20px;
      font-size: 0.9rem;
      font-weight: 600;
      margin-top: 10px;
    }

    .status-pending {
      background: #fff3cd;
      color: #856404;
      border: 1px solid #ffeaa7;
    }

    .status-approved {
      background: #d1edff;
      color: var(--primary-color);
      border: 1px solid #b3d9ff;
    }

    .status-rejected {
      background: #f8d7da;
      color: var(--danger-color);
      border: 1px solid #f5c6cb;
    }

    .product-section {
      background: var(--light-bg);
      border-radius: 12px;
      padding: 25px;
      margin-top: 30px;
    }

    .product-info {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
    }

    @media (max-width: 768px) {
      body {
        padding: 10px;
      }
      
      .profile-content {
        padding: 20px;
      }
      
      .profile-header {
        padding: 30px 20px;
      }
      
      .profile-header h2 {
        font-size: 2rem;
        flex-direction: column;
        gap: 10px;
      }
      
      .info-item {
        flex-direction: column;
        align-items: flex-start;
      }
      
      .info-icon {
        margin-right: 0;
        margin-bottom: 10px;
      }
      
      .product-info {
        grid-template-columns: 1fr;
      }
    }

    /* Animation for page load */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .container {
      animation: fadeInUp 0.6s ease-out;
    }
  </style>
</head>
<body>

  <div class="container">
    <div class="profile-header">
      <h2>
        <i class="fas fa-user-graduate"></i>
        Student Profile
      </h2>
      <p>Welcome to your Campus Essentials Market dashboard</p>
    </div>

    <div class="profile-content">
      <!-- Personal Information Section -->
      <div class="section-title">Personal Information</div>
      <div class="info-grid">
        <div class="info-card">
          <div class="info-item">
            <div class="info-icon">
              <i class="fas fa-user"></i>
            </div>
            <div class="info-content">
              <div class="info-label">Full Name</div>
              <asp:Label ID="Namelbl" class="info-value" runat="server" Text=""></asp:Label>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon">
              <i class="fas fa-envelope"></i>
            </div>
            <div class="info-content">
              <div class="info-label">Email Address</div>
              <asp:Label ID="Emaillbl" class="info-value" runat="server" Text=""></asp:Label>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon">
              <i class="fas fa-lock"></i>
            </div>
            <div class="info-content">
              <div class="info-label">Password</div>
              <asp:Label ID="Passwordlbl" class="info-value" runat="server" Text=""></asp:Label>
            </div>
          </div>
        </div>
      </div>

      <!-- Product Information Section -->
      <div class="section-title">Products Information</div>
      <asp:Repeater ID="rptProducts" runat="server">
        <ItemTemplate>
            <div class="info-card">
                <div class="info-item">
                    <div class="info-icon">
                        <i class="fas fa-cube"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Product Name</div>
                        <div class="info-value"><%# Eval("name") %></div>
                    </div>
                </div>
                <div class="info-item">
                    <div class="info-icon">
                        <i class="fas fa-tasks"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Approval Status</div>
                        <div class="info-value"><%# Eval("ApprovalStatus") %></div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

      <!-- Additional space for future content -->
      <div style="height: 40px;"></div>
    </div>
  </div>

  <script>
    // Simple animation for status badges
    document.addEventListener('DOMContentLoaded', function() {
      const statusBadge = document.querySelector('.status-badge');
      if (statusBadge) {
        setTimeout(() => {
          statusBadge.style.transform = 'scale(1.05)';
          setTimeout(() => {
            statusBadge.style.transform = 'scale(1)';
          }, 300);
        }, 1000);
      }
    });
  </script>

</body>
</html>


