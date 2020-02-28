"Searching for python"

try{
$py_version = python -V
"python found = {0}" -f $py_version
}
catch {
    "python not found"
    $confirmation = Read-Host -Prompt "type yes to install it else no"
    if ($confirmation -eq "yes"){
        "downloading python 3.8"
        $url = "https://www.python.org/ftp/python/3.8.1/python-3.8.1.exe"
        $output = "python.exe"
        $start = Get-Date
        try {
        (New-Object System.Net.WebClient).DownloadFile($url , $output)
        "time-taken: {0} second(s)" -f $((Get-Date).Subtract($start).Seconds)
        }
        catch [System.Net.WebException],[System.IO.IOException]{
            "unable to download the file, check internet"
            exit
        }
        catch {
            "unknown error"
            exit
        }
        $install_confirm = Read-Host -Prompt "Do you want to install it now? (yes/no)"
        if($install_confirm -eq "yes"){
            & $output
            exit
        }
        else{
            exit
        }
    }
    else{
        "sucessfully terminated."
        exit
    }

}

"starting downloads"
try{
    $script_url = "https://github.com/sunx2/py_server/archive/master.zip"
    $script_output = "main.zip"
    try{
        $client = New-Object System.Net.WebClient 
        $client.DownloadFile($requires_url , $requires_output)
        "downloaded requirements"
        $client.DownloadFile($script_url,$script_output)
        "downloaded scripts"
    }
    catch [System.Net.WebException],[System.IO.IOException]{
        "unable to download the file, check internet"
    }
    catch {
        "unknown error"
    }
    mkdir main
    Expand-Archive -LiteralPath "main.zip" -DestinationPath "main"
    cd main
    pip install -r requirements.py

}
catch{
    "error occured"
}