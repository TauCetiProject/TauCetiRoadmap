# Roadmap: arithmetic heights and Siegel's lemma

A height measures the arithmetic complexity of an algebraic object, the way degree measures its
geometric complexity. Mathlib has the foundation: `Height.AdmissibleAbsValues`, the multiplicative
and logarithmic heights of a field element and of a tuple, the projective height, the instance for
number fields, and the Northcott property over a fixed number field. This roadmap builds the theory
that stands on that foundation and is missing everywhere in Lean: heights of **polynomials,
matrices, and linear subspaces**, the last through Schmidt's Plücker-coordinate height; the
**absolute** theory over `ℚ̄`, where Northcott's theorem and Kronecker's theorem live; and the two
theorems that heights of subspaces exist to state, **Siegel's lemma** and its invariant refinement
**Bombieri–Vaaler**.

"Done" means a contributor working on Diophantine approximation, transcendence, or Diophantine
geometry finds each object — the height of a number, of a polynomial, of a matrix, of a subspace —
at its natural generality with the full basic API, and finds Siegel's lemma as a consequence of a
developed theory rather than an isolated estimate. The subspace height is the hinge: it is what
makes Siegel's lemma invariant under row operations, it is what the duality theorem `H(V) = H(V^⊥)`
is about, and it is the object the Bombieri–Vaaler bound is stated in terms of.

Suggested home: `TauCeti/NumberTheory/Height/`, mirroring Mathlib's `Mathlib/NumberTheory/Height/`
(with `…/Height/Arakelov.lean`, `…/Northcott.lean`, `…/Polynomial.lean`, `…/Matrix.lean`,
`…/RowSpace.lean`, `…/Plucker.lean`, `…/Subspace.lean`, `…/CauchyBinet.lean`, `…/Hadamard.lean`,
`…/Duality.lean`, `…/Submodular.lean`, `…/Nonarchimedean.lean`, `…/Laplace.lean`,
`…/NorthcottSubspace.lean`, `…/SiegelsLemma.lean`, `…/Units.lean`), and
`TauCeti/NumberTheory/GeometryOfNumbers/SuccessiveMinima.lean`, the directory the `EffectiveBounds`
roadmap created for its lattice-point lemmas; nothing here depends on those.

**Mathlib is developing the same foundation.** `Mathlib/NumberTheory/Height/` (M. Stoll) is the
active substrate this roadmap consumes, and two of its open pull requests cover ground named below:
[mathlib4#41606](https://github.com/leanprover-community/mathlib4/pull/41606) is Layer 0's
extension-invariance material, and
[mathlib4#40791](https://github.com/leanprover-community/mathlib4/pull/40791) is Layer 6's S-unit
theorem. Neither is a reason to wait or to leave a gap: build both here, named and shaped the way
those PRs do, so that adopting Mathlib's is a deletion plus an import. See *[Relationship to
Mathlib's height work](#relationship-to-mathlibs-height-work)*.

## Scope and boundaries

### Owned here

- The **Arakelov (ℓ²-at-infinity) height** beside Mathlib's sup-norm height, and the comparison
  between them, without which the constants in the literature cannot be stated.
- The **absolute height of a tuple** over `ℚ̄` and **invariance under field extension**.
- **Northcott's theorem** in its bounded-degree form, **Kronecker's theorem**, and the identity
  relating the absolute height to the Mahler measure of the minimal polynomial.
- Heights of **polynomials** (Gauss's lemma and Gelfond's inequality), of **linear forms**, and of
  **matrices**.
- The **Plücker point** of a subspace and **Schmidt's height of a subspace**, with the three theorems
  that make it an object rather than a definition: the **Cauchy–Binet identity** computing it as a
  determinant, the **duality theorem** `H(V) = H(V^⊥)`, and **submodularity** over the subspace
  lattice, with the product bounds on `H(V ⊓ W)` and `H(V ⊔ W)` it yields.
- **Successive minima**, **Minkowski's second theorem**, the two lemmas that turn their
  real-lattice output into number-field statements — the **extraction lemma** and **Vaaler's
  cube-slicing theorem** — and the **basis lemma** that turns the minima into a lattice basis,
  which the unit group consumes.
- **Siegel's lemma** in height form, over `ℤ` and over a number field, and the **Bombieri–Vaaler**
  refinement — the summit.
- The dictionary between heights and the **unit group**: units of height one, the regulator against
  the heights of a fundamental system, and the **S-unit theorem** for Mathlib's `S`-units.

### Consumed

- All of `Mathlib/NumberTheory/Height/` and `Mathlib/Order/Northcott.lean`. Every object below is
  defined in terms of Mathlib's `Height.mulHeight`, and none of it is restated.
- Mathlib's places, product formula, Dirichlet unit theorem and regulator, `S`-integers and
  `S`-units, Mahler measure, exterior powers, and geometry of numbers (`ZLattice`, covolume,
  Minkowski's convex-body theorem, the mixed embedding); itemised under *[What Mathlib already
  has](#what-mathlib-already-has-consume)*. Layer 4 is stated against Mathlib's lattice substrate
  directly and consumes nothing from any other roadmap.
- From the completed [`EffectiveBounds`](../../Completed/EffectiveBounds/README.md) roadmap, one
  thing only: the explicit discriminant bound from a basis of integers
  (`abs_discr_le_of_basis_isIntegral` under `TauCeti/NumberTheory/EffectiveBounds/`), which is
  how the `|D_{K/ℚ}|` in the constants of 5.3–5.4 is evaluated in the worked examples. Its
  `GeometryOfNumbers/` lemmas are a measure-free packing and doubling count upstream of `ZLattice`,
  and nothing in Layer 4 uses or extends them.

### Not owned here

- **Canonical and naïve heights on elliptic curves** — the naïve `x`-height, the approximate
  parallelogram law, the Néron–Tate height, its bilinear pairing and the elliptic regulator, and
  Mordell–Weil. These are Layer 6 of the [`EllipticCurves`](../EllipticCurves/README.md) roadmap,
  which consumes the general height API directly from Mathlib. Nothing here duplicates them, and
  Layer 1's Northcott material is stated so that roadmap can consume it.
- **Effective discriminant, class-number, and regulator bounds**, the explicit ideal count, and
  effective Hermite–Minkowski: the completed
  [`EffectiveBounds`](../../Completed/EffectiveBounds/README.md) roadmap. Its lattice-point
  packing and doubling lemmas are not inputs to Layer 4, whose milestones rest on Mathlib's
  `ZLattice` and `mixedEmbedding` alone.
- **Function-field heights** and the Riemann–Roch theory behind them:
  [`AlgebraicCurves`](../AlgebraicCurves/README.md). Mathlib's `Height.AdmissibleAbsValues` is
  general enough to carry them, and Layers 0–3 are written against that class wherever the proof
  does not need a number field, so the function-field instance costs nothing here; but supplying
  that instance and its divisor theory belongs there.
- **Dirichlet's unit theorem itself**, which Mathlib proves in full. Layer 6 consumes it.
- **Diophantine approximation proper** — Roth's theorem, the Schmidt subspace theorem, unit
  equations. See *[Long horizon](#long-horizon-a-roadmap-for-a-roadmap-not-work-to-attempt-here)*.

## Standing hypotheses

Work over a field `K` with `[Height.AdmissibleAbsValues K]` wherever the mathematics allows it, and
over a number field (`[NumberField K]`, degree `d = [K : ℚ]`, `r₁` real and `r₂` complex places,
discriminant `NumberField.discr K`) only where the proof genuinely needs one. Layers 0–3 are stated
at `AdmissibleAbsValues` generality except where an archimedean place, the degree, or the
discriminant appears; Layers 4 and 5 are number-field statements throughout, because Minkowski's
theorem is.

Tuples are indexed by an arbitrary `[Finite ι]` (`[Fintype ι]` where a cardinality appears in a
bound, and `[Nonempty ι]` wherever the empty tuple, whose height is the junk value `1`, would
falsify a bound whose right-hand side vanishes), following Mathlib's `Height.mulHeight (x : ι → K)`,
never by `Fin n` alone. Layer 3 additionally fixes a `[LinearOrder ι]`: `Module.Basis.exteriorPower`
needs it to order each wedge of basis vectors, and the height of 3.2 does not depend on the order
chosen, since a different order changes the Plücker coordinates by signs only. Subspaces are
`Submodule K (ι → K)` with a `Module.finrank` hypothesis, never `Module.Grassmannian`: Mathlib's
`Module.Grassmannian` is the *quotient* convention and records recovering the subspace convention as
its own TODO, so a roadmap that indexed subspace heights by it would be building on an object that
does not yet mean what we need. Reconcile with it if and when that TODO is discharged.

## Pinned conventions

Decide these once; an implementor who guesses differently produces a library that cannot be composed
with Mathlib's.

| Question | Convention |
| --- | --- |
| multiplicative or logarithmic | **Both**, for every owned object, with the multiplicative one primary and `logX := Real.log (mulX)` — exactly Mathlib's arrangement and for the reason its module docstring gives: the duplication is in statements only, since each logarithmic proof reduces to the multiplicative one. Never define a logarithmic height independently. |
| relative or absolute | **Both, distinguished by name.** Over a fixed `K`, `Height.mulHeight` is the *relative* height, which is the `[K : ℚ]`-th power of the absolute one; the absolute height carries the `abs` prefix, following Mathlib's `NumberField.absMulHeight₁`. Never divide by the degree inside a definition stated over a fixed `K`. |
| the local factor at a place | `⨆ i, v (x i)`, an `iSup` over the index type, as in Mathlib's `NumberField.mulHeight_eq`; archimedean places carry the weight `InfinitePlace.mult`. Not `Finset.sup'`, not a fold over a list. |
| a name for the local sup norm | **None.** `⨆ i, v (x i)` is written out. Mathlib has no such predicate and we do not add one; a one-line expression does not get a wrapper that would then need its own theory. |
| relative or absolute, in the literature | Bombieri–Gubler's `h` and `h_Ar` are **absolute** (their local exponent is `[F_w : ℚ_p] / [F : ℚ]`, 2.8.1–2.8.2). Mathlib's `Height.mulHeight` is **relative**. Every citation below says which, and every theorem transcribed from the book is stated with the `abs`-prefixed height unless it is explicitly renormalized. Constants transport the same way: an archimedean constant `c` in an absolute-height bound becomes `c ^ totalWeight K` in the relative height, one factor per archimedean place counted with multiplicity, which is why Mathlib's `mulHeight₁_sum_le` carries `#s ^ totalWeight K` and every Layer 2 bound below does the same. A relative bound with the absolute constant fails over any field of degree `> 1`. |
| the archimedean norm | Mathlib's height uses the **sup norm at every place**. The literature's Siegel-lemma constants are stated for the **Arakelov height**, which uses the ℓ² norm at archimedean places. Both exist here, `Height.mulHeight` (Mathlib's, primary) and `NumberField.arakelovMulHeight` (Layer 0), related by a named comparison lemma. Every bound says which one it is in. |
| junk values | `mulHeight 0 = 1` and `logHeight 0 = 0`, as in Mathlib; `absMulHeight₁` is `1` on a transcendental. No `⊥`, no `Option`, no `WithTop`. Every theorem whose content fails at the junk value carries the hypothesis that rules it out (`x ≠ 0`, `IsAlgebraic ℚ x`), rather than a different definition. |
| declaration names | **Statement-named, as Mathlib names things**: `polyMulHeight_mul_le`, `exists_basis_prod_absMulHeight_le`. The person's name — Siegel, Bombieri–Vaaler, Northcott, Kronecker, Gauss, Gelfond, Schmidt, Minkowski — goes in the docstring, never in the identifier. The exception Mathlib itself makes is a name that *is* the standard name of an object rather than of a theorem, such as `Northcott` the typeclass or `mahlerMeasure`. |
| the height of a subspace | `Submodule.mulHeight V := Projectivization.mulHeight V.pluckerPoint`, the height of the Plücker point, following Schmidt. Plücker coordinates are indexed by `Set.powersetCard ι k`, the type of `k`-element `Finset`s, matching `Module.Basis.exteriorPower`, **not** by strictly monotone `Fin k → ι` and not by a lexicographic list. |
| the height of a matrix | `Matrix.mulHeight A` is the height of the tuple of **entries**. The height of the row space — `H(A)` in Bombieri–Vaaler, the height of the tuple of maximal **minors** — is `Submodule.mulHeight (rowSpace A)` and never called the height of `A`. The two are different numbers and the classical literature uses one symbol for both; we do not. |
| duality | `V^⊥` is the **annihilator in the dual**, `Submodule.dualAnnihilator`, transported back to `ι → K` along the standard basis — the carrier of Bombieri–Gubler Proposition 2.8.10 and the one Mathlib's `ExteriorPower/Pairing.lean` substrate is written for. The orthogonal-complement form for `∑ i, x i * y i` is a derived corollary. |
| `S` for S-units | `S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))`, **finite places only**, with the infinite places always implicitly present — the carrier of Mathlib's `S.integer K` and `S.unit K` in `Mathlib/RingTheory/DedekindDomain/SInteger.lean`, which Layer 6 consumes and does not redefine, of `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean`, and of mathlib4#40791, whose rank formula `(r₁ + r₂ - 1) + |S|` fixes this reading. ⚠ Bombieri–Gubler 1.5.10 takes the opposite convention, `S ⊆ M_K` **including** all archimedean places, and so states the rank as `\|S\| - 1` (Theorem 1.5.13). The two agree, since `\|S_BG\| = r₁ + r₂ + \|S\|`; a contributor reading the book must translate, and every statement here says which convention it is in. |

## What Mathlib already has (consume)

This roadmap sits directly on `Mathlib/NumberTheory/Height/`; read that tree before writing
anything. **Reuse these by name; do not rebuild them.**

- **The height framework.** `Height.AdmissibleAbsValues` (a `Multiset` of archimedean and a `Set` of
  nonarchimedean absolute values, finite support, and the product formula), `Height.totalWeight`,
  `Height.mulHeight₁`/`logHeight₁` for a field element, `Height.mulHeight`/`logHeight` for a tuple,
  `Finsupp.mulHeight`, and the full basic API around them: scaling invariance
  (`mulHeight_smul_eq_mulHeight`), `one_le_mulHeight`, behaviour under `Equiv` and under reindexing
  (`mulHeight_comp_equiv`, and `mulHeight_comp_le` for an arbitrary map of index types, which is
  what bounds the height of a sub-tuple by the height of the tuple), powers, inverses, products and
  sums (`mulHeight₁_mul_le`, `mulHeight₁_sum_le`), and `positivity` extensions.
- **The projective height.** `Projectivization.mulHeight`/`logHeight`, defined by `lift` from a
  representative tuple, with its own `positivity` extensions.
- **The number-field instance.** `NumberField.instAdmissibleAbsValues`, built from
  `multisetInfinitePlace` (infinite places with multiplicity `InfinitePlace.mult`) and
  `{v | IsFinitePlace v}`; `NumberField.mulHeight_eq`, which is exactly the classical local formula
  `∏_{v | ∞} (⨆ i, v (xᵢ))^{mult v} · ∏ᶠ_{v ∤ ∞} ⨆ i, v (xᵢ)`; `totalWeight_eq_finrank`; and
  `absNorm_mul_finprod_finitePlace_eq_one`, which identifies the finite part of the height of an
  integral tuple with the absolute norm of the ideal it generates.
- **The absolute height of an element.** `NumberField.absMulHeight₁`/`absLogHeight₁`, defined for
  any `[CharZero K]` through `ℚ⟮x⟯`, with the junk value `1` off the algebraic numbers.
- **Adjoining algebraic numbers.** `IntermediateField.adjoin` with `subset_adjoin`,
  `adjoin_le_iff`, `inclusion` and `equivOfEq`; `finiteDimensional_adjoin` (a finite set of
  integral elements generates a finite extension) and `adjoin.finiteDimensional`; `adjoin_map` and
  `IntermediateField.equivMap`, which say where an embedding sends a generated field; and
  `isAlgebraic_algHom_iff` and `IsAlgebraic.inv`. This is the machinery Layer 0.4's definition and
  its invariance under embeddings run on.
- **Northcott.** The `Northcott` typeclass (`Mathlib/Order/Northcott.lean`, T. Browning) with
  `Northcott.exists_min_image` and `Northcott.comp_of_bddAbove`;
  `NumberField.finite_setOfPred_mulHeight₁_le` and the instances `Northcott (mulHeight₁ (K := K))`,
  `Northcott (logHeight₁ (K := K))`.
- **Heights over `ℚ`.** `Rat.mulHeight₁_eq_max` (`mulHeight₁ q = max |q.num| q.den`),
  `Rat.mulHeight_eq_max_abs_of_gcd_eq_one`, `Rat.mulHeight₁_natCast`.
- **Linear and polynomial maps.** `Height.mulHeight_linearMap_apply_le`, and the two-sided bounds
  `Height.mulHeight_eval_le`/`mulHeight_eval_ge` for a family of homogeneous polynomials of equal
  degree, with `Height.mulHeightBound` as the coefficient bound.
- **The Gauss norm.** `Polynomial.gaussNorm v c` (the supremum of `v (coeff i) · cⁱ`) with
  `Polynomial.gaussNorm_mul`, its multiplicativity at a nonarchimedean absolute value — this is
  Gauss's lemma, and it is the whole arithmetic input to Layer 1.2 — together with
  `isNonarchimedean_gaussNorm`, `le_gaussNorm`, `gaussNorm_C` and `gaussNorm_monomial`.
- **Content, primitive part, and clearing denominators.** `Polynomial.IsPrimitive`,
  `Polynomial.content`, `Polynomial.primPart` with `eq_C_content_mul_primPart` and
  `isPrimitive_primPart`, and `IsLocalization.integerNormalization` with
  `integerNormalization_spec`. Together they produce the primitive integer polynomial that Layers
  1.2 and 1.3 quantify over; none of it is rebuilt.
- **Mahler measure.** `Polynomial.mahlerMeasure`/`logMahlerMeasure` over `ℂ`
  (`Mathlib/Analysis/Polynomial/MahlerMeasure.lean`) with multiplicativity `mahlerMeasure_mul` and
  the Jensen formula `logMahlerMeasure_eq_log_leadingCoeff_add_sum_log_roots`; and over `ℤ`
  (`Mathlib/NumberTheory/MahlerMeasure.lean`, F. Barroero) Northcott for the Mahler measure
  (`finite_mahlerMeasure_le`), the Kronecker statement for polynomials
  (`pow_eq_one_of_mahlerMeasure_eq_one`, `isPrimitiveRoot_of_mahlerMeasure_eq_one`) and
  `cyclotomic_mahlerMeasure_eq_one`.
- **Siegel's lemma over `ℤ`.** `Int.Matrix.exists_ne_zero_int_vec_norm_le` (F. Barroero, L. Capuano,
  A. Turchet): for a nonzero `m × n` integer matrix `A` with `m < n`, a nonzero integer solution of
  `A x = 0` with `‖x‖ ≤ (n · max 1 ‖A‖)^{m/(n−m)}` in the sup norm. ⚠ The norm is
  `Matrix.seminormedAddCommGroup`, which is a **local** instance in that file and not available
  downstream; Layer 5.1 states the hypothesis as a bound on the entries instead.
- **Siegel's lemma over a number field, in the house normalization.**
  `NumberField.house` (the largest modulus of a conjugate) with `house_mul_le`, `house_add_le`,
  `house_pow`, `house_intCast`, and `NumberField.house.exists_ne_zero_int_vec_house_le`
  (M. Karatarakis): a nonzero solution in `(𝓞 K)ⁿ` with every coordinate of house at most
  `c₁ K · (c₁ K · n · A)^{m/(n−m)}`, `A` a bound on the house of the entries. ⚠ `c₁ K` and
  everything it is built from are `private`, so the constant cannot be named from outside that
  file. This is Bombieri–Gubler's Corollary 2.9.2 up to the normalization of the left-hand side,
  which is what Layer 5.1 supplies.
- **The unit theorem, in full.** `NumberField.Units.logEmbedding`, `unitLattice`,
  `unitLattice_span_eq_top`, `unitLattice_rank`, `rank`, `finrank_eq`, `basisModTorsion`,
  `fundSystem`, `exist_unique_eq_mul_prod`, `closure_fundSystem_sup_torsion_eq_top`,
  `logEmbedding_ker` (the kernel is the torsion subgroup), and `NumberField.Units.regulator` as the
  covolume of the unit lattice. **Layer 6 consumes all of this and re-proves none of it.** Note that
  `logEmbedding` lands in `{w // w ≠ w₀} → ℝ`: it omits a distinguished place `w₀`, and 6.1 is
  stated accordingly.
- **`S`-integers and `S`-units.** `Set.integer` (the subalgebra of `S`-integers) and `Set.unit` (the
  subgroup of `S`-units of `Kˣ`) in `Mathlib/RingTheory/DedekindDomain/SInteger.lean`, for
  `S : Set (HeightOneSpectrum R)`, with `Set.unitEquivUnitsInteger` and `integer_empty`. Layer 6
  uses these carriers and defines no `S`-object of its own; the `S`-unit *theorem* is not there.
- **Places and the product formula.** `NumberField.InfinitePlace` with `mult`,
  `NumberField.FinitePlace`, `IsInfinitePlace`/`IsFinitePlace`, and `NumberField.prod_abs_eq_one`.
- **Places above places, and the relative ideal norm.** `NumberField.InfinitePlace.comap`,
  `InfinitePlace.LiesOver` with `LiesOver.comap_eq`, `placesOver`, `IsUnramified`/`IsRamified` and
  `unramifedPlacesOver_ncard_add_eq_finrank` (`NumberField/InfinitePlace/Ramification.lean`);
  `InfinitePlace.card_filter_mk_eq`, which trades the exponent `mult v` for the embeddings inducing
  `v`, and `AlgHom.card`, which counts the extensions of one embedding; and `Ideal.relNorm` with
  `Ideal.relNorm_algebraMap` and `Ideal.absNorm_relNorm`. The last two are what Layer 0.3 uses in
  place of ramification and inertia.
- **Exterior powers.** `⋀[R]^n M`, `exteriorPower.ιMulti`, `exteriorPower.map`, the pairing with the
  dual (`ExteriorPower/Pairing.lean`), and — the one Layer 3 is built on —
  `Module.Basis.exteriorPower : Basis (Set.powersetCard I n) R (⋀[R]^n M)` with its `basis_apply`,
  `basis_repr` and `coe_basis` API.
- **Geometry of numbers.** `ZLattice`, `ZLattice.covolume`,
  `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` (Minkowski's
  convex-body theorem), `NumberField.mixedEmbedding` with the convex bodies and
  `NumberField.mixedEmbedding.volume_fundamentalDomain_latticeBasis` around it, and
  `NumberField.discr`. Also `NumberField.mixedEmbedding.euclidean.mixedSpace` — the mixed space as
  an *inner product* space, with a measure-preserving equivalence to the usual one and the image
  of `𝓞 K` in it — which is the ambient the number-field case of 4.3 is stated in, and
  `NumberField.mixedEmbedding.covolume_integerLattice`, which is its degenerate case.
  ⚠ `Submodule.IsLattice` of `Mathlib/Algebra/Module/Lattice.lean` is a *different* notion from
  `IsZLattice` — finitely generated and spanning, rather than discrete and spanning — and it is the
  one that applies to a lattice of less than full rank. ⚠ 4.3 uses neither: over `ℚ` and over `K`
  alike it produces an explicit `ℝ`-basis of the carrier whose `ℤ`-span is the lattice
  (`Submodule.mixedLattice_eq_span`), which gives `DiscreteTopology` and `IsZLattice` directly,
  and over `𝓞 K` the module is not free at all — the pseudo-basis of `PseudoBasis.lean` stands in
  for freeness.

## What is missing (build here)

Nothing above gives: the Arakelov normalization or its comparison with the sup-norm height; the
affine height of a *tuple*; the absolute height of a *tuple*; invariance under field extension; Northcott's theorem for varying
degree; Kronecker's theorem for the height (as opposed to for the Mahler measure); the height of a
polynomial, of a matrix, or of a subspace; Plücker coordinates as an arithmetic object; successive
minima, Minkowski's second theorem, the covolume of the lattice of integral points of a subspace,
the extraction lemma, or the cube-slicing bound; Siegel's
lemma over a number field or in the invariant Bombieri–Vaaler form; or the S-unit theorem.
`Suggested.lean` pins the signatures most likely to drift, and indexes the ones already built:
every landed milestone appears there in its delivered form, discharged by the declaration that
carries it, so a rename in the library shows up as a broken `lake build Roadmap`.

## The build, in layers

### Layer 0: normalizations and the extension dictionary

The layer that makes every later constant meaningful.

**0.1 The Arakelov height.** For a number field `K` define
`NumberField.arakelovMulHeight (x : ι → K)` as
`(∏ v : InfinitePlace K, (∑ i, v (x i) ^ 2) ^ (v.mult / 2 : ℝ)) * ∏ᶠ v : FinitePlace K, ⨆ i, v (x i)`
for `x ≠ 0`, and `1` at `x = 0` — the same junk value as `Height.mulHeight`, so that the displayed
product (which is `0` at the zero tuple) does not falsify `1 ≤ arakelovMulHeight` or the
unconditional comparisons of 0.2. State the displayed formula as `arakelovMulHeight_eq`, hypothesis
`x ≠ 0`. Add `arakelovLogHeight` its logarithm and `arakelovMulHeight₁ x := arakelovMulHeight ![x, 1]`
the one-variable (affine) case, with its logarithm. Prove the same basic API Mathlib proves for
`mulHeight`: scaling invariance under `Kˣ`, hence a well-defined descent to `Projectivization`;
`1 ≤ arakelovMulHeight`; invariance under reindexing.

**0.2 The comparison.** `mulHeight x ≤ arakelovMulHeight x` and, for `ι` nonempty,
`arakelovMulHeight x ≤ (Fintype.card ι : ℝ) ^ (totalWeight K / 2 : ℝ) * mulHeight x`, from
`‖·‖_∞ ≤ ‖·‖_2 ≤ √n ‖·‖_∞` place by place, with `Height.totalWeight_eq_finrank` supplying the
exponent (on the empty index type both heights are the junk value `1` and the right-hand side is
`0`, so `[Nonempty ι]` is a hypothesis, not a convenience). This is the lemma that transports every
constant in the Siegel-lemma literature into
Mathlib's normalization, and Layer 5 states its bounds in terms of it. Prove also that the two agree
when `ι` is a subsingleton, where both are `1`. ⚠ This is *not* the statement
`arakelovMulHeight₁ = mulHeight₁`, which is **false**: the archimedean local factor of
`arakelovMulHeight₁` is `((v x) ^ 2 + 1) ^ (v.mult / 2)` and not `max (v x) 1 ^ v.mult`, so already
`arakelovMulHeight₁ (1 : K) = 2 ^ (totalWeight K / 2 : ℝ)` while `mulHeight₁ (1 : K) = 1`. The two
one-variable heights are related only by the comparison above, applied to `![x, 1]`.

**0.3 Extension invariance.** For `K ⊆ L` a finite extension of number fields:
`mulHeight₁_pow_finrank`, `mulHeight₁ x ^ finrank K L = mulHeight₁ (algebraMap K L x)`; the tuple
form `mulHeight_pow_finrank`; and the logarithmic forms `finrank_nsmul_logHeight₁` and
`finrank_nsmul_logHeight`. These are the statements of mathlib4#41606 and carry its names, as does
`absMulHeight₁_eq`, the one-variable form of the statement that the absolute height does not depend
on the field of definition. The textbook route — each place of `K` is the restriction of the places
of `L` above it, with `∑_{w | v} [L_w : K_v] = [L : K]` — is **not** the cheap one against current
Mathlib, and neither half of the height needs places above places at all:

- *Archimedean.* Turn the `mult`-weighted product over the infinite places into a product over the
  complex embeddings, which is what `InfinitePlace.card_filter_mk_eq` does: `mult v` is the number
  of embeddings inducing `v`. What remains is the count
  `#{φ : L →+* ℂ | φ.comp (algebraMap K L) = ψ} = [L : K]`, which is `AlgHom.card` once `ℂ` carries
  the `K`-algebra structure of `ψ`.
- *Nonarchimedean.* No places at all. The finite factor of the height of an **integral** tuple is
  the inverse of the absolute norm of the ideal its coordinates generate
  (`NumberField.absNorm_mul_finprod_finitePlace_eq_one`), so what remains is
  `Ideal.absNorm (I.map (algebraMap (𝓞 K) (𝓞 L))) = Ideal.absNorm I ^ [L : K]`, which is
  `Ideal.relNorm_algebraMap` followed by `Ideal.absNorm_relNorm`. Ramification and inertia never
  appear: they are already inside Mathlib's relative ideal norm.

⚠ The nonarchimedean factor **alone is not invariant under scaling** — `∏ᶠ v, ⨆ i, v (c * x i)`
picks up the finite part of the product formula for `c` — so the reduction from an arbitrary tuple
to an integral one has to be made on the whole height, where `mulHeight_smul_eq_mulHeight` applies
to both sides at once, and never factor by factor. ⚠ Do **not** build
`NumberField.InfinitePlace.liesOver_iff_comap_eq`: Mathlib now carries the infinite-place
ramification theory itself (see *[What Mathlib already has](#what-mathlib-already-has-consume)*),
and the route above does not use it. The special case `K = ℚ`, `H_L(x) = H_ℚ(x)^{[L : ℚ]}`, needs
no places above places and is the acceptance test for the general statement; on this route it is
literally an instance of it.

⚠ **0.3 grew an Arakelov statement when 5.6 landed.**
`NumberField.arakelovMulHeight_pow_finrank` is the same identity in the normalization of 0.1, and
it is the same proof: only the archimedean local factor differs, and it reads a place in exactly
the same way, so `NumberField.prod_infinitePlace_pow_mult_eq` now states the archimedean count
once for an arbitrary local factor and both normalizations consume it. The nonarchimedean factor
is literally the same expression, and the reduction to an integral tuple is the same reduction.
Layer 5.6 is the only consumer, and it needs the statement because the conjugates of a row of a
matrix over `F` live in a field larger than `F`.

**0.4 The absolute height of a tuple.** `NumberField.absMulHeight (x : ι → K)` for `[CharZero K]`,
defined as `mulHeight` computed over `IntermediateField.adjoin ℚ (Set.range x)` and normalized by
the inverse of its degree — the tuple analogue of Mathlib's `absMulHeight₁` and its exact
generalization (`absMulHeight` of `![x, 1]` is `absMulHeight₁ x`). Prove `absMulHeight_eq`, the
tuple analogue of #41606's `absMulHeight₁_eq`: over *any* number field `K` containing the
coordinates, `absMulHeight x = mulHeight x ^ (finrank ℚ K : ℝ)⁻¹` — which, with 0.3, is exactly the
classical statement that the absolute height is independent of the field of definition. Prove the
scaling invariance `absMulHeight (c • x) = absMulHeight x` for `c ≠ 0` **algebraic**, and descend
to `Projectivization K (ι → K)` over a field with `[Algebra.IsAlgebraic ℚ K]` — a number field, or
`AlgebraicClosure ℚ`. Neither holds over a general `[CharZero K]`: for `c` transcendental and `x`
a nonzero algebraic tuple, `c • x` has a transcendental coordinate and its absolute height is the
junk value `1`, so `absMulHeight` is not constant on the line through `x` and does not descend to
`Projectivization K (ι → K)`. The definition is made for `[CharZero K]`, as Mathlib's
`absMulHeight₁` is; the projective theory is stated over algebraic fields. ⚠ `absMulHeight_eq` is
stated over a number field and so says nothing inside `ℝ` or `ℂ`, where 1.2–1.5 live. The statement
that does is invariance under an embedding — `absMulHeight_comp`: `absMulHeight (f ∘ x)
= absMulHeight x` for `f : K →ₐ[ℚ] L` between fields of characteristic zero — and it is what
carries a value computed over `ℚ` into `ℝ` or `ℂ`. Prove it here. It takes one ingredient beyond
`absMulHeight_eq`, because an embedding carries `ℚ(x₀, x₁, …)` to the field generated by the
*image* coordinates, isomorphic to it but not equal: the degree-one case of 0.3's
`mulHeight_pow_finrank`, that an isomorphism of number fields preserves the relative height.

⚠ **0.4 grew the Arakelov analogue of `absMulHeight_comp` when 5.6 landed.** There is no
`absArakelovMulHeight` in this development — the absolute Arakelov height is written
`arakelovMulHeight x ^ (finrank ℚ K : ℝ)⁻¹` wherever it is needed — so the statement is that *that
expression* does not change along a ring homomorphism of number fields:
`NumberField.arakelovMulHeight_rpow_comp`. It needs no compatibility hypothesis, every ring
homomorphism between fields of characteristic zero being a `ℚ`-algebra map. It is what makes
`H_Ar(σ Aᵢ) = H_Ar(Aᵢ)` — the last line of Bombieri–Gubler's proof of 2.9.19 — a theorem here
rather than a convention.

**0.5 The affine height of a tuple.**
`Height.mulHeightAff (x : ι → K) := Height.mulHeight fun o : Option ι ↦ o.elim 1 x`, the
projective height of `(1, x₁, …, x_n)`, with `logHeightAff` alongside. It is the tuple analogue of
Mathlib's `Height.mulHeight₁ x = mulHeight ![x, 1]` and agrees with it on a one-element tuple
(`mulHeightAff_fin_one`), which is the test that the appended coordinate is the right one. Prove:
`1 ≤ mulHeightAff`; `mulHeight x ≤ mulHeightAff x` and `mulHeight₁ (x i) ≤ mulHeightAff x`, the
second of them **false** for `mulHeight`; monotonicity under re-indexing,
`mulHeightAff (x ∘ f) ≤ mulHeightAff x`, with equality for a bijective `f`; and
`mulHeightAff 0 = 1` — not a junk-value convention but the height of `(1, 0, …, 0)`.

⚠ The content of the definition is that it is **not** scaling-invariant, and the milestone states
that as a theorem, `exists_mulHeightAff_smul_ne`, rather than in prose: over `ℚ` the tuples `![1]`
and `![2]` have affine heights `1` and `2` while their projective heights are both `1`. Anything
not homogeneous in the tuple — the value `∑ i, a i * x i` of a linear form (2.4), the determinant
of a matrix (2.5) — has **no** bound with a scaling-invariant right-hand side, so `mulHeight`
cannot stand there and this height must. That is why it is a Layer 0 normalization and not a
definition inside the layer that first needs it.

⚠ Unlike 0.1–0.4 this milestone needs **no number field**: it is stated for any
`Height.AdmissibleAbsValues K` and consumes nothing from the rest of Layer 0. It is numbered last
only because 0.1–0.4 were built first; in dependency order it comes before them. No Arakelov
analogue is asked for — 0.1 already carries the one-variable `arakelovMulHeight₁`, and the
Arakelov bounds of Layer 2 carry the constant `1` and need no affine height at all.

### Layer 1: Northcott, Kronecker, and the Mahler-measure bridge

**1.1 Northcott on projective space.** The `Northcott` instances for `Projectivization.mulHeight`
and `Projectivization.logHeight` over a number field, which
`Mathlib/NumberTheory/Height/Northcott.lean` records as its own TODO. Route: a projective point has
a representative with coordinates in `𝓞 K` generating an ideal of norm bounded by the height, and
`NumberField.absNorm_mul_finprod_finitePlace_eq_one` converts that into the finite part. ⚠ There is
no `Northcott` instance for `Height.mulHeight` on `ι → K` itself, and none is to be stated:
`mulHeight_smul_eq_mulHeight` puts the whole line `Kˣ • x` at one height, so
`{x : ι → K | mulHeight x ≤ B}` is infinite for every `B ≥ 1` and nonempty `ι`. Finiteness of
tuples of bounded height needs a normalization — coordinates in `𝓞 K` with a fixed nonzero
coordinate, say — and that is a lemma inside the proof, not an instance. ⚠ The route named above
is not the one to take, and the hypothesis named above is not the one to state. Normalizing a
coordinate to `1` — every projective point has such a representative — bounds the height of each
coordinate by the height of the point, so the instance follows from Mathlib's Northcott property
for `mulHeight₁` and nothing else: no ring of integers, no ideal norm, no class group. The one new
lemma is `Height.mulHeight₁_div_le_mulHeight`, that `mulHeight₁ (x i / x j) ≤ mulHeight x`, which
is `Height.mulHeight_comp_le` applied to `![i, j]`. This is Hindry–Silverman's own proof of Theorem
B.2.3 and Bombieri–Gubler's of the `ℙⁿ` case of Theorem 2.4.9. Two consequences. First, **state the
instances over a field with `[Northcott (Height.mulHeight₁ (K := K))]`, not over a number field**:
that is the hypothesis Mathlib's `Height/Northcott.lean` already carries for its `logHeight₁`
instance, and it is the exact strength the statement needs — by Bombieri–Gubler's Remark 2.4.10 it
cannot be weakened further, a general field with a product formula having Weil heights but no
Northcott property. The number-field instances are then instance resolution. Second, the
normalization deserves a name of its own and Mathlib has none:
`Projectivization.exists_rep_apply_eq_one`, that a point of `Projectivization K (ι → K)` has a
representative with a coordinate equal to `1`. It carries no arithmetic — it is the affine chart of
a projective point — and 1.3 and 1.4 want it again. ⚠ Neither 3.1 nor 3.7 did, in the end: 3.7
consumes the *theorem* of this layer whole, along an injection, and never opens its proof.

**1.2 Height and Mahler measure** (Bombieri–Gubler, Proposition 1.6.6 and Lemma 1.6.7). For `x`
algebraic over `ℚ` let `f ∈ ℤ[X]` be its **primitive integer minimal polynomial**: the primitive
polynomial with `f(x) = 0` that is irreducible in `ℤ[X]`, unique up to sign by Gauss's lemma, and
a rational multiple of `minpoly ℚ x`. With `D = natDegree f`, `absMulHeight₁ x ^ D = M(f)`, i.e.
`H(x) = M(f)^{1/D}`; state it with `f` quantified under the hypotheses `f.IsPrimitive` and
`f.map (Int.castRingHom ℚ) = C c * minpoly ℚ x` for some `c ≠ 0`, which pin `f` up to sign
without resolving the sign, and which force `x` algebraic. ⚠ `f` is
**not** `minpoly ℤ x`: Mathlib defines `minpoly ℤ x = 0` whenever `x` is not integral over `ℤ`, so
a statement through `minpoly ℤ x` is false for `x = 1/2` (left side `2`, right side `M(0) = 0`)
unless it carries `IsIntegral ℤ x`, and with that hypothesis it covers only algebraic integers and
cannot feed 1.3. Route: Jensen's formula
(`Polynomial.logMahlerMeasure_eq_log_leadingCoeff_add_sum_log_roots`) computes `M(f)` as the leading
coefficient times `∏ max(1, |root|)`, and the archimedean part of the height over the splitting
field is the same product, while the finite part is the leading coefficient by Gauss's lemma. This
identity is the workhorse of the rest of the layer. ⚠ Jensen's formula is not what the proof
wants. Over a number field `L` in which `f` splits as `C a * ∏ (X - αᵢ)`, read the identity **one
place at a time**: at every place `v` of `L` the quantity `v a · ∏ᵢ max (v αᵢ) 1` is a *local
Mahler measure* of `f`, and the two halves are the same computation twice. At a finite place it is
the Gauss norm of `f`, hence `1` because `f` is primitive; at an infinite place it is `M(f)`
itself. Multiplying over all places and cancelling `a` by the product formula leaves
`M(f) ^ [L : ℚ]`. Both halves rest on a multiplicativity: `Polynomial.gaussNorm_mul` — which
**Mathlib already has**, and which is Gauss's lemma — and `Polynomial.mahlerMeasure_mul`, which is
what Mathlib proves Jensen's formula *from*. Only two Gauss-norm values are missing upstream, that
of `X - C α` and that of a primitive integer polynomial; both belong in
`Mathlib/RingTheory/Polynomial/GaussNorm.lean`. Three further consequences. First, a **splitting
field suffices where Bombieri–Gubler take a Galois closure**: their display (1.10) is stated for
the list `(σα)_{σ ∈ G}`, but over a splitting field it is just the Gauss norm of `f`, so no Galois
group acts, no separability is used, and the roots need not be distinct. The only fact used about
a root is that it is a root of `minpoly ℚ x` and therefore has the same absolute height as `x`,
which is 0.4's `absMulHeight_comp` in its one-variable form. Second, the number-field statement
that falls out is worth a name of its own and is the real content of the layer: for a primitive
`f ∈ ℤ[X]` splitting over a number field `L`, `∏_{roots} mulHeight₁ = M(f) ^ [L : ℚ]`, with the
*relative* height, roots counted with multiplicity and no minimal polynomial in sight. Third, the
pinned statement widens for free — `x` may lie in any field of characteristic zero, not only `ℂ`,
since the splitting field is built over `ℚ` and the ambient field never appears; `f ≠ 0` need not
be assumed, `Polynomial.IsPrimitive.ne_zero` supplying it (which is also what forces `x`
algebraic); and `c` is forced, being `f.leadingCoeff`. Two small prerequisites belong upstream of
this in Layer 0 and are cheap there: `absMulHeight₁_pow_finrank`, the relative-to-absolute
identity of 0.3 with a natural-number exponent, and `absMulHeight₁_comp`, the one-variable form of
0.4's invariance under an embedding.

**1.3 Northcott's theorem** (Bombieri–Gubler, Theorem 1.6.8; Hindry–Silverman, Theorem B.2.3, which
states it projectively and with varying degree, in exactly the form wanted here). For `B : ℝ` and
`D : ℕ`, the set `{x : ℚ̄ | absMulHeight₁ x ≤ B ∧ finrank ℚ ℚ⟮x⟯ ≤ D}` is finite — the statement
with *varying* degree, which is what "Northcott's theorem" names in the literature and which
Mathlib's fixed-field `finite_setOfPred_mulHeight₁_le` does not give. Route: 1.2 bounds the Mahler
measure of the primitive integer minimal polynomial, whose degree is at most `D`, hence (through
Mathlib's `Polynomial.finite_mahlerMeasure_le`) leaves finitely many such polynomials, each with
finitely many roots. State the projective version for `Projectivization ℚ̄ (ι → ℚ̄)` alongside it.
⚠ Three things the route as stated leaves out. First, **1.2 as pinned cannot be applied**: it
quantifies over a primitive `f` with `f.map ℚ = C c * minpoly ℚ x`, and nothing upstream says such
an `f` exists. It does: `IsLocalization.integerNormalization` clears the denominators and
`Polynomial.primPart` removes the content that clearing them introduced. That is
`Polynomial.exists_isPrimitive_map_eq_C_mul`, a statement about `ℤ[X]` and `ℚ[X]` alone which
belongs in `Mathlib/RingTheory/Polynomial/Content.lean`, and its height-bearing corollary
`NumberField.exists_isPrimitive_absMulHeight₁_pow_natDegree`, which packages 1.2 together with
`deg f = [ℚ(x) : ℚ]` and `f(x) = 0` — the three facts the proof reads off the polynomial. Both
are Layer 1.2 material and are filed there. With them the route is exactly the one described and
is short. Second, the **statement widens as 1.2's does**, to any field of characteristic
zero. Three further small things are missing upstream and are cheap in Layer 0:
`one_le_absMulHeight₁` (the bound `M(f) ≤ B^D` needs `1 ≤ B`, so `B` is replaced by `max B 1`),
`absMulHeight_comp_le`, and `absMulHeight₁_le_absMulHeight`. Third, the hypothesis
`IsIntegral ℚ x` is load-bearing **twice over**: beyond forcing the minimal polynomial to exist it
excludes the transcendentals, which satisfy *both* bounds, the height being the junk value `1` and
`finrank ℚ ℚ⟮x⟯` the junk value `0` because `ℚ⟮x⟯` is infinite-dimensional. Without it the
set is infinite over `ℂ`.

⚠ On the projective form, measuring the degree of a projective point by its **ratios** —
`∀ i j, finrank ℚ ℚ⟮rep i / rep j⟯ ≤ D` — costs no new definition, does not depend on the
representative, and is weaker than bounding the degree of the field the ratios generate, so the
statement is stronger than the one Hindry–Silverman make and the field of definition of a
projective point never has to be defined. The proof is 1.1's verbatim, with
`absMulHeight₁_le_absMulHeight` where 1.1 has `mulHeight₁_div_le_mulHeight`; what it needs from 1.1
is that the coordinates of the normalized representative *are* the ratios, so
`Projectivization.exists_rep_apply_eq_one` was strengthened to say so. Two smaller notes. The
statement is **not** a `Northcott` instance and none is to be stated: the set is cut out by two
conditions of which only one is a height. And the names follow Mathlib's current convention
`finite_setOfPred_…` (`finite_setOf_isRoot` was deprecated in favour of `finite_setOfPred_isRoot`
on 2026-07-09), as 1.1 already does. Finally, **1.4's easy half comes free**: that every root of
unity has absolute height `1` is 1.2 applied to `cyclotomic n ℤ` together with Mathlib's
`Polynomial.cyclotomic_mahlerMeasure_eq_one`, and it is what refutes dropping the degree bound.
What is left of 1.4 is the converse.

**1.4 Kronecker's theorem** (Bombieri–Gubler, Theorem 1.5.9; Hindry–Silverman, Corollary B.2.3.1).
For `x` algebraic over `ℚ`, `absMulHeight₁ x = 1 ↔ x = 0 ∨ ∃ n, 0 < n ∧ x ^ n = 1`, and the strict
form `absLogHeight₁ x = 0 ↔ …`. Route: through 1.2 and Mathlib's
`Polynomial.isPrimitiveRoot_of_mahlerMeasure_eq_one`; the direct route through 1.3 applied to the
orbit `{x ^ n}` — which has bounded height by `mulHeight₁_pow` and bounded degree — is an
alternative proof and a good acceptance test that the two agree. State the **projective** form
alongside it, as Hindry–Silverman B.2.3.1 does: for `P ∈ ℙⁿ(ℚ̄)`, `mulHeight P = 1` if and only if
every defined ratio `x j / x i` is zero or a root of unity. Record also the corollary that a nonzero
algebraic **integer** all of whose conjugates lie in the closed unit disc is a root of unity.

⚠ Three things the route as stated leaves out, and three it gets slightly wrong. First, the
**statement widens** to any field of characteristic zero, as 1.2 and 1.3 do, and four small
Layer-0 prerequisites are missing upstream and are cheap there: `absMulHeight_pow` for tuples,
`absMulHeight₁_pow`, and — from the first of these, `0` and `1` being the idempotents of `K` and a
real number at least `1` that is its own square being `1` — `absMulHeight₁_zero` and
`absMulHeight₁_one`. Second, the **easy direction does not go through the cyclotomic polynomial**:
`absMulHeight₁_pow` gives it in one line, `1 = H(x ^ n) = H(x) ^ n` with `H(x) ≥ 1`. The cyclotomic
route is a second proof, and is where 1.3 gets the infinite family that refutes dropping its degree
bound. Third, the hard direction needs a **complex** root while `x` lives in an arbitrary field:
`ℚ⟮x⟯` is a number field, `IsAlgClosed.lift` embeds it in `ℂ`, and a field homomorphism is
injective, so `(φ x) ^ n = 1` comes back as `x ^ n = 1`. Only a ring homomorphism is used — the
`ℚ`-algebra structure of the embedding is not, the statement not being about conjugates — and the
Mathlib lemma wanted is `pow_eq_one_of_mahlerMeasure_eq_one`, not
`isPrimitiveRoot_of_mahlerMeasure_eq_one` as named above: primitivity of the order is not needed.

⚠ On the **projective form**, the point is described by its ratios `rep i / rep j` as in 1.3, so
no field of definition of a projective point has to be introduced, and the forward direction is
1.3's proof verbatim. The converse is the work, and it is a statement about tuples rather than
about projective space, so it is filed as one:
`absMulHeight_eq_one_of_forall_eq_zero_or_pow_eq_one`, that a tuple each of whose coordinates is
zero or a root of unity has absolute height `1`. Its proof is the idempotent trick again — the
orders of the finitely many nonzero coordinates have a common multiple `N`, the coordinates of
`x ^ N` are then all `0` or `1`, so `x ^ N` is its own square — which is what `absMulHeight_pow`
on tuples is for. Because the pair `(i, j)` ranges over **all** coordinates, the normalization has
to be available at a *chosen* nonvanishing one, so 1.1's `exists_rep_apply_eq_one` was split:
`exists_rep_apply_eq_one_of_ne_zero` takes the index as an input and the old statement is derived
from it. Two smaller notes. The corollary this milestone asks to record — a nonzero algebraic
integer all of whose conjugates lie in the closed unit disc is a root of unity — is **already
Mathlib's** `NumberField.Embeddings.pow_eq_one_of_norm_le_one`, and is one of the ingredients of
the Mahler-measure statement consumed here; it is not restated. And the acceptance test that the
two routes agree is worth having: the orbit proof through 1.3 is ten lines, mentions no complex
number, and needs from Layer 0 only `absMulHeight₁_pow` and, from Mathlib,
`IntermediateField.finrank_le_of_le_right` for `ℚ⟮x ^ n⟯ ≤ ℚ⟮x⟯`.

**1.5 Lower bounds away from one.** `1 < absMulHeight₁ x` for `x` algebraic, nonzero, not a root of
unity, and the effective consequence that for each `D` there is `c > 0` with `absLogHeight₁ x ≥ c`
for every such `x` of degree at most `D` — an immediate corollary of 1.3 and 1.4, and the shape in
which Diophantine arguments consume this layer.

⚠ The milestone has a citation the list above omits: it is **Bombieri–Gubler 1.6.15**, which states
it in exactly this form and derives it in exactly this way — finitely many polynomials of bounded
degree and bounded size, then Kronecker's theorem 1.5.9 — and which is also where Lehmer's
conjecture is stated. It needs nothing from Layer 0 beyond what 1.4 already added; the two
statements and their `absMulHeight₁`/`absLogHeight₁` forms are about fifteen lines, and the file is
mostly the examples. ⚠ The word **"effective" above is wrong**, and should be struck. The constant
produced is the minimum of a finite set that Northcott's theorem only asserts to be finite, and
nothing in the proof describes it. The effective statements are different theorems: Bombieri–Gubler
record `h(α) ≥ (log 2)/d` for an `α` of degree `d` that is not an algebraic unit, in the same
paragraph, and Dobrowolski's theorem is the effective bound in the general case. Neither is in
scope here, and 1.5 should say `∃ c > 0` and claim nothing more.

⚠ The **dependence of `c` on `D` is essential**, and it is worth making the milestone say so,
because the statement that looks like the improvement is Lehmer's conjecture and is open. The
`N`-th root of `2` is neither zero nor a root of unity and has `absLogHeight₁ = (log 2)/N`, since
its `N`-th power is `2` and `absLogHeight₁_pow` of Layer 0 turns that into the height; so no single
`c > 0` serves every degree. That is refuted among the examples, in the form "for every `c > 0`
there is such an `x` with height below `c`". What Lehmer's conjecture asks is for a positive lower
bound on `[ℚ(x) : ℚ] · h(x)`, which by 1.2 is `log M(x)`; the same example records that this family
keeps that product at most `log 2` — its degree is at most `N` for free, `minpoly` dividing
`X ^ N - 2` — so it says nothing about the conjecture. It is in fact sharp for Bombieri–Gubler's
non-unit bound, `2 ^ (1/N)` having norm `±2`.

### Layer 2: heights of polynomials, linear forms, and matrices

**2.1 The height of a polynomial.** `Polynomial.mulHeight p := Finsupp.mulHeight p.toFinsupp.coeff`
and `MvPolynomial.mulHeight p := Finsupp.mulHeight p.coeff` — both are literally `Finsupp` s over
`K`, so Mathlib's `Finsupp.mulHeight` is the definition and nothing new is constructed. Prove the
basic API: invariance under scaling by `Kˣ`; `mulHeight (C a) = 1` for every `a` (a one-entry
tuple has height `1` by the product formula, `mulHeight_eq_one_of_subsingleton`, and the zero
polynomial takes the junk value), so the value on monomials is `1` too; the compatibility with
Mathlib's affine height, `mulHeight (X - C a) = mulHeight₁ a`, since `![-a, 1]` and `![a, 1]` have
the same height; behaviour under `Polynomial.map` along a field embedding; and the relation to the
tuple height of the coefficient vector on `Fin (natDegree p + 1)`. ⚠ `mulHeight (C a) = mulHeight₁ a`
is false (`a = 2` over `ℚ`: left side `1`, right side `2`); `mulHeight₁ a` is the height of the
*two*-entry tuple `![a, 1]`.

⚠ The definition no longer needs the detour the line above spells. Mathlib's `Polynomial.coeff`
and `MvPolynomial.coeff` **are** the coefficient `Finsupp`, not a function on exponents, so both
definitions read `Finsupp.mulHeight p.coeff` and `p.coeff.support = p.support` holds by `rfl`.
⚠ What the milestone does not say is that **`Finsupp.mulHeight` has no API**: Mathlib declares it
and `Finsupp.logHeight` and proves nothing about either, so the layer begins by building one, and
every item on the list above is a corollary of a single lemma Mathlib lacks — the height of a
`Finsupp` is the tuple height along any injective reindexing whose range covers the support
(`Finsupp.mulHeight_eq_mulHeight_comp`). The `Fin (natDegree p + 1)` form, the value on monomials,
`X - C a` and the behaviour under `map` all drop out of it. Two further items belong on the list,
because they are free and are used later: `mulHeight (p * X ^ n) = mulHeight p`, the statement that
the height sees the coefficients and not where they sit; and that the scaling hypothesis `c ≠ 0` is
not removable, since at `c = 0` the left-hand side collapses to the junk value `1`.

⚠ **`Finsupp.logHeight` is not the logarithm of `Finsupp.mulHeight`**, and that has to be repaired
before the logarithmic height of a polynomial can be defined at all. Both are declared inside
Mathlib's `namespace Height`, where the bare name `mulHeight` resolves to `Height.mulHeight`; so
`Finsupp.logHeight x` unfolds to `log (Height.mulHeight ⇑x)` — the height of the coerced function
on the *whole* index type — and the lemma named `Finsupp.logHeight_eq_log_mulHeight` does not
mention `Finsupp.logHeight` at all. The two heights do agree, and that is proved here as
`Finsupp.mulHeight_coe_eq`, but it is a theorem, and not one that
`Height.mulHeight_eq_mulHeight_restrict_support` supplies: that lemma assumes a finite index type,
and for polynomials the index type is `ℕ`. The local supremum has to be compared directly, using
that an absolute value is nonnegative and vanishes off the support. This is an upstream defect and
should be reported.

⚠ On **`Polynomial.map`**: over a general field embedding there is no comparison of heights to be
had, since Mathlib's height is relative to the field the coefficients are read in. What is true is
only that the support does not change, so the height of the image is the tuple height of the mapped
coefficients. The statement with content is the number-field one,
`mulHeight (p.map (algebraMap K L)) = mulHeight p ^ [L : K]` — the polynomial form of Layer 0.3 —
and the milestone should ask for it. ⚠ The ⚠ already on the list is confirmed, and has a companion
worth stating here rather than in 2.3: the polynomial height is **not multiplicative**. `X + 1` has
height `1` over `ℚ` — it is `X - C (-1)` — while `(X + 1) ^ 2` has coefficient vector `![1, 2, 1]`
and height at least `2`. That is the whole reason 2.3 carries a factor `2 ^ (deg p + deg q)`, and
the reason the Mahler measure, which *is* multiplicative, is the sharper tool; it is among the
examples.

**2.2 Gauss's lemma for heights** (Bombieri–Gubler, Lemma 1.6.3; Hindry–Silverman §B.7). At every
nonarchimedean place `v`, the local factor is multiplicative:
`⨆ (v ∘ coeff (p * q)) = (⨆ v ∘ coeff p) * (⨆ v ∘ coeff q)`. This is the content of Gauss's lemma
and the only place the ultrametric inequality is used sharply; Mathlib's
`IsNonarchimedean.apply_sum_le` is the input.

⚠ **The univariate half is already Mathlib's, and the input named above is the wrong one.**
`Polynomial.gaussNorm_mul` *is* Gauss's lemma at a nonarchimedean absolute value — the inventory
above already lists it, as the arithmetic input to Layer 1.2 — so univariately the milestone has
only to identify the local factor with the Gauss norm at `c = 1`,
`⨆ n : ℕ, v (p.coeff n) = Polynomial.gaussNorm v 1 p`, which Mathlib does not state. And
`IsNonarchimedean.apply_sum_le` does not live where its name suggests: it is in
`Mathlib/NumberTheory/Height/MvPolynomial.lean`, not in `Mathlib/Algebra/Order/Ring/`
`IsNonarchimedean.lean`, because it needs the target to be `ℝ`. It is the input to the
*multivariate* case, not the univariate one.

⚠ **The multivariate case is missing from Mathlib and is the layer's real work.**
`MvPowerSeries.gaussNorm_mul_eq_mul` exists, but it takes the hard part as a hypothesis: a pair of
exponents `i`, `j` dominating the antidiagonal of `i + j`. Producing it needs a linear order on
`σ →₀ ℕ` compatible with addition, because the dominant exponent is the **least** one among those
realising the supremum, not the one of largest degree. Mathlib's `MonomialOrder` cannot supply it:
its only construction is `MonomialOrder.lex`, which requires `[WellFoundedGT σ]` — false already
for `σ = ℕ` — and the structure insists on well-foundedness, which this argument never uses, since
the minimum is taken over a *finite* set, the set of exponents realising the supremum. What it
does use is available: `Lex (σ →₀ ℕ)` is a `LinearOrder` and an `IsOrderedCancelAddMonoid` for
every `[LinearOrder σ]`, and every `σ` carries a linear order classically. Two lemmas Mathlib
lacks drop out and belong on the list: `Finsupp.exists_min_eq_iSup_apply`, that the supremum of
`v ∘ x` is attained and attained at an index minimal for any prescribed order; and
`Polynomial.iSup_coeff_eq_iSup_fin`, the local-factor form of `mulHeight_eq_mulHeight_coeff`.

⚠ **"What makes the loss in Gelfond's inequality purely archimedean" is a theorem, and it belongs
in 2.2.** The statement is that a comparison of local factors which is an *equality* at the
nonarchimedean places and holds up to a factor `C` at the archimedean ones compares the heights up
to `C ^ totalWeight K` — in both directions. With Gauss's lemma discharging the nonarchimedean
half, that leaves 2.3 with a purely local archimedean estimate and nothing global to do, which is
the division of labour the roadmap intends but does not state. The transport has to go through
`Height.mulHeight_fun_mul_eq`, the Segre relation of 2.4, applied to the multiplication table on
`p.support × q.support`: the direct route is closed, because splitting the nonarchimedean
`finprod` over a product needs `Height.hasFiniteMulSupport_iSup_nonarchAbsVal`, which is `private`
in Mathlib and assumes a finite index type. A free consequence worth stating: over a field with no
archimedean places the polynomial height is exactly multiplicative — for a number field
`totalWeight K = [K : ℚ] ≠ 0`, so this is the function-field statement.

⚠ **The archimedean loss can be nil**, so the constant of 2.3 is far from attained even in small
cases: over `ℚ`, `(X - 2)(X - 3) = X² - 5X + 6` has height `6`, exactly `2 · 3`. It is among the
examples, next to the rejection test that the ultrametric hypothesis in Gauss's lemma is not
decoration — at the ordinary absolute value on `ℝ`, `X + 1` has local factor `1` and `(X + 1)²`
has local factor `2`.

**2.3 Gelfond's inequality** (Bombieri–Gubler, Lemma 1.6.11; Hindry–Silverman, Proposition B.7.3,
where it is spelled *Gelfand's* inequality — the attribution is to A. O. Gelfond and both spellings
are in print, so the docstring carries both; the elementary converse is their Proposition B.7.2).
The archimedean loss is at most a power of two per archimedean place. In the absolute height the
constant is `2 ^ (deg p + deg q)`; in Mathlib's relative height, which Layer 2 is stated in, it is
`2 ^ ((natDegree p + natDegree q) * totalWeight K)`:
`mulHeight (p * q) ≤ 2 ^ ((natDegree p + natDegree q) * totalWeight K) * mulHeight p * mulHeight q`
and the reverse
`mulHeight p * mulHeight q ≤ 2 ^ ((natDegree p + natDegree q) * totalWeight K) * mulHeight (p * q)`.
The local inequality at one archimedean place is the book's; the relative height raises it to the
power `mult v` and multiplies over the places, and `totalWeight_eq_sum_mult` collects the exponent.
Prove the multivariate form for `MvPolynomial` with the total degree in the exponent. Record the sharp
multiplicative statement `M(pq) = M(p) M(q)` as a consequence of Mathlib's `mahlerMeasure_mul`, and
the comparison between `mulHeight p` and `mahlerMeasure p` in both directions, which is what makes
the exponent `2^deg` unavoidable and the Mahler measure the sharper tool.

⚠ **The reverse inequality is false as stated.** Neither the sentence above nor the milestone's
`polyMulHeight_mul_polyMulHeight_le` carried a nonvanishing hypothesis, and the junk value breaks
it at `p = 0`: the left side becomes `1 · mulHeight q`, which is unbounded,
while the right side is `2 ^ ((0 + natDegree q) * totalWeight K) · mulHeight 0`. Over `ℚ` with
`q = X - C 100` that reads `100 ≤ 2`. Both `p ≠ 0` and `q ≠ 0` have to be added; the upper half is
correct as stated, because there the junk value sits on the side that is being bounded. The
rejection test is in Layer 2.2's file, where the hypothesis first appears.

⚠ **The lower half cannot be stated for a general `[AdmissibleAbsValues K]` at all.** The class
puts *no* condition on `archAbsVal`: it is an arbitrary multiset of absolute values, and only the
members of `nonarchAbsVal` are required to be nonarchimedean. Gelfond's inequality at an
archimedean place is a statement about the Mahler measure, which lives on `ℂ[X]`, and without an
embedding `K →+* ℂ` there is nothing to run it through — the class supplies none, and none is
derivable, since an "archimedean" absolute value here need not even be archimedean. So the reverse
inequality is proved for a **number field**, where every member of `archAbsVal` is
`NumberField.place φ` for a complex embedding `φ` and `mem_multisetInfinitePlace` produces it. The
milestone should say so. The upper half has no such problem and is stated over any
`[AdmissibleAbsValues K]`, because it uses only the triangle inequality. The bridge that makes the
lower half work, `⨆ n, v (p.coeff n) = (p.map φ).supNorm`, belongs on the list.

⚠ **The constant `2 ^ (deg p + deg q)` of the upper half is not the right one, and the sharp
elementary constant is attained.** The upper local estimate is the triangle inequality applied to
`(p * q).coeff n = ∑_{i + j = n} p_i q_j`, so the constant is simply the number of terms that can
be nonzero: `min #p.support #q.support`, hence `min (natDegree p) (natDegree q) + 1`. Over `ℚ`,
`p = q = X + 1` gives `mulHeight (p * q) = 2`, which is exactly
`(min 1 1 + 1) ^ totalWeight ℚ * (mulHeight p * mulHeight q)`, while `2 ^ ((1 + 1) * totalWeight ℚ)`
is `4`. The milestone should ask for the sharp form and keep `2 ^ (deg p + deg q)` as the
corollary that matches the literature and the multivariate statement.

⚠ **The multivariate upper half does hold with the total degree in the exponent and needs no
finiteness on `σ`** — but not for the reason the support count suggests. `#p.support` does not
convert into a bound in terms of `totalDegree p` unless `σ` is finite. What converts is the
antidiagonal count: the antidiagonal of an exponent `m : σ →₀ ℕ` has
`∏ i, (m i + 1) ≤ 2 ^ (∑ i, m i)` elements, and `∑ i, m i ≤ totalDegree p + totalDegree q` for
every `m` in the support of `p * q`. Both counts are proved, from one convolution bound stated for
`Finsupp`s over any cancellative index monoid with an antidiagonal.

⚠ **The multivariate *lower* half is out of reach and should be removed from the milestone.**
Mathlib's Mahler measure is univariate (`Polynomial.mahlerMeasure` on `ℂ[X]`); there is no
`MvPolynomial` Mahler measure, no multivariate Gelfond inequality, and the proof has no other
route. `MvPolynomial` gets the upper half only.

⚠ **One lemma Mathlib lacks is on the critical path and is proved here:**
`Nat.choose_middle_mul_sqrt_le_two_pow`, that `n.choose (n / 2) * √(n + 1) ≤ 2 ^ n`, equivalently
`centralBinom n ^ 2 * (3 * n + 1) ≤ 16 ^ n`. Without it the constant that falls out of Mathlib's
`supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure` and
`mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm` is
`2 ^ (deg p + deg q) * √(deg p + deg q + 1)`, not the literature's power of two — the square root
is intrinsic to the *sup-norm* formulation, since `M(f) ≤ ‖f‖` is false (`X² - X - 1` has Mahler
measure `φ` and sup norm `1`) and only `M(f) ≤ ‖f‖₂ ≤ √(deg f + 1) ‖f‖` is available. Mathlib has
only `Nat.centralBinom_le_four_pow`, which is too weak; the induction step is
`(2n + 1)² (3n + 4) ≤ 4 (n + 1)² (3n + 1)`, true by one unit in the linear coefficient. It belongs
upstream.

⚠ **"the comparison between `mulHeight p` and `mahlerMeasure p` in both directions" is already
Mathlib's**, in the `ℂ[X]` sup-norm form: `supNorm_le_choose_natDegree_div_two_mul_mahlerMeasure`
and `mahlerMeasure_le_sqrt_natDegree_add_one_mul_supNorm`, with `mahlerMeasure_mul` for
`M(pq) = M(p) M(q)`. There is nothing for the milestone to prove there, and nothing to restate:
the three are consumed in the proof of the lower half. What was missing is only the identification
of the local factor with `Polynomial.supNorm`, which is the bridge above.

**2.4 Linear forms and the Segre relation.** Mathlib has the Segre relation
`h(x ⊗ y) = h(x) + h(y)` (Bombieri–Gubler 1.5.14) as `Height.mulHeight_fun_mul_eq`, and the sum
bound for field elements `h(P₁ + ⋯ + P_r) ≤ ∑ h(P_i) + log r` (Proposition 1.5.15, absolute) as
`mulHeight₁_sum_le`, whose relative constant is `#s ^ totalWeight K` — already the sharp one; there
is nothing to sharpen there. What is missing is the **tuple** form: for a tuple `w : β → K` and an
index map `f : α → ι → β`, `mulHeight (fun i ↦ ∑ a ∈ s, w (f a i)) ≤ #s ^ totalWeight K * mulHeight w`,
the statement that sums of coordinates of one projective point cost `#s ^ totalWeight K`. ⚠ The
naive tuple statement `mulHeight (x + y) ≤ C · mulHeight x · mulHeight y` is **false** for every
`C`: scale `y` by `c ∈ Kˣ`, which fixes the right-hand side and sends `mulHeight (x + c • y)` to
infinity; the sum bound for tuples is a statement about one tuple, not two. A linear form is a
degree-one polynomial and its height is 2.1 applied to it; no separate definition. What this
milestone owns beyond the tuple sum bound is the estimates for the value `∑ i, a i * x i` against
the heights of `a` and `x`: in the sup-norm height the constant is `(card ι) ^ totalWeight K`, and
in the Arakelov normalization of Layer 0 Cauchy–Schwarz at each archimedean place removes the
cardinality altogether.

⚠ **Mathlib has grown past most of this milestone.** `Height.mulHeight_linearMap_apply_le` —
`mulHeight (fun j ↦ ∑ i, A (j, i) * x i) ≤ Nat.card ι ^ totalWeight K * mulHeight A * mulHeight x`,
with its logarithmic twin — is in `Mathlib/NumberTheory/Height/MvPolynomial.lean`, together with
`mulHeight_eval_le` and `mulHeight_eval_ge` for families of homogeneous polynomials, which are the
degree-`N` generalization. So the "estimates for the value `∑ i, a i * x i`" already exist in
Mathlib in the *tuple-valued* form, with exactly the constant the milestone names, and the local
halves `AbsoluteValue.iSup_abv_linearMap_apply_le` and
`IsNonarchimedean.iSup_abv_linearMap_apply_le` are there too. Nothing of that should be restated.
What is genuinely missing is the tuple **sum** bound and the **affine** form of the value bound,
and those are what Layer 2.4's file proves.

⚠ **The value of a linear form has no bound in the projective heights of `a` and `x`.** It is the
same scaling argument that kills the naive tuple sum bound, and it applies to the milestone's own
last sentence: replacing `a` by `c • a` multiplies `∑ i, a i * x i` by `c` while leaving
`mulHeight a` fixed, so no constant works. The statement that survives needs the **affine** height
of a tuple — the projective height of `(1, x₁, …, x_n)` — which Mathlib does not have. The bound
is then
`mulHeight₁ (∑ i, a i * x i) ≤ Nat.card ι ^ totalWeight K * (mulHeightAff a * mulHeightAff x)`.
The affine height is a normalization choice and not a statement about linear forms, so it is
**0.5** and not part of this milestone; what 2.4 owns is the bound. The milestone should also say
that `mulHeightAff` is deliberately *not* scaling-invariant — that is the whole content, and 0.5
records it as `Height.exists_mulHeightAff_smul_ne`.

⚠ **"Cauchy–Schwarz removes the cardinality" is a theorem about linear *maps*, not about a single
form, and it removes the constant entirely.** In the Arakelov normalization of Layer 0,
`arakelovMulHeight (fun j ↦ ∑ i, A (j, i) * x i) ≤ arakelovMulHeight A * arakelovMulHeight x`,
with constant exactly `1` and no hypotheses at all — against `Nat.card ι ^ totalWeight K` for the
sup norm. The reason it is stated for the matrix rather than for one form is that Cauchy–Schwarz
is applied row by row and then summed, so the bound that appears on the right is the *Frobenius*
norm of `A`, which is precisely the ℓ² local factor of the tuple of all entries; at the finite
places the ultrametric inequality gives the same with no loss. This is the first place in the
roadmap where the Arakelov normalization is strictly better rather than merely different, and the
milestone should record it as the reason Layer 0 carries two normalizations at all. It is also
where 2.5's matrix product bound should come from.

⚠ **`Height.hasFiniteMulSupport_iSup_nonarchAbsVal` is `private` in Mathlib**, and it is the one
ingredient the global step of the tuple sum bound needs — the statement that a nonzero tuple has
sup-norm local factor `1` at all but finitely many nonarchimedean places. Layer 2.2 routed around
it through the Segre relation; here there is no route around it, and it is reached by
`import all Mathlib.NumberTheory.Height.Basic`, exactly as Mathlib's own
`Mathlib/NumberTheory/Height/MvPolynomial.lean` reaches it. Making it public is a one-line upstream
change and belongs on the list.

⚠ **Both constants are attained, and the examples say so.** Over `ℚ`, reading two entries of
`w = ![1, 0]` off in each coordinate produces the tuple `![2, 1]` of height `2`, against
`#s ^ totalWeight ℚ * mulHeight w = 2`; and `a = x = ![1, 1]` gives `mulHeight₁ 2 = 2` against
`Nat.card (Fin 2) ^ totalWeight ℚ * (mulHeightAff a * mulHeightAff x) = 2`. The Arakelov constant
`1` is attained as well, for a one-element source, where the linear map is a reindexing. The
milestone's claim that the relative constant of `mulHeight₁_sum_le` is "already the sharp one" is
correct and now has company: every constant in 2.4 is sharp.

**2.5 The height of a matrix** (Bombieri–Gubler's `H(A)`, 2.9.8).
`Matrix.mulHeight A := Height.mulHeight fun p : ι' × ι ↦ A p.1 p.2`, with `logHeight` alongside.
Prove: invariance under `Matrix.transpose` and under row and column permutations; scaling by `Kˣ`;
the submatrix bound `mulHeight (A.submatrix f g) ≤ mulHeight A`; the product bound, for the inner
index type `ι` nonempty,
`mulHeight (A * B) ≤ (Fintype.card ι : ℝ) ^ totalWeight K * mulHeight A * mulHeight B`, whose
local form is the triangle inequality on a sum of `card ι` terms at each archimedean place and
exact multiplicativity at the nonarchimedean ones; and the bound on the height of `A.det` in terms
of `mulHeight A` and the size, from the Leibniz expansion. Consume
`Height.mulHeight_linearMap_apply_le` for the action on tuples rather than reproving it. Two
rejection tests for the product bound: over `ℚ(i)`, `A = [1 1]` and `B = [[N, 0], [N, 1]]` give
`A B = [2N, 1]` with `H(AB) = 4N²`, `H(A) = 1`, `H(B) = N²`, so the absolute constant `card ι = 2`
fails and the relative one `2 ^ 2 = 4` is sharp; and for `ι` empty, `A B = 0` has the junk height
`1` against a right-hand side of `0`, which is why `[Nonempty ι]` is a hypothesis.

⚠ **The determinant bound is false as the milestone states it.** There is no bound on the height
of `A.det` "in terms of `mulHeight A` and the size": `A ↦ c • A` leaves `mulHeight A` fixed and
multiplies `A.det` by `c ^ n`. The cheapest witness is `1 × 1`, where the index type `ι' × ι` is a
subsingleton, so `mulHeight A = 1` for *every* `A` while `A.det` is the single entry —
`Matrix.exists_not_mulHeight₁_det_le`. This is the same scaling obstruction that 2.4 records for
the value of a linear form, and it has the same fix, the **affine** height. The statement that is
true is columnwise and sharper than the one asked for,
`mulHeight₁ A.det ≤ (Fintype.card ι)! ^ totalWeight K * ∏ j, mulHeightAff (fun i ↦ A i j)`, with
`mulHeight₁ A.det ≤ (Fintype.card ι)! ^ totalWeight K * mulHeightAff A ^ Fintype.card ι` as the
corollary in the height of the whole matrix. Two milestones need `Height.mulHeightAff`, which is
why it is **0.5** and belongs to neither.

⚠ **The Leibniz expansion carries signs, and 2.4's tuple sum bound does not.** A determinant is a
sum of `n!` products of entries, each with the sign of its permutation, so the engine that proves
the bound has to allow summands multiplied by `±1`. Locally this is free, since `v (-x) = v x` at
every absolute value; what is not free is the *interface*, because the tuple sum bound sums
`w (f a i)`, letters of a fixed alphabet, and a sign is not a letter. The layer therefore owns
`Height.mulHeight_sum_sign_comp_le'`, deduced from the unsigned bound by doubling the alphabet
with a `Bool` and applying the Segre relation, the two extra letters `1` and `-1` forming a tuple
of height `1`. It belongs next to the unsigned engine in 2.4 and the milestone should say so.

⚠ **The `ℚ(i)` rejection test holds over every number field at once, and needs no `N`.** With
`A = [1 1]` and `B = [[1, 0], [1, 1]]` over `ℚ` the product is `[2 1]`, so `H(AB) = 2`,
`H(A) = H(B) = 1` and the constant `2 ^ totalWeight ℚ = 2` is attained. Reading those same two
rational matrices in a number field `K` raises all three heights to the power `[K : ℚ]` by Layer
0.3's `NumberField.mulHeight_pow_finrank`, and `[K : ℚ] = totalWeight K`; so
`H(AB) = 2 ^ totalWeight K` against `H(A) = H(B) = 1`, the exponent is exactly right, and the
absolute constant `card ι = 2` fails as soon as `[K : ℚ] ≥ 2`. The milestone's numbers for `ℚ(i)`
are correct, but the `N` in them is inert and no quadratic field has to be constructed to run the
test — which matters, because Mathlib has no ready `ℚ(i)` with a computable height.

⚠ **The Arakelov product bound has constant `1` and no hypotheses at all** —
`Matrix.arakelovMulHeight (A * B) ≤ Matrix.arakelovMulHeight A * Matrix.arakelovMulHeight B`,
against `Fintype.card ι ^ totalWeight K` for the sup norm. At an infinite place the local factor
is the Frobenius norm, and Cauchy–Schwarz entry by entry makes it submultiplicative; at a finite
place the ultrametric inequality does the same for the sup norm. Not even `[Nonempty ι]` is
needed, and that is not an accident: the sup-norm bound needs it only because
`0 ^ totalWeight K = 0` destroys its right-hand side, whereas an Arakelov right-hand side is
always `≥ 1`. So the two normalizations differ here in their *hypotheses* and not only in their
constants. 2.4's closing remark that this is where 2.5's product bound should come from is right
in substance and inverted in logic: the linear-map statement of 2.4 is the case of `B` with one
column, so the matrix bound is the general one and 2.4's a special case of it.

### Layer 3: Plücker coordinates and the height of a subspace

The layer this roadmap exists for. Throughout, `V : Submodule K (ι → K)` with `[Fintype ι]`,
`[LinearOrder ι]` (see *Standing hypotheses*) and `Module.finrank K V = k`.

**3.1 The Plücker point** (Hindry–Silverman, Exercise A.1.11(a)–(b); Bombieri–Gubler 2.8.4). For a
basis `b : Fin k → V`, the wedge `⋀ i, (b i : ι → K) ∈ ⋀[K]^k (ι → K)` is nonzero, and its
coordinate vector in
`(Pi.basisFun K ι).exteriorPower k : Basis (Set.powersetCard ι k) K (⋀[K]^k (ι → K))` is a nonzero
element of `Set.powersetCard ι k → K`. A change of basis multiplies the wedge by the determinant of
the change-of-basis matrix, a unit, so the induced point
`Submodule.pluckerPoint V : Projectivization K (Set.powersetCard ι k → K)` is independent of the
basis. Build it exactly as Mathlib builds `Projectivization.mulHeight`: a private well-definedness
lemma feeding `Projectivization.lift`, with the body unexposed. Prove injectivity — distinct
subspaces of the same rank have distinct Plücker points — which is what entitles this to be called
an embedding.

⚠ **The construction is not a `Projectivization.lift`.** `Projectivization.lift` descends a
function *out of* a projective space, and what varies here is a basis of `V`; bases form no
projectivization, so there is nothing to lift. What takes its place is a definition that picks
`Module.finBasisOfFinrankEq` together with the theorem `Submodule.pluckerPoint_eq_mk`, that every
other basis gives the same point — which is also the only thing a later proof ever wants from
well-definedness. `Submodule.pluckerPoint_span_range` is the same statement for a linearly
independent family rather than a basis, and is the form 3.3 will use. For the same reason the body
is deliberately **exposed** rather than hidden: 3.3 has to see `pluckerPoint` as the
`Projectivization.mk` of a coordinate tuple. The rank is left implicit — `pluckerPoint V hV` with
`hV : Module.finrank K V = k` — since `hV` determines it.

⚠ **The Plücker coordinates are the maximal minors by construction, so 3.3's `minorDet` should not
be a new definition.** `exteriorPower.plucker_apply` reads straight off Mathlib's
`exteriorPower.ιMultiDual_apply_ιMulti`: the coordinate of a family `v : Fin k → (ι → K)` at `s` is
`(Matrix.of fun i j ↦ v i (Set.powersetCard.ofFinEmbEquiv.symm s j)).det`, the determinant of the
submatrix on the columns `s` taken in increasing order. The index identification that 3.3 proposes
to "pin here once and for all" is therefore already pinned upstream, by
`Set.powersetCard.ofFinEmbEquiv`; the `Set.powersetCard.orderIsoOfFin` of the milestone is the same
enumeration in a different spelling (`Finset.coe_orderIsoOfFin_apply` is the bridge), so `minorDet A`
is `exteriorPower.plucker m A` with `A` read as its family of rows, and what 3.3 owns is the
invariance under row operations, not the dictionary. Both degenerate cases fall out of the same
formula: `exteriorPower.plucker_zero`, the empty wedge has the single coordinate `1`, and
`exteriorPower.plucker_fin_eq_det`, in top rank the single coordinate is the determinant.

⚠ **Injectivity rests on a criterion Mathlib does not have, and the criterion is the reusable
part.** It is `exteriorPower.ιMulti_snoc_eq_zero_iff`: for a linearly independent family `v`, a
vector lies in `span v` exactly when wedging it on gives `0`. Reaching it needs two statements
Mathlib lacks — `exteriorPower.ιMulti_eq_zero_iff`, that over a field a wedge vanishes exactly on
linearly dependent families (Mathlib has only `ιMulti_family_linearIndependent_field`, the
*family* statement that builds the basis of the exterior power), and `linearIndependent_fin1`, the
`Fin 1` companion of `linearIndependent_fin2`. What makes the criterion see a *projective* point is
that it is stable under scaling the wedge, `exteriorPower.ιMulti_snoc_smul`, proved in
`ExteriorAlgebra K (ι → K)` where wedging on is multiplication. All three belong upstream, and the
milestone should say that injectivity is where the work is: the well-definedness it spends its
sentences on is four lines.

⚠ **3.1 as built already settles two of 3.2's items.** `Submodule.pluckerPoint_span_singleton`
with `exteriorPower.plucker_one_comp` says the Plücker point of a line is the point itself,
re-indexed along the equivalence `Set.powersetCard.ofSingleton : ι ≃ Set.powersetCard ι 1`; so
3.2's compatibility `Submodule.mulHeight (span K {x}) = Height.mulHeight x` is
`Height.mulHeight_comp_equiv` applied to that equivalence and not a computation of its own. And
`exteriorPower.plucker_zero` puts the Plücker point of `⊥` at the constant tuple `1`, whence
`mulHeight ⊥ = 1`. Only `mulHeight ⊤ = 1` still needs an argument, and only because
`exteriorPower.plucker_fin_eq_det` is stated for `ι = Fin n` rather than for an arbitrary `ι` of
cardinality `k`.

⚠ **Injective, not bijective — and nothing in the roadmap needs more.** The image of the Plücker
map is the cone cut out by the Grassmann–Plücker quadrics, so for `1 < k < #ι − 1` the map is not
onto, and neither Mathlib nor this roadmap has those quadrics. Northcott for subspaces (3.7)
transports along injectivity alone, and so does every height statement in Layers 3–5, so they are
not on the critical path. They are what a genuine `Module.Grassmannian` connection would need,
which is a second reason — beside the quotient-versus-subspace convention recorded under *Standing
hypotheses* — that discharging Mathlib's Grassmannian TODO would not by itself give this milestone
anything: the subspace-indexed object it promises would still have to be given the Plücker
embedding separately.

**3.2 The height of a subspace.**
`Submodule.mulHeight V := Projectivization.mulHeight V.pluckerPoint`, with `logHeight`,
`arakelovMulHeight` and (over `ℚ̄`) `absMulHeight` alongside, each defined from the corresponding
height of the Plücker point. Basic API: `1 ≤ mulHeight V`; `mulHeight ⊥ = 1` and `mulHeight ⊤ = 1`,
the two rank-zero and rank- `n` degenerate cases where the exterior power is a line; and the
compatibility that makes the definition the right one,
`Submodule.mulHeight (span K {x}) = Height.mulHeight x` for `x ≠ 0`, so the height of a line **is**
the projective height of the point it defines.

⚠ **The rank does not belong in the definition.** `pluckerPoint` carries `hV : finrank K V = k`,
so the milestone's one-line definition does not typecheck as written; and propagating `hV` into
`Submodule.mulHeight` would make `mulHeight (V ⊓ W)` in 3.6 ill formed until a rank for `V ⊓ W`
had been produced, and `1 ≤ mulHeight V` a conditional statement. Instead the definition takes
`k := finrank K V` and `hV := rfl`, so each of the four heights is a total function of `V` alone,
and `Submodule.mulHeight_eq_mulHeight_pluckerPoint` re-types it along an arbitrary
`hV : finrank K V = k` — by `subst`, `k` being a variable. That lemma, not the definition, is what
every proof enters through, so the four bodies are left **unexposed**, as Mathlib leaves
`Projectivization.mulHeight`'s and unlike `pluckerPoint`'s, which 3.3 has to see.
`Roadmap/Suggested.lean` carried the shape this displaces: its `subspaceMulHeight k V hV` took the
rank and the proof as arguments, and so did every Layer 3 signature stated in terms of it —
including `subspaceMulHeight_range_vecMulLinear_mul` of 3.3, which then needs two rank hypotheses
for what is the same subspace, and `subspaceMulHeight_dualAnnihilator` of 3.5, which needs one for
`V` and one for its annihilator. None of them do, once the rank is read off `V`, and the file now
states the delivered form throughout — including 5.6, which loses its rank
argument with it.

⚠ **Both degenerate cases are one argument, and neither is a computation of Plücker
coordinates.** The finding under 3.1 said that `mulHeight ⊤ = 1` still needed an argument because
`exteriorPower.plucker_fin_eq_det` is stated for `ι = Fin n`. It does not. In both degenerate ranks
the *index type* collapses — `Set.powersetCard ι 0` is `{∅}` and `Set.powersetCard ι (#ι)` is
`{univ}` — so every tuple over it has height `1` by the product formula, the same four lines in
each of the four normalizations, and neither `exteriorPower.plucker_zero` nor `plucker_fin_eq_det`
is used at all. What is used is two statements Mathlib lacks although it has their neighbours:
`Set.powersetCard.subsingleton_iff`, the negation of Mathlib's `Set.powersetCard.nontrivial_iff`,
and `Projectivization.mulHeight_eq_one_of_subsingleton`, the projective form of Mathlib's
`Height.mulHeight_eq_one_of_subsingleton`. Both belong upstream.

⚠ **3.2 owes 3.3 one lemma more than the milestone names, and it finishes the dictionary.** The
compatibility stated here is the rank-one one; what 3.3 needs is `Submodule.mulHeight_span_range`,
that the height of the span of a linearly independent family is the height of its tuple of Plücker
coordinates — which, read through `exteriorPower.plucker_apply`, already **is** Remark 2.8.7's "the
height of the row space is the height of the tuple of maximal minors". It is proved here in all
four normalizations and carries no rank hypothesis, `finrank_span_eq_card` supplying one from
linear independence. Together with the finding under 3.1 that `minorDet` should not be a new
definition, what is left of 3.3 is the invariance under row operations and nothing else.

⚠ **Finishing 3.2 took four additions to Layer 0, none of them about subspaces.** Layer 0.4 had no
`NumberField.absMulHeight_comp_equiv` — only the inequality `absMulHeight_comp_le` — and no
subsingleton value; Layer 0.1 had the tuple-level `arakelovMulHeight_eq_one_of_subsingleton` but
not its projective form, and 0.4 had neither. They were added to the Layer 0 files, where the
definitions live, rather than carried in the Layer 3 file. ⚠ `absMulHeight_comp_equiv` needs **no**
algebraicity hypothesis, unlike the `comp_le` of which it is the two-sided form: an equivalence
permutes the transcendental coordinates rather than dropping them, so the two sides take the junk
value `1` together. 0.4's milestone should name it, since every reindexing statement downstream —
3.2's own compatibility among them — goes through it.

⚠ **The passage between the normalizations is free at this level.** `Submodule.absMulHeight_eq`,
that over a number field the absolute height of a subspace is the relative one raised to
`1 / [K : ℚ]`, is `Projectivization.absMulHeight_eq` applied to the Plücker point and is one line.
So the theorems of 3.5 and 3.6 need not be proved twice: raising to a positive power preserves both
equalities and inequalities between positive reals, and each may be stated in whichever
normalization its source states it in — Bombieri–Gubler's absolute `h_Ar` for 3.6, the Arakelov
form for what 5.3 and 5.4 consume — and transported. ⚠ What is free here is the passage between
the *absolute* and *relative* heights, which differ by a positive power. The passage between the
sup-norm and the ℓ² normalizations is not free and is not even true: 3.6 holds for the second and
is **false** for the first.

**3.3 The matrix dictionary** (Bombieri–Gubler, Remark 2.8.7). For `A : Matrix (Fin m) ι K` of full
row rank, the Plücker point of the row space is the tuple of maximal minors,
`minorDet A s = (A.submatrix id (Set.powersetCard.orderIsoOfFin s)).det` — the order isomorphism
being the index identification, pinned here once so that no later statement re-chooses it. Hence
`subspaceMulHeight (rowSpace A)` is the **sup-norm** height of the vector of maximal minors, and
its Arakelov variant of 3.2, `arakelovSubspaceMulHeight (rowSpace A)`, is `H_Ar^row(A)` in the
classical literature (Definition 2.8.11); per the conventions above, neither is
`matrixMulHeight A`. Bombieri–Gubler use both and distinguish them exactly this way: their
`H(A)` (2.9.8) is the height of the entries, their `H_Ar(A)` the height of the row space. Prove the
invariance this buys: `mulHeight (rowSpace (U * A)) = mulHeight (rowSpace A)` for `U` invertible
(Bombieri–Vaaler (2.5), where it is the statement that the height is *intrinsic on the Grassmannian*
rather than a property of the matrix), which is the invariance under row operations that the naïve
Siegel bound lacks.

⚠ **Neither `minorDet` nor `rowSpace` should be a definition, and the order isomorphism the
milestone names does not exist.** The finding under 3.1 already replaced `minorDet A` by
`exteriorPower.plucker m A.row`; the same verdict applies to `rowSpace A`. Mathlib names the row
space twice — `Submodule.span R (Set.range A.row)` and `LinearMap.range A.vecMulLinear` — and proves
the two equal in `range_vecMulLinear`, so a third name would leave 3.5, 5.5 and every statement
about `ker A` choosing among three spellings of one object. Everything here is stated in the span
form, which is what 3.2's `Submodule.mulHeight_span_range` consumes, and the bridge is recorded as
an example. As for the index identification, `Set.powersetCard.orderIsoOfFin` is not a Mathlib
declaration: the enumeration of a `k`-element `Finset` is `Finset.orderEmbOfFin`, which is what
`Set.powersetCard.ofFinEmbEquiv` is built from, and `Finset.orderIsoOfFin` is its `≃o` form.
`Matrix.plucker_row_eq_det_submatrix` and `Matrix.plucker_row_eq_det_submatrix_orderIso` give the
milestone's formula in both spellings, but there was nothing left to pin.

⚠ **The invariance under row operations is not a theorem about heights.** What is proved is
`Matrix.span_range_row_mul`: for `U` of unit determinant, `span R (range (U * A).row)` **is**
`span R (range A.row)`, an equality of submodules over any commutative ring, whose proof is
`Matrix.nonsing_inv_mul` and two applications of the inclusion `span (range (U * A).row) ≤
span (range A.row)`. Each of the eight height statements that follow — four normalizations,
multiplicative and logarithmic — is then a `congrArg`, precisely because 3.2's definition takes
neither a basis nor a rank. The milestone should say that the content is the span equality and that
it needs no height and no field.

⚠ **The sharp form is hypothesis-free, ring-generic, and needs machinery Mathlib does not have —
which is avoidable.** `Matrix.plucker_row_mul` is
`exteriorPower.plucker m (U * A).row = U.det • exteriorPower.plucker m A.row` for **every** square
`U` over **any** commutative ring: no invertibility (for singular `U` both sides vanish), no field.
That is Bombieri–Vaaler (2.5) itself, and it gives the invariance of the minor tuple's projective
height, `Matrix.mulHeight_plucker_row_mul`, without passing through subspaces at all; the milestone
states only the invertible, height-level consequence. ⚠ The classical proof of it expands an
alternating map along a matrix — `f (fun i ↦ ∑ j, U i j • v j) = U.det • f v` — and **Mathlib has no
such statement for an alternating map into a module**: `AlternatingMap.eq_smul_basis_det` is the
scalar-valued case, `Basis.det` reaches the same thing through `Basis.toMatrix` and
`Matrix.det_mul` and is scalar-valued too, and `exteriorPower.ιMulti` has nothing. It is not
needed: the rows of `U * A` are `A.vecMulLinear ∘ U.row` by `rfl`, so
`exteriorPower.map` transports the relation and only the square case remains, where 3.1's
`exteriorPower.plucker_fin_eq_det` already identifies the single coordinate with the determinant.
A contributor who starts from the alternating-map expansion will spend the milestone proving it.

⚠ **The dictionary itself was finished by 3.2.** `Submodule.mulHeight_span_range` together with
`exteriorPower.plucker_apply` already says that the height of the row space is the height of the
tuple of maximal minors; `Matrix.mulHeight_span_range_row` and its Arakelov and absolute companions
are that statement rewritten into the `submatrix` spelling, one line each. What 3.3 adds is the
spelling and the invariance, as the finding under 3.1 predicted.

⚠ **3.3 cannot live in `Matrix.lean`, and the distinction it exists for is now machine-checked.**
`ArithmeticHeights/Matrix.lean` is Layer 2.5, the height of the entries; giving it the Plücker point
would make a Layer 2 file depend on Layer 3. Layer 3.3 is `RowSpace.lean`, and the *Suggested home*
list above should gain `…/Height/RowSpace.lean` beside `…/Matrix.lean`. Layer 2.5 is imported there
only by a plain, non-`public` import, used by a worked example that exhibits `U` of unit determinant
for which the row-space height is unchanged while `Matrix.mulHeight` rises from `1` to `3` — the
pinned convention's claim that the two are different numbers, and the reason the naïve Siegel bound
of 5.1 is not invariant, both checked rather than asserted.

**3.4 The Cauchy–Binet identity** (Schmidt 1967, §2 Lemma 1; Bombieri–Gubler, Proposition 2.8.8;
Bombieri–Vaaler (2.4)(iv)). The statement to prove is the ring-generic one: for `A, B` of size
`m × n` over a commutative ring, `det (A Bᵀ) = ∑_S det A_S · det B_S`, the sum over the
`m`-element column sets `S`, in the `minorDet` indexing of 3.3. Its two archimedean
specializations are what the ℓ² local factor of the minor vector needs: at a **real** place
`B = A` gives `∑ s, (det A_s)² = det (A Aᵀ)`, the Gram determinant of the rows; at a **complex**
place `B = conj A` gives `∑ s, |det A_s|² = det (A A*)` with the conjugate transpose. State both;
the real one alone leaves the Bombieri–Vaaler constant available only over totally real fields.
This is a named milestone rather than a step inside a proof, because it is precisely where the
`√|det (A Aᵀ)|` of the Bombieri–Vaaler bound is produced. Prove alongside it the **generalized
Hadamard inequality**
(Schmidt 1967, §2 Lemma 2; Bombieri–Vaaler (2.6); Bombieri–Gubler's Fischer inequality, Remark
2.8.9): for a partition of the rows into two blocks, `H_u(A) ≤ H_u(A₁) · H_u(A₂)`. That is what
turns a row-space bound into a bound in terms of individual rows (5.5).

⚠ **Cauchy–Binet is not a determinant expansion; it is one bilinear form with two descriptions.**
No permutation sum, no Laplace expansion, no induction on the size enters. Mathlib's
`exteriorPower.pairingDual` pairs `⋀^k (Dual R M)` with `⋀^k M`, and Layer 3.1's coordinate
functional `exteriorPower.ιMultiDual` *is by definition* that pairing against the wedge of the dual
basis vectors indexed by `s`. So pairing along `Module.Basis.toDual` of the standard basis of
`ι → R` gives `∑ₛ xₛ yₛ` when read on the induced basis of the exterior power, and a determinant of
dot products when read on wedges, by `exteriorPower.pairingDual_ιMulti_ιMulti`; the identity is that
those are the same form. Thirty lines with the statements included, and every statement
hypothesis-free: `exteriorPower.sum_plucker_mul_plucker` needs no field, no rank hypothesis and no
linear independence. A contributor who starts from `Matrix.det_apply` will spend the milestone on
sign bookkeeping. ⚠ The general form of
the identity — `det (A B) = ∑_S det A_S · det B^S` for `A` of size `m × n` and `B` of size `n × m`,
which is what the name Cauchy–Binet refers to — costs one extra line over the transposed form the
milestone states, and both are worth having, in the `plucker` and the `submatrix` spellings alike.

⚠ **Mathlib has the bilinear form this proof wants and withholds its defining equation.**
`LinearMap.BilinForm.exteriorPower` is exactly the composite used here, and its body does unfold
downstream; what does not cross the module boundary is the lemma that says what the form *does* on
two wedges, `LinearMap.BilinForm.bilinForm_ιMulti_ιMulti`, which carries no `public` in a module
with no `public section`. Anyone reaching for the definition has to re-prove it — one line, but that
line is the whole content — so the proof here writes the composite out through
`exteriorPower.pairingDual` and `exteriorPower.map` instead. A one-word Mathlib fix, worth
reporting; until it lands, no statement here should be phrased in terms of
`BilinForm.exteriorPower`.

⚠ **The two archimedean specializations are one theorem, and neither is analytic.**
`det (A Aᵀ) = ∑ₛ (det Aₛ)²` holds over **any commutative ring** — no order, no rank hypothesis —
and the complex case is the same statement over a commutative **star** ring,
`det (A Aᴴ) = ∑ₛ (det Aₛ) · star (det Aₛ)`; only the display `∑ₛ |det Aₛ|²` needs `RCLike`. So the
milestone's "state both" is one theorem instantiated twice, not two proofs, and the real place is
not a separate case at all: at an infinite place `v` of a number field the single statement
`NumberField.InfinitePlace.det_map_embedding_mul_conjTranspose_self` — that `∑ₛ v(det Aₛ)²`, the
quantity Layer 0.1 raises to the power `mult v / 2`, is the Gram determinant of the rows read
through `v.embedding` — covers real and complex places together, because at a real place the
conjugate transpose *is* the transpose. That identity, not the two ring-level ones, is what 4.3 and
5.3 consume, and the milestone should name it.

⚠ **The identity comes with a criterion for full row rank that the milestone does not mention and
Layer 5 needs.** Over an ordered field the sum of squares makes `det (A Aᵀ) = 0` equivalent to
linear dependence of the rows and `0 < det (A Aᵀ)` equivalent to independence — the **Gram
criterion**, a third form of full row rank beside 3.3's two (`A.rank = m`, `plucker m A.row ≠ 0`).
It is what makes `√|det (A Aᵀ)|` nonzero in the Bombieri–Vaaler bound, so 5.2 and 5.3 want it
stated here. ⚠ And `A Aᵀ`, not `Aᵀ A`: the second is `n × n` and singular whenever `m < n`, hence
identically `0` on the matrices of interest. The roadmap says so at 5.2; it is cheap to refute here
and is one of the worked examples below.

⚠ **The generalized Hadamard inequality is a second theorem, not a corollary, and it needs
machinery Mathlib does not have.** It is a file of its own here,
`ArithmeticHeights/Hadamard.lean` beside `CauchyBinet.lean`, of comparable size to the whole of the
identity's file and sharing with it only the identity. Mathlib has **neither Hadamard's inequality
nor Fischer's**, and also none of the three things a textbook proof of Fischer runs through —
determinant monotonicity on the positive semidefinite order (`0 ≼ S ≼ G ⇒ det S ≤ det G`, which the
Schur-complement route needs), a block Laplace expansion of a maximal minor, and the exterior power
of a contraction. ⚠ What replaces the
missing monotonicity is **Cauchy–Binet over a doubled column index**, and it is the one idea in the
milestone: if `V` and `W` have orthogonal row spaces then `V Vᵀ + W Wᵀ` is the Gram matrix of the
single matrix `Matrix.fromCols V W`, whose maximal minors on the first copy of the columns are
exactly those of `V`, so `det (V Vᵀ) ≤ det (V Vᵀ + W Wᵀ)` because a sum of squares only grows when
terms are added. With that, the rest is classical: project the second block orthogonally to the
first — a row operation of determinant `1`, so no Gram determinant changes — the Gram matrix becomes
block diagonal and its determinant factors, and the projected block has the smaller Gram
determinant. Everything is over an arbitrary ordered field; nothing analytic is used anywhere.
⚠ The doubled index has to be `ι ⊕ₗ ι`, the *lexicographic* sum: Mathlib's `ι ⊕ ι` carries the
componentwise order, which is not linear, and Layer 3.1's `plucker` needs a linear order on the
column type to say which minor a set of columns names. Supplying one as a local `letI` does **not**
work — instance search reaches `Sum.instPreorderSum` before it goes through a local
`LinearOrder (ι ⊕ ι)`, so `StrictMono Sum.inl` silently acquires the wrong `Preorder`.

⚠ **`H_u(A) ≤ H_u(A₁) · H_u(A₂)` is a statement about one archimedean place, and the rest of it is
5.5's own work.** What is proved here is the determinantal inequality
`det (A Aᵀ) ≤ det (A₁ A₁ᵀ) · det (A₂ A₂ᵀ)` — which, by the identity above, *is* the ℓ² local factor
at an archimedean place, and is Bombieri–Gubler's Fischer inequality (Remark 2.8.9) and Schmidt's
§2 Lemma 2 verbatim. Two further things the milestone's `H_u` notation hides are not one line each.
At a **finite** place `H_v` is the sup norm of the minors, and for two blocks the inequality there
needs the block Laplace expansion Mathlib lacks; only the **fully split** case — one row per block —
reduces to the Leibniz formula plus the ultrametric inequality. And the **global** statement 5.5
actually quotes, `H_Ar^row(A) ≤ ∏ₘ H_Ar(A_m)`, is a product over all places of local bounds, which
is assembly work in Layer 5. ⚠ Since 5.5 needs only the fully split form, it is proved here too:
`Matrix.det_mul_transpose_self_le_prod`, **Hadamard's inequality** `det (A Aᵀ) ≤ ∏ᵢ ‖Aᵢ‖²`, by
induction on the number of rows from the two-block form. The milestone should name it: it is the
statement 5.5 imports, it is strictly weaker than the two-block one, and it is also missing from
Mathlib.

⚠ **It is not quite the statement 5.5 imports: 5.5 needs the Hermitian one, and 3.4 gained it
when 5.5 landed.** An infinite place of a number field, real or complex, presents the archimedean
local factor as `det (σA (σA)ᴴ)` with the *conjugate* transpose, and the inequality above lives in
an ordered field. `Matrix.sum_sq_norm_plucker_row_le_prod` is the Hermitian form,
`∑ₛ ‖det Bₛ‖² ≤ ∏ᵢ ‖Bᵢ‖²` over `ℂ`; it is **deduced** from the real one by realification and not
proved again, which costs one block-determinant identity and no new idea. See the ⚠ at 5.5 for
why doubling the columns alone is not enough. Only the fully split form is stated over `ℂ`:
nothing in the roadmap needs a two-block Hermitian Fischer inequality.

⚠ **3.4 needs 3.3 only for the spelling.** The mathematics runs on 3.1's `exteriorPower.plucker`
alone; the `submatrix`-and-`Finset.orderEmbOfFin` form of the statements, and the transport of a
minor along an order embedding of the column index that `Hadamard.lean` needs, are what the import
of Layer 3.3 buys. Nothing in 3.4 mentions a height, a subspace or a field except where an order is
needed, so a reader looking for the dependency structure should see 3.1 → 3.4, with 3.3 supplying
vocabulary.

**3.5 Duality** (Schmidt 1967, §1, equations (2) and (4) — the original; Bombieri–Gubler,
Proposition 2.8.10; the underlying linear algebra is Hindry–Silverman, Exercise A.1.11(c), which
identifies `W` as the orthogonal complement of `ker δ'(w)`). Schmidt's mechanism is the sharpest
statement of the route: the involution `τ` on Grassmann coordinates that **reverses the index order
and attaches a sign** satisfies `S^{⊥*} = τ(S*)`, so duality holds for any distance function
invariant under that signed reversal — which both the sup norm and the ℓ² norm are, so the theorem
holds in both normalizations of Layer 0 and needs no separate proof for each.
`Submodule.mulHeight V = Submodule.mulHeight V.dualAnnihilator`, the annihilator transported back to
`ι → K` along the standard basis. Equivalently (Corollary 2.8.12): the height of a subspace equals
the height of any matrix cutting it out, `mulHeight (ker A) = mulHeight (rowSpace A)`. Route: the
complementation isomorphism `⋀^k V ≅ ⋀^n V ⊗ ⋀^{n−k} V*` carries canonical basis vectors to
canonical basis vectors up to sign, so the two coordinate tuples agree up to a signed reindexing,
and `Height.mulHeight_comp_equiv` with `Height.mulHeight_neg` finishes it. State the
orthogonal-complement corollary for the standard bilinear form alongside.

⚠ **The milestone's equation does not typecheck as written.** `Submodule.mulHeight V =
Submodule.mulHeight V.dualAnnihilator` compares a height of a subspace of `ι → K` with a height of
a subspace of `Module.Dual K (ι → K)`, where no height is defined; the identification along the
standard basis is part of the statement and not a remark about it. Mathlib's name for that
identification is `Module.piEquiv ι K K`, whose value at `x` is the functional `v ↦ v ⬝ᵥ x`, so the
statement is `(V.dualAnnihilator.comap (Module.piEquiv ι K K).toLinearMap).mulHeight = V.mulHeight`.
`Submodule.comap_piEquiv_dualAnnihilator_eq_map` is the `map`-along-the-inverse spelling that
`Roadmap/Suggested.lean` pinned, and `Submodule.mem_comap_piEquiv_dualAnnihilator` is the
orthogonal-complement reading the milestone asks for, stated where it belongs — as a membership
criterion, `x` lying in the transported annihilator exactly when `v ⬝ᵥ x = 0` for every `v ∈ V`.

⚠ **The orthogonal complement is the wrong object to prove the theorem with, and the natural proof
is false.** Over a field that is not formally real a subspace can meet its own orthogonal
complement: over `ℂ` the line spanned by `(1, i)` is isotropic, `1 · 1 + i · i = 0`, hence *is* its
own orthogonal complement. So the square matrix obtained by stacking a basis of `V` on a basis of
`V^⊥` — the object every classical proof expands — is singular, and with it die both the route
through the generalized Laplace expansion of that determinant and the route through the equality
case of Cauchy–Schwarz (`det (M Mᵀ) = det (A Aᵀ) det (B Bᵀ)` with `M` the stack). The proof has to
run through a **complement**, which always exists (`Submodule.exists_isCompl`), and reach the
annihilator through the dual basis; the complement is not the annihilator and is never confused
with it. ⚠ Machine-checked at 3.5, both halves: the isotropic line over `ℂ` lies in its own
transported annihilator, and over `ℚ` the line spanned by `(1, 3)` has height `3` while the
complement spanned by `(0, 1)` has height `1`, so a duality theorem stated for complements is
false.

⚠ **No exterior algebra, no Laplace expansion, no Jacobi identity.** Layer 3.4 already recorded
that Mathlib has no block Laplace expansion; it has no Jacobi identity for the complementary minors
of an inverse either, and those are the two classical routes to duality. Neither is needed. Let the
rows of `C` be a basis of `ι → K` whose first block is a basis of `V`, and the rows of `D` the dual
basis read back in `ι → K`, so that `C Dᵀ = 1`. For a set `s` of `k` columns, multiply `C` by the
matrix whose first `k` columns are the standard basis vectors at `s` and whose remaining columns
are the second block of `Dᵀ`: the product is block triangular with the `s`-minor of `V`'s basis in
one corner and an identity in the other, while the second factor, read through the enumeration of
`ι` that lists `s` and then its complement, is block triangular with the complementary minor of the
annihilator's basis in one corner. Two applications of `Matrix.det_fromBlocks_zero₁₂` and
`Matrix.det_fromBlocks_zero₂₁`, one `Matrix.det_mul` and one `Matrix.submatrix_mul_equiv` give the
identity, and the factor that appears depends on `s` only through a permutation sign
(`Matrix.det_permute'`). Thirty lines, over an arbitrary commutative ring. Mathlib meanwhile
acquired `ExteriorAlgebra.basis_mul_of_disjoint` — `e_S ∧ e_T = ± e_{S ∪ T}` on the basis of the
exterior algebra — which would make the block Laplace expansion cheap; it is still not enough for
duality, which needs the annihilator's wedge to be decomposable, so the elementary route is the
shorter one and not merely the available one.

⚠ **What was actually missing was about heights, not about determinants.** The sign in Schmidt's
involution `τ` depends on the index, so what the theorem needs is that a height does not see a
*per-coordinate* change of sign. Mathlib has `Height.mulHeight_comp_equiv` for a reindexing and
`Height.mulHeight_smul_eq_mulHeight` for a scalar, and nothing for signs;
`Height.mulHeight_neg`, which the milestone's route names, **does not exist**, and a global sign
would not suffice if it did. `Height.mulHeight_eq_of_forall_eq_or_eq_neg` and its Arakelov and
absolute companions are proved here and belong upstream — the first is about Mathlib's own
`Height.mulHeight` and is four lines once the junk value is handled.

⚠ **"Needs no separate proof for each normalization" is true of the mechanism, not of the Lean
proof.** Schmidt's point — that duality holds for any distance function invariant under the signed
reversal — is what makes the *coordinate* statement `Submodule.exists_plucker_eq_plucker_compl` the
whole mathematical content, and it is proved once. But each normalization still needs its own
τ-invariance lemma, so the layer carries three of those; after them each of the six height
theorems is four rewrites. ⚠ The shape did **not** repeat in 3.6, where the normalizations are not
interchangeable at all: the inequality is true for the ℓ² height and false for the sup-norm one, so
there are three theorems to state there and not six.

⚠ **3.5 does not need 3.4.** `Duality.lean` imports Layer 3.3 and nothing later: Cauchy–Binet
plays no part in the proof. The dependency is 3.1 → 3.2 → 3.3 → 3.5, with 3.4 a sibling. The one
place the two meet is the worked example, where Cauchy–Binet computes the number that duality then
transports.

⚠ **Corollary 2.8.12 carries no hypothesis at all.** `mulHeight (ker A) = mulHeight (rowSpace A)`
holds for every matrix `A`, of any rank, with any row index type — `Fin m` is not needed, since the
statement never enumerates the rows. The kernel is the orthogonal complement of the row space
whatever the rank, so Layer 5 may use it before it knows the rank of the matrix it is handed. As
landed, neither 5.4 nor 5.5 carries a rank hypothesis at all: 5.5's rank enters only as the
*exponent* `rank A` of its bound, never as a hypothesis on the two sides of 2.8.12.

**3.6 Submodularity** (Bombieri–Gubler, Theorem 2.8.13; Schmidt, and independently Struppeck–Vaaler)
— **landed**. `h_Ar(V + W) + h_Ar(V ∩ W) ≤ h_Ar(V) + h_Ar(W)`: the height is submodular on the
subspace lattice. Bombieri–Gubler state it without proof and do not use it; it is nonetheless the
structural theorem about subspace heights. With it come the two corollaries it has together
with `1 ≤ H`: `H(V ⊓ W) ≤ H(V) · H(W)` and `H(V ⊔ W) ≤ H(V) · H(W)`. ⚠ Subspace heights are **not
monotone under inclusion**, and no statement bounding `H(W)` by `H(V)` for `W ≤ V` is to be made:
in `ℚ²`, `H(⊤) = 1` while the line spanned by `![1, N]` has height `N`. In particular the basis
vectors of a subspace are not bounded by its height; Layer 5 bounds the vectors it produces
through the successive minima, never through the height of the space they span.

⚠ **The sup-norm height is not submodular, and the normalization is part of the statement.**
The inequality above is stated for `h_Ar` and it is **false** for `Submodule.mulHeight`, the
sup-norm height everything else in this library defaults to. The lines `ℚ · (1, 1, 1)` and
`ℚ · (1, -1, 0)` in `ℚ³` have sup-norm height `1` each, they meet in `0`, and they span a plane of
sup-norm height `2` — the height of the line `ℚ · (1, 1, -2)` it annihilates, which Corollary
2.8.12 of 3.5 reads off the same matrix. So `H(V + W) · H(V ∩ W) = 2 > 1 = H(V) · H(W)`, which
refutes the submodularity and the product bound for the sum at once; transporting the same pair
through the duality theorem turns the two lines into two planes of height `1` whose intersection
has height `2`, which refutes the product bound for the intersection. All of it is machine-checked
at 3.6, and the three milestones are stated and proved for `Submodule.arakelovMulHeight`. In the
ℓ² normalization the same pair gives an *equality*: the two rows are orthogonal, so the Gram
determinant is `6 = 3 · 2`, and the inequality is sharp there as well as true.

⚠ **The archimedean half is Koteljanskii's inequality, which is 3.4's Fischer inequality with a
common first block of rows.** Cutting the rows into three blocks, `det (M Mᵀ) · det (A Aᵀ) ≤
det ((A;B) (A;B)ᵀ) · det ((A;C) (A;C)ᵀ)`; the case of an empty first block is exactly 3.4. It is
proved at 3.6 over an ordered field and over `ℝ` or `ℂ`, and transported to an infinite place
through Cauchy–Binet as `∑ₛ v(pₛ)²` — so the *archimedean local factor* of the Arakelov height of
a subspace is submodular, unconditionally. The textbook derivation from Fischer's inequality runs
through the Schur complement and the monotonicity of the determinant on the positive semidefinite
order, neither of which Mathlib has; the geometric route 3.4 already uses — project the other
blocks orthogonally to the first, which is a row operation of determinant `1` — costs forty lines
and needs nothing new.

⚠ **The complex places need a Hermitian companion of 3.4, and it is not a specialization.** `ℂ` is
not an ordered field, so Fischer's inequality over an ordered field says nothing at a complex
place; the Hermitian form is a parallel development in which the sum of squares of the minors
becomes a sum of `p · star p`. It costs little — `open scoped ComplexOrder` supplies
`RCLike.toIsStrictOrderedRing`, after which every step of the ordered proof runs verbatim — but it
is a second proof, and it lives in the 3.6 file because 3.6 is what first needs it.

⚠ **The finite places are settled by local normalization, and the argument has nothing in common
with the archimedean one.** For the Gauss norms `‖p(·)‖ᵥ = maxₛ |det(·)ₛ|ᵥ` at a finite place there
is no orthogonal projection, so the archimedean proof does not transfer. What replaces it is not
another determinant identity but a *reduction to submultiplicativity*. Normalize the common block:
take a set of columns `s₀` where `‖p(A)‖ᵥ` is attained and replace `A` by `(A_{s₀})⁻¹ A`. Cramer's
rule writes every entry of the result as a ratio of a `p × p` minor of `A` to the maximal one, so
the normalized family is integral, its minor on `s₀` is the identity, and its Plücker norm is
exactly `1`. ⚠ **This is the `Oᵥ`-basis of the saturated lattice `U ∩ Oᵥⁿ`, obtained without any
lattice theory** — no Smith normal form, no saturation argument, nothing from
`Basis.SmithNormalForm` or the Dedekind-domain localizations. Then reduce the other two blocks
modulo `A`, a row operation that changes no Plücker coordinate of the stacks, so that their
`s₀`-columns vanish, and the whole inequality collapses to

`‖p(A;B;C)‖ ≤ ‖p(A)‖ ‖p(B;C)‖ = ‖p(B;C)‖ ≤ ‖p(B)‖ ‖p(C)‖ ≤ ‖p(A;B)‖ ‖p(A;C)‖`,

the last step because with `A`'s minor on `s₀` the identity and `B` vanishing there, the minor of
`(A;B)` on `s₀ ∪ t` is block triangular and *equals* the minor of `B` on `t`. Submultiplicativity
itself is where the nonarchimedean hypothesis enters, and it enters once: normalize both families
the same way, and the stack is integral, so every minor of it lies in `Oᵥ` by the **Leibniz
formula** and the ultrametric inequality for a finite sum. ⚠ **No Laplace expansion along a block
of rows is needed** — worth stating because 3.5 recorded that Mathlib has none.

⚠ **The second route reaches the same submultiplicativity and stops there.** The
Grassmann–Plücker comultiplication `p(B;C)_s = ∑ ε · p(B)_t · p(C)_{t'}` — the multiplication table
of the exterior algebra in the Plücker basis, and, read as a statement about determinants, the
**Laplace expansion along a block of rows** — is proved at 3.6 too, in its own file, and gives
`‖p(B;C)‖ᵥ ≤ ‖p(B)‖ᵥ ‖p(C)‖ᵥ` in three lines from the ultrametric inequality. ⚠ **But it does not
give the submodular inequality**, and the reason is worth recording: the identity the milestone
would need is the one with a *shared* first block, `p(A;B;C) ⊗ p(A) = ± ∑ p(A;B) ⊗ p(A;C)`, whose
left side is quadratic in `A` and therefore not the coordinate of any single wedge product — no
bilinear expansion reaches it. It does follow from the two-block expansion together with the
**exchange relation** (the expansion sum vanishes when the stacked family is dependent), by an
induction on the rows of `C` in which the terms that do not match cancel in blocks; the sign
bookkeeping of that induction is the part not done, and the normalization route makes it
unnecessary. ⚠ At an archimedean place the same identity gives the inequality only up to the
binomial number of terms, so the second route would not have replaced Koteljanskii either.

⚠ **The reduction is a lattice fact, not a basis-extension fact.** The four subspaces have to be
spanned by appendings of *one* triple of families before any place-by-place comparison can start,
and the cheap way to get there is not to extend a basis of `V ⊓ W` inside `V` and inside `W` —
which means building bases inside submodules of submodules — but to take a complement `C` of
`V ⊓ W` in the whole space and cut with it: `C ⊓ V` and `C ⊓ W` are independent because both lie
in `C`, and the modular law gives `(V ⊓ W) ⊔ (C ⊓ V) = V`. That is
`Submodule.exists_append_span_eq`, proved at 3.6 for an arbitrary field. ⚠ The appending is
`Fin.append` and not `Matrix.fromRows`: `exteriorPower.plucker` indexes a family by `Fin k`, so the
sum-typed stack of 3.4 has to be reindexed through `finSumFinEquiv` before it has Plücker
coordinates at all. The Gram determinant does not see the reindexing, which is what makes the
conversion free.

⚠ **3.6 is the first milestone in Layer 3 that needs two others.** It consumes 3.4 (Fischer, for
the archimedean inequality) and 3.5 (Corollary 2.8.12, for the refutation), so the branch
`3.1 → 3.2 → 3.3 → 3.5` and the branch through 3.4 rejoin here.

**3.7 Northcott for subspaces** — **landed**. Over a number field,
`{V : Submodule K (ι → K) | finrank K V = k ∧ mulHeight V ≤ B}` is finite, and the
`Northcott` instance behind it, immediate from 3.1's injectivity and Layer 1.1. The proof is the
statement read backwards: the Plücker map is injective on subspaces of rank `k`
(`Submodule.pluckerPoint_injective`) and the height of a subspace *is* the height of its Plücker
point (`Submodule.mulHeight_eq_mulHeight_pluckerPoint`), so the set is the image of a preimage of
`Projectivization.finite_setOfPred_mulHeight_le`. Nothing else enters, and in particular 3.3–3.6
do not: 3.7 sits directly on 3.1, 3.2 and 1.1.

⚠ **The rank condition is not needed, and dropping it is what produces an instance.** A subspace
of `ι → K` has rank at most `Fintype.card ι`, so `{V | mulHeight V ≤ B}` is a union of finitely
many of the sets above and is itself finite: `Submodule.finite_setOf_mulHeight_le`. The milestone's
rank-fixed form is the lemma, the rank-free form the theorem, and the rank-free form is what the
`Northcott` typeclass wants, since `Northcott h` quantifies over the whole domain of `h`. The two
cannot be merged into one induction on the rank — the Plücker points of subspaces of different
ranks live in *different* projective spaces, indexed by `Set.powersetCard ι k` — which is why the
finite union is the argument and not a convenience.

⚠ **This is the exact place where Layer 1.1's refutation stops applying.** 1.1 records that there
is no `Northcott` instance for `Height.mulHeight` on `ι → K`: the whole line `Kˣ • x` sits at one
height, so a bounded-height set of *tuples* is infinite. For subspaces that objection evaporates,
because the offending line is a single subspace. `Submodule.mulHeight` is projective by
construction, and the ambient dimension caps the rank, so the subspace height has the Northcott
property on its full domain with no normalization and no quotient — the one height in this
development of which that is true.

⚠ **Six instances, not one**, because `Northcott` is a property of the height and not of the space:
sup-norm, Arakelov and absolute, multiplicative and logarithmic. Only the first is proved; the
other five are free. The logarithmic ones follow by `Northcott.comp_of_bddAbove` along `Real.log`,
exactly as Mathlib deduces `Northcott (Height.logHeight₁)`. The Arakelov one follows from
`mulHeight V ≤ arakelovMulHeight V` — a bound with **no constant**, so a set of bounded Arakelov
height is literally a subset of one of bounded height — and the absolute one from
`absMulHeight V = mulHeight V ^ (1 / [K : ℚ])`, a bound `B` on which is the bound `B ^ [K : ℚ]` on
the relative height. No second Plücker argument anywhere.

⚠ **0.2's comparison was missing on projective space, and 3.2's was missing entirely.** The
Arakelov instance needs `mulHeight ≤ arakelovMulHeight` for a *subspace*, and the chain from the
tuple statement was not there: 0.2 proved the two comparisons for tuples and stopped. Both now
descend — `Projectivization.mulHeight_le_arakelovMulHeight` and
`Projectivization.arakelovMulHeight_le_mulHeight` in `Arakelov.lean`, then
`Submodule.mulHeight_le_arakelovMulHeight` in `Subspace.lean`. The descent is free, since both
heights are computed on any representative. ⚠ The reverse comparison for a subspace is *not*
stated: its constant is `(#ι choose k) ^ (totalWeight K / 2)` — the number of Plücker coordinates,
not the dimension of the ambient space — and Northcott needs only the direction that has no
constant at all.

⚠ **The instance form is the deliverable, not the finiteness statement.** What consumes it is
`Northcott.exists_min_image`: a nonempty set of subspaces contains one of least height. That is the
form later layers want — a minimal-height subspace with a prescribed property exists as soon as one
subspace with that property does — and it is unavailable from the finiteness statement alone.

### Layer 4: successive minima, Minkowski's second theorem, extraction, and cube slicing

Minkowski's convex-body theorem is Mathlib's; the second theorem is not, and Bombieri–Vaaler needs
it, together with two lemmas that convert its real-lattice output into number-field statements:
the extraction lemma (4.4) and the cube-slicing theorem (4.5). The reduced fundamental system of
6.3 needs it too, together with the lemma that turns the minima into a lattice basis (4.6).
Everything in this layer is stated
against Mathlib's `ZLattice`, `ZLattice.covolume` and `mixedEmbedding`, with the ambient measure a
Haar measure (`[IsAddHaarMeasure (volume : Measure E)]`), which is the hypothesis every covolume
statement in Mathlib carries.

**4.1 Successive minima** (Cassels, Ch. VIII §1) — **landed**. For a `ZLattice L` in a
finite-dimensional real normed space `E` of dimension `n` and a symmetric convex body `B` —
**compact**, convex, symmetric, with nonempty interior — `ZLattice.successiveMinimum L B i` is the
infimum of `t > 0` such that `t • B` contains `i + 1` linearly independent points of `L`. For
`i ≥ n` no such family exists and the value is `sInf ∅ = 0`, so every statement about the minima
carries `i < n`. It is attained — Cassels' Lemma 1 of that section, the existence of independent
lattice vectors realizing the minima, which every later proof consumes — and positive, monotone in
`i`, and homogeneous of degree `−1` in `B`; and `successiveMinimum L B 0` is the quantity bounded
by Minkowski's first theorem, so Mathlib's
`exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure` is the `i = 0` case. The file is
`ArithmeticHeights/SuccessiveMinima.lean`, and it imports **nothing** from this roadmap: like 3.1
and 0.5 it is claimable before anything else exists.

⚠ Cassels indexes the minima by a **distance function** `F`, taking `𝒮 = {x | F x ≤ 1}` and dilating
that, rather than by a convex body and `t • B`. The two are the same thing and Mathlib's `gauge` is
the translation, since the gauge of a symmetric convex body with `0` in its interior is exactly such
an `F`. **The convex-body form above is the pinned one**, because it is what Mathlib's first theorem
is already stated in; prove the `gauge` correspondence once, as its own lemma, so the book's
statements transfer without re-deriving anything. ⚠ Done, as `gauge_le_iff_mem_smul`, and it is
the *only* statement of the layer that needs the body to be closed — see the next paragraph.

⚠ **Compactness is two hypotheses, and they are used in two different places.** Boundedness is what
makes the minima positive and what makes every gauge slice of the lattice finite, which is the whole
of the attainment argument; closedness is used nowhere in it. The delivered statements therefore
carry `Bornology.IsBounded B` and `IsClosed B` separately, as Layer 4.6's suggested signature
already did, and each says which it uses. `IsCompact B` appears exactly once, in the corollary of
Minkowski's first theorem, because that is the form Mathlib's theorem is stated in.

⚠ **Attainment does not need the body to be closed; only its body form does.** The proof produces
`gauge B (v j) = λ j` for one independent family of lattice vectors, and that statement holds for
any bounded symmetric convex body with nonempty interior
(`ZLattice.exists_linearIndependent_gauge_eq_successiveMinimum`). Turning it into
`v j ∈ λ j • B` is exactly the gauge dictionary, and exactly what fails for an open body: for the
open unit ball **no** lattice vector lies in `λ 0 • B` at all, since anything in that dilation
would exhibit a strictly smaller admissible one. The two statements are therefore kept apart, and
only `ZLattice.exists_linearIndependent_mem_smul_successiveMinimum` carries `IsClosed B`. This is
the shape 4.2 and 4.6 should consume, and the gauge form is the sharp one to prove things from.

⚠ **The minima are not a monotone function of the index.** Monotonicity holds below the dimension
and fails at it: above `n` there is no independent family, the set of admissible dilations is
empty, and the value is the junk `sInf ∅ = 0`, while every value below `n` is positive. So
`Monotone (successiveMinimum L B)` is false whenever `E` is nontrivial — it is machine-checked
false — and `successiveMinimum_le_of_le` carries `j < n` for that reason. A statement of 4.2 whose
product ranged over any `Finset` larger than `Finset.range n` would be multiplying by zero.

⚠ **A measure does enter 4.1, in exactly one statement.** `Suggested.lean` said that none did. It
does not enter the definition, and the identification of `λ 0` as the least dilation containing a
nonzero lattice point — `ZLattice.successiveMinimum_zero_eq` — is measure-free; but the bound
itself is a statement about `ZLattice.covolume`, and `ZLattice.successiveMinimum_zero_le_one` is
the one place in the layer where a measure and a `BorelSpace` instance appear. The split is worth
keeping: the measure-free identity is what says the definition is the right one, and the bound is
Minkowski's theorem, not part of the definition's theory.

⚠ **The greedy construction is the proof, and the induction has to carry it.** The realizing family
cannot be assembled index by index from the definition: knowing `gauge B (v j) = λ j` for each `j`
separately gives no comparison between `v j` and a vector chosen later, and the argument needs the
gauges to increase along the family. What makes them increase is that each vector minimizes the
gauge over the lattice *outside the span of its predecessors*, a shrinking constraint — so the
induction hypothesis carries that minimality clause, and the family is built by one greedy
recursion rather than by `n` independent choices. Minimality is also the whole of the other half:
"some member of an independent family of `i + 1` vectors lies outside the span of the first `i`"
gives `gauge B (v i) ≤ λ i` by a rank count and nothing else.

⚠ **The other half of Cassels' Lemma 1 is not obvious, and it is now proved.** Cassels states with
the lemma that a lattice point of gauge `< λ_i` is linearly dependent on `a₁, …, a_{i−1}`, and says
"the truth of the lemma is now obvious". It does not follow from minimality index by index: if `y`
is a lattice point outside the span of the first `i` realizing vectors, the family
`v₀, …, v_{i−1}, y` bounds `λ_i` by the largest gauge in it, which is `max (λ_{i−1}, gauge y)` —
and when `λ_{i−1} = λ_i`, which nothing forbids, that reads `λ_i ≤ λ_i` and contradicts nothing.
The repair is an induction on `i`: such a `y` is outside the *smaller* span too, so
`λ_{i−1} ≤ gauge y` by the inductive hypothesis, the maximum is `gauge y`, and `λ_i ≤ gauge y`
follows. That is `ZLattice.successiveMinimum_le_gauge_of_notMem_span`, and its contrapositive
`ZLattice.mem_span_of_gauge_lt_successiveMinimum` is the input to Cassels' Lemma 2 at 4.2 — and,
as it turned out, the *only* input 4.2's upper bound takes from the flag. Like
attainment it needs no closedness: only strict gauge inequalities enter, so
`mem_smul_of_gauge_lt` suffices throughout.

**4.2 Minkowski's second theorem** (Cassels, Ch. VIII §4, Theorem V) — **landed, both halves**.
With `n = finrank ℝ E` and `B` as in 4.1,

```text
(2ⁿ / n!) · covolume L  ≤  (∏ i < n, λ i) · vol B  ≤  2ⁿ · covolume L.
```

The left-hand inequality is `ZLattice.covolume_le_prod_successiveMinimum_mul_measure` in
`ArithmeticHeights/MinkowskiSecond.lean`; the right-hand one — the substantial half, the one Layer
5 and 6.3 consume — is `ZLattice.prod_successiveMinimum_mul_measure_le` in the same file. Landed
beside them is `ZLattice.pow_successiveMinimum_zero_mul_measure_le`, the upper bound with
`∏ i < n, λ i` weakened to `λ 0 ^ n`, which is all the *first* theorem gives. Neither inequality
needs the body closed or compact: both carry only convex, symmetric, bounded, nonempty interior —
the four hypotheses 4.1's attainment carries.

⚠ **The citation was off by three theorems.** Minkowski's second theorem is Cassels' Chapter VIII
§4 **Theorem V** — the inequalities (12) and (13) of VIII.1 — and its kernel is his Theorem IV, a
measure estimate in the quotient `ℛ/Λ`. Chapter VIII **Theorem II** is a different theorem with a
different constant: the Rogers–Chabauty bound `λ₁ ⋯ λₙ ≤ 2^{(n−1)/2} δ(F) d(Λ)` for a general
distance function, in which `δ(F)` is a critical determinant and no volume appears. Chapter VIII
**Theorem I** is the sphere case `d(Λ) ≤ λ₁ ⋯ λₙ ≤ δ(F₀) d(Λ)`, also through the critical
determinant, so it is contained in neither Theorem II nor Theorem V. What Cassels does say is that
§2's treatment of spheres "forms the model for what follows" — and the Hadamard argument there is
the model for the *lower* bound, `d(Λ) ≤ λ₁ ⋯ λₙ`. For the upper bound he follows **Weyl (1942)**
and remarks that the proof "remains difficult"; Davenport (1939) is the other simplification.

⚠ **The lower bound does not follow from the first theorem.** What the first theorem applied to a
scaled body gives is `λ 0 ^ n · vol B ≤ 2ⁿ · covolume L`, Cassels' (11) — a weakening of the
*upper* bound, the product replaced by its smallest factor to the `n`-th power, not the lower one.
That is `ZLattice.pow_successiveMinimum_zero_mul_measure_le`, and its proof is 4.1's homogeneity:
apply `successiveMinimum_zero_le_one` to `c • B` with `c` the `n`-th root of
`2ⁿ · covolume L / vol B`, and read off `λ 0 ≤ c`.

⚠ **The lower bound is the cross-polytope, and it needs neither closedness nor compactness.**
Divide the vectors realizing the minima by their minima: `gauge B (v i / λ i) = 1`, so every
combination `∑ cᵢ · (vᵢ / λᵢ)` with `∑ |cᵢ| < 1` has gauge `< 1` and lies in `B` by
`mem_smul_of_gauge_lt` — the half of 4.1's gauge dictionary that holds for any body. That
cross-polytope has volume `2ⁿ / n!` times the fundamental domain of the `vᵢ / λᵢ`, whose
determinant is the determinant of the `vᵢ` divided by `∏ λᵢ`; and the determinant of the `vᵢ` is
an integer multiple of the covolume of `L`, because they are lattice vectors. So the body carries
exactly the four hypotheses 4.1's attainment carries — convex, symmetric, bounded, nonempty
interior — and no more. The volume `2ⁿ / n!` is Mathlib's `ℓ¹` unit ball, from
`MeasureTheory.volume_sum_rpow_lt_one` at `p = 1`.

⚠ **The reduction that would make the upper bound easy is false, and this is machine-checked.**
The linear map with determinant `∏ λᵢ` is the one scaling the `i`-th coordinate, in the basis of
the realizing vectors, by `λᵢ`; if it mapped `B` into `B` the upper bound would be Blichfeldt's
lemma and nothing more. There is no reason it should, and in general it does not: a symmetric
convex body can contain a point and fail to contain the point with one coordinate shrunk towards
zero, even when the shrinking factors increase with the index, as the minima's do — and
`ArithmeticHeights/MinkowskiSecond.lean` ends with the witness: the parallelogram `|x| ≤ 1`,
`|19x − 20y| ≤ 1` in `ℝ²` contains `(1, 19/20)` and not `(9/10, 19/20)`. The upper bound is
therefore not the statement that some one set is a packing, and no rescaling of the body makes it
one. This is also why "the compression argument along a basis realizing the minima" is not a
description of a proof: there is no compression that stays inside the body.

⚠ **How the upper bound goes.** Weyl's argument, carried by Cassels' Theorem IV, replaces the
inclusion by a measure estimate. With `S(t)` the image of `t · B` in `ℛ/Λ`: `m{S(t)} = tⁿ · vol B`
for `t ≤ λ₀/2`, because the body then injects into the quotient; and
`m{S(s t)} ≥ s^{n−J} · m{S(t)}` whenever `λ_{J−1}/2 ≤ t ≤ s t ≤ λ_J/2`, because in that range
congruence mod `Λ` inside `t · B` is congruence mod `Λ ∩ span (v₀, …, v_{J−1})`, and translating
the first `J` coordinates by a fixed vector is injective modulo that sublattice. Chaining from
`t = λ₀/2` up to `t = λ_{n−1}/2` gives `2^{−n} · (∏ λᵢ) · vol B ≤ m{S(λ_{n−1}/2)} ≤ covolume L`.
The estimate is `ZLattice.pow_mul_measure_inter_add_le` of
`ArithmeticHeights/QuotientFubini.lean` — Cassels' Theorem IV in one step, assembled there from
the Fubini decomposition `ZLattice.measure_inter_add_prod_eq_lintegral`, the descent
`ZLattice.measure_inter_add_eq_of_separated` and the scaling
`ZLattice.measure_inter_add_prod_smul_le`. The chain is the proof of
`ZLattice.prod_successiveMinimum_mul_measure_le`, and the telescoping identity it runs on is
`λ₀ⁿ · ∏_{J=1}^{n−1} (λ_J/λ_{J−1})^{n−J} = ∏_i λ_i`. See the four ⚠ after the next two.

⚠ **Cassels' Lemma 2 is a lattice fact, and it is his Chapter I, Theorem I.** The proof of Chapter
VIII's Lemma 2 is one line from Lemma 1 and "Theorem I of Chapter I", which is part B of that
theorem: given a basis `a₁, …, aₙ` of a sublattice `Λ ⊆ M`, there is a basis `b₁, …, bₙ` of `M`
with `a_i = ∑_{j ≤ i} v_{ij} b_j` and `v_{ii} ≠ 0`. No minimum, gauge or convex body enters — it
says that a lattice has a basis triangular against any given independent family, equivalently that
the part of `L` in the span of the first `j` members of the family is spanned **over `ℤ`** by the
first `j` basis vectors. That equivalence is the content: the `ℝ`-statement is a flag of
subspaces, the `ℤ`-statement is what makes a lattice point an integer combination, and the second
follows from the first only because the `b_i` are a basis of the whole lattice. The Lean statement
carries both, and `ArithmeticHeights/AdaptedBasis.lean` imports nothing from this roadmap.

⚠ **The proof used is not Cassels'.** He argues by a Hermite-normal-form descent, choosing at each
index the point of the sublattice whose leading coefficient is smallest in absolute value. The
construction here instead observes that `L ∩ span ℝ (v₀, …, v_{j−1})` is *saturated* in
`L ∩ span ℝ (v₀, …, v_j)` — a nonzero multiple of a lattice point lies in an `ℝ`-subspace only if
the point does — so the quotient of the one by the other is finitely generated and torsion-free,
hence free, and of rank `1` by rank–nullity; a generator of it extends the basis by a single
vector through Mathlib's `Basis.mkFinSnocOfLE`, and `n` steps reach `L`. All the analysis is in
one rank computation, `finrank ℤ (L ∩ W) = finrank ℝ W`, which is Mathlib's
`Real.finrank_eq_int_finrank_of_discrete`, and that is where discreteness is indispensable:
`ℤ + ℤ√2` has `ℤ`-rank `2` inside a line, its quotients are free of rank `> 1`, and no single
vector extends anything. `IsZLattice ℝ L` is *not* a hypothesis — the independent family already
spans `E`, so a lattice containing it spans `E` — and no measure, closedness or compactness enters
either.

⚠ **The Fubini decomposition is a statement about a fundamental domain, not about a measure.**
Once `F ×ˢ univ` is seen to be a fundamental domain for `Λ × 0` in `V × W` — which is
`ZLattice.isAddFundamentalDomain_prod_univ`, and is immediate — the decomposition itself is
`MeasureTheory.Measure.prod_apply_symm` and one set identity: the slice of `F ×ˢ univ ∩ (X + Λ×0)`
at `z ∈ W` is `F ∩ (X_z + Λ)`. That is the whole of Cassels' display (10) once his normalization
of the lattice to `ℤⁿ` is replaced by the product `V × W`, and the file does that normalization
intrinsically in `ZLattice.exists_isAddFundamentalDomain_measure_smul_le`, which builds the slab
from a complement of `span ℝ Λ`. The content of Cassels' (10) is therefore not Fubini at all; it
is the *other* half, the next ⚠.

⚠ **The step with content is the descent, and Cassels gets it free from coordinates.** His (10)
reads off `m{S(t)}` — a measure in `ℛ/Λ` — as an integral of measures in `ℛ_J/Λ_J`, and the
reason it may is that inside `t · B` congruence modulo the whole lattice *is* congruence modulo
the sublattice: his (7) and (8) together imply (6). In coordinates that is a remark about which
coordinates vanish. Coordinate-free it is a theorem, `ZLattice.measure_inter_add_eq_of_separated`,
and the proof is to exhibit a third fundamental domain: `(𝓕_Λ ∩ (A + Λ)) ∪ (𝓕_L ∖ (A + L))` is a
fundamental domain for `L`, so it has the measure of `𝓕_L`, and subtracting the second piece from
both sides gives the two quotient measures equal. **That subtraction is the only place a
finiteness hypothesis enters the file** — `μ 𝓕_L ≠ ⊤`, i.e. the covolume is finite. Nothing else
in the layer's measure theory needs the body closed, bounded or compact.

⚠ **The scaling step is not a change of variables, and no map of the space realizes it.** Cassels'
(12) compares `S_J(t, z)` with `S_J(st, sz)` by translating the first `J` coordinates by
`(s − 1) y₀`, where `y₀` is a point of *that slice* — so the translation depends on `z`. There is
no single map of `V × W` carrying `t · B` into `st · B` in this way; what makes the comparison
legitimate is that the quotient measure of a slice modulo `Λ` is unchanged by translation, which
is `IsAddFundamentalDomain.measure_set_eq` applied to a translated fundamental domain. This is the
same phenomenon as the machine-checked counterexample above: there is no compression that stays
inside the body, and the estimate survives only because it is taken one slice at a time. It is
also why the factor is `s^{n−J}` and not `s^n`: the `J` directions inside the span contribute
nothing, because in them the dilation has been traded for a translation.

⚠ **`IsZLattice` is not a hypothesis anywhere in the file, and countability had to be proved.**
The product statements take a fundamental domain as the hypothesis `∀ x, ∃! v : Λ, ↑v + x ∈ F`
rather than construct one, so they hold for an arbitrary *countable* `ℤ`-submodule; discreteness is
needed only where the slab is built. But Mathlib's countability instance for a lattice,
`ZLattice.instCountable_of_discrete_submodule`, assumes the lattice has full rank, and the lattices
this layer needs — `L ∩ span (v₀, …, v_{J−1})` — do not. `ZLattice.countable_of_discreteTopology`
supplies the general case, by the observation that a discrete submodule is a `ZLattice` in its own
span; the same observation is what produces the slab, and it is worth stating once.

⚠ **The chain runs on the open dilates, and that is what removed the last hypothesis.** Because
`t · B` for a *closed* `B` contains points of gauge exactly `t`, congruence mod `Λ` inside it is
congruence mod the sublattice only for `2t < λ_J` strictly — and the chain needs it at `2t = λ_J`.
On `{gauge B < t}` — Cassels' own `t𝒴`, which is open — it holds there, because
`gauge(x − y) ≤ gauge x + gauge y < 2t`. The roadmap flagged the choice between the open dilates
and a limit at the endpoints as the layer's last open question; the open form is the one taken,
and the null-set comparison it costs is one line, since a convex set has null frontier
(`Convex.addHaar_frontier`) and therefore `μ (interior B) = μ B`. The upper bound consequently
carries no closedness and no compactness — the same four hypotheses as 4.1's attainment.

⚠ **Cassels' Lemma 2 is not on the path, and this was not expected.** The roadmap named two pieces
as missing from Mathlib, the adapted `ℤ`-basis and the quotient measure, and said the upper bound
needed both. It needs only the second. The adapted basis is how Cassels sees, *in coordinates*,
that the translation of the `J`-th step stays inside `Λ ∩ span (v₀, …, v_{J−1})`: he wants the
first `J` coordinates of a short lattice point to be integers. Coordinate-free that sublattice is
simply `L ⊓ (span ℝ (v₀, …, v_{J−1})).restrictScalars ℤ`, membership in it is the dependence half
of Cassels' Lemma 1 (`ZLattice.mem_span_of_gauge_lt_successiveMinimum`) and nothing else, and the
only further thing the estimate wants is its `ℤ`-rank — which is the `ℝ`-dimension of its span, by
`ZLattice.finrank_int_eq_finrank_real`. Even the rank is wanted only as an *upper* bound `≤ J`,
since the exponent `s^{n−J}` is decreasing in the rank and `s ≥ 1`, so the flag equality that
`ZLattice.exists_basis_adapted` delivers is not used either. Cassels' Lemma 2 stays a milestone
because Layer 4.6 consumes it; it is not a prerequisite of 4.2.

⚠ **The `J = 0` step is the descent, not a separate argument.** The base of the chain —
`m{S(λ₀/2)} = (λ₀/2)ⁿ · vol B`, that below the first minimum the body injects into the quotient —
is `ZLattice.measure_inter_add_eq_of_separated` with `Λ = ⊥`, whose fundamental domain is the
whole space. Nothing about Minkowski's first theorem enters the upper bound.

**4.3 The number-field lattice** (Schmidt 1967, §3, Theorem 1) — **landed, both cases**.
The specialization Layer 5 uses: for a subspace `V ⊆ Kⁿ` of dimension `k`, the image of
`V ∩ (𝓞 K)ⁿ` under `NumberField.mixedEmbedding` is a `ZLattice` of rank `d k` in the
`d k`-dimensional real carrier `V ⊗ ℝ`, and — with the measure normalized as
Mathlib's `volume_fundamentalDomain_latticeBasis` normalizes it, `ℂ ≅ ℝ²`, so that `𝓞 K` itself
has covolume `2^{−r₂} √|discr K|` — its covolume is

```text
covol (V ∩ (𝓞 K)ⁿ)  =  2^{−r₂ k} · |discr K|^{k/2} · H_Ar(V)^d,
```

with `H_Ar` the absolute Arakelov subspace height of Layers 0 and 3, so the last factor is the
*relative* Arakelov height.

⚠ **The `ℚ` case is landed**, as `Submodule.covolume_intLattice` in
`ArithmeticHeights/RationalLattice.lean`: over `ℚ` the degree, the discriminant and the number of
complex places are `1`, `1` and `0`, every constant in the display disappears, and what is left is
`covolume (V ∩ ℤⁿ) = H_Ar V` — the bare statement that a covolume *is* an Arakelov height. The
lattice is `Submodule.intLattice`, the integral points read inside `Submodule.realSpan`, the real
span of `V` in `EuclideanSpace ℝ ι`; `Submodule.finrank_realSpan` and the `IsZLattice` instance
say it is a lattice of the right rank.
⚠ **The number-field case is landed too** — Schmidt's Theorem 1 proper — as
`Submodule.covolume_mixedLattice` in `ArithmeticHeights/NumberFieldLattice.lean`, in the form

```text
covol (V ∩ (𝓞 K)ⁱ)  =  (2^{−r₂} · |discr K|^{1/2})^k · H_Ar(V),
```

with `H_Ar` the height *relative* to `K`, so that the absolute height of the display above enters
with the exponent `d`. Writing the first factor as the covolume of `𝓞 K` itself raised to `k`,
rather than as `2^{−r₂ k} |discr K|^{k/2}`, is what keeps the constant out of the proof: it is
Mathlib's `NumberField.mixedEmbedding.covolume_integerLattice` and is never recomputed. The
ambient is `PiLp 2 (fun _ : ι ↦ euclidean.mixedSpace K)`, the lattice is
`Submodule.mixedLattice`, its real carrier is `Submodule.mixedSpan`, and
`Submodule.finrank_mixedSpan` gives the rank, `d · k`.

This is not a formula to be derived here: it is **Schmidt 1967, §3, Theorem 1**, and in exactly the
normalization above. Schmidt's `ρ` is already the `(Re, Im)` embedding, his `Δ = 2^{−r₂} √|𝔡|`, and
his `H` already the Euclidean-`F` Grassmann height, so his `H'(S) = Δ^{−d} · d(ρ(I(S)))` and
`H'(S) = H(S)` are the display above verbatim. Thunder 1992 (Theorem 2) restates it in a
conjugate-pairs embedding, which is why no `2^{−r₂}` appears there, and Fukshansky 2006 ((17))
quotes it back in Schmidt's embedding with an absolute height. Cite Schmidt at the milestone: the
identity has a single point of truth in the literature too. His own warm-up computation
(`S = Kⁿ ⇒ d(Λ) = Δⁿ`, hence `H' = 1 = H`) is worth carrying as the degenerate acceptance check
beside the worked examples below, since it pins the `2^{−r₂}` and the discriminant power at once.

Over `ℚ` it says that a saturated lattice has covolume the euclidean norm of its primitive Plücker
vector, and that is how it was proved: both sides are computed against the same sum of squares of
maximal minors. ⚠ **Both halves of Schmidt's proof survive over `ℚ`, and both are one line each.**
The archimedean half is `ZLattice.covolume_sq_eq_det_gram` — the squared covolume of a lattice in
an inner product space is the Gram determinant of any `ℤ`-basis — composed with Cauchy–Binet
(3.4), which turns that determinant into `∑ₛ pₛ²` for `p` the tuple of maximal minors. The finite
half is that `p` is *primitive*, so the finite places contribute `1` and the height is `√(∑ₛ pₛ²)`
as well. There is no `N(𝔞)` to cancel over `ℚ` because both occurrences of it are `1`; what
remains of Schmidt's Lemmas 5–6 is exactly the primitivity.
⚠ **Primitivity needs no adapted basis, no Smith normal form and no splitting of the quotient**,
which is worth recording because all three are the obvious routes. If a prime `q` divided every
maximal minor then the reductions of the basis vectors would be dependent over `ZMod q` — this is
`exteriorPower.plucker_eq_zero_iff` of Layer 3.1 read over a finite field, and it is the only
place a Plücker coordinate is used as anything but a number — so some integral combination with a
coefficient prime to `q` would be divisible by `q`; its quotient by `q` is an integral point of
`V`, hence a `ℤ`-combination of the basis by saturation, and independence forces `q` to divide
every coefficient. That is `Submodule.gcd_plucker_eq_one`, and it is the only place saturation is
spent.
⚠ **Saturation is the content of the milestone, not a convenience.** For a finite-index sublattice
of `V ∩ ℤⁿ` the covolume is larger by the index while the height does not move — the Plücker
coordinates are multiplied by the index and the finite places give it back. A proof that took any
`ℤ`-basis of any full-rank sublattice would therefore be false, and the `ℚ` case already shows
where the hypothesis has to enter.
⚠ **Mathlib already carried the ambient the number-field case needs.**
`NumberField.mixedEmbedding.euclidean.mixedSpace K` is the mixed space as an *inner product*
space, with `euclidean.toMixed` a measure-preserving equivalence to the usual one and
`euclidean.integerLattice` the image of `𝓞 K`; so the `K` statement can be made in
`PiLp 2 (fun _ : ι ↦ euclidean.mixedSpace K)` with `Submodule.realSpan` and
`Submodule.intLattice` generalizing verbatim, and Mathlib's `covolume_integerLattice`
— `2⁻¹ ^ r₂ · √|discr K|` — is the degenerate case `V = K¹` of the display above, which pins the
normalization before any of Schmidt's work is done. That is where `Submodule.mixedSpan` and
`Submodule.mixedLattice` live, and `Submodule.mixedLattice_eq_span` is what makes them a
`ZLattice`; the setting was never the cost.
⚠ **The route recorded here was wrong, and usefully so: the Steinitz pseudo-basis *is* the route,
and Schmidt's Lemmas 5–6 are never needed.** This paragraph used to prescribe following Schmidt —
fix any `K`-independent `y₁, …, y_k ∈ V ∩ (𝓞 K)ⁿ`, work with the **free** sublattice
`Λ₀ = 𝓞_K y₁ + ⋯ + 𝓞_K y_k`, and pay for its index with his Lemmas 5–6, `[σ(Λ) : Λ₀] = N(𝔞)`,
reduced prime by prime to a counting lemma over the completions `𝓞_𝔭` — on the ground that his
route never decomposes the module and never meets the class group, a Steinitz pseudo-basis
`Λ ≅ ⊕ 𝔞_l y_l` being ruled out by name. But a pseudo-basis does not meet the class group either:
the decomposition is an existence statement about one module, no ideal class is ever named, and the
index never has to be computed because it never appears. Writing
`Λ = V ∩ (𝓞 K)ⁿ = 𝔞₁ y₁ ⊕ ⋯ ⊕ 𝔞_k y_k`, the archimedean computation runs on `y` alone and the
ideals leave exactly one factor, `N(𝔞₁ ⋯ 𝔞_k)`, which is what the finite places of the Plücker
point of `y` give back. **What the landed proof takes from Schmidt's §3 is Lemma 4 and nothing
else**; his counting lemma, whose statement and induction this paragraph used to carry in full, is
no part of 4.3 and has been dropped with the route it belonged to.
⚠ **A pseudo-basis needs invertibility and nothing else — in particular no `Module.Projective`.**
`Submodule.exists_pseudoBasis` in `ArithmeticHeights/PseudoBasis.lean` builds it over an arbitrary
Dedekind domain by induction on the rank, with no structure theorem: take a coordinate functional
`f` not vanishing on `M`, let `𝔞 = f '' M` — a fractional ideal, finitely generated because `M`
is — and split it off by hand from an explicit dual basis `∑ⱼ aⱼ bⱼ = 1` with `aⱼ ∈ 𝔞`,
`bⱼ ∈ 𝔞⁻¹`, which is `𝔞 𝔞⁻¹ = 1` unwound and no more: `y := ∑ⱼ bⱼ • mⱼ` has `f y = 1` and
`𝔞 • y ⊆ M`, so `M = 𝔞 y ⊕ (M ∩ ker f)`. `Submodule.exists_pseudoBasis_mem` then normalizes,
scaling `yᵢ` by some `a ∈ 𝔞ᵢ` and `𝔞ᵢ` by `a⁻¹` so that every `yᵢ` lies in `M` itself; that is
what makes the Plücker coordinates integral, and the finite half below spends it.

- *Archimedean* (his Lemma 4), landed as `NumberField.mixedEmbedding.norm_det_gram`:
  `N_{ℝ}(det (Y Yᴴ)) = ∏_w (∑ₛ w(pₛ)²)^{mult w}`, for `Y` the matrix of `y` over `K` and `p` its
  Plücker point. ⚠ **It is one Cauchy–Binet over a commutative star ring — no decomposition by
  place, no Lagrange expansion in blocks of `d` rows, no real-versus-complex adjoint
  bookkeeping.** The mixed space is a commutative ring with involution, so
  `Matrix.det_mul_conjTranspose_self_eq_sum` of 3.4 applies to it verbatim and gives
  `det (Y Yᴴ) = ∑ₛ pₛ · star pₛ`; `exteriorPower.plucker_map` identifies that `p` with the mixed
  embedding of the Plücker point over `K`; and `Algebra.norm ℝ` descends the identity to `ℝ`
  through `LinearMap.det_restrictScalars`. Evaluating that norm as
  `∏_{w real} z_w · ∏_{w complex} |z_w|²` is `Algebra.norm_prod` and `Algebra.norm_pi` of
  `ArithmeticHeights/NormProd.lean`, two general lemmas Mathlib does not have.
  ⚠ **The `2^{−r₂}` does not enter here at all**, which is the reverse of what this paragraph
  used to predict. There is no `(Re, Im)` change of variables in the proof: the Gram determinant
  is taken in Mathlib's *euclidean* mixed space, where that constant is already paid, and it
  reaches the statement only through `covolume_integerLattice`, applied once per `𝔞ᵢ` via
  `NumberField.exists_idealBasis`. The one place a Lean proof can still get the constant wrong is
  the display itself, not a computation inside it.
- *Finite*, landed as `Submodule.prod_mul_plucker_eq_one`, which replaces both of Schmidt's
  Lemmas 5–6: `N(𝔞₁ ⋯ 𝔞_k)` times the finite part of the height of `p` is `1` — the primitivity of
  `p` against `∏ᵢ 𝔞ᵢ`, the exact analogue of `gcd p = 1` over `ℚ`. ⚠ **It needs no localization,
  no uniformizer and no counting.** If `(∏ᵢ 𝔞ᵢ) · (p)` were contained in a maximal `𝔮`, pick
  `aᵢ ∈ 𝔞ᵢ ∖ 𝔮 𝔞ᵢ`; every maximal minor of `(aᵢ yᵢ)` lies in `𝔮`, so the reductions are dependent
  over the residue field — `exteriorPower.plucker_eq_zero_iff` of 3.1 over a finite field, exactly
  as over `ℚ` — and the resulting `u = ∑ᵢ cᵢ aᵢ yᵢ` has every coordinate in `𝔮`. Saturation gives
  `t • u ∈ Λ` for every `t ∈ 𝔮⁻¹`, and reading coefficients against the pseudo-basis turns that
  into `cᵢ aᵢ ∈ 𝔮 𝔞ᵢ`, hence `cᵢ ∈ 𝔮` for every `i`, contradicting the choice of the `aᵢ`. The
  only property of `𝔮` used is `𝔮 𝔮⁻¹ = 1`. Turning the ideal statement into a height statement is
  `NumberField.FinitePlace.finprod_iSup_eq_inv_absNorm` of
  `ArithmeticHeights/FinitePlaceIdeal.lean` — `∏_v (⨆ i, v (xᵢ)) = N(span x)⁻¹` for a tuple of
  algebraic integers, not all zero — the finite half of the product formula in the shape a height
  wants, and also not in Mathlib.

⚠ **Saturation is again the only place the hypothesis is spent**, exactly as over `ℚ`; and
non-freeness is now met rather than avoided, so the `ℚ(√−5)` example below is a regression test on
`exists_pseudoBasis` rather than on the assembly.
⚠ **The instance search, not the mathematics, is what this layer costs in Lean.**
`PiLp 2 (fun _ : ι ↦ euclidean.mixedSpace K)` is deep enough that `BorelSpace`,
`FiniteDimensional`, `MeasureSpace` and `IsAddHaarMeasure` on it and on `Submodule.mixedSpan`
exhaust the default `synthInstance.maxHeartbeats` at every use site, with a whole-declaration
timeout downstream as the symptom. Since `set_option` is forbidden in library source, each is
declared once as a named instance — and stated with `[Finite ι]` plus `Fintype.ofFinite` inside,
the environment linter rejecting a `[Fintype ι]` the statement does not use.

This is the computation that converts a lattice statement into a height statement, and
it is where the `|D_{K/ℚ}|^{(N−M)/(2d)}` of 5.3 and 5.4 is produced; it is a named milestone so
that constant has a single point of truth, and the worked examples below pin each of its three
factors.

**4.4 The extraction lemma** — **landed**. The bridge from 4.2's real independence to Layer 5's
`K`-bases, and pure linear algebra. If `u 1, …, u i ∈ Kⁿ` have `ℝ`-linearly independent images under the mixed
embedding, their `K`-span has dimension at least `i / d`: the embedding is `ℚ`-linear, and a
`K`-space of dimension `m` is a `ℚ`-space of dimension `d · m`. State it for an arbitrary tower —
`F ⊆ K` finite of degree `d`, a `K`-vector space, an `F`-linear map into a vector space over a
third field `E ⊇ F`, images independent over `E` — so the statement carries no number theory.
Prove with it the greedy selection it exists for: from `d · k` such vectors, `k` of them that are
`K`-linearly independent, the `j`-th chosen **among the first `d (j − 1) + 1`** — a member of the
family, never a linear combination, because a chosen lattice vector keeps the norm bound it
arrived with and a combination does not. Applied to independent vectors realizing the minima
`λ 1 ≤ ⋯ ≤ λ (d k)` of 4.2, monotonicity gives `λ_{d(j−1)+1} ^ d ≤ ∏_{r=1}^{d} λ_{d(j−1)+r}`, so
the product of the selected vectors' relative heights is bounded by `∏ i, λ i`, the full product
4.2 bounds, with no loss. This is the step Bombieri–Vaaler perform adelically: every known proof
of the second theorem needs, for a lattice and a sublattice, bases in which one is triangular
over the other, which over `(𝓞_K)^N` requires `𝓞_K` to be a principal ideal domain (their §I.3).
The lemma replaces the triangularization, and is what entitles the route below to the basis
statements 5.2 Theorem 2, 5.3 and 5.4 at their exact constants with no adelic input. The three
statements are the counting lemma in the arbitrary-tower form above, the greedy selection under
arbitrary index bounds, and the packaged corollary giving `k` from `d · k` with the `j`-th index at
most `d · j`; all three are general linear algebra with no number theory in them, and a sorry-free
proof of each exists (see *[Provenance](#provenance)*). What settles the shape of the roadmap's
route is that the adelic proofs need triangularization because their successive minima count
vectors independent **over `K`** (Bombieri–Gubler's Definition C.2.9 is explicit about this), which
a real convex body cannot see; 4.4 is precisely the price of that difference, and it is a page of
linear algebra.

⚠ **All three statements are landed**, in `ArithmeticHeights/Extraction.lean`:
`LinearIndependent.fintype_card_le_finrank_mul_finrank_span` (the counting half),
`exists_linearIndependent_comp_of_lt_finrank_span` (greedy selection under arbitrary index bounds)
and `LinearIndependent.exists_linearIndependent_comp_finrank_mul` (the packaged corollary), in the
arbitrary-tower form above. "A page of linear algebra" was the right price: a hundred lines of
proof, and the file imports three Mathlib linear-algebra files and nothing else — not one
`ArithmeticHeights` module, and no number theory of any kind.

⚠ **Only the middle statement carries an induction, and it is a statement about one field.**
`exists_linearIndependent_comp_of_lt_finrank_span` mentions neither `F` nor `E` nor `f`: it says
that if the vectors of `u : Fin n → V` indexed up to `m j` span more than `j` dimensions over `K`
for each `j < k`, then `k` of them are independent with `(s j).val ≤ m j`. The tower enters only in
the corollary, where `m j = d · j` and the hypothesis is discharged by the counting half applied to
the first `d · j + 1` vectors. The bound function `m` need not be monotone, which costs nothing and
is what makes the induction step — extend by one index, choosing a vector outside the span of what
is already selected — go through on `m ∘ Fin.castSucc` unchanged.

⚠ **The counting half needs nothing of `f` but `F`-linearity.** No injectivity, no finiteness of
`V` or of `W`, no relation between `K` and `E` beyond both containing `F`; `FiniteDimensional F K`
is the only finiteness hypothesis in the file. That the mixed embedding is injective — the fact
4.3 leans on — is *not* used here, and stating the milestone for an arbitrary `F`-linear map is
therefore free rather than a generalisation to be paid for. The proof is one dimension count: an
`F`-basis `b` of `S = span K (range u)` has `finrank F S = d · finrank K S` members by
`Module.finrank_mul_finrank`, their images span `f '' S` over `E` because `F`-scalars act through
`E` by the tower, and that `E`-span must accommodate the `#ι` independent vectors `f (u i)`.

⚠ **State the count multiplicatively, not as a division.** `#ι ≤ d · finrank K (span K (range u))`
rather than `finrank K (span K (range u)) ≥ #ι / d`: the corollary finishes by contradiction with
`omega`, which reads the multiplicative form directly and would have to be helped past the natural
division in the other.

⚠ **Layer 5.3 is 4.4's first consumer, and it uses the corollary exactly as priced.** Over `ℤ`
(5.2) the extraction was vacuous: `d = 1`, and the minima vectors were already the basis. Over a
number field the corollary is applied with `F = ℚ`, `E = ℝ` and `f` the mixed embedding made
`ℚ`-linear by `AddMonoidHom.toRatLinearMap` — the map is `ℤ`-linear by construction, and a
`ℚ`-linear structure on an additive group is unique, so the passage costs nothing. The
monotonicity step `λ_{dj}^d ≤ ∏_{r<d} λ_{dj+r}` is an induction on `k` in
`ArithmeticHeights/BombieriVaalerField.lean`, and it is where the "with no loss" of the paragraph
above is discharged.

**4.5 Cube slicing** (Vaaler 1979; Bombieri–Gubler, Appendix C.3) — **landed, all of it**. For a
linear subspace
`V ⊆ ℝⁿ` of dimension `k`, the central slice of the cube satisfies
`vol_k (V ∩ [−1, 1]ⁿ) ≥ 2^k`, with equality on coordinate subspaces, so the bound is sharp. This
is the archimedean volume bound behind the sharp constants of Layer 5 — Bombieri–Vaaler's own proof
quotes it, so it is a cost of the theorem, not of this route.

**Take Bombieri–Gubler's actual statement, which is more general at no cost.** Their Theorem C.3.8
is the *product-of-balls* inequality: for any partition `n = n₁ + ⋯ + n_r` and
`Q = B_{ρ(n₁)} × ⋯ × B_{ρ(n_r)}` a product of balls **each of volume 1**, every central slice
satisfies `vol (Q ∩ V) ≥ 1`. The cube is the case `n_i ≡ 1`; the archimedean bodies this roadmap
needs are the case `n_i = 1` at real places and `n_i = 2` at complex ones. The generality is free —
the induction on `r` has a base case (polar decomposition, then a per-ray convexity comparison
against the volume-1 ball) and a step (log-concavity of the marginal) that never use `n_i = 1` — so
state 4.5 in this form and the complex places are covered by the same theorem. Two corollaries are
stated alongside it, both targets: the **cube case**, blocks of size one rescaled to `[−1, 1]ᴺ`,
slice volume at least `2^k`, which is what 5.2 consumes — and does consume, through
`ZLattice.prod_successiveMinimum_cubeSlice_le_covolume`; and the **inscribed-cube bound at a
complex place**, that a `k`-dimensional complex subspace meets the unit polydisc of `ℂⁿ` in real
`2k`-volume at least `2^k`, because the polydisc contains the cube of half-side `1/√2` in
`ℝ^{2n}` and `(2/√2)^{2k} = 2^k`. The product-of-balls theorem gives `π^k` there instead, and the
factor `(π / 2)^{k r₂ / d}` between the two is exactly the gap between the two constants 5.4
states; the exact cancellation in the *Route* paragraph below is the acceptance check for the
inscribed-cube bound.

**Cost, priced from the source.** Bombieri–Gubler C.3 is a complete proof in five pages —
log-concave functions (C.3.1–2), the sup-convolution inequality (C.3.3), log-concavity of marginals
(C.3.4), the Gauss measure and its layer-cake representation (C.3.5),
`μ(A) ≤ vol (A ∩ Q)` by induction on the number of factors (C.3.7), and the theorem by an
`ε`-thickening of the subspace (C.3.8) — with **exactly one step imported**: C.3.3, which is
Prékopa 1973, Theorem 3. That theorem is itself a one-page induction on dimension off the
one-dimensional case, and Prékopa's own remark reduces the only case needed here (two functions,
both log-concave) to the `λ = ½` inequality of his 1971 paper by a dyadic argument he calls "very
easy". So the analytic ladder is four named rungs, not an open-ended development. What is genuinely
absent is Mathlib support: there is
no `LogConcave` predicate, no Prékopa–Leindler and no Brunn–Minkowski, so the milestone begins with
the definition. `Mathlib/MeasureTheory/Integral/Marginal.lean` (the `∫⋯∫⁻` API built for
Gagliardo–Nirenberg–Sobolev) is the right substrate for the induction over coordinates. ⚠ It is
not: the induction over coordinates is `Measure.prod` and `MeasurableEquiv.piEquivPiSubtypeProd`,
both of which already carry the measure-preserving statements the transport needs, and
`Marginal.lean` is never imported. The substrate the milestone actually turned out to want is
`Mathlib/MeasureTheory/Constructions/HaarToSphere.lean`, for the base case. One
formalization detail from Prékopa's own erratum: the sup-convolution is only *Lebesgue* measurable,
so state C.3.3 with a hypothesis `f x ^ λ * g y ^ μ ≤ r (λ • x + μ • y)` for a given measurable `r`
rather than defining `r` as a supremum. Vaaler's own proof runs through a peakedness comparison
for symmetric product measures (Kanter 1977); it proves the same theorem and is admissible, but
the milestone is priced against Bombieri–Gubler C.3.

**Route.** Bombieri–Gubler prove Siegel's lemma through the *adelic* Minkowski second theorem
(Theorem 2.9.13, from Appendix C.2.11), over `∏_v K_v` with normalized Haar measures. **This
roadmap pins the real route instead**: restriction of scalars along `mixedEmbedding` reduces to a
`ZLattice` in `ℝ^{dN}`, where 4.2 applies, 4.3 supplies the discriminant, 4.4 returns to `K`, and
4.5 supplies the archimedean volume. The constants close exactly: with `k = N − M`, the `2^{dk}`
of 4.2, the `2^{−r₂ k}` of 4.3 and the `2^{(r₁+r₂) k}` of 4.5's slice bounds — taking the
inscribed-cube reduction at complex places — cancel, which is the acceptance check that the
normalizations agree, and it is the check to run first, since a spare factor there means a
normalization is wrong upstream. Taking 4.5's product-of-balls bound directly instead replaces
`2^{(r₁+r₂) k}` by `2^{r₁ k} π^{r₂ k}` and leaves `(2/π)^{k r₂ / d}`, which is Bombieri–Vaaler's own
Theorem 8 constant; 5.4 states both. Each ingredient is classical and cited at its
milestone, but the assemblies in the literature are adelic (Bombieri–Vaaler; Bombieri–Gubler
§2.9) except over `ℚ` (Aliev–Henk §6); the assembly over `ℝ^{dN}`, with 4.4 in place of the
adelic triangularization, is this roadmap's, so the milestones above — not any single reference —
are the specification. The route keeps Layer 4 free of adelic Haar measure and stands on the
`ZLattice` and mixed-embedding substrate Mathlib already provides. A
contributor who prefers the adelic route must first build adelic Haar measure on
`NumberField.AdeleRing`, a substantially larger undertaking that nothing in this roadmap is
stated against.

⚠ **The acceptance check ran, and the cancellation held — in the other of the two forms.** With
5.4 landed on 2026-09-19 the constants close exactly as this paragraph predicted, but through the
product-of-balls bound rather than the inscribed-cube reduction: `2^{dk}` (4.2) against
`2^{−r₂k}` (4.3) and `2^{−r₁k} π^{−r₂k}` (the body, normalized to volume-one factors) leaves
`(2/π)^{k r₂}`, which is Bombieri–Vaaler's Theorem 8 constant, and the weaker constant follows
from it by `2/π < 1` in one line rather than by the inscribed cube. Over `ℚ` everything is `1`, as
in 5.2. No spare factor appeared anywhere, so the normalizations of Layers 0, 4.2, 4.3 and 4.5
agree.

⚠ **The whole of Appendix C.3 is landed**, in six files: `PrekopaLeindler.lean` (C.3.3 and the
one-dimensional Brunn–Minkowski inequality it rests on), `LogConcave.lean` (C.3.1, C.3.2, C.3.4),
`GaussMeasure.lean` (the Gauss density, its normalization, polar decomposition, and the radius
`ρ(n)` of the ball of volume one), `SliceBound.lean` (C.3.7's predicate `HasSliceBound`, its base
case and its induction step), `ProductOfBalls.lean` (C.3.7 for a product of balls) and
`CubeSlicing.lean` (C.3.8 and the two corollaries). The milestone's three statements are
`one_le_volume_inter_prodBall`, `two_pow_finrank_le_volume_inter_cube` and
`two_pow_le_volume_inter_polydisc`. None of the six files imports any number theory.

⚠ **The one step the roadmap priced as imported is the one that had to be proved from scratch, and
its cost is the Brunn–Minkowski inequality for sets.** Bombieri–Gubler cite Prékopa for C.3.3 and
prove everything else; not having the citation costs exactly the one-dimensional case, and that
case is `Real.volume_add_volume_le_volume_add` — `vol s + vol t ≤ vol (s + t)` on `ℝ`, which
**Mathlib has in no dimension** — applied to the level sets `{f > t}` and `{g > t}` once both
suprema are normalized to `1`, and then integrated in `t` by the layer cake. The compact case of
that inequality is two translates, by `sInf t` and by `sSup s`, which cover `s + t` and meet in a
single point; the measurable case is inner regularity. That is the entire geometric content of
C.3.3, and everything else in the file is bookkeeping around it.

⚠ **Prékopa–Leindler tensorizes, so the passage from one dimension to `n` is not an induction on
coordinates.** `HasPrekopaLeindler.prod` — the inequality for `μ` and for `ν` gives it for
`μ.prod ν` — is Tonelli's theorem and nothing else, and it mentions neither `ℝ` nor a dimension:
integrating out the second factor turns the hypothesis on `E × F` into the hypothesis on `E` for
the three marginals. With `HasPrekopaLeindler.of_measurePreserving` for transport along a
measure-preserving linear equivalence, `ℝⁿ` is then three lines off `ℝ` and
`EuclideanSpace ℝ (Fin n)` one more. This is why both files are written around a predicate on a
measure space rather than around a fixed `ℝⁿ`, and it is the one structural choice the milestone
forces.

⚠ **State the analytic rungs in `ℝ≥0∞` and every side condition disappears, the erratum's
included.** The roadmap already asked for the hypothesis form of C.3.3 — a given measurable
majorant `h` with `f x ^ a * g y ^ b ≤ h (a • x + b • y)`, in place of the sup-convolution whose
Lebesgue-but-not-Borel measurability Prékopa's erratum is about. Taking the *codomain* to be
`ℝ≥0∞` does the other half: `∫⁻` is defined for every measurable function, so no integrability
hypothesis appears anywhere, and Bombieri–Gubler's "if the integral is always finite" in C.3.4 is
simply absent from `LogConcave.setLIntegral_prod_right`, as is any hypothesis on the first factor
beyond its being a real vector space. It also makes `0 ^ a = 0` available for `a > 0`, which is
what makes the indicator of a convex set log-concave with no case analysis — the whole step from
C.3.3 to C.3.4.

⚠ **C.3.5 is not a rung; it is the layer cake.** Bombieri–Gubler call it an easy application of
Fubini's theorem, and in this formalization it is exactly
`MeasureTheory.lintegral_eq_lintegral_measure_ofReal_lt`, the layer cake formula for an
`ℝ≥0∞`-valued function — which Mathlib's `Layercake` file does not carry, stating everything for
real-valued functions instead — proved in `PrekopaLeindler.lean` because the one-dimensional
Prékopa–Leindler needs it for level sets that may have infinite measure. So the milestone's
remaining work is C.3.7 and C.3.8 alone, and the count of rungs is smaller than the numbering
suggests.

⚠ **The sphere appears exactly once, and the ray comparison needs no special function.** C.3.7's
base case is polar decomposition — Mathlib's `measurePreserving_homeomorphUnitSphereProd`, whose
only existing consumer is an integral formula for *radial* functions, so the `ℝ≥0∞` form is proved
here as `lintegral_eq_lintegral_sphere` — together with a per-ray dichotomy: a symmetric convex set
meets a ray in an interval, so either the ray's segment of the volume-one ball lies inside it or the
reverse. The first case needs the two radial integrals to be *equal*, and that is forced by the two
normalizations, both of total mass one, once the sphere measure — a positive finite constant —
cancels. **So `ρ(n)` is defined by the normalization it is used for** (`unitVolumeRadius`), no Gamma
function appears anywhere, and Remark C.3.6 is never used. The prediction recorded here before the
work is confirmed: C.3.6 is not needed.

⚠ **Closedness of the convex set is a hypothesis C.3.7 does not need, and dropping it is what makes
the induction step work.** Bombieri–Gubler state C.3.7 for a *closed* symmetric convex set, and
their induction step approximates the marginal `y ↦ vol (B ∩ A_y)` from above by step functions,
which needs the superlevel sets to be closed. The layer cake replaces that approximation — the
superlevel sets of a log-concave function are convex whether or not they are closed — and the
hypothesis then disappears from the statement. It has to: in the induction step the bound is applied
to superlevel sets of a marginal, whose closedness is an upper-semicontinuity question nobody wants
to answer.

⚠ **The induction step needs C.3.7 twice, once in each factor, because slices of a symmetric set are
not symmetric.** `A_y = {z | (y, z) ∈ A}` satisfies `A_{−y} = −A_y`, not `A_y = −A_y`, so the bound
cannot be applied slice by slice — and it is false for a non-symmetric convex set, as a small ball
far from the origin shows. Bombieri–Gubler's remedy, followed here as `HasSliceBound.lintegral_le`,
is to upgrade the bound from sets to *even log-concave functions* by the layer cake, and then apply
it once in each factor with the layer cake of the first density in between.

⚠ **Induct on the coordinates, not on the blocks.** Splitting off the block of one coordinate
leaves a smaller coordinate set with the *same* label set, one of whose blocks is now empty; and an
empty block imposes the condition `0 ≤ ρ(0)²`, which is vacuous. Inducting on the number of blocks
instead — the way the statement `N = n₁ + ⋯ + n_r` invites — renumbers the labels at every step and
buys nothing.

⚠ **C.3.8's `ε`-thickening needs no dominated convergence, because Brunn's principle is already in
hand.** Bombieri–Gubler take `ε → 0` in `vol(Q ∩ L_ε) / vol(B_ε)` by computing the limit of the
integrand and dominating it. That limit is avoidable: `z ↦ vol_V {y ∈ V | y + z ∈ Q}` on `V⊥` is
log-concave by C.3.4 and even because `Q` is symmetric, hence **bounded by its value at zero** —
which is exactly the slice volume being estimated. So the right-hand side is at most
`vol_V(Q ∩ V) · vol(B_ε)` with no limit at all, the left-hand side is at least
`exp(−πε²) · vol(B_ε)` because the Gauss density is, and what is left is the one-line limit
`exp(−πε²) → 1`. The three lemmas this rests on — `LogConcave.le_apply_zero`,
`Submodule.prodOrthogonalEquiv` and `lintegral_gaussDensity_eq_one` — are the whole of C.3.8.

⚠ **The complex-structure hypothesis of the polydisc corollary is unnecessary.** The statement
above asks for a real subspace closed under `J`, which is where it is applied; but the proof
inscribes the cube of half-side `2^{−1/2}` and gets `√2^k` from the cube case, and
`2^{⌊k/2⌋} ≤ √2^k` holds for every `k`, even or odd. So `two_pow_le_volume_inter_polydisc` is
stated without it, and the evenness of `dim V` never has to be proved.

⚠ **C.3.6 is not needed — checked, and confirmed.** Bombieri–Gubler record
`ρ(n) = π^{−1/2} Γ(n/2 + 1)^{1/n}` and the base case of C.3.7 appears to evaluate a Gamma integral
to use it. But the identity the ray comparison actually wants is only that the two radial
integrals above *agree*, and that follows from the two normalizations without computing either
side: polar decomposition writes the Gauss measure of `ℝⁿ` as `λ(Sⁿ⁻¹) · ∫₀^∞ e^{−πr²} r^{n−1} dr`
and the volume of `B_{ρ(n)}` as `λ(Sⁿ⁻¹) · ρ(n)ⁿ / n`, both are `1`, and the sphere measure — a
positive finite constant — cancels. So the only special function the milestone should need is the
Gaussian integral `∫_{ℝⁿ} e^{−π|x|²} dx = 1`, and `ρ(n)` can be introduced as
`(vol (ball 0 1))^{−1/n}` with no closed form at all. That is exactly how `unitVolumeRadius` is
defined, and the only closed-form ball volume the milestone ends up needing is `ω₁ = 2`, for the
cube corollary.

⚠ **4.5's consumer is 5.4, and it is the only one.** Recorded on 2026-09-19, when 5.4 landed: 5.2
uses the cube case over `ℚ`, 5.3 uses nothing of this milestone, and the *product-of-balls* form
is spent exactly once, for the polydisc at a complex place. What 5.4 needs is
`one_le_volume_prodBall_subtype` with blocks of size one at the real places and two at the complex
ones — that is, the general form, not either corollary. The two corollaries stated here have
turned out differently: `two_pow_finrank_le_volume_inter_cube` is 5.2's, and
`two_pow_le_volume_inter_polydisc`, the inscribed-cube bound, has **no consumer**, because the
weaker of 5.4's two constants follows from the sharper one by `2/π < 1` in one line. The
prediction above also held: `ω₁ = 2` and `ω₂ = π` — added to `CubeSlicing.lean` for 5.4's body —
are the only closed-form ball volumes anywhere in Layers 4.5, 5.3 and 5.4.

**4.6 A basis from the minima** (Cassels, p. 135, Lemma 8, as Bugeaud–Győry cite it) —
**landed, both forms**, in `ArithmeticHeights/MinimaBasis.lean`. With `L` and
`B` as in 4.1, `L` has a `ℤ`-basis `b 0, …, b (n − 1)` with
`b i ∈ (max 1 ((i + 1) / 2) · λ i) • B` for every `i < n`, `λ i = successiveMinimum L B i`. Against
4.2 this loses exactly `∏ i < n, max 1 ((i + 1) / 2) = n! / 2^{n−1}`, which is the `r! / 2^{r−1}`
in 6.3's constant. ⚠ The independent vectors that realize the minima (4.1) need not be a basis of
`L`, and 4.4 does not make them one: it selects vectors independent over a field and says nothing
about the index of the lattice they span. State the general form the proof gives, and the minima
form as its corollary: for any `ℝ`-independent `a 0, …, a (n − 1)` in `L` there is a basis with
`gauge B (b j) ≤ max (gauge B (a j)) (½ ∑_{i ≤ j} gauge B (a i))`. Route, by induction on `j`, with
`V_j` the real span of `a 0, …, a (j − 1)`: the quotient `(L ∩ V_{j+1}) / (L ∩ V_j)` is torsion-free
of rank one, so a basis `b 0, …, b (j − 1)` of `L ∩ V_j` extends by one vector `b` to a basis of
`L ∩ V_{j+1}`, and `a j = c • b + w` with `c` a nonzero integer and `w ∈ L ∩ V_j`. If `|c| = 1`,
take `b j = a j`. Otherwise write `b = c⁻¹ • a j + ∑_{i<j} t_i • a i` and subtract
`∑_{i<j} round t_i • a i`, an element of `L ∩ V_j`; what remains still extends the basis, and has
gauge at most `½ gauge B (a j) + ½ ∑_{i<j} gauge B (a i)`. The corollary follows from monotonicity of
the minima and the `gauge` correspondence of 4.1. This is lattice algebra with no measure in it.

⚠ **The route above is what the proof does, and the induction it runs on was already built for
4.2.** The flag `L ∩ V_j` is `ZLattice.flagPart L a j`, the rank-one step is
`ZLattice.exists_extending`, and both were the content of `AdaptedBasis.lean` — which is why the
note under 4.2, that the adapted basis "is still a milestone — Layer 4.6 wants it — but it is not
a prerequisite of 4.2", turns out to understate the relation: **4.6 *is* that induction, with a
choice made at each step.** Formally the extension vector `y` is free modulo `L ∩ V_j`
(`ZLattice.extending_congr`), and the whole of 4.6 is spending that freedom. Landing it therefore
cost a refactor of `AdaptedBasis.lean` — the flag and the step extracted from inside
`exists_basis_adapted` — and one new file of two theorems.

⚠ **The two cases are `|c| = 1` and `|c| ≥ 2`, and the maximum in the bound is not cosmetic.**
Neither branch dominates the other: at `j = 0` the sum bound is `λ 0 / 2`, *better* than
`gauge B (a 0) = λ 0`, and `|c| = 1` is exactly the case in which it is unavailable. Nor could a
sharper argument remove the `1` from `max 1 ((i + 1) / 2)`: at `i = 0` the bound `λ 0` is already
attained, since `b 0` is a nonzero lattice point and every nonzero lattice point has gauge at
least `λ 0`. So the `max` is forced at the bottom of the range, and `n! / 2^{n−1}` rather than
`n! / 2^n` is the honest constant.

⚠ **The sign is free, so one transfer lemma suffices.** In the case `|c| = 1` the roadmap's
"take `b j = a j`" is admissible, and so is `c · a j`; the delivered proof takes the latter,
because it differs from `y` by an element of `L ∩ V_j` with no sign to carry, and
`gauge B (c · a j) = gauge B (a j)` by symmetry of the body. That is the only place absolute —
rather than merely positive — homogeneity of the gauge is used for an integer scalar, and it is
used again for the rounding in the other case. ⚠ **Mathlib's `gauge_smul` does not cover it**: it
asks for a *balanced* body over an `RCLike` field, where symmetry of a convex body is what the
geometry of numbers actually carries. `gauge_smul_of_symmetric` is the missing two-line lemma.

⚠ **The general form needs no measure, no closedness, no boundedness — and no `IsZLattice`.** The
body enters only through subadditivity and absolute homogeneity of its gauge, so convexity,
symmetry and nonempty interior are the whole hypothesis. Closedness and boundedness re-enter only
in the minima corollary, the first to turn `gauge B x ≤ t` into `x ∈ t • B` and the second to make
the minima positive — which is the same split 4.1 records, and it is visible in the signatures:
`ZLattice.exists_basis_gauge_le` takes `hB₀ hB₁ hB₂`, and
`ZLattice.exists_basis_mem_smul_successiveMinimum` takes `hB₃ hB₄` on top. As in `AdaptedBasis`,
`IsZLattice ℝ L` is a consequence of the hypotheses on the family rather than an assumption.

### Layer 5: Siegel's lemma and Bombieri–Vaaler (the summit)

Every statement in this layer over a number field is in the **absolute** normalization on **both**
sides, matching the literature: absolute heights of the solutions on the left, and on the right the
absolute Arakelov height of the row space, the relative `H_Ar` of Layer 3 raised to `1/d`. An
absolute left side against a relative right side is off by the power `d` and is the standard slip;
the relative forms follow from Layer 0.4 by raising both sides to the `d`-th power.

**5.1 Classical Siegel, in height form** (Bombieri–Gubler, Lemma 2.9.1; Hindry–Silverman, Lemma
D.4.1 — the statement Mathlib's file is proved against, so its bound is already ours) — **landed,
with its number-field corollary**, in `ArithmeticHeights/Siegel.lean`. Restate
Mathlib's `Int.Matrix.exists_ne_zero_int_vec_norm_le` in this roadmap's vocabulary: for a nonzero
`M × N` integer matrix with `M < N`, a nonzero `x ∈ ℤᴺ` with `A x = 0` and
`max |x i| ≤ (N B)^{M/(N−M)}`, `B` a bound on the entries — proved *from* Mathlib's statement rather
than from scratch, with the sup-norm-to-height translation isolated as its own lemma. Record that
the exponent `M/(N−M)` is sharp. Bombieri–Gubler's Corollary 2.9.2 is the immediate number-field
version and belongs here.

⚠ **The route is what the file does, and the entry bound is the right hypothesis.**
`Int.Matrix.exists_ne_zero_mulVec_eq_zero_iSup_abs_le` takes `1 ≤ B` and `|A i j| ≤ B` in place of
Mathlib's matrix norm, which is what lets `max 1 ‖A‖` disappear from the bound; the hypothesis
costs nothing, since a nonzero integer matrix has an entry of absolute value at least `1`, and it
removes the need to carry `Matrix.seminormedAddCommGroup` — a *local* instance in Mathlib, not a
global one — into every downstream statement.
`Int.Matrix.exists_ne_zero_mulVec_eq_zero_mulHeight_le` is the same conclusion with
`Height.mulHeight` on the left.

⚠ **The height form is the sup-norm form, because the content can always be divided out.** The
translation is an identity, not an inequality: `Rat.gcd_mul_mulHeight_intCast` says
`gcd x · H(x) = max i, |x i|` for a nonzero integer tuple, so `H(x) ≤ max i, |x i|` with equality
exactly on primitive tuples. Since the primitive multiple of a kernel vector is again a kernel
vector, the height statement and the sup-norm statement are equivalent in strength, and the
restatement buys *vocabulary* rather than a sharper theorem — everything downstream of Layer 1 is
stated for `Height.mulHeight`, and a sup norm cannot be fed to it. What the height form does not
buy is invariance: the bound still moves under `A ↦ U A` for `U ∈ GL_M(ℤ)`, which fixes the
kernel, and supplying that invariance is the entire reason 5.2 exists — which it now does, as
`Int.Matrix.sqrt_det_div_minorGcd_unit_mul`.

⚠ **The exponent is sharp already at `N = M + 1`, and only the factor `N^{M/(N−M)}` is slack.**
`Int.Matrix.exists_forall_pow_le_iSup_abs` exhibits the `M × (M + 1)` system `B xᵢ = xᵢ₊₁`, whose
entries are `B`, `−1` and `0` and whose kernel is the line through `(1, B, B², …, B^M)`: every
nonzero integer solution has sup norm at least `B^M`, against the bound `((M + 1) B)^M`. Setting
`k` such blocks side by side gives a `kM × k(M + 1)` system with the same conclusion and exponent
`kM / k = M`, so the sharpness is not an artifact of a one-dimensional kernel. What is *not*
exhibited is a lower bound at a non-integer exponent; that is a counting statement, and the
witness family here is the one the literature quotes.

⚠ **The number-field corollary is a change of normalization on the left, and it costs no
constant.** Mathlib proves Siegel's lemma over a number field in the **house** normalization
(`NumberField.house.exists_ne_zero_int_vec_house_le`), bounding `house (ξ l)` for each coordinate.
For a tuple of algebraic integers every finite local factor of the height is at most `1` — the
finite part is the inverse norm of the ideal the coordinates generate, and that norm is a positive
integer — while each infinite place is the modulus of a conjugate and so is dominated by the
house; the infinite factors carry the weights `mult v`, which sum to `[K : ℚ]`, and that is
exactly the root Layer 0.4 takes. So `NumberField.absMulHeight_le_iSup_house` gives
`H_abs(ξ) ≤ max l, house (ξ l)` **with no degree factor**, and Mathlib's bound transfers verbatim.

⚠ **Mathlib's number-field constant is `private`, so the corollary must quantify over it.** `c₁ K`
of `Mathlib/NumberTheory/NumberField/House.lean` cannot be named outside that file, and neither
can the definitions it is built from. The delivered statement is therefore
`∃ C, ∀ p q A a, … → H_abs(ξ) ≤ C (C q A)^{p/(q−p)}` — which is also the shape Bombieri–Gubler's
Corollary 2.9.2 has — and the witness is supplied by unification against the theorem it is proved
from. Anyone who wants the constant explicit has to reprove the restriction-of-scalars estimate,
which is not what this milestone is for.

**5.2 Bombieri–Vaaler over `ℤ`** (Bombieri–Vaaler 1983, Theorems 1 and 2) — **landed, with the
invariance corollary and the height form**, in `ArithmeticHeights/BombieriVaaler.lean`. Two
statements, and the
second is the one Layer 5.3 generalizes. *Theorem 1, one vector:* for an `M × N` integer matrix of
rank `M < N`, a nonzero `x ∈ ℤᴺ` with `A x = 0` and
`max n, |x n| ≤ (D⁻¹ √|det (A Aᵀ)|)^{1/(N−M)}`, where `D` is the gcd of the `M × M` minors of `A`.
*Theorem 2, a basis:* under the same hypotheses there are `N − M` linearly independent integral
solutions `x₁, …, x_{N−M}` with `∏_l max n, |x_l n| ≤ D⁻¹ √|det (A Aᵀ)|`. Note `A Aᵀ`, the `M × M`
Gram matrix of the rows — not `Aᵀ A`, which is `N × N` and singular whenever `M < N`. The invariance
over 5.1 — the bound is unchanged by `A ↦ U A` for `U ∈ GL_M(ℤ)`, since `D⁻¹ √|det (A Aᵀ)|` is an
absolute height on the Grassmannian (Bombieri–Vaaler (2.5)) — is a stated corollary, and is why the
theorem is worth its cost. `√|det (A Aᵀ)|` is the Cauchy–Binet identity of 3.4 and the slice
volume is 4.5, so this is 3.4 plus Layer 4 and nothing else — over `ℤ` the extraction 4.4 is
vacuous, `d = 1` and the minima vectors are already the basis, while 4.5 already carries
Theorem 1's constant. This assembly is written out, adele-free, in Aliev–Henk §6 (Theorems
6.2–6.3, with the `ℚ`-case of 4.3's covolume identity stated there as folklore), which is the
reference to hold the milestone against.

⚠ **The milestone needs 3.5, which the pricing above does not name.** `BombieriVaaler.lean` imports
`Duality.lean`, and it has to: 4.3 delivers the covolume of the solution lattice as the Arakelov
height of the *solution space*, and turning that into the minors of `A` is
`Matrix.arakelovMulHeight_ker_mulVecLin` — the Plücker coordinates of the kernel are the
complementary minors, which is what the duality theorem says. Nothing shorter exists: the
statement's right-hand side is about the rows and its left-hand side about the kernel. So the `ℚ`
spine reads 3.1 → 3.2 → 3.3 → {3.4, 3.5} → 4.1 → 4.2 → 4.3(`ℚ`) → 4.5 → 5.2, one rung longer than
"3.4 plus Layer 4 and nothing else", and every rung of it is landed. The rest of the pricing was
right: 4.4 is not used, and the minima vectors of 4.2 are the basis.

⚠ **The constant `1` of Theorem 2 is two powers of two cancelling.** Layer 4.2 bounds
`(∏ λ i) · vol B` by `2^n · covol L`; Layer 4.5 bounds `vol B` below by `2^n` for `B` the central
slice of the unit cube; the product of the minima is therefore at most the covolume with nothing
left over. That is `ZLattice.prod_successiveMinimum_cubeSlice_le_covolume`, the geometric half of
the theorem, which knows no arithmetic at all — it is stated for any lattice in any subspace of
`EuclideanSpace ℝ ι`. A body whose central slices are smaller leaves a constant behind, which is
exactly what a complex place does in 5.4.

⚠ **The absolute value in `√|det (A Aᵀ)|` is redundant, and `A ≠ 0` is subsumed.** The Gram
determinant of the rows is a sum of squares of minors (3.4's `det_mul_transpose_self_eq_sum_sq`),
and under the rank hypothesis it is positive (`Int.Matrix.det_pos`); `Int.Matrix.minorGcd` is a
normalized greatest common divisor of integers not all zero, hence at least `1`
(`Int.Matrix.one_le_minorGcd`). The delivered statements carry neither absolute value. The rank
hypothesis is stated as linear independence of the rows over `ℚ`, and
`Int.Matrix.linearIndependent_row_map_rat_iff` identifies that with `(A * Aᵀ).det ≠ 0` — a
condition on the integer matrix alone, which is both the honest form of "rank `M`" and a
replacement for `A ≠ 0`.

⚠ **The basis form needs no hypothesis `M < N`, and is sharp at `M = N`.** With `N − M = 0` the
conclusion reads `1 ≤ 1`: the empty product on the left, the Arakelov height of the zero subspace
on the right. Only Theorem 1 needs `M < N`, and there the exponent `1/(N − M)` makes it
unremovable. Stating the basis form without it costs nothing and is what the proof gives.

⚠ **The height form is strictly weaker than the sup-norm form, and it is the form 5.4
generalizes.** The vectors realizing the successive minima are not primitive in general, and by
5.1's `Rat.gcd_mul_mulHeight_intCast` the height of an integer tuple is its sup norm divided by its
content. So `Int.Matrix.exists_linearIndependent_mulVec_eq_zero_prod_mulHeight_le`, which is the
`K = ℚ` case of 5.4 with `|D_{ℚ/ℚ}| = 1`, is a genuine weakening of Theorem 2 rather than a
restatement — the opposite of what happened in 5.1, where the translation was an identity because
the vector could be replaced by its primitive multiple. Here it cannot: dividing each basis vector
by its content need not keep the family a basis of the solution lattice.

**5.3 Bombieri–Vaaler over a number field, Hermitian form** (Bombieri–Vaaler 1983; the inequality
Vaaler 2003 quotes as (1.3) and calls straightforward) — **landed**, with its slice bound, in
`ArithmeticHeights/BombieriVaalerField.lean` on `ArithmeticHeights/MixedBall.lean`. Let `K` have degree `d`, `r₁` real and `r₂`
complex places and discriminant `D_{K/ℚ}`, let `A` be an `M × N` matrix of rank `M` over `K`, write
`k = N − M`, and let `ω_j` be the volume of the unit ball of `ℝ^j`. The solution space of `A x = 0`
has a basis `x₁, …, x_k`, contained in `𝓞_K^N`, with

```text
∏_{l=1}^{k} H_Ar(x l)  ≤  [(2^k / ω_k)^{r₁} (2^k / ω_{2k})^{r₂}]^{1/d} · |D_{K/ℚ}| ^ (k / (2 d)) · H_Ar(A),
```

absolute Arakelov heights on both sides, `H_Ar(A)` the **Arakelov height of the row space** of `A`
— the subspace height of Layer 3 in the Arakelov normalization of Layer 0, taken absolute — not the
height of the entries. Route: 3.5 identifies `H_Ar(A)` with the height of the solution space `V`,
4.3 places `V ∩ 𝓞_K^N` as a `ZLattice` of rank `d k` in the real carrier of `V`, and 4.2 with the
`ℓ²` unit balls at the archimedean places as the convex body bounds the product of all `d k`
successive minima by `2^{dk} · covol / vol (B ∩ V_ℝ)`. The real carrier is the product over the
places of `V ⊗_K K_v`, so the slice is the product of the slices at each place, and a central slice
of a euclidean ball is a ball: `ω_k` at a real place, `ω_{2k}` at a complex one, and no slicing
theorem is needed. Then 4.4 selects from vectors realizing the minima a `K`-basis, the `l`-th among
the first `d (l − 1) + 1`, whose relative Arakelov height is at most `λ_{d(l−1)+1} ^ d` — integral
coordinates make every finite local factor at most one, and membership in the dilated body bounds
the archimedean ones — so the product over the basis is bounded by the product of the minima. The
`2^{dk}` of 4.2 and the `2^{−r₂ k}` of 4.3 combine to the `2^{k (r₁ + r₂)}` displayed, and Layer
0.4's absolute normalization is applied once, at the end. This needs 4.1–4.4 and nothing else, and
is the first published number-field theorem of the layer. Since `H ≤ H_Ar` (0.2), it bounds the
sup-norm heights of the basis at the same constant.

⚠ **The rank hypothesis is not needed.** The milestone asks for `A` of rank `M`; the delivered
statement asks for nothing. Layer 3.5's `Matrix.arakelovMulHeight_ker_mulVecLin` identifies the
Arakelov height of the solution space with that of the row space for an *arbitrary* matrix, and
the geometric half never looks at `A` at all — it works with the solution space `V` and its
dimension `k`. Full row rank would only pin `k = N − M`, which the delivered statement takes as a
hypothesis `hk` instead. The subspace form
`NumberField.exists_basis_prod_arakelovMulHeight_le`, which is what the proof actually produces,
mentions no matrix.

⚠ **The two powers of two of 5.2 do not cancel here, and what is left is the ratio of a cube to a
ball.** Layer 4.2 contributes `2^{d k}`, Layer 4.3 contributes `2^{−r₂ k}` through the covolume of
`𝓞_K`, and `d = r₁ + 2 r₂`, so `2^{k(r₁ + r₂)}` survives; the body contributes `ω_k^{r₁}
ω_{2k}^{r₂}` beneath it. Over `ℤ` (5.2) the body was the cube slice, whose volume 4.5 bounds below
by exactly `2^n`, and nothing was left. **That is the whole difference between 5.3 and 5.4**: 5.4
replaces the ℓ² balls by cubes and polydiscs and recovers the cancellation, and that replacement
is what needs cube slicing.

⚠ **The slice bound is an identity, and computing it is the bulk of the work.** The body is the
*product over the infinite places* of the ℓ² unit balls — not the ℓ² ball of the whole tuple
space, which would give a strictly worse constant, because a single global bound on `∑_v S_v`
cannot be split back into a bound at each place without paying weighted AM–GM. Its slice by the
real span of `V` is computed rather than estimated:
`NumberField.mixedEmbedding.volume_preimage_mixedBall_mixedSpan` says the slice has volume
`ω_k^{r₁} ω_{2k}^{r₂}` on the nose. The mechanism is that a `K`-basis `y` of `V` gives a map of
euclidean tuple spaces with range the real span of `V`, and orthonormalizing `y` **at each
infinite place separately** turns that map into an *isometry*, which carries the body of the
`k`-tuple space onto the slice. No subspace is ever sliced; the ambient space is made smaller
instead. Layer 4.5 is not used anywhere in 5.3.

⚠ **Mathlib has no square root of a positive-definite matrix**, so the local orthonormalization
goes through the `LDL` decomposition: `L S Lᴴ` is diagonal with positive entries, and a *diagonal*
matrix does have a square root. What is wanted is only *some* `M` with `M S Mᴴ = 1`, never the
symmetric one, so nothing is lost. The same file also supplies a product-measure fact Mathlib
lacks — `Measure.pi` over a product index type is the iterated `Measure.pi`
(`MeasureTheory.measurePreserving_uncurry`); Mathlib has the analogue for a *sum* of index types
and not for a product.

⚠ **`k = 0` needs no special case, and no value of `ω_0` is ever required.** The empty product is
`1`, and Minkowski's second theorem applied to the zero-dimensional lattice delivers
`1 ≤ C · H_Ar(V)` directly. This is why the basis is assembled with `Basis.mk` and a rank count
rather than with `basisOfLinearIndependentOfCardEqFinrank`, which demands a nonempty index type.

⚠ **The extraction of 4.4 is applied over `ℚ`, not over `ℤ`.** The mixed embedding is a `ℤ`-linear
map, and 4.4's counting argument needs a map of vector spaces over a subfield; a `ℚ`-linear
structure on an additive group is unique, so `AddMonoidHom.toRatLinearMap` supplies it with no
content. This is the one place where 5.3 uses 4.4 and 5.2 did not — over `ℤ` the extraction was
vacuous.

**5.4 Bombieri–Vaaler over a number field, max-norm form — the summit** (Bombieri–Gubler, Theorem
2.9.4; Bombieri–Vaaler 1983, Theorem 8) — **landed**, at both constants, in
`ArithmeticHeights/BombieriVaalerMaxNorm.lean` on `ArithmeticHeights/MixedCube.lean`. With `K`,
`A` and `k` as in 5.3, the solution space of
`A x = 0` has a basis `x₁, …, x_k`, contained in `𝓞_K^N`, with

```text
∏_{l=1}^{k} H(x l)  ≤  |D_{K/ℚ}| ^ (k / (2 d))  ·  H_Ar(A),
```

`H` the absolute multiplicative height and `H_Ar(A)` the absolute Arakelov height of the row space,
as in 5.3. This is Bombieri–Gubler's Theorem 2.9.4, the statement applications quote. The
integrality of the basis carries no extra information (Remark 2.9.5), since scaling does not change
a height; state it anyway, because it is what applications quote. State with it, as the second
theorem of the same milestone, the bound at Bombieri–Vaaler's own constant,

```text
∏_{l=1}^{k} H(x l)  ≤  (2/π)^{k r₂ / d} · |D_{K/ℚ}| ^ (k / (2 d))  ·  H_Ar(A),
```

which implies the first since `2/π < 1` and is strictly sharper whenever `K` has a complex place.
Route: as in 5.3 with the sup-norm unit balls as the convex body — cubes at the real places,
polydiscs at the complex ones — whose central slices 4.5 bounds from below, place by place: the
product-of-balls form of 4.5 gives `2^k` at a real place and `π^k` at a complex one, hence the
second bound directly, and the first follows from it, or from the cube case of 4.5 through the
inscribed cube at each complex place, which is the exact cancellation of the *Route* paragraph.
Vaaler states the dependency between 5.3 and 5.4 explicitly: (1.3) follows from the second theorem,
while the max-norm form (1.4) "is more difficult because it requires the cube-slicing inequality".
The discriminant power in the bound is not removable (Roy–Thunder 1995), and the best possible
constant, a generalized Hermite constant (Vaaler 2003), is recorded in the references and is not
the target.

⚠ **The pricing held, and 5.4 is the whole reason Layer 4.5 exists.** 5.2 uses the cube case over
`ℚ`, 5.3 uses no cube slicing at all, and the product-of-balls form is spent here and nowhere
else, for the polydisc at a complex place. Structurally 5.4 is 5.3 with one file swapped — the
body — and the two milestones share their arithmetic, their extraction over `ℚ`, their treatment
of `k = 0` and their lack of a rank hypothesis on `A`.

⚠ **The body must be normalized to volume-one factors, and the anisotropy is then paid in the
height rather than in the volume.** The body the *Route* paragraph describes — the unit cube at
each real place, the unit polydisc at each complex one — has central slices of volume at least
`2^k` and `π^k`. Those two bounds cannot be brought into a common form by dilating the body: the
factor a real place wants is `2` and the one a complex place wants is `√π`, and an **anisotropic**
dilation does not preserve the subspace being sliced, so the slice of the dilate is not the dilate
of the slice. `ArithmeticHeights/MixedCube.lean` therefore defines the body with Bombieri–Gubler's
`ρ(1) = 1/2` and `ρ(2) = π^{−1/2}` in it, every one-coordinate factor has volume one, the slice
bound is a clean `1`, and the constants `2^{−r₁}` and `π^{−r₂}` reappear exactly once, when a
point of a dilate is converted into a height. For the same reason the body has to be a product
**over the places**: a single bound on the whole tuple cannot be split back per place without
losing a constant to weighted AM–GM.

⚠ **The arithmetic of the constant.** `2^{dk}` from 4.2, `2^{−r₂k}` from 4.3 and
`2^{−r₁k} π^{−r₂k}` from the body multiply to `(2/π)^{k r₂}`, since `d = r₁ + 2 r₂`. Over `ℚ` that
is `1` and the discriminant factor is `1`, so the delivered statement specializes to the height
form of Bombieri–Vaaler's Theorem 2 (5.2). The weaker form the literature quotes drops the
`(2/π)^{k r₂}` by `2/π < 1`, and is a genuine weakening exactly when `K` has a complex place.

⚠ **The inscribed-cube route is not needed, and `two_pow_le_volume_inter_polydisc` is not used.**
The *Route* paragraph offers two ways to the first bound: from the second, or from the cube case
of 4.5 through the inscribed cube at each complex place. The first is one line (`2/π ≤ 1`) and the
second would reprove a weaker statement, so 4.5's polydisc corollary — stated there because the
roadmap asked for it — has no consumer.

⚠ **`ω₂ = π` is the only ball volume 5.4 needs beyond `ω₁ = 2`.** Both are proved in
`ArithmeticHeights/CubeSlicing.lean`; no other closed form for `ω_n` is required anywhere in
Layers 4.5, 5.3 or 5.4, which is what the ⚠ at 4.5 about `unitVolumeRadius` predicted.

⚠ **The `Fintype` instance must not occur in the statements about the body**, and Mathlib's
`unusedFintypeInType` linter enforces it. `mixedCube` is cut out by individual coordinates, so its
definition — and convexity, closedness, boundedness, nonempty interior — mention only the product
topology of the mixed tuple space, which needs no `Fintype`; the hypothesis is `Finite`, and the
proofs, which do sum over the index, take a `Fintype` from `Fintype.ofFinite`. The ℓ² body of 5.3
is genuinely different: its definition names the norm of `EuclideanSpace ℝ κ`, so the instance is
in its type. This is a real constraint on how a sup-norm body may be written, not a lint
technicality.

⚠ **Three lemmas moved down a layer when 5.4 landed**, because 5.3 and 5.4 share them and 5.4 must
not import 5.3: `Finset.prod_pow_le_prod_range` — the regrouping of `d k` minima into `k` blocks —
is now in `ArithmeticHeights/SuccessiveMinima.lean`, and
`NumberField.mixedEmbedding.finprod_finitePlace_le_one` and
`NumberField.mixedEmbedding.mem_mixedLattice_iff` are now in
`ArithmeticHeights/NumberFieldLattice.lean`. The direction matters: mathematically 5.4 implies
5.3, so an import of 5.3 by 5.4 would be backwards.

**5.5 The corollaries applications actually quote** — **landed**, in
`ArithmeticHeights/BombieriVaalerEntries.lean` on `ArithmeticHeights/RowEntryHeight.lean`.
*Non-maximal rank* (Corollary 2.9.7): for `A`
of rank `R`, a basis `x₁, …, x_{N−R}` of the kernel with
`∏ H(x l) ≤ |D_{K/ℚ}|^{(N−R)/(2d)} · H_Ar^row(A)`, by restricting to `R` independent rows. *Entry
heights* (2.9.8 and Corollary 2.9.9): bounding `H_Ar^row(A) ≤ ∏_m H_Ar(A_m)` by 3.4's Fischer
inequality and `H_Ar(A_m) ≤ √N · H(A)` gives `∏ H(x l) ≤ |D_{K/ℚ}|^{(N−R)/(2d)} (√N H(A))^R`, and in
particular a single nonzero solution with `H(x) ≤ |D_{K/ℚ}|^{1/(2d)} (√N H(A))^{R/(N−R)}`. Over `ℚ`
this replaces the `N` of the classical Siegel lemma by `√N`, which is the concrete improvement to
record as the acceptance test for the whole layer.

⚠ **The acceptance test ran: over `ℚ` the bound is `(√N · H(A))^{R/(N−R)}`.** It is an `example`
at the end of `BombieriVaalerEntries.lean`, deduced from the general statement by `discr ℚ = 1`
and `[ℚ : ℚ] = 1`, against Layer 5.1's `(N · B)^{R/(N−R)}` with `B` a bound on the entries and
`H(A) ≤ B`. That is the whole of Bombieri and Vaaler's improvement, and it is the reason Layers
5.2–5.5 exist rather than 5.1 alone.

⚠ **Corollary 2.9.7 needed nothing: it is 5.4.** The roadmap reads it as a separate statement, to
be had "by restricting to `R` independent rows", but 5.4 as delivered already carries **no
hypothesis on `A`** and already states its bound in terms of `H_Ar^row(A)`, the height of the row
space, which is defined for every matrix whatever its rank — the rank enters only through
`k = dim ker A`, which is a hypothesis of the statement. The restriction to independent rows is
needed for the *entry* bound and for nothing else, and there it is a lemma rather than a
hypothesis: `Matrix.exists_submatrix_row_linearIndependent` produces `R = rank A` of the rows,
independent and spanning the same row space, so
`NumberField.exists_ne_zero_mem_ker_absMulHeight_le` and its product form carry no rank
hypothesis either, and their exponent is `rank A` rather than the number of rows. The shape this
roadmap and `Suggested.lean` pinned — independent rows, exponent `m` — is delivered beside them as
`…_of_linearIndependent_row`.

⚠ **The Fischer inequality 3.4 delivers is not the one 5.5 needs, and the gap is the complex
places.** At an infinite place `v` the local factor of the tuple of minors is `∑ₛ v(pₛ)²` with
`v x = ‖σ x‖`, so Cauchy–Binet produces the Gram matrix `σA (σA)ᴴ` — the **conjugate** transpose —
at a complex place as well as at a real one, and 3.4's `det_mul_transpose_self_le_prod` is an
inequality in an *ordered* field, which `ℂ` is not. The fix is not to redo the two-block argument
over `ℂ`. `Matrix.realify` doubles both the rows and the columns of a complex matrix,
`Matrix.det_realify_mul_transpose` identifies the real Gram determinant with the *square* of the
Hermitian one — one block computation, `det (fromBlocks X Y (-Y) X) = det (X − iY) · det (X + iY)`
— and 3.4's real inequality applied to the realification therefore gives the complex one squared,
both sides being nonnegative. ⚠ Doubling only the
**columns** does not work. The real `m × 2N` matrix `[Re B | Im B]` has Gram matrix `Re (B Bᴴ)`
and its rows have the right lengths, so real Hadamard gives `det (Re (B Bᴴ)) ≤ ∏ᵢ ‖Bᵢ‖²` for free;
but `det (B Bᴴ) ≤ det (Re (B Bᴴ))` is then a theorem of the same depth, with no term-by-term
proof — the minors of `[Re B | Im B]` on *overlapping* column pairs are what make it true. The
rows have to be doubled too. The Hermitian statement lives in `Hadamard.lean` beside the real one,
as `Matrix.sum_sq_norm_plucker_row_le_prod`, and 5.5 is its only consumer; it is stated only in
the fully split form, since nothing needs a two-block Hermitian Fischer inequality.

⚠ **The finite places went exactly as 3.4 predicted, and they are four lines.** The local factor
there is the sup norm of the minors, and the fully split bound
`maxₛ v(pₛ) ≤ ∏ᵢ maxⱼ v(Xᵢⱼ)` is the Leibniz formula, a nonarchimedean sum being no larger than
its largest term, and the observation that a permutation visits each row once — no block Laplace
expansion anywhere. It is `exteriorPower.iSup_plucker_le_prod`, stated for an arbitrary
nonarchimedean absolute value, and it sits beside `exteriorPower.iSup_plucker_le_one` of 3.6 in
everything but its file.

⚠ **The `√N` is `‖·‖₂ ≤ √N ‖·‖_∞` at one archimedean place, paid once per independent row, and it
is the only cardinality paid anywhere in Layer 5.** It is
`NumberField.arakelovMulHeight_le_mulHeight` of Layer 0.2, whose constant `#ι ^ (d/2)` is sharp —
equality at the all-ones tuple — and which needs `ι` nonempty, since on the empty index type both
heights are the junk value `1` while the bound is `0`. That hypothesis propagates: every
entry-height statement of 5.5 carries `[Nonempty ι]`, and the single-solution form gets it free
from `rank A < N`.

⚠ **The assembly crosses a `Finset.prod` with a `finprod`, and Mathlib is one lemma short.** Both
local bounds are by a product over the rows, so the global product over the places has to be
turned inside out: at the infinite places that is `Finset.prod_comm`, at the finite places
`finprod_prod_comm`. The latter needs each row's local factor to have finite multiplicative
support, which is Mathlib's `Height.hasFiniteMulSupport_iSup_nonarchAbsVal`, but
`finprod_le_finprod₀` also needs the *product over the rows* to have finite multiplicative
support, and Mathlib has `Function.HasFiniteMulSupport.mul` but no `Finset.prod` closure.
`Function.hasFiniteMulSupport_prod` is eight lines and belongs upstream.

⚠ **Every row of a matrix with a nonzero Plücker point is nonzero**, which is what lets the
displayed formula for the Arakelov height be used on *both* sides of 2.9.8 — the junk value `1`
would otherwise have to be chased through the product over the rows. In the other direction the
junk value is harmless: if every maximal minor vanishes the left-hand side is `1` and the right is
a product of numbers `≥ 1`, so 2.9.8 holds for every matrix with no hypothesis at all.

**5.6 The relative version** (Bombieri–Gubler, Theorem 2.9.19; the `K = ℚ` case is Hindry–Silverman,
Lemma D.4.2, "Siegel's lemma, second form", which is the shape auxiliary-function constructions
quote and the one to state first) — **landed**, in
`ArithmeticHeights/BombieriVaalerRelative.lean` on `ArithmeticHeights/RestrictScalars.lean`.
Entries in a finite extension `F/K` of degree `r`, solutions
required in `K`: if `r M < N` there are `N − r M` `K`-linearly independent `x_l ∈ 𝓞_K^N` with
`A x_l = 0` and `∏ H(x l) ≤ |D_{K/ℚ}|^{(N−rM)/(2d)} ∏_{i=1}^{M} H_Ar(A_i)^r`, `A_i` the `i`-th row
and `H_Ar(A_i)` its absolute Arakelov height as a vector of `F^N`. This is the form transcendence
arguments use, where the auxiliary construction and the field of definition differ, and it is the
interface downstream work imports.

⚠ **The pinned signature survived contact with the proof unchanged, which no other Layer 5
milestone did.** `Roadmap/Suggested.lean` carried 5.6 as a `sorry` with exactly these binders,
exponents and normalizations, and the landed
`NumberField.exists_linearIndependent_mem_ker_prod_absMulHeight_le` discharges it verbatim.
Beside it are the single-solution form
`NumberField.exists_ne_zero_mem_ker_absMulHeight_le_relative`, which is what Bombieri and Gubler's
own applications of 2.9.19 quote, and the product form over a whole basis of the solution space,
`NumberField.exists_basis_ker_prod_absMulHeight_le_relative`.

⚠ **Descending the system to `K` is not the content, and by itself it does not give the bound.**
Writing each entry of `A` in a `K`-basis `ω` of `F` turns `A x = 0` on `K^N` into an `rM × N`
system over `K` — that is `Matrix.restrictScalars`, and the two solution spaces agree
(`Matrix.ker_mulVecLin_restrictScalars`) — but applying 2.9.8 over `K` to *its rows* gives a bound
that **depends on the basis and is false for a bad one**: over `ℚ(√2)` the row `(1, √2)` has
coordinate rows `(1, 0)` and `(0, 1)` in the basis `1, √2`, of height `1` each, and `(1, −1000)`
and `(0, 1)` in the basis `1, 1000 + √2`. What is basis-free is the **span** of the coordinate
rows, and the only route to it is Bombieri–Gubler's own: over a field `L` carrying all `r`
embeddings `σ_u : F → L` over `K`, the matrix of conjugates `Ã = (σ_u(A_{ij}))` is `Ω · A'` with
`Ω` block-diagonal with blocks `(σ_u(ω_t))` — their (2.30) — so `Ã` and `A'` have the same row
space over `L`, that row space is the base change of the one over `K`, the absolute height of a
subspace does not change under base change, and 2.9.8 over `L` costs `∏_{i,u} H_Ar(σ_u A_i)`,
which is `∏_i H_Ar(A_i)^r`.

⚠ **Base change of a subspace height is a new statement, and it is three lines given 3.1.** The
Plücker coordinates are determinants, so they commute with a ring homomorphism
(`exteriorPower.plucker_comp_ringHom`, now in 3.1); a `K`-independent family stays independent
over `L` because its Plücker point is nonzero and stays nonzero; and the absolute height of the
image tuple is the absolute height of the tuple. That is
`Submodule.arakelovMulHeight_span_range_comp_algebraMap_rpow`, and with it the row space over `L`
of the descended system carries the same absolute height as the row space over `K` — which is
what lets 2.9.8 be applied in the larger field and the answer read in the smaller one. The
`L`-span of a base-changed family depends only on the `K`-span
(`Submodule.span_range_comp_algebraMap_eq`), which is why any spanning family will do.

⚠ **Layer 0 had to grow two statements before that last step was available.** 0.3 had the
extension law for `Height.mulHeight` only and 0.4 the embedding-invariance of
`NumberField.absMulHeight` only; the Arakelov normalization needed both, and they are now
`NumberField.arakelovMulHeight_pow_finrank` and `NumberField.arakelovMulHeight_rpow_comp`. See the
⚠ under 0.3 and 0.4. Nothing else in Layer 0 was touched, and the archimedean count of 0.3 is now
stated once, for an arbitrary local factor, rather than twice.

⚠ **"Rearrange the basis by increasing height" is load-bearing, not a flourish.** Bombieri and
Gubler write that step in one line, and it is what separates the two statements 5.6 delivers. The
product form bounds a basis of the solution space, whose dimension `k = N − rank A'` exceeds
`N − rM` whenever the descended system fails to have full rank `rM` — which happens already for a
single row over `F` all of whose entries lie in `K`, descending to a system of rank `1` rather
than `r`. Dropping the surplus vectors is free, every height being at least `1`; dropping the
discriminant they carry is **not**, since `|D| ≥ 1` makes `|D|^{k/(2d)} ≥ |D|^{(N−rM)/(2d)}` the
wrong way round. The geometric mean of the smallest `k'` of `k` numbers is at most the geometric
mean of all `k`, so raising the bound to the power `k'/k` divides the exponent of `|D|` down to
`(N−rM)/(2d)` exactly and costs nothing on a right-hand side that is at least `1`. That is
`Real.exists_injective_prod_pow_le`, proved through Mathlib's `Tuple.sort`, and it is the only
part of 5.6 that is pure real analysis.

⚠ **The auxiliary field is a compositum of images, not a normal closure.** Nothing in the argument
uses normality — only that all `r` embeddings are present — so `L` is built inside
`AlgebraicClosure K` as `⨆ i, (σ i).fieldRange`, an `IntermediateField` finite over `K` because a
finite supremum of finite intermediate fields is finite, hence a number field. It appears in no
statement: `Matrix.arakelovMulHeight_span_restrictScalars_rpow_le'` quantifies over nothing but
`K`, `F`, a basis and `A`. ⚠ The invertibility of `(σ_u(ω_t))` is the non-vanishing of the
discriminant of `F/K`, which Mathlib states only over an **algebraically closed** field
(`Algebra.discr_eq_det_embeddingsMatrixReindex_pow_two`), so the determinant is computed in
`AlgebraicClosure K` and pulled back along the injection of `L` by `RingHom.map_det`.

⚠ **Layer 5.4 lost its `Fin m`, and that was the whole cost of the descended system's shape.** Its
rows are indexed by `Fin m × Fin r`, and the row index is inert throughout 5.4 — the bound is in
terms of the row *space*, and `Matrix.arakelovMulHeight_ker_mulVecLin` of 3.5 was already stated
for an arbitrary row type — so `NumberField.exists_basis_ker_prod_absMulHeight_le` and
`Matrix.finrank_ker_mulVecLin` now take one too. Layer 5.5's 2.9.8 needed the same treatment in a
different direction: `Submodule.arakelovMulHeight_span_range_le_prod` is the form 5.6 consumes —
any finite index type, no independence hypothesis on the family — and it is
`Matrix.arakelovMulHeight_span_range_row_le_prod'` read through a reindexing.

⚠ **5.6 grew a rank form when 5.7 landed, and that was a gap in 5.6 rather than a demand of 5.7.**
The hypothesis `r M < N` counts the *rows* of `A`; what the descended system's dimension actually
depends on is `r · rank A`, because the image of `K^N` under `A` lies in the `F`-column space of
`A`. So `NumberField.exists_linearIndependent_mem_ker_prod_absMulHeight_le_rank` and
`NumberField.exists_ne_zero_mem_ker_absMulHeight_le_relative_rank` sit beside the two statements
above, both forms coming from one private lemma parameterized by the number of solutions wanted,
and both landed statements unchanged. The lemma that separates them is
`Matrix.le_finrank_ker_mulVecRestrict`, which needs no basis of `F / K` at all.

**5.7 The auxiliary-polynomial form** — **landed**, in
`ArithmeticHeights/AuxiliaryPolynomial.lean` on `ArithmeticHeights/MonomialIndex.lean`. The
packaging transcendence and Diophantine-approximation
arguments actually import, and the reason 5.6 is stated in the relative form: given `r` variables, a
degree bound `D`, and `N` linear conditions on the coefficients of a polynomial over `K` — typically
that it vanish to prescribed multiplicity at prescribed algebraic points — with the coefficients of
those conditions of height at most `H`, and **fewer independent conditions than coefficients**,
produce a nonzero such polynomial satisfying all of them, with an explicit height bound. Pin the
pieces: the monomial index set is `{m : Fin r →₀ ℕ | m.degree ≤ D}`, of cardinality
`M = (D + r).choose r`; the conditions are a matrix `A : Matrix (Fin N) {m // m.degree ≤ D} K`
acting on the coefficient vector; the feasibility hypothesis is `A.rank < M` (implied by
`N < M`), and in the relative form of 5.6, coefficients in `F/K` of degree `s`, it is `s · rank < M`;
and the bound is 5.5's single-solution bound with `M` in place of `N`,
`absMulHeight (coeff P) ≤ |D_{K/ℚ}|^{1/(2d)} (√M · H(A))^{R/(M − R)}` with `R = A.rank`, and its
basis form for a family of independent such polynomials. Without the feasibility hypothesis no
nonzero solution need exist and the statement is false: one variable, `D = 0`, and the single
condition "the coefficient is zero". This is 5.5
and 5.6 applied to the coefficient space of `MvPolynomial (Fin r) K` cut out by the conditions, with
Layer 2.1 supplying the height of the resulting polynomial and Layer 2.5 the height of the condition
matrix. State it so that the count of conditions and the dimension of the coefficient space appear
separately, as Hindry–Silverman D.4 does when constructing their auxiliary polynomial: downstream
users vary those two independently and a bound that has already combined them is unusable.

⚠ **The delivered statements bound Layer 2.1's height of the polynomial, so the degree bound `D`
does not appear in the conclusion.** The roadmap above writes the bound as
`absMulHeight (coeff P)`, the absolute height of a coefficient tuple, which forces the index set —
and hence `D` — into the inequality. What is actually delivered is
`MvPolynomial.mulHeight P ^ (1/d)`, the absolute height of `P` as a polynomial, with `D` confined
to the hypothesis `P.totalDegree ≤ D`. The two are the same number
(`MvPolynomial.absMulHeight_coeff_degreeLE`), and the second is the one a downstream user can
carry without remembering which `D` the polynomial was constructed for. The five statements are
`MvPolynomial.exists_ne_zero_mem_ker_mulHeight_rpow_le` (the milestone, with `rank A`),
`…_of_lt` (with `N`), `MvPolynomial.exists_linearIndependent_mem_ker_prod_mulHeight_rpow_le` (the
basis form) and the two relative forms.

⚠ **The monomials of bounded degree were a Mathlib gap of exactly one equivalence.** Mathlib has
`Finsupp.finite_of_degree_le`, and through `Finset.finsuppAntidiag` and `Sym` it has stars and
bars for degree *exactly* `D`; what was missing is the slack variable relating the two. That is
`Finsupp.degreeLEEquivDegreeEq` — a tuple of degree at most `D` in `r` variables is a tuple of
degree exactly `D` in `r + 1` — and it gives `Finsupp.card_subtype_degree_le`,
`#{m : σ →₀ ℕ | m.degree ≤ D} = (D + #σ).choose #σ`. ⚠ The `Fintype` instance on that subtype is
**noncomputable** (`Fintype.ofFinite`), which costs nothing here and is worth knowing; and the
monomials carry **no linear order**, so the proofs install an arbitrary well-order for the Plücker
indexing of Layers 5.4–5.6, exactly as Layer 2.2 does. Neither choice reaches a statement.

⚠ **The coefficient dictionary has to be a linear map, not a function.** `MvPolynomial.ofDegreeLE`
sends a coefficient vector indexed by the monomials of degree at most `D` to the polynomial it
names; the basis forms of 5.7 assert linear independence of the *polynomials*, and that is
`LinearIndependent.map'` along `MvPolynomial.ofDegreeLE_injective`. Stating the dictionary as a
plain function would leave that step to each caller.

⚠ **The relative form is what sent Layer 5.6 back, and the roadmap was right to ask for the
rank.** In 5.6's notation — `M` rows, `N` unknowns — the landed feasibility hypothesis was
`r M < N`, counting *rows*; 5.7 needs `r · rank A < N`, which is strictly weaker whenever the
vanishing conditions on a polynomial
repeat — and they normally do, since a multiplicity condition at a point is a block of conditions
that need not be independent. The gap is one lemma: the image of `K^N` under `A` lies in the
`F`-column space of `A`, of `F`-dimension `rank A`, whose `K`-dimension is `r · rank A`
(`Matrix.finrank_range_mulVecRestrict_le`), so the solution space has dimension at least
`N − r · rank A` (`Matrix.le_finrank_ker_mulVecRestrict`). Both statements of 5.6 now come in a
rank form as well, from one private lemma parameterized by the number of solutions wanted; no
proof was duplicated and no landed statement changed.

⚠ **`N < M` is not free, and what it costs is one monotonicity.** The milestone's exponent is
`R / (M − R)` with `R = rank A`; a caller who has not computed a rank has only `N < M` and gets
`N / (M − N)`. The step is that `x ↦ x / (M − x)` is increasing on `[0, M)` and that the base
`√M · H(A)^{1/d}` is at least `1` — both true, and both needed, since neither the exponent nor the
base is on its own.

### Layer 6: heights and the unit group

Mathlib proves Dirichlet's unit theorem; this layer builds the height-side dictionary around it and
the S-adic generalization it does not have.

**6.1 The logarithmic embedding as a height** — **landed**, in
`ArithmeticHeights/UnitHeight.lean` (Bombieri–Gubler 1.5.12). For a unit `u` every finite
local factor is `1`, so
`logHeight₁ (u : K) = ∑ w : InfinitePlace K, max 0 (mult w * log (w u))`, the sum of the positive
parts of the **full** vector of weighted logarithms over all infinite places; and since that vector
sums to `0` by the product formula, `2 * logHeight₁ u = ∑ w, |mult w * log (w u)|`, its ℓ¹ norm.
Relate this to Mathlib's `NumberField.Units.logEmbedding`, which is that vector **with the
coordinate at the distinguished place `w₀` dropped** (its codomain is `{w // w ≠ w₀} → ℝ`): the
missing coordinate is minus the sum of the others, so
`logHeight₁ u = ∑_{w ≠ w₀} (logEmbedding u w)⁺ + (−∑_{w ≠ w₀} logEmbedding u w)⁺`, and
`‖logEmbedding u‖₁ / 2 ≤ logHeight₁ u ≤ ‖logEmbedding u‖₁`. ⚠ Neither
`logHeight₁ u = ∑_w (logEmbedding u w)⁺` nor `2 logHeight₁ u = ‖logEmbedding u‖₁` holds: both
miss `w₀`, and a unit whose only large conjugate is at `w₀` refutes them. Deduce that `logEmbedding`
has finite fibres of bounded height, so that Mathlib's `unitLattice_inter_ball_finite` and Layer 1.1
are two views of one fact.

⚠ **Both warned-against identities are false, and 6.1 says exactly when each holds.** The
refutation the roadmap describes — "a unit whose only large conjugate is at `w₀`" — is delivered
as a criterion rather than as an example, which is sharper and needs no explicit number field:
`NumberField.Units.logHeight₁_eq_sum_posPart_logEmbedding_iff` says
`logHeight₁ u = ∑_{w ≠ w₀} (logEmbedding u w)⁺` holds **precisely when `w₀ u ≤ 1`**, and
`NumberField.Units.two_mul_logHeight₁_eq_sum_abs_logEmbedding_iff` says
`2 logHeight₁ u = ∑_{w ≠ w₀} |logEmbedding u w|` holds **precisely when `w₀ u = 1`**. What replaces
them is an identity and not an inequality:
`2 logHeight₁ u = ∑_{w ≠ w₀} |logEmbedding u w| + |∑_{w ≠ w₀} logEmbedding u w|`, the second term
being the size of the dropped coordinate. The two-sided comparison is that identity plus the
triangle inequality, and the factor `2` in it is therefore not slack.

⚠ **The ℓ¹ norm has to be written as a sum.** `logSpace K` is a `Pi` type and Mathlib's `‖·‖` on
it is the **supremum** norm, so `‖logEmbedding u‖₁` cannot be spelled `‖logEmbedding u‖`. The
delivered statements carry `∑ w, |logEmbedding u w|` explicitly, and the supremum-norm forms sit
beside them: `norm_logEmbedding_le_two_mul_logHeight₁` in one direction and
`logHeight₁_le_rank_mul_norm_logEmbedding` in the other, the latter paying `Units.rank K` for the
conversion. The supremum form is the one that meets `unitLattice_inter_ball_finite`, whose ball is
a ball for that norm.

⚠ **Summing over `{w : InfinitePlace K // w ≠ w₀}` needs `Classical`.** `InfinitePlace K` carries
no `DecidableEq`, so the subtype has no `Fintype` instance without it, and every statement that
sums over the coordinates `logEmbedding` keeps is prefixed `open scoped Classical in` — as
Mathlib's own `sum_logEmbedding_component` is. This is a property of the index type, not of the
mathematics, and it is why the two `mult w₀ * log (w₀ u)` bookkeeping steps are a private lemma
rather than inlined.

⚠ **The "two views" go in opposite directions, and only one of them is a theorem here.** The
finiteness of the units of bounded height is Northcott's theorem restricted along the injection of
`(𝓞 K)ˣ` into `K`, a two-line proof, and that is `NumberField.Units.finite_setOf_logHeight₁_le`.
The converse reading — that Mathlib's `unitLattice_inter_ball_finite`, the discreteness on which
Dirichlet's unit theorem rests, *is* Northcott's theorem seen through the height — is checked as an
acceptance criterion at the end of the file and deliberately **not** stated as a library theorem,
since Mathlib already proves it (by a different route, from `Embeddings.finite_of_norm_le`) and
this roadmap rebuilds nothing Mathlib has.

⚠ **6.1 needed one lemma from Layer 0 that was missing**: `NumberField.absLogHeight₁_eq`, the
logarithmic form of 0.3's `absMulHeight₁_eq`, saying that the absolute logarithmic height is the
relative one divided by the degree. It has been added to `ArithmeticHeights/Extension.lean` beside
its multiplicative twin, and it is what turns the comparison above into the form 6.3 consumes,
`h(ε) ≤ ‖logEmbedding ε‖₁ / d`.

**6.2 Units of height one** — **landed**, in `ArithmeticHeights/UnitTorsion.lean`
(Bombieri–Gubler 1.5.9; Hindry–Silverman B.2.3.1).
`absMulHeight₁ (u : K) = 1 ↔ u ∈ NumberField.Units.torsion K` for a
unit `u`, from Kronecker (1.4) and `logEmbedding_ker`. This is the height-theoretic identification
of the torsion subgroup, and the statement in which Kronecker's theorem is usually applied.

⚠ **Neither of the two inputs the milestone names is needed.** Layer 6.1 already writes
`2 logHeight₁ u` as `∑ w | ∞, |mult w · log (w u)|`, a sum of non-negative reals; it vanishes
exactly when every term does, and `NumberField.Units.mult_log_place_eq_zero` turns that into
`∀ w, w u = 1`, which is Mathlib's `NumberField.Units.mem_torsion` **verbatim**. The proof of
`NumberField.Units.absMulHeight₁_eq_one_iff_mem_torsion` is therefore 6.1 plus three lines, and
mentions no Mahler measure and no kernel. `logEmbedding_ker` in particular would be the long way
round: Mathlib derives `logEmbedding_eq_zero_iff`, and hence `logEmbedding_ker`, **from**
`mem_torsion`. Both named routes are kept, as acceptance criteria at the end of the file.

⚠ **Kronecker's theorem is used, but for the statement the milestone does not make.** What 1.4
buys is the removal of the unit hypothesis:
`NumberField.RingOfIntegers.isUnit_of_absMulHeight₁_eq_one` says a nonzero algebraic integer of
height one is a root of unity and hence a unit, with
`NumberField.RingOfIntegers.absMulHeight₁_eq_one_iff_isOfFinOrder` beside it. So
"units of height one" is the whole of "algebraic integers of height one", and 6.2's hypothesis is
not a restriction — which is the reason the milestone's shape is the right one. Kronecker for
units alone is already inside Mathlib's `mem_torsion`, which rests on
`NumberField.Embeddings.pow_eq_one_of_norm_eq_one`; 1.4's generality — every algebraic number, in
any field of characteristic zero — is spent on `𝓞 K`, not on `(𝓞 K)ˣ`.

⚠ **The comparison of 6.1 does not by itself say that the two functions vanish together**, since
a two-sided bound with a factor `2` is silent at the point where both sides are `0`.
`NumberField.Units.logHeight₁_eq_zero_iff_logEmbedding_eq_zero` is the statement that they do, and
it is 6.2 and not 6.1 that supplies it.

⚠ **6.2 is what makes 6.3's bounds non-vacuous**, and the file delivers that explicitly. Off the
torsion subgroup the height is *strictly* above `1`
(`NumberField.Units.one_lt_absMulHeight₁_of_notMem_torsion` and its logarithmic forms); no member
of Mathlib's `fundSystem` is torsion, because its logarithmic embedding is a basis vector of the
unit lattice (`NumberField.Units.fundSystem_notMem_torsion`); and therefore
`NumberField.Units.prod_absLogHeight₁_fundSystem_pos`, the positivity of the product
`∏ h(ε_i)` that 6.3 bounds the regulator by. Without it `regulator K ≤ (2d)^r ∏ h(ε_i)` would be
compatible with the right-hand side being `0`.

**6.3 The regulator and the heights of a fundamental system** — **landed**, in
`ArithmeticHeights/Regulator.lean` (Bugeaud–Győry 1996, Lemma 1). Two statements, in the absolute
logarithmic height `h`, with `r = Units.rank K` and `d = [K : ℚ]`. *Hadamard's bound, for every
fundamental system* `ε₁, …, ε_r`, in particular Mathlib's `fundSystem`:
`regulator K ≤ (2 d)^r · ∏ h(ε_i)`. The regulator is the absolute determinant of the `r × r` matrix
of `logEmbedding`s (Mathlib's `regulator` is the covolume of `unitLattice`), each row has ℓ¹ norm at
most `2 · logHeight₁ ε_i = 2 d · h(ε_i)` by 6.1, and Hadamard's inequality bounds a determinant by
the product of the ℓ² norms of its rows, which are at most the ℓ¹ norms. *A reduced basis exists*
(Bugeaud–Győry 1996, Lemma 1, the case `S = S_∞`): there is a fundamental system with
`∏ h(ε_i) ≤ c · regulator K`, `c = (r!)² / (2^{r−1} d^r)`. Route, which is theirs and produces
exactly this constant: apply the substantial half of 4.2 to `unitLattice K`, whose covolume is
`regulator K`, with `B` the closed ℓ¹ unit ball of `{w // w ≠ w₀} → ℝ`, of volume `2^r / r!`
(Mathlib's `MeasureTheory.volume_sum_rpow_le` at `p = 1`), so that `∏ λ_i ≤ r! · regulator K`; take
the basis `b` of 4.6, which costs `r! / 2^{r−1}`, and units `ε_i` with `logEmbedding ε_i = b_i`,
a fundamental system because `logEmbedding` is injective modulo torsion (`logEmbedding_ker`); and
bound each height by 6.1, `h(ε_i) = logHeight₁ ε_i / d ≤ ‖b_i‖₁ / d`, which contributes `d^{−r}`.
⚠ The second statement is an existence statement and cannot be made
for `fundSystem` or for every fundamental system: a unimodular change of basis makes the heights
arbitrarily large at fixed regulator. Nor is it a statement with unspecified constants: for a fixed
`K`, `∃ c₁ c₂ > 0, c₁ R ≤ ∏ h(ε_i) ≤ c₂ R` is true of any positive numbers and says nothing. The
heights are logarithmic on both sides; a product of multiplicative heights against the regulator is
not a theorem. "Fundamental system" means what `closure_fundSystem_sup_torsion_eq_top` says of
`fundSystem`: `r` units generating `(𝓞 K)ˣ` modulo torsion. Hadamard's determinant inequality is
linear algebra with a sorry-free proof available (see *[Provenance](#provenance)*); the lattice input
is Mathlib's `basisUnitLattice`.

⚠ **Both statements landed with their pinned shapes and their pinned constant intact**, in
`ArithmeticHeights/Regulator.lean`: `NumberField.Units.regulator_le_prod_absLogHeight₁` and
`NumberField.Units.exists_fundSystem_prod_absLogHeight₁_le`. Beside them the file carries the
Hadamard bound for an arbitrary family against its own regulator
(`NumberField.Units.regOfFamily_le_prod_absLogHeight₁`) and for an arbitrary fundamental system,
the relative form `NumberField.Units.regulator_le_prod_logHeight₁` where the constant is `2^r` and
not `(2d)^r`, the two bounds for one and the same system
(`NumberField.Units.exists_fundSystem_regulator_le_and_prod_absLogHeight₁_le`), and the ℓ¹ ball of
the log space with its volume and its Minkowski bound (`NumberField.Units.logBall`,
`volume_logBall`, `prod_successiveMinimum_logBall_le`).

⚠ **Hadamard's inequality is wanted in the ℓ¹ norm, and 3.4 delivers the ℓ² one.** The paragraph
above routes through "the ℓ² norms of its rows, which are at most the ℓ¹ norms", and that is a
true route, but it takes a square root per row. The square root can instead be taken once, at the
very end, and then it need not be `Real.sqrt` at all: `Matrix.abs_det_le_prod_sum_abs`, added to
the Layer 3.4 file for this layer, bounds `|det M|` by the product of the ℓ¹ norms of the rows of
a square matrix **over an arbitrary ordered field**, with no analysis anywhere. ⚠ And Hadamard's
inequality contributes no constant at all: the `2 d` and not a `d` is 6.1's factor `2`, the price
of the coordinate `logEmbedding` drops, times the degree that converts `logHeight₁` into `h`.

⚠ **"A fundamental system because `logEmbedding` is injective modulo torsion" is not quite the
argument.** Injectivity modulo torsion says distinct classes stay distinct; what is needed is that
the `ε_i` *generate* modulo torsion, and that comes from the basis `b` spanning `unitLattice K`
over `ℤ` together with `unitLattice K` being the whole image of `logEmbedding`. That step is
`NumberField.Units.closure_sup_torsion_eq_top_of_span`, and it is what makes the existence
statement a statement about *fundamental* systems rather than about families of maximal rank.
Mathlib's own index calculus then gives the converse bookkeeping:
`NumberField.Units.regOfFamily_eq_regulator_of_closure_sup_torsion_eq_top`, a fundamental system
has the regulator of the field for its own regulator, which is what lets Hadamard's bound be
stated for it.

⚠ **Unit rank zero is not a degenerate case to be discarded; it is where the two bounds meet.**
Both products are empty, so Hadamard's bound reads `R ≤ 1` and the reduced system reads `1 ≤ R`,
and `NumberField.Units.regulator_eq_one_of_rank_eq_zero` falls out — a value Mathlib does not
record, having only `regulator_pos`. Mathlib's `MeasureTheory.volume_sum_rpow_le` wants a nonempty
index, so the volume of the ball is computed by hand there: the log space is a single point and
the ball is all of it, of volume `1 = 2^0 / 0!`. The truncated subtraction in `2^{r−1}` is exactly
what the constant wants, being `1` at `r = 0` and at `r = 1`; on the nose,
`∏_{i < r} max 1 ((i+1)/2) = r! / 2^{r−1}`.

⚠ **That neither bound is vacuous has two different sources.** 6.2 puts every member of Mathlib's
`fundSystem` strictly above height one, because its logarithmic embedding is a basis vector of the
unit lattice. For an *arbitrary* fundamental system that argument is unavailable, and the
positivity comes from 6.3 itself: such a family has maximal rank because its regulator is the
regulator of `K` and that is nonzero, and a linearly independent family has no zero member
(`NumberField.Units.prod_absLogHeight₁_pos_of_closure_sup_torsion_eq_top`). The acceptance
criteria also check that the two constants cannot both be wrong in the same direction, since the
two bounds and `regulator_pos` force `1 ≤ (2d)^r · (r!)²/(2^{r−1} d^r)`.

**6.4 S-integers and S-units** — **landed**, in `ArithmeticHeights/SUnit.lean` (Bombieri–Gubler
1.5.10). Mathlib has the objects, and this milestone
defines none: for `S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))`, `S.integer K` is the
subalgebra of `S`-integers and `S.unit K` the subgroup of `S`-units of `Kˣ`
(`Mathlib/RingTheory/DedekindDomain/SInteger.lean`), with `x ∈ S.unit K ↔ ∀ v ∉ S, v.valuation K x = 1`
by definition, `Set.unitEquivUnitsInteger : S.unit K ≃* (S.integer K)ˣ`, and `integer_empty`, so
that `S = ∅` recovers `𝓞 K` and its units. What this milestone owns is the height side: for
`x ∈ S.unit K`, the height of `x` is supported on `S` together with the infinite places,
`mulHeight₁ x = (∏_{w | ∞} max (w x) 1 ^ mult w) · ∏_{v ∈ S} max (|x|_v) 1` with the finite places
of `K` identified with `HeightOneSpectrum (𝓞 K)` as Mathlib's `FinitePlace` does; and the
converse, that an element whose finite absolute values outside `S` are all `1` lies in `S.unit K`.
Follow the naming of mathlib4#40791.

⚠ **The height identity is a statement about `S`-integers, not about `S`-units.** The milestone
states it for `x ∈ S.unit K`, and it is true there, but the only thing the proof asks of `x` is
that the local factor `max (|x|_v) 1` be trivial away from `S`, and that is `|x|_v ≤ 1`, the
defining condition of an `S`-*integer*. What the `S`-unit condition buys is the same condition for
`x⁻¹`, which is what makes the collection a group and is what 6.5 needs; for the height it buys
nothing. The file states `NumberField.mulHeight₁_eq_of_mem_integer`, with the logarithmic form
`NumberField.logHeight₁_eq_of_mem_integer` and a `Finset` form
`NumberField.mulHeight₁_eq_prod_of_mem_integer` beside it, and derives the milestone's
`NumberField.mulHeight₁_eq_of_mem_unit` from it in one line.

⚠ **The converse holds in a stronger form than the one asked for.** The milestone's converse — all
finite absolute values outside `S` equal to `1` implies `S`-unit — is the backwards direction of
`Set.mem_unit_iff_finitePlace` and costs nothing once the dictionary between places and valuations
is in place. `NumberField.mulHeight₁_eq_iff_mem_integer` says more: for `x ≠ 0` the height
identity *itself* forces `x` to be an `S`-integer, because every local factor is at least `1`, so
a single finite place outside `S` at which `|x|_v > 1` already makes the full finite product
strictly larger than its part over `S`. That is the precise sense in which `S` cannot be shrunk,
and it makes the display a characterization rather than a one-way implication.

⚠ **The whole layer is one lemma about `WithZeroMulInt.toNNReal`, applied repeatedly.**
`NumberField.FinitePlace.mk_apply_eq_one_iff` and `NumberField.FinitePlace.mk_apply_le_one_iff`
are the dictionary: `|x|_v = 1` iff `v x = 1`, and `|x|_v ≤ 1` iff `v x ≤ 1`. They are
equivalences, and not merely implications, only because the norm of a prime exceeds `1` — that is
what makes `WithZeroMulInt.toNNReal` strictly monotone, and Mathlib records the size as
`IsDedekindDomain.HeightOneSpectrum.one_lt_absNorm`. Mathlib has the dictionary itself only in the
form restricted to algebraic integers, `NumberField.FinitePlace.norm_eq_one_iff_notMem`, where the
valuation condition becomes membership in the prime. Everything else in the layer — membership in
either object, the height identity, the `S = ∅` recovery — is a consequence.

⚠ **`S = ∅` is a theorem here, not a definitional unfolding.** Mathlib's `integer_empty` says
`(∅ : Set _).integer K = ⊥` as subalgebras and `Set.unitEquivUnitsInteger` identifies the
`S`-units with the units of the `S`-integers, but composing them to reach `(𝓞 K)ˣ` goes through
`Algebra.botEquivOfInjective`. `Set.mem_integer_empty_iff` and `Set.mem_unit_empty_iff` argue
directly instead: all valuations of `x` and of `x⁻¹` are at most `1`, so both are algebraic
integers by `IsDedekindDomain.HeightOneSpectrum.mem_integers_of_valuation_le_one`, and they are
inverse to each other there. With them,
`NumberField.Units.mulHeight₁_eq_prod_infinitePlace` of Layer 6.1 is exactly the `S = ∅` case of
this layer's display, which the file checks; and `NumberField.Units.valuation_eq_one` says a unit
of `𝓞 K` is an `S`-unit for every `S`.

⚠ **The rejection test is `1/2`, and it is sharp for the reason above.** At `S = ∅` the infinite
factor of `1/2` is `1`, every infinite place giving `1/2 < 1`, while the height is `2^d`: the
whole height sits at the finite places above `2`, which is the `S` that element needs. By
`NumberField.mulHeight₁_eq_iff_mem_integer` the failure is *equivalent* to `1/2` not being an
algebraic integer, so the hypothesis cannot be weakened at all, only moved into `S`.

**6.5 The S-unit theorem** — **landed**, in `ArithmeticHeights/SUnitTheorem.lean` and
`ArithmeticHeights/SRegulator.lean` (Bombieri–Gubler, Theorem 1.5.13, where it is stated as rank
`|S| − 1` in
the book's convention that `S` contains the archimedean places). For `S` finite, Mathlib's `S.unit K`
is finitely generated of rank `r₁ + r₂ − 1 + |S|`, with torsion subgroup the roots of unity of `K`.
State the rank as #40791 does, `Set.unit_finrank_numberField :
finrank ℤ (Additive (S.unit K)) = Units.rank K + Nat.card S`, under that name, and beside it the
usable form in the shape of Mathlib's `exist_unique_eq_mul_prod`: a family of `r₁ + r₂ − 1 + |S|`
`S`-units such that every `S`-unit is uniquely a root of unity times a product of their integer
powers. Route, as in
#40791: the short exact sequence `1 → 𝓞ˣ → 𝓞_Sˣ → ⊕_{v ∈ S} ℤ` whose cokernel embeds in the class
group, with Mathlib's Dirichlet theorem giving the left-hand rank. Prove the `S`-analogue of 6.1,
that the `S`-logarithmic embedding has image a full lattice, and define the `S`-regulator as its
covolume, so that `S = ∅` recovers `NumberField.Units.regulator` definitionally.

⚠ **The class group is spent on one statement, and the class number is never named.** What the
rank computation asks of a place `v ∈ S` is a single `S`-unit whose valuation is nonzero at `v`
and zero at every other prime; the class of `v` having *finite order* in `ClassGroup (𝓞 K)`
produces one, namely a generator of `v ^ orderOf [v]`, and that is the whole use of the finiteness
of the class group. The size of the valuation at `v` is never computed, so
`IsDedekindDomain.FractionalIdeal.count` and the factorization API of
`Mathlib/RingTheory/DedekindDomain/Factorization.lean` do not appear anywhere in the layer. The
statement that carries this is `Set.exists_unitValuation_apply_ne_zero`, with
`Set.exists_mem_unit_finitePlace` beside it in the language of Layer 6.4's dictionary.

⚠ **The sequence is never exhibited as short exact, and its cokernel is never embedded in the
class group.** The milestone's route says the cokernel of `S.unit K → ⊕_{v ∈ S} ℤ` embeds in the
class group and so has finite index. Rank-nullity over `ℤ` — which holds because `ℤ` is a domain,
Mathlib's `rank_quotient_add_rank_of_isDomain` — needs much less: it needs the cokernel to have
rank zero, that is, to be a *torsion* module, and that follows from a nonzero multiple of each
basis vector lying in the image. The index is never computed and the sequence is never shown to
split, so the layer contains no class-group homomorphism at all. `Set.unitValuation` is the map,
`Set.range_unitOfUnitsₗ` its exactness at the middle, and `Set.finrank_range_unitValuationₗ` the
rank of its image.

⚠ **The left-hand end of the sequence is Layer 6.4's `S = ∅` statement, verbatim.** An `S`-unit
whose valuation is trivial at every place of `S` has trivial valuation at every place, so
`Set.mem_unit_empty_iff` says it is a unit of `𝓞 K`. That is the whole of
`Set.range_unitOfUnitsₗ`, and it is why the milestone's "with Mathlib's Dirichlet theorem giving
the left-hand rank" costs one rewrite: `NumberField.Units.finrank_eq`.

⚠ **The fundamental system is built from the torsion *submodule*, not from a group quotient.**
Mathlib's Dirichlet theorem goes through `(𝓞 K)ˣ ⧸ torsion K` as a quotient *group*, which forces
`QuotientGroup`, `MonoidHom.toAdditive` and `AddMonoidHom.toMultiplicativeRight` into every
statement around it. Quotienting the `ℤ`-module `Additive (S.unit K)` by `Submodule.torsion ℤ`
instead keeps everything linear: the quotient is finitely generated and torsion-free, hence free
over the principal ideal domain `ℤ`, and `finrank_quotient_eq_of_le_torsion` says quotienting did
not change the rank. ⚠ A consequence worth recording: **the torsion subgroup of `S.unit K` is
never shown to be finite**, and the roots of unity of `K` — which the milestone names as its
torsion subgroup — are never mentioned. Finiteness of the torsion is not needed for the rank, for
the fundamental system, or for the regulator. ⚠ And the uniqueness the milestone asks for is the
weaker of the two available: the exponent vector determines the root of unity, so
`Set.exists_unit_fundSystem'` upgrades `Set.exists_unit_fundSystem` to uniqueness of the pair, the
shape of Mathlib's `exist_unique_eq_mul_prod`.

⚠ **The two halves of "full lattice" are the two halves of 6.1 read for `S`-units, and each
consumes exactly one nontrivial input.** *Discreteness* is Northcott's theorem: by 6.4 the height
of an `S`-unit is carried by the infinite places and `S`, so a bounded embedding is a bounded
height and `NumberField.finite_setOfPred_logHeight₁_le` finishes. 6.1 recorded as an acceptance
criterion that Mathlib's `unitLattice_inter_ball_finite` *is* Northcott seen through the height,
and deliberately did not use it as a proof because Mathlib already had one; for `S`-units Mathlib
has nothing, and the reading becomes the proof
(`NumberField.SUnit.unitLattice_inter_ball_finite`). *Spanning* is Mathlib's
`unitLattice_span_eq_top` for the infinite coordinates together with the class-group generators
above, one per place of `S` (`NumberField.SUnit.unitLattice_span_eq_top`). So Dirichlet's theorem
and the class number are each consumed once in the rank computation and once here, and nothing
else is.

⚠ **The `S`-analogue of 6.1 is an identity, not an inequality**, exactly as 6.1 is:
`NumberField.SUnit.two_mul_logHeight₁_eq_sum_abs_logEmbedding_add_abs_sum` says that twice the
height of an `S`-unit is the ℓ¹ norm of the coordinates the embedding keeps plus the size of the
coordinate it drops, and the two-sided comparison is that identity plus the triangle inequality.
The dropped coordinate is recovered by the **product formula for `S`-units**,
`NumberField.SUnit.sum_mult_mul_log_add_sum_log`, which is Mathlib's `NumberField.prod_abs_eq_one`
restricted to `S`. ⚠ That restriction is where the `S`-unit hypothesis becomes load-bearing, and
6.4's finding — that the height display needs only the `S`-integer condition — marks exactly the
line: `max (|x|_v) 1 = 1` follows from `|x|_v ≤ 1`, but a *factor* of `1` in the product formula
needs `|x|_v = 1`. The rejection test is `x = 2` at `S = ∅`, an `∅`-integer that is not an
`∅`-unit, where the sum comes out `[K : ℚ] · log 2`.

⚠ **The rank is computed twice, by disjoint routes, and the agreement is a real check.**
`Set.unit_finrank_numberField` gets `r₁ + r₂ − 1 + |S|` from the class group and Dirichlet's
theorem, with no analysis anywhere; `NumberField.SUnit.finrank_unitLattice` gets the same number
as the real dimension of the space the `S`-unit lattice fills, by `ZLattice.rank`. Neither proof
uses the other, and both files check that they agree.

⚠ **`S = ∅` recovers `NumberField.Units.regulator`, but not definitionally.** The milestone asks
for a definitional recovery and there is none to be had: the index type of the `S`-logarithmic
space is `{w // w ≠ w₀} ⊕ ↥S`, and `α ⊕ Empty` is not `α`. Any indexing that keeps the two kinds
of place apart — which 6.4's display forces, the infinite places carrying the weights `mult w` and
the finite ones not — has the same obstruction. `NumberField.SUnit.regulator_empty` is therefore a
theorem, proved by transporting the covolume along the measure-preserving linear equivalence
`NumberField.SUnit.emptyEquiv` with Mathlib's `ZLattice.covolume_comap`.

## Relationship to Mathlib's height work

`Mathlib/NumberTheory/Height/` is the substrate, not a competitor: Layers 0–3 define every object in
terms of `Height.mulHeight` and its API, so there is nothing at the foundational level for this
roadmap to duplicate. Two open Mathlib pull requests do cover named milestones above.

1. **Extension invariance (Layer 0.3) is mathlib4#41606.** Build it here now with that PR's names
   and signatures — `mulHeight₁_pow_finrank`, `mulHeight_pow_finrank`, `finrank_nsmul_logHeight₁`,
   `finrank_nsmul_logHeight`, `absMulHeight₁_eq` — and cite it in the Tau Ceti file that carries
   them. Whenever the working Mathlib dependency contains them, delete ours and import Mathlib's;
   because the names and shapes match, that is a deletion plus an import rather than a rewrite, and
   Layer 0.4 and everything downstream are unaffected. ⚠ The PR's own bridging lemma
   `InfinitePlace.liesOver_iff_comap_eq` is deliberately **not** in that list: Mathlib has since
   acquired the infinite-place ramification theory, and 0.3's route needs neither. ⚠ One name in
   that file is **not** the PR's: `absLogHeight₁_eq`, the logarithmic form of `absMulHeight₁_eq`,
   which Layer 6.1 needed and which the PR does not carry. When Mathlib's version lands, that one
   lemma stays.
2. **The S-unit theorem (Layer 6.5) is mathlib4#40791.** The same applies: follow its short-exact-
   sequence route, its carrier `Set (HeightOneSpectrum (𝓞 K))`, and its rank formula, and delete
   ours when Mathlib's lands. The `S`-regulator and the height characterization in 6.4 are not in
   that PR and stay here. ⚠ **Landed**, as `Set.unit_finrank_numberField` under that exact name and
   with that carrier, so the eventual adoption is a deletion plus an import for the rank statement
   alone. What would survive the deletion is everything the PR does not carry:
   `Set.exists_unit_fundSystem` and `Set.exists_unit_fundSystem'`, the whole of
   `ArithmeticHeights/SRegulator.lean` — the `S`-logarithmic embedding, its comparison with the
   height, the `S`-unit lattice and the `S`-regulator — and, in 6.4, the height characterization.
   ⚠ And the route taken here is *weaker* than the PR's in one respect worth keeping: the
   cokernel is shown to be torsion rather than embedded in the class group, so no class-group
   homomorphism is constructed and `Set.finrank_range_unitValuationₗ` is independent of whatever
   shape that map ends up having upstream.
3. **Everything else is ours.** The Arakelov normalization, the affine and absolute tuple heights,
   Northcott
   with varying degree, Kronecker for the height, polynomial and matrix heights, the Plücker point
   and the subspace height with its duality, successive minima and Minkowski's second theorem with
   the extraction and cube-slicing lemmas beside them, and both forms of Siegel's lemma over a
   number field are absent from Mathlib and from the open PRs.
   Where Mathlib records a TODO covering one of them — `Height/Northcott.lean` asks for the
   projectivization instances of Layer 1.1, `Height/Basic.lean` asks for `AdmissibleAbsValues`
   instances on finite extensions, which Layer 0.3 supplies the arithmetic for — build it here and
   say in the file that Mathlib records the same gap. ⚠ Layer 3.1 also needs four lemmas that are
   not about heights at all and belong in Mathlib's linear algebra rather than here:
   `exteriorPower.ιMulti_eq_zero_iff` and the membership criterion
   `exteriorPower.ιMulti_snoc_eq_zero_iff` built on it, its scaling stability
   `exteriorPower.ιMulti_snoc_smul`, and `linearIndependent_fin1`. They are stated in the Layer 3.1
   file for want of anywhere better; unlike the height material they should be upstreamed on their
   own, not carried to Tau Ceti. Layer 3.2 adds two more of the same kind, each sitting beside a
   statement Mathlib does have: `Set.powersetCard.subsingleton_iff`, the negation of Mathlib's
   `Set.powersetCard.nontrivial_iff`, and `Projectivization.mulHeight_eq_one_of_subsingleton`, the
   projective form of Mathlib's `Height.mulHeight_eq_one_of_subsingleton` — the second about
   Mathlib's own height, so it is a gap in `Height/Projectivization.lean` rather than in this
   roadmap. Layer 3.3 adds three more that mention no height at all — `Matrix.row_one_eq_basisFun`,
   `Matrix.span_range_row_one` and `Matrix.linearIndependent_row_iff_rank_eq` — and leaves one
   *unproved*: the expansion of an alternating map along a matrix,
   `f (fun i ↦ ∑ j, U i j • v j) = U.det • f v`, which Mathlib has in no form and which 3.3 turned
   out not to need. Layer 3.4 is the largest contribution of this kind and none of it is about
   heights: **the Cauchy–Binet identity itself** is not in Mathlib in any form, nor are **Hadamard's
   inequality** `det (A Aᵀ) ≤ ∏ᵢ ‖Aᵢ‖²` and **Fischer's**, the generalized Hadamard inequality, nor
   the determinant monotonicity `det (V Vᵀ) ≤ det (V Vᵀ + W Wᵀ)` and its column-deletion companion
   that this roadmap proves them from, nor `Pi.basisFun_toDual_apply`, that `Module.Basis.toDual` of
   the standard basis is the dot product. All of them belong in `Mathlib/LinearAlgebra/Matrix/`.
   ⚠ One item on this list is a *packaging* bug rather than a gap:
   `LinearMap.BilinForm.exteriorPower` exists and is exactly the construction 3.4's proof wants, but
   its defining equation `LinearMap.BilinForm.bilinForm_ιMulti_ιMulti` is not exported from its
   module, so nothing outside that file can say what the form does without re-proving it. Report it
   upstream rather than shadowing it.
   Layer 3.5's contribution of this kind is about Mathlib's **own heights**, not about linear
   algebra: `Height.mulHeight_eq_of_forall_eq_or_eq_neg`, that a height does not see a
   per-coordinate change of sign. Mathlib has the reindexing and scaling invariances and not this
   one, and `Height.mulHeight_neg` does not exist at all; duality needs the signed version because
   Schmidt's involution attaches a sign that depends on the index. The Arakelov and absolute
   companions are ours to keep, but the relative one belongs in `Height/Basic.lean`. What 3.5 does
   **not** need, and what Mathlib is also missing, is worth recording all the same: the generalized
   Laplace expansion of a determinant along a block of rows and Jacobi's identity for the
   complementary minors of an inverse, the two classical routes to duality. ⚠ The first of those
   is no longer missing here: 3.6 proves it, as `exteriorPower.det_append_eq_sum`.
   Layer 3.6 adds three more that are pure linear algebra: **Koteljanskii's inequality** for Gram
   determinants — `det (M Mᵀ) · det (A Aᵀ) ≤ det ((A;B) (A;B)ᵀ) · det ((A;C) (A;C)ᵀ)`, the
   submodular strengthening of Fischer's — the **Hermitian form of Fischer's inequality**, which
   `ℂ` needs and the ordered-field statement does not cover, and the two `Fin.append` lemmas
   `Submodule.span_range_append` and `LinearIndependent.append`, which hold over any ring and are
   the kind of thing `Mathlib/LinearAlgebra/` should have had already. The nonarchimedean half of
   3.6 adds two more: the **Grassmann–Plücker comultiplication**
   `exteriorPower.plucker_append_eq_sum`, which is the multiplication table of the exterior algebra
   in the Plücker basis and, read on determinants, the **Laplace expansion along a block of rows**;
   and the **local normalization** `exteriorPower.exists_integral_basis`, the `Oᵥ`-basis of a
   saturated lattice obtained by Cramer's rule, which is stated for an arbitrary absolute value and
   needs no valuation-ring structure theory. ⚠ Mathlib's own
   `Set.powersetCard.permOfDisjoint` — the shuffle permutation that would name the signs of the
   comultiplication explicitly — has **no API at all**, not one lemma relating it to
   `Finset.orderEmbOfFin`; 3.6 works around it by defining the structure constants as Plücker
   coordinates of standard-basis wedges and proving separately that they are signs. That gap is
   worth reporting upstream.

Follow Mathlib's shape in all of it: the multiplicative-primary-plus-logarithmic pairing, the
`lift`-from-a-representative construction for any function *defined on* a projective space, the
`Northcott` typeclass rather than bare finiteness statements, and `positivity` extensions for every
new height. ⚠ The `lift` pattern does not extend to constructions that *land in* a projective
space: 3.1 maps into one, from data (a basis) that is not a projectivization, and uses a chosen
representative plus an independence theorem instead.

## Worked examples (acceptance criteria, keeping the definitions honest)

Each of these is a cheap check that a definition means what it should; they belong in the Tau Ceti
files as `example` s.

- `Height.mulHeight₁ (3 / 4 : ℚ) = 4`, from Mathlib's `Rat.mulHeight₁_eq_max`. A definition of the
  rational height that does not give `4` here has the numerator and denominator confused.
- `NumberField.absMulHeight₁ (√2) ^ 2 = 2`, while the relative height of `√2` over `ℚ(√2)` is `2`.
  Together these exercise Layer 0.3 and 0.4: the same number, two fields, one absolute height.
- `arakelovMulHeight ![1, 1] = √2` over `ℚ`, whereas `Height.mulHeight ![1, 1] = 1`. The two
  normalizations genuinely differ, so the `√N` in 5.5 and the `H_Ar` on the right of 5.3 and 5.4 are
  not cosmetic, and a proof that silently interchanges the two heights is wrong.
- `{x : Fin 2 → ℚ | Height.mulHeight x ≤ 1}` is infinite: it contains `c • ![1, 1]` for every
  `c ≠ 0`. A `Northcott` instance for `Height.mulHeight` on tuples is refuted here; 1.1's instances
  are for `Projectivization.mulHeight`.
- `Height.mulHeightAff (![2] : Fin 1 → ℚ) = 2` while `Height.mulHeight (![2] : Fin 1 → ℚ) = 1`:
  the affine height of 0.5 is not the projective one, and is not scaling-invariant. A definition
  that made the two agree has appended the wrong coordinate, and any bound on the value of a
  linear form or on a determinant stated with the projective height is refuted here.
- `Polynomial.mulHeight (C 2 : ℚ[X]) = 1`, not `2`, and `Polynomial.mulHeight (X - C 2) = 2`: a
  constant has height one, and the affine height `mulHeight₁ a` is the height of the linear
  polynomial with root `a`, not of the constant `a`.
- Over `ℚ(i)`, `A = ![![1, 1]]` and `B = ![![N, 0], ![N, 1]]` have `Matrix.mulHeight (A * B) = 4N²`
  against `Matrix.mulHeight A · Matrix.mulHeight B = N²`: the product bound of 2.5 needs the
  relative constant `2 ^ totalWeight K = 4`, and the absolute constant `2` is refuted. The same
  test, with `2 ^ (deg p + deg q)` against `2 ^ ((deg p + deg q) · totalWeight K)`, is the one to
  run on 2.3 over a field of degree `> 1`.
- `absMulHeight₁ ζ = 1` for `ζ` a primitive fifth root of unity, and `absMulHeight₁ x = 1` for `x`
  transcendental — the second by the junk value, not by Kronecker. A statement of 1.4 without an
  algebraicity hypothesis is refuted by the second example; this is the rejection test for that
  layer. ⚠ The second cannot be written as the pinned
  `absMulHeight₁ (Real.pi : ℂ) = 1`: **Mathlib has no transcendence of `π`**, nor of `e`. Both 1.3
  and 1.4 state the test in hypothesis form instead — a non-integral element has height `1`, and
  is neither zero nor a root of unity — which refutes the same statement and exhibits no
  transcendental number.
- `exteriorPower.plucker 2 ![![1, 2], ![3, 4]] = -2` at the one index available, over `ℚ`: in top
  rank the single Plücker coordinate is the determinant `1 · 4 - 2 · 3`. In rank one, the
  coordinate at the singleton `{i}` is `x i`. A construction that normalized the wedge, or that
  enumerated the columns of a subset in any order but the increasing one, is refuted by the first;
  one that appended a coordinate, as the affine height of 0.5 does, by the second.
- `Submodule.mulHeight (span ℚ {![1, 2, 3]}) = 3`, agreeing with the projective height of
  `[1 : 2 : 3]`, and `Submodule.mulHeight (⊤ : Submodule ℚ (Fin 3 → ℚ)) = 1`.
- Non-monotonicity: in `Fin 2 → ℚ`, `Submodule.mulHeight ⊤ = 1` while
  `Submodule.mulHeight (span ℚ {![1, N]}) = N` for every `N ≥ 2`, although `![1, N], ![0, 1]` is a
  basis of `⊤`. Any statement bounding the height of a subspace, or of a basis vector, by the height
  of a space containing it is refuted here; 3.6's product bounds are what submodularity gives —
  in the Arakelov normalization only, as the ⚠ under 3.6 records.
  ⚠ Both of these are machine-checked in the Layer 3.2 file, at `N = 3` and in `Fin 2 → ℚ` rather
  than `Fin 3 → ℚ`: the line's value is `mulHeight_span_singleton` followed by Mathlib's
  `Rat.mulHeight₁_eq_max`, and the ambient value is `mulHeight_top`, so the refutation costs
  nothing beyond the two statements the milestone already asks for.
- The three maximal minors of `A = ![![1, 0, 2], ![0, 1, 3]]` over `ℚ` are `1`, `3` and `-2`, at the
  column sets `{0,1}`, `{0,2}` and `{1,2}`. A construction that enumerated a column set in any order
  but the increasing one is refuted by the sign of the third. ⚠ Machine-checked at 3.3.
- Row operations: for `U = ![![1, 0], ![3, 1]]` over `ℚ`, which has `det U = 1`, the row space of
  `U · 1` is that of `1`, so the two have the same subspace height, while `Matrix.mulHeight` rises
  from `1` to `3`. The height of the entries is therefore not a function of the row space, the
  pinned convention above is not a notational preference, and the naïve Siegel bound of 5.1 is not
  invariant. ⚠ Machine-checked at 3.3; `Rat.mulHeight_eq_max_abs_of_gcd_eq_one` is what makes
  checks of this shape cheap, and it is the tool to reach for in every worked example over `ℚ`.
- Cauchy–Binet on the same `A = ![![1, 0, 2], ![0, 1, 3]]`: `det (A Aᵀ) = 14`, which is
  `1² + 3² + (-2)²`, the sum of the squares of the three minors above — produced from a `2 × 2`
  determinant without enumerating a single minor, which is the whole point of the identity. And
  `det (Aᵀ A) = 0`, because `Aᵀ A` is `3 × 3` of rank `2`: a statement of Cauchy–Binet with the two
  factors in the other order is refuted here, and so is any reading of `√|det (A Aᵀ)|` in the
  Bombieri–Vaaler bound as the Gram determinant of the columns. ⚠ Machine-checked at 3.4.
- The generalized Hadamard inequality on the same `A`: `14 ≤ 5 · 10 = 50`, strictly, the gap being
  the square of the inner product `6` of the two rows; while for the orthonormal rows of the `2 × 2`
  identity it is an equality, `1 = 1 · 1`. So the inequality is neither an identity nor reversible
  with any constant better than `1`, and a proof that produced equality in the first case has lost
  the cross terms. ⚠ Machine-checked at 3.4.
- Duality on a worked case: for `A = ![![1, 1, 1]]` over `ℚ`, the row space and `V = ker A` satisfy
  `H_Ar(rowSpace A) = √3` (Cauchy–Binet: `det (A Aᵀ) = 3`), so 3.5 forces `H_Ar(V) = √3` too. The
  basis `![1, -1, 0], ![0, 1, -1]` of `V` has `∏ H = 1`, inside the 5.4 bound
  `|D_ℚ|^{2/2} · √3 = √3` since `D_ℚ = 1`. A version of 3.5 that produced anything but `√3` on both
  sides here has the minors indexed wrongly, and one that produced `1` has confused the Arakelov
  height with the sup-norm height. ⚠ The identity `H_Ar(ker A) = √3` is machine-checked at 3.5; the
  small basis and the 5.4 bound around it wait for Layer 5.
- Duality in the sup-norm normalization, where the two sides are not `1`: the line `x₀ + 3x₁ = 0`
  in `ℚ²` has height `3`, the height of the single row `(1, 3)` cutting it out. The same example
  refutes the statement of duality for an arbitrary *complement* rather than the annihilator: the
  line spanned by `(0, 1)` is a complement of the line spanned by `(1, 3)` and has height `1`
  against `3`. ⚠ Machine-checked at 3.5.
- The isotropy that shapes the proof of 3.5: over `ℂ` the line spanned by `(1, i)` lies inside its
  own orthogonal complement, `1 · 1 + i · i = 0`. So a subspace and its orthogonal complement need
  not be complementary, the stacked matrix of the two bases is singular, and no proof of duality may
  expand its determinant. ⚠ Machine-checked at 3.5.
- Submodularity fails in the sup-norm normalization: the lines `ℚ · (1, 1, 1)` and
  `ℚ · (1, -1, 0)` in `ℚ³` have `Submodule.mulHeight` `1` each and span a plane of height `2`, so
  `H(V + W) · H(V ∩ W) = 2 > 1 = H(V) · H(W)`, and the product bound for the sum fails on the same
  pair. A statement of 3.6 for `Submodule.mulHeight` is refuted here, and so — after transport
  through 3.5 — is the product bound for the intersection. ⚠ Machine-checked at 3.6.
- The same pair in the ℓ² normalization, where the inequality holds with equality: the two rows are
  orthogonal, `det (A Aᵀ) = 6 = 3 · 2`, so the archimedean local factor of the Arakelov height
  obeys 3.6 exactly here. Together with the previous example this locates the failure in the
  normalization rather than in the mathematics, and shows the inequality of 3.6 is sharp.
  ⚠ Machine-checked at 3.6.
- Conformance for 3.6: for any pair of subspaces of a number field, one adapted triple of families
  carries all four Arakelov heights of the milestone, and at *every* place — the ℓ² factor at the
  infinite ones and the Gauss norm at the finite ones — the four Plücker tuples satisfy the local
  inequality. The theorem is the product of those over all places, and this example is the
  statement with the product not yet taken, which is where a proof that confused the two local
  factors would break. ⚠ Machine-checked at 3.6.
- The second route to the finite places, as its own example: the submultiplicativity
  `‖p(B;C)‖ᵥ ≤ ‖p(B)‖ᵥ · ‖p(C)‖ᵥ` read straight off the Grassmann–Plücker comultiplication and the
  ultrametric inequality, rather than off the local normalization the file beside it uses. Two
  independent proofs of the same inequality, and the example is what keeps them stated as the same
  inequality. ⚠ Machine-checked at 3.6.
- Northcott for subspaces without a height bound: `{V : Submodule ℚ (Fin 2 → ℚ) | finrank ℚ V = 1}`
  is infinite, since the lines `ℚ · (1, n)` are pairwise distinct. So it is the height bound and not
  the rank condition that makes 3.7's set finite, and a proof that reached finiteness from the rank
  alone — from finitely many *ranks*, say — proves something false. ⚠ Machine-checked at 3.7.
- The payoff of the instance form, which the finiteness statement alone does not give: every
  nonempty set of subspaces of `ι → K` contains one of least height, by
  `Northcott.exists_min_image`. A milestone stated as a `Set.Finite` and not as a `Northcott`
  instance does not support this, and it is the form later layers want. ⚠ Machine-checked at 3.7.
- The successive minima are not monotone in the index: `λ 0 > 0` while `λ n = 0` for `n` the
  dimension, since above the dimension there is no independent family at all and the infimum is
  taken over the empty set. Any statement about the minima that ranged over all of `ℕ` — a product
  over more than `Finset.range n` in Minkowski's second theorem, say — is refuted here, and so is
  any reading of the junk value as "no constraint" rather than "zero". ⚠ Machine-checked at 4.1.
- Attainment in the body fails for an open body: for the open unit ball there is **no** lattice
  vector in `λ 0 • B`, because anything in that dilation lies in a strictly smaller one, which
  contradicts the infimum. So the `IsClosed B` in the body form of Cassels' Lemma 1 is not a
  convenience, and the gauge form — which needs no closedness — is the sharp statement. A proof of
  4.2 or 4.6 that took the body form for granted on an open body proves nothing.
  ⚠ Machine-checked at 4.1.
- Shrinking one coordinate can leave a symmetric convex body: the parallelogram `|x| ≤ 1`,
  `|19x − 20y| ≤ 1` in `ℝ²` contains `(1, 19/20)` but not `(9/10, 19/20)`. So the linear map whose
  determinant is `∏ λ i` need not map the body into itself, the upper bound of Minkowski's second
  theorem is not a packing statement about any one set, and a proof of 4.2 that "compresses along
  a basis realizing the minima" proves nothing. ⚠ Machine-checked at 4.2.
- The covolume identity (4.3) over `ℚ`, `V = span ℚ {![1, 1]}` in `ℚ²`: the integral points are
  `ℤ · (1, 1)`, of covolume `√2`, and `H_Ar V = ‖(1, 1)‖₂ = √2`. Against the index-two sublattice
  `2ℤ · (1, 1)` the covolume is `2 √2` while the height has not moved, so the identity is **false**
  for an arbitrary full-rank sublattice of `V ∩ ℤ²`: saturation is what makes it true, and a proof
  that took any `ℤ`-basis of any sublattice would prove something false. ⚠ The identity is
  machine-checked at 4.3; the sublattice comparison is arithmetic on top of it.
- The covolume identity (4.3) over `K = ℚ(i)`, `V = span {![1, -1]}` in `K²`: the lattice
  `ℤ[i] · (1, −1)` inside `ℂ · (1, −1)` has covolume `2`, and
  `2^{−r₂} · √|discr K| · H_Ar(V)^d = (1/2) · 2 · (√2)² = 2`. A version of 4.3 without the
  `2^{−r₂ k}` fails this by a factor of `2`, and one with the sup-norm height in place of the
  Arakelov height fails it by `(√2)^d = 2`; both errors are invisible over `ℚ`, which is why this
  check is over `ℚ(i)`. ⚠ Machine-checked at 4.3 in the general form, which is the stronger
  statement: the constant is `covolume (𝓞 K) ^ k` on the nose.
- The covolume identity (4.3) again, over a field of class number `h > 1`: `K = ℚ(√−5)`, `h = 2`,
  `V = span {![2, 1 + √−5]}` in `K²`, for which `V ∩ (𝓞 K)²` is isomorphic to the non-principal
  ideal `(2, 1 + √−5)` and is not free. Every other check here is over a principal ideal domain and
  so cannot detect a proof that assumes a basis exists; 4.3's route does not need one, and this
  example is the regression test that the Lean proof did not quietly acquire the assumption.
  ⚠ The landed proof builds the pseudo-basis `𝔞₁ y₁ ⊕ ⋯ ⊕ 𝔞_k y_k` rather than a basis, so the
  case is handled head-on: `Submodule.exists_pseudoBasis` is where this example would fail, and it
  is stated over an arbitrary Dedekind domain.
  ⚠ These last two checks are exactly the ones `ℚ` cannot see — the `2^{−r₂}`, the discriminant and
  non-freeness are all invisible there — which is why the `ℚ` case settled the *shape* of the
  milestone and none of its constants, and why the `K` case had to be done separately rather than
  by generalizing the `ℚ` file.
- `Polynomial.mulHeight ((X - 1) * (X + 1) : ℚ[X]) = 1` while
  `mulHeight (X - 1) * mulHeight (X + 1) = 1`: Gelfond's factor `2^deg` is an upper bound that is
  far from attained, which is the point of recording the sharp Mahler-measure statement in 2.3.

## Ordering

Layer 0 first: nothing downstream can state a constant without 0.2, and 0.3 is the milestone whose
Mathlib counterpart is already in flight. Within it, 0.5 depends on nothing at all — not even on a
number field — and both of Layer 2's non-homogeneous bounds are blocked without it. Layer 1 next, and it is the natural first substantial
contribution — 1.1 discharges a Mathlib TODO, and 1.2 through 1.5 need nothing but Layer 0 and
Mathlib's Mahler measure. Layers 2 and 3 are independent of each other and both depend only on
Layers 0–1; Layer 3 is the more valuable and the more delicate, and 3.1 should be settled before
anything else in it is attempted, because every later statement is about the object it constructs.
⚠ 3.1 itself depends on **nothing** in this roadmap: the Plücker point is linear algebra, it needs
no absolute values and no height, and its file imports none. Together with 0.5 it is one of the two
milestones that can be claimed before anything else exists, and it is the one that unblocks the
layer the roadmap is for. ⚠ 3.2 then adds only Layers 0.1 and 0.4 to that — the two normalizations
it carries beside Mathlib's — so nothing in Layer 1 or Layer 2 is used anywhere in 3.1–3.2, and the
pair can be built before either. 3.3 adds 2.5 to that, and only for a worked example, through a
non-`public` import. ⚠ 3.4 adds nothing: the Cauchy–Binet identity and the generalized Hadamard
inequality are linear algebra over a commutative ring and over an ordered field respectively, and
they import Layer 3.3 only for the `submatrix` spelling of a maximal minor. So the whole of 3.1–3.4
is claimable before Layers 1 and 2 exist, and 5.2 — which needs 3.4, 3.5, 4.2, 4.5 and the
`ℚ`-case of 4.3 — inherits no Layer 1 or 2 dependency through it. ⚠ 3.5 adds nothing either, and in particular
does **not** need 3.4: duality is elementary matrix algebra on top of 3.3, so the chain
3.1 → 3.2 → 3.3 → 3.5 runs beside 3.4 rather than after it, and a contributor can take either
branch first.
⚠ 3.6 is the exception: it is the first milestone in Layer 3 that consumes two others, 3.4 for the
archimedean inequality and 3.5 for the refutation that fixes its normalization, so the two branches
rejoin there. Its finite-place half adds nothing to that: it is a self-contained file over an
arbitrary nonarchimedean absolute value, importing only 3.1, and could have been built before
anything else in Layer 3 except the Plücker point itself.
⚠ 3.7 rejoins nothing and skips most of the layer: it needs 3.1, 3.2 and **1.1**, and none of
3.3–3.6. It is the first milestone in Layer 3 to consume anything from Layer 1, and the only one
that does; a contributor who has 3.1 and 3.2 can land it without touching duality, Cauchy–Binet or
submodularity.
Layer 4 touches Layers 1–3 only through 4.3, whose statement uses the subspace height of 3.2 and
whose `ℚ`-case is Cauchy–Binet (3.4); 4.1 and 4.2 are real-analytic geometry of numbers, 4.4 is
self-contained linear algebra, 4.5 is self-contained real analysis — claimable on its own — and
4.6 is lattice algebra on top of 4.1, so most of the layer can be built in parallel from the start
by someone who prefers those subjects. ⚠ 4.6's pricing needs one correction: it is lattice algebra
on top of 4.1 *and 4.2's adapted basis*, which is where its induction lives — `MinimaBasis.lean`
imports `AdaptedBasis.lean` and `SuccessiveMinima.lean` and nothing else.
⚠ Both cases of 4.3 confirm the dependency exactly:
`ArithmeticHeights/RationalLattice.lean` imports 3.2 for the height and 3.4 for Cauchy–Binet, and
nothing else from Layers 1–3 — not 3.3, not duality, not submodularity — and
`ArithmeticHeights/NumberFieldLattice.lean` has the same profile, 3.2 directly and 3.4 through
`MixedLattice.lean`, with 3.1 arriving under both.
⚠ 4.1 confirms this in the strongest form available: its file imports nothing from
`ArithmeticHeights` at all, only Mathlib's `ZLattice`, `gauge` and geometry of numbers. It is the
third milestone — with 3.1 and 0.5 — that could have been the first thing built in this repository,
and the only one of the three that later layers need on *both* branches, since 4.6 and 6.3 want its
attainment statement and 5.2–5.4 want it through 4.2.
⚠ 4.4 confirms it in the same form, and is now the fourth such milestone:
`ArithmeticHeights/Extraction.lean` imports three Mathlib linear-algebra files and nothing else.
It is the cheapest entry point left in the repository — no number theory, no measure, no lattice.
⚠ 4.5 confirms its own pricing, "self-contained real analysis", in the same form and to the end:
its six files import nothing from `ArithmeticHeights` but each other, and nothing from Layers 0–3
at all. It is the largest self-contained block in the repository and the one furthest from number
theory: everything in it is Mathlib measure theory, convexity and the Gaussian.
Layer 5 needs 3 and 4 together; 5.1 needs neither and can land
early as the acceptance test for the vocabulary, and 5.2 needs only 3.4, **3.5**, 4.2, 4.5 and the
`ℚ`-case of 4.3 — **all five of which are landed, and so, since 2026-09-19, is 5.2.**
⚠ **5.2 is landed, and it is the first pure assembly in the repository**:
`ArithmeticHeights/BombieriVaaler.lean` imports 3.5, 4.2, 4.3(`ℚ`), 4.5 and 5.1 — the last only for
the translation lemma behind the height form — and reaches 3.1–3.4 through them. It introduces no
theory: every step is a theorem that was already here, and the file's own content is the two
bookkeeping lemmas that let them meet (`Submodule.cubeSlice` with its five elementary properties,
and `NumberField.gcd_mul_arakelovMulHeight_intCast`). ⚠ **5.1 is landed, and its pricing was
right**:
`ArithmeticHeights/Siegel.lean` imports Layer 0.4 (for the absolute height of the number-field
corollary) and two Mathlib files, and nothing from Layers 1–4. It is the fifth milestone that
could have been built before anything else in this repository, and the cheapest of the five for a
contributor who wants a finished Layer 5 statement rather than infrastructure.
⚠ 4.2, 4.3 and 4.4 are all landed in full. Of 4.2: 5.2–5.4 and 6.3 all
consume the *upper* bound `(∏ λ i) · vol B ≤ 2ⁿ · covolume L`, which is
`ZLattice.prod_successiveMinimum_mul_measure_le`, while the lower bound is what the cross-polytope
gives for free. The layer's real cost sat in that one inequality, and it rests on Cassels' Theorem
IV in one step, `ZLattice.pow_mul_measure_inter_add_le` of `QuotientFubini.lean`, chained once per
minimum. **Layer 4 is now complete**: 4.6 landed as the induction of `AdaptedBasis.lean` with a
choice made at each step, so it needed no theory Mathlib lacks and no theory this repository
lacked either.

Two consequences of the milestones as now stated are worth having in view when choosing what to
claim. **Layer 5's `ℤ` half is finished**: 5.1 is landed in both its forms, so the vocabulary it
tests — `Height.mulHeight` against the sup norm, `NumberField.absMulHeight` against the house — is
pinned by theorems rather than by convention, and 5.2 is landed with it, so the invariance under
`A ↦ U A` that 5.1 does **not** have is now a theorem here
(`Int.Matrix.sqrt_det_div_minorGcd_unit_mul`), which is the whole reason 5.2 exists.
**The `ℚ` spine is finished.** The spine
4.1 → 4.2 → 4.3(`ℚ`) → 4.5 → 5.2 is Bombieri–Vaaler's Theorem 1 in basis form at the sharp
constant, with a written model proof at every step (Aliev–Henk §6 for the assembly,
Bombieri–Gubler C.3 for 4.5, Cassels VIII for 4.2), and it needs neither 4.4 nor any number field.
⚠ Its pricing needed one correction, recorded at 5.2: the assembly also consumes **3.5**, because
4.3 delivers the height of the *solution space* while the bound is stated in the minors of `A`, and
carrying one to the other is the duality theorem. With 5.2 landed, every rung of the spine is
machine-checked and the first published theorem of the summit is in the library.
**Over a number field there is now no open Layer 4 milestone at all — on the critical path or off
it.** The
Hermitian form 5.3 — Bombieri–Vaaler at their own constant — needs 4.1–4.4 and no cube slicing, so
4.5 buys the *sup-norm* normalization of 5.2 and 5.4 rather than the sharpness of either.
⚠ **5.3 is landed, since 2026-09-19, and the pricing held exactly: 4.1, 4.2, 4.3 over `K`, 4.4,
3.5 for the row space — and no 4.5.** What the pricing did not say is where the work is. It is not
in the arithmetic, which is four short lemmas, but in the *geometry*: the milestone's body is the
product over the infinite places of the ℓ² unit balls, and its slice by the real span of `V` has
to be *computed*, not estimated. `ArithmeticHeights/MixedBall.lean` does that, and it is the
larger of the two files.

⚠ **5.4 is landed too, since 2026-09-19, and with it the summit.** It is 5.3 with the balls
replaced by cubes and polydiscs, and there 4.5 finally pays — once, and nowhere else in the
roadmap. The geometry is much lighter than 5.3's, because the slice bound is Vaaler's theorem
rather than a computation, and the work moved to the *normalization* of the body: see the ⚠ at
5.4.

⚠ **5.5 is landed too, since 2026-09-19, and the pricing was right except for one place.** It is
5.4 plus 3.4's Hadamard inequality and the assembly over all places, as the ordering said — but
3.4's inequality as delivered is the one in an ordered field, and what an infinite place produces
is the Hermitian one, so 3.4 had to grow a statement before 5.5 could consume it. Nothing else
was missing: no new lattice geometry, no new measure theory, and no rank hypothesis.

⚠ **5.6 is landed too, since 2026-09-19, and its price was not in Layer 5 at all.** The ordering
called it 5.5 over a finite extension, and the Siegel half of it is exactly that: descend the
system to `K`, quote 5.4, extract. What the ordering did not price is that the descended system's
row space has to be compared with the rows of `A` over `F`, and that comparison runs through the
**conjugates** — so it needs the absolute Arakelov height to be invariant under an embedding, and
therefore the extension law for the Arakelov normalization, neither of which Layer 0 had. Both
are now in Layer 0, where they belong, and nothing in Layers 1–4 was touched. The other cost was
a shape, not a theorem: the descended system's rows are indexed by a product, so 5.4 and part of
5.5 had to stop saying `Fin m`.

⚠ **5.7 is landed too, since 2026-09-19, and with it the whole of Layer 5.** The ordering called
it 5.5 and 5.6 applied to the coefficient space of a polynomial, and that is what it is: no new
geometry, no new height, and nothing added to Layers 0–4. What it did cost is two things the
ordering did not name. The monomials of degree at most `D` had to be given a cardinality, which
Mathlib supplies for degree *exactly* `D` and not for degree at most `D` — one equivalence, the
slack variable. And its relative form needs 5.6's feasibility hypothesis stated with the **rank**
of the condition matrix rather than its number of rows, which is a genuine strengthening of 5.6
and which 5.6 as landed did not have: vanishing conditions on a polynomial repeat, so the
row-count form is the wrong one to expose. **Layer 6 is what should be claimed next**, and it is
independent of everything in Layers 2–5.

⚠ **6.1 is landed too, since 2026-09-19, and it cost nothing the ordering did not foresee.** It is
the dictionary between Mathlib's `logEmbedding` and the height, and its only external need was one
missing logarithmic form in Layer 0 (`NumberField.absLogHeight₁_eq`), added there. The finding is
about sharpness rather than about cost: the two identities the milestone warns against are refuted
by a criterion — they hold exactly when the distinguished place is small, respectively trivial — so
the factor `2` in the comparison is a theorem about `w₀` and not an artefact.

⚠ **6.2 is landed too, on the same day, and it did not need what the ordering said it would.** The
ordering priced it at "1.4 and Mathlib's `logEmbedding_ker`, both in hand", and neither turned out
to be on the critical path: 6.1 already writes twice the height of a unit as a sum of absolute
values over the infinite places, so it vanishes exactly when every term does, and that condition
is Mathlib's `mem_torsion` verbatim. Where 1.4 *is* used is in dropping the unit hypothesis — a
nonzero algebraic integer of height one is a unit — which the milestone did not ask for and which
is what makes "units of height one" the complete description.

⚠ **6.3 is landed too, on the same day, and the ordering priced it correctly.** It is the one
milestone of Layer 6 that reaches back into Layer 4, and it spent exactly what the ordering said
it would: 4.2's substantial half against the ℓ¹ ball of the log space, 4.6's basis from the
minima, 6.1's comparison, and — for the non-vacuity — 6.2's gap. What it also needed and the
ordering did not name is a square-matrix corollary of 3.4, `Matrix.abs_det_le_prod_sum_abs`, and
the step that turns a basis of the unit lattice into a generating set modulo torsion.

⚠ **6.4 is landed too, and it was the cheap half the ordering said it was.** It defines nothing,
and the cost was one dictionary lemma between Mathlib's `NumberField.FinitePlace` and the adic
valuations of `IsDedekindDomain.HeightOneSpectrum`; everything the milestone asks for, and the
strengthenings above, follow from it and from `Height.mulHeight₁`'s own decomposition over the
places. It reaches back into no other layer: 6.1 appears only as the `S = ∅` conformance check.
⚠ **6.5 is landed too, and it was the expensive one the ordering said it was — but not where the
ordering expected.** It is the one milestone of Layer 6 with real infrastructure behind it, and it
consumed two nontrivial inputs, Dirichlet's theorem and the finiteness of the class group, each
exactly twice: once in the rank computation and once in the lattice. What it did *not* need is
most of the named route. The cokernel is never embedded in the class group — rank-nullity over
`ℤ` needs only that it be torsion; the class number is never named, only the finite order of one
class; the torsion subgroup of `S.unit K` is never shown to be finite; and the definitional
recovery of `NumberField.Units.regulator` at `S = ∅` is impossible for a type-theoretic reason and
is a theorem instead. What it needed and the ordering did not name is 6.4's *product formula* side
— the `S`-unit hypothesis that 6.4 found the height display does not need — and Northcott's
theorem, which supplies the discreteness that Mathlib proves by hand for its own unit lattice.
6.4's `NumberField.mulHeight₁_eq_prod_of_mem_integer`, the `Finset` form of the display, is what
6.5 consumed, `S` there being finite.

⚠ **With 6.5 the roadmap has no open milestone left.** `Roadmap/Suggested.lean` carries no `sorry`
at all: every pinned signature is an `example` discharged by the library. What that does *not*
mean is recorded under *Long horizon* below: the theory built here is the entry point to the
material a successor roadmap would state, not a finished account of it.

Layer 6 needs Layers 0 and 1 and, for the
reduced fundamental system of 6.3 alone, Layer 4: 4.1's attainment, the substantial half of 4.2,
and 4.6 — all three of which were landed before it, so 6.3 was, like 5.3 and like 5.2 before it
was built, an assembly of theorems that already existed here. The rest of Layer 6 is independent
of Layers 2–5.

Register an intention before a substantial push; the layers above are deliberately claimable
separately.

## Long horizon (a roadmap for a roadmap, not work to attempt here)

The theory built here is the entry point to Diophantine approximation on subspaces: the Schmidt
subspace theorem, Roth's theorem, unit equations and their finiteness, and the Faltings–Wüstholz
machinery. Each needs the subspace height of Layer 3 and the auxiliary-polynomial construction of
Layer 5.7 as *inputs*, and each is a roadmap in its own right, several times the size of this one.
**Do not attempt them under this roadmap**; they are recorded here to say what this material is for
and where the next roadmap should start, not as work in scope.

## Provenance

Secondary to everything above: the milestones are the specification, and the files here are cited
sources to port from, not prescriptions of shape. All are in
[`rwst/lean-code`](https://github.com/rwst/lean-code) under `ForMathlib/`, released under CC0,
sorry-free against a recent Mathlib, and written as general statements with no number theory
beyond what the milestone needs; a contributor should port and generalize rather than reprove, and
credit the source in the ported file.

- [`LinearAlgebra/LinearIndependentRestrictScalars.lean`](https://github.com/rwst/lean-code/blob/main/ForMathlib/LinearAlgebra/LinearIndependentRestrictScalars.lean)
  — 4.4 in full: `LinearIndependent.fintype_card_le_finrank_mul_finrank_span` (the counting half),
  `exists_linearIndependent_comp_of_lt_finrank_span` (greedy selection under arbitrary index
  bounds) and `LinearIndependent.exists_linearIndependent_comp_finrank_mul` (the packaged
  corollary), in the arbitrary-tower form 4.4 states.
  ⚠ **Ported**, as `ArithmeticHeights/Extraction.lean`: all three statements under all three
  names, re-headed and re-documented to this repository's house style. The mathematics needed no
  generalisation — the source was already stated for an arbitrary tower — and the port cost was two
  `Function.comp` unfoldings that this Mathlib beta-reduces where the source's did not.
- [`NumberTheory/HeightTuple.lean`](https://github.com/rwst/lean-code/blob/main/ForMathlib/NumberTheory/HeightTuple.lean)
  — the tuple sum bound of 2.4 (`Height.mulHeight_sum_comp_le`, with the constant
  `#s ^ totalWeight K`), the matrix product bound of 2.5 (`Matrix.mulHeight_mul_le`, with the
  `totalWeight` exponent), and the counterexample to the naive two-tuple sum bound
  (`Height.exists_not_mulHeight_add_le`).
- [`NumberTheory/HeightExtension.lean`](https://github.com/rwst/lean-code/blob/main/ForMathlib/NumberTheory/HeightExtension.lean)
  — the `K = ℚ` case of 0.3, `H_K(x) = H_ℚ(x)^{[K : ℚ]}` (`NumberField.mulHeight_ratCast`,
  `NumberField.mulHeight₁_ratCast`).
- [`Analysis/InnerProductSpace/Hadamard.lean`](https://github.com/rwst/lean-code/blob/main/ForMathlib/Analysis/InnerProductSpace/Hadamard.lean)
  — Hadamard's determinant inequality (`Matrix.norm_det_le_prod_col_norm`), the input to 6.3's
  regulator bound. In Cassels it is the *sphere* case, Ch. VIII Theorem I, and not a step in
  Theorem V: 4.2's landed lower bound goes through a cross-polytope and uses no Hadamard.
- [`NumberTheory/FinitePlaceProduct.lean`](https://github.com/rwst/lean-code/blob/main/ForMathlib/NumberTheory/FinitePlaceProduct.lean)
  — `∏ᶠ w : FinitePlace K, w q = (|q| ^ d)⁻¹` for `q : ℚ`, the finite part of the height of a
  rational `S`-unit, an acceptance test for 6.4.
  ⚠ **Ported**, as `NumberField.FinitePlace.finprod_apply_ratCast` in `ArithmeticHeights/SUnit.lean`,
  where it is two rewrites: Mathlib has since acquired `NumberField.FinitePlace.prod_eq_inv_abs_norm`,
  and `Algebra.norm_algebraMap` turns the norm of a rational into its `d`-th power. It is stated
  and used as the layer's acceptance test, at `q = 2`.

## References

- E. Bombieri and W. Gubler, *Heights in Diophantine Geometry*, Cambridge New Mathematical
  Monographs 4, 2006. **The reference for the whole roadmap**, and the source of every numbered
  citation above. §1.2 absolute values and the product formula; §1.5 the height, Kronecker's theorem
  (Thm 1.5.9), `S`-units and Dirichlet's `S`-unit theorem (1.5.10–1.5.13), the Segre relation
  (1.5.14) and the sum bound (Prop 1.5.15); §1.6 Mahler measure, Gauss's lemma (Lemma 1.6.3),
  Northcott's theorem (Thm 1.6.8) and Gelfond's lemma (Lemma 1.6.11); §2.8 the Arakelov height
  (2.8.1–2.8.3), heights on Grassmannians (2.8.5–2.8.7), Cauchy–Binet (Prop 2.8.8), Fischer's
  inequality (Rem 2.8.9), duality (Prop 2.8.10, Cor 2.8.12) and submodularity (Thm 2.8.13); §2.9
  Siegel's lemma (Lemma 2.9.1, Cor 2.9.2), Bombieri–Vaaler (Thm 2.9.4) with its corollaries
  (2.9.7–2.9.9), the adelic Minkowski second theorem (Thm 2.9.13) and the relative version (Thm
  2.9.19); Appendix C for the geometry of numbers behind Layer 4 — C.2 is the **adelic** second
  theorem (Theorem C.2.11, McFeat's, proved via Davenport–Estermann and modelled on Bombieri–Vaaler),
  so it is *not* a model for 4.2, whose reference stays Cassels; C.3 is the cube slicing of 4.5, in
  the product-of-balls form (Theorem C.3.8) and with a complete proof whose only import is Prékopa's
  Theorem 3. Note also Definition C.2.9: the adelic successive minima count vectors independent over
  `K`, which is why the adelic route needs no analogue of 4.4.
- E. Bombieri and J. Vaaler, "On Siegel's lemma", *Inventiones Mathematicae* **73** (1983), 11–32.
  The original of Layers 5.2–5.4: Theorem 1 is the one-vector bound over `ℤ` and Theorem 2 the
  basis bound, both with `D⁻¹√|det (A Aᵀ)|`; Theorem 3 is the adelic Minkowski second theorem the
  paper exists to prove; Theorem 8 is the max-norm bound over a number field at the
  `(2/π)^{k r₂ / d}` constant of 5.4. §II.1 fixes the absolute normalization `|p|_v = p^{−d_v/d}` this roadmap
  follows, defines the local heights `H_v(X)` of a matrix by the sup norm at finite places and
  `|det X Xᵀ|^{1/2}` at archimedean ones, and records that `H(X)` is intrinsic on the Grassmannian
  ((2.5)) and submultiplicative over row blocks ((2.6)). §I.3 is the discussion of why the proof
  goes through the adèles, cited in Layer 4.
- J. D. Vaaler, "A geometric inequality with applications to linear forms", *Pacific Journal of
  Mathematics* **83** (1979), 543–553. The cube-slicing theorem of 4.5, quoted by Bombieri–Vaaler
  for the archimedean local volumes; the peakedness comparison Vaaler's own proof runs through is
  M. Kanter, "Unimodality and dominance for symmetric random vectors", *Trans. Amer. Math. Soc.*
  **229** (1977), 65–85. That is one route; the one 4.5 is priced against is Bombieri–Gubler C.3,
  through log-concavity, whose single external input is the next entry. ⚠ **Formalized along
  Bombieri–Gubler's route, not Vaaler's**, as `two_pow_finrank_le_volume_inter_cube` in
  `ArithmeticHeights/CubeSlicing.lean`; Kanter's peakedness comparison is not used, and neither is
  any closed form for the volume of a ball except `ω₁ = 2`.
- A. Prékopa, "On logarithmic concave measures and functions", *Acta Scientiarum Mathematicarum*
  **34** (1973), 335–343. Theorem 3 is Bombieri–Gubler's C.3.3 and hence the one unproved step of
  4.5; his remark reduces the two-function log-concave case — the only one needed — to the
  one-dimensional `λ = ½` inequality of A. Prékopa, "Logarithmic concave measures with application
  to stochastic programming", *ibid.* **32** (1971), 301–316. His erratum, that the sup-convolution
  is Lebesgue and not Borel measurable, is the reason 4.5 asks for the hypothesis form of the
  statement. ⚠ **Proved here rather than cited**, as `Real.prekopaLeindler` and
  `hasPrekopaLeindler_euclideanSpace` in `ArithmeticHeights/PrekopaLeindler.lean`, in that
  hypothesis form and for `ℝ≥0∞`-valued functions. Neither reduction was needed: the
  one-dimensional case falls directly to the level sets and the one-dimensional Brunn–Minkowski
  inequality, and the passage to `ℝⁿ` is Tonelli's theorem rather than an induction on
  dimension.
- J. D. Vaaler, "The best constant in Siegel's lemma", *Monatshefte für Mathematik* **140**
  (2003), 71–89. The optimal form of 5.4's constant, a generalized Hermite constant in the sense
  of Thunder; recorded so that nobody mistakes it for the target — this roadmap asks for the
  discriminant bound of Theorem 2.9.4. Its (1.3) is the Hermitian inequality of 5.3 and its (1.4)
  the max-norm inequality of 5.4, with the remark on cube slicing quoted at 5.4.
- Y. Bugeaud and K. Győry, "Bounds for the solutions of unit equations", *Acta Arithmetica* **74**
  (1996), 67–80. Lemma 1 (§3, p. 71) is the reduced-basis statement of 6.3, stated for `S`-units:
  a fundamental system with `∏ log h(ε_i) ≤ c₄ R_S`, `c₄ = ((s−1)!)² / (2^{s−2} d^{s−1})`, where
  `s = |S|` counts the archimedean places, so that `S = S_∞` (`s − 1 = r`) is 6.3's constant. Their
  `h` is the *multiplicative* absolute height, so their `log h` is this roadmap's `h`. The proof
  (pp. 71–72) is the route 6.3 pins: Minkowski's second theorem for the ℓ¹ distance function on the
  logarithmic lattice (their (9), citing Cassels Ch. VIII), Cassels' p. 135 Lemma 8 for the basis
  (their (11); 4.6 here), and the two-sided comparison of 6.1 (their (12)). They attribute the
  lemma to L. Hajdu, "A quantitative version of Dirichlet's S-unit theorem in algebraic number
  fields", *Publ. Math. Debrecen* **42** (1993), 239–246, which extends B. Brindza, "On the
  generators of S-unit groups in algebraic number fields", *Bull. Austral. Math. Soc.* **43**
  (1991), 325–329, and reprove it with a slightly better constant than Hajdu's.
- I. Aliev and M. Henk, "Minkowski's successive minima in convex and discrete geometry",
  *Communications in Mathematics* **31** (2023), no. 2, 35–59. §6 (Theorems 6.2–6.3) is the
  adele-free assembly of 5.2 over `ℚ` — the covolume identity, cube slicing, and Minkowski's
  second theorem — and the reference that milestone is held against.
- L. Fukshansky, "Siegel's lemma with additional conditions", *Journal of Number Theory* **120**
  (2006), 13–25. Quotes 4.3's covolume identity as its (17), in this roadmap's normalization —
  absolute height, `(Re, Im)` embedding, the `2^{−r₂}` present — and is the most convenient place to
  read the statement; his §§1–2 also fix that the subspace height there is the `ℓ²`-at-infinity one,
  i.e. Arakelov. He attributes it to Thunder, who attributes it to Schmidt 1967; his own main
  argument is adelic and is not this roadmap's route.
- J. L. Thunder, "An asymptotic estimate for heights of algebraic subspaces", *Transactions of the
  American Mathematical Society* **331** (1992), 395–424. Theorem 2 is 4.3's identity in a
  conjugate-pairs embedding and a relative height, which is why no `2^{−r₂}` appears there; he
  proves it by citation to Schmidt 1967, "the proofs being entirely similar".
- D. Roy and J. L. Thunder, "A note on Siegel's lemma over number fields", *Monatshefte für
  Mathematik* **120** (1995), 307–318. Some power of the discriminant must appear in 5.4's bound,
  so the constant's shape is intrinsic and not an artifact of any route.
- W. M. Schmidt, "On heights of algebraic subspaces and diophantine approximations", *Annals of
  Mathematics* **85** (1967), 430–472. The origin of Layer 3 **and of 4.3**: §1 defines the height of
  a subspace by its Grassmann coordinates and proves the map from `d`-dimensional subspaces to lines
  in `K^N` is injective (3.1); equations (2) and (4) are the duality theorem (3.5); §2 Lemma 1 is
  Cauchy–Binet and Lemma 2 the generalized Hadamard inequality (3.4); **§3 Theorem 1 is the covolume
  identity of 4.3**, in this roadmap's normalization, with Lemmas 4–6 his two-sided proof of it.
  ⚠ Only Lemma 4 is used here: over a pseudo-basis the index Lemmas 5–6 compute never arises, so
  the counting lemma of Lemma 6 is not part of the landed 4.3. Schmidt's default height is the
  Euclidean one, as Bombieri–Vaaler's and Bombieri–Gubler's are.
- W. M. Schmidt, *Diophantine Approximation*, LNM 785, Ch. I, Lemma 8A. Submodularity (3.6); it is
  **not** in the 1967 paper.
- T. Struppeck and J. D. Vaaler, "Inequalities for heights of algebraic subspaces and the
  Thue–Siegel principle", in *Analytic Number Theory* (Allerton Park, 1989), Birkhäuser, 1990. The
  independent proof of the submodularity of 3.6.
- M. Hindry and J. H. Silverman, *Diophantine Geometry: An Introduction*, GTM 201, 2000. The
  reference Mathlib's `NumberTheory/SiegelsLemma.lean` cites, so Layer 5's vocabulary follows it:
  Lemma D.4.1 is Mathlib's statement and Lemma D.4.2 its number-field second form. Also Theorem
  B.2.3 (Northcott, projective and with varying degree) and Corollary B.2.3.1 (Kronecker, projective
  form) for Layer 1; §B.7 "Heights and Polynomials", Propositions B.7.2 and B.7.3, for Layer 2; and
  Exercise A.1.11 for the Plücker embedding, its well-definedness and injectivity, and the duality
  of Layer 3.5. Proposition B.4.2 and Remarks B.4.3, on canonical heights and preperiodic points,
  are the `EllipticCurves` roadmap's material, not this one's.
- J. W. S. Cassels, *An Introduction to the Geometry of Numbers*, Springer, 1959. Ch. I **Theorem
  I** for the basis of a lattice triangular against an independent family — part B; part A is the
  converse, the Hermite normal form of a sublattice — which is the lattice content of Ch. VIII
  Lemma 2, and is what 4.6 needs; the upper bound of 4.2 turns out not to. Ch. VIII §1 for
  the definition of the successive minima and the lemma that they are attained; §4 **Theorem V**
  — the inequalities (12) and (13) of VIII.1 — for Layer 4.2, with his §4.2 **Theorem IV** as its
  kernel, in the real formulation this roadmap pins. The displays (10), (12) and (14) inside the
  proof of that Theorem IV are what `ArithmeticHeights/QuotientFubini.lean` formalizes, and his
  reduction "we may therefore suppose without loss of generality that the basis … is just `eᵢ`" is
  there the choice of a complement of the span, so that the quotient is a product.
  Ch. VIII Theorem I (the sphere case) and Theorem II
  (a general distance function) are stated through a critical determinant `δ(F)`, not a volume,
  and are neither half of 4.2; see the ⚠ there. Bugeaud–Győry cite p. 135, Lemma 8 of this
  edition for the basis of 4.6, `F(b_i) ≤ max(1, i/2) · λ_i` with the minima indexed from `1`.
- M. Waldschmidt, *Diophantine Approximation on Linear Algebraic Groups*, Grundlehren 326, 2000. Ch.
  3 for heights and Ch. 4 for the auxiliary-polynomial use of Siegel's lemma that Layer 5.7
  packages.
- D. Roy and J. L. Thunder, "An absolute Siegel's lemma", *J. reine angew. Math.* **476** (1996),
  1–26. The normalization that removes the discriminant from the 5.4 bound at the cost of an
  `ε`; recorded because Bombieri–Gubler (2.9.20) points at it as the sharpening of Thm 2.9.4, and
  because it is what a contributor will find if they look for "the absolute version".
- S. Lang, *Fundamentals of Diophantine Geometry*, Springer, 1983. Ch. 3 for the classical treatment
  of heights over number fields.
- J. Neukirch, *Algebraic Number Theory*, Grundlehren 322, 1999. Ch. I §5–6 and Ch. III for places,
  the product formula, and Minkowski theory.
