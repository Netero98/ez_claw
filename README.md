# Zero configuration light alternative to OpenClaw via Claude CLI for developers

## How to setup ?
1. Run  via docker with --privileged flag.
2. Add your API provider envs like you usually do for containers deploy. Also add all envs you need for Claude to be helpful agent:
   ```
     OPENAI_BASE_URL=https://llm.chutes.ai/v1
     OPENAI_API_KEY=your_token
     ANTHROPIC_DEFAULT_SONNET_MODEL=Qwen/Qwen3-Coder-Next-TEE
     ANTHROPIC_DEFAULT_HAIKU_MODEL=Qwen/Qwen3-Coder-Next-TEE
     ANTHROPIC_BASE_URL=http://localhost # internal proxy to use custom API provider, don't change !
     ANTHROPIC_AUTH_TOKEN=your_token
   ```
4. Use docker exec to use standard Claude CLI as always
5. Write your prompts in cli as usual. Or save them as docker volume to reuse. Thats what they name as "skills"
6. Inside container: 
```
su claudeuser -c 'claude --dangerously-skip-permissions'
or
su claudeuser -c 'claude --dangerously-skip-permissions --print "..."'
```

## Why this is cool?
1. Zero configuration for you - just add your API provider envs and use Claude code with any provider, not only Anthropic
2. The one cool thing about OpenClaw - agentic loop, but there are too much things for me to configure. I just need single prompt to do everything. Claude does it.
3. OpenClaw is a big black box. This project is a single Dockerfile, ez to check and use confidently
