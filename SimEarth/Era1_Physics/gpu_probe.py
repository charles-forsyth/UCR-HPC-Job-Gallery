import torch

print("Checking CUDA availability...")
if torch.cuda.is_available():
    print("CUDA Available: True")
    print(f"Device Count: {torch.cuda.device_count()}")
    print(f"Current Device: {torch.cuda.current_device()}")
    print(f"Device Name: {torch.cuda.get_device_name(0)}")
else:
    print("CUDA Available: False")
