offset=$(grep -abo $'\xff\xd9' image_with_payload.jpg | tail -n1 | cut -d: -f1)
tail -c +$((offset + 3)) image_with_payload.jpg > extracted_payload.bin