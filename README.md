# Zero configuration alternative to OpenClaw via Claude CLI for developers

## How to setup ?
1. Run  via docker with --privileged flag.
2. Add your API provider envs:
   ```
     OPENAI_BASE_URL=https://llm.chutes.ai/v1
     OPENAI_API_KEY=your_token
     ANTHROPIC_DEFAULT_SONNET_MODEL=Qwen/Qwen3-Coder-Next-TEE
     ANTHROPIC_DEFAULT_HAIKU_MODEL=Qwen/Qwen3-Coder-Next-TEE
     ANTHROPIC_BASE_URL=http://localhost
   ```
3. Use docker exec to use standart Claude CLI as always
4. Thats it
