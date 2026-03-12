import { describe, it, expect, vi, beforeEach, afterEach } from 'vitest';
import { detectFrameworks } from '../detect.js';

const mockLlmJsonCall = vi.fn();

vi.mock('../../llm/index.js', () => ({
  llmJsonCall: (...args: unknown[]) => mockLlmJsonCall(...args),
}));

describe('detectFrameworks', () => {
  beforeEach(() => {
    vi.clearAllMocks();
    mockLlmJsonCall.mockResolvedValue({ languages: ['TypeScript'], frameworks: ['Express'] });
  });

  it('returns languages and frameworks from LLM', async () => {
    const result = await detectFrameworks(['src/index.ts'], {});
    expect(result.languages).toEqual(['TypeScript']);
    expect(result.frameworks).toEqual(['Express']);
  });

  it('passes ANTHROPIC_SMALL_FAST_MODEL as model override when set', async () => {
    const orig = process.env.ANTHROPIC_SMALL_FAST_MODEL;
    process.env.ANTHROPIC_SMALL_FAST_MODEL = 'claude-haiku-4-5';

    await detectFrameworks(['src/index.ts'], {});

    const callArgs = mockLlmJsonCall.mock.calls[0][0];
    expect(callArgs.model).toBe('claude-haiku-4-5');

    process.env.ANTHROPIC_SMALL_FAST_MODEL = orig;
  });

  it('does not pass model override when ANTHROPIC_SMALL_FAST_MODEL is not set', async () => {
    const orig = process.env.ANTHROPIC_SMALL_FAST_MODEL;
    delete process.env.ANTHROPIC_SMALL_FAST_MODEL;

    await detectFrameworks(['src/index.ts'], {});

    const callArgs = mockLlmJsonCall.mock.calls[0][0];
    expect(callArgs.model).toBeUndefined();

    if (orig) process.env.ANTHROPIC_SMALL_FAST_MODEL = orig;
  });

  it('returns empty arrays when LLM returns non-arrays', async () => {
    mockLlmJsonCall.mockResolvedValue({ languages: 'not-array', frameworks: null });
    const result = await detectFrameworks(['file.ts'], {});
    expect(result.languages).toEqual([]);
    expect(result.frameworks).toEqual([]);
  });
});
