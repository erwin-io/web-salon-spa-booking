﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSalonSpa.Models
{
    public class JsonData<T>
    {
        public bool Success { get; set; }
        public T Data { get; set; }
        public string Message { get; set; }
    }
}