
#!/bin/bash
set -eux

# 1. Install Apache
dnf install -y httpd

# 2. Create Apache website directory
mkdir -p /var/www/html

# 3. Create HTML file
cat > /var/www/html/index.html <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Straw Hat Pirates | Grand Line</title>
  <style>
    * { box-sizing: border-box; }
    html { scroll-behavior: smooth; }
    body {
      margin: 0;
      min-height: 100vh;
      font-family: Arial, sans-serif;
      background: radial-gradient(circle at 75% 35%, #17404b, #07131d 60%);
      color: #f3f7f8;
      overflow-x: hidden;
    }
    nav {
      padding: 25px 8%;
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 1px solid #ffffff20;
    }
    .logo { color: #ff9b54; font-weight: bold; letter-spacing: 3px; }
    nav a { color: #55e6dc; text-decoration: none; }
    main {
      min-height: 78vh;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 30px;
      padding: 60px 8%;
    }
    .content { max-width: 600px; animation: enter 1s ease both; }
    .tag { color: #55e6dc; letter-spacing: 4px; font-size: 12px; }
    h1 {
      font-size: clamp(48px, 8vw, 100px);
      line-height: 1;
      margin: 25px 0;
    }
    h1 span { color: #ff9b54; }
    p { color: #a9bdc7; line-height: 1.9; }
    .button {
      display: inline-block;
      margin-top: 20px;
      padding: 15px 22px;
      background: #55e6dc;
      color: #07131d;
      font-weight: bold;
      text-decoration: none;
      transition: transform .3s, box-shadow .3s;
    }
    .button:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 30px #55e6dc50;
    }
    .art {
      font-size: clamp(130px, 25vw, 280px);
      animation: float 4s ease-in-out infinite;
      filter: drop-shadow(0 20px 35px #ff9b5450);
    }
    .bounty {
      display: inline-block;
      margin-top: 30px;
      padding: 15px 20px;
      border: 1px solid #ffffff25;
      background: #ffffff08;
    }
    .bounty strong { color: #ff9b54; }
    footer {
      text-align: center;
      padding: 25px;
      color: #78909c;
      border-top: 1px solid #ffffff15;
      font-size: 12px;
    }
    .stars {
      position: fixed;
      inset: 0;
      pointer-events: none;
      z-index: -1;
      background-image: radial-gradient(#ffffff80 1px, transparent 1px);
      background-size: 55px 55px;
      opacity: .2;
      animation: drift 25s linear infinite;
    }
    @keyframes float {
      0%, 100% { transform: translateY(0) rotate(-5deg); }
      50% { transform: translateY(-22px) rotate(5deg); }
    }
    @keyframes enter {
      from { opacity: 0; transform: translateY(35px); }
      to { opacity: 1; transform: translateY(0); }
    }
    @keyframes drift {
      from { background-position: 0 0; }
      to { background-position: 200px 200px; }
    }
    @media (max-width: 700px) {
      main { flex-direction: column; text-align: center; padding-top: 55px; }
      .art { font-size: 150px; }
      nav { padding: 20px 5%; }
    }
    @media (prefers-reduced-motion: reduce) {
      *, *::before, *::after {
        animation-duration: .01ms !important;
        scroll-behavior: auto !important;
      }
    }
  </style>
</head>
<body>
  <div class="stars"></div>
  <nav>
    <div class="logo">☠ GRAND LINE</div>
    <a href="#adventure">SET SAIL ↗</a>
  </nav>

  <main>
    <section class="content">
      <div class="tag">THE FUTURE PIRATE KING</div>
      <h1>MONKEY D.<br><span>LUFFY</span></h1>
      <p>
        "I'm gonna be King of the Pirates!" A fearless dreamer,
        an unbreakable spirit, and a captain who never gives up.
        The Grand Line awaits. Are you ready for the adventure?
      </p>
      <a class="button" href="#adventure">EXPLORE THE GRAND LINE ↗</a>
      <div class="bounty">
        WANTED BOUNTY<br><strong>฿ 3,000,000,000</strong>
      </div>
    </section>

    <div class="art" aria-label="Pirate flag">🏴‍☠️</div>
  </main>

  <footer id="adventure">
    THE OCEAN IS OUR DESTINY · THE ADVENTURE NEVER ENDS
  </footer>

  <script>
    document.querySelectorAll('a[href^="#"]').forEach(link => {
      link.addEventListener('click', event => {
        const target = document.querySelector(link.getAttribute('href'));
        if (target) {
          event.preventDefault();
          target.scrollIntoView({ behavior: 'smooth' });
        }
      });
    });
  </script>
</body>
</html>
HTML

# 4. Start Apache and enable it at boot
systemctl enable --now httpd

