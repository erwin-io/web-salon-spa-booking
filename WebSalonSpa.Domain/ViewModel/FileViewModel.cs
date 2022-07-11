﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebSalonSpa.Domain.ViewModel
{
    public class FileViewModel
    {
        public string FileId { get; set; }
        public string FileName { get; set; }
        public string MimeType { get; set; }
        public long FileSize { get; set; }
        public byte[] FileContent { get; set; }
        public bool IsFromStorage { get; set; }
    }
}
