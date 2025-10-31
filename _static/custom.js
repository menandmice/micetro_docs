document.addEventListener("DOMContentLoaded", function() {
    const banner = document.createElement("div");
    banner.innerHTML = 'The latest documentation for Micetro is now available on the <a href="https://docs.bluecatnetworks.com/">BlueCat Documentation Portal</a>, where you can access the entire catalog of BlueCat product documentation. This documentation site will not be actively maintained. Please update any relevant bookmarks to point to the documentation available on the BlueCat Documentation Portal.';
    banner.style.position = "relative";
    banner.style.background = "#ffcc00";
    banner.style.color = "#000";
    banner.style.left = "300px"
    banner.style.textAlign = "center";
    banner.style.padding = "20px";
    banner.style.width = "80%"
    banner.style.fontWeight = "bold";
    document.body.insertBefore(banner, document.body.firstChild);
});
