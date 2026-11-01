# Roadmap: affine Lie algebras, smooth modules and completed centers

**Summary.** Develop polynomial and formal currents of a Lie algebra, continuous central
extensions, smooth representations, congruence integration and completed enveloping algebras
(Layers A1–A5). Construct vacuum vertex algebras and prove the scalar center theorem away from
critical level and the Feigin–Frenkel isomorphism at critical level, with exact coordinate and
Poisson compatibility (Layers A6–A8). Build usable maps, transport, extensionality, quotients and
examples with each object, not just a path to these headline theorems.

## Scope and ownership

This roadmap owns:

- currents `F ⊗ L` and their completion, continuous cochains, the residue cocycle, the
  finite-dimensional complex Whitehead lemmas and the classification of continuous two-cohomology
  of `g((t))` (A1);
- the central extensions `ĝκ`, levels, `h∨`, the affine loop lift and the coordinate group
  `Aut(O)`, the algebraic level quotient `Uκ` and its left ideals `I_N` (A2);
- smooth modules, the polynomial/formal comparison and rational integration to `K_N` (A3);
- the completion `Ûκ` and completed loop/coordinate lifts (A4);
- the smooth-module adapters, continuous coinduction, central-character quotients, the
  smooth/completed module equivalence and the field calculus (A5);
- formal vertex algebras with the Borcherds identity, the vacuum vertex algebras `Vκ`, Sugawara
  vectors, the generic weight-one Lie theorem and the critical deformation family (A6);
- the vacuum center theorems, the free-field prerequisites (Heisenberg Fock vertex algebras of a
  symmetric bilinear space, Wakimoto modules, screenings) and the jet invariant theorem (A7);
- the completed center theorems, the noncritical extended-center argument and the exact
  Feigin–Frenkel, coordinate and Poisson normalizations (A8).

It leaves to their owners, consumed by section:

- group versus Lie-algebra invariants `V^G = V^g` for connected groups and the finite Chevalley
  restriction and Kostant slice theorems: FormalConnectionsOpers F4.3;
- formal loop groups, `K_N`, exponential/BCH comparisons, opers, Drinfeld–Sokolov reduction,
  Miura maps and classical screenings: FormalConnectionsOpers F1–F8;
- finite root data, ADE classification and highest-weight theory: RootSystems, LieHighestWeight;
- the pinned reductive group, opposite Borels and polynomial big-cell coordinates: ReductiveGroups
  Layers 6–7, especially §7C;
- coherent categorical actions, fibres and descent over opers, the outer-derivation to `Ext¹`
  comparison and finite-Artinian scalar-extension adapters: GeometricRepresentationCategories.

Ordinary universal enveloping algebras, PBW, finite Casimirs and induction keep their existing
owners. Compatible equivalences along dual gauge arrows remain the separately owned conjecture
statement; no categorical-lift or global Langlands theorem is requested here.

## Conventions

Basic current and vertex theory is over a characteristic-zero field `𝕜`. Continuous
classification, integration and center theorems concern a finite-dimensional complex simple Lie
algebra `g`; simple includes nonabelian. Coefficients have the **discrete** topology, using a type
synonym so as not to change Mathlib's usual complex topology. In the basic theory `F = 𝕜((t))`
and `O = 𝕜[[t]]`; specialize to `𝕜 = ℂ` for classification, integration and centers. `F` has the
`t`-adic linear topology. Orders are integers; positive orders are cofinal for neighbourhoods and
completions. For group actions fix the simply connected pinned group `G` with Lie algebra `g`, so
its Langlands dual `G∨` is adjoint. The positive `K_N` are unchanged under central isogeny; other
global loop-group forms are not substituted without handling their components.

Write `x_m = x ⊗ t^m`. For an invariant symmetric form `κ` use

    [x_m, y_n] = [x,y]_(m+n) + m κ(x,y) δ_(m+n,0) K,
    cκ(x⊗f, y⊗g) = −κ(x,y) Res(f dg).

Mathlib `LoopAlgebra.residuePairing Φ` uses `+Res(f dg)`, so `Φ = −κ`. Set
`κc = −½ killingForm ℂ g`. For `κ0` normalized so that its inverse Cartan form on `h*` gives long
roots squared length 2, `Killing = 2h∨κ0` and `κc = −h∨κ0`. A scalar level `k` means `κ = kκ0`.
`K` is the distinguished central generator and acts as 1 in the level category. `κ = 0`, the split
extension, is included. No degree derivation is silently added.

Vertex algebras use `Y(a,z) = Σ_(n∈ℤ) a_(n) z^(−n−1)`, so `a_(n)` is the field coefficient at
`z^(−n−1)`; conformal operators are `L_m = ω_(m+1)` and `L_(−1) = ω_(0) = T`. Formal locality is
coefficientwise annihilation by a power of `z − w`, not analytic convergence.

## Exact supplier contracts

**From Mathlib.**

- `LieAlgebra.loopAlgebra`, `LoopAlgebra.toFinsupp`, `LoopAlgebra.residuePairing` and
  `loopAlgebra.twoCocycleOfBilinear` (`Mathlib/Algebra/Lie/Loop.lean`): the polynomial loop
  algebra and its residue cocycle, with `+Res(f dg)` in the second mode index.
- `LieModule.Cohomology.d₁₂`, `d₂₃`, `twoCocycle` (`Mathlib/Algebra/Lie/Cochain.lean`): alternating
  Chevalley–Eilenberg cochains; `d₁₂` has trivial-coefficient formula `−f([x,y])`.
- `LieAlgebra.ofTwoCocycle`, `Extension.ofTwoCocycle`, `Extension.twoCocycleOf`,
  `oneCochainOfTwoSplitting`, `d₁₂_oneCochainOfTwoSplitting` (`Mathlib/Algebra/Lie/Extension.lean`):
  cocycle extensions and the section-change coboundary.
- `killingForm`, `LieModule.traceForm` and its invariance `LieModule.traceForm_lieInvariant`
  (`Mathlib/Algebra/Lie/TraceForm.lean`); `UniversalEnvelopingAlgebra`.
- `HVertexOperator` and `HVertexOperator.coeff` (`Mathlib/Algebra/Vertex/HVertexOperator.lean`):
  linear maps into Hahn modules over `ℤ` and their coefficient maps. They supply lower truncation
  of each `Y(a,z)b`, not vertex axioms, vacuum or grading.
- `LaurentSeries`, `HahnSeries`, summable families; `SymmetricAlgebra`; `DirectSum.IsInternal`.
- `ModuleCat.coextendScalars`, `ModuleCat.restrictCoextendScalarsAdj`
  (`Mathlib/Algebra/Category/ModuleCat/ChangeOfRings.lean`), `ObjectProperty.FullSubcategory`,
  `EnoughInjectives.of_adjunction`, `hasExt_of_enoughInjectives`, `TwoSidedIdeal`,
  `Subalgebra.center`, `Filter.HasBasis`.
- `Matrix.SpecialLinearGroup`.

**From Tau Ceti.**

- `Algebra/Lie/UniversalEnveloping/Basic` (generator induction, representations, center criterion),
  `pbwAssociatedGradedEquiv` (`PBW/Injective`) and `UniversalEnvelopingAlgebra.ι_injective`
  (`PBW/Embedding`), both for free modules, hence over `ℂ`.
- `TauCeti.exists_isCompl_of_isKilling` (complete reducibility of finite-dimensional modules over
  a Lie algebra with nondegenerate Killing form); Mathlib `LieAlgebra.IsSemisimple` and the Cartan
  criterion `LieAlgebra.HasTrivialRadical.instIsKilling`.
- `TauCeti.SpecialLinear.coordinateHopfAlgebra`, `SpecialLinear.pointsMulEquiv`,
  `GeneralLinear.genericMatrix` (`Algebra/AlgebraicGroup/SpecialLinear/Basic`).

**From TauCetiRoadmap.FormalLaurentPuiseux.** L1–L3: Laurent coefficient topology, substitution
(anti-composition of substitution parameters) and continuous differential/residue calculus.

**From TauCetiRoadmap.FormalConnectionsOpers.** F1–F3: pinned `G(R((t)))`, positive congruence
groups `K_N`, the exponential `exp : a_N ≃ K_N` with inverse `log`, finite-jet and BCH
compatibility, adjoint action and Maurer–Cartan differential with `dlog(g) = (dg)g⁻¹`. F4.3: group
versus Lie-algebra invariants for connected groups, `S(g*)^G ≃ S(h*)^W` with generators `P_i` of
degrees `d_i + 1`, the Kostant regular/slice theorem and the codimension of the nonregular locus.
F5–F8: regular and punctured opers, their function algebras `Fun Op(D)` and `Fun Op(D×)`,
coordinate action, Miura transforms, classical W-algebras and screenings and their sign
conventions. The classical-screening supplier contract is F7.5: its exponential-charge
modules, translation-compatible dual-root screening derivations and Miura screening-kernel
identification are inputs to A7.1–A7.3. A7.1 owns the restriction of the quantum Wakimoto
intertwiners and its comparison with these supplied derivations. F7.5 constructs its classical
objects independently of the affine vertex algebras and their centers; none of F1–F8 consumes
Feigin–Frenkel.

**From TauCetiRoadmap.LieHighestWeight.** Layers 1, 3, 5 and 7: Cartan and root spaces,
highest-weight modules, complete reducibility, Harish–Chandra and Chevalley theory.

**From TauCetiRoadmap.RootSystems.** Finite ADE classification, realizations and numbered integral
root data.

**From TauCetiRoadmap.ReductiveGroups.** Layers 6–7, especially §7C: opposite Borels,
root subgroups and ordered polynomial coordinates on the big cell of the given pinned group.

## How to read the build

A1 and A2 construct currents, central extensions, current lifts and the algebraic level
quotient. A3 constructs smooth modules and congruence integration; A4 completes the level algebra
and extends the lifts; A5 proves the module equivalence and develops fields. A6 constructs generic
and vacuum vertex algebras. A7 constructs free fields and jet invariants before the vacuum center
theorems. A8 constructs the critical completed center, proves the noncritical scalar-center theorem
and pins the Feigin–Frenkel normalizations. Each subsection's Needs line specifies its inputs.

## Layer A1: currents and continuous cohomology

### A1.1 Algebraic and completed currents

Construct `F ⊗_𝕜 L`, positive currents `O ⊗ L` and order subspaces `a_N = t^N O ⊗ L` as base
change of a Lie `𝕜`-algebra `L`, with the topology for which the `a_N` form a basis of
neighbourhoods of zero. Construct the completed currents `L((t))^ = lim_N (F ⊗ L)/a_N` and identify
them with `L`-coefficient Laurent series of finite lower order, which may have infinitely many
nonzero positive coefficients. Derive this coefficient description from the compatible quotients:
a compatible family fixes a finite negative tail at its order-one stage, and each subsequent stage
fixes one further coefficient (Frenkel, §1.3.1, pp. 19–20, for finite-dimensional currents;
FormalLaurentPuiseux L1 for the scalar topology). The arbitrary-dimensional extension and its
completeness criterion are proved here by this argument. *Needs:* FormalLaurentPuiseux L1; Mathlib `LieAlgebra.loopAlgebra`.

**API.**

- Coefficient maps `F ⊗ L → L`, coefficient extensionality on `F ⊗ L` and on the completion, and
  bracket convolution of coefficients, by the preceding compatible-quotient construction.
- `[a_M, a_N] ⊆ a_(M+N)` for all integers `M, N`; the bracket extends continuously to the
  completion and makes it a Lie algebra, by the coefficient convolution and its finite sums at each order.
- The polynomial inclusion from `loopAlgebra 𝕜 ℤ L` is injective with dense image, by the
  coefficient extensionality and truncations just constructed (scalar comparison: FormalLaurentPuiseux L1).
- The completion is Hausdorff and complete; `F ⊗ L` embeds in it as a dense Lie subalgebra, and
  the embedding is surjective exactly when `L` is finite-dimensional. In particular `F ⊗ L` is
  complete exactly when `L` is finite-dimensional; for finite-dimensional `L` the topology and
  the identification are independent of the basis; prove the converse by a sequence of linearly
  independent coefficients, as in the first Check below, rather than citing a finite-dimensional result.

**Checks.**

- Negative control for completeness: for the abelian `L = ⊕_(n≥0) 𝕜 e_n`, the partial sums
  `s_r = Σ_(n<r) t^n ⊗ e_n` satisfy `s_r − s_r' ∈ a_r'` for `r ≥ r'`, so they are Cauchy. A limit in
  `F ⊗ L` would have `t^n`-coefficient `e_n` for every `n`, but every element of `F ⊗ L` has its
  coefficients in one finite-dimensional subspace; in the completion the limit is `Σ_(n≥0) t^n e_n`.
- For `g = sl₂`, `e ⊗ t ∈ a_1` and `f ⊗ t⁻¹ ∈ a_(−1)` have bracket `h ⊗ 1 ∈ a_0`, which is not in
  `a_1`: the filtration estimate is sharp.
- `Σ_(n≥0) t^n ⊗ e` lies in `F ⊗ sl₂` but not in the polynomial image (infinitely many nonzero
  coefficients), while its truncations converge to it: density without surjectivity.

### A1.2 Continuous cochains and the residue cocycle

Build continuous alternating cochains with discrete trivial coefficients as subspaces of the
existing Chevalley–Eilenberg/multilinear carriers, with differential, kernels, images and quotient
cohomology `H*_cont`. Extend the residue pairing `cκ` by its finite coefficient formula for each
pair of formal currents. *Needs:* A1.1; Mathlib `d₁₂`, `d₂₃`, `twoCocycle`,
`LoopAlgebra.residuePairing`; FormalLaurentPuiseux L2–L3.

**API.**

- `d² = 0` and functoriality of `H*_cont`.
- A bilinear cochain is jointly continuous exactly when it is separately continuous and
  `c(a_N, a_N) = 0` for some `N`; this criterion agrees with continuity for the product topology.
- `cκ` is jointly continuous, alternating, a cocycle and invariant under formal coordinate
  changes; its restriction to polynomial currents is Mathlib's residue cocycle for `Φ = −κ`.

**Checks.**

- `cκ(x_m, y_n) = m κ(x,y) δ_(m+n,0)`: for `sl₂` with the trace form `κ0`,
  `c(h_1, h_(−1)) = 2`, `c(h_(−1), h_1) = −2` and `c(e_1, f_(−1)) = 1`.
- The plausible wrong model `κ(x,y) Res(f g dt)` takes the value `κ0(h,h) = 2` on both
  `(h_0, h_(−1))` and `(h_(−1), h_0)`: it is symmetric, not alternating.
- `cκ` vanishes on `a_0 × a_0` (both orders nonnegative forces `m = n = 0` and the factor `m`
  vanishes), so `N = 0` witnesses joint continuity, and the positive currents split.

**The Whitehead lemmas.** For a finite-dimensional complex semisimple Lie algebra `L` and a
finite-dimensional `L`-module `M`, on Mathlib's cochains: prove `complexWhitehead_one`, every
`f` with `d₁₂ f = 0` has the form `x ↦ x·v` (every derivation is inner), and
`complexWhitehead_two`, every element of `LieModule.Cohomology.twoCocycle ℂ L M` is `d₁₂ f`.
Route: semisimple implies trivial radical and so a nondegenerate Killing form by the Cartan
criterion, and `TauCeti.exists_isCompl_of_isKilling` complements every submodule. For a
one-cocycle `f`, the module `M ⊕ ℂ` with `x·(v,s) = (x·v + s f(x), 0)` has a complement of `M ⊕ 0`
spanned by some `(v₀, 1)`, killed by `L`, so `f(x) = x·(−v₀)`. For a two-cocycle, split
`M = M^L ⊕ M′`; on `M′` use an equivariant projection of `Hom(L, M′)` onto the image of
`v ↦ (z ↦ z·v)`, and on the invariants reduce to the degree-one lemma for the dual module
(Weibel, *An introduction to homological algebra*, Corollaries 7.8.10 and 7.8.12, pp. 245–246). *Needs:* Mathlib `d₁₂`, `twoCocycle`,
`LieAlgebra.HasTrivialRadical.instIsKilling`; Tau Ceti `TauCeti.exists_isCompl_of_isKilling`.

**Checks.**

- For `L = sl₂` and trivial `M = ℂ`, `(d₁₂ f)(e, f′) = −f([e, f′]) = −f(h)`; the cocycle `c` with
  `c(e, f′) = 1`, `c(h, e) = c(h, f′) = 0` is `d₁₂ f` for `f(h) = −1`, `f(e) = f(f′) = 0`
  (checking `c(h,e) = −f(2e) = 0`).
- Negative control: on the abelian two-dimensional `L = ℂe₁ ⊕ ℂe₂` with trivial `M = ℂ`,
  `d₁₂ = 0` and the alternating form `c(e₁, e₂) = 1` is a cocycle but not a coboundary;
  semisimplicity excludes it.
- For the adjoint module of `sl₂`, the derivation `ad h` is `x ↦ x·(−h)`, the coboundary of `v = −h`
  in the convention `f(x) = x·v`.

### A1.3 Classification of continuous two-cohomology

For finite-dimensional complex simple `g` prove the linear equivalence

    invariant symmetric forms on g ≃ H²_cont(g((t)), ℂ),   κ ↦ [cκ].

Prove surjectivity and uniqueness. Normalize a continuous cocycle against the constant semisimple
subalgebra using A1.2's degree-one and degree-two Whitehead lemmas for finite-dimensional
modules; build the mode-block and coefficient-module adapters here without assuming Whitehead for an
arbitrary infinite-dimensional module. Use invariance/perfectness and the mode recurrence to reduce
polynomial values to the residue class. Construct the normalizing coboundary on formal currents and
prove its continuity before extending the identity; density alone does not supply it. Prove nonzero
class detection, one-dimensionality for simple `g` and the finite-product semisimple version.
Extend the classification to every discrete coefficient vector space `Z` with trivial action:
`H²_cont(g((t)), Z) ≃ Z` via a fixed nonzero residue cocycle, constructing the normalizing
continuous coboundary without a finite-dimensional hypothesis on `Z`. This supplies A2
universality for arbitrary discrete kernels. It is continuous, not unrestricted algebraic,
cohomology (Frenkel, *Langlands correspondence for loop groups*, §1.3.5). *Needs:* A1.2,
`complexWhitehead_one`, `complexWhitehead_two`.

**Checks.**

- Nonzero class detection on `sl₂`: `c_(κ0)(h_1, h_(−1)) = 2`, while every coboundary takes the
  value `−f([h,h]_0) = 0` on this pair.
- For `g = sl₂ × sl₂` the class group is two-dimensional, one residue class per factor.
- Negative control for the simplicity hypothesis: for abelian one-dimensional `L = ℂ`, coboundaries
  vanish and `c(f,g) = f_0 g_1 − f_1 g_0` is a continuous cocycle (it vanishes on `a_2 × a_2`) with
  `c(1, t) = 1`, while the residue cocycle has `Res(1·dt) = 0` there; continuous `H²` is more than
  one-dimensional although invariant forms on `ℂ` form a line.

### Examples

The polynomial and formal `sl₂` cocycles: `c(e_m, f_n) = m δ_(m+n,0)` for `κ0`, and the formal
current `Σ_(n≥0) t^n ⊗ e` pairs against `f ⊗ t^(−1)` with value `c = 1·1 = 1` from the single
`n = 1` term.

### Dependencies

FormalLaurentPuiseux L1–L3; Mathlib Lie cochains, loop algebras and the Cartan criterion; Tau Ceti
complete reducibility.

## Layer A2: central extensions, levels and loop lifts

### A2.1 The extensions ĝκ and universality

Construct `ĝκ = g((t)) ⊕ ℂK` with its Lie laws, continuous inclusion and projection,
kernel/image exactness and a continuous linear section; build its polynomial counterpart and dense
embedding. Changing the section changes the cocycle by the pinned Chevalley–Eilenberg coboundary,
and equivalent extensions give the same class. Classify continuously linearly split central
extensions with discrete one-dimensional kernel; prove splitting for strict exact extensions of
the formal-current linear topology with this kernel by exhibiting an open subspace meeting the
kernel trivially and extending its linear splitting. No undefined Tate-space hypothesis is used.
Prove the nonzero residue extension's universal property among continuously linearly split central
extensions with arbitrary discrete vector-space kernels, using A1.3, and give the universal-kernel
comparison. *Needs:* A1.3; Mathlib `LieAlgebra.ofTwoCocycle`, `Extension.twoCocycleOf`,
`d₁₂_oneCochainOfTwoSplitting`.

**API.**

- `g((t))` is perfect; `ĝκ` is perfect exactly when `κ ≠ 0`.
- Positive currents and `a_N` for `N ≥ 0` split canonically because their cocycle vanishes.

**Checks.**

- For `κ = κ0` on `sl₂`, `[e_1, f_(−1)] = h_0 + K`, so `K = [e_1, f_(−1)] − [e_0, f_0]` lies in the
  derived algebra; for `κ = 0` the extension is split and `K` is not a commutator.
- The section change by `f : g((t)) → ℂ` changes the cocycle by `d₁₂ f`, with value `−f([x,y])`;
  for `f(h_0) = 1` and zero elsewhere the cocycle on `(e_0, f_0)` changes by `−1`.
- The positive-current cocycle `c(x_m, y_n)` with `m, n ≥ 0` is `m κ δ_(m+n,0) = 0`.

### A2.2 Invariant forms, the dual Coxeter number and levels

Prove that invariant forms on simple `g` are multiples of the Killing form. Define `h∨`
intrinsically by the highest-coroot/root-data formula, prove its equivalence with one half of the
adjoint Casimir scalar for `κ0` and `Killing = 2h∨κ0`, including positivity and integer values by
type. If `κ' = λκ` with `λ ≠ 0`, prove that the identity on currents with `K ↦ λK'` is a Lie
equivalence; prove scalar-central-character transport, including `K = a` versus the form `aκ` with
`K = 1`: for `a ≠ 0` through the affine Lie equivalence, for `a = 0` directly through the split
current representation. No Lie equivalence is inferred from a map killing the central generator (Frenkel, §1.3.6,
pp. 28–29, for rescaling, and §3.1.1, pp. 63–65, for the Casimir normalization).
*Needs:* A2.1; LieHighestWeight Layer 7; RootSystems.

**Checks.**

- `sl₂`: `Killing(h,h) = 8`, `κ0(h,h) = 2`, `h∨ = 2`, and `8 = 2·2·2`; hence `κc = −2κ0`.
- `sl_n`: `h∨ = n` and `Killing(x,y) = 2n tr(xy) = 2h∨ κ0(x,y)` with `κ0` the trace form.
- Pulling back a `K' = 1` module along the rescaling with `λ = 2` gives `K = 2`, so the rescaling
  alone is not an equivalence between the two `K = 1` categories.

### A2.3 The affine loop lift and the coordinate group

Using FormalConnectionsOpers' adjoint action and Maurer–Cartan differential, pin and prove the
affine lift

    g·(A + cK) = Ad_g A + (c + Res κ(g⁻¹dg, A)) K.

Prove compatibility with bracket, composition, inverse, `K`, continuity and congruence order
estimates. The supplier uses `dlog(g) = (dg)g⁻¹`; prove `Res κ(g⁻¹dg, A) = Res κ(dlog(g), Ad_g A)`.

Pin `Aut(O)` as the group of continuous coefficient-linear algebra automorphisms preserving `O`
and its maximal ideal, with `στ = σ ∘ τ`. If `φ_σ = σ(t)`, then `φ_(στ) = φ_τ ∘ φ_σ`; substitution
parameters compose in the reverse written order. Formal-coordinate substitution fixes `K`,
preserves the cocycle by residue invariance, preserves every current-order subspace, and the lifts on currents compose as `a_(στ) = a_σ ∘ a_τ`. Prove parameter-independent extension and splitting
comparisons (Frenkel, §1.3.6, pp. 29–30, and §§3.5.2–3.5.3, pp. 89–91). *Needs:* A2.1; the formal loop and oper supplier contract F1 and F3;
FormalLaurentPuiseux L1.

**Checks.**

- For `g = diag(t, t⁻¹) ∈ SL₂(ℂ((t)))`, `g⁻¹dg = h t⁻¹dt`, `Ad_g e_n = e_(n+2)`,
  `Ad_g f_n = f_(n−2)` and `g·h_0 = h_0 + 2kK` for `κ = kκ0`. Bracket preservation pins the sign:
  `g·[e_n, f_(−n)] = g·(h_0 + nkK) = h_0 + (n+2)kK = [e_(n+2), f_(−n−2)]`, whereas `−Res` would give
  `h_0 + (n−2)kK`.
- For a constant loop `g ∈ G(ℂ)`, `g⁻¹dg = 0` and the lift is `Ad_g` with `K` fixed.
- With `φ_σ = at` and `φ_τ = t + t²`, `φ_(στ) = φ_τ ∘ φ_σ = at + a²t²`, which differs from
  `φ_σ ∘ φ_τ = at + at²` whenever `a ≠ 0, 1`.

### A2.4 The algebraic level quotient

Form `Uκ` from the UEA of `ĝκ` by the **two-sided central relation** `ι(K) − 1`. Prove the `K = 1`
universal property, PBW/current injection and level transport. With fixed `κ0` prove the comparison
`Uκ ≃ U(ĝκ0)/(K_standard − k)` for `κ = kκ0`, including `k = 0`: it is the identity on currents,
sends each `I_N` to the corresponding standard-level `I_N`, is equivariant for the mode-degree
derivations and extends after adjoining the mode-degree derivation `d`. For `N > 0` define
`I_N = Uκ·ι(a_N)` as a submodule of the left regular module and the **module quotient**
`Q_N = Uκ/I_N`; prove antitonicity and transitions `Q_M → Q_N` for `M ≥ N`. Identify `Q_N` with `Uκ ⊗_(U(a_N)) ℂ` by the induction universal property
(Frenkel, §2.1.2, p. 34). *Needs:* A2.1, A2.2; Tau Ceti PBW and ordinary induction.

**API.**

- The current inclusion is injective and the quotient has the ordered PBW basis with `K` replaced by 1.
- A representation factors through `Uκ` precisely when `K` acts as 1.
- The quotient transitions preserve the cyclic vector and compose for increasing orders.
- For every `b ∈ Uκ` and `N` there is `M` with `I_M b ⊆ I_N`, by commuting high positive
  currents through a finite PBW word. Thus each `Q_N` is smooth; this estimate precedes completion.

**Checks.**

- In `Q_1` for `sl₂`, `h_0·1` is a nonzero PBW vector, whereas `h_1·1 = 0`.
- `I_N` is not two-sided: `e_N f_(−N)·1 = (h_0 + Nk)·1 ≠ 0` in `Q_N`.
- At `k = 0`, the standard-level quotient sets `K_standard = 0` and retains every current;
  the split extension itself is not isomorphic to the nonsplit central extension.

### Examples

The `sl₂` level-`k` extension with `κc = −2κ0` at `k = −2`; the loop `diag(t, t⁻¹)` above.

### Dependencies

A1; Tau Ceti PBW; the formal loop and oper supplier contract F1, F3;
FormalLaurentPuiseux L1; LieHighestWeight Layer 7; RootSystems.

## Layer A3: smooth modules and congruence integration

### A3.1 Smooth modules and the polynomial/formal comparison

Smoothness is `∀ v ∃ N > 0, a_N·v = 0`, with `N` depending on `v`. Build the category with
Lie-linear morphisms, the `K = 1` full subcategory, kernels, cokernels, sums, restriction and
induction/adjunctions using the existing Lie/UEA APIs, and the PBW description of the
congruence-induced modules `Q_M = Uκ ⊗_(U(a_M)) ℂ`. Subquotients and finite sums are smooth;
products take smooth vectors of the ordinary product. Prove that polynomial restriction is an
equivalence with polynomial modules satisfying `∀ v ∃ N ∀ x ∈ g ∀ n ≥ N, x_n·v = 0`: define the
formal action by finite truncation on each vector and prove cutoff independence, common estimates
for the Lie law, uniqueness, morphism transport, inverse functors and central-character
compatibility. *Needs:* A1.1, A2.4; Mathlib `UniversalEnvelopingAlgebra`; Tau Ceti PBW.

**Checks.**

- The left regular module `Uκ` is not smooth: `x_N·1 = x_N ≠ 0` by PBW for every `N`.
- The infinite positive current `Σ_(n≥1) e_n` acts on the generator `v` of `Q_M` by the finite sum
  `Σ_(1≤n<M) e_n·v`, and by `0` on a vector killed by `a_1`.
- Finite monomials describe the dense polynomial subalgebra only: `Σ_(n≥0) t^n ⊗ e` is not a
  finite sum of monomials but acts on each smooth vector.

### A3.2 Rational integration to K_N

For `N > 0` use `K_N = ker(G(O) → G(O/t^N))` and its pro-unipotent jet quotients, with the
supplier's `exp : a_N ≃ K_N`. Prove the identification of A1's current-order Lie algebra with the
supplier's congruence Lie carrier and the compatible jet projections. A rational `K_N`-module is a
comodule over its coordinate Hopf algebra: each vector lies in a finite-dimensional rational
submodule factoring through a finite jet quotient. Prove differentiation, unique integration,
finite-jet exponential formulas and morphism compatibility; an integrating action implies
smoothness. Pin the local-nilpotence dictionary: when the cyclic `a_N`-submodule of a vector
factors through a finite nilpotent jet Lie algebra, pointwise local nilpotence gives
finite-dimensional nilpotent rational orbits by Engel/PBW; prove joint nilpotence and jet
factorization before exponentiation. "Locally nilpotent action" is used in this rational-orbit
sense, not for arbitrary discontinuous pronilpotent representations.

Prove the finite-generation theorem: every finitely generated smooth `Uκ`-module admits a rational
integrating `K_N`-action for some `N > 0`; if `M > 0` is a common annihilating order for finitely
many generators, `N` may be taken to be `M`. Present the module as a quotient of a finite sum of
congruence-induced modules; on each `Q_M`, `a_M` does not increase PBW length while raising the loop
degree of its finite orbit, giving finite-jet rationality; descend the action and prove uniqueness
and intertwining with the current-level A2.3 lift (Frenkel, *Langlands correspondence for loop groups*,
§1.3.1 and Lemma 1.3.1). *Needs:* A3.1, A2.3; the formal loop and oper supplier contract F3.1.

**Checks.**

- `⊕_(M>0) Q_M` is smooth but has no common integrating `K_N`: for `M > N`, `a_N` acts on `Q_M`
  by a non-nilpotent PBW action.
- `N = 0` is excluded: `[[−1, 1], [0, −1]] ∈ SL₂(ℂ) ⊂ G(O)` is not an exponential, so
  `exp : a_0 → K_0` is not surjective.
- Objectwise isomorphisms with `K_N`-modules alone give no coherent rational action: finite
  generation is retained in the uniform-`N` theorem.

### Examples

The induced modules `Q_M` for `sl₂`, with `a_M` acting nilpotently on each finite PBW-length piece.

### Dependencies

A1, A2; the formal loop and oper supplier contract F3.1; Tau Ceti PBW.

## Layer A4: central-level UEA and left-ideal completion

### A4.1 The left-ideal completion

Use A2.4’s algebraic level quotient and module quotients. Define `Ûκ` as the
compatible-family inverse limit of the discrete modules `Q_N` (Frenkel, *Langlands correspondence
for loop groups*, §2.1.2, p. 34). *Needs:* A2.4, A3.1; Tau Ceti PBW.

**API.**

- `Ûκ` is linearly complete and Hausdorff with the coordinate topology; the canonical map from
  `Uκ` is dense, and `⋂_N I_N = 0` by PBW.
- Multiplication: the action of `Uκ` on each smooth `Q_N` extends uniquely to `Ûκ` by vectorwise
  cutoffs; `(ab)_N = a·b_N` is well defined, agrees on `Uκ`, and is distributive, unital and
  associative. The kernels `ker π_N` are closed left ideals and `∀ b ∈ Ûκ ∀ N ∃ M,
  (ker π_M) b ⊆ ker π_N`, giving joint continuity of multiplication.
- The polynomial and formal completed algebras are equivalent, with inverse maps, topology and
  generator compatibility.

**Checks.**

- `I_N` is not two-sided: on `sl₂`, `e_N f_(−N) ≡ h_0 + Nk` modulo `I_N`, which is nonzero in `Q_N`
  by PBW.
- For arbitrary `P_N ∈ Uκ` and `A_N ∈ g`, `P_0 + Σ_(N≥1) P_N ι((A_N)_N)` converges in `Ûκ` since
  its `N`-th term lies in `I_N`; no norm bound on `P_N` is needed, and its action on a smooth
  vector is the finite sum below the vector's annihilating order.
- At `k = 0` the comparison is an algebra isomorphism but not induced by a Lie equivalence: `ĝ_0`
  is split while `ĝκ0` is not.

### A4.2 Completed loop and coordinate lifts

Extend the lift through the UEA to `Uκ` algebra automorphisms preserving `ι(K) − 1`; for each loop
element `g` and `N` prove `a_g(I_M) ⊆ I_N` for some `M`, and the inverse estimate, from current
order bounds and vanishing of the central Maurer–Cartan residue on high positive currents; extend to
continuous automorphisms of `Ûκ` with continuous inverse, generator compatibility, product/inverse
laws and the semidirect conjugacy `a_σ a_g a_σ⁻¹ = a_(σ(g))`.

Coordinate lifts preserve every `I_N`. Prove that both kinds of lift extend uniquely from the
dense algebraic quotient, preserving their composition, inverse and semidirect laws. Extend A2.4's
standard-level comparison continuously, also after adjoining `d`, matching the extended Verma
modules of A8.2 (Frenkel, §2.1.2, p. 34; §§3.5.2–3.5.3, pp. 89–91).
*Needs:* A2.3, A2.4, A4.1.

**Checks.**

- The completed lift of `diag(t,t⁻¹)` sends `h_0` to `h_0 + 2k`, since `K = 1`.
- A constant loop has zero residue correction, so its extension acts by the usual adjoint action.
- For coordinates `φ_σ = 2t`, `φ_τ = t+t²`, the composite parameter is `2t+4t²`,
  not `2t+2t²`, on both the dense currents and their completion.

### Examples

For `sl₂`, the element `Σ_(N≥1) f_(−N) e_N` of `Ûκ` (a Segal–Sugawara-type tail) converges and acts
on each smooth vector by a finite sum.

### Dependencies

A2, A3; Tau Ceti PBW.

## Layer A5: completed modules and field calculus

### A5.1 Smooth and continuous module properties

For an associative algebra `A` with a decreasing family of left ideals `J_N`, define the
`ModuleCat A` object property `genericSmoothProperty`, `∀ v ∃ N, J_N·v = 0`, and the property
`genericContinuousProperty` that every orbit map `a ↦ a·v` into the discrete module is
continuous. Prove `genericSmooth_iff_continuous`: the two agree when the `J_N` form a basis of the
neighbourhoods of zero, expressed by `Filter.HasBasis` (Frenkel, *Langlands correspondence for
loop groups*, §2.1.2). *Needs:* Mathlib `ModuleCat`, `ObjectProperty`, `Filter.HasBasis`.

For the submodule, coreflection and product API below, assume in addition
`∀ b ∈ A ∀ N ∃ M, J_M b ⊆ J_N`. A topological algebra with this left-ideal neighbourhood basis
satisfies the estimate by continuity of right multiplication. The equivalence
`genericSmooth_iff_continuous` itself needs only a topological additive group and the basis condition.

**API.**

- Both properties are invariant under module isomorphisms and closed under kernels, cokernels,
  images, arbitrary direct sums and finite products, giving an abelian full subcategory
  (`ObjectProperty.FullSubcategory`).
- The smooth-vector submodule functor is right adjoint to the inclusion; its `A`-stability uses
  `∀ b, N ∃ M, J_M b ⊆ J_N`, assumed above (or obtained from a topological algebra); products are the
  smooth part of the ordinary product.
- For a continuous algebra homomorphism, restriction preserves both properties when the pullback
  neighbourhood bounds hold, with the carrier/action/morphism formulas.

**Checks.**

- `A = ℂ[[x]]` with `J_N = x^N A`: `A/x^N` is smooth, while in the ordinary product
  `∏_N A/x^N` the vector `(1, 1, …)` is killed by no `x^M`, so the ordinary product is not smooth.
- Negative control for `HasBasis`: with `A = ℂ[[x]]` (`x`-adic topology) but `J_N = A`, the
  module `A/x` is continuous (the kernel `xA` of its orbit map is open) but not smooth.
- `ℂ((x))` as a discrete `ℂ[[x]]`-module is neither: the orbit map of `x⁻¹` has kernel `0`, which
  is not open, and no `x^N` kills `x⁻¹`.

- Without the estimate, take `A = M₂(ℂ)` and every `J_N = A E₁₁`. In `ℂ²`, the vectors killed
  by `J_N` are `ℂe₂`, but `E₁₂e₂ = e₁` and `E₁₁e₁ = e₁ ≠ 0`; also
  `E₁₁E₁₂ = E₁₂ ∉ A E₁₁`. For `J_N = x^Nℂ[[x]]` the estimate holds with `M = N`.

### A5.2 Continuous coinduction and enough injectives

For a coefficient-linear topological algebra `A` over the discrete field `ℂ` with a decreasing
left-ideal neighbourhood basis `J_N` and A5.1’s right-multiplication estimate, construct continuous
coinduction of a discrete vector space `V` as `Hom_cont,ℂ(A, V)`, the continuous submodule of
`ModuleCat.coextendScalars (algebraMap ℂ A)`, whose action is `(b·f)(a) = f(ab)`; obtain the
adjunction by composing `restrictCoextendScalarsAdj` with the smooth-part coreflection. Prove this
action is smooth (the kernel of `f` contains some `J_N` and `aJ_N ⊆ J_N`), and conversely that
`J_N·f = 0` makes `f` continuous; give the unit, counit and morphism formulas. The forgetful functor
preserves and reflects monomorphisms, so `EnoughInjectives.of_adjunction` applies: the unit
`m ↦ (a ↦ am)` is injective by evaluation at `1`, and every vector space is injective. Provide
`EnoughInjectives` and `HasExt.{max u w}` for the smooth category over `ModuleCat.{max u w} A`
with `A : Type u`, via `hasExt_of_enoughInjectives.{max u w}` and `LocallySmall.{max u w}`, so that
Ext lives in the module Hom universe rather than the larger default of `HasExt.standard`. This is
ambient smooth-module Ext, not fixed-central-character Ext. Derive the continuous adjunction
from the algebraic one by A5.1’s coreflection; the affine instance is Frenkel, §2.1.2, p. 34.
*Needs:* A5.1; Mathlib
`ModuleCat.coextendScalars`, `restrictCoextendScalarsAdj`, `EnoughInjectives.of_adjunction`.

**Checks.**

- For `A = ℂ[[x]]`, `Hom_cont(A, ℂ)` is the space of functionals vanishing on some `x^N A`, of
  countable dimension, with `(x·f)(x^k) = f(x^(k+1))`.
- The unit `ℂ → Hom_cont(A, ℂ)` for the module `A/x` sends `1` to the functional `a ↦ a(0)`, which
  is nonzero at `a = 1`.
- Ordinary coextension is larger: a linear functional on `ℂ[[x]]` with `f(x^k) = 1` for every `k`
  (extended from polynomials by zero on a complement) is nonzero on every `x^N A`, so it is not
  continuous, and the continuous part is a proper submodule.

### A5.3 Central characters and automorphism pullback

For a complete Hausdorff topological algebra `A` and a closed ideal `L` of its center, form the
closed two-sided ideal `J` generated by `A·L` (via `TwoSidedIdeal` and the quotient topology).
Prove that continuous discrete `A`-modules killed by `L` are exactly the restrictions of continuous
discrete `A/J`-modules, with natural inverse functors on the same carriers; action kernels are
closed, so killing `L` kills the closure of `A·L`. For a continuous central character `χ` apply this
to `L = ker χ` and prove the equivalent equation `z·v = χ(z)v`. A continuous algebra automorphism
`a` carries `L` to `a(L)`; module pullback along `a⁻¹` carries `χ` to `χ ∘ a⁻¹`, preserves the module
properties and fixes the `χ` object property when `χ ∘ a⁻¹ = χ`. Coherent group/groupoid actions
belong to GeometricRepresentationCategories. Derive the quotient equivalence from the algebraic
quotient universal property and closed annihilators; the central-character specialization is
Frenkel, §1.3.6, p. 30, transported through §2.1.2, p. 34. *Needs:* A5.1; Mathlib `TwoSidedIdeal`, change of
rings.

**Checks.**

- `A = ℂ[[x]]`, `L = xA`, `χ(x) = 0`: modules killed by `L` are `A/x = ℂ`-modules, i.e. vector
  spaces.
- For the automorphism `x ↦ 2x` of `ℂ[[x]]` and `χ` with `χ(x) = 0`, `χ ∘ a⁻¹ = χ`, so the fibre is
  preserved; for the discrete algebra `A = ℂ[y]` with `χ(y) = 1` and the automorphism `y ↦ y + 1`,
  `(χ ∘ a⁻¹)(y) = χ(y − 1) = 0`, so the fibre moves.
- Killing `L` but not its closure is impossible for continuous discrete modules: the annihilator of
  a vector is open, hence closed.

### A5.4 The smooth/completed module equivalence, completed centers and fields

Prove an equivalence between smooth `K = 1` affine modules and `Ûκ`-modules on discrete vector
spaces with continuous orbit maps, with extension/uniqueness and inverse functors (an open
annihilator restricts to smoothness), compatible with subquotients, induction, the polynomial/formal
comparison and central characters. Use `Subalgebra.center` for the completed center; prove
closedness and generator-detected centrality by density and continuity; it acts on every smooth
module. Develop `J^x(z) = Σ_n x_n z^(−n−1)`, derivatives, residues, delta/expansion identities and
normal ordering (negative modes left of nonnegative modes) on `HVertexOperator` and Hahn summable
families; prove that coefficients of the required products are well defined in `Ûκ` by `I_N`
estimates, with reindexing and action identities (Frenkel, §2.1.2, p. 34; §2.1.3, pp. 35–37,
and §2.2.5, pp. 46–49, for current fields and normal ordering). *Needs:* A4.1, A5.1, A5.3; Mathlib
`HVertexOperator`.

**Checks.**

- On a vector `v` killed by `a_1`, `J^x(z)v = Σ_(n≤0) x_n v z^(−n−1)` has at most a
  simple pole, with coefficient `x_0v`; on the cyclic vector of `Q_1` for `sl₂`, `h_0v ≠ 0` by PBW.
- On that vector, the constant coefficient of `:J^x J^y:(z)` is
  `x_(−1)y_(−1)v + x_(−2)y_0v + y_(−2)x_0v`; for `x = y = h` in `Q_1` it is
  `h_(−1)²v + 2h_(−2)h_0v`, with the extra PBW term nonzero.
- If `a_0v = 0`, the current has no negative powers and both extra constant terms vanish.
  Thus on the vacuum of `Vκ = Uκ/(Uκ·g[[t]])`, the constant term is `x_(−1)y_(−1)v`.
- The left regular `Uκ` (not smooth, A3.1) does not extend to a continuous `Ûκ`-module: the orbit of
  `1` would need `I_N·1 = 0` for some `N`.

### Examples

The congruence-induced module `Q_1 = Uκ/I_1` is smooth, its `Ûκ`-action continuous, and the Sugawara element of
A4 acts on it by a finite sum on each vector.

### Dependencies

A4; Mathlib category-theory and change-of-rings APIs; `HVertexOperator`. GeometricRepresentationCategories
consumes A5.1–A5.3 and owns coherent categorical transport.

## Layer A6: vacuum vertex algebras and deformation

### A6.1 Formal vertex algebras and the Borcherds identity

Define `FormalVertexAxioms` on the Hahn-series field carrier `HVertexOperator ℤ 𝕜 V V`: a linear
state–field map, vacuum and translation with `T1 = 0`, `Y(1,z) = id`, the full creation identity
`Y(a,z)1 = e^(zT)a` coefficientwise with no negative powers, the state-derivative identity
`Y(Ta,z) = ∂_z Y(a,z)`, operator translation covariance `[T, a_(n)] = −n a_(n−1)` as an independent
axiom, truncation, and locality `(z − w)^N [Y(a,z), Y(b,w)] = 0` read coefficientwise (Kac,
*Introduction to vertex algebras…*, Definition 1.4, p. 5; Bakalov–Kac, Definition 2.1, p. 3,
whose (2.14) is the covariance axiom and (2.17) the derivative identity as its consequence). Write
`formalMode A a n` for `a_(n)`. Prove `formalVertex_borcherds`: for all states and integer indices
`m, n, r` the three tails vanish beyond some `N` and

    Σ_i C(m,i) (a_(n+i) b)_(m+r−i) c
      = Σ_i (−1)^i C(n,i) ( a_(m+n−i) b_(r+i) c − (−1)^n b_(n+r−i) a_(m+i) c )

(Kac, *Introduction to vertex algebras…*, Proposition 3.1, p. 18, and (4.33), p. 29). Prove skew
symmetry `Y(a,z)b = e^(zT) Y(b,−z) a` (ibid. (3.24), p. 18), morphisms and modules, and the
extension theorem: translation-covariant, mutually local fields generating `V` from the vacuum
extend uniquely to a `FormalVertexAxioms` structure (ibid. Theorem 1.1, p. 5). Generator covariance
is a hypothesis of the extension theorem and is never inferred from the state-derivative identity.
*Needs:* Mathlib `HVertexOperator`, `HVertexOperator.coeff`, Hahn summable families.

**API.**

- Mode commutator formula `[a_(m), b_(n)] = Σ_(i≥0) C(m,i) (a_(i) b)_(m+n−i)` and associativity
  formula, as the specializations of `formalVertex_borcherds`.
- `T(a_(n) b) = (Ta)_(n) b + a_(n)(Tb)`, and `Ta = a_(−2) 1`.

**Checks.**

- Over any characteristic-zero field `𝕜`, the commutative vertex algebra `𝕜[x]` with `T = d/dx` and `Y(a,z)b = (e^(zT)a)·b` satisfies all
  axioms; all `a_(n)` with `n ≥ 0` vanish, and Borcherds reduces to associativity of `𝕜[x]`.
- Non-example: on `𝕜[x]` with `T = d/dx` but `Y(a,z)b = a·b` (no shift), creation fails:
  the `z^1`-coefficient of `Y(x,z)1` is `0`, whereas `Tx = 1`.
- On the rank-one Heisenberg vertex algebra (A7.1) with `B(h,h) = 1`, the commutator formula
  gives `[h_(1), h_(−1)] = (h_(0)h)_(0) + (h_(1)h)_(−1) = 0 + 1_(−1) = id`, from `h_(0)h = 0`,
  `h_(1)h = 1` and `Y(1,z) = id`.

- Over `ℚ`, the coefficient of `z²` in `Y(a,z)1` is `(1/2)T²a`; for `a = x²` in
  `ℚ[x]` and `T = d/dx`, it is `(1/2)·2 = 1`. In the rational Heisenberg algebra with
  `B(h,h) = 1`, `[h_(1), h_(−1)]1 = 1`; neither law requires complex scalars.

### A6.2 The vacuum vertex algebras Vκ

Construct `Vκ = Ind_(g[[t]] ⊕ ℂK)^(ĝκ) ℂ`, `g[[t]]` acting trivially and `K` by 1. Give its PBW
identification with `U(t⁻¹g[t⁻¹])`, vacuum, grading, translation, current fields and
reconstruction, and its `FormalVertexAxioms` structure from A6.1's extension theorem. Define its
center by vanishing of all nonnegative products, prove it is a commutative differential algebra
with product `u_(−1)v`, and identify it with the `g[[t]]`-invariants of `Vκ`. For noncritical `k`
build the `κ0`-dual-basis Sugawara conformal vector, basis independence, current/Virasoro
commutators and central charge `k·dim(g)/(k + h∨)`. At critical level use `S = ½Σ_a :J^a J_a:`
without division by `k + h∨`, and prove its coefficients central and nonscalar by PBW. Construct the
`Aut(O)` action from current reconstruction at every level. *Needs:* A6.1, A5.4, A2.2, A4.2.

**Checks.**

- For `sl₂` the graded dimensions of `Vκ` are `1, 3, 9` in weights `0, 1, 2`
  (`∏_(n≥1)(1 − q^n)^(−3)`).
- Sugawara central charge for `sl₂` is `3k/(k + 2)`: `c = 1` at `k = 1`, undefined at the critical
  level `k = −2`.
- For `E₈` at `k = 1`, `c = 248/(1 + 30) = 8`.

### A6.3 The deformation family and the critical bracket

Construct `κ_ℏ = κc + ℏκ0` over `ℂ[ℏ]` and its flat PBW lattice. Pin the formal completed-UEA
family as `lim_(N,r) Q_(N,ℏ)/ℏ^r`, equivalently `lim_N Q̂_(N,ℏ)`, where
`Q̂_(N,ℏ) = lim_r Q_(N,ℏ)/ℏ^r` and `Q_(N,ℏ) = U_ℏ/I_(N,ℏ)` over `ℂ[[ℏ]]`; an infinite-rank free
stage over `ℂ[[ℏ]]` is not itself `ℏ`-adically complete. Pin the vacuum family as its `ℏ`-adic
completion `lim_r V_ℏ/ℏ^r`, distinct from the graded free family, which is complete only gradewise.
Prove `ℏ`-torsion-freeness, flatness over `ℂ[[ℏ]]`, `ℏ`-adic completeness and specialization; for
every `r ≥ 1` construct the reductions over `ℂ[ℏ]/(ℏ^r)` and prove that reduction of the bi-indexed
family gives `lim_N Q_(N,ℏ)/ℏ^r`, with PBW stage descriptions, surjective transitions and the
Mittag-Leffler lifting argument (no interchange of tensor products with arbitrary inverse limits is
assumed). Export the order-`ℏ²` data over `ℂ[ℏ]/(ℏ³)`.

Construct the completed multiplication by A4's quotient-module argument over each `ℂ[ℏ]/ℏ^r` and
then the compatible `(N,r)` limit; export continuity, the closed left-ideal kernels of the stage
projections and the right-shift estimate: for every `b, N, r` there is `M` with
`(ker π_(M,r))·b ⊆ ker π_(N,r)`, where `M` may depend on `r`. Prove `ℏ`-torsion-freeness of every
`Q̂_(N,ℏ)` and its comparison with the finite-`r` stages. Extend A4.2's loop lift to the family with
`κ_ℏ` in its Maurer–Cartan term, with compatible `(N,r)` bounds, whose critical reduction is A4.2's
action. Construct the continuous ordered-PBW specialization section `s : A → A_ℏ` with `s(1) = 1`,
compatible with every `(N,r)` transition, and export division-by-`ℏ` estimates, the product defect
`c(z,w) = (s(zw) − s(z)s(w))/ℏ mod ℏ`, and for every lift `z_ℏ` of a critical central element the
divided loop change `(a_(ℏ,γ)(z_ℏ) − z_ℏ)/ℏ mod ℏ`, quantified over lifts.

Define the critical center bracket `{z,w} = ([z̃, w̃]/ℏ) mod ℏ`. Prove divisibility, lift
independence, centrality, antisymmetry, Jacobi, Leibniz and continuity. Export continuous
divided-commutator operators on central lifts with independence of the auxiliary lift, the
associative Leibniz identity, the change-of-lift formula `δ_(z_ℏ+ℏb_ℏ) = δ_(z_ℏ) + ad_(b_ℏ mod ℏ)`,
their reduction identities and the order-`ℏ²` commutator formula. Construct the vacuum vertex
Poisson structure from `ℏ`-linear polar products (Frenkel, *Langlands correspondence for loop
groups*, §8.1.4; Kac, *Introduction to vertex algebras…*, §4). *Needs:* A6.2, A4.1, A4.2.

**Checks.**

- For `sl₂` with `κ0(h,h) = 2` and `S(z) = Σ_n S_n z^(−n−2)`,
  `{S_m, S_n} = (m − n) S_(m+n) − ½(m³ − m) δ_(m+n,0)`; at `m = −n = 2` the central term is `−3`.
- `{z, w}` does not depend on the lift: replacing `z̃` by `z̃ + ℏb` changes `[z̃, w̃]/ℏ` by
  `[b, w̃]`, which vanishes modulo `ℏ` because `w` is central.
- `Σ_(r≥1) ℏ^r x_(−r)|0⟩` converges in the `ℏ`-adic completion of the vacuum family but is not in
  the graded free family, since it involves infinitely many PBW basis vectors: the two families
  differ.

### A6.4 The weight-one Lie algebra

Over a characteristic-zero field `𝕜`, define `GradedFormalVertexAxioms` as a formal vertex algebra with an `ℕ`-grading by an internal direct sum
of subspaces, `V_0 = 𝕜·1`, and the mode-degree rule: `a_(n) b` has weight `p + q − n − 1` when this
is nonnegative and vanishes otherwise. Define the zero product `weightOneZeroProduct` on `V_1`,
`(a, b) ↦ a_(0) b`, from the field coefficient at `z^(−1)`. Prove
`weightOneZeroProduct_alternating`, from skew symmetry `a_(0) b = −b_(0) a + T(b_(1) a) − …` with
`b_(1) a ∈ V_0 = 𝕜·1`, `T1 = 0` and higher terms of negative weight (Kac, *Introduction to vertex
algebras…*, (3.24), p. 18), and `weightOneZeroProduct_leibniz`, the case `m = 0` of the commutator
formula (ibid. Proposition 4.5 and Theorem 4.1(a), p. 26). Build the Lie ring on the existing
additive group of `V_1` and the compatible Lie 𝕜-algebra on its existing module structure,
with the bracket evaluation `[x, y] = x_(0) y`. *Needs:* A6.1.

**API.**

- The zero product is bilinear and stays in weight one by `1 + 1 − 0 − 1 = 1`.
- Skew symmetry and the scalar weight-zero space make it alternating; its mode commutator
  gives the Jacobi identity (Kac, (3.24), p. 18; Theorem 4.1(a), p. 26).
- Grading-preserving vertex morphisms restrict to Lie algebra morphisms on weight one, by
  preservation of mode zero; the Lie structure uses the given additive and scalar operations.

**Checks.**

- Rank-one Heisenberg vertex algebra: `(h(−1)1)_(0) (h(−1)1) = h(0) h(−1) 1 = 0`, an abelian `V_1`.
- The plausible wrong product `a_(1) b` is symmetric and lands in `V_0`: `(h(−1)1)_(1)(h(−1)1) =
  B(h,h)·1`.
- In the affine vacuum for `sl₂`, `e = e_(−1)1`, `f = f_(−1)1`, `h = h_(−1)1` have
  `[h,e] = 2e`, `[e,f] = h`, `[h,f] = −2f` at every level; the central term is zero for mode 0.

### Examples

The `sl₂` Sugawara vector at `k = 1` with `c = 1`; the critical `S` with `{S_m, S_n}` above.

### Dependencies

A2, A4, A5; Mathlib `HVertexOperator`. GeometricRepresentationCategories consumes A6.3's
section, divided changes and divided-commutator operators.

## Layer A7: vacuum center and proof prerequisites

### A7.1 Free-field prerequisites

**Heisenberg algebra and Fock vertex algebra.** For a finite-dimensional space `H` over a
characteristic-zero field `𝕜` and any symmetric bilinear form `B`, construct the Heisenberg Lie
algebra `(ℤ →₀ H) × 𝕜` with cocycle `c(x,y) = Σ_m m B(x_m,y_(−m))`. Construct its uncharged
Fock module `Sym(⊕_(n>0) H t^(−n))`: negative modes multiply, positive modes contract and
zero modes vanish. Reconstruct its vertex algebra by A6.1 (Frenkel, §6.2.1, (6.2-1), p. 172;
Kac, Example 1.3, p. 8, for the characteristic-zero free boson). Degenerate `B`, including
zero, is allowed; the complex application uses `H = h` and `B = (κ − κc)|h`.
*Needs:* A6.1; Mathlib `SymmetricAlgebra`, polynomial loop algebras and symmetric forms.

**API.**

- The cocycle is alternating and satisfies the cocycle identity; its central extension has
  `[h(m),k(n)] = m B(h,k) δ_(m+n,0)K` by the displayed formula.
- The Fock action has `K = 1` and `h(n)k(−m)1 = n B(h,k)δ_(n,m)1` for `m,n > 0`;
  oscillator monomials span, with the symmetric-algebra independence relations.
- Translation satisfies `[T,h(n)] = −n h(n−1)`; the fields are mutually local and reconstruct
  the Fock vertex algebra uniquely. Linear isometries induce maps preserving the vacuum and fields
  (Frenkel, §6.2.1, p. 172; A6.1’s extension theorem).

**Checks.**

- For `B(h,h) = 1`, `c(h_1,h_(−1)) = 1` and its reversal is `−1`; omitting the mode factor
  would give `1` in both orders and fail alternation.
- Rank one: `h(1)h(−1)1 = 1` and `h(2)h(−2)1 = 2`, while `h(1)h(−2)1 = 0`.
  The first five Fock dimensions are `1,1,2,3,5`.
- For `B = 0`, all contractions and nonnegative products vanish, although `h(−1)1` is
  nonzero when `h ≠ 0`. For `H = 0` the Fock space is `𝕜`, with vacuum 1 and translation 0.

**Beta-gamma fields.** For each positive root construct Weyl generators `β_(α,n)`, `γ_(α,n)`
with `[β_(α,m),γ_(β,n)] = δ_(α,β)δ_(m+n,0)`, the other brackets zero, and the Fock module
`M_g` on which `β_(α,n)1 = 0` for `n ≥ 0` and `γ_(α,n)1 = 0` for `n > 0`. Set
`β_α(z) = Σ_n β_(α,n)z^(−n−1)` and `γ_α(z) = Σ_n γ_(α,n)z^(−n)`. Thus the state-mode
index of `γ_(α,n)` is `n−1`, not `n`. Reconstruct the vertex fields on the polynomial
Fock carrier (Frenkel, §5.3.3, (5.3-3)–(5.3-5), p. 139; §5.4.1, pp. 142–143).
*Needs:* A6.1 and its reconstruction theorem; symmetric algebras and their derivations.

**API.**

- In the expansion with `z` outside `w`, the ordered singular parts are
  `β_α(z)γ_β(w) ∼ δ_(α,β)/(z−w)` and `γ_β(z)β_α(w) ∼ −δ_(α,β)/(z−w)`;
  beta-beta and gamma-gamma products are regular, by the Weyl commutators.
- Creation modes are the beta modes with index `< 0` and gamma modes with index `≤ 0`;
  prove the normal-order and derivative identities on their polynomial monomials
  (Frenkel, §5.4.1, pp. 142–143).
- Give the grading and character with both degree and root-weight variables: gamma zero
  modes make the degree-zero space a polynomial algebra, so no finite unrefined dimension
  is asserted. Translation has `[T,β_n] = −nβ_(n−1)` and `[T,γ_n] = −(n−1)γ_(n−1)`
  (ibid., p. 142).

**Checks.**

- For one pair, `β_0 γ_0 1 = 1`; the ordered beta-gamma pole has coefficient `+1`.
- Conversely `γ_1 β_(−1)1 = −1`; the ordered gamma-beta pole has coefficient `−1`,
  excluding a symmetric contraction convention.
- `β_0 β_(−1)1 = 0` and `γ_1 γ_0 1 = 0`, so both same-field singular contractions vanish.
  The vector `γ_0²1` remains a nonzero degree-zero vector.

**The big-cell action and its anomaly.** Construct the Lie homomorphism from `g` to polynomial
vector fields on `N_+` from the infinitesimal group action, and its Cartan-valued correction.
Lift the loop action to normal-ordered oscillator fields and compute the local two-cocycle
obstructing the uncorrected lift; construct the correcting one-cochain with its exact differential
(Frenkel, §5.2, (5.2-12)–(5.2-14); §5.5.2 and Theorem 5.6.8).
*Needs:* ReductiveGroups Layers 6–7, §7C for the pinned group and big cell;
A1.2 for cochains; the beta-gamma construction above.

**API.**

- The polynomial vector fields preserve the Lie brackets and have the prescribed action on
  coordinate functions; their Cartan correction gives a map into first-order differential operators.
- The discrepancy of the normal-ordered lift is the double-contraction cocycle; prove its
  locality, closedness and the coboundary comparison with the critical residue cocycle.
- Construct any resolution and filtration spectral sequence used for that comparison with
  its differential, exactness, boundedness and convergence (Frenkel, §§5.5–5.6).

**Checks.**

- For `sl₂` on `ℂ[y]`, `e = ∂_y`, `h = −2y∂_y`, `f = −y²∂_y` give `[h,e](y) = 2`
  and `[e,f](y) = −2y`, agreeing with `2e(y)` and `h(y)`.
- Their Cartan correction with parameter `λ` gives `h(1) = λ`, `f(1) = λy` and
  `[e,f](1) = λ = h(1)`; omitting the correction to `f` would give `0` when `λ = 1`.
- The uncorrected oscillator Cartan field `−2:γβ:` has self-contraction `−4/(z−w)²`;
  it therefore gives critical `sl₂` level `−2`, not level zero.

**Wakimoto homomorphisms.** For each complex level `κ` construct
`wκ : Vκ(g) → M_g ⊗ π_((κ−κc)|h)`, with vacuum, translation and all current fields
preserved, using the preceding anomaly computation. Prove injectivity by the PBW-filtered
big-cell comparison (Frenkel, Theorems 6.1.6 and 6.2.1, pp. 171–173; Proposition 7.1.1,
pp. 200–201). *Needs:* A6.2; the Heisenberg and beta-gamma fields and the anomaly computation above.

**API.**

- Specify the simple-generator images, their Cartan terms and derivative corrections;
  prove all current OPEs at level `κ` (Frenkel, (6.2-2), pp. 172–173).
- The homomorphism respects the PBW filtration and its injective associated-graded map,
  and induces the affine action on every module for the target vertex algebra (ibid. Proposition 7.1.1).
- At `κ = κc` the Heisenberg factor is commutative and the center image lies in `π0`
  (ibid. Lemma 7.1.2, pp. 201–202).

**Checks.**

- For `sl₂`, use `e = β`, `h = −2:γβ: + b`,
  `f = −:γ²β: + k∂γ + :γb:` and `b(z)b(w) ∼ 2(k+2)/(z−w)²`
  (Frenkel, (6.2-3), p. 174). The Cartan self-contraction is
  `−4 + 2(k+2) = 2k`: at `k = 1`, both sides are 2.
- The `e(z)f(w)` singular part is `k/(z−w)² + h(w)/(z−w)`;
  at `k = −2` the double pole is `−2`, while the `b` self-contraction is zero.
- Replacing `k∂γ` by `−k∂γ` makes the `e,f` double-pole coefficient `−k`;
  at `k = 1` this is `−1 ≠ 1`. Thus the derivative sign is fixed independently of the Cartan test.

**Critical screening operators.** Construct the simple-root intertwiners from `W_(0,κc)` to
the localized charged Wakimoto modules of Frenkel §7.3.4, equations (7.3-11)–(7.3-14),
pp. 216–217, including their target Fock/localization carriers. Prove their restriction to `π0`
is the classical dual-root screening of FormalConnectionsOpers F7.5, with its exponential-charge
module as target. This is a comparison with the supplier’s construction, not a second construction
of classical screenings. *Needs:* the Wakimoto maps above; the classical-screening supplier
contract F7.5 specified in Exact supplier contracts.

**API.**

- Each critical screening intertwines the affine actions and kills the vacuum image;
  hence `wκc(Vκc)` lies in the intersection of its kernels (Frenkel, Proposition 7.3.5, p. 217).
- Restriction to the Heisenberg factor, followed by the charge-module identification,
  respects translation and has the dual Cartan root factors (ibid. (7.3-13)–(7.3-14)).
- The critical center image lies in `π0 ∩ ⋂_i ker S_i` (ibid. Proposition 7.3.6, p. 217).
  No equality with the whole Wakimoto image is asserted.

**Checks.**

- Under the rank-one supplier comparison, `δu = −x` with `x′ = 2ux` is nonzero;
  at `u = 1`, `x = exp(2t)`, its constant coefficient is `−1`.
- The oper coordinate `q = u²−u′` is killed: `δq = −2ux+x′ = 0`; in that example
  the constant coefficient is `−2+2 = 0`, and translation gives `δq′ = 0`.
- Reversing only the derivative sign gives `δ(u²+u′) = −2ux−x′ = −4ux`, whose constant
  coefficient in the same example is `−4 ≠ 0`. The zero screening also fails the first Check.

### A7.2 Invariant theory of jets

Consume FormalConnectionsOpers F4.3's finite Chevalley restriction `S(g*)^G ≃ S(h*)^W`, generators
`P_i` of degrees `d_i + 1`, the Kostant regular/slice theorem, the codimension of the nonregular
locus, and its group versus Lie-algebra invariants theorem `V^G = V^g` for connected `G`. Prove the
`κ0`-induced identification `S(g) ≃ S(g*)` with the precise Cartan-dual comparison to the supplier's
`S(g*)^G` theorem. Build the jet-scheme/arc comparison here rather than inferring it from finite
Harish–Chandra theory. Prove the affine invariant-jet theorem for `g[[t]]` acting on the PBW-graded
vacuum space: `Fun(g*[[t]])^(g[[t]]) = ℂ[P_(i,n) | 1 ≤ i ≤ ℓ, n ≥ 0]`, where `P_(i,n)` is the
`t^n` coefficient of `P_i(A(t))`; prove `P_i(t^N A(t)) = t^(w_i N) P_i(A(t))` and provide the
differential generators and character `∏_(i=1)^ℓ ∏_(n≥0) (1 − q^(d_i+1+n))^(−1)`. Use jet Chevalley
restriction for injectivity into the Heisenberg algebra and its invariant character for upper
bounds. Supply the lower bound through the filtered critical Verma/Wakimoto comparison (Frenkel,
*Langlands correspondence for loop groups*, §8.1.1): construct `M0`, its opposite Wakimoto
realization `W0⁺` and `M0 ≃ W0⁺`; for `b̃_+ = b_+ ⊕ t g[[t]]` prove `(W0⁺)^(b̃_+) = π0` with graded
invariant character equal to that of `gr M0`; prove `(gr M0)^(b̃_+) → (gr Vκc)^(g[[t]])` is surjective
by the regular-arc invariant calculation on `t⁻¹(n_−)* ⊕ g*[[t]]`; prove `Vκc^(b̃_+) = Vκc^(g[[t]])`
and the analogue for `gr Vκc` by local finiteness under constant `g`; prove filtration/weight
strictness so `gr z(Vκc) = (gr Vκc)^(g[[t]])`. Identify restricted quantum screenings with dual
classical screenings; the injective center map into their intersection is then surjective by equal
finite weight-piece dimensions, not by two upper bounds. *Needs:* the formal loop and oper supplier contract F4.3;
A7.1; LieHighestWeight Layer 7.

**Checks.**

- For `sl₂`, `P(A) = tr(A²)/2` has `w = 2` and `P(t^N A) = t^(2N) P(A)`; the jet invariants have
  character `∏_(n≥0)(1 − q^(2+n))^(−1)`, matching A7.3.
- For `sl₃`, generators of weights 2 and 3; the character coefficient of `q^4` is 3 (`P_(1,2)`,
  `P_(1,0)²` and `P_(2,1)`).
- Ordinary finite Chevalley invariants alone do not give the jet theorem: at weight 3 for `sl₂` the
  jet invariant `P_(1,1)` (the `t` coefficient) is not a polynomial in finite invariants of the
  constant term.

### A7.3 The vacuum center theorems

Prove `Z(Vκ) = ℂ·vacuum` at every noncritical `κ`, including zero. At critical level prove it is
freely generated as a commutative differential algebra by `ℓ` homogeneous Segal–Sugawara states of
weights `d_i + 1` (`ℓ = rank g`, `d_i` the exponents), and identify it with `Fun Op_(G∨)(D)`.
Construct generators, freeness and surjectivity, not just the quadratic state or an injection.
Construct the vacuum center embedding into the classical W-algebra, prove its image is the
intersection of all dual screenings and use the supplier's Miura/Drinfeld–Sokolov/classical-W
comparison to obtain the isomorphism; prove translation, `Aut(O)` and vertex Poisson compatibility.
Under flipped pinned root data `h_dual = h*`, define `κ0^∨` by the **inverse form** of `κ0|h`,
extended invariantly to `g∨`; prove the matrix-inversion/root-length factors, including
nonsimply-laced types, and match Heisenberg and screening brackets for this form (Frenkel,
*Langlands correspondence for loop groups*, Chapters 6–8 and §8.1.4; Frenkel, *Wakimoto modules,
opers and the center at the critical level*). *Needs:* A7.1, A7.2, A6.2, A6.3;
the formal loop and oper supplier contract F5–F8.

**Checks.**

- `sl₂` at critical level: the center has graded dimensions `1, 0, 1, 1, 2` in weights `0–4`
  (`∏_(n≥0)(1 − q^(2+n))^(−1)`), spanned in weight 4 by `T²S` and `S_(−1)S`.
- `x_1·S = (k + h∨) x_(−1)|0⟩` (from `Σ_a [[x,J^a],J_a] = 2h∨x` for `κ0`-dual bases): for `sl₂`
  this is `3x_(−1)|0⟩ ≠ 0` at `k = 1` and vanishes exactly at the critical level `k = −2`.
- At `k = 0` the state `x_(−1)|0⟩` is not invariant: `y_0 x_(−1)|0⟩ = [y,x]_(−1)|0⟩ ≠ 0` for
  `[y,x] ≠ 0`.

### Examples

The `sl₂` critical center, freely generated by `S` and its derivatives; the `sl₃` cubic generator of
A8.

### Dependencies

A6; the formal loop and oper supplier contract F4.3, F5–F8; LieHighestWeight Layer 7.

## Layer A8: completed center and exact compatibilities

### A8.1 Completed centers

Construct the continuous mode/enveloping functor for nonnegatively graded vertex algebras and its
commutative differential specialization, with relation `T ⊗ 1 + 1 ⊗ ∂_t` and normally ordered
relations (Frenkel, *Langlands correspondence for loop groups*, §3.2); prove coefficient
finiteness, bracket and completion claims, and identify the affine vacuum's completed enveloping
algebra with `Ûκ`. At critical level prove the central mode image is
the entire center and identify the completed modes of `Z(Vκc)` with `Fun Op_(G∨)(D×)`. Construct the stagewise
PBW-symbol comparison (Frenkel, *Langlands correspondence for loop groups*, Proposition 4.3.4): the
completion can have unbounded PBW degree, so write `Z = lim_N Z/(Z ∩ ker π_N)`; prove the
intersection is an ideal of the commutative center; construct the **adjoint** `g[[t]]` action on
`Q_N` by preservation of `I_N` (distinct from its left module action) and inject each center
quotient into `(Q_N)^(g[[t]],ad)`; prove `gr Q_N = Fun(g* ⊗ t^(−N)ℂ[[t]])`; compare with A7.2 by
multiplication by `t^N`.

Pin mode indexing: for `S_i` of weight `w_i = d_i + 1` write `Y(S_i,z) = Σ_r S_i[r] z^(−r−1)` and
`P_i(J(z)) = Σ_r P̄_i[r] z^(−r−1)`. Prove `P̄_i[r]` is `g((t))`-invariant, its restriction vanishes for
`r ≥ w_i N`, and the remaining `r < w_i N` generate the pole-bound invariant algebra freely; prove
`S_i[r]` has this symbol and is central, so `Z/(Z ∩ ker π_N) = ℂ[S_i[r] | r < w_i N]`. A degree-`w`
product of current fields with indices `< N` has largest state index `wN − 1`; lower-degree
corrections obey the same cutoff. These weight-dependent cutoffs give the same topology as a common
cutoff; compatible inverse limits prove the completed critical center theorem, including unbounded
PBW degree. *Needs:* A7, A4.1, A5.4; the formal loop and oper supplier contract F5.

**Checks.**

- For `sl₂`, `w = 2` and `N = 1`: the stage generators are `S[r]` with `r < 2`, i.e. `r ≤ 1`.
- The strict cutoff `r < w_i N` excludes the boundary generator `S[w N]`, which vanishes on `Q_N`.
- `Z/(Z ∩ ker π_N)` is an algebra quotient though `Q_N` is only a module quotient.

### A8.2 The noncritical extended center

For every noncritical level, including reducible vacuum levels, prove `Z(Ûκ) = ℂ`. Prove Sugawara implements the degree derivation and define `Dκ = −L_(0,conf)`
so `[Dκ, x_n] = n x_n` (Frenkel, *Langlands correspondence for loop groups*, Proposition 4.3.9; Kac, *Laplace
operators of infinite-dimensional Lie algebras and theta functions*, Corollary 1). Build
`ĝκ′ = ℂd ⋉ ĝκ` with `[d, x_n] = n x_n`, its level quotient and left-ideal completion, with `d − Dκ`
central; prove the original completion embeds and preserves its center; prove the extended completion
is the restricted-series algebra `Ûκ⟨D′⟩` (sums `Σ_j z_j (D′)^j` with `z_j → 0`) for `D′ = d − Dκ`,
whose center consists of such series with all `z_j` central. Use A2.4’s comparison and A4.2’s completion, including
`k = 0`, to construct `h̃ = h ⊕ ℂK_standard ⊕ ℂd`, the hyperplane `K_standard = k`, untwisted affine
roots, Weyl reflections/translations and the `ρ`-shifted action. Build the topological
Harish–Chandra map on the restricted-series completion and prove its injectivity on the center: a
central element acting by zero on every level-`k` extended Verma module `M(λ,δ)` is zero; build the
smooth extended Verma modules, the contravariant form, its finite-height PBW matrices, the
real/imaginary affine-root determinant factors and generic nondegeneracy at `k + h∨ ≠ 0`, and the
stabilization under the high-current cutoff. Prove polynomiality of the image by the `N = 1` cutoff,
Weyl invariance and surjectivity, free generation by the quadratic form, and
`Q_k(λ,δ) = κ0⁻¹(λ+ρ, λ+ρ) − κ0⁻¹(ρ,ρ) + 2(k + h∨)δ`, `HC(d − Dκ) = Q_k/(2(k + h∨))`. Thus the
extended center is `ℂ[D′]`; prove `Ûκ ∩ ℂ[D′] = ℂ` and conclude `Z(Ûκ) = ℂ`. *Needs:* A2.4, A4.1, A4.2, A6.2; LieHighestWeight Layer 7.

**Checks.**

- `Q_k(0, 0) = 0`: the vacuum highest weight has `HC(d − Dκ) = 0`.
- For `sl₂` at `k = 1`, `h∨ = 2`, `ρ = α/2` and `κ0⁻¹(α, α) = 2`: `Q_1(α/2, 0) = 2 − ½ = 3/2`, and
  `HC(d − Dκ)(α/2, 0) = (3/2)/6 = 1/4`, the conformal weight of the spin-½ module at level 1.
- At the critical level `k + h∨ = 0` the division by `2(k + h∨)` is undefined and the center is
  large (A8.1).

### A8.3 Feigin–Frenkel normalizations and the loop-group action

The supplier defines `Fun Op(D)` as the polynomial algebra of nonnegative Drinfeld–Sokolov
coefficients and `Fun Op(D×)` as the inverse limit of polynomial coordinate algebras at closed
pole-bound stages. Identify exact central modes, relations and topology with these coefficients;
evaluation at a Laurent oper factors through its pole-bound stage and is a continuous algebra
character. The final isomorphism and its inverse are continuous, `Aut(O)`-equivariant and Poisson
for affine `κc + ℏκ0` and dual Drinfeld–Sokolov `κ0^∨`; arbitrary field automorphisms of `F` are not
coordinates. Prove intertwining on generators and completed coefficients and the exact residue
Kirillov–Kostant/Drinfeld–Sokolov normalization: pin `{H_x, H_y} = H_[x,y] + c κ0∨(x,y)` for
`H_x(A) = +Res κ0∨(A, x) dt`, whose anchor is `δA = [A, x] + x′`, the negative of the source gauge
tangent `[x, A] − x′`, so the cotangent-to-gauge identification sends `dH_x` to `−x`. Prove the
original `G((t))` action fixes the critical center pointwise, so each oper-central-character
smooth-module full subcategory is `G((t))`-stable; the coordinate lift permutes characters: on oper
points use `σ·p` with `q^φ` as below, on functions `σ·f = f ∘ σ⁻¹`, and prove
`eval_(σp) = eval_p ∘ a_σ⁻¹`; module pullback along `a_σ⁻¹` carries the fibre at `p` to the fibre at
`σp`. Dual `G∨((t))` gauge arrows between opers are different and do not follow from this action.

For the rank-one consumer export a selected Feigin–Frenkel isomorphism for `sl₂` with fixed
generator laws: with `S_n` the convergent normally ordered sum
`½Σ_m(:e_m f_(n−m): + :f_m e_(n−m):) + ¼Σ_m :h_m h_(n−m):` (`κ0(h,h) = 2`), stabilizing in every
`Q_N`, require `S_n ↦ q_(−n−2) = Res(t^(n+1) q dt)` and prove uniqueness among continuous algebra
equivalences with these laws. Export the loop Hopf/matrix dictionary relating FormalConnectionsOpers
F3's points of `TauCeti.SpecialLinear.coordinateHopfAlgebra ℂ 2` in `ℂ((t))` with
`Matrix.SpecialLinearGroup (Fin 2) (LaurentSeries ℂ)`, using `SpecialLinear.pointsMulEquiv` and
pinning each entry as evaluation on the image of `GeneralLinear.genericMatrix`; prove naturality and
compatibility with F3's coefficient inclusion and jet kernels. Export the original `SL₂` loop
automorphism homomorphism `A ↦ Ad_g A − 2 Res tr(g⁻¹g′A)` after `K = 1`, its matrix/formal-current
comparison, continuity/inverse and pointwise fixation of the center. *Needs:* A8.1, A6.3, A4.2;
the formal loop and oper supplier contract F3, F5–F8; Tau Ceti special-linear points.

**Checks.**

- For the dual Drinfeld–Sokolov matrix `A = [[0, q], [1, 0]]`, `L = ∂² − q`:
  `q^φ = (φ′)² q(φ) − ½{φ, t}` with `{φ, t} = φ‴/φ′ − (3/2)(φ″/φ′)²`, and the KdV anchor
  `δq = 2qε′ + q′ε − ½ε‴`; with `{S_m, S_n}` of A6.3 the generator law `S_n ↦ Res(t^(n+1) q dt)` is
  Poisson.
- `φ(t) = at` sends `S_n` to `a^n S_n` but the oper coefficient `L_n` to `a^(−n) L_n`.
- For `sl₃`, the weight-three generator with PBW symbol `tr(X³)` has critical modes with
  associated-graded image `−tr(X³)`; with the Miura map `b_i ↦ −u_i` the full associated-graded map
  is `(−1)^(PBW degree)`. `S_3` may change by a multiple of `T(S_2)`, matched by the derivative of
  the quadratic DS coordinate.
- Define `κ_(0,dual)` on `g∨` with long dual roots of squared length 2; for nonsimply-laced `g`,
  `κ_(0,dual) = r∨ κ0^∨` (`r∨ = 2` for `B`, `C`, `F₄` and `3` for `G₂`). In `B₂/C₂` the coroot
  vectors `e₁ ± e₂` and `2e_i` have squared lengths 2 and 4, and the Heisenberg mode bracket is
  `n κ0(h_i, h_j) δ_(n+m,0)` with transposed-Cartan screening factors.

### Examples

The polynomial and formal `sl₂` cocycles, `κc = −2κ0`, the finite-cutoff action of an infinite
positive current, a non-two-sided `I_N`, the convergent high-order series of A4 and the rank-one
Segal–Sugawara/projective-connection normalization above.

### Dependencies

A1–A7; the formal loop and oper supplier contract F3, F5–F8; LieHighestWeight Layer 7. GeometricRepresentationCategories
consumes A8.3's selected isomorphism, loop action and dictionary.

## Downstream consumers

- GeometricRepresentationCategories consumes A2–A5 (completion, lifts, smooth categories,
  central-character quotients), A6.3 (divided commutators) and A8 (completed center, the selected
  rank-one Feigin–Frenkel isomorphism and loop action); it owns coherent actions, fibres and descent.
- NoncompactQuantumSymmetry P.4 extends the Whitehead lemmas of A1.2 from `ℂ` to every
  characteristic-zero field.

## References

- [Weibel, *An introduction to homological algebra*](https://math.mit.edu/~hrm/palestine/weibel/07-lie_algebra_homology_and_cohomology.pdf),
  Corollaries 7.8.10 and 7.8.12, pp. 245–246.

- [Frenkel, *Langlands Correspondence for Loop Groups*](https://math.berkeley.edu/~frenkel/loop.pdf),
  §1.3.1 and Lemma 1.3.1 smooth representations and integration, §1.3.5 central extensions and
  continuous cohomology, §2.1.2 smooth modules and the left-ideal completion, §3.2 Lie and
  enveloping algebras of a vertex algebra, Propositions 4.3.4 and 4.3.9 completed centers,
  Chapters 6–8 free fields, screenings and the center, Proposition 7.3.6, §8.1.1 (character of the
  center), §8.1.4 and §8.3 vertex Poisson structures and the completed center.
- [Frenkel, *Wakimoto modules, opers and the center at the critical level*](https://arxiv.org/abs/math/0210029v2):
  free-field cohomology, opposite Wakimoto comparison and completed-center proofs.
- [Kac, *Laplace operators of infinite-dimensional Lie algebras and theta functions*](https://pmc.ncbi.nlm.nih.gov/articles/PMC344739/),
  Corollary 1, as used by Frenkel, Proposition 4.3.9.
- [Frenkel, lectures on the Langlands program and conformal field theory](https://math.berkeley.edu/~frenkel/houches.pdf):
  critical centers and classical Drinfeld–Sokolov reduction.
- [Kac, *Introduction to vertex algebras, Poisson vertex algebras, and integrable Hamiltonian PDE*](https://arxiv.org/abs/1512.00821v2):
  Definition 1.4 and Theorem 1.1 (extension theorem), p. 5; Proposition 3.1 (Borcherds identity) and
  (3.24) (skew symmetry), p. 18; Proposition 4.5 and Theorem 4.1(a), p. 26; (4.33), p. 29.
- [Bakalov–Kac, *Twisted modules over lattice vertex algebras*](https://arxiv.org/abs/math/0402315v3):
  Definition 2.1 with (2.14) and (2.17), p. 3, for the generic vertex axioms.
- Mathlib design references: [#25822](https://github.com/leanprover-community/mathlib4/pull/25822)
  (central extensions, vertex algebras) and
  [#29764](https://github.com/leanprover-community/mathlib4/pull/29764) (Hahn-series residue
  products); the [Virasoro/central-extension discussion](https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/Virasoro.20algebra.20.28and.20cohomology.20of.20the.20Witt.20algebra.29/near/491524778)
  and [VirasoroProject](https://github.com/kkytola/VirasoroProject/).
