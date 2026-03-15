#!/bin/bash
# Simulates realistic caliber onboard output for demo recording.
# Compact version — fits in one screen without scrolling.

clear
sleep 0.1

BRAND='\033[1;38;2;235;157;131m'  # #EB9D83 bold
TITLE='\033[1;38;2;131;209;235m'  # #83D1EB bold
DIM='\033[2m'
GREEN='\033[32m'
GREENB='\033[1;32m'
RESET='\033[0m'

# Simulate typing the command
CMD="npx @rely-ai/caliber onboard"
printf "$ "
for (( i=0; i<${#CMD}; i++ )); do
  printf '%s' "${CMD:$i:1}"
  sleep 0.04
done
sleep 0.4
printf "\n"
sleep 0.3

# ASCII logo
printf "${BRAND}
   ██████╗ █████╗ ██╗     ██╗██████╗ ███████╗██████╗
  ██╔════╝██╔══██╗██║     ██║██╔══██╗██╔════╝██╔══██╗
  ██║     ███████║██║     ██║██████╔╝█████╗  ██████╔╝
  ██║     ██╔══██║██║     ██║██╔══██╗██╔══╝  ██╔══██╗
  ╚██████╗██║  ██║███████╗██║██████╔╝███████╗██║  ██║
   ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
${RESET}"
sleep 0.3

printf "${DIM}  Provider: anthropic | Model: claude-sonnet-4-6${RESET}\n\n"
sleep 0.2

printf "${GREEN}✔${RESET} Project analyzed ${DIM}— TypeScript, Go — 247 files${RESET}\n"
sleep 0.3

printf "${GREEN}✔${RESET} Setup generated ${DIM}(18.4s)${RESET}\n\n"
sleep 0.3

printf "  ${GREEN}+${RESET} CLAUDE.md                          ${DIM}project context for Claude Code${RESET}\n"
printf "  ${GREEN}+${RESET} .cursor/rules/project.mdc          ${DIM}Cursor rules with frontmatter${RESET}\n"
printf "  ${GREEN}+${RESET} AGENTS.md                          ${DIM}project context for Codex${RESET}\n"
printf "  ${GREEN}+${RESET} .claude/skills/testing/SKILL.md     ${DIM}TDD workflow skill${RESET}\n"
printf "  ${GREEN}+${RESET} .claude/skills/deploy/SKILL.md      ${DIM}deployment skill${RESET}\n\n"
sleep 0.4

printf "${GREEN}✔${RESET} Changes applied ${DIM}— backups in .caliber/backups/${RESET}\n\n"
sleep 0.3

printf "  ${GREENB}Config Score: 87/100 (A) ✨${RESET}  ${DIM}(+45 from 42)${RESET}\n\n"
printf "  FILES & SETUP     22/25   ${GREEN}████████████████████${DIM}░░${RESET}\n"
printf "  QUALITY           21/25   ${GREEN}████████████████████${DIM}░░${RESET}\n"
printf "  COVERAGE          18/20   ${GREEN}██████████████████${DIM}░░░░${RESET}\n"
printf "  ACCURACY          13/15   ${GREEN}█████████████████${DIM}░░░░░${RESET}\n"
printf "  FRESHNESS          8/10   ${GREEN}████████████████${DIM}░░░░░░${RESET}\n"
printf "  BONUS              5/5    ${GREEN}██████████████████████${RESET}\n\n"
sleep 0.4

printf "${GREEN}✔${RESET} Hooks installed ${DIM}(auto-refresh on commit + session end)${RESET}\n"
printf "${GREEN}✔${RESET} 3 MCP servers installed ${DIM}(Supabase, Stripe, GitHub)${RESET}\n"
printf "${GREEN}✔${RESET} 2 skills installed ${DIM}(testing, deploy)${RESET}\n\n"

printf "${DIM}  Your project is ready for agentic development.${RESET}\n"
sleep 3
