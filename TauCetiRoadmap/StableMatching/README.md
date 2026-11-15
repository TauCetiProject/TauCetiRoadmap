# Roadmap: stable matching

**Summary.** This roadmap builds the marriage model of two-sided matching on finite sets of men
and women with strict preferences, given by injective rank functions in which `none` stands for
staying single, together with the men-proposing deferred acceptance algorithm. Its end theorems
are: deferred acceptance returns a stable matching, so every market has one (Gale–Shapley, 1.1
and 1.2); it is the men-optimal stable matching (1.3); the stable matchings form a lattice under
the men's common order (Conway, 2.1); the same agents are single at every stable matching
(McVitie–Wilson, 2.2); no individually rational matching makes every man strictly better off than
deferred acceptance (Roth, 2.3); with at least two men and two women, no stable mechanism makes
truth-telling dominant for every agent (Roth, 3.1); and truth-telling is a dominant strategy for
the men under deferred acceptance (Dubins–Freedman, Roth, 3.2).

## Scope and ownership

Owned here: marriage markets and stability (0.1), changes of stated preferences (0.2), the deferred
acceptance algorithm (1.1) and every theorem of Layers 1–3. Matchings are Mathlib's partial
equivalences. No roadmap on `main` defines stable matchings, and nothing is taken from another
roadmap.

Not in this roadmap: weak preferences, which the injectivity of the rank functions excludes; and
the many-to-one college admissions model, matching with contracts and the roommates problem, which
are recorded in the Research context.

## Conventions

- **Ranks.** A market gives each man an injective map `rankM m : Option W → ℕ`, and each woman
  `rankW w : Option M → ℕ`; a smaller rank is better, `none` is staying single, and a partner
  ranked after `none` is unacceptable. Witness: with `rankM m (some w₁) = 0`,
  `rankM m none = 1`, `rankM m (some w₂) = 2`, man `m` accepts `w₁` only.
- **Men propose.** Deferred acceptance is run with the men proposing, so its outcome is the
  men-optimal stable matching; the women-proposing algorithm is the algorithm of the role swap
  (0.1, 1.1).
  Witness: in the 2 × 2 market of 0.1's first Check, men proposing gives `(m₁, w₁), (m₂, w₂)` and
  women proposing gives `(m₁, w₂), (m₂, w₁)`.
- **Matchings.** A matching is a Mathlib partial equivalence `μ : M ≃. W`: `μ m` is the partner
  of `m` and `μ.symm w` that of `w` (`PEquiv.eq_some_iff`). Mathlib's order on `M ≃. W` is
  extension, not the men's order. Witness: the empty matching is `⊥` (`PEquiv.bot_apply`).
- **Unequal sides.** Roth 1982 states its results for equal numbers of men and women with
  everyone matched, and reaches the general model through dummy agents (§2, p. 619).

## Exact supplier contracts

### From Mathlib

- `PEquiv` (`Mathlib/Basic/PEquiv.lean`), the partial equivalences `M ≃. W`, with
  `PEquiv.symm`, `PEquiv.eq_some_iff` and `PEquiv.bot_apply`.
- `Finset.univ`, `Finset.filter`, `Finset.toList`, `List.argmin`, `Fintype.card`,
  `Function.update`, `Function.iterate`.

### From Tau Ceti

Nothing is consumed from Tau Ceti.

Nothing is consumed from another roadmap.

## How to read the build

Layer 0 defines markets, matchings, stability and the change of one agent's stated preferences.
Layer 1 defines deferred acceptance and proves that it terminates within `|M| · |W| + 1` rounds,
returns a stable matching and is men-optimal. Layer 2 studies the set of stable matchings: its
lattice structure, the set of single agents, and weak Pareto optimality. Layer 3 proves the two
incentive theorems. Each layer uses the earlier ones only.

## Layer 0: markets and matchings

### 0.1 Markets, matchings and stability

Define `Market M W` (`rankM`, `rankW`, injective), and `IsIndividuallyRational`, `Blocks` and
`IsStable` for a matching `μ : M ≃. W` (Roth 2008, §1, the marriage model). Prove that a stable
matching is Pareto efficient: no matching makes every agent at least as well off and some agent
strictly better off (Roth 2008, §1: a stable matching is efficient), and that stability is
unchanged when every rank function is composed with a strictly monotone map of `ℕ`. Define the
role swap of a market, the market on `W` and `M` whose men's ranks are `rankW` and whose women's
ranks are `rankM`, and prove that `μ` is stable for a market exactly when `μ.symm` is stable for
its role swap.

*Needs:* Mathlib `Function.Injective`, `PEquiv`, `PEquiv.symm`.

**Checks.**

- In the 2 × 2 market `m₁: w₁ > w₂`, `m₂: w₂ > w₁`, `w₁: m₂ > m₁`, `w₂: m₁ > m₂` (everyone
  acceptable), exactly two of the seven matchings are stable: `(m₁, w₁), (m₂, w₂)` and
  `(m₁, w₂), (m₂, w₁)` (Roth 2008, after Theorem 6). This excludes a definition that forgets one
  of the two inequalities of `Blocks`, which would leave only one of them stable.
- With one man and one woman, the man accepting her and the woman not accepting him, the only
  stable matching leaves both single: matching them is not individually rational. This excludes
  dropping `IsIndividuallyRational`.
- Swapping two values of an injective rank function is again a market, while, when `W` is
  nonempty, a constant rank function is not: ties are excluded, as Theorems 2 and 3 of Roth 2008
  require.
- The role swap of the 2 × 2 market above has men `w₁: m₂ > m₁`, `w₂: m₁ > m₂` and women
  `m₁: w₁ > w₂`, `m₂: w₂ > w₁`; its stable matchings are `(w₁, m₁), (w₂, m₂)` and
  `(w₁, m₂), (w₂, m₁)`, the inverses of the two above. Deferred acceptance on the swap returns
  `(w₁, m₂), (w₂, m₁)`, which gives `w₁` and `w₂` their first choices; taking the inverse of the
  men-proposing outcome instead would give `(w₁, m₁), (w₂, m₂)`, their second choices.

### 0.2 Changing one agent's stated preferences

Define `updateMan P m r hr` and `updateWoman P w r hr`, the market in which one agent states the
strict preferences `r` and everyone else is unchanged (Roth 2008, §2.1, the definition of a stable
matching mechanism before Theorem 6).

*Needs:* 0.1, Mathlib `Function.update`.

**Checks.**

- `updateMan P m (P.rankM m) _` has the same rank functions as `P`.
- After `updateMan P m r hr`, the rank of every other man is unchanged:
  `Function.update_of_ne`.
- In the 2 × 2 market `P` of 0.1, `updateWoman P w₁ r hr`, with `r` ranking `m₂`, then `none`,
  then `m₁`, has the single stable matching `(m₁, w₂), (m₂, w₁)`, while `P` has two; the identity
  update keeps both.

### Examples

- The 2 × 2 market of 0.1's first Check, with its two stable matchings.

### Dependencies

Mathlib only.

## Layer 1: existence and the deferred acceptance algorithm

### 1.1 Deferred acceptance

Define `proposal` (a man's best acceptable woman who has not rejected him), `held` (a woman's best
acceptable proposer), `step` (one round: each man proposes, each woman holds her best acceptable
proposer and rejects the others) and `deferredAcceptance` (`|M| · |W| + 1` rounds from no
rejection, then each man's final proposal). Prove that the rejection sets only grow, so that the
iteration is constant after at most `|M| · |W|` rounds, and
`exists_isStable_man_eq_deferredAcceptance`: the outcome is the men's side of a stable matching
(Roth 2008, Theorem 1 and the proof after it). Deferred acceptance with the women proposing is
the algorithm of the role swap (0.1), its outcome read as a matching `M ≃. W` through
`PEquiv.symm`.

*Needs:* 0.1, Mathlib `List.argmin`, `Finset.filter`, `Function.iterate`.

**Checks.**

- Roth 2008, Example 1 (`m₁: w₂, w₁, w₃`, `m₂, m₃: w₁, w₂, w₃`, `w₁, w₃: m₁, m₂, m₃`,
  `w₂: m₃, m₁, m₂`): deferred acceptance returns `(m₁, w₁), (m₂, w₃), (m₃, w₂)`, as stated there.
- In the 2 × 2 market of 0.1 the men propose to their first choices, nobody is rejected, and the
  outcome is `(m₁, w₁), (m₂, w₂)` after one round.
- Each round with a rejection adds a woman to some man's rejection set, and there are at most
  `|M| · |W|` such pairs: `|M| · |W| + 1` rounds reach the fixed point, where every woman holds
  each of her proposers, so that at most one man proposes to each woman.

### 1.2 Existence

Prove `exists_isStable`: every finite marriage market has a stable matching (Gale–Shapley 1962,
Theorem 1; Roth 2008, Theorem 1). Route: 1.1. A second route is Sotomayor's non-constructive
proof (Sotomayor 1996).

*Needs:* 0.1, 1.1.

**Checks.**

- With no men, the empty matching is stable: every woman is single, which she accepts.
- In the 2 × 2 market of 0.1, the two stable matchings are the outcomes of 1.1 with the men and
  with the women proposing.
- For the four roommates of the Research context, where any two agents may be matched, no stable
  matching exists: the theorem uses the two-sided structure.

### 1.3 Men-optimality

Prove `rankM_deferredAcceptance_le`: at every stable matching, each man's partner is ranked no
better than his partner under deferred acceptance (Gale–Shapley 1962, Theorem 2; Roth 2008,
Theorem 2). Route: no man is ever rejected by a woman who is his partner at some stable matching.

*Needs:* 1.1.

**Checks.**

- In the 2 × 2 market of 0.1, each man gets his first choice under deferred acceptance and his
  second at the other stable matching.
- The statement fails for unstable matchings: in Roth 2008, Example 1, `(m₁, w₂), (m₂, w₃),
  (m₃, w₁)` gives `m₁` and `m₃` their first choices, better than deferred acceptance.
- With strict preferences the men-optimal stable matching is unique: two of them would give every
  man the same partner, by injectivity of the ranks.

### Examples

- Roth 2008, Example 1, and the 2 × 2 market of 0.1, run by hand.

### Dependencies

Layer 0, Mathlib.

## Layer 2: the set of stable matchings

### 2.1 Conway's lattice

Prove `exists_isStable_manSup` and `exists_isStable_manInf`: for two stable matchings, giving
each man the better (respectively the worse) of his two partners defines a stable matching (Roth
2008, Theorem 3, attributed by Knuth 1976 to Conway). Deduce that the stable matchings form a
lattice for the men's common order, with greatest element the outcome of 1.1. The least element is
the outcome of deferred acceptance with the women proposing, which every woman likes at least as
well as any stable matching (Roth 2008, Theorems 2 and 3).

*Needs:* 0.1 (role swap), 1.1, 1.3.

**Checks.**

- In the 2 × 2 market of 0.1, the join of the two stable matchings is `(m₁, w₁), (m₂, w₂)` and
  their meet is `(m₁, w₂), (m₂, w₁)`.
- The join of two arbitrary matchings need not be a matching: two men may point to the same
  woman. Stability of both is what rules this out.
- The join is computed from the men's side only; the women's side of the join is each woman's
  worse partner, which the proof derives and the statement does not assume.

### 2.2 McVitie–Wilson

Prove `man_eq_none_iff_of_isStable` and `woman_eq_none_iff_of_isStable`: the same men and the same
women are single at every stable matching (McVitie–Wilson 1970; Roth 2008, Theorem 4). Route:
the men matched at the least element are matched at every stable matching. The men matched at any
stable matching are matched at the outcome of 1.1. Women-optimality of the least element makes the
two extremes match equally many agents (Roth 2008, the remark before Theorem 4).

*Needs:* 1.3, 2.1 (least element).

**Checks.**

- In the 3 × 2 market `m₁, m₂: w₁ > w₂`, `m₃: w₂ > w₁`, `w₁: m₃ > m₁ > m₂`, `w₂: m₁ > m₃ > m₂`,
  the stable matchings are `(m₁, w₁), (m₃, w₂)` and `(m₁, w₂), (m₃, w₁)`, and `m₂` is single at
  both.
- The statement fails for individually rational matchings that are not stable: the empty matching
  leaves everyone single.
- Single agents at a stable matching are the same for the men- and women-proposing algorithms, the
  two ends of the lattice.

### 2.3 Weak Pareto optimality for the men

Prove `not_forall_rankM_lt_deferredAcceptance`: if there is at least one man, no individually
rational matching gives every man a partner he strictly prefers to his partner under deferred
acceptance (Roth 1982, Theorem 6, p. 626; Roth 2008, Theorem 5).

*Needs:* 1.1.

**Checks.**

- Individual rationality is needed: with one man who accepts the only woman and a woman who does
  not accept him, deferred acceptance leaves him single, and the matching that pairs them makes
  him strictly better off.
- At least one man is needed: with no men the universal statement is vacuously true and its
  negation false.
- The theorem is weak: in Roth 2008, Example 1, `(m₁, w₂), (m₂, w₃), (m₃, w₁)` makes `m₁` and
  `m₃` strictly better off and `m₂` no worse.

### Examples

- The 2 × 2 market of 0.1 is a lattice of two elements.

### Dependencies

Layers 0 and 1, Mathlib.

## Layer 3: incentives

### 3.1 Roth's impossibility theorem

Prove `not_exists_truthful_stable_mechanism`: with at least two men and two women, no function
returning a stable matching for every market makes truthful statement a dominant strategy for
every agent (Roth 1982, Theorem 3, p. 622; Roth 2008, Theorem 6). Route: Roth 2008's 2 × 2
example, extended by agents who accept nobody.

*Needs:* 0.1, 0.2.

**Checks.**

- In the 2 × 2 market of 0.1, if the mechanism returns `(m₁, w₁), (m₂, w₂)`, woman `w₁`, by
  declaring `m₁` unacceptable, leaves `(m₁, w₂), (m₂, w₁)` as the only stable matching and gets her
  first choice `m₂`.
- With one man, deferred acceptance with the women proposing is truthful for everyone: the
  hypothesis `2 ≤ card M` is needed.
- The theorem concerns stable mechanisms only: the mechanism that always returns the empty
  matching is truthful for everyone and not stable.

### 3.2 Dominant strategy for the men

Prove `rankM_deferredAcceptance_le_updateMan`: a man stating any other strict preferences obtains
under deferred acceptance a partner he truly ranks no better (Dubins–Freedman 1981; Roth 1982,
Theorem 5, p. 623; Roth 2008, Theorem 8).

*Needs:* 1.1, 1.3, 0.2.

**Checks.**

- Stating `rankM m` itself changes nothing.
- In the 2 × 2 market of 0.1, `m₁` already gets his first choice, so no statement improves him.
- The analogue for women fails: the misreport of `w₁` in 3.1's first Check improves her under
  men-proposing deferred acceptance.

### Examples

- The 2 × 2 market of 0.1 with `w₁` declaring `m₁` unacceptable.

### Dependencies

Layers 0 and 1, Mathlib.

## Downstream consumers

None known: no roadmap on `main` cites StableMatching.

## Research context

Gale and Shapley also considered the roommates problem, in which any two of four agents may share
a room; when each of three agents is the first choice of another and all three rank the fourth
last, no stable partition exists (Roth 2008, §1). The many-to-one college admissions model and the
rural hospitals theorem (Roth 1986), and matching with contracts (Hatfield–Milgrom 2005), extend
the marriage model; the Archive of Formal Proofs entry of Gammie (2016) formalizes in Isabelle the
results of matching with contracts and several of the theorems above.

## References

- L. E. Dubins, D. A. Freedman, *Machiavelli and the Gale–Shapley algorithm*, Amer. Math. Monthly
  88 (1981), 485–494; doi:10.1080/00029890.1981.11995301.
- D. Gale, L. S. Shapley, *College admissions and the stability of marriage*, Amer. Math. Monthly
  69 (1962), 9–15.
- P. Gammie, *Stable Matching*, Archive of Formal Proofs (2016),
  https://isa-afp.org/entries/Stable_Matching.html.
- J. W. Hatfield, P. R. Milgrom, *Matching with contracts*, Amer. Econ. Rev. 95 (2005), 913–935;
  doi:10.1257/0002828054825466.
- D. E. Knuth, *Mariages stables*, Les Presses de l'Université de Montréal (1976).
- D. G. McVitie, L. B. Wilson, *Stable marriage assignment for unequal sets*, BIT 10 (1970),
  295–309; doi:10.1007/BF01934199.
- A. E. Roth, *The economics of matching: stability and incentives*, Math. Oper. Res. 7 (1982),
  617–628.
- A. E. Roth, *On the allocation of residents to rural hospitals: a general property of two-sided
  matching markets*, Econometrica 54 (1986), 425–427.
- A. E. Roth, *Deferred acceptance algorithms: history, theory, practice, and open questions*,
  Internat. J. Game Theory 36 (2008), 537–569 (section and theorem numbers of the July 2007
  version, NBER Working Paper 13225, https://www.nber.org/papers/w13225).
- M. Sotomayor, *A non-constructive elementary proof of the existence of stable marriages*, Games
  Econom. Behav. 13 (1996), 135–137; doi:10.1006/game.1996.0029.
