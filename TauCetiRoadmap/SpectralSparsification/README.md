# Roadmap: spectral sparsification

**Summary.** A network on a finite vertex set carries symmetric nonnegative conductances, and its
Laplacian `L` has the quadratic form `fᵀ L f = Σ c(x, y) (f(x) − f(y))²`, summed over unordered
pairs of distinct vertices. A network `H` is an `ε`-approximation of a network `N` when
`(1 − ε) L_N ⪯ L_H ⪯ (1 + ε) L_N` in the Loewner order, that is, when the two quadratic forms
agree up to the factors `1 ± ε`. A sparsifier is
an `ε`-approximation obtained from `N` by reweighting few of its pairs. This roadmap proves that
sparsifiers exist, by a probabilistic construction and by a deterministic one, and that they
preserve the quantities that matter.

The headline theorems are these.

- *What approximation preserves.* If `H` is an `ε`-approximation of `N`, every cut of `H` weighs
  between `1 − ε` and `1 + ε` times the same cut of `N`; and if `N` is connected and `ε < 1`,
  every effective resistance of `H` lies between `R_N/(1 + ε)` and `R_N/(1 − ε)`.
- *Sampling by effective resistances (Spielman and Srivastava).* Let `N` be connected with `n`
  vertices, let `ρ > 0` and `ε > 0`, and keep each pair `e` independently with probability `p(e) = min(1, c(e) R(e)/ρ)`,
  multiplying its conductance by `1/p(e)` when kept. The result fails to be an
  `ε`-approximation with probability at most `2(n − 1) exp(−(ε²/2)/(ρ + ρε/3))`, and the expected
  number of kept pairs is at most `(n − 1)/ρ`. With `ρ` of order `ε²/log n` this gives
  sparsifiers with `O(n log n/ε²)` pairs.
- *Twice-Ramanujan sparsifiers (Batson, Spielman and Srivastava).* For every `d > 1`, vectors
  `v₁, …, v_m` in `ℝⁿ` with `Σ vᵢ vᵢᵀ = I` admit weights `sᵢ ≥ 0`, at most `⌈dn⌉` of them
  nonzero, with `I ⪯ Σ sᵢ vᵢ vᵢᵀ ⪯ κ_d I`, where `κ_d = (d + 1 + 2√d)/(d + 1 − 2√d)`.
  Consequently every network on `n` vertices has a reweighting with at most `⌈d(n − 1)⌉` nonzero
  factors that lies between `L_N` and `κ_d L_N`.

The roadmap is a bridge between two others. ElectricalNetworksAndRandomWalks supplies networks,
their Laplacian and effective resistance, Dirichlet's principle and Foster's theorem, which says
that the leverage scores `c(e) R(e)` sum to `n − 1`. RandomMatrices supplies the matrix Bernstein
inequality for independent bounded Hermitian matrices, which, after the summands are centred and
whitened by the Laplacian, controls the random reweighting. The deterministic construction uses
Tau Ceti's Sherman–Morrison formula for rank-one updates.

Layer 1 defines approximation and proves that it preserves cuts and effective resistances.
Layer 2 expresses effective resistance through any grounded Laplacian and proves the sampling
theorem. Layer 3 defines the upper and lower barrier potentials, proves that one rank-one update
can move both barriers without raising either potential, and deduces the two
Batson–Spielman–Srivastava theorems. Layers 2 and 3 use Layer 1 but not each other.

## Conventions

- **Networks.** `V` is a finite type with decidable equality and `n = Fintype.card V`. A network
  `N : Network V` is the structure of ElectricalNetworksAndRandomWalks 1.1: conductances
  `N.cond x y = N.cond y x ≥ 0`, loops allowed. Its Laplacian `N.laplacian` is
  `diag(c(x)) − (c(x, y))` with `c(x) = Σ_y c(x, y)` (loops cancel), its grounded Laplacian
  `N.groundedLaplacian z` deletes the row and column of `z`, and `N.effResistance a z` is the
  entry at `a` of the column `a` of the inverse grounded Laplacian at `z` (and `0` if `a = z`).
  These definitions, `Network.weight`, `Network.voltage` and `N.graph` (adjacency `x ≠ y`,
  `0 < c(x, y)`) are copied verbatim.
  Mathlib's inverse of a singular matrix is `0`, so on a disconnected network every effective
  resistance is `0`, even between two vertices of one component; every statement below that
  involves effective resistance assumes connectivity.
- **Loewner order.** For real square matrices `A ≤ B` means that `B − A` is positive semidefinite
  (Mathlib's order under `open scoped MatrixOrder`, `Matrix.le_iff`); in prose it is written
  `A ⪯ B`. Positive definiteness is Mathlib's `Matrix.PosDef`.
- **Pairs and reweighting.** Unordered pairs are elements of `Sym2 V`, the pair of `x` and `y`
  being `s(x, y)`; the diagonal pairs `s(x, x)` are loops and never affect a Laplacian. For
  `s : Sym2 V → ℝ≥0`, `N.reweight s` has conductances `s(s(x, y)) · c(x, y)`. Its pairs with
  nonzero factor are `#{e | s e ≠ 0}`; a reweighting never creates an edge that `N` lacks.
- **Approximation.** `IsApprox ε N H` is `(1 − ε) L_N ⪯ L_H ⪯ (1 + ε) L_N`. It is not symmetric
  in `N` and `H`, and for `ε < 0` it forces `L_N = L_H = 0`.
- **Leverage scores.** The leverage score of a pair `e = s(x, y)` is `ℓ(e) = c(x, y) R(x ↔ y)`.
- **Random reweighting.** The sampling theorem takes independent `Bool`-valued measurable random
  variables `ξ e` indexed by `Sym2 V` (Mathlib's `iIndepFun`) on a probability space, with
  `P(ξ e = true) = p(e)`; the factor of `e` is `p(e)⁻¹` when `ξ e` is true and `0` otherwise (in
  `ℝ≥0`, where `0⁻¹ = 0`).
- **Barrier potentials.** For a real symmetric `n × n` matrix `A`, `Φ^u(A) = tr (u I − A)⁻¹` and
  `Φ_l(A) = tr (A − l I)⁻¹`. They are used only when `u I − A`, respectively `A − l I`, is
  positive definite; then they equal `Σᵢ 1/(u − λᵢ)` and `Σᵢ 1/(λᵢ − l)` over the eigenvalues.
- **The ratio.** `κ_d = (d + 1 + 2√d)/(d + 1 − 2√d) = ((√d + 1)/(√d − 1))²` for `d > 1`.
- **Sources.** `Sp` is Spielman's book, `SS` the paper of Spielman and Srivastava and `BSS` the
  paper of Batson, Spielman and Srivastava, all listed under References.

## Layer 1: approximation of networks

### 1.1 Networks, reweighting and ε-approximation

Copy `Network`, `Network.weight`, `Network.graph`, `Network.laplacian`,
`Network.groundedLaplacian`, `Network.voltage` and `Network.effResistance` verbatim from
ElectricalNetworksAndRandomWalks 1.1 and 2.1. Define the reweighting `Network.reweight` and the
relation `IsApprox ε N H` as in the Conventions (Sp, §32.2, p. 258, for the definition of an
`ε`-approximation; Sp, §6.2, p. 54, for the Loewner order on Laplacians).

Throughout the routes below, the quadratic form of a network Laplacian is
`fᵀ L f = ½ Σ_x Σ_y c(x, y)(f(x) − f(y))²`: expand `Σ_x c(x) f(x)² − Σ_x Σ_y c(x, y) f(x) f(y)`
and symmetrize with `c(x, y) = c(y, x)`; loop terms vanish. In particular `L` is positive
semidefinite, `L 𝟙 = 0`, and `fᵀ L f = 0` exactly when `f` is constant on the components of
`N.graph`. This identity is a step of the routes, not a target.

**Checks.**
- The triangle `K₃` with unit conductances has Laplacian eigenvalues `0, 3, 3`, so `L_{K₃} = 3Π`
  with `Π` the projection orthogonal to `𝟙`. The path `0 − 1 − 2` with conductances `3/2` has
  eigenvalues `0, 3/2, 9/2`, so relative to `L_{K₃}` its quadratic form ranges over the factors
  `1/2` and `3/2`: it is a `1/2`-approximation of `K₃` and not a `49/100`-approximation.
- Orientation: for `N` the single edge of conductance `2` and `H` the same edge with conductance
  `1`, `H` is a `1/2`-approximation of `N`, but `N` is not a `1/2`-approximation of `H` (it is a
  `1`-approximation). A definition with the roles of `N` and `H` exchanged would differ here.
- For `ε < 0` the two inequalities give `2ε L_N ⪰ 0`, so `L_N = 0` and then `L_H = 0`.

### 1.2 Cuts

For `S : Finset V` write `cut_N(S) = Σ_{x ∈ S} Σ_{y ∉ S} c(x, y)` for the weight of the cut
between `S` and its complement; the statement spells out this double sum and introduces no
definition. Prove `cutWeight_le_of_isApprox`: if `IsApprox ε N H`, then for every `S`,
`(1 − ε) cut_N(S) ≤ cut_H(S) ≤ (1 + ε) cut_N(S)`. No hypothesis on `ε` is needed.
(Sp, §32.2, item 3, p. 258, states this consequence with the indicator vector as its reason;
proved here.)

Route: the quadratic form of 1.1 at the indicator `𝟙_S` is the cut weight, since
`(𝟙_S(x) − 𝟙_S(y))²` is `1` exactly when one of `x`, `y` lies in `S`, and each such pair is counted
twice in the double sum. Evaluate the two Loewner inequalities at `𝟙_S`.

**Checks.**
- With `N = K₃` and `H` the path of 1.1 (`ε = 1/2`): the cut `{1}` weighs `2` in `N` and `3` in
  `H`, which attains `(1 + ε) · 2`; the cuts `{0}` and `{2}` weigh `3/2` in `H`.
- `S = ∅` and `S = V` give `0` on both sides.

*Needs:* 1.1. (Proved here.)

### 1.3 Effective resistances

Prove `effResistance_le_of_isApprox`: if `N` is connected, `ε < 1` and `IsApprox ε N H`, then for
all vertices `a`, `z`, `R_N(a ↔ z)/(1 + ε) ≤ R_H(a ↔ z) ≤ R_N(a ↔ z)/(1 − ε)`. (Sp, §32.2, item 1, p. 258, states
this consequence without proof; the route follows the energy argument of Sp, Theorem 12.3.1 and
its proof, pp. 113–114; proved here.)

Route. If `a = z`, all three numbers are `0`. Let `a ≠ z`.
1. *`H` is connected.* The vertex set of a component `C` of `H.graph` gives
   `𝟙_Cᵀ L_H 𝟙_C = 0`, hence `(1 − ε) 𝟙_Cᵀ L_N 𝟙_C ≤ 0` with `1 − ε > 0`, so `𝟙_C` is constant
   on the components of `N.graph` (1.1); `N` is connected and `C` is nonempty, so `C = V`.
2. *Comparison of energies.* By Dirichlet's principle (ElectricalNetworksAndRandomWalks 2.2,
   `isLeast_dirichletEnergy`, applied to `N` and to `H`), `1/R_N(a ↔ z)` and `1/R_H(a ↔ z)` are
   the least Dirichlet energies of functions equal to `1` at `a` and `0` at `z`. The Dirichlet
   energy of `f` is `fᵀ L f` (1.1), so the Loewner inequalities give, function by function,
   `(1 − ε) E_N(f) ≤ E_H(f) ≤ (1 + ε) E_N(f)`, and taking least values,
   `(1 − ε)/R_N ≤ 1/R_H ≤ (1 + ε)/R_N`. Both resistances are positive
   (ElectricalNetworksAndRandomWalks 2.5, `effResistance_pos`), so `1 + ε > 0`, and inverting
   gives the two bounds.

**Checks.**
- `N = K₃`, `H` the path of 1.1, `ε = 1/2`: in `K₃` every resistance is `2/3`; in `H`,
  `R(0 ↔ 1) = R(1 ↔ 2) = 2/3` and `R(0 ↔ 2) = 4/3`. The bounds are `4/9 ≤ R_H ≤ 4/3`, and the
  upper one is attained at `0, 2`. Reweighting every pair of `N` by `1 + ε` attains the lower one.
- `ε < 1` is needed: the network with no conductance on three vertices is a `1`-approximation of
  `K₃` (both inequalities read `0 ⪯ 0 ⪯ 2L`), its resistances are `0`, and the lower bound would
  claim `1/3 ≤ 0`.
- Connectivity is assumed because without it the definition gives no information: for the
  network with two disjoint unit edges `{0, 1}` and `{2, 3}`, the Laplacian grounded at `1` has
  the nonzero kernel vector `𝟙_{2,3}` restricted to `{0, 2, 3}`, so its Mathlib inverse is `0`
  and `R(0 ↔ 1) = 0`, although the edge `{0, 1}` alone has resistance `1`.

*Needs:* 1.1; ElectricalNetworksAndRandomWalks 2.2 (`isLeast_dirichletEnergy`, with its
`dirichletEnergy`) and 2.5 (`effResistance_pos`).

### Examples

The triangle `K₃` and its sparsifier the path with conductances `3/2`; a single edge with two
conductances; the network without conductances.

### Dependencies

ElectricalNetworksAndRandomWalks 1.1, 2.1 (copied definitions), 2.2 and 2.5; Mathlib
`Matrix.le_iff`, `Matrix.PosSemidef`.

## Layer 2: sampling by effective resistances

### 2.1 Effective resistance through any grounding

Prove `dotProduct_inv_groundedLaplacian_mulVec`: for every connected network `N` and all vertices
`z`, `x`, `y`, let `b` be `δ_x − δ_y` with the coordinate `z` deleted; then
`bᵀ (L_z)⁻¹ b = R(x ↔ y)`, where `L_z` is the grounded Laplacian at `z`. The definition of
ElectricalNetworksAndRandomWalks 2.1 grounds at the second argument; this statement allows any
grounding. (Sp, §12.1, pp. 111–112, defines the effective resistance as
`(δ_x − δ_y)ᵀ L⁺ (δ_x − δ_y)`; the grounded form is proved here.)

Route. If `x = y`, `b = 0` and both sides are `0`. Let `x ≠ y`.
1. Every grounded Laplacian is invertible: a vector `u` with `L_z u = 0`, extended by `0` at
   `z`, is harmonic at every vertex other than `z` (the harmonicity sum
   `Σ_t c(w, t)(u(t) − u(w))` at `w` is `−(L u)(w)`, loops included), so it equals the zero
   function by the uniqueness half of ElectricalNetworksAndRandomWalks 1.2,
   `existsUnique_isHarmonicAt`, with `B = {z}`.
2. Let `w` be `(L_z)⁻¹ b`, extended by `0` at `z`. Then `(L w)(t) = b(t)` for `t ≠ z` (Mathlib
   `Matrix.mul_nonsing_inv`), and since the entries of `L w` sum to `0` (the columns of `L` sum to
   `0` by the symmetry of `c`), `L w = δ_x − δ_y`. So `w` is harmonic at every vertex other than
   `x` and `y`, and `Σ_t c(x, t)(w(x) − w(t)) = (L w)(x) = 1`.
3. `bᵀ (L_z)⁻¹ b = Σ_{t ≠ z} b(t) w(t) = w(x) − w(y)`, using `w(z) = 0` when `z` is `x` or `y`.
   This number is positive: `L_z` is positive semidefinite (1.1) and invertible, hence positive
   definite, so is its inverse (Mathlib `Matrix.PosDef.inv`), and `b ≠ 0` because one of `x`,
   `y` differs from `z`. Hence `w(x) ≠ w(y)`, and ElectricalNetworksAndRandomWalks 2.1,
   `effResistance_eq_div`, applied to `W = w`, gives `R(x ↔ y) = (w(x) − w(y))/1`.

**Checks.**
- `K₃` grounded at `2`: `L_z = [[2, −1], [−1, 2]]`, `(L_z)⁻¹ = (1/3)[[2, 1], [1, 2]]`; for `x = 0`,
  `y = 1`, `b = (1, −1)` and `bᵀ (L_z)⁻¹ b = 2/3`. Grounded at `0` instead, `b = (−1, 0)` and the
  value is again `2/3`.
- The path `0 − 1 − 2` with unit conductances, grounded at `0`: `L_z = [[2, −1], [−1, 1]]` on
  the coordinates `1, 2`, with inverse `[[1, 1], [1, 2]]`; for `x = 2`, `y = 1`, `b = (−1, 1)`
  and `bᵀ (L_z)⁻¹ b = 1 − 2 + 2 = 1 = R(2 ↔ 1)`, while for `x = 2`, `y = 0` the value is `2`.

*Needs:* 1.1; ElectricalNetworksAndRandomWalks 1.2 (`existsUnique_isHarmonicAt`, with its
`IsHarmonicAt`) and 2.1 (`effResistance_eq_div`); Mathlib `Matrix.mul_nonsing_inv`,
`Matrix.PosDef.inv`. (Proved here.)

### 2.2 The sampling theorem

Prove `measureReal_not_isApprox_le`: let `N` be a connected network on `n` vertices, `ρ > 0`,
`ε > 0`, and `p : Sym2 V → ℝ≥0` with `p(s(x, y)) = min(1, c(x, y) R(x ↔ y)/ρ)`. Let `ξ` be
independent measurable `Bool`-valued random variables indexed by `Sym2 V` with
`P(ξ e = true) = p(e)`, and let `H(ω)` be `N` reweighted by `p(e)⁻¹` on the pairs with `ξ e`
true and by `0` elsewhere. Then
`P(H is not an ε-approximation of N) ≤ 2(n − 1) exp(−(ε²/2)/(ρ + ρε/3))` and the expected number
of pairs with `ξ e` true is at most `(n − 1)/ρ`. The sampling scheme, the reduction to the
identity and the use of leverage scores are those of Sp, §32.2 (pp. 258–259), §32.4 (p. 260) and
§32.5 (pp. 260–261). Sp, §32.6 (pp. 262–263), concludes with a matrix Chernoff bound
(Sp, Theorem 32.3.1, p. 259); here the conclusion goes through the matrix Bernstein inequality,
and the constants are the ones this route gives (proved here). The theorem is due to Spielman and
Srivastava, who sample with replacement (SS, Theorem 1, p. 2).

Route.
1. *Whitening.* Fix `z ∈ V` (connectivity makes `V` nonempty). The grounded Laplacian `L_z`
   is positive semidefinite (1.1) and invertible (2.1, step 1), hence positive definite; let
   `M = (CFC.sqrt L_z)⁻¹`, symmetric with `M L_z M = I` on the `n − 1` coordinates other
   than `z`.
2. *Rank-one pieces.* For `e = s(x, y)` let `b_e` be `δ_x − δ_y` with coordinate `z` deleted and
   `Y_e = c(x, y) (M b_e)(M b_e)ᵀ`. Then `Y_e ⪰ 0`, `‖Y_e‖ = c(x, y) b_eᵀ (L_z)⁻¹ b_e = ℓ(e)` by
   2.1, `Y_e² = ℓ(e) Y_e`, and `Σ_e Y_e = M L_z M = I`, because the grounded Laplacian is
   `Σ_e c(e) b_e b_eᵀ` over `Sym2 V` (loops have `b_e = 0`). For an edge (`x ≠ y`,
   `c(x, y) > 0`), `ℓ(e) > 0` by ElectricalNetworksAndRandomWalks 2.5, `effResistance_pos`, so
   `p(e) > 0`; for every other pair `Y_e = 0`.
3. *A null modification.* Let `ξ' e` be `true` on the pairs with `p(e) = 1` and `ξ e` on the
   others. Each `ξ' e` is a measurable function of `ξ e`, so the family `ξ'` is independent
   (Mathlib `ProbabilityTheory.iIndepFun.comp`), and `ξ'` and `ξ` agree outside the set `Z`, the
   union over the pairs with `p(e) = 1` of the events `{ξ e = false}`; each has probability
   `1 − p(e) = 0`, so `P(Z) = 0`. Steps 4 to 6 use `ξ'`.
4. *Centred summands.* Let `σ_e = p(e)⁻¹` if `ξ' e` is true and `0` otherwise, and
   `X_e = (σ_e − 1) Y_e`. If `p(e) = 0`, then `Y_e = 0` (step 2) and `X_e = 0`; if `p(e) = 1`,
   then `σ_e = 1` and `X_e = 0`. Let `0 < p(e) < 1`. Then `E σ_e = 1`, so `X_e` has entrywise mean
   `0`; `p(e) = ℓ(e)/ρ` with `ℓ(e) < ρ`, so `‖X_e‖ ≤ max(ρ − ℓ(e), ℓ(e)) ≤ ρ` for every outcome;
   and `E X_e² = (1/p(e) − 1) ℓ(e) Y_e = (ρ − ℓ(e)) Y_e ⪯ ρ Y_e`. Summing over all pairs,
   `0 ⪯ Σ_e E X_e² ⪯ ρ I`, and its norm is at most `ρ`.
5. *Transfer to complex matrices.* Fix bijections of `Sym2 V` with `Fin m` and of the
   coordinates other than `z` with `Fin (n − 1)`, and let `X'_k` be the matrix `X_e` of the
   `k`-th pair, reindexed (Mathlib `Matrix.reindex`) and mapped entrywise into `ℂ` by
   `RingHom.mapMatrix Complex.ofRealHom`. Each `X'_k` is a measurable function of `ξ'` at that
   pair, so the family is independent (`ProbabilityTheory.iIndepFun.precomp` along the bijection,
   then `ProbabilityTheory.iIndepFun.comp`). It is Hermitian because `X_e` is real symmetric; its
   entries have mean `0` because the integral commutes with the real embedding
   (`integral_ofReal`); and the entrywise mean of `X'_k X'_k` is the image of `E X_e²`, the
   embedding being a ring homomorphism. For the norms, let `B` be real symmetric with
   `−aI ⪯ B ⪯ aI`, `a ≥ 0`, and `B'` its complex image. For `x = α + iβ` with `α`, `β` real,
   `x* B' x = αᵀ B α + βᵀ B β`, so `−aI ⪯ B' ⪯ aI` for complex matrices; hence the real spectrum
   of `B'` lies in `[−a, a]` (Mathlib `le_algebraMap_iff_spectrum_le` and
   `algebraMap_le_iff_le_spectrum`, in the C*-algebra of complex matrices with the L2 operator
   norm); its complex spectrum is real (`IsSelfAdjoint.mem_spectrum_eq_re`), so it lies in
   `[−a, a]` too, and its norm, which is its spectral radius
   (`IsSelfAdjoint.spectralRadius_eq_nnnorm`), is at most `a`. This applies to
   `X_e = (σ_e − 1) Y_e` with `a = ρ`, because `0 ⪯ Y_e ⪯ ℓ(e) I` and `|σ_e − 1| ℓ(e) ≤ ρ`
   (step 4), and to `Σ_e E X_e²` with `a = ρ`. So
   `‖X'_k‖ ≤ ρ` for every outcome, and `v`, the norm of `Σ_k E X'_k²`, is at most `ρ`.
   RandomMatrices 2.6, `matrix_bernstein`, with `d = n − 1`, `L = ρ` and `t = ε`, bounds the
   probability of `ε ≤ ‖Σ_k X'_k‖` by `2(n − 1) exp(−(ε²/2)/(v + ρε/3))`, which is at most the
   stated bound because `v ≤ ρ`.
6. *Back to the network.* Let `ω ∉ Z` with `‖Σ_k X'_k(ω)‖ < ε`. There `H(ω)` is `N` reweighted
   by the `σ_e`, and `Σ_e X_e = M (L_{H,z} − L_z) M`, where `L_{H,z}` is the grounded Laplacian
   of `H(ω)`. For real `x`, viewed as a complex vector, `|xᵀ (Σ_e X_e) x| ≤ ‖Σ_k X'_k‖ ‖x‖²`
   (Mathlib `Matrix.l2_opNorm_mulVec` and the Cauchy–Schwarz inequality), so
   `−εI ⪯ Σ_e X_e ⪯ εI`, and congruence by `M⁻¹` gives `(1 − ε) L_z ⪯ L_{H,z} ⪯ (1 + ε) L_z`.
   A symmetric matrix `D` with zero row sums is positive semidefinite exactly when its grounded
   submatrix is, because `xᵀ D x` equals the grounded form at `x − x(z) 𝟙` with the coordinate
   `z` deleted; applied to `L_H − (1 − ε) L_N` and `(1 + ε) L_N − L_H` this makes `H(ω)` an
   `ε`-approximation. So the failure event lies in `{ε ≤ ‖Σ_k X'_k‖} ∪ Z`, and Mathlib
   `MeasureTheory.measureReal_mono` and `MeasureTheory.measureReal_union_le`, with `P(Z) = 0`,
   give the bound.
7. *The count.* The expected count is `Σ_e p(e) ≤ Σ_e ℓ(e)/ρ`. By Foster's theorem
   (ElectricalNetworksAndRandomWalks 3.3, `sum_cond_mul_effResistance`) the double sum of
   `c(x, y) R(x ↔ y)` over ordered pairs is `2(n − 1)`; every pair `x ≠ y` occurs twice and the
   diagonal terms vanish since `R(x ↔ x) = 0`, so `Σ_e ℓ(e) = n − 1`.

**Checks.**
- `N = K₃`, `ρ = 1`, `ε = 1/2`: every leverage score is `2/3`, so `p = 2/3` on the three edges.
  Keeping all three gives `(3/2) L_{K₃}`, an `ε`-approximation; keeping two gives the path of
  1.1, an `ε`-approximation; keeping one or none disconnects. The failure probability is
  `3 · (2/3)(1/3)² + (1/3)³ = 7/27`, and the expected count is `2 = (n − 1)/ρ`, so the second
  bound is attained when no `p(e)` is capped. The first bound, `4 e^(−3/28)`, exceeds `1` here.
- Parameters: for `n ≥ 2`, `0 < ε ≤ 1` and `ρ = 3ε²/(8 ln(4(n − 1)))`, the exponent is at least
  `3ε²/(8ρ) = ln(4(n − 1))` because `1 + ε/3 ≤ 4/3`, so the failure probability is at most `1/2`
  and the expected count is at most `8(n − 1) ln(4(n − 1))/(3ε²)`.
- Connectivity is needed: for two disjoint unit edges on four vertices every resistance is `0`,
  so no pair is kept and `H` has no conductance; with `ε = 1/2` it always fails, while for
  `ρ = 1/100` the bound is `6 e^(−75/7) < 1`.
- `ε > 0` is needed: for `ε = −1` an `ε`-approximation of `K₃` must have `L_{K₃} = 0` (1.1), so
  failure is certain, while for `ρ = 1/10` the bound `4 e^(−15/2)` is below `1`.

*Needs:* 1.1, 2.1; ElectricalNetworksAndRandomWalks 1.1 (`Network.graph`), 2.5
(`effResistance_pos`) and 3.3 (`sum_cond_mul_effResistance`); RandomMatrices 2.6
(`matrix_bernstein`); Mathlib `CFC.sqrt`, `ProbabilityTheory.iIndepFun`,
`ProbabilityTheory.iIndepFun.comp`, `ProbabilityTheory.iIndepFun.precomp`, `Matrix.reindex`,
`RingHom.mapMatrix`, `Complex.ofRealHom`, `integral_ofReal`, `le_algebraMap_iff_spectrum_le`,
`algebraMap_le_iff_le_spectrum`, `IsSelfAdjoint.mem_spectrum_eq_re`,
`IsSelfAdjoint.spectralRadius_eq_nnnorm`, `Matrix.l2_opNorm_mulVec`, `Matrix.IsUnit.posSemidef_star_left_conjugate_iff`,
`MeasureTheory.measureReal_mono`, `MeasureTheory.measureReal_union_le`.

### Examples

`K₃` with `ρ = 1`; two disjoint edges as the negative control; the parameter choice
`ρ = 3ε²/(8 ln(4(n − 1)))`.

### Dependencies

Layer 1; ElectricalNetworksAndRandomWalks 1.2, 2.1, 2.5, 3.3; RandomMatrices 2.6; Mathlib
`CFC.sqrt`, `ProbabilityTheory.iIndepFun.comp`, `Matrix.mul_nonsing_inv`, `Matrix.PosDef.inv`,
`integral_ofReal`, `IsSelfAdjoint.spectralRadius_eq_nnnorm`.

## Layer 3: barrier potentials and linear-size sparsifiers

### 3.1 Barrier potentials

Define `upperPotential u A = tr (u I − A)⁻¹` and `lowerPotential l A = tr (A − l I)⁻¹` for real
square matrices (BSS, Definition 3.2, p. 9; Sp, §33.5, pp. 266–267). Define the upper cost
`upperBarrierCost u δ A v = vᵀ M² v/(Φ^u(A) − Φ^{u+δ}(A)) + vᵀ M v` with `M = ((u + δ) I − A)⁻¹`,
and the lower cost `lowerBarrierCost l δ A v = vᵀ M² v/(Φ_{l+δ}(A) − Φ_l(A)) − vᵀ M v` with
`M = (A − (l + δ) I)⁻¹` (BSS, Lemmas 3.3 and 3.4, p. 11, where they are `U_A(v)` and `L_A(v)`;
Sp, Lemmas 33.6.1 and 33.6.2, p. 269).

**Checks.**
- `Φ^u(0) = n/u` and `Φ_l(0) = −n/l` for `u > 0 > l`; for `A = diag(0, 1)` and `u = 2`,
  `Φ^2(A) = 1/2 + 1 = 3/2`.
- On positive definite `u I − A` the potential is `Σᵢ 1/(u − λᵢ)` (Mathlib
  `Matrix.IsHermitian.trace_eq_sum_eigenvalues` applied to the inverse); where `u I − A` is
  singular the Mathlib inverse is `0`, so the potential is `0` there, which is why every statement
  below assumes positive definiteness.

### 3.2 Moving the upper barrier

Prove `upperPotential_add_le`: if `u I − A` is positive definite and `δ > 0`, then for every vector
`v` and every real `t` with `t · U_A(v) ≤ 1`, the matrix `(u + δ) I − (A + t v vᵀ)` is positive
definite and `Φ^{u+δ}(A + t v vᵀ) ≤ Φ^u(A)` (BSS, Lemma 3.3 and its proof, p. 11; Sp, Lemma
33.6.1, p. 269). The source takes `1/t ≥ U_A(v)`, which means `t > 0`; the statement here also
covers `t ≤ 0`.

Route. Write `M = (u + δ) I − A`, positive definite since `δ > 0`. If `t ≤ 0`, then
`M − t v vᵀ ⪰ M`, so it is positive definite, its inverse is below `M⁻¹` in the Loewner order
(congruence by `M^(−1/2)`), and the trace gives `Φ^{u+δ}(A + t v vᵀ) ≤ Φ^{u+δ}(A) ≤ Φ^u(A)`, the
last step because each `1/(u + δ − λᵢ) ≤ 1/(u − λᵢ)`. Let `t > 0` and `v ≠ 0` (for `v = 0` there
is nothing to prove). Then `Φ^u(A) − Φ^{u+δ}(A) > 0`, `U_A(v) > vᵀ M⁻¹ v`, and so
`t vᵀ M⁻¹ v < 1`. For every `x`, Cauchy–Schwarz in the inner product of `M` gives
`t (vᵀ x)² ≤ t (vᵀ M⁻¹ v)(xᵀ M x) < xᵀ M x` when `x ≠ 0`, so `M − t v vᵀ` is positive definite.
The Sherman–Morrison formula (Tau Ceti `Matrix.inv_add_vecMulVec`, with the invertibility
criterion `Matrix.isUnit_add_vecMulVec_iff`) and `tr (M⁻¹ v vᵀ M⁻¹) = vᵀ M⁻² v` give
`Φ^{u+δ}(A + t v vᵀ) = Φ^{u+δ}(A) + vᵀ M⁻² v/(1/t − vᵀ M⁻¹ v)`, which is at most `Φ^u(A)` exactly
when `1/t ≥ U_A(v)`.

**Checks.**
- `A = diag(0, 1)`, `u = 2`, `δ = 1`, `v = (1, 1)`: `U_A(v) = 11/8`, and `t = 8/11` gives
  `Φ^3(A + t v vᵀ) = 3/2 = Φ^2(A)`, equality, with largest eigenvalue `(27 + √377)/22 < 3`. So the
  condition on `t` cannot be relaxed.
- `δ > 0` is needed: `A = (1)`, `u = 2`, `δ = −2`, `t = 0` satisfies `t · U_A(v) ≤ 1`, but
  `(u + δ) − A = −1`.

*Needs:* 3.1; Tau Ceti `Matrix.inv_add_vecMulVec`, `Matrix.isUnit_add_vecMulVec_iff`; Mathlib
`Matrix.PosDef`, `Matrix.PosDef.inv`, `Matrix.trace_mul_comm`.

### 3.3 Moving the lower barrier

Prove `lowerPotential_add_le`: if `A − l I` is positive definite and `Φ_l(A) ≤ 1/δ`, then for
every vector `v` and every `t ≥ 0` with `1 ≤ t · L_A(v)`, the matrix `A + t v vᵀ − (l + δ) I` is
positive definite and `Φ_{l+δ}(A + t v vᵀ) ≤ Φ_l(A)` (BSS, Lemma 3.4 and its proof, pp. 11–12;
Sp, Lemma 33.6.2, p. 269).

Route. The hypothesis `Φ_l(A) ≤ 1/δ` with `Φ_l(A) > 0` (for `n ≥ 1`) forces `δ > 0`. Each term of
`Φ_l(A)` is positive, so `1/(λ_min − l) ≤ 1/δ`, that is `λ_min − l ≥ δ`, with strict inequality
when `n ≥ 2`. If `n = 1` and `λ_min − l = δ`, the matrix `A − (l + δ) I` is `0`, its Mathlib
inverse is `0`, and `L_A(v) = 0`, so no `t` satisfies `1 ≤ t · L_A(v)`; if `n = 0` likewise
`L_A(v) = 0`. Otherwise `A − (l + δ) I` is positive definite and so is
`A + t v vᵀ − (l + δ) I`; also `t > 0` and `L_A(v) > 0`. With `M = A − (l + δ) I`, Sherman–Morrison
gives `Φ_{l+δ}(A + t v vᵀ) = Φ_{l+δ}(A) − vᵀ M⁻² v/(1/t + vᵀ M⁻¹ v)`, and since
`Φ_{l+δ}(A) − Φ_l(A) > 0` this is at most `Φ_l(A)` exactly when `1/t ≤ L_A(v)`. The source's
first step asserts `λ_min(A) > l + δ` from `λ_min(A) > l` and `Φ_l(A) ≤ 1/δ`; for `n = 1` this
fails in the equality case (`A = (1)`, `l = 0`, `δ = 1`), where `L_A(v)` involves the inverse of
the zero matrix. That case is the one treated above.

**Checks.**
- `A = diag(1, 10)`, `l = 0`, `δ = 1/2`, so `Φ_0(A) = 11/10 < 2`. For `v = (1, 0)`,
  `L_A(v) = 378/191` and `t = 191/378` gives `Φ_{1/2}(A + t v vᵀ) = 11/10 = Φ_0(A)`, equality.
- `t ≥ 0` is needed: for `v = (0, 1)` in the same instance `L_A(v) = −18/191`, and
  `t = −191/18` satisfies `t · L_A(v) = 1`, but `A + t v vᵀ` has the eigenvalue `−11/18 < 1/2`.

*Needs:* 3.1; Tau Ceti `Matrix.inv_add_vecMulVec`, `Matrix.isUnit_add_vecMulVec_iff`; Mathlib
`Matrix.PosDef`, `Matrix.IsHermitian.trace_eq_sum_eigenvalues`, `Matrix.trace_mul_comm`,
`Matrix.nonsing_inv_apply_not_isUnit`.

### 3.4 Moving both barriers

Prove `exists_barrier_step`: let `v : m → n → ℝ` satisfy `Σᵢ vᵢ vᵢᵀ = I` (isotropic position)
with `m` nonempty. If `u I − A` and `A − l I` are positive definite, `Φ^u(A) ≤ ε_U`,
`Φ_l(A) ≤ ε_L`, `δ_U > 0` and `1/δ_U + ε_U ≤ 1/δ_L − ε_L`, then there are an index `i` and a
`t > 0` such that `(u + δ_U) I − (A + t vᵢ vᵢᵀ)` and `A + t vᵢ vᵢᵀ − (l + δ_L) I` are positive
definite, `Φ^{u+δ_U}(A + t vᵢ vᵢᵀ) ≤ Φ^u(A)` and `Φ_{l+δ_L}(A + t vᵢ vᵢᵀ) ≤ Φ_l(A)` (BSS, Lemma 3.5
with Claim 3.6, pp. 12–14; Sp, Lemmas 33.7.1 and 33.7.2, pp. 269–270, prove a weaker lower
estimate). The inequality on `δ`'s forces `δ_L > 0` when `n ≥ 1`, since then `ε_U`, `ε_L > 0`.

Route. If `n = 0` every conclusion holds for any `i` and `t = 1`. Let `n ≥ 1`. By isotropy,
`Σᵢ vᵢᵀ X vᵢ = tr X` for every `X` (Sp, Lemma 33.3.2, p. 265), so
`Σᵢ U_A(vᵢ) = tr M_U²/(Φ^u − Φ^{u+δ_U}) + Φ^{u+δ_U}(A) ≤ 1/δ_U + Φ^u(A) ≤ 1/δ_U + ε_U`, using
`Σ (u − λᵢ)⁻¹(u + δ_U − λᵢ)⁻¹ ≥ Σ (u + δ_U − λᵢ)⁻²`; and `Σᵢ L_A(vᵢ) ≥ 1/δ_L − Φ_l(A) ≥ 1/δ_L − ε_L`
by BSS Claim 3.6 (a Cauchy–Schwarz estimate in the eigenvalues). The claim needs
`1/δ_L − Φ_l(A) ≥ 0` and `λᵢ − l > δ_L` for every eigenvalue `λᵢ` of `A`; both follow from
`Φ_l(A) ≤ ε_L ≤ 1/δ_L − 1/δ_U − ε_U < 1/δ_L`, where the last step uses `δ_U > 0` and
`ε_U ≥ Φ^u(A) > 0`, since each term of `Φ_l(A)` is then below `1/δ_L`.
Zero vectors contribute `0` to both sums, and some `vᵢ` is nonzero, so some nonzero `vᵢ` has
`L_A(vᵢ) ≥ U_A(vᵢ) > 0`. Take `t = 1/U_A(vᵢ)`: 3.2 moves the upper barrier, and 3.3 moves the
lower one, its hypothesis `Φ_l(A) ≤ 1/δ_L` following from `ε_L ≤ 1/δ_L − 1/δ_U − ε_U`.

**Checks.**
- `m` nonempty is needed: with `n` and `m` both empty, `Σᵢ vᵢ vᵢᵀ = I` holds and no index exists.
- `δ_U > 0` is needed: `n = m = 1`, `v₁ = 1`, `A = 0`, `u = 1`, `l = −1`, `ε_U = ε_L = 1`,
  `δ_U = −1`, `δ_L = 1/2` satisfy every other hypothesis, but `(u + δ_U) − t = −t < 0`.

*Needs:* 3.2, 3.3; Mathlib `Matrix.trace_mul_comm`, `Matrix.IsHermitian.trace_eq_sum_eigenvalues`.

### 3.5 Linear-size reweighting of vectors in isotropic position

Prove `exists_sparse_weights_isotropic`: if `v : m → n → ℝ` satisfies `Σᵢ vᵢ vᵢᵀ = I` and
`d > 1`, there are `sᵢ ≥ 0`, at most `⌈d n⌉` of them nonzero, with
`I ⪯ Σᵢ sᵢ vᵢ vᵢᵀ ⪯ κ_d I` (BSS, Theorem 3.1, p. 5, with its proof, p. 15; Sp, Theorem 33.3.1,
p. 265, in the parameter `ε = 1/√d`). BSS state the count as at most `dn` and run `dn` steps;
for `dn` not an integer their proof gives `⌈dn⌉`, the count stated here and in Sp.

Route. If `n = 0`, take `s = 0`. Otherwise `m` is nonempty. Put `δ_L = 1`, `ε_L = 1/√d`,
`δ_U = (√d + 1)/(√d − 1)`, `ε_U = (√d − 1)/(d + √d)`, `l₀ = −n√d` and `u₀ = n/ε_U`; then
`1/δ_U + ε_U = 1 − 1/√d = 1/δ_L − ε_L`, `Φ^{u₀}(0) = ε_U` and `Φ_{l₀}(0) = ε_L`. Starting from
`A₀ = 0`, apply 3.4 `Q = ⌈dn⌉` times, each time adding `t vᵢ vᵢᵀ` and moving `u` by `δ_U` and `l`
by `δ_L`. After `Q` steps `l_Q I ≺ A_Q ≺ u_Q I` with `l_Q = Q − n√d ≥ n(d − √d) > 0`, and
`u_Q/l_Q ≤ κ_d` because `q ↦ (u₀ + q δ_U)/(l₀ + q)` decreases for `q > n√d` and equals `κ_d` at
`q = dn`. Let `sᵢ` be the sum of the `t` added for `vᵢ`, divided by `l_Q`; at most `Q` indices
carry a nonzero weight.

**Checks.**
- `κ_4 = 9` and `κ_9 = 4`; `κ_d = 1 + 4/√d + O(1/d)`.
- With `d = 1/ε²` and `0 < ε < 1`, multiplying the weights by `(1 − ε)²` gives
  `(1 − ε)² I ⪯ Σ sᵢ vᵢ vᵢᵀ ⪯ (1 + ε)² I` with at most `⌈n/ε²⌉` nonzero weights, the form of Sp,
  Theorem 33.3.1, since `κ_d = ((1 + ε)/(1 − ε))²`. That form, which Sp states for every
  `ε > 0`, fails for `n = 2` and `ε = 2`: the count `⌈2/4⌉ = 1` allows one vector, and
  `I ⪯ c v vᵀ` fails for every rank-one matrix.
- `d > 1` is needed: for `d = 1/2`, `n = m = 2` and the standard basis, one nonzero weight gives a
  sum of rank `1`, never `⪰ I`; for `d = 1` the ratio has denominator `0`, so `κ_1 = 0` in Lean
  and `I ⪯ 0` fails.
- The parameters of the route at `d = 4`, `n = 1`: `ε_L = 1/2`, `δ_U = 3`, `ε_U = 1/6`,
  `l₀ = −2`, `u₀ = 6`, and after `Q = 4` steps `u_4/l_4 = 18/2 = 9 = κ_4`.

*Needs:* 3.4; Mathlib `Nat.ceil`, `Matrix.le_iff`.

### 3.6 Twice-Ramanujan sparsifiers of networks

Prove `exists_sparse_reweight`: for every network `N` on `n` vertices and every `d > 1` there is
`s : Sym2 V → ℝ≥0` with at most `⌈d(n − 1)⌉` nonzero values and
`L_N ⪯ L_{N.reweight s} ⪯ κ_d L_N` (BSS, Theorem 1.1, p. 2, with its proof, pp. 5–6; Sp, §33.2,
pp. 264–265). BSS assume connectivity without loss of generality; the route below needs none.

Route. If `n = 0`, take `s = 0`. Let `r` be the rank of `L_N`; since `L_N 𝟙 = 0`, `r ≤ n − 1`.
Let `U` be the `n × r` matrix of orthonormal eigenvectors of `L_N` for its positive eigenvalues
(Mathlib `Matrix.IsHermitian.eigenvectorBasis`) and `D` the diagonal of those eigenvalues. For
`e = s(x, y)` put `w_e = √c(x, y) D^(−1/2) Uᵀ (δ_x − δ_y)`, a vector in `ℝʳ`; then
`Σ_e w_e w_eᵀ = D^(−1/2) Uᵀ L_N U D^(−1/2) = I`. Apply 3.5 in dimension `r` to the family
`(w_e)` indexed by `Sym2 V`, and take the weights as elements of `ℝ≥0`. For `x ∈ ℝ^V` write
`x = U D^(−1/2) y + k` with `L_N k = 0`. Each `δ_x − δ_y` with `c(x, y) > 0` is orthogonal to the
kernel of `L_N` (1.1), so `xᵀ L_N x = yᵀ y` and `xᵀ L_{N.reweight s} x = yᵀ (Σ_e s_e w_e w_eᵀ) y`,
and the two inequalities of 3.5 become the claim. The count is at most `⌈d r⌉ ≤ ⌈d(n − 1)⌉`.

**Checks.**
- Rescaling by `2/(1 + κ_d)` turns the conclusion into an `ε`-approximation in the sense of 1.1
  with `ε = (κ_d − 1)/(κ_d + 1) = 2√d/(d + 1)`: `4/5` for `d = 4` and `3/5` for `d = 9`.
- `d > 1` is needed: for `K₃` and `d = 1/2` the count allows one pair, whose Laplacian has rank
  `1 < 2`, so `L_{K₃} ⪯ L_H` fails.

*Needs:* 1.1, 3.5; Mathlib `Matrix.IsHermitian.eigenvectorBasis`, `Matrix.rank`.

### Examples

The diagonal matrices `diag(0, 1)` and `diag(1, 10)` for the barrier shifts; the three columns of
the `2 × 3` matrix with rows `(1, 2, 2)/3` and `(2, 1, −2)/3`, an isotropic family in `ℝ²`; `K₃`
for the graph form.

### Dependencies

Layer 1 (for 3.6); Tau Ceti `Matrix.inv_add_vecMulVec`, `Matrix.isUnit_add_vecMulVec_iff`;
Mathlib `Matrix.PosDef`, `Matrix.trace_mul_comm`, `Matrix.IsHermitian.trace_eq_sum_eigenvalues`,
`Matrix.IsHermitian.eigenvectorBasis`, `Nat.ceil`.

## Scope and ownership

This roadmap owns the targets stated above: `ε`-approximation of networks and its preservation of
cuts and effective resistances, effective resistance through an arbitrary grounding, the sampling
theorem with the constants of the Bernstein route, the barrier potentials with the upper, lower
and joint barrier shifts, and the two Batson–Spielman–Srivastava theorems.

Already in the libraries and therefore not targets: the Sherman–Morrison formula (Tau Ceti
`Matrix.inv_add_vecMulVec`; Mathlib's Woodbury identity `Matrix.add_mul_mul_inv_eq_sub`); the
Loewner order and positive definiteness of matrices; and the comparison of sorted eigenvalues
under the Loewner order (Tau Ceti `LinearMap.IsSymmetric.eigenvalue_mono`), which for
`0 ≤ ε ≤ 1` turns an `ε`-approximation into `(1 − ε) λᵢ(L_N) ≤ λᵢ(L_H) ≤ (1 + ε) λᵢ(L_N)` for the
sorted eigenvalues (Sp, Lemma 6.2.1, p. 54).

Supplied by other roadmaps and not restated:

- ElectricalNetworksAndRandomWalks owns networks, Laplacians, voltages and effective resistance
  (1.1, 2.1; copied verbatim above), the Dirichlet problem (1.2), Dirichlet's principle (2.2),
  positivity of resistance (2.5) and Foster's theorem (3.3), all consumed as stated. Its scope
  section lists spectral bounds on effective resistance as outside it; 1.3 above compares the
  resistances of two networks and is no spectral bound.
- RandomMatrices 2.6 owns the matrix Bernstein inequality `matrix_bernstein`, consumed in 2.2.
  Its matrix Chernoff inequality is not used.

Not treated here: the sorted Laplacian eigenvalues of graphs and their bounds (no statement above
is about them); the weighted Laplacian as an object of study, with its quadratic form, its
kernel and its normalized spectra, of which the routes above use only the quadratic form identity
of 1.1 and its description of the vectors where the form vanishes, as steps; and cut weights,
normalized cuts and conductance of weighted graphs as objects of study (1.2 compares the cut
weights of two networks and defines none).

Outside the scope: algorithms and running times of every kind; sampling with replacement and
approximate effective resistances (the setting of SS); cut sparsifiers; sparsifiers of directed
graphs; lower bounds on the quality of sparsifiers of complete graphs (BSS, §4); the extension of
3.5 to sums of positive semidefinite matrices; unweighted sparsifiers and the Kadison–Singer
problem.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Matrix/Order.lean`: the Loewner order on square matrices over `ℝ` or `ℂ`,
  scoped to `MatrixOrder`; `Matrix.le_iff` (`A ≤ B ↔ (B − A).PosSemidef`).
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosSemidef`, `Matrix.PosDef`,
  `Matrix.PosDef.inv` (the inverse of a positive definite matrix is positive definite),
  `Matrix.PosSemidef.mul_mul_conjTranspose_same` (congruence preserves positive
  semidefiniteness), `Matrix.IsUnit.posSemidef_star_left_conjugate_iff` and
  `Matrix.IsUnit.posDef_star_left_conjugate_iff` (congruence by an invertible matrix reflects
  both).
- `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.mul_nonsing_inv`
  (`A * A⁻¹ = 1` for invertible `A`), `Matrix.nonsing_inv_apply_not_isUnit` (`A⁻¹ = 0` when the
  determinant is not a unit), `Matrix.add_mul_mul_inv_eq_sub` (Woodbury).
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.vecMulVec`. `Matrix.trace`, `Matrix.trace_mul_comm`,
  `Matrix.rank`, `Matrix.reindex`.
- `Mathlib/Analysis/Matrix/Spectrum.lean`: `Matrix.IsHermitian.eigenvectorBasis`,
  `Matrix.IsHermitian.trace_eq_sum_eigenvalues` (the trace is the sum of the eigenvalues).
- `Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.lean`: `CFC.sqrt`,
  the square root of a positive semidefinite matrix.
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun`,
  `ProbabilityTheory.iIndepFun.comp` (functions of independent variables are independent).
  `ProbabilityTheory.iIndepFun.precomp` (independence survives reindexing along an injection).
  `Mathlib/MeasureTheory/Measure/Real.lean`: `MeasureTheory.measureReal_mono`,
  `MeasureTheory.measureReal_union_le`.
- `Mathlib/MeasureTheory/Integral/Bochner/ContinuousLinearMap.lean`: `integral_ofReal` (the
  integral commutes with `ℝ → ℂ`). `Mathlib/Data/Matrix/Basic.lean`: `RingHom.mapMatrix`;
  `Complex.ofRealHom`.
- `Mathlib/Analysis/CStarAlgebra/Matrix.lean`: the L2 operator norm and C*-algebra structure on
  complex matrices (scoped to `Matrix.Norms.L2Operator`), `Matrix.l2_opNorm_mulVec`.
  `Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Unital.lean`:
  `le_algebraMap_iff_spectrum_le`, `algebraMap_le_iff_le_spectrum` (order against scalars through
  the spectrum). `Mathlib/Analysis/CStarAlgebra/Spectrum.lean`:
  `IsSelfAdjoint.mem_spectrum_eq_re` (the spectrum of a self-adjoint element is real) and
  `IsSelfAdjoint.spectralRadius_eq_nnnorm`.
- `Sym2`, `Sym2.IsDiag`, `Nat.ceil`, `NNReal`.

### From Tau Ceti

- `TauCeti/LinearAlgebra/Matrix/SchurComplement.lean`: `Matrix.inv_add_vecMulVec` (Sherman–Morrison
  over a commutative ring: for invertible `A` with `1 + vᵀ A⁻¹ u` a unit,
  `(A + u vᵀ)⁻¹ = A⁻¹ − (1 + vᵀ A⁻¹ u)⁻¹ (A⁻¹ u)(vᵀ A⁻¹)`) and `Matrix.isUnit_add_vecMulVec_iff`
  (the update is invertible exactly when that denominator is a unit).
- `TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`: `LinearMap.IsSymmetric.eigenvalue_mono`
  (Loewner-ordered symmetric operators have ordered sorted eigenvalues), named in the scope
  section.

### From TauCetiRoadmap.ElectricalNetworksAndRandomWalks

- 1.1: the structure `Network` (fields `cond`, `symm`, `nonneg`), `Network.weight` and
  `Network.graph`, copied verbatim.
- 2.1: `Network.laplacian`, `Network.groundedLaplacian`, `Network.voltage` and
  `Network.effResistance`, copied verbatim.
- 1.2: `existsUnique_isHarmonicAt` (on a connected network, every function on a nonempty set `B`
  has exactly one extension harmonic outside `B`), used in 2.1.
- 2.1: `effResistance_eq_div` (on a connected network, for `W` harmonic outside `{a, z}` with
  `W a ≠ W z`, `R(a ↔ z) = (W a − W z)/Σ_y c(a, y)(W a − W y)`), used in 2.1.
- 2.2: `isLeast_dirichletEnergy` (on a connected network, for `a ≠ z`, `1/R(a ↔ z)` is the least
  Dirichlet energy of a function equal to `1` at `a` and `0` at `z`), used in 1.3.
- 2.5: `effResistance_pos` (on a connected network, `R(a ↔ z) > 0` for `a ≠ z`), used in 1.3
  and 2.2.
- 3.3: `sum_cond_mul_effResistance` (Foster: on a connected network the double sum of
  `c(x, y) R(x ↔ y)` is `2(n − 1)`), used in 2.2.

### From TauCetiRoadmap.RandomMatrices

- 2.6: `matrix_bernstein` (for independent measurable random Hermitian `d × d` complex matrices
  `Xₖ` with entrywise mean `0` and `‖Xₖ‖ ≤ L` everywhere in the Euclidean operator norm, and
  `t > 0`, `P(t ≤ ‖Σₖ Xₖ‖) ≤ 2d exp(−(t²/2)/(v + Lt/3))` with `v = ‖Σₖ E Xₖ²‖`), used in 2.2.

## References

- Daniel A. Spielman, *Spectral and Algebraic Graph Theory*, incomplete draft dated April 2, 2025,
  on the author's Yale page (`cs-www.cs.yale.edu/homes/spielman/sagt/`). Locators are to the
  printed pages of that file: §6.2 and Lemma 6.2.1 (p. 54); §12.1 (pp. 111–112), §12.2
  (pp. 112–113), Theorem 12.3.1 with its proof (pp. 113–114); §32.2 (pp. 258–259), Theorem 32.3.1
  (p. 259), §32.4 (p. 260), §32.5 (pp. 260–261), §32.6 (pp. 262–263); §33.2 (pp. 264–265),
  Theorem 33.3.1 and Lemma 33.3.2 (p. 265), Theorem 33.4.1 (p. 266), §33.5 (pp. 266–268),
  Lemmas 33.6.1 and 33.6.2 (p. 269), Lemmas 33.7.1 and 33.7.2 (pp. 269–270).
- Joshua Batson, Daniel A. Spielman and Nikhil Srivastava, "Twice-Ramanujan Sparsifiers",
  arXiv:0808.0163v3: Theorem 1.1 (p. 2), Lemma 2.1 (p. 5), Theorem 3.1 (p. 5) and the proof of
  Theorem 1.1 (pp. 5–6), Definition 3.2 (p. 9), Lemmas 3.3 and 3.4 (pp. 11–12), Lemma 3.5
  (pp. 12–13), Claim 3.6 (p. 14), the proof of Theorem 3.1 (p. 15), §4.
- Daniel A. Spielman and Nikhil Srivastava, "Graph Sparsification by Effective Resistances",
  arXiv:0803.0929v4: Theorem 1 (p. 2), cited for attribution.
