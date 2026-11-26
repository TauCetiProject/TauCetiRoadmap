<!--tauceti-status:v1 {"roadmap":"HabiroCyclotomicCompletions","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833","ts":"2026-11-25T15:07:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the (q^m-1)^k presentation, the no-ideal-adic theorem, and the series q-toolkit: Jackson series, q-exponentials, infinite Pochhammer, plethystic exponential","state":"partial"},{"id":"Layer 2","remaining":"arbitrary factorial-series sums and the Kontsevich element, digit multiplication, the inverse of q and the Laurent presentation","state":"partial"},{"id":"Layer 3","remaining":"the exponential Taylor coordinate, naturality and q to q^a power maps, close-root re-expansion","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"3a34643b4472678ed6dc1bc956200038cb8e607246482ef8e3b09ae91d93968a","roadmap":"HabiroCyclotomicCompletions","to_sha":"522d48f5cf3a7d1e2de29e18281399b335b25833"}-->
# Status: HabiroCyclotomicCompletions

This file documents the status of the HabiroCyclotomicCompletions roadmap up until `522d48f` (2026-11-25T15:07:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The completions `R[q]^S` exist with their topology, universal property, finite quotients, coefficient functoriality and cofinal presentations. The full ring has its unique factorial expansion, and root evaluation and Taylor expansion are built. Layers 1–3 are each partial, and the rigidity theory, modules, components and worked checks (Layers 4–6) have not begun.

### Named results

- **The universal property of the cyclotomic completion.** A ring map from `R[q]` to a complete Hausdorff topological ring, sending some cyclotomic ideal `(f)` into every neighbourhood of zero, extends uniquely to a continuous ring map on `R[q]^S` ([existsUnique_continuous_comp_fromPoly_eq](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Completion/Topology.html#TauCeti.CycloCompletion.existsUnique_continuous_comp_fromPoly_eq)).
- **The finite quotient theorem.** For each index `f` the kernel of the projection to `R[q]/(f)` is the principal ideal `f·R[q]^S`, with no domain hypothesis ([ker_proj](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Completion/Basic.html#TauCeti.CycloCompletion.ker_proj)).
- **Habiro's coefficient lemma.** An injective or surjective ring map `R → R'` induces an injective or surjective map of completions ([map_injective](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Completion/Map.html#TauCeti.CycloCompletion.map_injective), [map_surjective](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Completion/Map.html#TauCeti.CycloCompletion.map_surjective)).
- **The cyclotomic factorization of `P_N`.** `(-1)^N P_N = ∏_{d≤N} Φ_d^{⌊N/d⌋}`, and in characteristic zero that multiplicity is exact ([neg_one_pow_mul_factorialPoly_eq_prod_cyclotomic](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Factorial.html#TauCeti.neg_one_pow_mul_factorialPoly_eq_prod_cyclotomic), [cyclotomic_pow_dvd_factorialPoly_iff](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Factorial.html#TauCeti.cyclotomic_pow_dvd_factorialPoly_iff)).
- **The normalized factorial expansion.** Every element of the full Habiro ring is uniquely `Σ_{n≥0} a_n(q) P_n(q)` with `deg a_n ≤ n`, the partial sums converging to it ([existsUnique_factorialExpansion](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Completion/FactorialExpansion.html#TauCeti.CycloCompletion.existsUnique_factorialExpansion)).

### Notable definitions and infrastructure

- **The cyclotomic completion** ([CycloCompletion](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Completion/Basic.html#TauCeti.CycloCompletion)) is indexed by the monoid of actual cyclotomic products ([cycloIndex](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/IndexMonoid.html#TauCeti.cycloIndex)). That indexing keeps characteristic two honest, where `Φ_1 = Φ_2`.
- **Polynomial-family limits and cofinal equivalence** ([cofinalEquiv](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/FamilyLimit.html#TauCeti.PolyFamilyLimit.cofinalEquiv)) are the one mechanism behind every change of presentation. It already gives the adic description for finite `S` and the finite-subset limit for arbitrary `S`.
- **Root evaluation and the additive Taylor map** ([taylorAt](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Completion/Taylor.html#TauCeti.CycloCompletion.taylorAt)) expand an element at a root of `Φ_n` in any coefficient algebra, with Hasse-derivative coefficients. These are the inputs to Layer 4's rigidity.

### Roadmap coverage

Layer 1 is partial. Indexing, compatible families, finite quotients, topology, the extension theorem, cofinal and finite-subset presentations, and coefficient and order functoriality (§§1.2, 1.3, 1.5) are proved. §1.4 has the factorial polynomials and factorial cofinality, but not the presentation by `(q^m-1)^k` nor the theorem that no ideal-adic completion recovers `R[q]^S`. §1.1 has only the finite q-factorial and Pochhammer products; a polynomial q-derivative exists elsewhere in the library. The series Jackson derivative, q-exponentials, the infinite Pochhammer product and the plethystic exponential are missing. Layer 2 is partial. It has digit existence, uniqueness and convergence, but not arbitrary factorial-series sums, the Kontsevich element, digit multiplication (§2.2) or the inverse of `q` (§2.3). Layer 3 is partial. §3.1's evaluation and Taylor maps are done, apart from the exponential coordinate. Naturality and power maps (§3.2) and close-root re-expansion (§3.3) are untouched. Layers 4, 5 and 6 are untouched.

## The frontier

- **Factorial series and the Kontsevich element** — sum arbitrary series `Σ b_n P_n` in the full ring, then define `F = Σ P_n` and show all its digits are one (§2.1).
- **The unit `q` and the Laurent presentation** — prove `q^{-1} = Σ q^n P_n` from the telescoping identity `q Σ_{n<N} q^n P_n = 1 - P_N` (§2.3).
- **Digit arithmetic** — multiplication followed by finite normalization with upward carries, tested on the digits of `F²` (§2.2).
- **Naturality, power maps and close-root re-expansion** — functoriality of evaluation and Taylor maps, the maps `q ↦ q^a`, and convergent p-adic re-expansion between close roots (§§3.2–3.3). These are the last prerequisites for rigidity.
- **Order adjacency and Taylor rigidity** — Layer 4's summit, injectivity of the Taylor expansion on connected order sets, has nothing yet. It needs §3.3.
