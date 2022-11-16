namespace B1809531_EShop_MVC6.Services.Interfaces
{
    public interface IFileManagerServies
    {
        public bool UploadMultipleImages(IEnumerable<IFormFile> postedFiles, string path);
        public bool UploadSingleImage(IFormFile postedFile, string path);
    }
}
