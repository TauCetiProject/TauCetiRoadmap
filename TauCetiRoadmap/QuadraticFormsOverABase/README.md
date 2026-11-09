# Roadmap: quadratic forms over a base

**Summary.** Build the theory of quadratic forms on the free module `Rⁿ = Fin n → R` over an
arbitrary commutative ring `R`, without dividing by `2`, on Mathlib's `QuadraticForm` and
`QuadraticAlgebra` and on Tau Ceti's coordinate Hopf algebra of `GLₙ` and orthogonal group of a
quadratic map. The end theorems are: for `n` odd, the determinant of the polar matrix of the
universal form is twice an integral polynomial, the half-discriminant `δ'`, which is multiplied by
`(det g)²` under every change of variables `g` and commutes with base change; a form of odd rank
is smooth (its radical vanishes at every geometric point; for `n ≥ 1` this is ordinarity in the
sense of LefschetzPencilsAndVanishingCycles §2.1) exactly when `δ'(Q)` is a unit, and a form of
even rank exactly when the determinant of its polar matrix is a unit; a form is smooth exactly
when it becomes isometric to the split form `qₙ` over a faithfully flat finitely presented
`R`-algebra, which can be taken étale when `n` is even or `2 ∈ Rˣ`; for a smooth form `Q`, the
functor `O(Q)` is represented by the quotient of the coordinate Hopf algebra of `GLₙ` by a Hopf
ideal, its points have `det² = 1`, `O(Q) = μ₂ × SO(Q)` on points when `n` is odd, `O(Q)` is smooth
exactly when `n` is even or `2 ∈ Rˣ`, and `SO(Q)` is smooth for `n` odd; isometry classes of
smooth forms of rank `n` on locally free modules are the torsor classes under `O(qₙ)`; for `n ≥ 3`
odd the even Clifford algebra `C₀(Q)` is Azumaya exactly when `δ'(Q)` is a unit; in even rank
`(−1)^(n/2) det` of the polar matrix is congruent to the square of the hafnian modulo `4`, which
gives a free quadratic algebra of that discriminant, étale exactly when `Q` is smooth; two free
quadratic algebras `R[ω]/(ω² − bᵢω − aᵢ)` have a product whose discriminant is the product of
their discriminants, and which is the algebra of invariants of `σ₁ ⊗ σ₂` when `(2, b₁, b₂) = R`;
and a binary form `f` of formal degree `n ≥ 1` satisfies
`aₙ formDiscr n f = (−1)^(n(n−1)/2) Res_{n,n−1}(f, f′)`, also when `aₙ = 0`. The statements are
those of Conrad 2014 (Appendix C), Knus 1991 (Chapter IV) and Voight 2011; a target that names no
source is proved by its route.

Suggested home: `TauCeti/LinearAlgebra/QuadraticForm/OverRing/`, beside Tau Ceti's
`LinearAlgebra/QuadraticForm/`, and `TauCeti/Algebra/AlgebraicGroup/OrthogonalForm/` beside
`AlgebraicGroup/ConstantForm/`.

## Scope and ownership

**Owned here.** Every statement is about a quadratic form on `Fin n → R` for an arbitrary
commutative ring `R` (3.4 alone reaches forms on locally free modules of rank `n`), about the group
functor and group scheme it defines inside `GLₙ`, about its even Clifford algebra, about free
quadratic algebras over `R`, or about binary forms of formal degree `n` over `R`:

- coefficient and polar matrices, and base change of forms along an arbitrary ring map by
  coefficients, with its comparisons with QuadraticFormInvariantsPartII §0.2's `extendScalars`
  (from a field to an algebra over it) and with Mathlib's `QuadraticForm.baseChange` when `2` is
  invertible (Layer 0);
- the universal discriminant and half-discriminant, and the hafnian congruence in even rank
  (Layer 1);
- smoothness of a form on `Fin n → R`, the coordinate carrier of LefschetzPencilsAndVanishingCycles
  §2.1's ordinary forms, with its two unit criteria, fppf local triviality, and étale local
  triviality in odd rank when `2 ∈ Rˣ` (Layer 2);
- the orthogonal group `O(Q)` of a form as a closed subgroup scheme of `GLₙ` over an arbitrary
  base, its smoothness, `det² = 1`, the decomposition `μ₂ × SO(Q)` in odd rank, and the
  classification of smooth forms by torsors (Layer 3);
- the Azumaya criterion for `C₀(Q)` in odd rank (Layer 4);
- the discriminant algebra of a form of even rank and the product of free quadratic algebras,
  without dividing by `2` (Layer 5);
- the resultant identity of a binary form at formal degree (Layer 6).

**Supplied at the pins.** Mathlib's `QuadraticForm`, `QuadraticMap.toBilin`, `polarBilin`,
`radical`, `QuadraticMap.Nondegenerate`, isometries, `CliffordAlgebra.even`, `IsAzumaya`,
`QuadraticAlgebra` with its involution `QuadraticAlgebra.starAlgEquiv`, `Polynomial.resultant`,
`Polynomial.discr`, and the discriminant `QuadraticForm.discr'` of a form when `2` is invertible
(`halfDisc` is `discr'` up to `2^(n−1)` and needs no unit `2`); Tau Ceti's congruence modulo `4`
and square property of skew determinants, its polar-matrix identities, its coordinate Hopf algebra
of `GLₙ`, its generic matrix, its points, `HopfIdeal`, the orthogonal group
`TauCeti.QuadraticMap.orthogonalGroup` of a quadratic map with its coordinate embedding
`QuadraticMap.orthogonalToGeneralLinear` and coordinate criterion, the étale criterion
`QuadraticAlgebra.etale_iff_isUnit_discr` for free quadratic algebras, and the discriminant
criteria `Polynomial.Monic.isUnit_discr_iff` and `Polynomial.Monic.etale_adjoinRoot_iff`. They are
consumed by name; no second carrier is built.

**Left to other roadmaps.**

- Quadratic forms over fields in which `2` is invertible (Witt rings, Hasse and Clifford
  invariants, Stiefel–Whitney classes) are QuadraticFormInvariants'; nonsingular and quasilinear
  forms over fields of characteristic two, and the coordinate scalar extension `extendScalars`
  from a field, are QuadraticFormInvariantsPartII's (§0.2 for `extendScalars`).
- Ordinary quadratic forms on locally free modules of positive rank over any base, their base
  change and fibre criterion, their comparison with Mathlib's `QuadraticMap.Nondegenerate` over a
  field, and their étale-local normal form are LefschetzPencilsAndVanishingCycles §2.1's. The
  centre of the even Clifford algebra of an ordinary form of positive even rank, finite étale of
  rank two, with `C₀(Q)` Azumaya over it, is its §2.2's (`evenClifford_center_etale_azumaya`).
- The orthogonal group scheme of a quadratic space over a perfect field of characteristic two,
  with its reduction, its components and its point counts over finite fields, is
  OrthogonalTamagawaAndLatticeMass §0.1a's. The orthogonal and special orthogonal group schemes
  of a nondegenerate quadratic space over a field of characteristic `≠ 2`, as
  `TauCeti.ConstantForm.groupScheme K n C`, with their smoothness, are that roadmap's §0.1's.
  Layer 3 constructs `O(Q)` over an arbitrary base and compares it with both groups (3.1).
- The Arf invariant `arfInvariant` of a nonsingular form over a field of characteristic two, with
  its independence of the symplectic basis, is GeometryOfNumbersAndQuadraticArithmetic §6.8's.
- The discriminant of a binary form at formal degree, `formDiscr`, with its degree-drop laws and
  its compatibility with ring maps, is HyperellipticCurves §0.1's; the discriminant of a
  polynomial is Mathlib's `Polynomial.discr`.
- Descent of quasi-coherent modules, torsors and their classes are SchemeAndStackFoundations'
  (§1.1 for descent, §1.15 for torsors under a group space, §2.3 for the carrier `NonabelianH1`),
  consumed in 3.4.
- The orthogonal and special orthogonal groups of the standard symmetric bilinear form
  (`X Xᵀ = 1`) are Tau Ceti's `TauCeti.Orthogonal` and `TauCeti.SpecialOrthogonal`, with the
  smoothness of `SOₙ` when `2` is invertible; they are groups of a bilinear form, not of a
  quadratic form, and agree with `O(qₙ)` only up to a change of form when `2` is invertible.
- Forms valued in an invertible module (Bichsel–Knus 1994) are not treated, and forms on locally
  free modules appear only in 3.4: every other statement is about `Fin n → R`, to which they reduce
  Zariski-locally.

## Conventions

- **Forms.** `Q : QuadraticForm R (Fin n → R)`, `eᵢ = Pi.single i 1`. The **coefficient matrix**
  `coeffMatrix Q` is `LinearMap.toMatrix₂' R (Q.toBilin (Pi.basisFun R (Fin n)))`: `Q(eᵢ)` on the
  diagonal, `polar Q eᵢ eⱼ` at `(i, j)` for `i < j`, `0` below the diagonal, so
  `Q x = ∑_{i ≤ j} cᵢⱼ xᵢ xⱼ`. For `q = a x² + b x y + c y²` on `Fin 2 → R` it is `!![a, b; 0, c]`.
- **Polar matrix.** `polarMatrix Q = (polar Q eᵢ eⱼ) = U + Uᵀ` for `U = coeffMatrix Q`, with
  `2 Q(eᵢ)` on the diagonal: `!![2a, b; b, 2c]` for the binary `q` above, of determinant
  `4ac − b²`.
- **Base change.** `mapCoeffs f Q` applies `f : R →+* S` to the coefficient matrix. Mathlib's
  `QuadraticForm.baseChange` needs `Invertible (2 : R)`, and QuadraticFormInvariantsPartII's
  `extendScalars Q L` goes from a field `K` to a `K`-algebra `L`; `mapCoeffs` goes along any ring
  map with no hypothesis on `2`, and 0.2 compares it with both.
- **Universal ring.** `ℤ[U] = MvPolynomial (Fin n × Fin n) ℤ`, `U = (Uᵢⱼ)`; a polynomial in the
  `Uᵢⱼ` is evaluated at a form through its coefficient matrix (`evalMatrix (coeffMatrix Q)`).
  Using all `n²` entries rather than the `n(n+1)/2` coefficients `i ≤ j` changes nothing: the
  lower entries evaluate to `0`, and 1.2 shows that any bilinear representative of `Q` gives the
  same values.
- **Split forms.** `qₙ = standard n` is `x₀x₁ + x₂x₃ + ⋯` over the pairs `(2i, 2i + 1)`, plus
  `x_{n−1}²` when `n` is odd. With the square in the last coordinate rather than the first this is
  Conrad's `q_n` (Conrad 2014, Definition C.1.2, p. 303) after a permutation of the coordinates,
  which changes neither `δ'` nor the polar determinant, since a permutation matrix has
  `det² = 1`. Witnesses: `δ'(q₁) = 1`, `δ'(q₃) = −1`, `det polar(q₂) = −1`.
- **Signs.** `univSignedDisc n = (−1)^(n/2) det(U + Uᵀ)`; it is `b² − 4ac` for the binary `q`
  above, the discriminant of `a t² + b t + c`.
- **Orthogonal group.** `g ∈ GLₙ(A)` acts on column vectors, and `O(Q)(A)` is the image in
  `GLₙ(A)` of Tau Ceti's `TauCeti.QuadraticMap.orthogonalGroup Q_A` under
  `QuadraticMap.orthogonalToGeneralLinear`, `Q_A = mapCoeffs (algebraMap R A) Q`: the matrices `g`
  with `Q_A(g x) = Q_A(x)` for every `x ∈ Aⁿ`. Witness: for
  `q = x₀x₁`, `!![t, 0; 0, t⁻¹]` and `!![0, 1; 1, 0]` lie in `O(q)(A)` for every `t ∈ Aˣ`, and
  `!![1, 1; 0, 1]` does not (it sends `e₁` to `e₀ + e₁`, where `q` is `1`, not `0`).
- **Quadratic algebras.** Mathlib's `QuadraticAlgebra R a b` is `R ⊕ R ω` with `ω² = a + b ω`;
  its discriminant is `QuadraticAlgebra.discr a b = b² + 4a`, and its involution `ω ↦ b − ω` is
  Mathlib's `star`, bundled as `QuadraticAlgebra.starAlgEquiv`. Tau Ceti's
  `QuadraticAlgebra.etale_iff_isUnit_discr`: `QuadraticAlgebra R a b` is étale exactly when
  `b² + 4a` is a unit, with no hypothesis on `2`. Witness: `ℤ[i] = QuadraticAlgebra ℤ (−1) 0` has
  discriminant `−4`, and `ℤ[(1 + √5)/2] = QuadraticAlgebra ℤ 1 1` has discriminant `5`.
- **Binary forms.** A binary form of degree `n` is a polynomial `f = ∑_{i ≤ n} aᵢ Xⁱ` with formal
  degree `n` (`aₙ` may vanish); Mathlib's `resultant f g m n` is the resultant with formal
  degrees `m` and `n`, and HyperellipticCurves §0.1's `formDiscr n f` is the discriminant at
  formal degree `n`: `formDiscr 2 (c + bX + aX²) = b² − 4ac` and `formDiscr 1 (a₀ + a₁X) = 1`.

## Exact supplier contracts

**From Mathlib** (at the pinned revision).

- Quadratic forms: `QuadraticForm`, `QuadraticMap.polar`, `QuadraticMap.polarBilin`,
  `QuadraticMap.toBilin` and `QuadraticMap.toQuadraticMap_toBilin` (`QuadraticForm/Basis.lean`),
  `LinearMap.BilinMap.toQuadraticMap`, `QuadraticMap.comp`, `QuadraticMap.radical` and
  `QuadraticMap.radical_eq_ker_polarBilin` and `QuadraticMap.Nondegenerate`
  (`QuadraticForm/Radical.lean`),
  `QuadraticMap.IsometryEquiv`, `QuadraticForm.baseChange` (`QuadraticForm/TensorProduct.lean`,
  under `Invertible (2 : R)`), `TensorProduct.piScalarRight`; the discriminant
  `QuadraticForm.discr'` with `QuadraticForm.discr'_comp`, `QuadraticForm.discr'_smul` and
  `QuadraticForm.discr_eq_discr'` (`QuadraticForm/Basic.lean`, under `Invertible (2 : R)`),
  compared with `halfDisc` in 1.2.
- Matrices: `LinearMap.toMatrix₂'`, `Matrix.toLinearMap₂'`, `Matrix.toLin'`, `Matrix.det`,
  `Matrix.mulVec`, `Matrix.GeneralLinearGroup`.
- Polynomials: `MvPolynomial`, `MvPolynomial.eval₂Hom`, `Polynomial.resultant`,
  `Polynomial.resultant_eq_zero_of_lt_lt`, `Polynomial.discr`, `Polynomial.resultant_deriv`,
  `Polynomial.discr_of_degree_eq_two`, `Polynomial.discr_of_degree_eq_three`
  (`RingTheory/Polynomial/Resultant/Basic.lean`), `Polynomial.derivative`, `AdjoinRoot`.
- Algebras: `CliffordAlgebra.even`, `IsAzumaya` (`Algebra/Azumaya/Defs.lean`),
  `Subalgebra.center` with its `CommRing` instance, `QuadraticAlgebra`, `QuadraticAlgebra.omega`,
  `QuadraticAlgebra.discr`, `QuadraticAlgebra.lift`, `QuadraticAlgebra.nonempty_algEquiv_iff`,
  `QuadraticAlgebra.starAlgEquiv` (`Algebra/QuadraticAlgebra/Basic.lean`),
  `Algebra.TensorProduct.map`.
- Ring maps: `Algebra.Etale`, `Algebra.Smooth`, `Algebra.FinitePresentation`,
  `Module.FaithfullyFlat`, `Module.Projective`, `Module.rankAtStalk`, `IsAlgClosed`,
  `AlgebraicClosure`.

**From Tau Ceti** (at the pinned revision).

- **The coordinate Hopf algebra of `GLₙ`**
  (`TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean`):
  `TauCeti.GeneralLinear.coordinateHopfAlgebra R n` and `TauCeti.GeneralLinear.genericMatrix R n`.
- **Its points** (`…/GeneralLinear/FunctorOfPoints.lean`): `TauCeti.GeneralLinear.pointsMulEquiv`,
  the group of convolution points `WithConv (coordinateHopfAlgebra R n →ₐ[R] A)` is
  `GL (Fin n) A`.
- **Hopf ideals** (`TauCeti/Algebra/HopfAlgebra/HopfIdeal/Basic.lean`): `TauCeti.HopfIdeal`,
  `HopfIdeal.toIdeal`, and `HopfIdeal.ofSpan` (a Hopf ideal from generators satisfying the three
  closure conditions), which is the route of 3.1.
- **The group scheme preserving a constant matrix**
  (`TauCeti/Algebra/AlgebraicGroup/ConstantForm/Basic.lean` and
  `…/HopfIdeal/Points/Basic.lean`): `TauCeti.ConstantForm.definingHopfIdeal R n C`, the same
  construction for the bilinear relations `X C Xᵀ = C`, its group scheme
  `TauCeti.ConstantForm.groupScheme`, the subgroup of points
  `TauCeti.CommHopfAlgCat.quotientPointsSubgroup` it cuts out, and the membership criterion
  `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff` (`M C Mᵀ = C`), consumed in 3.1.
- **Roots of unity** (`TauCeti/Algebra/AlgebraicGroup/RootsOfUnity/Smooth.lean`):
  `TauCeti.RootsOfUnityGroup.coordinateRing_smooth_iff`, used in 3.3 for the factor `μ₂`.
- **The orthogonal group of a quadratic map**
  (`TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean`):
  `TauCeti.QuadraticMap.orthogonalGroup`, the `Q`-preserving linear automorphisms, and its
  coordinate embedding `QuadraticMap.orthogonalToGeneralLinear` into `GL n R`, whose range is
  `orthogonalGroup Q A` in 3.1, with `QuadraticMap.coe_orthogonalToGeneralLinear` (its matrix is
  `LinearMap.toMatrix'` of the automorphism); and its coordinate criterion
  `TauCeti.QuadraticMap.mem_orthogonalGroup_iff_toMatrix`
  (`…/QuadraticForm/OrthogonalGroup/Coordinate.lean`, under `Invertible (2 : R)`:
  `g ∈ orthogonalGroup Q ↔ Aᵀ (Q.toMatrix b) A = Q.toMatrix b`), used in 3.1.
- **The polar matrix** (`TauCeti/LinearAlgebra/QuadraticForm/Matrix.lean`, under
  `Invertible (2 : R)`): `QuadraticForm.toMatrix_polarBilin` (the polar matrix is
  `2 • Q.toMatrix b`), used in 3.1, and `QuadraticForm.det_toMatrix_polarBilin`, used in 1.2.
- **Skew-symmetric determinants** (`TauCeti/LinearAlgebra/Matrix/Determinant/Skew.lean`):
  `Matrix.four_dvd_neg_one_pow_mul_det_add_transpose_sub_det_sub_transpose` (for `S` of size `2k`
  over a commutative ring, `4 ∣ (−1)^k det(S + Sᵀ) − det(S − Sᵀ)`) and
  `Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero` (over a field, a skew matrix with zero
  diagonal has square determinant), used in 1.4.
- **Quadratic étale algebras** (`TauCeti/Algebra/QuadraticAlgebra/Etale.lean`):
  `QuadraticAlgebra.etale_iff_isUnit_discr`, used in 2.4 and 5.1.
- **Discriminants** (`TauCeti/RingTheory/Polynomial/Resultant/Discriminant.lean` and
  `TauCeti/RingTheory/Etale/AdjoinRoot.lean`): `Polynomial.Monic.isUnit_discr_iff`,
  `Polynomial.discr_map_of_natDegree_eq` and `Polynomial.Monic.etale_adjoinRoot_iff`, read in
  Layer 6.

**From LefschetzPencilsAndVanishingCycles.** §2.1: ordinary quadratic forms on locally free
modules of positive rank, their base change and fibre criterion, and the étale-local normal form
`Σ xᵢ x_{i+m}` (with `+ λ x²`, `λ` a unit, in odd rank), consumed in 2.1 and 2.4. §2.2:
`evenClifford_center_etale_azumaya`, the even Clifford centre in positive even rank, read in the
Layer 4 Examples.

**From OrthogonalTamagawaAndLatticeMass.** §0.1: the orthogonal group `O(V, Q)` of a
nondegenerate quadratic space over a field of characteristic `≠ 2`, as
`TauCeti.ConstantForm.groupScheme K n C` with points `M C Mᵀ = C`, and §0.1a: the orthogonal group
`O(q) ⊂ GL(W)` of a quadratic space over a perfect field of characteristic two, both consumed in
the comparisons of 3.1.

**From GeometryOfNumbersAndQuadraticArithmetic.** §6.8: `arfInvariant`, the Arf invariant of a
nonsingular form over a field of characteristic two, read in the Layer 1 Examples and the Research
context.

**From QuadraticFormInvariantsPartII.** §0.2: `extendScalars`, the coordinate scalar extension
from a field, consumed in the comparison of 0.2.

**From HyperellipticCurves.** §0.1: `formDiscr`, the discriminant of a binary form at formal
degree, consumed in 6.1.

**From SchemeAndStackFoundations.** §1.1: descent of quasi-coherent modules
(SchemeAndStackFoundations' `qcoh_fpqc_descent`); SchemeAndStackFoundations' `IsTorsor` (§1.15:
torsors under a group space flat and of finite presentation, for the fppf topology); and
SchemeAndStackFoundations' `NonabelianH1` (§2.3: the pointed set of torsor classes); all consumed
in 3.4 only.

## How to read the build

Layer 0 fixes coordinates and base change, which is all the later layers need to say "over
every `R`-algebra" without dividing by `2`. Layer 1 constructs the universal discriminant and
half-discriminant over `ℤ` and their values at a form, with their transformation rules, and the
hafnian congruence in even rank. Layer 2 defines smoothness geometrically, compares it with
LefschetzPencilsAndVanishingCycles' ordinary forms, and proves the two unit criteria and local
triviality; it uses Layer 1. Layer 3 builds `O(Q)` inside Tau Ceti's `GLₙ` and proves its
structure theorems from Layers 1 and 2; 3.3 is the hardest target, and 3.4 needs
SchemeAndStackFoundations. Layer 4 reads Layers 1 and 2 on the even Clifford algebra. Layer 5
works with free quadratic algebras; 5.1 joins it to 1.4 and Layer 2. Layer 6 is independent of
Layers 1–5 and uses only Mathlib's resultant and HyperellipticCurves' discriminant at formal
degree.

## Layer 0: coordinates and base change

### 0.1 Coefficient and polar matrices

Define `coeffMatrix Q` and `polarMatrix Q` as in the Conventions. Prove that
`polarMatrix Q = coeffMatrix Q + (coeffMatrix Q)ᵀ`, that `Q` is determined by `coeffMatrix Q`
(`Q x = ∑_{i ≤ j} cᵢⱼ xᵢ xⱼ`, Mathlib `QuadraticMap.toQuadraticMap_toBilin`), and that
`coeffMatrix (Q.comp (toLin' g))` is the upper-triangular part of `gᵀ (coeffMatrix Q) g`, the
entry `(i, j)` for `i < j` being the sum of the entries `(i, j)` and `(j, i)`.

*Needs:* Mathlib `QuadraticMap.toBilin`, `toBilin_apply`, `toQuadraticMap_toBilin`,
`polarBilin`, `LinearMap.toMatrix₂'`.

**Checks.**

- For `q = a x² + b x y + c y²`, `coeffMatrix q = !![a, b; 0, c]` and
  `polarMatrix q = !![2a, b; b, 2c]`; a definition taking the symmetric matrix `(½ polar)`
  would need `2 ∈ Rˣ` and is not available over `𝔽₂`.
- For `q = x₀x₁` and `g = !![0, 1; 1, 0]`, `gᵀ (coeffMatrix q) g = !![0, 0; 1, 0]` is lower
  triangular, and its upper-triangular part, with `(0, 1)` entry `0 + 1`, is again
  `!![0, 1; 0, 0]`: taking `gᵀ U g` itself, without folding the lower part up, would make the
  coefficient matrix depend on more than the form.
- For the zero form, both matrices are `0`; for `q = x²` on `Fin 1 → 𝔽₂` the polar matrix is
  `0` while `coeffMatrix q = !![1]`, so the polar matrix alone does not determine a form when `2`
  is not invertible.

### 0.2 Base change

Define `mapCoeffs f Q` for `f : R →+* S` as in the Conventions. Prove that
`mapCoeffs f Q (f ∘ x) = f (Q x)`, that `mapCoeffs g (mapCoeffs f Q) = mapCoeffs (g.comp f) Q`,
that `mapCoeffs (RingHom.id R) Q = Q` and that
`coeffMatrix (mapCoeffs f Q) = (coeffMatrix Q).map f`. Prove the comparison with
QuadraticFormInvariantsPartII §0.2: for a field `K` and a commutative `K`-algebra `L`,
`mapCoeffs (algebraMap K L) Q = extendScalars Q L`, both sides being
`x ↦ ∑ᵢ Q(eᵢ) xᵢ² + ∑_{i<j} polar Q eᵢ eⱼ xᵢ xⱼ` with the coefficients mapped into `L`. Prove
`mapCoeffs_eq_baseChange`: when `Invertible (2 : R)` and `A` is an `R`-algebra,
`mapCoeffs (algebraMap R A) Q` is
`(Q.baseChange A).comp (TensorProduct.piScalarRight R A A (Fin n)).symm.toLinearMap`. Route: both
sides take the same values at the `eᵢ` and the same polar values at the pairs `(eᵢ, eⱼ)`
(`QuadraticForm.baseChange_tmul`). For a field `K` this also follows from the comparison and
QuadraticFormInvariantsPartII §0.2's identification of `extendScalars` with
`QuadraticForm.baseChange`; `mapCoeffs_eq_baseChange` is its form over a ring. No source is
named for these coordinate identities; the routes are their proofs.

*Needs:* 0.1; Mathlib `Matrix.toLinearMap₂'`, `QuadraticForm.baseChange`,
`QuadraticForm.baseChange_tmul`, `TensorProduct.piScalarRight`; QuadraticFormInvariantsPartII
§0.2 (`extendScalars`).

**Checks.**

- Along `ℤ → 𝔽₂`, `x² + x y` goes to `x² + x y`, with coefficient matrix `!![1, 1; 0, 0]`,
  while its polar matrix `!![2, 1; 1, 0]` goes to `!![0, 1; 1, 0]`, the polar matrix of both
  `x y` and `x² + x y`: base change through the polar matrix would lose the diagonal.
- The evaluation law at `q = x y`, `f = ℤ → ℤ/6`, `x = (2, 3)`: `q x = 6 ↦ 0`, and
  `mapCoeffs f q (2, 3) = 2 · 3 = 0` in `ℤ/6`.
- When `2 ∈ Rˣ`, `mapCoeffs_eq_baseChange` at `q = x²`, `A = R[t]`: both sides send
  `t e₀` to `t²`.
- The comparison at `[1, a] = x² + x y + a y²` over a field `K`: `mapCoeffs (algebraMap K L)`
  and `extendScalars · L` both give `x² + x y + a y²` over `L`, not `x² + a y²`, which is what a
  definition dropping the off-diagonal coefficient would give.

### Examples

- `coeffMatrix (standard 3) = !![0, 1, 0; 0, 0, 0; 0, 0, 1]` and
  `polarMatrix (standard 3) = !![0, 1, 0; 1, 0, 0; 0, 0, 2]`.

### Dependencies

Mathlib `QuadraticMap.toBilin`, `polarBilin`, `LinearMap.toMatrix₂'`, `Matrix.toLinearMap₂'`,
`QuadraticForm.baseChange`, `TensorProduct.piScalarRight`; QuadraticFormInvariantsPartII §0.2.

## Layer 1: discriminants

### 1.1 The universal half-discriminant

Define `univMatrix n = (Uᵢⱼ)`, `univDisc n = det(U + Uᵀ) ∈ ℤ[U]` and `univHalfDisc n`, the
polynomial whose coefficients are those of `univDisc n` divided by `2`. Prove
`two_mul_univHalfDisc`: for `n` odd, `2 · univHalfDisc n = univDisc n` (Conrad 2014,
Proposition C.1.4 (1), p. 304). Route: modulo `2`, `U + Uᵀ` agrees with the alternating matrix
`U − Uᵀ`, whose determinant vanishes in odd size because `det(Kᵀ) = det(−K) = −det K` and `ℤ[U]`
has no `2`-torsion; so every coefficient of `univDisc n` is even. Also prove that `univHalfDisc n`
is homogeneous of degree `n` for every `n`, and that, for `n` odd, it is the only polynomial `d`
with `2d = univDisc n` (`ℤ[U]` has no `2`-torsion).

*Needs:* Mathlib `Matrix.det_transpose`, `Matrix.det_neg`, `MvPolynomial.coeff`,
`MvPolynomial.IsHomogeneous`.

**Checks.**

- `n = 1`: `univDisc 1 = 2U₀₀` and `univHalfDisc 1 = U₀₀`.
- `n = 3`, at the form `a x² + b y² + c z² + u y z + v x z + w x y`:
  `δ' = 4abc + uvw − au² − bv² − cw²`, Voight's half-discriminant (Voight 2011, (3.2), p. 9,
  arXiv numbering), computed as `½ det !![2a, w, v; w, 2b, u; v, u, 2c]`.
- `n = 2`: `univDisc 2 = 4U₀₀U₁₁ − (U₀₁ + U₁₀)²` has odd coefficients (`−1` at `U₀₁²`), so the
  hypothesis `n` odd is needed and `univHalfDisc 2` (floor division) is not a half of
  `univDisc 2`.

### 1.2 The half-discriminant of a form

Define `halfDisc Q = evalMatrix (coeffMatrix Q) (univHalfDisc n)`. Prove `two_mul_halfDisc`: for
`n` odd, `2 δ'(Q) = det (polarMatrix Q)`; and `halfDisc_eq_of_toQuadraticMap`: for `n` odd and
any bilinear form `B` on `Fin n → R` with `B.toQuadraticMap = Q`, evaluating `univHalfDisc n` at
the matrix of `B` gives `δ'(Q)`. Route for the second: two such `B` differ by an alternating
matrix `A`, and `det(U + A + (U + A)ᵀ) = det(U + Uᵀ)` in `ℤ[U, A]`, which has no `2`-torsion.
When `Invertible (2 : R)` and `n` is odd, `two_mul_halfDisc`, Tau Ceti's
`QuadraticForm.det_toMatrix_polarBilin` in the standard basis and Mathlib's
`QuadraticForm.discr_eq_discr'` give `2 δ'(Q) = 2ⁿ QuadraticForm.discr' Q`, so
`δ'(Q) = 2^(n−1) discr' Q`, and the rules of 1.3 restrict to Mathlib's `QuadraticForm.discr'_comp`
(factor `(det g)²`) and `QuadraticForm.discr'_smul` (factor `aⁿ`).

*Needs:* 0.1, 1.1; Mathlib `LinearMap.BilinMap.toQuadraticMap_surjective`, `eval₂Hom`,
`QuadraticForm.discr'`, `QuadraticForm.discr_eq_discr'`; Tau Ceti
`QuadraticForm.det_toMatrix_polarBilin`.

**Checks.**

- `δ'(a x²) = a` on `Fin 1 → R`, for every `R`, including `R = 𝔽₂` where `det polar = 0`.
- `δ'(standard 3) = −1` and `δ'(x² + y z) = −1` over `𝔽₂`, so `δ' = 1` there, while
  `δ'(x² + y² + z²) = 4 = 0` over `𝔽₂`, where the form is `(x + y + z)²`.
- For `q = x² + y z` on `Fin 3 → ℤ` and the representative `B` with matrix
  `!![1, 0, 0; 0, 0, 0; 0, 1, 0]` (the `y z` term placed below the diagonal), evaluation of
  `univHalfDisc 3` at `B` is again `−1`; over `𝔽₂` the polar determinant of this form is `0`
  and cannot be halved there.
- Against Mathlib's `discr'` at `q₃ = standard 3` over `ℚ`:
  `discr' q₃ = det !![0, ½, 0; ½, 0, 0; 0, 0, 1] = −1/4` and `2² · (−1/4) = −1 = δ'(q₃)`; reading
  `δ'` as `discr'` would give `−1/4`, and as half of `discr'`, `−1/8`.

### 1.3 Transformation rules

Prove `halfDisc_mapCoeffs` (`δ'(mapCoeffs f Q) = f (δ'(Q))`, every `n`), `halfDisc_comp`
(`n` odd: `δ'(Q ∘ g) = (det g)² δ'(Q)` for every matrix `g`, Conrad 2014, Proposition C.1.4 (2)
and (3), p. 304) and that `δ'(a Q) = aⁿ δ'(Q)` for every `n`. Route: each identity
holds in the universal ring after multiplication by `2`, where it is the corresponding identity
for determinants, and the universal ring has no `2`-torsion; `halfDisc_comp` uses 1.2 to replace
the non-upper-triangular `gᵀ U g` by its folded form.

*Needs:* 0.1, 0.2, 1.1, 1.2; Mathlib `Matrix.det_mul`, `Matrix.det_transpose`,
`MvPolynomial.IsHomogeneous`.

**Checks.**

- `g = diag(−1, 1, 1)` on `standard 3`: `δ'` is unchanged, `(det g)² = 1`.
- `g = 2 · 1` on `x²` (rank `1`): `δ'(4 x²) = 4 = 2² · 1`.
- `a = −1` on `standard 3`: `δ'(−q₃) = (−1)³ · (−1) = 1`, so `δ'` is not invariant under
  `Q ↦ −Q` in odd rank (Conrad 2014, Definition C.1.2, chooses one sign of `q₂ₘ₊₁`).

### 1.4 Even rank: the hafnian congruence

Define the universal hafnian `univHafnian n`: the sum, over the perfect matchings `σ` of `Fin n`
(involutions without fixed points), of `∏_{i < σ i} (U_{i σ i} + U_{σ i i})`, the off-diagonal
entries of `U + Uᵀ`. Prove `four_dvd_univSignedDisc_sub_sq`: for `n` even, `4` divides
`(−1)^(n/2) det(U + Uᵀ) − B²` in `ℤ[U]`, `B = univHafnian n`. Route, without Pfaffians: with
`P = U + Uᵀ` and `K = U − Uᵀ`, Tau Ceti's
`Matrix.four_dvd_neg_one_pow_mul_det_add_transpose_sub_det_sub_transpose` at `S = U`, `k = n/2`,
gives `(−1)^(n/2) det P ≡ det K (mod 4)` in `ℤ[U]`; Tau Ceti's
`Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero` over the fraction field of `ℤ[U]` makes
`det K` a square there, hence a square `r²` in `ℤ[U]`, which is integrally closed; modulo `2`, the
determinant of a symmetric matrix with zero diagonal is the square of its matching sum, so
`r ≡ B (mod 2)` and `det K ≡ B² (mod 4)`. For an integer symmetric matrix with even diagonal and
`4 ∣ n` the congruence is Auel–Biesel–Voight 2023, Proposition 3.20 (arXiv numbering), with the
Pfaffian of `K`, which is `B` modulo `2`, in place of `B`; its Proposition 3.10 and Lemma 3.21
prove, for an integer `U` and `4 ∣ n`, the case of Tau Ceti's congruence used here. The hafnian
step (`r ∈ ℤ[U]`, `r ≡ B (mod 2)`) is proved by the route. Define
`univDiscConst n`, the coefficients of `(−1)^(n/2) det(U + Uᵀ) − B²` divided by `4`, and
`discAlgebra Q`, the free quadratic algebra `QuadraticAlgebra R C B` at the values `C`, `B` of these
polynomials at `coeffMatrix Q`. Prove `discr_discAlgebra`: for `n` even, its discriminant `B² + 4C`
is `(−1)^(n/2) det(polarMatrix Q)`, by the divisibility above, evaluated at `coeffMatrix Q`.

*Needs:* 0.1, 1.1; Mathlib `Matrix.det_transpose`, `Equiv.Perm`, `QuadraticAlgebra`,
`QuadraticAlgebra.discr`, `FractionRing`, `IsIntegrallyClosed` of `MvPolynomial` over `ℤ`; Tau Ceti
`Matrix.four_dvd_neg_one_pow_mul_det_add_transpose_sub_det_sub_transpose`,
`Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero`.

**Checks.**

- `n = 2`, `q = a x² + b x y + c y²`: `B = b`, `(−1) det = b² − 4ac`, `C = −ac`, and
  `discAlgebra q` is `R[ω]/(ω² − bω + ac)`, whose discriminant is `b² − 4ac`; `ω ↦ −τ` identifies
  it with the algebra `τ² = −bτ − ac` that Wood attaches to `q` (Wood 2011, §2, Key
  Construction).
- `n = 0`: the empty matching gives `B = 1`, `det = 1`, `C = 0`, and `discAlgebra` is
  `R[ω]/(ω² − ω) ≅ R × R`.
- The sign: with `(−1)^(n/2 + 1)` in place of `(−1)^(n/2)`, `n = 2` gives
  `4ac − b² − b² = 4ac − 2b²`, which is `−2` at `a = c = 0`, `b = 1`, not divisible by `4`.
- At `standard 4`, of the three matchings of `Fin 4` only `{0, 1}, {2, 3}` meets nonzero entries,
  so `B = 1`, `det = 1` and `C = 0`.

### Examples

- `δ'(standard (2m + 1)) = (−1)^m` (Conrad 2014, proof of Proposition C.1.4, p. 305, for
  Conrad's `q_{2m+1}`, which has the same `δ'` by the Conventions).
- `det polarMatrix (standard (2m)) = (−1)^m`: the polar matrix is block diagonal with `m` blocks
  `!![0, 1; 1, 0]`, each of determinant `−1`.
- Over a field `K` of characteristic two, at `f = Σᵢ (aᵢ xᵢ² + bᵢ xᵢ yᵢ + cᵢ yᵢ²)` with every
  `bᵢ ≠ 0`: `B = ∏ bᵢ`, `C = Σᵢ aᵢcᵢ ∏_{j≠i} bⱼ²` (the reduction of
  `(∏ (bᵢ² − 4aᵢcᵢ) − ∏ bᵢ²)/4`), and
  `ω = B t` identifies `discAlgebra f` with `K[t]/(t² + t + Σ aᵢcᵢ/bᵢ²)`, the Artin–Schreier algebra
  of Arf's invariant, GeometryOfNumbersAndQuadraticArithmetic §6.8's `arfInvariant f`: the class
  in `K/℘(K)` of `Σ f(uᵢ) f(vᵢ)` for a symplectic basis `(uᵢ, vᵢ)`, which for `uᵢ` the `xᵢ`-basis
  vector and `vᵢ` the `yᵢ`-basis vector divided by `bᵢ` is `Σ aᵢcᵢ/bᵢ²`. For `bᵢ = 1` this is
  Dieudonné's computation of the centre of `C₀(f)`, `z² + z = Σ aᵢcᵢ` (Dieudonné 1955, §2,
  pp. 908–909).

### Dependencies

Layer 0; Mathlib `Matrix.det`, `MvPolynomial`, `QuadraticAlgebra`, `QuadraticForm.discr'`; Tau
Ceti `Matrix.four_dvd_neg_one_pow_mul_det_add_transpose_sub_det_sub_transpose`,
`Matrix.isSquare_det_of_transpose_eq_neg_of_diag_eq_zero`,
`QuadraticForm.det_toMatrix_polarBilin`; GeometryOfNumbersAndQuadraticArithmetic §6.8 (Examples).

## Layer 2: smooth forms

### 2.1 Smoothness

Define `IsSmooth Q`: for every algebraically closed field `K` in the universe of `R` and every ring
map `f : R →+* K`, `(mapCoeffs f Q).radical = ⊥`, that is, no nonzero `x ∈ Kⁿ` has `Q_K x = 0` and
`polar Q_K x = 0`. This is Conrad's non-degeneracy (Conrad 2014, §C.1, p. 302: the zero scheme of
`q` in `ℙ(V*)` is a smooth hypersurface, fibre by fibre, which SGA 7 calls *ordinary*), called
regularity or semi-regularity by Knus (Knus 1991, Chapter IV, (3.1), as Conrad cites it in Remark
C.1.1). Prove the comparison with LefschetzPencilsAndVanishingCycles §2.1: for `n ≥ 1`, `IsSmooth Q`
holds exactly when `Q` is ordinary in the sense of §2.1 (nowhere zero, with smooth quadric) on the
free module `Fin n → R`. Route: both sides may be tested at the geometric points of `Spec R` (§2.1);
over an algebraically closed field the quadric is singular at `[v]` exactly when `Q(v) = 0` and
`polar Q v = 0`, that is when `v` lies in the radical, and for `n ≥ 1` the zero form, the only form
that is not nowhere zero there, has the whole space as radical. Rank `0` differs: the zero form on
`Fin 0 → R` is smooth here and excluded by §2.1. No source is named for the comparison on
`Fin n → R`; the route is its proof. Through §2.1, over a field `IsSmooth Q` is Mathlib's
`QuadraticMap.Nondegenerate Q` (both hold when `n = 0`), and `IsSmooth` is stable under base change
(`IsSmooth (mapCoeffs f Q)` for any `f`), under `Q ↦ Q ∘ g` for `g ∈ GLₙ(R)` and under `Q ↦ u Q` for
`u ∈ Rˣ`; each of these also follows from the definition and 0.2.

*Needs:* 0.2; Mathlib `QuadraticMap.radical`, `QuadraticMap.Nondegenerate`, `IsAlgClosed`;
LefschetzPencilsAndVanishingCycles §2.1 (ordinary forms, base change, fibre criterion).

**Checks.**

- `n = 1`: `a x²` is smooth exactly when `a ∈ Rˣ`; the zero form on `Fin 1 → R` is not, although
  its quadric `ℙ⁰` is smooth, because it is not a divisor; the radical condition excludes it.
- Over a field of characteristic two, `x² + y²` on `Fin 2 → K` has zero polar form and radical
  the line `x = y` over `K̄`: not smooth; `x y` and `x² + x y + y²` are smooth.
- Over `𝔽₂`, `x² + y z` is smooth (polar radical the `x`-axis, where `q = x² ≠ 0`) and
  `x² + y² + z²` is not; a definition by non-degeneracy of the polar form would call no form of
  odd rank smooth in characteristic two. `x² + y z` is ordinary in the sense of
  LefschetzPencilsAndVanishingCycles §2.1 (the conic `x² + y z = 0` is smooth), as the
  comparison requires.
- Over `𝔽₂(t)`, `x² + t y²` has zero radical over `𝔽₂(t)` but not over its algebraic closure
  (`x = √t y`), and its polar kernel has rank `2`, so `QuadraticMap.Nondegenerate` fails:
  testing only rational vectors would call it smooth. The zero form on `Fin 0 → R` is smooth and
  not ordinary, so the comparison needs `n ≥ 1`.

### 2.2 The unit criteria

Prove `isSmooth_iff_isUnit_halfDisc` (`n` odd: `IsSmooth Q ↔ IsUnit δ'(Q)`) and
`isSmooth_iff_isUnit_det` (`n` even: `IsSmooth Q ↔ IsUnit (det polarMatrix Q)`) (Conrad 2014,
Proposition C.1.4 (3), p. 304, and the paragraph before it, p. 304). Route: both sides are
fibrewise, an element is a unit exactly when it is nonzero at every geometric point, and over an
algebraically closed field the defect `dim V^⊥` of the polar form has the parity of `n` in
characteristic two (Conrad 2014, Exercise 1.6.10, p. 50); for `n` odd and `q` degenerate, `q` is
a form in fewer variables after a change of coordinates, so a lift over the Witt vectors has
discriminant `0` (Conrad 2014, proof of Proposition C.1.4). In even rank, on `Fin n → R`,
`IsUnit (det polarMatrix Q)` says that `polarBilin Q` is bijective, the form of ordinarity that
LefschetzPencilsAndVanishingCycles §2.2 uses.

*Needs:* 1.2, 1.3, 2.1; Mathlib `isUnit_iff_ne_zero`, `Ideal.exists_le_maximal`,
`AlgebraicClosure`, `WittVector`.

**Checks.**

- `n = 3` over `𝔽₂`: `δ'(x² + y z) = 1`, smooth; `δ'(x² + y² + z²) = 0`, not smooth.
- `n = 2` over `𝔽₂`: `x y` has polar determinant `−1 = 1`, smooth; `x² + y²` has polar
  determinant `0`, not smooth; over `ℤ`, `x² + y²` has `det = 4`, not a unit, and is not smooth at
  the prime `2`, while it is smooth over `ℤ[1/2]`.
- The zero ring: every form is smooth and every element is a unit.

### 2.3 Standard forms

Define `standard n` as in the Conventions. Prove that it is smooth for every `n` and every `R`,
with `δ'(standard (2m + 1)) = (−1)^m` and `det polarMatrix (standard (2m)) = (−1)^m` (Conrad
2014, Definition C.1.2 and the sentence after it, p. 303, for Conrad's `q_n`, which has the same
`δ'` and polar determinant by the Conventions; proof of Proposition C.1.4, p. 305, for the odd
value; the even value is the block computation of the Layer 1 Examples). Route: the unit criteria
of 2.2 at these values.

*Needs:* 1.2, 2.2.

**Checks.**

- `standard 1 = x₀²`, `standard 2 = x₀x₁`, `standard 3 = x₀x₁ + x₂²`.
- `standard 0` is the zero form on the zero module, smooth, with polar determinant `1`.
- The diagonal form `x₀² + x₁² + x₂²` is not isometric to `standard 3` over `ℤ`: its
  half-discriminant `4` is not a unit.

### 2.4 Local triviality

Prove `isSmooth_iff_exists_faithfullyFlat`: `Q` is smooth exactly when there are a faithfully
flat, finitely presented `R`-algebra `S` and an isometry `mapCoeffs (algebraMap R S) Q ≃ qₙ`;
and `exists_etale_isometryEquiv_standard`: when `Q` is smooth and `n` is even or `2 ∈ Rˣ`, `S` can
be taken étale (Conrad 2014, Lemma C.2.1, p. 309, for `n ≥ 1`; `n = 0` is trivial). Route: for
`n ≥ 1`, `Q` is ordinary by 2.1, and LefschetzPencilsAndVanishingCycles §2.1's normal form gives,
étale-locally on `Spec R`, `Q ≅ Σ_{i=1}^{m} xᵢ x_{i+m}` for `n = 2m`, which is `qₙ` after a
permutation of the coordinates, and `Q ≅ Σ_{i=1}^{m} xᵢ x_{i+m} + λ x_{2m+1}²` with `λ` a unit for
`n = 2m + 1`. In odd rank pass to `T = QuadraticAlgebra S λ⁻¹ 0 = S[t]/(t² − λ⁻¹)`, where
`λ (t y)² = y²`: `T` is free of rank two, hence faithfully flat and finitely presented, and it is
étale when `2 ∈ Rˣ`, its discriminant `4λ⁻¹` being a unit (Tau Ceti
`QuadraticAlgebra.etale_iff_isUnit_discr`). The finitely many members of an étale cover of
`Spec R` give one faithfully flat étale algebra, their product. The converse is that smoothness
descends along a faithfully flat map, since every geometric point of `R` lifts to `S`. Owned here
are the odd-rank step, the passage to one algebra and the converse; the even-rank normal form is
§2.1's.

*Needs:* 2.1, 2.2, 2.3; Mathlib `Module.FaithfullyFlat`, `Algebra.Etale`,
`Algebra.FinitePresentation`, `QuadraticMap.IsometryEquiv`, `QuadraticAlgebra`; Tau Ceti
`QuadraticAlgebra.etale_iff_isUnit_discr`; LefschetzPencilsAndVanishingCycles §2.1 (normal form).

**Checks.**

- Over `𝔽₂(t)`, `t x²` is smooth and not isometric to `x²` over any nonzero étale
  `𝔽₂(t)`-algebra `S`: an isometry is multiplication by a unit `u` of `S` with `u² = t`, so every
  factor field of `S`, separable over `𝔽₂(t)`, would contain the inseparable `√t`. It is isometric
  to `x²` over `𝔽₂(√t)`, finite flat: the étale statement needs `n` even or `2 ∈ Rˣ`. (Over the
  zero algebra, which is étale but not faithfully flat, both forms live on the zero module.)
- Over `ℝ`, `x² + y²` becomes `x y` over `ℂ`, which is étale over `ℝ`.
- The zero form on `Fin 2 → R` is not smooth, and over any nonzero `S` it is not isometric to
  `x y`, which takes the value `1`.

### Examples

- `x² + x y + y²` over `ℤ` has polar determinant `4 − 1 = 3`: it is smooth over `ℤ[1/3]` and not
  at the prime `3`. Over `ℤ[1/3][ζ₃]`, étale over `ℤ[1/3]`, it is `(x − ζ₃ y)(x − ζ₃⁻¹ y)`,
  isometric to `x y` by a change of variables of determinant `ζ₃ − ζ₃⁻¹`, a unit since its
  square is `−3`.

### Dependencies

Layers 0 and 1; Mathlib `QuadraticMap.radical`, `QuadraticMap.Nondegenerate`,
`Module.FaithfullyFlat`, `Algebra.Etale`; Tau Ceti `QuadraticAlgebra.etale_iff_isUnit_discr`;
LefschetzPencilsAndVanishingCycles §2.1.

## Layer 3: the orthogonal group scheme

### 3.1 Construction and representability

Define the points `orthogonalGroup Q A ≤ GL (Fin n) A` for every commutative `R`-algebra `A`, as
in the Conventions: the range of Tau Ceti's
`QuadraticMap.orthogonalToGeneralLinear (mapCoeffs (algebraMap R A) Q)`, so that the group of
points is Tau Ceti's `TauCeti.QuadraticMap.orthogonalGroup` of `Q_A` read in coordinates. Define
the relations `orthogonalRelations Q` (the entries of
`coeffMatrix (Q_H ∘ X) − coeffMatrix Q` in `H = TauCeti.GeneralLinear.coordinateHopfAlgebra R n`,
`X = TauCeti.GeneralLinear.genericMatrix R n`) and `orthogonalIdeal Q`, the ideal they generate.
Prove `exists_hopfIdeal_toIdeal_eq` (it is the underlying ideal of a `TauCeti.HopfIdeal`, built
with `HopfIdeal.ofSpan`) and `mem_orthogonalGroup_iff_le_ker` (a point `φ : H →ₐ[R] A` of `GLₙ`
lies in `O(Q)(A)` exactly when `orthogonalIdeal Q ≤ ker φ`), so that `O(Q)` is represented by the
finitely presented quotient `H ⧸ orthogonalIdeal Q` (Conrad 2014, §C.1, p. 303). Route: the
comultiplication of an entry of `coeffMatrix (Q ∘ X) − coeffMatrix Q` is computed by
`Q ∘ (X ⊗ X) − Q = (Q ∘ X − Q) ∘ X + (Q ∘ X − Q)`, as for `TauCeti.ConstantForm`. Prove also the
comparison with OrthogonalTamagawaAndLatticeMass §0.1a: over a perfect field `k` of
characteristic two, `H ⧸ orthogonalIdeal Q` represents §0.1a's `O(q)` on `W = kⁿ`, both being cut
out of `GLₙ` by the coefficients of `q(g x) − q(x)`. Prove `mem_constantForm_polarMatrix_iff`,
the comparison with OrthogonalTamagawaAndLatticeMass §0.1, whose `O(V, Q)` over a field of
characteristic `≠ 2` is `TauCeti.ConstantForm.groupScheme K n C`: when `Invertible (2 : R)`, a
point `h ∈ GLₙ(A)` satisfies `h C hᵀ = C` at `C = polarMatrix Q` exactly when `h = (gᵀ)⁻¹` for
some `g ∈ orthogonalGroup Q A`, so that `g ↦ (gᵀ)⁻¹` is an isomorphism from `O(Q)` onto the group
scheme of `TauCeti.ConstantForm` at the polar matrix. This is the transport `M ↦ M⁻ᵀ` between the
column convention `gᵀ C g = C` and the row convention `M C Mᵀ = C` that
OrthogonalTamagawaAndLatticeMass records in its Conventions. Route: Tau Ceti's
`TauCeti.QuadraticMap.mem_orthogonalGroup_iff_toMatrix` in the standard basis
(`QuadraticMap.coe_orthogonalToGeneralLinear`) and Tau Ceti's `QuadraticForm.toMatrix_polarBilin`,
with `2` a unit, give `g ∈ O(Q)(A) ↔ gᵀ C g = C`; then put `h = g⁻ᵀ` and apply
`TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`. Layer 3 extends both
groups to an arbitrary base. No source is named for the two comparisons; the routes are their
proofs.

*Needs:* 0.1, 0.2; Tau Ceti `GeneralLinear.coordinateHopfAlgebra`, `genericMatrix`,
`pointsMulEquiv`, `HopfIdeal`, `HopfIdeal.ofSpan`, `TauCeti.QuadraticMap.orthogonalGroup`,
`QuadraticMap.orthogonalToGeneralLinear`, `TauCeti.ConstantForm.definingHopfIdeal`,
`TauCeti.CommHopfAlgCat.quotientPointsSubgroup`,
`TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`,
`TauCeti.QuadraticMap.mem_orthogonalGroup_iff_toMatrix`,
`QuadraticMap.coe_orthogonalToGeneralLinear`, `QuadraticForm.toMatrix_polarBilin`;
OrthogonalTamagawaAndLatticeMass §0.1 and §0.1a.

**Checks.**

- `n = 1`, `Q = x²`: the relation is `X₀₀² − 1`, and `O(Q) = μ₂`; over `𝔽₂[ε]/(ε²)`, `1 + ε` is a
  point, since `(1 + ε)² = 1`.
- `Q = x₀x₁`: the relations are `X₀₀X₁₀`, `X₀₁X₁₁` and `X₀₀X₁₁ + X₀₁X₁₀ − 1`; their points are
  `!![t, 0; 0, t⁻¹]` and `!![0, t; t⁻¹, 0]` over a connected `A`; the bilinear relations
  `X C Xᵀ = C` of `TauCeti.ConstantForm` at the polar matrix `C = !![0, 1; 1, 0]` give the same
  points over `ℤ[1/2]`, by the identity map, only because here `C⁻¹ = C`, so that `gᵀ C g = C`
  forces `g C gᵀ = C`; over `𝔽₂` they also allow `!![1, 1; 0, 1]`, which is not in `O(x₀x₁)`.
  Over `ℤ`, for `q₂ₘ`, the bilinear relations define a subscheme of `GL₂ₘ` that is not flat, and
  `O(q₂ₘ)` is its largest `ℤ`-flat subscheme (Chaput–Romagny 2010, Remark 4.1.2, arXiv numbering).
- The zero form: `orthogonalIdeal 0 = ⊥` and `O(0) = GLₙ`.
- The `x₀x₁` Check agrees with OrthogonalTamagawaAndLatticeMass §0.1a's Check at `q = x y` on
  `𝔽₂²`: the points over `𝔽₂` are the identity and the swap, and the shear is excluded in both.
- `mem_constantForm_polarMatrix_iff` at `Q = x² + 4y²` over `ℚ`, `C = diag(2, 8)`:
  `g = !![0, 2; 1/2, 0]` has `Q(g x) = Q(x)`, but `g C gᵀ = diag(32, 1/2) ≠ C`, so the identity map
  does not send `O(Q)` into the points `M C Mᵀ = C`; `(gᵀ)⁻¹ = !![0, 1/2; 2, 0]` satisfies
  `M C Mᵀ = C`.

### 3.2 Determinant and the decomposition in odd rank

Prove `det_sq_eq_one`: for `Q` smooth, every `g ∈ O(Q)(A)` has `(det g)² = 1`; and
`mem_orthogonalGroup_iff_existsUnique`: for `n` odd and `Q` smooth, `g ∈ O(Q)(A)` exactly when
`g = ζ h` for a unique pair with `ζ² = 1`, `h ∈ O(Q)(A)` and `det h = 1`, so that
`O(Q) = μ₂ × SO(Q)` with `SO(Q) = ker det` (Conrad 2014, proof of Theorem C.1.5, Step 2, p. 307).
Route: `δ'(Q ∘ g) = (det g)² δ'(Q)` (1.3) in odd rank, `det(polar(Q ∘ g)) = (det g)² det polar(Q)`
in even rank, and the invariant is a unit (2.2); then `ζ = det g`, since `det(ζ h) = ζⁿ = ζ`.

*Needs:* 1.3, 2.2, 3.1; Mathlib `Matrix.det_smul`, `Matrix.det_mul`.

**Checks.**

- Without smoothness: for `Q = 0` on `Fin 1 → ℚ`, `g = 2` lies in `O(Q)(ℚ) = ℚˣ` with
  `(det g)² = 4`.
- `n = 1`, `Q = x²`: `O = μ₂`, `SO = 1`, and `g = −1` is `ζ = −1`, `h = 1`.
- `n = 2`, `Q = x₀x₁`: `!![0, 1; 1, 0]` has determinant `−1`, which is not a scalar times an
  element of determinant `1` over `ℚ` (`det(ζ h) = ζ² = 1`); the decomposition is for odd `n`.

### 3.3 Smoothness

Prove `smooth_orthogonal_iff`: for `Q` smooth, `H ⧸ orthogonalIdeal Q` is smooth over `R` exactly
when `n` is even or `2 ∈ Rˣ`; and `smooth_specialOrthogonal`: for `n` odd and `Q` smooth,
`H ⧸ (orthogonalIdeal Q ⊔ (det X − 1))` is smooth over `R` (Conrad 2014, Theorem C.1.5, p. 305).
The route is infinitesimal lifting, which needs no flatness criterion. Both quotients are finitely
presented (finitely many relations in the finitely presented `H`), so it suffices to lift points
along a square-zero `A → A/J` of `R`-algebras (`Algebra.Smooth` is `Algebra.FormallySmooth` with
`Algebra.FinitePresentation`). Write `P = polarMatrix Q` and `B_Q(x, y) = xᵀ P y`.

- *`smooth_orthogonal_iff`, from `n` even or `2 ∈ Rˣ`.* Then `det P` is a unit: by 2.2 when `n` is
  even, and as `2 δ'(Q)` (1.2) when `n` is odd. Lift `g₀ ∈ O(Q)(A/J)` to any matrix `g̃` over `A`,
  invertible since `J` is nilpotent. The form `ψ = −(Q ∘ g̃ − Q)` has coefficients in `J`; let `β`
  be its coefficient matrix and `T = P⁻¹ β`. As `J² = 0` and `g̃ᵀ P g̃ ≡ P` modulo `J`,
  `Q(g̃ (1 + T) x) = Q(x) − ψ(x) + xᵀ P T x = Q(x)`, so `g = g̃ (1 + T)` lifts `g₀` to `O(Q)(A)`.
- *`smooth_orthogonal_iff`, the converse.* For `n` odd, `ζ ↦ ζ · 1` and `g ↦ det g` make `μ₂` a
  retract of `O(Q)` (3.2: `det(ζ · 1) = ζⁿ = ζ`), and a retract of a smooth algebra is smooth. If
  `2 ∉ Rˣ`, a maximal ideal `𝔪 ∋ 2` (`Ideal.exists_le_maximal`) gives, by base change, a smooth
  `μ₂` over the field `R/𝔪` of characteristic two, which it is not (Tau Ceti
  `RootsOfUnityGroup.coordinateRing_smooth_iff`).
- *`smooth_specialOrthogonal`.* Let `n` be odd, `Quadₙ(R) ≅ R^(n(n+1)/2)` the forms on
  `Fin n → R`, and `Φ : Mₙ(R) → Quadₙ(R) × R` the linear map `T ↦ (x ↦ B_Q(x, T x), tr T)`.
  Write `dδ'_Q(ψ)` for the coefficient of `ε` in `δ'(Q + ε ψ)` over `R[ε]/(ε²)`. By 1.3 over
  `R[ε]/(ε²)` at `g = 1 + ε T`, `Φ` takes values in the kernel `N` of
  `λ(ψ, t) = dδ'_Q(ψ) − 2 t δ'(Q)`. By 1.3, `δ'((1 + ε) Q) = (1 + ε)ⁿ δ'(Q)`, so
  `λ(Q, 0) = n δ'(Q)`; with `λ(0, 1) = −2 δ'(Q)` it generates the unit ideal, `n` being odd and
  `δ'(Q)` a unit (2.2). So `λ` is onto `R`, and `N` is a direct summand of rank `n(n + 1)/2`. At an
  algebraically closed field `k`, the kernel of `Φ_k` is the Lie algebra of `SO(Q_k)`, of
  dimension `n(n − 1)/2`: the Lie algebra of `O(Q_k)` has dimension `n(n − 1)/2 + (δ² + δ)/2`,
  `δ ∈ {0, 1}` the defect (Conrad 2014, proof of Theorem C.1.5, p. 307); when `δ = 1`
  (characteristic two) it contains `1`, of trace `n = 1`, and when `δ = 0` the trace vanishes on
  it, since there `K = P T` is alternating, `P` is invertible and `tr(P⁻¹ K) = −tr(P⁻¹ K)`. So `Φ_k`
  is onto `N ⊗ k`, `Φ` is onto `N` by Nakayama's lemma at every maximal ideal
  (`IsLocalRing.map_tensorProduct_mk_eq_top`, `surjective_of_isLocalized_maximal`), and
  `Φ ⊗ J : Mₙ(J) → N ⊗ J` is onto. Lift `g₀ ∈ SO(Q)(A/J)` to `g̃` with `det g̃ = 1` (scale a
  column by a unit `≡ 1` modulo `J`), and set `ψ = −(Q ∘ g̃ − Q)`. By 1.3, `δ'(Q − ψ) = δ'(Q)`, so
  `dδ'_Q(ψ) = 0` and `(ψ, 0) ∈ N ⊗ J`; choose `T ∈ Mₙ(J)` with `Φ(T) = (ψ, 0)`. Then
  `g = g̃ (1 + T)` preserves `Q` as above and has `det g = 1 + tr T = 1`.

*Needs:* 1.1, 1.2, 1.3, 2.2, 3.1, 3.2; Mathlib `Algebra.Smooth`, `Algebra.FormallySmooth`,
`Algebra.FinitePresentation`, `Algebra.Smooth.baseChange`, `Ideal.exists_le_maximal`,
`IsLocalRing.map_tensorProduct_mk_eq_top`, `surjective_of_isLocalized_maximal`; Tau Ceti
`RootsOfUnityGroup.coordinateRing_smooth_iff`.

**Checks.**

- `n = 1`, `R = 𝔽₂`, `Q = x²`: `O = μ₂ = Spec 𝔽₂[t]/(t − 1)²` is not smooth, and `SO = 1` is.
- `n = 2`, `R = 𝔽₂`, `Q = x₀x₁`: `O(Q)` is smooth of dimension `1`, with two components. The
  lifting step over `𝔽₂[ε]/(ε²)` at `g₀ = !![0, 1; 1, 0]`: the lift `g̃ = !![ε, 1; 1, 0]` has
  `Q ∘ g̃ − Q = ε x₀²`, so `β = !![ε, 0; 0, 0]`, `T = P⁻¹ β = !![0, 0; ε, 0]`, and
  `g̃ (1 + T) = !![0, 1; 1, 0]` lies in `O(Q)`; with `T = 0` the lift `g̃` is not in `O(Q)`.
- Without smoothness of `Q`: for `Q = x² + y² = (x + y)²` over `𝔽₂`, the points of `O(Q)` over an
  algebraically closed field `K` are the `!![a, b; 1 + a, 1 + b]` with `a ≠ b`, a family of
  dimension `2`, not `n(n − 1)/2 = 1`.

### 3.4 Forms and torsors

Prove that `P ↦ (the form P ∧^{O(qₙ)} qₙ)` is a bijection from SchemeAndStackFoundations'
`NonabelianH1` of the big fppf site of `Spec R` with coefficients `O(qₙ)` (§2.3) onto isometry
classes of smooth forms on locally free modules of rank `n`, with the trivial class going to
`qₙ`; and that it restricts to the classes of forms on `Fin n → R` among them. Route: 2.4 says
that every smooth form is an fppf twist of `qₙ`; fppf descent of modules with a quadratic form
(SchemeAndStackFoundations §1.1), and `Isom(qₙ, Q)` as an `O(qₙ)`-torsor (SchemeAndStackFoundations
§1.15). §1.15 applies because `O(qₙ)` is flat and finitely presented over `ℤ`: smooth for `n` even
(3.3), and `μ₂ × SO(qₙ)` with `SO(qₙ)` smooth for `n` odd (3.2, 3.3). No source is named for the
bijection; the route is its proof.

*Needs:* 2.4, 3.1, 3.2, 3.3; SchemeAndStackFoundations §1.1 (descent of quasi-coherent modules),
§1.15 (`IsTorsor`) and §2.3 (`NonabelianH1`, `NonabelianH1.mk`, `mk_eq_one_iff`).

**Checks.**

- Over a local ring with `n` even, a smooth form is hyperbolic exactly when its torsor class
  is trivial. `H¹(ℝ, O(q₂))` has three elements, the classes of `x y` (trivial), `x² + y²` and
  `−x² − y²`: the smooth real binary forms of signatures `(1, 1)`, `(2, 0)` and `(0, 2)`.
- `n = 1`: `O(q₁) = μ₂`, and the classes are `H¹_fppf(R, μ₂)`, the forms `u x²` on invertible
  modules; over a field `k`, `k^×/k^{×2}`, also in characteristic two.
- `n = 1` over `ℤ`: `H¹(ℤ, μ₂) = {±1}`, the forms `x²` and `−x²`.
- `n = 8` over `ℤ`: the `E₈` lattice with `q(x) = x·x/2` has polar determinant `1`, so it is smooth,
  and it is positive definite, so not isometric to the indefinite `q₈`: its class in
  `H¹(ℤ, O(q₈))` is not trivial.

**Forms over a polynomial ring (not a target).** By 3.4 the analogue of the Quillen–Suslin theorem
for smooth forms would say that every smooth form over `k[x₁, …, x_m]`, `k` a field, is extended
from `k`. It fails: there are fields `k` and quadratic spaces over `k[x₁, …, x_m]` that are not
extended from `k` (Parimala 1978). More generally, torsors over a polynomial ring under a reductive
group need not descend to the base, and a positive statement is expected only for totally
isotropic groups (Česnavičius 2022, §3.6 and Conjecture 3.6.1).

### Examples

- For `q = x₀x₁` over `ℤ`, `O(q)(ℤ)` is `{!![t, 0; 0, t]} ∪ {!![0, t; t, 0]}` for `t = ±1`, of
  order `4`.

### Dependencies

Layers 0–2; Tau Ceti `GeneralLinear`, `HopfIdeal`, `ConstantForm`, `RootsOfUnity`,
`TauCeti.QuadraticMap.orthogonalGroup` and its coordinate criterion
`TauCeti.QuadraticMap.mem_orthogonalGroup_iff_toMatrix` with `QuadraticForm.toMatrix_polarBilin`;
OrthogonalTamagawaAndLatticeMass §§0.1, 0.1a; SchemeAndStackFoundations §§1.1, 1.15, 2.3.

## Layer 4: even Clifford algebras

### 4.1 Odd rank

Prove `isAzumaya_even_iff`: for `n ≥ 3` odd, `CliffordAlgebra.even Q` is an Azumaya `R`-algebra
exactly when `δ'(Q)` is a unit. The direction from a unit is Conrad 2014, Proposition C.2.4,
p. 311 (`C₀(Q)` is fppf-locally a matrix algebra), with 2.2; the converse: at a geometric point
where `Q` is not smooth, a nonzero radical vector `r` gives the two-sided ideal `r C₁` of `C₀`,
nilpotent since `r` anticommutes with every vector and `r² = 0`, and nonzero when `n ≥ 3`, so the
fibre is not central simple. For `n = 3` this is Voight's statement that a
quaternion ring is Azumaya exactly when its ternary form is semiregular (Voight 2011, §4, p. 17,
arXiv numbering, for `R` Noetherian).

*Needs:* 1.2, 2.2, 2.4; Mathlib `CliffordAlgebra.even`, `CliffordAlgebra.ι`, `IsAzumaya`.

**Checks.**

- `n = 1`, `Q = a x²`: `C₀ = R` is Azumaya for every `a`, while `δ' = a`; the radical vector
  `e₀` of `0 · x²` gives `e₀ C₁ = R q(e₀) = 0`. The hypothesis `n ≥ 3` is needed.
- `n = 3`, `Q = x² + y² + z²` over `ℤ`: `C₀` is the Lipschitz quaternions `ℤ⟨i, j⟩`, of
  discriminant `4`, not Azumaya; `δ' = 4`.
- `n = 3`, `Q = standard 3` over `ℤ`: `C₀ ≅ M₂(ℤ)` and `δ' = −1`.

### Examples

- `n = 2`, `Q = x² + x y + y²` over `𝔽₂`: `C₀ = 𝔽₂[t]/(t² + t + 1) = 𝔽₄` with `t = e₀e₁`, étale,
  as LefschetzPencilsAndVanishingCycles §2.2 (`evenClifford_center_etale_azumaya`) says of the
  centre of `C₀(Q)` for every smooth form of positive even rank over a nonzero ring: on
  `Fin n → R`, the bijectivity of `polarBilin Q` it assumes is `IsUnit (det polarMatrix Q)`, that
  is `IsSmooth Q` by 2.2.
- `n = 2`, `Q = x₀x₁`: `C₀ = R ⊕ R e₀e₁ ≅ R × R` by the idempotent `e₀e₁` (Conrad 2014,
  Remark C.2.3, p. 310); for `Q = x² + y²` over `𝔽₂`, not smooth, `C₀ = 𝔽₂[t]/(t² − 1)`, not
  étale.

### Dependencies

Layers 1 and 2; Mathlib `CliffordAlgebra`, `IsAzumaya`; LefschetzPencilsAndVanishingCycles §2.2
(Examples).

## Layer 5: quadratic algebras without dividing by two

### 5.1 The discriminant algebra of a form of even rank

Prove `etale_discAlgebra_iff`: for `n` even, `discAlgebra Q` (1.4) is étale exactly when `Q` is
smooth. Route: by Tau Ceti `QuadraticAlgebra.etale_iff_isUnit_discr` it is étale exactly when its
discriminant is a unit; by 1.4 that discriminant is `(−1)^(n/2) det(polarMatrix Q)`; by 2.2 this
is a unit exactly when `Q` is smooth. No source is named; the route is the proof.

*Needs:* 1.4, 2.2; Tau Ceti `QuadraticAlgebra.etale_iff_isUnit_discr`.

**Checks.**

- `n = 2`, `q = x y`: `B = 1`, `C = 0`, `discAlgebra q = R[ω]/(ω² − ω) ≅ R × R`.
- `n = 2`, `q = x² + x y + y²` over `𝔽₂`: `B = 1`, `C = −1 = 1`, `discAlgebra q = 𝔽₄`, étale.
- `n = 2`, `q = x² + y²` over `𝔽₂`: `B = 0`, `C = −1 = 1`, `discAlgebra q = 𝔽₂[ω]/(ω² + 1)`,
  not étale, and `q` is not smooth.

### 5.2 The product of quadratic algebras

Write `σ` for Mathlib's canonical involution `QuadraticAlgebra.starAlgEquiv`, `ω ↦ b − ω`. Prove
`exists_productHom`: for `A₁ = QuadraticAlgebra R a₁ b₁` and `A₂ = QuadraticAlgebra R a₂ b₂`, the
product `A₁ * A₂ = QuadraticAlgebra R a b` with `a = a₁b₂² + a₂b₁² + 4a₁a₂` and `b = −b₁b₂` has an
`R`-algebra map to `A₁ ⊗[R] A₂` with `ω ↦ 2 ω₁ ⊗ ω₂ − b₁ (1 ⊗ ω₂) − b₂ (ω₁ ⊗ 1)`, and when
`2, b₁, b₂` generate the unit ideal this map is injective with image the invariants of `σ ⊗ σ`.
The discriminant of `A₁ * A₂` is `(b₁² + 4a₁)(b₂² + 4a₂)`. Route: the relation
`(2 ω₁ω₂ − b₁ω₂ − b₂ω₁)² = a + b(2 ω₁ω₂ − b₁ω₂ − b₂ω₁)` holds in `A₁ ⊗ A₂` (expand and reduce
with `ωᵢ² = aᵢ + bᵢωᵢ`); in the basis `ω₁^ε₁ ⊗ ω₂^ε₂` the invariants are computed by a `4 × 4`
linear system whose solutions are spanned by `1` and the image of `ω` exactly when the ideal
`(2, b₁, b₂)` is `R`. The product is Voight's monoid operation on quadratic algebras (Voight 2016,
Construction 3.12 and (3.13), arXiv numbering): for `S = R ⊕ R x`, `x² = t x − n`, and
`T = R ⊕ R y`, `y² = s y − m`, it is `S ∗ T = R ⊕ R w` with `w² = st w − (mt² + ns² − 4nm)`,
satisfied by `w = x ⊗ y + σ(x) ⊗ σ(y)` in `S ⊗ T`. At `t = b₁`, `n = −a₁`, `s = b₂`, `m = −a₂`,
`ω ↦ w − b₁b₂` identifies `A₁ * A₂` with `A₁ ∗ A₂`, and `w − b₁b₂` is the image of `ω` above.
Voight 2016, Theorem A (iii), describes the invariants of `σ ⊗ σ` for separable `A₁`, `A₂`; the
injectivity and the image under `(2, b₁, b₂) = R` are proved by the route.

*Needs:* Mathlib `QuadraticAlgebra.lift`, `QuadraticAlgebra.omega`,
`QuadraticAlgebra.starAlgEquiv`, `Algebra.TensorProduct.map`, `Algebra.TensorProduct.basis`.

**Checks.**

- `A₁ = A₂ = QuadraticAlgebra ℤ 1 1 = ℤ[(1 + √5)/2]`: `a = 6`, `b = −1`, discriminant
  `1 + 24 = 25 = 5 · 5`, and `(2, 1, 1) = ℤ`.
- `A₁ = A₂ = ℤ[i]`: `a = 4`, `b = 0`, discriminant `16 = (−4)(−4)`; here `(2, 0, 0) ≠ ℤ`, and
  the invariants of `σ ⊗ σ` contain `i ⊗ i`, which is not in the image of
  `ω ↦ 2 (i ⊗ i)`: the hypothesis on `(2, b₁, b₂)` is needed for surjectivity.
- With `A₂ = R × R = QuadraticAlgebra R 0 1` (`ω² = ω`): `a = a₁` and `b = −b₁`, and
  `QuadraticAlgebra R a₁ (−b₁) ≅ A₁` by `ω ↦ −ω₁`: the split algebra is a unit for the product.

### Examples

- Over `ℤ[1/2]`, `A₁ * A₂` with `A₁ = ℤ[1/2][√d₁]`, `A₂ = ℤ[1/2][√d₂]` is `ℤ[1/2][√(d₁d₂)]`
  up to the scaling `ω ↦ ω/2`: `a = 4d₁d₂`, `b = 0`.
- Tau Ceti's `QuadraticAlgebra.etale_iff_isUnit_discr`, which 5.1 uses, at three algebras:
  `QuadraticAlgebra 𝔽₂ 1 1 = 𝔽₄`, discriminant `1 + 4 = 1`, is étale although `2 = 0`;
  `ℤ[i] = QuadraticAlgebra ℤ (−1) 0`, discriminant `−4`, is not étale over `ℤ` and is étale over
  `ℤ[1/2]`; `QuadraticAlgebra R 0 0 = R[ε]/(ε²)`, discriminant `0`, is never étale over a nonzero
  `R`.

### Dependencies

Layers 1.4 and 2 (5.1 only); Mathlib `QuadraticAlgebra`, `Algebra.Etale`, `Algebra.TensorProduct`;
Tau Ceti `QuadraticAlgebra.etale_iff_isUnit_discr`.

## Layer 6: the resultant of a binary form at formal degree

The discriminant of a polynomial is Mathlib's `Polynomial.discr`, related to the resultant at the
degrees of `f` and `f′` by `Polynomial.resultant_deriv`, with the values
`Polynomial.discr_of_degree_eq_two` and `Polynomial.discr_of_degree_eq_three`; its base change
along a degree-preserving map is Tau Ceti's `Polynomial.discr_map_of_natDegree_eq`, and for monic
`f` it is a unit exactly when `R[X]/(f)` is étale, by Tau Ceti's
`Polynomial.Monic.isUnit_discr_iff` and `Polynomial.Monic.etale_adjoinRoot_iff`
(`IsUnit f.discr ↔ f.Separable ↔ Algebra.Etale R (AdjoinRoot f)`). The discriminant at formal
degree, with its degree-drop laws and its compatibility with ring maps, is HyperellipticCurves
§0.1's `formDiscr n f`. This layer adds the resultant identity at formal degree.

### 6.1 The resultant at formal degree

Prove that, for `n ≥ 1` and `f : R[X]` with `natDegree f ≤ n`, over any commutative ring,
`f.coeff n * formDiscr n f = (−1)^(n(n−1)/2) * resultant f f′ n (n − 1)`. Route:
if `natDegree f = n`, `formDiscr n f = discr f` (HyperellipticCurves §0.1) and the identity is
Mathlib's `Polynomial.resultant_deriv`; if `natDegree f < n`, the left side is `0`, and so is the
right side: for `n ≥ 2` by `Polynomial.resultant_eq_zero_of_lt_lt`, since
`natDegree f′ ≤ n − 2 < n − 1`, and for `n = 1` because `f` is constant, `f′ = 0` and
`resultant f 0 1 0` is the `1 × 1` determinant of the constant coefficient of `0`. No source is
named; the route is the proof.

*Needs:* HyperellipticCurves §0.1 (`formDiscr`); Mathlib `Polynomial.resultant`,
`Polynomial.resultant_deriv`, `Polynomial.resultant_eq_zero_of_lt_lt`, `Polynomial.derivative`.

**Checks.**

- `n = 2`, `f = c + bX + aX²`: `formDiscr 2 f = b² − 4ac` and `resultant f f′ 2 1 = a(4ac − b²)`,
  so both sides are `a(b² − 4ac)`; with the sign `(−1)^(n(n−1)/2)` omitted the identity would read
  `a(b² − 4ac) = a(4ac − b²)`, false at `a = b = 1`, `c = 0`.
- `n = 2`, `f = c + bX` (a root at infinity): `formDiscr 2 f = b²` (HyperellipticCurves §0.1),
  the left side is `0`, and `resultant f b 2 1 = 0`; the identity does not determine
  `formDiscr n f` when `aₙ = 0`, which is why §0.1 states the degree drop separately.
- `n = 1`: `a₁ · 1 = resultant (a₀ + a₁X) a₁ 1 0 = a₁`, including `a₁ = 0`; `n = 3`,
  `f = X³ − X`: `formDiscr 3 f = 4` and `resultant f f′ 3 2 = −4 = (−1)³ · 4`.

### Examples

- `X² + X + 1` over `𝔽₂` has discriminant `1`, and `𝔽₂[X]/(X² + X + 1) = 𝔽₄` is étale; `X² − 2`
  over `ℤ` has discriminant `8`, not a unit, and `ℤ[√2]` is ramified at `2`; `X³ − X` over
  `ℤ[1/2]` has discriminant `4`, a unit, and `ℤ[1/2][X]/(X³ − X) ≅ ℤ[1/2]³` (Tau Ceti
  `Polynomial.Monic.isUnit_discr_iff`, `Polynomial.Monic.etale_adjoinRoot_iff`).

### Dependencies

HyperellipticCurves §0.1; Mathlib `Polynomial.resultant`, `Polynomial.discr`; Tau Ceti
`Polynomial.Monic.isUnit_discr_iff`, `Polynomial.Monic.etale_adjoinRoot_iff`.

## Downstream consumers

None.

## Research context

The half-discriminant was found independently by Grothendieck and by M. Kneser (Conrad 2014,
§C.1, p. 304). Grothendieck's notes on it are in the Montpellier fonds (folder 77, p. 68,
https://grothendieck.umontpellier.fr/77.pdf).

In even rank the two components of `O(Q)` are not separated by `det` at a prime of residue
characteristic two, but by the Dickson invariant `O(Q) → ℤ/2`, the action of `O(Q)` on the centre
of `C₀(Q)`, whose kernel `SO(Q)` is smooth with connected fibres for `Q` smooth of positive even
rank (Conrad 2014, (C.2.2), p. 313, Theorem C.2.11 and Remark C.2.12, p. 318). Over a field `K`
of characteristic two that centre is `K[z]/(z² + z − Δ)`, `Δ` being Arf's invariant in a symplectic
basis (GeometryOfNumbersAndQuadraticArithmetic §6.8, `arfInvariant`; Dieudonné 1955, §2,
pp. 908–909); for `q₂ₘ` over `ℤ` the Dickson invariant is the function `δ` with `det = 1 + 2δ` on
`O(q₂ₘ)` (Chaput–Romagny 2010, Lemma 4.1.4 and Definition 4.1.6, arXiv numbering). The congruence
of 1.4 has the shape of Stickelberger's theorem, which holds for every free algebra of finite rank
over a commutative ring: its discriminant is a square modulo `4` (Auel–Biesel–Voight 2023, Theorem
3.28, arXiv numbering). Biesel and Gioia attach to every commutative algebra of rank `n` a quadratic
algebra with the same discriminant form, multiplicative for the product of 5.2:
`Δ(A × B) ≅ Δ(A) ∗ Δ(B)` (Biesel–Gioia 2016, §8).

Whether a smooth form over a regular local ring `R` that is isotropic over `Frac R` is isotropic
over `R` is open in general. Quadratic forms are the cases that suggested the Colliot-Thélène–Panin
conjecture: for a reductive `R`-group `G`, if `G_K`, `K = Frac R`, has a parabolic subgroup of a
given type, so does `G` (Česnavičius 2022, Conjecture 3.3.3). That conjecture holds for
`dim R ≤ 1`, by the valuative criterion of properness, and for `R` Henselian (§3.3.5 (1)–(2));
several orthogonal cases are settled (§3.3.5 (3), with the references there); and it follows from
the Grothendieck–Serre conjecture together with the Colliot-Thélène–Sansuc purity conjecture
(§3.3.6). The Grothendieck–Serre conjecture is known in equal characteristic and open in mixed
characteristic, especially over ramified regular local rings (end of §3.1.4). A first ramified case
is `R = ℤ[x, y]/(x y − p)` localised at `(p, x, y)`: its maximal ideal is `(x, y)`, so `R` is
regular of dimension `2`, and `p = x y ∈ m²`.

## References

- A. Auel, O. Biesel, J. Voight, « Stickelberger's discriminant theorem for algebras », *Amer.
  Math. Monthly* 130 (2023), 656–670. doi:10.1080/00029890.2023.2206326; Zbl 1522.11116;
  arXiv:2208.06138.
- W. Bichsel, M.-A. Knus, « Quadratic forms with values in line bundles », in *Recent advances in
  real algebraic geometry and quadratic forms*, Contemp. Math. 155, Amer. Math. Soc., 1994,
  293–306. doi:10.1090/conm/155/01386; Zbl 0810.11023.
- O. Biesel, A. Gioia, « A new discriminant algebra construction », *Doc. Math.* 21 (2016),
  1051–1088. doi:10.4171/dm/552; Zbl 1365.13010; arXiv:1503.05318.
- P.-E. Chaput, M. Romagny, « On the adjoint quotient of Chevalley groups over arbitrary base
  schemes », *J. Inst. Math. Jussieu* 9 (2010), 673–704. doi:10.1017/S1474748010000125;
  Zbl 1202.13004; arXiv:0805.2140.
- B. Conrad, « Reductive group schemes », in *Autour des schémas en groupes*, vol. I, Panoramas
  et Synthèses 42–43, Soc. Math. France, 2014, 93–444. Zbl 1349.14151. Author's version:
  https://math.stanford.edu/~conrad/papers/luminysga3.pdf (Appendix C, pp. 302–325); page
  numbers above are those of this version.
- K. Česnavičius, « Problems about torsors over regular rings », with an appendix by Y. Zhao,
  *Acta Math. Vietnam.* 47 (2022), 39–107. doi:10.1007/s40306-022-00477-y; arXiv:2201.06424
  (numbering of v4).
- J. Dieudonné, « Pseudo-discriminant and Dickson invariant », *Pacific J. Math.* 5 (1955),
  907–910. doi:10.2140/pjm.1955.5.907; Zbl 0067.00705.
- M.-A. Knus, *Quadratic and Hermitian Forms over Rings*, Grundlehren der mathematischen
  Wissenschaften 294, Springer, 1991. doi:10.1007/978-3-642-75401-2.
- S. Parimala, « Failure of a quadratic analogue of Serre's conjecture », *Amer. J. Math.* 100
  (1978), no. 5, 913–924. doi:10.2307/2373953.
- J. Voight, « Characterizing quaternion rings over an arbitrary base », *J. reine angew. Math.*
  657 (2011), 113–134. doi:10.1515/crelle.2011.054; Zbl 1229.11146; arXiv:0904.4310.
- J. Voight, « Discriminants and the monoid of quadratic rings », *Pacific J. Math.* 283 (2016),
  483–510. doi:10.2140/pjm.2016.283.483; Zbl 1410.11032; arXiv:1504.05228.
- M. M. Wood, « Gauss composition over an arbitrary base », *Adv. Math.* 226 (2011), 1756–1771.
  doi:10.1016/j.aim.2010.08.018; Zbl 1262.11049; arXiv:1007.5285.
