using B1809531_EShop_MVC6.Services.Interfaces;

namespace B1809531_EShop_MVC6.Services
{
    public class FileManagerServies : IFileManagerServies
    {
        private IWebHostEnvironment _environment;

        public FileManagerServies(IWebHostEnvironment environment)
        {
            _environment = environment;
        }

        public bool UploadMultipleImages(IEnumerable<IFormFile> postedFiles, string path)
        {
            throw new NotImplementedException();
        }

        public bool UploadSingleImage(IFormFile postedFile, string path)
        {
            try
            {
                var fullPath = Path.Combine(_environment.WebRootPath, path);
                if (!Directory.Exists(fullPath))
                {
                    Directory.CreateDirectory(fullPath);
                }

                string fileName = Path.GetFileName(postedFile.FileName);
                var imagePath = Path.Combine(fullPath, fileName);
                using (FileStream stream = new FileStream(imagePath, FileMode.Create))
                {
                    postedFile.CopyTo(stream);

                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
            
        }
    }
}
