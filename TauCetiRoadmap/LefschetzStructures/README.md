# Roadmap: Lefschetz structures and algebraic operators on cohomology

**Summary.** Build the linear algebra of Lefschetz structures and the theory of algebraic
operators on them, then compare it with the cohomology of varieties. Layer 0: a finite-dimensional
graded vector space `H = ⊕_{i ≤ 2n} H^i` with a degree-`2` operator `L` satisfying hard
Lefschetz; the Lefschetz inverse `Λ`, the `𝔰𝔩₂` triple `(L, h, f)` and their comparison, the grade
projectors and compatible pairings. The primitive decomposition and the pairing theory are
consumed from DeligneWeightsAndPurity §9.7, and `𝔰𝔩₂` representation theory from
LieHighestWeight. Layer 1: a ring `𝒜` of « algebraic » endomorphisms and a space `A` of
« algebraic » classes over a subfield `F`, and proved implications between explicit properties:
algebraic inverses of the `L^{n−i}` make every grade projector and `Λ` algebraic; the
Cayley–Hamilton criterion for such inverses; an algebraic `Λ` and positivity on algebraic
primitive classes give nondegeneracy of the pairing on algebraic classes. Layer 2: Lefschetz data
on MotivesAndAlgebraicCycles' minimal Weil cohomology theory, the Lefschetz and algebraic
structures on `H(X)` given by all graded correspondences, and the dictionary between Layer 1's
properties on `H(X)` and the predicates of MotivesAndAlgebraicCycles §7.3.

Research context, not a target: Grothendieck's standard conjectures assert such properties for
every smooth projective variety. They first appear in his letter to Serre of 27 August 1965
(Montpellier fonds, folder 14, p. 44); folder 16 (1966–67) works out the linear algebra of
Layers 0–1. This roadmap states no conjecture and owns no predicate on varieties.

Suggested homes: `TauCeti/LinearAlgebra/Lefschetz/` (Layers 0–1, mirroring Mathlib's
`Mathlib/Algebra/Lie/Sl2.lean` and `Mathlib/LinearAlgebra/`) and
`TauCeti/AlgebraicGeometry/WeilCohomology/` (Layer 2).

## Scope and ownership

**In scope.**

- the Lefschetz inverse `Λ` and the `𝔰𝔩₂` triple of a Lefschetz structure over a field of
  characteristic `0`, the comparison of `f` with `Λ`, the grade projectors and compatible
  pairings (Layer 0);
- algebraic structures on a Lefschetz structure and the conditional theorems between explicit
  algebraicity, positivity and nondegeneracy properties of such a structure (Layer 1);
- the Lefschetz extension of a minimal Weil cohomology theory, the Lefschetz and algebraic
  structures it puts on `H(X)`, and the comparison of Layer 1's properties on `H(X)` with
  MotivesAndAlgebraicCycles §7.3's predicates (Layer 2).

**Out of scope, with owner.**

- *The primitive decomposition, dimension differences and compatible pairings of a graded vector
  space with hard Lefschetz, over an arbitrary field*: DeligneWeightsAndPurity §9.7 (Primitive
  decomposition for a graded operator satisfying hard Lefschetz), `lefschetzDecomposition`,
  `lefschetzPairings`, `primitivePiece`, with its `ℕ → ℤ` grading extension identifying
  `P^j = primitivePiece 𝒱 L n (n − j)` for `0 ≤ j ≤ n`. The categorical form for finite-support
  graded Lefschetz objects in an abelian category is EtaleDualityAndPerverseSheaves §5.7 (Graded
  Lefschetz objects in an abelian category), `abstractPrimitiveDecomposition`, with
  `gradedLefschetz_vectorSpace_compat`; the two have one proof owner between them, and 0.2 here
  is an adapter.
- *Representations of `𝔰𝔩₂`* (weight strings, standard irreducibles, complete reducibility, on
  Mathlib's `IsSl2Triple`): [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md),
  Layer 0.
- *Hard Lefschetz and the Hodge–Riemann relations on compact Kähler manifolds*:
  [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md), K6.1. Named only in the last section.
- *Graded correspondences and their two actions, composition, graph, transpose and tensor; the
  minimal classical Weil cohomology theory and the cohomological action of correspondences;
  adequate and numerical relations, homological equivalence and the inclusion homological ⊆
  numerical*: MotivesAndAlgebraicCycles §§0.1–0.2 (Graded correspondences and their actions;
  Graphs, transpose, and tensor product), §0.5 (Adequate and numerical relations), §2.2 (Classical
  Weil cohomology) and §2.3 (Realizing pure motives and identifying homological quotients).
  Consumed by Layer 2 by name.
- *The standard-conjecture predicates on varieties (`A_H(X, η)`, `B_H(X)`, `C_ℚ,H(X)`,
  `D_ℚ,H(X)` and Hodge standard positivity), the implications between them, and their established
  cases*: MotivesAndAlgebraicCycles §7.3 (The standard conjectures with rational cycle
  representatives) and §7.4 (Established standard cases and point smash nilpotence). Layer 2.4
  compares Layer 1's properties with them; it neither restates nor re-proves them.
- *Chow groups, rational equivalence, proper pushforward, flat and graph pullback, intersection
  products on smooth varieties, and numerical equivalence on surfaces*:
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) Layer 5 (§§5.1–5.6, 5.10).
  Consumed through MotivesAndAlgebraicCycles, which builds correspondences on them; Layer 2 does
  not call them directly.
- *`ℓ`-adic cohomology, its cycle classes, Poincaré duality, weak and hard Lefschetz*:
  [EtaleCohomologyFoundations](../EtaleCohomologyFoundations/README.md) §F.5 (Exceptional inverse
  image and duality), §F.6 (Smooth purity, Gysin maps and cycle classes) and §F.7 (Projective
  bundles, blow-ups and weak Lefschetz), and DeligneWeightsAndPurity §9.6 (The hard Lefschetz
  theorem). Named only in the last section.
- *Hodge structures and polarizations*: [HodgeStructures](../../Completed/HodgeStructures/README.md).
  Named only in the last section.
- *Motives (pure motives, the motivic Galois group)*: MotivesAndAlgebraicCycles; not used here.

The boundary in one sentence: the decomposition is DeligneWeightsAndPurity's; the operators `Λ`,
`f`, the projectors and the theorems about algebraic operators on a Lefschetz structure are here;
varieties enter only in Layer 2, through MotivesAndAlgebraicCycles, whose predicates Layer 2.4
compares with Layer 1's; a specific cohomology theory is the last section's.

## Supplier contracts

- **Linear algebra (Mathlib).** `DirectSum.IsInternal`, `Submodule`, `Module.End` with its Lie
  algebra structure, `LinearMap.restrict`, `LinearMap.charpoly` and `LinearMap.aeval_self_charpoly`
  (Cayley–Hamilton), `LinearMap.BilinForm` with `Nondegenerate`, `Module.finrank`.
- **`𝔰𝔩₂` (Mathlib, `Mathlib/Algebra/Lie/Sl2.lean`).** `IsSl2Triple h e f` has `⁅e, f⁆ = h`,
  `⁅h, e⁆ = 2 • e`, `⁅h, f⁆ = −(2 • f)`; its primitive vectors (`IsSl2Triple.HasPrimitiveVectorWith`)
  are killed by `e`, and `IsSl2Triple.HasPrimitiveVectorWith.lie_e_pow_succ_toEnd_f` computes
  `⁅e, f^{k+1} m⁆ = (k+1)(μ − k) f^k m`. Here `L` raises degree and primitive classes are killed
  by `f`, so the contract is applied to `IsSl2Triple.symm`, the triple `(−h, f, L)`: a nonzero
  `x ∈ P^j` is a primitive vector for it of weight `μ = n − j`, and the lemma gives
  `f(L^{k+1} x) = (k+1)(n − j − k) L^k x`.
- **Primitive decomposition and pairings.** DeligneWeightsAndPurity §9.7, as above.
- **Cycles.** Mathlib's `AlgebraicCycle X R` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`);
  Tau Ceti's Cartier divisors (`TauCeti/AlgebraicGeometry/CartierDivisor/`) with their Weil
  comparison. Chow groups and intersection products: SchemeAndStackFoundations Layer 5.

## Conventions

- `K` is a field of characteristic `0` (the coefficient field), `F ⊆ K` a subfield (`ℚ` in the
  geometric case). `H` is a finite-dimensional `K`-vector space.
- Lefschetz structure of weight `2n`: a grading `H = ⊕_{i ∈ ℕ} H^i` (`DirectSum.IsInternal`) with
  `H^i = 0` for `i > 2n`, and `L ∈ End_K H` with `L(H^i) ⊆ H^{i+2}` such that
  `L^{n−i} : H^i → H^{2n−i}` is bijective for `i ≤ n` (hard Lefschetz).
- Primitive part: `P^i = H^i ∩ ker L^{n−i+1}` for `i ≤ n`, and `P^i = 0` for `i > n`
  (DeligneWeightsAndPurity §9.7's `primitivePiece 𝒱 L n (n − i)`). Every statement quantifying
  over primitive sources `P^j` takes `j ≤ n`. Degrees are natural numbers, and every natural
  subtraction in a degree or an exponent is guarded (`i ≤ n`, `2i ≤ n`, `d ≤ a`); a map lowering
  degree by `d` sends `H^a` to `0` for `a < d` (`LowersDegreeBy`).
- The Lefschetz inverse `Λ` (Kleiman's normalization; the « pseudo-inverse » of Grothendieck's
  folder 16): the unique `Λ` with `Λ(L^{k+1} x) = L^k x` and `Λ x = 0` for `x ∈ P^j`,
  `j + 2k + 2 ≤ 2n − j`. It is not the `𝔰𝔩₂` lowering operator.
- The `𝔰𝔩₂` triple: `h` acts on `H^i` by `i − n`; `f` is the unique operator with `⁅L, f⁆ = h`,
  `⁅h, f⁆ = −2f`. With `e = L` it is Mathlib's `IsSl2Triple h L f` whenever `h ≠ 0`.
- Pairings: a bilinear form `⟨−,−⟩` on `H` is compatible if `⟨H^i, H^j⟩ = 0` unless `i + j = 2n`
  and `⟨L x, y⟩ = ⟨x, L y⟩`; a Poincaré pairing is moreover nondegenerate and
  `(−1)^i`-symmetric (`⟨y, x⟩ = (−1)^i ⟨x, y⟩` for `x ∈ H^i`).
- Algebraic structure on a Lefschetz structure: a subring `𝒜 ⊆ End_K H` with `L ∈ 𝒜`, stable
  under multiplication by `F`; and `F`-subspaces `A^i ⊆ H^{2i}` (algebraic classes) with
  `L(A^i) ⊆ A^{i+1}` and `g(A^i) ⊆ A = ⊕ A^j` for every `g ∈ 𝒜`.
- Positivity is rational-valued: `(−1)^i ⟨L^{n−2i} x, x⟩` is the image of a positive rational
  number; no order on `K` is used.
- Weil cohomology theory with Lefschetz data: MotivesAndAlgebraicCycles §2.2's minimal classical
  Weil theory `H` over an algebraically closed field `k`, together with weak Lefschetz for a smooth
  hyperplane section and hard Lefschetz for an ample class. Hard Lefschetz is data added here, not
  a Weil axiom, as in MotivesAndAlgebraicCycles §7.3.
- The geometric structures for `X` of dimension `d` with an ample rational class `ξ`:
  `𝒜(X) :=` the image in `End H(X)` of *all* graded correspondences `Corr^*(X, X)` (all degrees,
  MotivesAndAlgebraicCycles §0.1), acting by §2.3 there; `A^i(X) :=` the rational image of
  `CH^i(X)` under the cycle class. Taking only `CH^d(X × X)_ℚ`, the degree-zero correspondences,
  would give a ring containing neither `L = Δ_*ξ` (degree `1`) nor `Λ` (degree `−1`).

## Layer 0: Lefschetz structures

### 0.1 Lefschetz structures, primitive parts and grade projectors

Define `LefschetzStructure K H n` with its grade submodules and `L`, the primitive parts
`LefschetzStructure.primitive`, and the predicates `IsGradeProjector` (the projector onto `H^i`
along the other pieces) and `LowersDegreeBy`. Prove that the grade projector of each degree exists
and is unique. *Needs:* Mathlib (`DirectSum.IsInternal`).

**Checks.**

- `K[ξ]/(ξ^{n+1})` (`ξ^j` in degree `2j`, `L = ξ ·`) is a Lefschetz structure of weight `2n`, with
  `P⁰ = K` and `P^i = 0` for `i > 0`.
- A graded `H` with `L^n ≠ 0` on `H⁰` need not satisfy hard Lefschetz in other degrees: with
  `n = 2`, `H = Ke₀ ⊕ Ke₁ ⊕ Ke₂ ⊕ Ke₄`, `L e₀ = e₂`, `L e₂ = e₄`, `L e₁ = 0`, the map
  `L² : H⁰ → H⁴` is bijective but `L : H¹ → H³ = 0` is not.
- With `n = 1` and `H = Ke₀ ⊕ Ke₂`, `L e₀ = e₂`: `P² = 0`, whereas `H² ∩ ker L^{n−2+1}` read with
  natural subtraction would be `H²`.
- Odd degrees: for finite-dimensional `V`, `W`, an alternating form `φ` on `V` and a symmetric
  form `Q` on `W`, let `H = K ⊕ V ⊕ (Kξ ⊕ W) ⊕ V̌ ⊕ Kξ²` in degrees `0, …, 4`, with `L c = cξ` on
  `H⁰`, `L x = φ(·, x)` on `H¹`, `L(cξ + w) = cξ²` on `H²` and `L = 0` in degrees `3, 4`
  (multiplication by `ξ` in an order-2 « Hodge algebra » of folder 16, pp. 24–28). It is a
  Lefschetz structure of weight `4` iff `φ` is nondegenerate, and then `P² = W`. Unlike
  `K[ξ]/(ξ^{n+1})`, this tests hard Lefschetz in odd degree.
- On `K[ξ]/(ξ^{n+1})`, `π_{2j}` fixes `ξ^j` and kills the other `ξ^m`. `π_0` satisfies
  `LowersDegreeBy 0` but not `LowersDegreeBy 2`, which would force `π_0 1 = 0`.

### 0.2 Primitive decomposition

`grade_eq_iSup_primitive`: `H^i = ⊕_{k ≥ 0, i − 2k ≥ 0, i − 2k ≤ n} L^k P^{i−2k}`, and
`L^k : P^j → H^{j+2k}` injective for `j + k ≤ n`: the adapter from this roadmap's `ℕ`-graded
`LefschetzStructure` to DeligneWeightsAndPurity §9.7's `lefschetzDecomposition`, through its
grading extension. No second proof. *Needs:* 0.1; DeligneWeightsAndPurity §9.7
(`lefschetzDecomposition`, `primitivePiece` and the grading extension), with
EtaleDualityAndPerverseSheaves §5.7 (`gradedLefschetz_vectorSpace_compat`).

**Checks.**

- On `K[ξ]/(ξ³)` with `n = 2`, `H⁴ = L² P⁰`; on the odd-degree example of 0.1,
  `H² = L P⁰ ⊕ P² = Kξ ⊕ W`.
- On the two-dimensional example of 0.1 with `n = 1`, `H² = L P⁰` and the summand `P²` is absent.

### 0.3 The Lefschetz inverse

Define `IsLefschetzInverse`. Prove existence and uniqueness of `Λ`
(`existsUnique_isLefschetzInverse`), that `Λ` satisfies `LowersDegreeBy 2`, `Λ L = 1` on `H^i`
for `i < n` and `L Λ = 1` on `H^i` for `i > n`, and for `i ≤ n` that `Λ^{n−i}` is a two-sided
inverse of `L^{n−i}` between `H^i` and `H^{2n−i}`: `lambda_pow_L_pow` (`Λ^{n−i} L^{n−i} = 1` on
`H^i`) and `L_pow_lambda_pow` (`L^{n−i} Λ^{n−i} = 1` on `H^{2n−i}`). *Needs:* 0.2.

**Checks.**

- On `ℚ[ξ]/(ξ³)` with `n = 2`, `Λ L² 1 = ξ` while `Λ² L² 1 = 1`: it is `Λ^{n−i}`, not `Λ`, that
  inverts `L^{n−i}`.
- With `n = 1` and `H = ℚe₀ ⊕ ℚe₂`, `L e₀ = e₂`, the convention `P² = 0` is what makes `Λ` exist:
  with `P² = H²` the two clauses would ask `Λ e₂ = 0` and `Λ e₂ = e₀`.
- On the odd-degree example of 0.1, `Λ` kills `H⁰`, `H¹` and `W`, sends `ξ` to `1` and `ξ²` to
  `ξ`, and maps `H³` to `H¹` by the inverse of `x ↦ φ(·, x)`.

### 0.4 The `𝔰𝔩₂` triple

Define `IsWeightOperator`. Prove existence and uniqueness of the triple `(L, h, f)` built from the
Lefschetz data (`exists_sl2`), and the formula `f(L^{k+1} x) = (k+1)(n − j − k) L^k x` for
`x ∈ P^j`, through Mathlib's `lie_e_pow_succ_toEnd_f` applied to `IsSl2Triple.symm` as in the
supplier contracts. Its representation theory is LieHighestWeight's. *Needs:* 0.2; Mathlib
(`IsSl2Triple`); LieHighestWeight Layer 0.

**Checks.**

- On a nonzero primitive `x ∈ P^j`, `f L x = (n − j) x` while `Λ L x = x`, so `f ≠ Λ` as soon as
  `n − j ≥ 2`; on `ℚ[ξ]/(ξ³)`, `f ξ = 2` and `f ξ² = 2ξ`, while `Λ ξ = 1` and `Λ ξ² = ξ`.
- `h = 0` exactly when `H = H^n`; then `(h, L, f)` is not an `IsSl2Triple`, whose `h` is nonzero.

### 0.5 Compatible and Poincaré pairings

Define `IsCompatiblePairing` and Poincaré pairings as in the conventions. Through the adapter of
0.2, consume DeligneWeightsAndPurity §9.7's `lefschetzPairings`: for a Poincaré pairing the
decomposition of `H^i` is orthogonal for `(x, y) ↦ ⟨L^{n−i} x, y⟩`, which is nondegenerate on
`H^i` and on `P^i`. Prove that the orthogonality uses only compatibility. *Needs:* 0.2;
DeligneWeightsAndPurity §9.7 (`lefschetzPairings`).

**Checks.**

- On the odd-degree example of 0.1, `⟨c, dξ²⟩ = cd`, `⟨x, u⟩ = u(x)`,
  `⟨cξ + w, c'ξ + w'⟩ = cc' + Q(w, w')`, extended `(−1)^i`-symmetrically, is compatible, and is a
  Poincaré pairing iff `Q` is nondegenerate.
- `Λ` is not the adjoint of `L`: with `n = 1`, `⟨e₀, e₂⟩ = 1`, `⟨L e₀, e₀⟩ = 1` but
  `⟨e₀, Λ e₀⟩ = 0`.

## Layer 1: algebraic structures and the conditional theorems

### 1.1 Algebraic structures and their properties

Define `AlgebraicStructure` (`F`, `𝒜`, `A`, with `A_stable`: every `g ∈ 𝒜` maps `A^i` into
`⊕ A^j`) and, for a bilinear form `⟨−,−⟩`, the properties

- `LambdaAlgebraic`: `Λ ∈ 𝒜`;
- `ProjectorsAlgebraic`: every grade projector `π_i` lies in `𝒜`;
- `PositiveOnAlgebraicPrimitive`: for `2i ≤ n` and nonzero `x ∈ A^i ∩ P^{2i}`,
  `(−1)^i ⟨L^{n−2i} x, x⟩` is a positive rational number;
- `PairingNondegenerateOnAlgebraic`: for `i ≤ n`, every nonzero `x ∈ A^i` has some `y ∈ A^{n−i}`
  with `⟨x, y⟩ ≠ 0`.

*Needs:* 0.1, 0.3.

**Checks.**

- If `H` is concentrated in even degrees, `(End_K H, A^i = H^{2i})` with `F = K` is an algebraic
  structure with `LambdaAlgebraic` and `ProjectorsAlgebraic`; with odd degrees present, `A_stable`
  fails for it. On `F[ξ]/(ξ^{n+1})`, `(F[L], Fξ^i)` is an algebraic structure.
- `A_stable` constrains `𝒜`: with `F = ℚ`, `K = ℚ(√2)`, `H = K[ξ]/(ξ²)` and `A^i = ℚξ^i`,
  `𝒜 = End_K H` is excluded, since `√2 · 1 ∉ A`.
- Negative control on `ℚ[ξ]/(ξ²)` (`n = 1`, `𝒜 = End_ℚ H`, `A^0 = ℚ`, `A^1 = ℚξ`): the pairing
  with `⟨1, ξ⟩ = ⟨ξ, 1⟩ = 1`, `⟨1, 1⟩ = ⟨ξ, ξ⟩ = 0` has all four properties; changing it to
  `⟨1, ξ⟩ = ⟨ξ, 1⟩ = −1` keeps it a compatible Poincaré pairing and keeps `LambdaAlgebraic`,
  `ProjectorsAlgebraic` and `PairingNondegenerateOnAlgebraic`, and breaks only
  `PositiveOnAlgebraicPrimitive` (`⟨L 1, 1⟩ = −1`).

### 1.2 Algebraic inverses of `L^{n−i}` give algebraic projectors and an algebraic `Λ`

`projectorsAlgebraic_of_inverses` and `lambdaAlgebraic_of_inverses`: suppose that for each `i ≤ n`
there is `w_i ∈ 𝒜`, homogeneous of degree `−2(n − i)` (`LowersDegreeBy (2(n − i))`), with
`w_i L^{n−i} = 1` on `H^i` and `L^{n−i} w_i = 1` on `H^{2n−i}`. Then every grade projector lies
in `𝒜` (by descending induction on `i`, using only that `𝒜` is a ring containing `L`, not `F`),
every projector `p_{j,β}` onto `L^β P^j` lies in `𝒜`, and so does `Λ`, which is the explicit sum
`Σ_j Σ_{β < n−j} L^β w_j L^{n−j−β−1} p_{j,β+1}`. `projectorsAlgebraic_of_lambdaAlgebraic`: if
`Λ ∈ 𝒜`, take `w_i = Λ^{n−i}` (0.3). *Needs:* 0.2, 0.3, 1.1. (Source: Grothendieck's folder 16,
pp. 4–12, no. 6, criterion `(6.3)_i`; Kleiman 1994, Theorem 4.1, pp. 14–15.)

**Checks.**

- In a Lefschetz structure the two inverse conditions imply each other, since `L^{n−i}` is
  bijective between `H^i` and `H^{2n−i}` and `w_i` maps `H^{2n−i}` to `H^i`; in a ring with
  grading idempotents and no module, as in the source, both are hypotheses.
- On `ℚ[ξ]/(ξ³)` with `n = 2`, `w_0 = Λ²`, `w_1 = Λ` and `w_2 = 1` qualify; `w_0 = Λ` fails
  `w_0 L² = 1` on `H⁰`.
- On `K[ξ]/(ξ^{n+1})`, `n ≥ 1`, with `𝒜 = F[L]` (1.5), no `w_0` exists in `𝒜`, and indeed
  `π_0 ∉ 𝒜`.

### 1.3 The Cayley–Hamilton criterion

`inv_mem_of_charpoly`: if the characteristic polynomial of every element of `𝒜` has coefficients
in `F`, the inverse of an invertible element of `𝒜` lies in `𝒜`.
`exists_inverse_L_pow_of_charpoly`, the source's statement: fix `i ≤ n`; if for every `g ∈ 𝒜`
with `g(H^i) ⊆ H^i` the characteristic polynomial of `g|_{H^i}` has coefficients in `F`, and some
`u ∈ 𝒜` is bijective from `H^{2n−i}` onto `H^i` (not necessarily inverse to `L^{n−i}`), then some
`w ∈ 𝒜` mapping `H^{2n−i}` to `H^i` is an inverse of `L^{n−i} : H^i → H^{2n−i}` (`w L^{n−i} = 1` on
`H^i`, `L^{n−i} w = 1` on `H^{2n−i}`). The conclusion is an algebraic inverse of `L^{n−i}`, not
`Λ ∈ 𝒜`, and `w` need not be homogeneous on the other degrees. `lambdaAlgebraic_of_charpoly`:
under the extra hypothesis `ProjectorsAlgebraic`, the elements `π_i w π_{2n−i}` satisfy the
hypotheses of 1.2, so `Λ ∈ 𝒜`. *Needs:* 1.1, 1.2. (Source: Grothendieck's folder 16,
pp. 47–48.)

**Checks.**

- On `ℚ[ξ]/(ξ³)` with `n = 2`, `i = 0`, `𝒜 = End_ℚ H` and `u = 2Λ²`: `u L²` restricted to `H⁰` is
  multiplication by `2`, with characteristic polynomial `T − 2`; Cayley–Hamilton inverts it as
  `½`, and `w = ½ u = Λ²` on `H⁴`. `Λ` itself maps `H⁴` to `H²`.

### 1.4 Algebraic `Λ` and positivity give nondegeneracy

`pairingNondegenerate_of_lambdaAlgebraic_of_positive`: for a compatible pairing (0.5), if
`Λ ∈ 𝒜` and `PositiveOnAlgebraicPrimitive` holds, then `PairingNondegenerateOnAlgebraic` holds.
Proof: the projectors of the primitive decomposition lie in `𝒜` (1.2), so by `A_stable` the
decomposition restricts to `A`; it is orthogonal (0.5); and the form is anisotropic on each
algebraic primitive piece. Nondegeneracy and symmetry of the pairing are not used. *Needs:* 0.5,
1.1, 1.2. (Source: Kleiman 1994, §5, pp. 16–19.)

**Checks.**

- The negative control of 1.1 satisfies the conclusion without positivity: positivity is
  sufficient, not necessary.
- Positivity cannot be dropped: take `n = 2`, `H = ℚ1 ⊕ (ℚξ ⊕ ℚu ⊕ ℚv) ⊕ ℚξ²` in degrees
  `0, 2, 4`, `L 1 = ξ`, `L ξ = ξ²`, `L u = L v = 0`, the Poincaré pairing `⟨1, ξ²⟩ = ⟨ξ, ξ⟩ = 1`,
  `⟨u, v⟩ = 1`, `⟨u, u⟩ = ⟨v, v⟩ = ⟨ξ, u⟩ = ⟨ξ, v⟩ = 0`, `A^0 = ℚ`, `A^1 = ℚξ ⊕ ℚu`,
  `A^2 = ℚξ²`, and `𝒜` the endomorphisms preserving `A`, which contains `L` and `Λ`. Then
  `−⟨u, u⟩ = 0` breaks positivity and `u` lies in the kernel of the pairing on `A^1`. With
  `A^1 = ℚξ ⊕ ℚ(u − v)` instead, `−⟨u − v, u − v⟩ = 2 > 0` and the pairing on `A^1` is
  nondegenerate.

### 1.5 Examples

`𝒜 = End_K H` contains `Λ` and every projector. For `K[ξ]/(ξ^{n+1})` with `n ≥ 1` and `𝒜 = F[L]`,
neither holds: every element of `F[L]` is `a₀ + a₁L + ⋯` and does not lower degree, while `Λ`
does, and `π_0` is not of this form. This is the phenomenon of folder 16's example in dimension
`1`: the ring generated by `L` alone does not see the grading. *Needs:* 1.1.

**Checks.**

- For `n = 1`, `F[L] = {a + bL}` and `π_0 = 1 − LΛ`; `a + bL = π_0` on `1` forces `a = 1`,
  `b = 0`, and on `ξ` forces `a = 0`.

## Layer 2: Lefschetz data on a Weil cohomology theory

This layer states no conjecture and owns no predicate on varieties. It consumes
MotivesAndAlgebraicCycles' shared core by name.

### 2.1 Weil cohomology theories with Lefschetz data

`structure WeilCohomologyLefschetz k K` extending MotivesAndAlgebraicCycles §2.2's minimal
classical Weil theory by weak Lefschetz for a smooth hyperplane section and hard Lefschetz for
every ample class. The forgetful map to the minimal theory keeps grading, cycle maps, traces and
the Tate marking. *Needs:* MotivesAndAlgebraicCycles §2.2.

**Checks.**

- Forgetting and re-adding the Lefschetz data is the identity on the underlying minimal theory.

### 2.2 Correspondences and the algebraic ring

Import graded correspondences, composition and their cohomological action from
MotivesAndAlgebraicCycles §§0.1–0.2 and 2.3. Define `𝒜(X)` as the image of all of `Corr^*(X, X)`
in `End H(X)`. Prove that it is a `ℚ`-subalgebra containing `L = (Δ_*ξ)_*`, and that a
correspondence of degree `r` raises cohomological degree by `2r`. *Needs:*
MotivesAndAlgebraicCycles §§0.1–0.2, 2.3.

**Checks.**

- On `ℙ¹`, `L` and the inverse of `L : H⁰ → H²` come from correspondences of degrees `1` and `−1`,
  so both lie in `𝒜(ℙ¹)`; the image of `CH¹(ℙ¹ × ℙ¹)_ℚ` alone (degree `0`) contains neither
  (MotivesAndAlgebraicCycles §2.3, third Check).

### 2.3 The Lefschetz structure of `X`

For `X` of dimension `d` with an ample class `ξ`, `L = γ(ξ) ∪ −` makes `H(X)` a Lefschetz
structure of weight `2d` by the hard Lefschetz datum of 2.1, the cup-product pairing
`⟨a, b⟩ = Tr(a ∪ b)` is a Poincaré pairing, and `(𝒜(X), A(X))` is an algebraic structure in the
sense of 1.1 (`A_stable` because correspondences act on cycle classes). *Needs:* 0.5, 1.1, 2.1,
2.2; MotivesAndAlgebraicCycles §2.2.

**Checks.**

- For `ℙ^d` with `ξ` the hyperplane class, `H(ℙ^d)` is `K[ξ]/(ξ^{d+1})` of 0.1 and
  `A^i(ℙ^d) = ℚξ^i`.

### 2.4 Comparison with MotivesAndAlgebraicCycles §7.3

For `X` with Lefschetz data and the structures of 2.3, prove the dictionary

- `LambdaAlgebraic (𝒜(X))` ⇔ `B_H(X)`: from left to right, `π_i Λ^{d−i} π_{2d−i}` lies in
  `𝒜(X)` (1.2) and is induced by the degree-`(i − d)` component of any correspondence inducing it;
  from right to left, the correspondences of `B_H(X)` give the `w_i` of 1.2, homogeneous by 2.2;
- `ProjectorsAlgebraic (𝒜(X))` ⇔ `C_ℚ,H(X)`, a correspondence class being determined by its
  action (MotivesAndAlgebraicCycles §2.3);
- `PositiveOnAlgebraicPrimitive (𝒜(X), ⟨−,−⟩)` ⇔ Hodge standard positivity for `(X, ξ)`, the two
  forms being equal on `A^i ∩ P^{2i}`;
- `PairingNondegenerateOnAlgebraic (𝒜(X), ⟨−,−⟩)` ⇔ `D_ℚ,H(X)`, through §7.3's equivalence of
  `D` with nondegeneracy of the rational algebraic-image pairing.

The implications between these predicates and their established cases are
MotivesAndAlgebraicCycles §§7.3–7.4's; this section proves only the dictionary. *Needs:* 1.1, 1.2,
2.2, 2.3; MotivesAndAlgebraicCycles §§0.5, 2.3, 7.3.

**Checks.**

- Read through the dictionary, 1.2 and 1.4 give §7.3's `B ⇒ C` and, with Hodge positivity,
  `B ⇒ D`; they are not restated on `H(X)`.
- Curves (MotivesAndAlgebraicCycles §7.4's `B` for curves): for `d = 1`,
  `Λ = (deg ξ)⁻¹ [X × X]_*`. The class of `X × X`, a correspondence of degree `−1`, acts by
  `α ↦ pr₂,*(pr₁* α) = (∫_X α) · 1`, so it kills `H⁰` and `H¹` and sends `ξ` to `deg ξ`; the class
  `[pt × X]` instead acts as the Künneth projector onto `H⁰`.
- On `ℙ¹ × ℙ¹` with `ξ = a + b`, `a − b` spans `A¹ ∩ P²` and `(−1) deg((a − b)²) = 2 > 0`.
- `PairingNondegenerateOnAlgebraic` holds at `i = 0` and `i = d` for every connected `X`:
  `⟨1, [pt]⟩ = 1`.

*Research context, not a target.* The weak form of `B`, « for every `i > 0` some correspondence
induces an isomorphism `H^{d+i}(X) ≅ H^{d−i}(X)` », is Beilinson's `l(X)` (Beilinson 2012, §2.3) and
Arapura's `B(X)` (Arapura 2006, §4); on `H(X)` it is the hypothesis of 1.3, with `u` a
correspondence. Beilinson's step (b) of §2.3, « `l(X)` implies `L(X)` », where `L(X)` asks for every
`i > 0` a correspondence acting as the inverse of `L^i : H^{d−i}(X) → H^{d+i}(X)` with no other
nonzero component, is proved as 1.2 and 1.3 are here. By descending induction on `i`, the projectors
`p_j` onto `H^{d+j}(X)`, `|j| > i`, already come from correspondences; multiplying the given
isomorphism `c′` on the right by the `1 − p_j`, `j > i`, and on the left by the `1 − p_j`, `j < −i`,
leaves only its component `H^{d+i} → H^{d−i}` (1.3 uses `π_i w π_{2n−i}` and the hypothesis
`ProjectorsAlgebraic` instead); then `A = c′ L^i` is an automorphism of `H^{d−i}(X)` with no other
component, and `f(A) c′`, for `f ∈ ℚ[t]` with `f(A) A = 1` on `H^{d−i}(X)`, is the inverse. The
paper takes `f ∈ ℚ[t]` without argument; 1.3 makes the rationality of the characteristic polynomial
a hypothesis. Beilinson's §2 works over `ℂ` with Betti cohomology.

## Roadmap for a roadmap: Lefschetz data for actual cohomology theories

**Do not implement this section.** A successor roadmap would construct Weil cohomology
theories with the Lefschetz data of 2.1, and import the established cases:

- `ℓ`-adic cohomology `H^*(X_k̄, ℚ_ℓ)`, `ℓ ≠ char k`, from EtaleCohomologyFoundations (cycle
  classes, Poincaré duality, Künneth, weak Lefschetz) and DeligneWeightsAndPurity (hard Lefschetz
  from Deligne's Weil II) (Grothendieck 1969; Kleiman 1968, 1994);
- Betti cohomology for `k = ℂ`, where positivity holds by the Hodge–Riemann bilinear relations
  (ComplexKahlerGeometry K6.1, with HodgeStructures), and the Lefschetz inverse is induced by a
  correspondence for abelian varieties (Lieberman 1968);
- the other established cases surveyed in Kleiman 1994 (dimension at most `2`, divisors), through
  the dictionary of 2.4;
- over `ℂ`, Arapura's cases of `B(X)` for algebraic correspondences, obtained through André's
  motivated cycles (Arapura 2006). `Y` is motivated by `X` if the André motive `[Y]` lies in the
  category generated by `[X]` under sums, summands and products (introduction, §1); Theorem 4.1, a
  repackaging of André, Grothendieck, Jannsen and Kleiman, shows `B(X)` equivalent to homological =
  numerical equivalence on all powers of `X`, and to `M_hom(X) → M_A(X)` being an equivalence; Lemma
  4.2 transports `B` for all powers of `X` to all powers of every `Y` motivated by `X`. Hence `B`
  for every variety motivated by a curve or a surface (Corollary 4.3), in particular uniruled
  threefolds and unirational fourfolds (Corollary 2.8), abelian varieties (Lieberman's case, after
  Corollary 4.3); moduli spaces of stable vector bundles of coprime rank and degree, and of stable
  parabolic bundles under the numerical conditions making them smooth projective fine moduli spaces,
  on a curve (Theorem 7.1, Corollary 7.2, the first part due to Biswas and Narasimhan); Hilbert
  schemes of points on a surface (Theorem 7.4, Corollary 7.5); projective moduli spaces of stable
  sheaves on an abelian or K3 surface (Theorem 7.8, Corollary 7.9);
- conditional reductions, research context only (Beilinson 2012): over any field `k`, the existence
  of a motivic t-structure on Voevodsky's `DM_k` with `ℚ` coefficients (non-degenerate, `⊗` and the
  realization t-exact, §1.2) gives the Lefschetz and Künneth standard conjectures (§1.4, Corollary):
  hard Lefschetz holds in the heart (§1.4, Proposition (i)), `M(X)` splits as the sum of its
  cohomology objects (Proposition (ii)), and the morphism `M(X) → M(X)(−i)[−2i]` whose only nonzero
  component inverts `∩L^i` is a correspondence, the motivic form of 0.3's `Λ^i`. In characteristic
  `0`, the semisimplicity of the heart's `µH^a M(X)` (§1.5, Proposition) is the argument of 1.4:
  orthogonal complements in the primitive part for the pairing `(·, ∩L^{−a−d} ·)`, nondegenerate on
  subobjects by the Hodge index theorem. Over `ℂ`, the standard conjectures (iv) are equivalent to a
  weak form (i) of Suslin's Lawson homology conjecture, and to the existence of finite
  correspondences to smooth projective varieties of dimension `d − 1` (ii), resp. `j` (iii),
  surjective on `H^i`, `i < d`, resp. on `H^j` (§2.2, Proposition); (iii) ⇒ (iv) runs through `l(X)`
  and step (b) of §2.3 (the research context of 2.4), and the Lemma of §2.3 uses the definite signs
  of the polarization on the primitive pieces.

## References

All checked on zbMATH.

- A. Grothendieck, « Standard conjectures on algebraic cycles », in *Algebraic Geometry
  (Internat. Colloq., Tata Inst. Fund. Res., Bombay, 1968)*, Oxford Univ. Press, 1969, 193–199.
  Zbl 0201.23301.
- S. L. Kleiman, « Algebraic cycles and the Weil conjectures », in *Dix exposés sur la cohomologie
  des schémas*, Adv. Stud. Pure Math. 3, North-Holland, 1968, 359–386. Zbl 0198.25902.
- S. L. Kleiman, « The standard conjectures », in U. Jannsen, S. Kleiman, J.-P. Serre (eds.),
  *Motives*, Proc. Sympos. Pure Math. 55, Part 1, AMS, 1994, 3–20. Zbl 0820.14006.
- D. I. Lieberman, « Numerical and homological equivalence of algebraic cycles on Hodge
  manifolds », *Amer. J. Math.* 90 (1968), 366–374. Zbl 0159.50501.
- Y. André, *Une introduction aux motifs*, Panoramas et Synthèses 17, SMF, 2004. Zbl 1060.14001.
- D. Arapura, « Motivation for Hodge cycles », *Adv. Math.* 207 (2006), no. 2, 762–781.
  Zbl 1109.14012. arXiv:math/0501348 (v3 read; numbering as there).
- A. Beilinson, « Remarks on Grothendieck's standard conjectures », in *Regulators*, Contemp.
  Math. 571, AMS, 2012, 25–32. Zbl 1268.14007. arXiv:1006.1116 (v2 read; numbering as there).

## Provenance

The letter to Serre of 27 August 1965 (Montpellier fonds, folder 14, pp. 43–46; printed in the
*Correspondance Grothendieck–Serre*, SMF 2001) states conjectures A and B; folder 16 (1966–67)
studies Lefschetz operators in graded rings, the pseudo-inverse `Λ` and « Hodge algebras ». The
Lean appendix of the transcription project (github.com/Commutator-IO/grothendieck-project,
`lean/Grothendieck/Folder16.lean`) proves the `𝔰𝔩₂` normalization on primitive vectors
(`sl2_normalisation`); the source statements of 1.2 in a ring with grading idempotents
(`projecteurs_mem_lefschetz`, `projecteurs_primitifs_mem`, and `critere_lefschetz` for the
pseudo-inverse `pseudoInverse`); the Cayley–Hamilton statements of 1.3 (`inverse_mem_of_charpoly`,
and `inverse_Lefschetz_algebrique`, whose conclusion is an algebraic inverse of the map induced by
`L^{n−i}`); and, for the « algèbres de Hodge d'ordre 2 » (pp. 24–28), the two criteria of the
odd-degree Checks of 0.1 and 0.5 (`DonneesHodge.lefschetz_iff`: `ξ : H¹ → H³` bijective iff `φ`
nondegenerate, `ξ² : H⁰ → H⁴` always; `DonneesHodge.poincare_iff`: the pairings perfect iff `Q`
nondegenerate). These files are cited sources, not specifications.
