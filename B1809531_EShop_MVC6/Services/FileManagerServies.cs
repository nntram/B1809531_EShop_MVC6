﻿using B1809531_EShop_MVC6.Services.Interfaces;

namespace B1809531_EShop_MVC6.Services
{
    public class FileManagerServies : IFileManagerServies
    {
        private IWebHostEnvironment _environment;

        public FileManagerServies(IWebHostEnvironment environment)
        {
            _environment = environment;
        }

        public void DeleteMultipleImages(List<string> listPath)
        {
            throw new NotImplementedException();
        }

        public void DeleteSingleImage(string path)
        {
            var imgdel = Path.Combine(_environment.WebRootPath, path);
            FileInfo fi = new FileInfo(imgdel);
            if (fi.Exists)
            {
                File.Delete(imgdel);
                fi.Delete();
            }

           
        }

        public Task<List<string>> UploadMultipleImages(IEnumerable<IFormFile> postedFiles, string path)
        {
            throw new NotImplementedException();
        }

        public async Task<string> UploadSingleImage(IFormFile postedFile, string path)
        {
            string fileName = "";
            try
            {
                var fullPath = Path.Combine(_environment.WebRootPath, path);
                if (!Directory.Exists(fullPath))
                {
                    Directory.CreateDirectory(fullPath);
                }

                fileName = Guid.NewGuid().ToString() + Path.GetExtension(postedFile.FileName);
                var imagePath = Path.Combine(fullPath, fileName);
                using (FileStream stream = new FileStream(imagePath, FileMode.Create))
                {
                    await postedFile.CopyToAsync(stream);

                }              
            }
            catch (Exception)
            {
                
            }
            return fileName;
        }
    }
}
