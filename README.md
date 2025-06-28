![image](https://github.com/user-attachments/assets/b250779f-8b1b-44cb-b831-59a3c7526d55)

# 🧠 What is Gensyn?

Gensyn is a decentralized platform and network designed to run and train machine learning (ML) models efficiently across the globe using distributed computing.


## 🔐 The technology behind Gensyn:
- A blockchain-style ledger for transparency and trust.
- Hivemind for distributed training coordination.
- OpenTelemetry to monitor node performance.
- Docker and FastAPI for node and API management.


## Hardware Requirements
| GPU-based         

|vRAM   | CPU  | DISK  |
|:-:|:-:|:-:|
| 12GB  | 6 + | 50 +  |


* I'm currently using [QuickPod](https://console.quickpod.io?affiliate=e6f6f62c-11bf-4673-84ff-61589a665d15) to rent GPU. You can choose between under official spec from Gensyn like RTX A2000, RTX 4060, dst.

### Rent QuickPod GPUs
- Visit [QuickPod](https://console.quickpod.io?affiliate=e6f6f62c-11bf-4673-84ff-61589a665d15)
- Signup and verify your email in inbox
- Deposit crytocurrency by clicking on Add in the top right
- Click on Templates and then find Cuda 12.4
- It redirects you to Search Console section to select your GPU nd click on Create Pod
- Recommended: Filter 4090/3090 GPUs and Sort by cheapest price to find the most affordable 3090/4090s
- You can even rent lower-end GPUs for cheaper price (12GB vRAM supported by Gensyn)
- Go to Pods section and wait until your GPU be deployed
- Click on Connect and choose one of two options below:
- 1- Connect to web: To redirect you to a web based terminal of your GPU
- 2- SSH Command: Copy the SSH command and Execute it in a terminal in your system (e.g. Windows Powershell, Mobaxterm, Termius)


## Installation Steps
### Step 1: Install Dependecies
```bash
wget https://github.com/xxin-han/Gensyn-GPU/raw/main/Gensyn-GPU.sh -O Gensyn-GPU.sh && chmod +x Gensyn-GPU.sh && ./Gensyn-GPU.sh
```

### Step 2: Clone the Repository
```bash
git clone https://github.com/gensyn-ai/rl-swarm/
```

### Step 3: Run the swarm

- Open a screen to run it in background
```bash
screen -S swarm
```
- Get into the rl-swarm directory
```bash
cd rl-swarm
```
- Create environment
```bash
python3 -m venv .venv
source .venv/bin/activate
```

- Install swarm
```bash
./run_rl_swarm.sh
```

### Step 4: Login

1. **Wait for initialization:**

   Make sure you see the following message in the terminal log:

   ```
   Waiting for userData.json to be created...
   ```

2. **Open the login page in your browser:**

   - Open a new terminal window or screen
   - Install **localtunnel**:

     ```bash
     npm install -g localtunnel
     ```

   - Get your password (based on your GPU IP):

     ```bash
     curl https://loca.lt/mytunnelpassword
     ```

   - Generate your tunnel URL:

     ```bash
     lt --port 3000
     ```

   - Visit the displayed URL and enter your password to access the Gensyn login page.

3. **Follow the prompts** to complete the login process.


- Would you like to push models you train in the RL swarm to the Hugging Face Hub? [y/N] >>> Press N to join testnet

- Enter the name of the model you want to use in huggingface repo/name format, or press [Enter] to use the default model. >>> For default model, press Enter or choose one of these (More model parameters (B) need more vRAM):
    - Gensyn/Qwen2.5-0.5B-Instruct
    - Qwen/Qwen3-0.6B
    - nvidia/AceInstruct-1.5B
    - dnotitia/Smoothie-Qwen3-1.7B
    - Gensyn/Qwen2.5-1.5B-Instruct

## Done



## Backup/Import swarm.pem

Using WinSCP (Easiest graphical method)

1. Download and install [WinSCP](https://winscp.net/eng/index.php)  on your Windows computer.

2. Open WinSCP and fill in the connection details:
    - File protocol: SFTP
    - Host name: Your VPS IP address (e.g., 123.456.78.90)
    - User name: Your VPS username (usually root)
    - Password: Your VPS password, or
    - Private key file: If you log in using a key (.pem or .ppk), select your private key file here.

3. Click Login.

3. Once connected, you'll see your VPS file system on the right, and your local Windows folders on the left.

4. Navigate to the directory that contains the file:
/root/gensyn-1/rl-swarm/

5. Locate the file swarm.pem.

6. Drag and drop swarm.pem from the VPS (right panel) to a folder on your Windows PC (left panel), such as your Desktop or Downloads, to back it up.

## Node Health

1. Official Dashboards
https://dashboard.gensyn.ai/

![image](https://github.com/user-attachments/assets/0af0d598-a9f0-427b-a48c-6a5e09cccd94)


2. Telegram Bot
- Search you ```Node-ID``` here with /check here: https://t.me/gensyntrackbot

![image](https://github.com/user-attachments/assets/930368b9-ddcc-41d3-a186-37f82ed4c509)


- If receiving ```EVM Wallet: 0x0000000000000000000000000000000000000000``` for long time is mean your onchain-participation is not being tracked and you have to Install with New Email and Back to Step 2: Clone Repository 


## Useful Commands

```bash
# Return screen
screen -r name your screen

# Minimize screen
Press: CTRL + A + D

# Screens list
screen -ls

# Stop Node (when inside a screen)
Press: Ctrl + C


