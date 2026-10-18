# Roadmap: Lefschetz structures, Weil cohomology theories and the standard conjectures

**Summary.** Build the linear algebra that the standard conjectures on algebraic cycles are
about, then the axiomatic Weil cohomology theories on which they are stated, and state them.
Layer 0 is Lefschetz structures: a finite-dimensional graded vector space `H = ⊕_{i ≤ 2n} H^i`
with a degree-`2` operator `L` satisfying hard Lefschetz, the primitive decomposition, the
Lefschetz inverse `Λ` and the `𝔰𝔩₂`-normalized lowering operator, the grade projectors and a
Poincaré pairing. Layer 1 is the algebraic part of the conjectures in that setting: a ring `𝒜`
of « algebraic » endomorphisms and a space `A` of « algebraic » classes over a subfield `F`, the
abstract conditions `B`, `C`, `Hdg`, `D`, and the implications between them (`B ⇒ C`;
`B ∧ Hdg ⇒ D`; the Cayley–Hamilton criterion for `B`). Layer 2 is Weil cohomology theories in
Kleiman's axioms on smooth projective varieties over an algebraically closed field, on top of
the Chow rings of SchemeAndStackFoundations Layer 5, with algebraic correspondences acting on
cohomology, and the standard conjectures `B(X)`, `C(X)`, `Hdg(X)`, `D(X)` for a Weil cohomology
theory as `def … : Prop`, with the implications of Layer 1 transported and the cases of curves
proved. Constructing a Weil cohomology theory (`ℓ`-adic, de Rham or crystalline) and stating the
conjectures for it is a roadmap for a roadmap.

The conjectures first appear in Grothendieck's notes in a letter to Serre of 27 August 1965
(Montpellier fonds, folder 14, p. 44), and folder 16 (1966–67) works out the linear algebra of
Layers 0–1; the statements specified here are the refereed ones of Grothendieck 1969 and Kleiman
1968 and 1994.

Suggested homes: `TauCeti/LinearAlgebra/Lefschetz/` (Layers 0–1, mirroring Mathlib's
`Mathlib/Algebra/Lie/Sl2.lean` and `Mathlib/LinearAlgebra/`) and
`TauCeti/AlgebraicGeometry/WeilCohomology/` (Layer 2).

## Scope and ownership

**In scope.**

- Lefschetz structures and their linear algebra over a field of characteristic `0` (Layer 0);
- algebraic structures on a Lefschetz structure and the abstract standard conditions with
  their implications (Layer 1);
- the definition of a Weil cohomology theory, the action of correspondences, homological
  equivalence, the algebraic classes, and the standard conjectures for a given Weil cohomology
  theory, with their consequences and the cases of dimension at most `1` (Layer 2).

**Out of scope, with owner.**

- *Chow groups, rational equivalence, proper pushforward, flat and graph pullback, intersection
  products on smooth varieties, and numerical equivalence on surfaces*:
  [SchemeAndStackFoundations](../SchemeAndStackFoundations/README.md) Layer 5 (§§5.1–5.6, 5.10).
  Consumed by Layer 2, through Mathlib's `AlgebraicCycle` as it specifies.
- *`ℓ`-adic cohomology, its cycle classes, Poincaré duality and hard Lefschetz*: the
  EtaleCohomologyFoundations, LefschetzPencilsAndVanishingCycles and DeligneWeightsAndPurity
  roadmaps (§F.6, §F.7 and §9.6 of those drafts). Named only in the last section.
- *Hodge structures and polarizations*: [HodgeStructures](../../Completed/HodgeStructures/README.md).
  Named only in the last section.
- *Motives (pure motives, the motivic Galois group)*: not in this roadmap.

The boundary in one sentence: if a statement is about a graded vector space with a Lefschetz
operator and distinguished subspaces, it is in Layers 0–1; if it is about varieties, it is in
Layer 2 and consumes SchemeAndStackFoundations; if it needs a specific cohomology theory, it is
in the roadmap for a roadmap.

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
- **Primitive part**: `P^i = H^i ∩ ker L^{n−i+1}` for `i ≤ n`.
- **The Lefschetz inverse `Λ`** (Kleiman 1968's normalization; the « pseudo-inverse » of
  Grothendieck's folder 16): the unique `Λ` with `Λ(L^{k+1} x) = L^k x` and `Λ x = 0` for `x ∈ P^j`,
  `j + 2k + 2 ≤ 2n − j`. It is not the `𝔰𝔩₂` lowering operator.
- **The `𝔰𝔩₂` triple**: `h` acts on `H^i` by `i − n`; `f` is the unique operator with
  `⁅L, f⁆ = h`, `⁅h, f⁆ = −2f`. On `L^k x`, `x ∈ P^j`, `f(L^{k+1} x) = (k+1)(n − j − k) L^k x`
  (Mathlib's `IsSl2Triple` has `h = ⁅e, f⁆`; with `e = L`, its `h` is the `h` here).
- **Algebraic structure** on a Lefschetz structure: a subring `𝒜 ⊆ End_K H` with `L ∈ 𝒜`, stable
  under multiplication by `F`; and `F`-subspaces `A^i ⊆ H^{2i}` (algebraic classes) with
  `L(A^i) ⊆ A^{i+1}` and `𝒜`-stable `A = ⊕ A^i`.
- **Abstract conditions** (Layer 1): `B(𝒜)`: `Λ ∈ 𝒜`; `C(𝒜)`: every grade projector `π_i ∈ 𝒜`;
  `Hdg(A)` (for `F ⊆ ℝ` ordered and the pairing `F`-valued on `A`): for `2i ≤ n`, the form
  `(x, y) ↦ (−1)^i ⟨L^{n−2i} x, y⟩` is positive definite on `A^i ∩ P^{2i}`; `D(A)`: the pairing
  `A^i × A^{n−i} → F` is nondegenerate for every `i`.
- **Weil cohomology theory** (Kleiman 1968; Kleiman 1994): for an algebraically closed
  field `k`, a contravariant functor `X ↦ H(X)` from smooth projective `k`-varieties to graded
  commutative finite-dimensional `K`-algebras, with Poincaré duality (`H^{2d}(X) ≅ K` by a trace,
  perfect cup pairing), Künneth (`H(X) ⊗ H(Y) ≅ H(X × Y)`), and a cycle class ring homomorphism
  `γ_X : CH^*(X)_ℚ → H^{2*}(X)` compatible with pullback, pushforward (defined from Poincaré
  duality) and the trace on points, together with weak and hard Lefschetz for a smooth hyperplane
  section. `CH^*` is SchemeAndStackFoundations' `CH^p(X) := CH_{n−p}(X)` with rational
  coefficients `CH_k(X)_ℚ`.
- **The geometric conditions** for a Weil cohomology theory `W` and `X` of dimension `d` with an
  ample class: `𝒜(X) :=` the image of `CH^d(X × X)_ℚ` acting on `H(X)` by correspondences, and
  `A^i(X) := γ_X(CH^i(X)_ℚ)`. Then `B(X) := B(𝒜(X))`, `C(X) := C(𝒜(X))`, `Hdg(X) := Hdg(A(X))`,
  `D(X)` := homological and numerical equivalence agree on `CH^*(X)_ℚ`.

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

**0.2 Primitive decomposition.** `H^i = ⊕_{k ≥ 0, i − 2k ≥ 0, i − 2k ≤ n} L^k P^{i−2k}` for every
`i`, as `DirectSum.IsInternal`; `L^k : P^j → H^{j+2k}` injective for `j + k ≤ n`. Proof through the
`𝔰𝔩₂` triple of 0.3 and Mathlib's `IsSl2Triple` API.

**0.3 The operators `Λ` and `f`.** Existence and uniqueness of `Λ` and of the `𝔰𝔩₂` triple
`(L, h, f)`; the formula relating them on `L^k P^j`; `Λ L = 1` on `H^i` for `i < n` and `L Λ = 1` on
`H^i` for `i > n`; `Λ` is a two-sided inverse of `L^{n−i}` on the appropriate degrees after
composing with projectors. *Checks:* on a primitive `x ∈ P^j`, `f L x = (n − j) x`, so `f ≠ Λ` as
soon as `n − j ≥ 2`.

**0.4 Pairing.** A Poincaré pairing: `⟨−,−⟩ : H^i × H^{2n−i} → K` perfect, `(−1)^{i}`-symmetric,
with `⟨L x, y⟩ = ⟨x, L y⟩`; the Lefschetz decomposition is orthogonal for
`(x, y) ↦ ⟨L^{n−i} x, y⟩` on `H^i`; `Λ` is the adjoint of `L` up to the scalars of 0.3.

### Layer 1: algebraic structures and the abstract conditions

**1.1 Definitions.** `AlgebraicStructure` (`F`, `𝒜`, `A`), and the predicates `CondB`, `CondC`,
`CondHdg`, `CondD` of the conventions.

**1.2 `B ⇒ C`.** If `Λ ∈ 𝒜` then every `π_i ∈ 𝒜`. Proof: for `i ≤ n`, `Λ^{n−i}` is inverse to
`L^{n−i}` between `H^i` and `H^{2n−i}` (from 0.2–0.3), and one-sided inverses in a ring `𝒜 ∋ L` of
the `L^{n−i}` put every grade projector in `𝒜`, by descending induction on `i` (the argument needs
only a ring, not `F`). *Source:* Kleiman 1968 (`B(X)` implies `C(X)`); Grothendieck 1969.

**1.3 The Cayley–Hamilton criterion.** If the characteristic polynomial of every element of `𝒜`
has coefficients in `F`, then the inverse of an invertible element of `𝒜` lies in `𝒜`; hence, if for
each `i ≤ n` there is some bijective `u_i ∈ 𝒜` from `H^{2n−i}` to `H^i` (not necessarily inverse to
`L^{n−i}`), then `B(𝒜)` holds. (Statement of Grothendieck's folder 16, pp. 47–48; proved in the
Lean appendix cited in Provenance.)

**1.4 `B ∧ Hdg ⇒ D`.** If `A` is stable under `Λ` (in particular if `B(𝒜)` holds) and `Hdg(A)`
holds, then `D(A)` holds. Proof: the Lefschetz decomposition restricts to `A`, the decomposition is
orthogonal, and the form is definite on each primitive piece. *Source:* Grothendieck 1969;
Kleiman 1968.

*Check (the positivity is an axiom, not a consequence).* `Hdg` cannot be derived from the
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
Rosati positivity `tr(α′α) > 0` for `α ≠ 0`, the analogue of `Hdg`, does **not** follow, even if
`I(ξ^{r−1}, η) > 0` for every nonzero `η` in a positive cone: `E = ℍ[ℤ, 0, 0, 0]` (Mathlib's
quaternion algebra with all structure constants `0`, so `i² = 0`) with its conjugation, `N = ℤ`,
`r = 1`, `ξ = 1`, `α*x = (Re α)² x`, has `i ≠ 0` and `tr(i′i) = 0`. It does follow once
`α ≠ 0 ⇒ α*ξ ≠ 0` is added. (Proved in the Lean appendix cited in Provenance.)

**1.5 Examples.** `𝒜 = End_K H` satisfies `B` and `C`. For `K[ξ]/(ξ^{n+1})` with `n ≥ 1` and
`𝒜 = F[L]`, both `B` and `C` fail: every element of `F[L]` is `a₀ + a₁L + ⋯` and does not lower
degree, while `Λ` does, and `π_0` is not of this form. This is the phenomenon of folder 16's
example in dimension `1`: the ring generated by `L` alone does not see the grading.

### Layer 2: Weil cohomology theories and the standard conjectures

**2.1 Weil cohomology theories.** The structure of the conventions over the category of smooth
projective `k`-varieties, with `CH^*(−)_ℚ` from SchemeAndStackFoundations §§5.1–5.6. *Needs:*
SchemeAndStackFoundations Layer 5 (`Chow.intersect`, `Chow.graphPullback`, proper pushforward,
`CH_k(X)_ℚ`), Mathlib `Smooth`, `IsProper`, fibre products over `Spec k`.

**2.2 Correspondences.** `Corr^r(X, Y) := CH^{dim X + r}(X × Y)_ℚ`, composition by the intersection
product and pushforward, the action `γ(α)_* : H(X) → H(Y)` of degree `2r`, functoriality of the
action (`(β ∘ α)_* = β_* ∘ α_*`). The diagonal acts as the identity. *Source:* Kleiman 1968.

**2.3 The Lefschetz structure of `X`.** For `X` of dimension `d` with an ample class `ξ`,
`L = γ(ξ) ∪ −` makes `H(X)` a Lefschetz structure of weight `2d` (hard Lefschetz axiom);
`𝒜(X)` contains `L` (the correspondence `Δ_*ξ`) and is a subring stable under `ℚ`; `A(X)` is an
algebraic structure in the sense of Layer 1.

**2.4 Homological and numerical equivalence.** `ker γ_X ⊆` numerically trivial cycles; numerical
equivalence via the degree of the intersection product on proper `X`.

**2.5 The conjectures.** `def StandardConjectureB (W) (X) : Prop`, `StandardConjectureC`,
`StandardConjectureHdg`, `StandardConjectureD`, and their quantified forms over all `X`. Proved
consequences: `B(X) ⇒ C(X)` and `B(X) ∧ Hdg(X) ⇒ D(X)` (Layer 1 transported); `B(X)` for `d ≤ 1`
(for a curve, the inverse of `L : H^0 → H^2` is induced by `[pt × X]` up to the degree of `ξ`).
*Check:* `D` holds in codimension `0` and `d`.

## Ordering

Layer 0 first, then Layer 1 (both Mathlib-only, available now). Layer 2 waits on
SchemeAndStackFoundations Layer 5 being implemented in Tau Ceti; within it, 2.1–2.2 first.

## Roadmap for a roadmap: the conjectures for actual cohomology theories

**Do not implement this section.** A successor roadmap would construct Weil cohomology
theories satisfying Layer 2.1 and state the conjectures for them:

- `ℓ`-adic cohomology `H^*(X_k̄, ℚ_ℓ)`, `ℓ ≠ char k`, from the étale-cohomology roadmaps (cycle
  classes, Poincaré duality, Künneth, weak Lefschetz, and hard Lefschetz from Deligne's Weil II);
  the standard conjectures for it are Grothendieck's (Grothendieck 1969, Kleiman 1968, 1994);
- Betti cohomology for `k = ℂ`, where `Hdg(X)` holds by the Hodge–Riemann bilinear relations
  (from HodgeStructures and a Hodge theory roadmap that does not exist yet), and `B(X)` is known for
  abelian varieties (Lieberman 1968);
- known cases to record there, as surveyed in Kleiman 1994: `B` for abelian varieties
  (Kleiman 1968; Lieberman 1968), `B` in dimension at most `2`, `D` for divisors.

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
