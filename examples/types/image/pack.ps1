[IO.File]::WriteAllBytes(
    "image_with_payload.jpg",
    [IO.File]::ReadAllBytes("sample-data\wave.jpg") +
    [IO.File]::ReadAllBytes("sample-data\wonka.jpg")
)