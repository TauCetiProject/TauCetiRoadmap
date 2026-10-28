# Roadmap: Lefschetz structures and algebraic operators on cohomology

**Summary.** Build the linear algebra of Lefschetz structures and the theory of algebraic
operators on them, then transport it to the cohomology of varieties. Layer 0: a finite-dimensional
graded vector space `H = ⊕_{i ≤ 2n} H^i` with a degree-`2` operator `L` satisfying hard
Lefschetz; the Lefschetz inverse `Λ` and the `𝔰𝔩₂`-normalized lowering operator `f`, their
comparison, the grade projectors and a Poincaré pairing. The primitive decomposition and the
pairing theory are consumed from DeligneWeightsAndPurity §9.7, and `𝔰𝔩₂` representation theory
from LieHighestWeight. Layer 1: a ring `𝒜` of « algebraic » endomorphisms and a space `A` of
« algebraic » classes over a subfield `F`, and proved implications between explicit properties:
an algebraic `Λ` makes every grade projector algebraic; an algebraic `Λ` and positivity on
algebraic primitive classes give nondegeneracy of the pairing on algebraic classes; the
Cayley–Hamilton criterion for `Λ` to be algebraic. Layer 2: Lefschetz data on
MotivesAndAlgebraicCycles' minimal Weil cohomology theory, the Lefschetz and algebraic
structures on `H(X)` given by all graded correspondences, and Layer 1's theorems transported to
`H(X)` under the corresponding explicit hypotheses.

Research context, not a target: Grothendieck's standard conjectures assert these properties for
every smooth projective variety. They first appear in his letter to Serre of 27 August 1965
(Montpellier fonds, folder 14, p. 44); folder 16 (1966–67) works out the linear algebra of
Layers 0–1. No conjecture is stated or formalised here; the established cases are consumed as
theorems.

Suggested homes: `TauCeti/LinearAlgebra/Lefschetz/` (Layers 0–1, mirroring Mathlib's
`Mathlib/Algebra/Lie/Sl2.lean` and `Mathlib/LinearAlgebra/`) and
`TauCeti/AlgebraicGeometry/WeilCohomology/` (Layer 2).

## Scope and ownership

**In scope.**

- the Lefschetz operators `Λ` and `f` of a Lefschetz structure over a field of characteristic
  `0`, the triple `(L, h, f)` built from Lefschetz data, the comparison of `f` with `Λ`, and the
  grade projectors (Layer 0);
- algebraic structures on a Lefschetz structure and the conditional theorems between explicit
  algebraicity, positivity and nondegeneracy properties (Layer 1);
- the Lefschetz extension of a minimal Weil cohomology theory, the Lefschetz and algebraic
  structures it puts on `H(X)`, and Layer 1's theorems on `H(X)` (Layer 2).

**Out of scope, with owner.**

- *The primitive decomposition, dimension differences and compatible pairings of a graded vector
  space with hard Lefschetz, over an arbitrary field*: DeligneWeightsAndPurity (#929, §9.7),
  `lefschetzDecomposition`, `lefschetzPairings`, `primitivePiece`, with its `ℕ → ℤ` grading
  extension identifying `P^j = primitivePiece 𝒱 L n (n − j)` for `0 ≤ j ≤ n`. The categorical form
  for finite-support graded Lefschetz objects in an abelian category is EtaleDualityAndPerverseSheaves
  (#1040, §5.7, `abstractPrimitiveDecomposition`, with `gradedLefschetz_vectorSpace_compat`); the
  two have one proof owner between them, and Layer 0.2 here is an adapter.
- *Representations of `𝔰𝔩₂`* (weight strings, standard irreducibles, complete reducibility, on
  Mathlib's `IsSl2Triple`): [LieHighestWeight](../RepresentationTheory/LieHighestWeight/README.md),
  Layer 0.
- *Hard Lefschetz and the Hodge–Riemann relations on compact Kähler manifolds*:
  [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md), K6.1. Named only in the last section.

- *Graded correspondences and their two actions, composition, graph, transpose and tensor; the
  minimal classical Weil cohomology theory and the cohomological action of correspondences;
  adequate and numerical relations, homological equivalence and the inclusion homological ⊆
  numerical; the established cases of the properties of Layer 1 for varieties*:
  [MotivesAndAlgebraicCycles](../MotivesAndAlgebraicCycles/README.md) (#1313), §§0.1–0.2, 0.5,
  2.2–2.3 and 7.3–7.4, which states them in greater generality (componentwise degrees, disconnected
  and empty schemes, arbitrary base field). Consumed by Layer 2 by name.
- *Chow groups, rational equivalence, proper pushforward, flat and graph pullback, intersection
  products on smooth varieties, and numerical equivalence on surfaces*:
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) Layer 5 (§§5.1–5.6, 5.10).
  Consumed through MotivesAndAlgebraicCycles, which builds correspondences on them; Layer 2 does
  not call them directly.
- *`ℓ`-adic cohomology, its cycle classes, Poincaré duality and hard Lefschetz*: the
  EtaleCohomologyFoundations, LefschetzPencilsAndVanishingCycles and DeligneWeightsAndPurity
  roadmaps (§F.6, §F.7 and §9.6 of those drafts). Named only in the last section.
- *Hodge structures and polarizations*: [HodgeStructures](../../Completed/HodgeStructures/README.md).
  Named only in the last section.
- *Motives (pure motives, the motivic Galois group)*: MotivesAndAlgebraicCycles; not used here.

The boundary in one sentence: the decomposition is #929's; the operators `Λ`, `f`, the projectors
and the theorems about algebraic operators are here; varieties enter only in Layer 2, through
MotivesAndAlgebraicCycles; a specific cohomology theory is the last section's.

## What Mathlib and Tau Ceti already have (consume)

- **Linear algebra.** `DirectSum.IsInternal`, `Submodule`, `Module.End` with its Lie algebra
  structure, `LinearMap.charpoly` and `LinearMap.aeval_self_charpoly` (Cayley–Hamilton),
  `LinearMap.BilinForm` with `Nondegenerate`, `Module.finrank`.
- **`𝔰𝔩₂`.** `IsSl2Triple`, `IsSl2Triple.HasPrimitiveVectorWith`, and the computation of
  `⁅f, e^k x⁆` on a primitive vector (`Mathlib/Algebra/Lie/Sl2.lean`).
- **Cycles.** Mathlib's `AlgebraicCycle X R` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean`);
  Tau Ceti's Weil and Cartier divisors. Chow groups are SchemeAndStackFoundations Layer 5 targets,
  not yet implemented in Tau Ceti.

## Conventions (pinned)

- `K` is a field of characteristic `0` (the coefficient field), `F ⊆ K` a subfield (`ℚ` in the
  geometric case). `H` is a finite-dimensional `K`-vector space.
- **Lefschetz structure of weight `2n`**: a grading `H = ⊕_{i ∈ ℕ} H^i` (`DirectSum.IsInternal`) with
  `H^i = 0` for `i > 2n`, and `L ∈ End_K H` with `L(H^i) ⊆ H^{i+2}` such that
  `L^{n−i} : H^i → H^{2n−i}` is bijective for `i ≤ n` (hard Lefschetz).
- **Primitive part**: `P^i = H^i ∩ ker L^{n−i+1}` for `i ≤ n`, and `P^i = 0` for `i > n`
  (#929's `primitivePiece 𝒱 L n (n − i)`). Every statement quantifying over primitive sources
  `P^j` takes `j ≤ n`.
- **The Lefschetz inverse `Λ`** (Kleiman 1968's normalization; the « pseudo-inverse » of
  Grothendieck's folder 16): the unique `Λ` with `Λ(L^{k+1} x) = L^k x` and `Λ x = 0` for `x ∈ P^j`,
  `j + 2k + 2 ≤ 2n − j`. It is not the `𝔰𝔩₂` lowering operator.
- **The `𝔰𝔩₂` triple**: `h` acts on `H^i` by `i − n`; `f` is the unique operator with
  `⁅L, f⁆ = h`, `⁅h, f⁆ = −2f`. On `L^k x`, `x ∈ P^j`, `f(L^{k+1} x) = (k+1)(n − j − k) L^k x`
  (Mathlib's `IsSl2Triple` has `h = ⁅e, f⁆`; with `e = L`, its `h` is the `h` here).
- **Algebraic structure** on a Lefschetz structure: a subring `𝒜 ⊆ End_K H` with `L ∈ 𝒜`, stable
  under multiplication by `F`; and `F`-subspaces `A^i ⊆ H^{2i}` (algebraic classes) with
  `L(A^i) ⊆ A^{i+1}` and `𝒜`-stable `A = ⊕ A^i`.
- **Properties** (Layer 1), named for what they say: `LambdaAlgebraic`: `Λ ∈ 𝒜`;
  `ProjectorsAlgebraic`: every grade projector `π_i ∈ 𝒜`; `PositiveOnAlgebraicPrimitive` (for
  `F ⊆ ℝ` and the pairing `F`-valued on `A`): for `2i ≤ n`, the form
  `(x, y) ↦ (−1)^i ⟨L^{n−2i} x, y⟩` is positive definite on `A^i ∩ P^{2i}`;
  `PairingNondegenerateOnAlgebraic`: the pairing `A^i × A^{n−i} → F` is nondegenerate for every
  `i`. They are the abstract forms of the properties Grothendieck called `B`, `C`, `Hdg` and `D`.
- **Weil cohomology theory with Lefschetz data**: MotivesAndAlgebraicCycles §2.2's minimal
  classical Weil theory `H` over an algebraically closed field `k`, together with weak Lefschetz for
  a smooth hyperplane section and hard Lefschetz for an ample class (Kleiman 1968; Kleiman 1994).
  Hard Lefschetz is data added here, not a Weil axiom, as in MotivesAndAlgebraicCycles §7.3.
- **The geometric structures** for `X` of dimension `d` with an ample rational class `ξ`:
  `𝒜(X) :=` the image in `End H(X)` of *all* graded correspondences `Corr^*(X, X)` (all degrees,
  MotivesAndAlgebraicCycles §0.1), acting by §2.3 there; `A^i(X) :=` the rational image of
  `CH^i(X)` under the cycle class. Taking only `CH^d(X × X)_ℚ`, the degree-zero correspondences,
  would give a ring containing neither `L = Δ_*ξ` (degree `1`) nor `Λ` (degree `−1`).

## The build, in layers

### Layer 0: Lefschetz structures

**0.1 The structure.** `LefschetzStructure K H n`, the grade submodules, `L`, the predicate
`IsGradeProjector`. *Checks:* the cohomology-shaped example `K[ξ]/(ξ^{n+1})` (`ξ^j` in degree `2j`, `L = ξ ·`) is a
Lefschetz structure of weight `2n`; a graded `H` with `L^n ≠ 0` on `H^0` need not satisfy hard
Lefschetz in other degrees (give an explicit four-dimensional counterexample with `n = 2`).
*Check (odd degrees):* for finite-dimensional `V`, `W`, an alternating form `φ` on `V` and a
symmetric form `Q` on `W`, let `H = K ⊕ V ⊕ (Kξ ⊕ W) ⊕ V̌ ⊕ Kξ²` in degrees `0, …, 4`, with
`L c = cξ` on `H⁰`, `L x = φ(·, x)` on `H¹`, `L(cξ + w) = cξ²` on `H²` and `L = 0` in degrees `3, 4`
(multiplication by `ξ` for the product `x y = φ(x, y)ξ + ψ(x, y)`, `w w' = Q(w, w')ξ²` of an
order-2 « Hodge algebra »; Layer 0 needs only `L`). It is a Lefschetz structure of weight `4` iff
`φ` is nondegenerate, and then `P² = W`; the pairing `⟨c, dξ²⟩ = cd`, `⟨x, u⟩ = u(x)`,
`⟨cξ + w, c'ξ + w'⟩ = cc' + Q(w, w')`, extended `(−1)^i`-symmetrically, satisfies
`⟨L x, y⟩ = ⟨x, L y⟩` and is perfect iff `Q` is nondegenerate (0.4). Unlike `K[ξ]/(ξ^{n+1})`, this
tests hard Lefschetz in odd degree. (The two criteria are proved in the Lean appendix cited in
Provenance; `P² = W` and the compatibility with `L` are immediate.)

**0.2 Primitive decomposition.** `grade_eq_iSup_primitive`:
`H^i = ⊕_{k ≥ 0, i − 2k ≥ 0, i − 2k ≤ n} L^k P^{i−2k}`, and `L^k : P^j → H^{j+2k}` injective for
`j + k ≤ n`: the adapter from this roadmap's `ℕ`-graded `LefschetzStructure` to #929 §9.7's
`lefschetzDecomposition`, through its grading extension. No second proof.

**0.3 The operators `Λ` and `f`.** Existence and uniqueness of `Λ`, and of the triple `(L, h, f)`
built from the Lefschetz data (its representation theory is LieHighestWeight's); the formula
relating `f` and `Λ` on `L^k P^j`; `Λ L = 1` on `H^i` for `i < n` and `L Λ = 1` on `H^i` for
`i > n`; `lambda_pow_L_pow`: for `i ≤ n`, `Λ^{n−i}` inverts `L^{n−i} : H^i → H^{2n−i}` (on
`L^{n−i}H^i`, and composed with the grade projectors elsewhere). *Checks:* on a primitive
`x ∈ P^j`, `f L x = (n − j) x`, so `f ≠ Λ` as soon as `n − j ≥ 2`; on `ℚ[ξ]/(ξ³)` with `n = 2`,
`Λ L² 1 = ξ` while `Λ² L² 1 = 1`, so it is `Λ^{n−i}`, not `Λ`, that inverts `L^{n−i}`; with `n = 1`
and `H = ℚe₀ ⊕ ℚe₂`, `L e₀ = e₂`, the convention `P² = 0` is what makes `Λ` exist.

**0.4 Pairing.** A Poincaré pairing: `⟨−,−⟩ : H^i × H^{2n−i} → K` perfect, `(−1)^{i}`-symmetric,
with `⟨L x, y⟩ = ⟨x, L y⟩`; the orthogonality of the Lefschetz decomposition for
`(x, y) ↦ ⟨L^{n−i} x, y⟩` on `H^i` and its nondegeneracy are #929 §9.7's `lefschetzPairings`,
consumed through the adapter of 0.2. (`Λ` is not the adjoint of `L` for this pairing: with `n = 1`,
`⟨e₀, e₂⟩ = 1`, `⟨L e₀, e₀⟩ = 1` but `⟨e₀, Λ e₀⟩ = 0`.)

### Layer 1: algebraic structures and the conditional theorems

**1.1 Definitions.** `AlgebraicStructure` (`F`, `𝒜`, `A`), and the properties `LambdaAlgebraic`,
`ProjectorsAlgebraic`, `PositiveOnAlgebraicPrimitive`, `PairingNondegenerateOnAlgebraic` of the
conventions.

**1.2 Algebraic `Λ` gives algebraic projectors** (`projectorsAlgebraic_of_lambdaAlgebraic`). If `Λ ∈ 𝒜` then every `π_i ∈ 𝒜`. Proof: for `i ≤ n`, `Λ^{n−i}` is inverse to
`L^{n−i}` between `H^i` and `H^{2n−i}` (from 0.2–0.3), and one-sided inverses in a ring `𝒜 ∋ L` of
the `L^{n−i}` put every grade projector in `𝒜`, by descending induction on `i` (the argument needs
only a ring, not `F`). *Source:* Kleiman 1968 (`B(X)` implies `C(X)`); Grothendieck 1969.

**1.3 The Cayley–Hamilton criterion.** If the characteristic polynomial of every element of `𝒜`
has coefficients in `F`, then the inverse of an invertible element of `𝒜` lies in `𝒜`; hence, if for
each `i ≤ n` there is some bijective `u_i ∈ 𝒜` from `H^{2n−i}` to `H^i` (not necessarily inverse to
`L^{n−i}`), then `Λ ∈ 𝒜`. (Statement of Grothendieck's folder 16, pp. 47–48; proved in the
Lean appendix cited in Provenance.)

**1.4 Algebraic `Λ` and positivity give nondegeneracy**
(`pairingNondegenerate_of_lambdaAlgebraic_of_positive`). If `A` is stable under `Λ` (in
particular if `Λ ∈ 𝒜`) and positivity holds on algebraic primitive classes, then the pairing is
nondegenerate on algebraic classes. Proof: the Lefschetz decomposition restricts to `A`, the decomposition is
orthogonal, and the form is definite on each primitive piece. *Source:* Grothendieck 1969;
Kleiman 1968.

*Check (the positivity is a hypothesis, not a consequence).* Positivity cannot be derived from the
multiplicative structure; it has to be imposed. The non-example is in the endomorphism form of
the setting, the one behind Weil's proof of the Riemann hypothesis for curves through the
positivity of the Rosati involution: a ring `E` (endomorphisms) with an involution `α ↦ α′`
(Rosati, a `StarRing`), an additive group `N` of classes with an injective `ψ : N → E` onto
`′`-fixed elements, a pullback `α*η` with `ψ(α*η) = α′ ψ(η) α`, a class `ξ` with `ψ(ξ) = 1`, an
`r`-linear intersection form `I : N^r → ℤ` with `I(ξ^r) ≠ 0`, and a degree `ν` with
`I(α*η₁, …, α*η_r) = ν(α) I(η₁, …, η_r)`. In this frame `n ↦ ν(α + n)` is the restriction to `ℤ`
of a unique monic polynomial of degree `2r` over `ℚ`, which defines `tr α` as its coefficient of
`n^{2r−1}`, and `tr(α) I(ξ^r) = r I(ξ^{r−1}, (α + 1)*ξ − α*ξ − ξ)` when `I` is
symmetric; without symmetry this trace formula fails (`N = ℤ²`, `r = 2`, `I(x, y) = x₁y₂`).
Rosati positivity `tr(α′α) > 0` for `α ≠ 0`, the analogue of positivity, does **not** follow, even if
`I(ξ^{r−1}, η) > 0` for every nonzero `η` in a positive cone: `E = ℍ[ℤ, 0, 0, 0]` (Mathlib's
quaternion algebra with all structure constants `0`, so `i² = 0`) with its conjugation, `N = ℤ`,
`r = 1`, `ξ = 1`, `α*x = (Re α)² x`, has `i ≠ 0` and `tr(i′i) = 0`. It does follow once
`α ≠ 0 ⇒ α*ξ ≠ 0` is added. (Proved in the Lean appendix cited in Provenance.)

**1.5 Examples.** `𝒜 = End_K H` contains `Λ` and every projector. For `K[ξ]/(ξ^{n+1})` with
`n ≥ 1` and `𝒜 = F[L]`, neither holds: every element of `F[L]` is `a₀ + a₁L + ⋯` and does not lower
degree, while `Λ` does, and `π_0` is not of this form. This is the phenomenon of folder 16's
example in dimension `1`: the ring generated by `L` alone does not see the grading.

### Layer 2: Lefschetz data on a Weil cohomology theory, and compatibility

This layer states no conjecture. It consumes MotivesAndAlgebraicCycles' shared core by name and
proves Layer 1's theorems on `H(X)` under explicit hypotheses.

**2.1 Weil cohomology theories with Lefschetz data.** `structure WeilCohomologyLefschetz k K`
extending MotivesAndAlgebraicCycles §2.2's minimal classical Weil theory by weak Lefschetz for a
smooth hyperplane section and hard Lefschetz for every ample class. The forgetful map to the
minimal theory keeps grading, cycle maps, traces and the Tate marking. *Needs:*
MotivesAndAlgebraicCycles §2.2. *Check:* forgetting and re-adding the Lefschetz data is the
identity on the underlying minimal theory.

**2.2 Correspondences and the algebraic ring.** Import graded correspondences, composition and
their cohomological action from MotivesAndAlgebraicCycles §§0.1–0.2 and 2.3. Define `𝒜(X)` as the
image of all of `Corr^*(X, X)` in `End H(X)`. Prove that it is a `ℚ`-subalgebra containing
`L = (Δ_*ξ)_*`. *Needs:* MotivesAndAlgebraicCycles §§0.1–0.2, 2.3. *Check:* on `ℙ¹`, `L` and the
inverse of `L : H⁰ → H²` come from correspondences of degrees `1` and `−1`, so both lie in `𝒜(ℙ¹)`;
the image of `CH¹(ℙ¹ × ℙ¹)_ℚ` alone (degree `0`) contains neither (MotivesAndAlgebraicCycles §2.3,
third Check).

**2.3 The Lefschetz structure of `X`.** For `X` of dimension `d` with an ample class `ξ`,
`L = γ(ξ) ∪ −` makes `H(X)` a Lefschetz structure of weight `2d` by the hard Lefschetz datum of
2.1, and `(𝒜(X), A(X))` is an algebraic structure in the sense of Layer 1. *Needs:* 2.1, 2.2,
Layer 0.

**2.4 Homological and numerical equivalence.** Import numerical equivalence from
MotivesAndAlgebraicCycles §0.5 and the inclusion homological ⊆ numerical from its §2.3. Nothing is
restated. *Needs:* MotivesAndAlgebraicCycles §§0.5, 2.3.

**2.5 Transport to `H(X)`.** For `X` with Lefschetz data, Layer 1's theorems hold on
`(H(X), 𝒜(X), A(X))` under explicit hypotheses: if the Lefschetz inverse of `X` is induced by a
correspondence, every Künneth grade projector is induced by a correspondence; if moreover the form
of 1.4 is positive definite on algebraic primitive classes, the cohomological pairing is
nondegenerate on algebraic classes, so a cycle numerically equivalent to zero has zero class
(with the inclusion homological ⊆ numerical of 2.4, homological and numerical equivalence agree
on `X`). The established cases are imported as theorems stated in these terms, from
MotivesAndAlgebraicCycles §7.4 and the geometric roadmaps: the Lefschetz inverse is induced by a
correspondence for curves (`Λ` on `H²` is `[pt × X]_*` divided by `deg ξ`) and for abelian
varieties (Lieberman 1968), and nondegeneracy holds in codimension `0` and `d`. *Needs:* 2.3,
2.4, Layer 1, MotivesAndAlgebraicCycles §§0.5, 2.3, 7.4.

## Ordering

#929 §9.7 for 0.2 and 0.4; Layer 0, then Layer 1 (both Mathlib-only otherwise). Layer 2 waits on
MotivesAndAlgebraicCycles (#1313), which supplies its whole core: this pull request is meant to
merge after #1313, which names this roadmap only as a downstream consumer, so there is no cycle.
Within Layer 2, 2.1–2.2 first.

## Roadmap for a roadmap: Lefschetz data for actual cohomology theories

**Do not implement this section.** A successor roadmap would construct Weil cohomology
theories with the Lefschetz data of Layer 2.1, and import the established cases:

- `ℓ`-adic cohomology `H^*(X_k̄, ℚ_ℓ)`, `ℓ ≠ char k`, from the étale-cohomology roadmaps (cycle
  classes, Poincaré duality, Künneth, weak Lefschetz, and hard Lefschetz from Deligne's Weil II);
  (Grothendieck 1969, Kleiman 1968, 1994);
- Betti cohomology for `k = ℂ`, where positivity holds by the Hodge–Riemann bilinear relations
  (ComplexKahlerGeometry K6.1, with HodgeStructures), and the Lefschetz inverse is induced by a
  correspondence for abelian varieties (Lieberman 1968);
- the other established cases surveyed in Kleiman 1994 (dimension at most `2`, divisors), as
  theorems in the terms of Layer 2.5.

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

## Provenance

The letter to Serre of 27 August 1965 (Montpellier fonds, folder 14, pp. 43–46; printed in the
*Correspondance Grothendieck–Serre*, SMF 2001) states conjectures A and B; folder 16 (1966–67)
studies Lefschetz operators in graded rings, the pseudo-inverse `Λ` and « Hodge algebras ». The
Lean appendix of the transcription project (github.com/Commutator-IO/grothendieck-project,
`lean/Grothendieck/Folder16.lean`) proves the `𝔰𝔩₂` normalization on primitive vectors, the
Cayley–Hamilton criterion of 1.3 (`inverse_mem_of_charpoly`, `inverse_Lefschetz_algebrique`) and
the projector statement behind 1.2 (`projecteurs_mem_lefschetz`), and, for the folder's « algèbres
de Hodge d'ordre 2 » (pp. 24–28), the two criteria of the odd-degree Check of 0.1
(`DonneesHodge.lefschetz_iff`: `ξ : H¹ → H³` bijective iff `φ` nondegenerate, `ξ² : H⁰ → H⁴` always;
`DonneesHodge.poincare_iff`: the pairings perfect iff `Q` nondegenerate) together with associativity
of the product (`DonneesHodge.assoc_iff`, which needs a quadrilinear identity in `φ, ψ, Q`; Layer 0
does not use the product). Folder 50 (dated by the inventory from 1965 on) states the axioms of
an endomorphism frame of this kind; `lean/Grothendieck/Folder50.lean`
([permalink](https://github.com/Commutator-IO/grothendieck-project/blob/ed6afbc8710735ed36bcaa0f4a323cb000257f96/lean/Grothendieck/Folder50.lean))
proves the facts of the Check of 1.4: `charPoly_unique`, `natDegree_charPoly` (the monic
polynomial of degree `2r`), `tr_mul_I` (the trace formula for symmetric `I`),
`ModelA.not_trace_formula` (its failure without symmetry), `ModelB.tr_star_i_mul_i` and
`ModelB.nef_pos` (Rosati positivity fails in `ℍ[ℤ, 0, 0, 0]`), and `tr_star_mul_self_pos` (it holds
with `α ≠ 0 ⇒ α*ξ ≠ 0`); the two counterexamples are the transcription project's, not the
folder's. These files are cited sources, not specifications.
