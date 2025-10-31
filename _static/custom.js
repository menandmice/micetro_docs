document.addEventListener("DOMContentLoaded", function() {
    const banner = document.createElement("div");
    banner.innerHTML = 'This is a banner message across all pages ! <a href="http://bluecatnetworks.com">Go here</a>';
    banner.style.background = "#ffcc00";
    banner.style.color = "#000";
    banner.style.textAlign = "center";
    banner.style.padding = "10px";
    banner.style.fontWeight = "bold";
    document.body.insertBefore(banner, document.body.firstChild);
});

