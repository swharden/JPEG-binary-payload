$data = [IO.File]::ReadAllBytes("image_with_payload.jpg")

# find first FF D9 (end of the carrier JPEG)
for ($i = 0; $i -lt $data.Length - 1; $i++) {
    if ($data[$i] -eq 0xFF -and $data[$i + 1] -eq 0xD9) {
        $start = $i + 2
        break
    }
}

[IO.File]::WriteAllBytes("extracted_payload.jpg", $data[$start..($data.Length - 1)])