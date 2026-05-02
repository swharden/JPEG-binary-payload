$data = [IO.File]::ReadAllBytes("image_with_payload.jpg")

# find last FF D9 (end of JPEG)
for ($i = $data.Length - 2; $i -ge 0; $i--) {
    if ($data[$i] -eq 0xFF -and $data[$i + 1] -eq 0xD9) {
        $start = $i + 2
        break
    }
}

# write everything after it
[IO.File]::WriteAllBytes("extracted_payload.bin", $data[$start..($data.Length - 1)])