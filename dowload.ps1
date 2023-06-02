$url = "https://download853.mediafire.com/u78qn676jnygzZHEDH91booOEW2XT40QB0335XhiF5NjUwAPKf5xUuiJNSQOCidRdVT72BouijVIhs9gl0yduPG5pvWLOGXu6w2iLNcJtkhoF3cR8BpQwE6JcHuk6kNgRxKiVQEJkE6LsSqxh1U0unsd6RSgBbChZCOtNI-_cA/ywf6fmm4beal6t6/trex.exe"
$output = "c:\trex.exe"

Invoke-WebRequest -Uri $url -OutFile $output
