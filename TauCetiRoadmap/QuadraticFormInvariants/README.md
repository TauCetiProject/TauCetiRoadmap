# Roadmap: quadratic forms and cohomological invariants

Mathlib has the linear algebra of quadratic forms in depth. It has `QuadraticMap` and
`QuadraticForm`, polar forms, orthogonal bases, diagonalization
(`QuadraticForm.equivalent_weightedSumSquares`), `Anisotropic`, the radical, the
EKM-style `QuadraticMap.Nondegenerate`, isometries, `Equivalent`, tensor products, the
classifications over `ℝ`, over `ℂ`, and over an algebraically closed field, and a full
Clifford-algebra directory. It also has the quaternion algebras `ℍ[R,c₁,c₂,c₃]` with
conjugation and the `QuaternionAlgebra.Basis` universal property, and the rank-2
`QuadraticAlgebra R a b` with its norm.

Mathlib has none of the arithmetic theory of quadratic forms over a field. It has no
hyperbolic-plane theory, no Witt decomposition, no Witt cancellation, no Witt ring, no
Pfister forms, no classification by discriminant and Hasse invariant, no Hilbert
symbol, no transfer of forms along a field extension, and no Stiefel-Whitney classes.

This roadmap builds that theory over a field with `2` invertible. The high points are:

- the four-fold splitting criterion for quaternion algebras;
- the classification of forms over a nonarchimedean local field by `(dim, d, s)`;
- Kahn's relative Stiefel-Whitney formula for transferred forms.

The last three layers state these invariants in mod-2 Galois cohomology.

The ownership boundary is local and acyclic. This roadmap consumes
`ProfiniteCohomology`, `LocalFieldsRamification`, and `ClassFieldTheory`. It owns the
norm-equation/quaternion Hilbert symbol and the comparison with the cohomological
pairing. Class Field Theory owns that pairing and Hilbert reciprocity; this roadmap
derives the sign product formula from it. Hasse--Minkowski and every global
classification or realization theorem belong to `GlobalQuadraticForms`.

## Suggested homes

The homes below mirror Mathlib's directory conventions.

- `TauCeti/LinearAlgebra/QuadraticForm/` for Witt theory, Pfister forms, the classical
  invariants at the form level, and the Scharlau transfer. Mathlib keeps
  `QuadraticForm` under `LinearAlgebra/`, so the form theory stays there.
- `TauCeti/Algebra/Quaternion/` for the quaternion symbol layer and its Brauer-class
  package. Mathlib keeps its quaternion and Brauer material under `Algebra/`.
- `TauCeti/NumberTheory/LocalField/QuadraticForm/` for the quadratic defect, the Hilbert
  symbol, and the local classification. The general local-field arithmetic these consume
  lands where the local-fields-ramification roadmap puts it, and is not duplicated here.
- `TauCeti/FieldTheory/QuadraticForm/` for the cohomological layers, that is the Brauer
  comparison, Stiefel-Whitney classes, and the relative formula. These sit next to
  the landed `TauCeti/FieldTheory/SquareClassGroup.lean` that they consume.

## Scope

Everything below is work that this roadmap wants. The exclusions are deliberate
choices, and a separate roadmap for any of them is welcome.

Excluded:

- the characteristic-2 theory of quadratic and bilinear forms, that is the Arf
  invariant and quasilinear forms. Grove's chapters on characteristic 2 and EKM Part II
  record how different that theory is, and every statement here assumes `2` invertible;
- the deep theory of Pfister forms, that is function-field methods, the Arason-Pfister
  Hauptsatz, the Milnor conjecture, the norm-residue theorem, and each classification
  statement that rests on them;
- the cohomological invariant theory of Garibaldi-Merkurjev-Serre beyond
  Stiefel-Whitney classes;
- Hasse--Minkowski, weak approximation for global forms, local-global isometry and
  isotropy, and classification or realization of forms over number fields. Those are
  owned by the `GlobalQuadraticForms` roadmap, which consumes the local invariants and
  the two frozen Hilbert-symbol bridges supplied here;
- graded mod-2 Galois cohomology in every degree. Layers 7 to 9 work in degrees `1`
  and `2`, which is what the Brauer comparison, the Hasse and Clifford comparisons, and
  the relative Stiefel-Whitney formula for a quadratic extension need. The total
  Stiefel-Whitney class, the Evens norm in every degree, and Kahn's Théorème 2 for an
  arbitrary finite separable extension are therefore excluded. A development of graded
  continuous cohomology is the natural home for them, and this roadmap's degree-1 and
  degree-2 statements are the special cases it would subsume.

Pfister forms are defined here in every degree. The elementary generation statements
for `I`, `I²`, and `I³` are proved, because Layer 5 consumes them. Nothing past that is
claimed.

## Standing hypotheses and conventions

Each layer states its results against this table.

- **Base field.** `K` is a field with `[Invertible (2 : K)]`. Mathlib's own
  quadratic-form theory uses this hypothesis in `QuadraticForm/Basis.lean`, in
  `AlgClosed.lean`, and for the `associated` bilinear form, so this roadmap follows it
  rather than `[NeZero (2 : K)]`. Over a field the two hypotheses are interderivable.
  The multiquadratic roadmap states its material with `[NeZero (2 : K)]` or
  `[CharZero K]`, and the conversion between the two is part of the interface.
- **Forms and regularity.** A form is a `QuadraticForm K V`, that is a
  `QuadraticMap K V K`. Finiteness is `[FiniteDimensional K V]`, carried as an instance
  and never bundled. Regularity is `QuadraticMap.Nondegenerate Q`, the EKM-style
  predicate of `QuadraticForm/Radical.lean`. A proof that wants the bilinear form
  converts through `nondegenerate_associated_iff` or
  `(QuadraticMap.associated Q).SeparatingLeft`, which is the hypothesis of
  `equivalent_weightedSumSquares_units_of_nondegenerate'`. Anisotropy is
  `QuadraticMap.Anisotropic`. The word "isotropic" always means `¬ Q.Anisotropic` on a
  nonzero space, and is never a new predicate.
- **Equivalence and diagonal forms.** Isometry classes use `QuadraticMap.Equivalent`,
  that is `Nonempty (Q₁.IsometryEquiv Q₂)`, which already compares forms on different
  spaces. The diagonal form `⟨a₁, …, aₙ⟩` is `QuadraticMap.weightedSumSquares K w` with
  `w : Fin n → K`. For a regular form the weights are units, that is `w : Fin n → Kˣ`
  coerced into `K`. The orthogonal sum of forms on different spaces is
  `QuadraticMap.prod`, and scaling is `a • Q`.
- **Square classes.** The square-class group is `Kˣ ⧸ Subgroup.square Kˣ`. It
  interoperates with the landed `TauCeti.SquareClassGroup`, which is
  `Additive Kˣ ⧸ (Subgroup.square Kˣ).toAddSubgroup`, an `𝔽₂ = ZMod 2`-vector space.
  Consume that file and do not redefine it. In a quotient-free statement, "same square
  class" is `IsSquare (a * b)` for units `a b : Kˣ`, as in
  `TauCeti.squareClass_eq_zero_iff`. This matches the multiquadratic roadmap's
  `Finset`-product idiom.
- **Representation and value sets.** `Represents Q a : Prop` is `∃ v, Q v = a` for
  `a : K`. `unitValueSet Q : Set Kˣ` is `{a : Kˣ | Represents Q (a : K)}`, the classical
  `D(q)` of nonzero represented values. The two are kept apart. Every classification
  statement below means `D(q)`, and a value set that contains `0` makes several of them
  false.
- **Discriminant and signed discriminant.** For `q ≅ ⟨a₁, …, aₙ⟩` the *discriminant* is
  `d(q) = a₁ ⋯ aₙ` in `Kˣ ⧸ (Kˣ)²`, and the **signed discriminant** is
  `d±(q) = (−1)^{n(n−1)/2} · d(q)`. The two names are `discr` and `signedDiscr`, and
  neither name is overloaded. Serre's classification invariant and the Stiefel-Whitney
  class `w₁` use the plain `d`. The Witt-ring isomorphism `I/I² ≅ Kˣ/(Kˣ)²` and the
  quadratic-extension dictionary use `d±`. The translation
  `d± = (−1)^{n(n−1)/2} d` is a stated lemma, `signedDiscr_eq_sign_mul_discr`, and
  every later proof converts through it.
- **The symbol is a quaternion algebra first and a group element later.** For
  `a, b ∈ Kˣ` the symbol `(a, b)` is the quaternion algebra `ℍ[K, a, b]`. This is
  Mathlib's two-parameter notation for `QuaternionAlgebra K a 0 b`, with `i² = a`,
  `j² = b`, and `ij = −ji = k`; see `Mathlib/Algebra/Quaternion.lean`. Through Layer 4
  the symbol is an algebra up to isomorphism. There, `(a,b) = (c,d)` means
  `Nonempty (ℍ[K,a,b] ≃ₐ[K] ℍ[K,c,d])`, and `(a,b) = 1` means
  `Nonempty (ℍ[K,a,b] ≃ₐ[K] Matrix (Fin 2) (Fin 2) K)`. In Layer 5, where the Brauer
  group is a group, `[(a,b)]` becomes an element that can be multiplied. In Layer 6 the
  local symbol `(a,b)_K` takes values in `{±1}`. No layer multiplies symbols before the
  layer that supplies the multiplication.
- **Two Hasse invariants, both named.** For `q ≅ ⟨a₁, …, aₙ⟩`,
  `s(q) = ∏_{i<j} (aᵢ, aⱼ)`, with the empty product for `n ≤ 1`. This is the Lam and
  Serre convention, that is Lam V.3.17 and Serre's `ε` in *A Course in Arithmetic*
  IV.2.1. It occurs twice below with two codomains, and the two names differ:
  - `hasseInvariant q : BrauerGroup K` in Layer 5;
  - `localHasse q : ℤˣ` over a nonarchimedean local field in Layer 6, built from the
    `{±1}`-valued Hilbert symbol and independent of Layer 5.

  The theorem that the second is the image of the first is stated at the end of
  Layer 6, and no earlier statement uses it. Two translations to other sources are
  stated as lemmas once their targets exist:
  - **O'Meara's Hasse symbol**, near 63:20, is
    `S(q) = ∏_{i≤j} (aᵢ, aⱼ) = s(q) · (d(q), −1)`;
  - the **Witt-Clifford invariant** `c(q)`, that is the Brauer class of `C(q)` or of
    `C₀(q)` by parity (Lam V.3.12), satisfies Lam V.3.20:
    `c = s · (−1, d)^{(n−1)(n−2)/2} · (−1,−1)^{(n+1)n(n−1)(n−2)/24}`, and
    `c = s · (−1,−1)^{m(m−1)/2}` on `I²` with `dim = 2m`.

  ⚠ Lam records that C. T. C. Wall's published version of the second translation is
  incorrect (Lam, p. 120, "Caution"). Do not import that formula from a secondary
  source. Cite Lam and prove it once.
- **Hilbert symbol.** Over a nonarchimedean local field `K`, and over `ℝ`,
  `(a,b)_K = +1` when `b = x² − a y²` has a solution `x, y ∈ K`, and `−1` otherwise.
  This is a definition and not a consequence of a classification, because it needs only
  the norm equation. It agrees with Serre's solvability form, that is with the statement
  that `z² − ax² − by² = 0` has a nontrivial zero (*A Course in Arithmetic* III.1.1). It
  also agrees with the norm criterion `b ∈ N(K(√a)ˣ)`. The equivalence of the three
  descriptions is the first milestone of Layer 6C, and symmetry `(a,b)_K = (b,a)_K` is
  the second. After the second, the orientation by `b ∈ N(K(√a)ˣ)` and Serre's
  orientation `(a,b) = 1` iff `a ∈ N(K(√b)/K)` are interchangeable, so a source may be
  read in either. Values live in `ℤˣ = {±1}`. The
  additive avatar is `ZMod 2` through the unique isomorphism, and the cohomological
  avatar is `μ₂ ≃ ZMod 2` in Layer 7. One value-dictionary file states these
  identifications once, and every later statement selects a side through that file.
- **Steinberg hypotheses.** Wherever `(a, 1−a)` or `(a) ∪ (1−a)` occurs, the statement
  carries `a : Kˣ` together with `h : (1 : K) − a ≠ 0`, so that `1 − a` has a unit
  coercion. Never write `a : K` and leave the two exclusions to the reader.
- **Pfister forms.** `⟨⟨a⟩⟩ = ⟨1, −a⟩` and
  `⟨⟨a, b⟩⟩ = ⟨1, −a⟩ ⊗ ⟨1, −b⟩ ≅ ⟨1, −a, −b, ab⟩`. This is the minus-sign convention of
  Lam Ch. X and of Elman-Karpenko-Merkurjev. Some older sources use `⟨1, a⟩` factors, so
  flag the convention at each citation. The `n`-fold `⟨⟨a₁, …, aₙ⟩⟩` is the `n`-fold
  tensor product, through Mathlib's `QuadraticForm/TensorProduct.lean`, which already
  carries `Invertible (2 : R)`.
- **Transfer.** The Scharlau transfer `s_*(q)` of a form `q` over `L` is taken along a
  nonzero `K`-linear functional `s : L →ₗ[K] K`, for `L/K` finite separable. The default
  functional is the trace `Algebra.trace K L`, written `Tr_*`. Every theorem is stated
  for a general nonzero `s`, with the trace as the named instance. Two lemmas make "the"
  transfer well defined and are early targets: the nonzero functionals form a single
  `Lˣ`-orbit (Layer 9), and `s'_*(q) ≅ s_*(⟨λ⟩ ⊗ q)` when `s' = s ∘ (λ·)`.
- **Cohomological dictionary** for Layers 7 to 9. `Kˢ` is the separable closure and
  `G_K = Gal(Kˢ/K)`. `H¹(G_K, μ₂) ≅ Kˣ/(Kˣ)²` is the Kummer isomorphism, and the class
  of `a` is written `(a)`. The identification of `Br(K)[2]` with `H²(G_K, μ₂)` is proved
  in Layer 7B and is never assumed before it. The Stiefel-Whitney classes of
  `q ≅ ⟨a₁, …, aₙ⟩` in the two degrees this roadmap uses are `w₁(q) = ∑ᵢ (aᵢ)` and
  `w₂(q) = ∑_{i<j} (aᵢ)(aⱼ)`, which are the degree-1 and degree-2 parts of Delzant's
  total class `∏ᵢ (1 + (aᵢ))`. Here `w₁(q) = (d(q))` uses the plain discriminant and not
  `d±`.
- **Additive against multiplicative.** Cohomology is additive and the Brauer group is a
  `CommGroup`. The coefficient modules are therefore `Additive Kˢˣ` and `μ₂ ≅ ZMod 2`,
  and every Lean statement that compares the two worlds transports through `Additive`.
  Layer 7A's comparison is an `≃+` out of `Additive (BrauerGroup K)`. Layer 8's `w₂`,
  Clifford, and Hasse identities are equations in `H²`, written additively. The prose
  keeps the multiplicative notation for Brauer classes and the product notation for the
  Hasse invariant. The transport appears in each declaration.

### The carrier for isometry classes

Layers 3 to 5 speak of functions on isometry classes, and Layer 4 needs a ring whose
elements are such classes. A quotient of the isometry relation over arbitrary
finite-dimensional spaces forces universe and bundling decisions on the first
implementer. This roadmap therefore fixes the carrier here.

Work with diagonal presentations:

```lean
RegularFormPresentation K := Σ n : ℕ, Fin n → Kˣ
```

Read `(n, w)` as `weightedSumSquares K (fun i => (w i : K))`. Two presentations are
related when the forms they present are `QuadraticMap.Equivalent`. That relation
compares forms on different spaces, so presentations of different lengths may be
related, and only equal lengths ever are. Set

```lean
RegularFormClass K := Quotient (regularFormSetoid K)
```

The carrier owes the rest of the roadmap the following milestones.

- Every regular form on a finite-dimensional space has a class, by diagonalization
  (`equivalent_weightedSumSquares_units_of_nondegenerate'`), and the class does not
  depend on the chosen diagonalization.
- Two regular forms are `Equivalent` if and only if their classes are equal.
- Orthogonal sum and tensor product of presentations descend to `RegularFormClass K`.
  The type is a commutative monoid under each operation, and the two distribute.
- Dimension, `discr`, `signedDiscr`, and later `hasseInvariant` and `localHasse` descend
  to it. Each descent is an application of the descent principle of Layer 0.
- The Grothendieck-Witt ring is the Grothendieck group of `(RegularFormClass K, ⊥)`
  with the multiplication induced by `⊗`. The Witt ring is its quotient by the ideal
  generated by the hyperbolic plane.

`RegularFormClass K` is the carrier. `QuadraticModuleCat` is the natural alternative,
and this roadmap does not use it: a roadmap that offers two carriers makes the first
implementer choose.

## What this roadmap consumes

### From Mathlib

- **Quadratic forms.** `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` supplies
  `QuadraticMap`, `QuadraticForm`, `polar`, `associated`, `Anisotropic`, `PosDef`,
  `weightedSumSquares`, `discr'` for forms on `n → R`, and matrix representations.
  `Isometry.lean` and `IsometryEquiv.lean` supply `Equivalent`,
  `equivalent_weightedSumSquares`, and
  `equivalent_weightedSumSquares_units_of_nondegenerate'`; diagonalization is done, so
  consume it. `Basis.lean` supplies `basisRepr` and `exists_orthogonal_basis`.
  `Prod.lean` supplies `QuadraticMap.prod`. `TensorProduct.lean` supplies the tensor
  product of forms, with `Invertible (2 : R)`. `Radical.lean` supplies
  `QuadraticMap.radical`, `QuadraticMap.Nondegenerate`, and
  `nondegenerate_associated_iff`. `Dual.lean`, `Real.lean`, `Complex.lean`,
  `Signature.lean`, `AlgClosed.lean`, and `QuadraticModuleCat.lean` supply the
  classifications over `ℝ`, over `ℂ`, and over an algebraically closed field, which are
  the model for the local classification below.
- **Bilinear forms.** `LinearMap.BilinForm.Nondegenerate`, `SeparatingLeft`, and
  orthogonality, in `Mathlib/LinearAlgebra/BilinearForm/*` and `SesquilinearForm/*`.
- **Quaternion algebras.** `Mathlib/Algebra/Quaternion.lean` supplies the Bourbaki
  three-parameter `QuaternionAlgebra R c₁ c₂ c₃` with the notations `ℍ[R,c₁,c₂,c₃]`,
  `ℍ[R,c₁,c₂]` (that is `ℍ[R,c₁,0,c₂]`), and `ℍ[R]`. Conjugation `star` exists for the
  general algebra, together with
  `mul_star_eq_coe : a * star a = ((a * star a).re : ℍ[…])`, so the scalarness of the
  norm is available. `normSq` as a `MonoidHom` and the `DivisionRing` instance exist
  only for Hamilton's `ℍ[R]`. `Mathlib/Algebra/QuaternionBasis.lean` supplies
  `QuaternionAlgebra.Basis` and
  `Basis.lift : Basis A c₁ c₂ c₃ ≃ (ℍ[R,c₁,c₂,c₃] →ₐ[R] A)`, which is the universal
  property that the splitting arguments use.
- **Rank-2 algebras.** `Mathlib/Algebra/QuadraticAlgebra/` (A. Chambert-Loir) supplies
  `QuadraticAlgebra R a b` with `ω² = a + bω`, `star`, and
  `norm : QuadraticAlgebra R a b →* R` with `norm z = z.re² + b·z.re·z.im − a·z.im²`. It
  also supplies `isUnit_iff_norm_isUnit`, the `Field` instance for the case where
  `X² − bX − a` has no root, and the identity of `norm` with the determinant of
  multiplication. `QuadraticAlgebra K a 0` is the vehicle for `K(√a)` and for its norm
  form `x² − ay²` in this roadmap. Do not adjoin a square root by hand where this
  algebra serves. `Mathlib/FieldTheory/KummerExtension.lean` and
  `TauCeti/FieldTheory/IntermediateField/Quadratic.lean` cover the intermediate-field
  picture when an ambient field is present.
- **Central simple algebras.** `Mathlib/Algebra/Central/*` supplies `Algebra.IsCentral`
  and `Algebra.IsCentralSimple`. `Mathlib/Algebra/BrauerGroup/Defs.lean` supplies `CSA`,
  `IsBrauerEquivalent`, and `BrauerGroup` as a `Quotient`, which carries no group
  structure. `Mathlib/Algebra/Azumaya/*` supplies `IsAzumaya` and
  `AlgHom.mulLeftRight`. `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean` and
  `SimpleRing/*` supply the Wedderburn theory.
- **Clifford algebras.** `Mathlib/LinearAlgebra/CliffordAlgebra/*` supplies base change,
  the grading, the even subalgebra, and the equivalences with quaternion algebras in
  `Equivs.lean`. It supplies constructions and equivalences, and not the
  central-simplicity theorems that Layer 5's `cliffordInvariant` needs. Those theorems
  are milestones of Layer 5.
- **Local fields.** `Mathlib/NumberTheory/LocalField/Basic.lean` supplies
  `IsNonarchimedeanLocalField K`, stated for a field with a `ValuativeRel` and a
  topology. It gives `IsDiscreteValuationRing 𝒪[K]`, `Finite 𝓀[K]`,
  `ValuativeRel.IsDiscrete K`, and local compactness. `IsDiscreteValuationRing.addVal`
  supplies the `ℕ∞`-valued valuation of `𝒪[K]`. `Mathlib/NumberTheory/Padics/*`
  supplies `ℚ_[p]`, `ℤ_[p]`, `PadicInt.toZModPow`, and Hensel's lemma.
  `Mathlib/RingTheory/Valuation/*` supplies `ValuativeRel`, `𝒪[K]`, `𝓂[K]`, `𝓀[K]`, and
  the fractional-ideal API in `Mathlib/RingTheory/FractionalIdeal/*`.
- **Finite fields and characters.** `Mathlib/NumberTheory/LegendreSymbol/*` supplies
  `legendreSym`, `jacobiSym`, quadratic reciprocity, and quadratic characters.
  `Mathlib/FieldTheory/Finite/*` supplies the finite-field theory.
- **Trace forms.** `Algebra.traceForm : BilinForm R S` with
  `traceForm_nondegenerate` for a finite separable extension, in
  `Mathlib/RingTheory/Trace/*`. Layer 9's `Tr_*⟨1⟩` starts here, and
  `LinearMap.BilinMap.toQuadraticMap` turns a bilinear form into a quadratic form.
- **Group cohomology.**
  `Mathlib/RepresentationTheory/Homological/GroupCohomology/{LowDegree,Hilbert90,Shapiro}.lean`
  supplies the discrete theory.
  `Mathlib/Algebra/Category/ContinuousCohomology/Basic.lean` supplies
  `continuousCohomology R G n`, a functor from `R`-linear representations of a
  topological group on topological modules to topological `R`-modules. That functor is
  the carrier of Layers 7 to 9. What it does not yet supply, and what those layers
  therefore own, is the low-degree calculational API: Kummer theory, cup products,
  restriction, corestriction, and the Evens norm.
- **Galois groups.** `Mathlib/FieldTheory/SeparableClosure.lean` supplies
  `SeparableClosure K`, and `Mathlib/FieldTheory/KrullTopology.lean` puts the Krull
  topology on `L ≃ₐ[K] L` and proves that it is a topological group. Together they give
  `G_K` as a topological group, which is what `continuousCohomology` consumes.

### From Tau Ceti

Treat these landed files as fixed API. Cite them in the consuming files, and route an
improvement through their own review rather than duplicating them.

- **`TauCeti/FieldTheory/SquareClassGroup.lean`**: `TauCeti.SquareClassGroup K`, an
  `𝔽₂`-vector space, with `squareClass`, `squareClass_eq_zero_iff`, `squareClass_prod`,
  and `linearIndependent_squareClass_iff`, that is linear independence as the statement
  that no nonempty subset product is a square. Layer 0's square-class calculus lands
  next to this file and extends it with the multiplicative avatar and the finiteness
  API.
- **`TauCeti/FieldTheory/IntermediateField/Quadratic.lean`**: the quadratic normal form
  `a + b√x`, `finrank_adjoin_simple_eq_two_of_sq_mem_notMem`, and
  `isSquare_mul_of_adjoin_simple_eq`. Layer 6 uses these when `K(√a)` must lie inside a
  given ambient field.
- **`TauCeti/NumberTheory/Multiquadratic/SquareClass/{Basic,Independence}.lean`**:
  square-class descent in towers, that is `sqrtTower` and `squareClass_of_sq_mem`. The
  [multiquadratic roadmap](../Multiquadratic/README.md) owns multi-root towers. This
  roadmap owns the form theory of one quadratic step, and the shared language is the
  square-class group above.
- **`TauCeti/NumberTheory/LegendreSymbol/SquareClass.lean`**: `legendreSym_mul_sq` and
  the related lemmas, which are the radicand-normalization API that Layer 6's
  odd-residue-characteristic formula reuses.
- **`TauCeti/NumberTheory/EffectiveBounds/TraceForm.lean`** and
  `TauCeti/FieldTheory/Trace`: trace-form diagonalization on square-root bases, that is
  `discr_one_elem_eq_of_sq_algebraMap` and the trace-vanishing criterion. Layer 9's
  `Tr_*⟨1⟩ ≅ ⟨2, 2d⟩` for `K(√d)/K` is the form-level restatement, and is proved through
  this API.

### From other roadmaps in this repository

- The [local-fields-ramification
  roadmap](../LocalFieldsRamification/README.md) owns the general arithmetic of a
  nonarchimedean local field: the normalized valuation, the unit filtration with its
  graded pieces, the Teichmüller section, the ramification and residue degrees, power
  and square classes, and unramified extensions with their norm groups. Layer 6A
  consumes those declarations rather than defining a second valuation or filtration.
- The [class-field-theory roadmap](../ClassFieldTheory/README.md) owns local duality,
  the invariant map, the cohomological Kummer-cup Hilbert pairing, and Hilbert
  reciprocity. Layers 6E and 7C compare this imported pairing with the
  norm-equation/quaternion symbol; the dependency is
  `ClassFieldTheory -> QuadraticFormInvariants`, never the reverse.
- The [profinite-cohomology roadmap](../ProfiniteCohomology/README.md) owns continuous
  cohomology and its operations: the carrier, the cup product, restriction, inflation,
  corestriction, Kummer theory, and the Evens norm at index two with its four
  characterizing identities. Layer 7A consumes those declarations and adds only the
  coefficient identification specific to `μ₂` and the passage from a field extension to
  the open subgroup by which the supplier's operations are indexed.
- The [semisimple-algebras
  roadmap](../RepresentationTheory/SemisimpleAlgebras/README.md) **Layer 4**: the tensor
  product of two central simple `K`-algebras is central simple, with `finrank K (A ⊗ B)
  = finrank K A · finrank K B`; and the opposite-algebra package `A ⊗_K Aᵒᵖ ≃ₐ[K] End_K
  A ≃ₐ[K] M_{finrank K A}(K)`.
- The same roadmap, **Layer 6**:
  - the Brauer-triviality prerequisites;
  - the `CommGroup` structure on `BrauerGroup K`, with multiplication induced by `⊗_K`,
    identity `[K]`, and inverse `[Aᵒᵖ]`;
  - the quotient API for `Brauer.CSA_Setoid`;
  - the theorem that every central simple `K`-algebra is split by a finite separable
    extension.
- The [multiquadratic roadmap](../Multiquadratic/README.md) for the square-class
  language of Layer 0, through the landed files listed above.

Where this roadmap and the semisimple-algebras roadmap name the same fact, the
semisimple-algebras statement is the statement of record. Nothing here rebuilds
Wedderburn theory, Skolem-Noether, centralizers, splitting fields, or the index.

### Objects that Mathlib leaves incomplete

Three objects that Layers 5 to 9 consume exist in Mathlib as types and lack the
operations that this roadmap uses. Every such operation is a **named canonical
definition** of this roadmap, with the theorems that characterize it. No statement below
quantifies over an arbitrary operation: an arbitrary bilinear pairing, or an arbitrary
group law on the Brauer carrier, satisfies the same short list of axioms as the intended
operation and falsifies the theorems.

- **The Brauer group.** The carrier is Mathlib's `BrauerGroup K`, and the group law is
  the semisimple-algebras declaration `brauerCommGroup`, whose multiplication is induced
  by `⊗_K`. Layer 5 adds the central simplicity of `ℍ[K,a,b]`, and then
  `quaternionClass a b = ⟦ℍ[K,a,b]⟧` is a definition. Symmetry, 2-torsion, bilinearity,
  the Steinberg relation, and invariance under binary equivalence are theorems about
  that definition.
- **The local field.** The carrier is Mathlib's `IsNonarchimedeanLocalField`, and the
  valuation, the unit filtration and the absolute ramification index are the
  local-fields-ramification roadmap's `normalizedValuation`, `unitFiltration` and
  `absoluteRamificationIndex`, the last of which is read at the argument `2`, so that
  `e = v_K(2)` throughout. What Layer 6A adds is the one object that roadmap does not
  name, `IsUniformizer`, with its characterizing theorems. A uniformizer is a choice
  satisfying `IsUniformizer`, and never a component of a package: an element of valuation
  one is not unique, so a package that stores one is not unique either.
- **Mod-2 Galois cohomology.** The carrier is the profinite-cohomology roadmap's
  `trivialF2` object over its `AbsoluteGaloisGroup`, so that roadmap's `cup`, `res`,
  `corestriction`, and `evensNormIndexTwo` apply here with no transport, as do its
  `UnitsCoeff` for the coefficients `Additive Kˢˣ` and its `galoisRes`, `galoisCor` and
  `galoisEvens` for a finite separable `L/K`, which already carry independence of the
  embedding. What Layer 7A adds is the coefficient identification specific to `μ₂`
  (`mu2EquivZMod2` and the resulting isomorphism of coefficient objects) and the laws that
  mention this roadmap's own notions: the Kummer class of a unit, the square-class
  isomorphism, and `h2MuToUnits`.

### Cross-roadmap contract

Every use this roadmap makes of another is a row below: the consuming milestone, the
supplying layer, the exact declaration, and its mathematical type. A subject name such
as "the cup product" or "local square classes" is not a contract, and no row contains
one. Nothing here is a hypothesis of a Lean statement: the declarations are imported and
applied.

Where a supplier owns a milestone but exports no target signature for it, the
declaration column says so. Such a row is still a contract, because the milestone is
named and its owner is fixed; what this roadmap then states locally is the specialized
shape its own layers consume, marked as such at the point of use.

**From the [local-fields-ramification roadmap](../LocalFieldsRamification/README.md)**,
namespace `TauCetiRoadmap.LocalFieldsRamification`, over
`[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`.

| Consumer milestone | Supplier layer | Exact declaration | Mathematical type |
|---|---|---|---|
| Layer 6A, the valuation; every statement of 6B and 6C | 0 | `normalizedValuation`, `normalizedValuation_surjective`, `normalizedValuation_eq_one_iff`, `normalizedValuation_irreducible` | `Kˣ →* Multiplicative ℤ`, surjective, with the unit equation and the uniformizer equation |
| Layer 6A, the unit filtration; 6B's defect bounds | 1 | `unitFiltration`, `mem_unitFiltration_zero`, `mem_unitFiltration_succ_congr`, `mem_unitFiltration_succ_valuation`, `unitFiltration_antitone`, `iInf_unitFiltration` | `ℕ → Subgroup Kˣ`, decreasing with trivial intersection, in both membership forms |
| Layer 6A, residue and ramification data of a finite extension | 0 | `ramificationIndex`, `inertiaDegree`, `normalizedValuation_algebraMap`, `card_residueField`, `ramificationIndex_mul_inertiaDegree` | `e`, `f`, `v_L ∘ algebraMap = e · v_K`, `#𝓀[L] = #𝓀[K]^f`, and `e · f = [L:K]` |
| Layer 6A, the absolute ramification index; the thresholds of 6B and the counts of 6D | 0 | `absoluteRamificationIndex`, `normalizedValuation_natCast`, `absoluteRamificationIndex_eq_zero_iff` | `e = v_K(2)` as `absoluteRamificationIndex K 2`, with `v_K^×(2) = Multiplicative.ofAdd e` and `e = 0` exactly when `2` is a unit of `𝒪[K]`. ⚠ The relative `ramificationIndex K L` of the row above is a different invariant |
| Layer 6A, the square-class dictionary; every count of 6D and the Kummer isomorphism of 7A | 1 | `square_eq_range_powMonoidHom` | `Subgroup.square Kˣ = (powMonoidHom 2).range`, the identification of Mathlib's subgroup of squares with the range the supplier's count and the Kummer isomorphism are stated at |
| Layer 6A, the residue field and its unit group | 1 | `teichmuller`, `teichmuller_section` | `𝓀[K]ˣ →* 𝒪[K]ˣ`, a multiplicative section of reduction |
| Layer 6A, the filtration quotients | 1 | milestone *Graded pieces* (no target signature) | `U(K,0)/U(K,1) ≃* 𝓀[K]ˣ` and `U(K,i)/U(K,i+1) ≃* 𝓀[K]⁺` for `i ≥ 1` |
| Layer 6A, the square-class counts; 6D's counting arguments | 1 | `card_powerClasses_of_isUnit`, `card_powerClasses_mixed`, `card_squareClasses_of_isUnit`, `card_squareClasses_dyadic` | `#(Kˣ/(Kˣ)ⁿ) = n · #μ_n(K) · q^{v_K(n)}` in the two regimes, with the `n = 2` values `4` when `2` is a unit of `𝒪[K]` and `4 · q^e` for `K/ℚ_2` finite, at `e = absoluteRamificationIndex K 2` |
| Layer 6A, the local square theorem; 6B's list of unit defects | 1 | `unitFiltration_le_range_powMonoidHom_two`, `not_unitFiltration_le_range_powMonoidHom_two` | `U(K, 2e+1) ⊆ (Kˣ)²` for `K/ℚ_2` finite, and its sharpness `U(K, 2e) ⊄ (Kˣ)²`, which 6B's defect list needs in order to know the bound is attained |
| Layer 6A, the unramified class; 6B's evaluation formula | 2 | `normGroup`, `map_norm_unitFiltration_zero`, `mem_normGroup_iff_dvd_normalizedValuation`; milestone *Existence and uniqueness* (no target signature) | the unramified norm group in norm-equation form, `x ∈ normGroup L/K ↔ f ∣ v_K(x)`, with `N_{L/K}(𝒪[L]ˣ) = 𝒪[K]ˣ`; and the unramified extension of each degree |
| Layer 6, the `ℚ_p` acceptance suite | 0 | the non-vacuity milestone (worked example) | `IsNonarchimedeanLocalField ℚ_[p]` |

**From the [class-field-theory roadmap](../ClassFieldTheory/README.md)**, namespace
`TauCetiRoadmap.ClassFieldTheory`. These declarations are imported; QFI supplies comparison
theorems only.

| Consumer milestone | Supplier layer | Exact declaration | Mathematical type |
|---|---|---|---|
| Layers 6E and 7C, the local invariant normalization | 2--3 | `H`, `muNRep`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu` | continuous `H²(F, mu_n)` and its arithmetic invariant in `ZMod n`, including mixed characteristic |
| Layer 7C, the cohomological Hilbert pairing | 3 | `kummerClass`, `kummerCupPairing`, `localSymbol` | Kummer classes and cup product followed by the local invariant; no quadratic-form definition occurs in CFT |
| Layer 7C, nondegeneracy comparison | 3 | `tateDualityPairing`, `tateDualityPairing_perfect_mixed` | local Tate duality and perfectness, with the invariant normalization supplied by CFT |
| `hilbertSymbol_productFormula`, exported to Global Quadratic Forms | 5 | `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`, `finiteHilbertSupport`, `hilbertProductFormula` | finite support and the additive Hilbert reciprocity equation over all finite and infinite places |

The two frozen QFI bridge names are `hilbertSymbol_eq_cohomological` and
`hilbertSymbol_productFormula`. The first identifies QFI's norm-equation/quaternion symbol with
`ClassFieldTheory.localSymbol`; the second is the multiplicative-sign translation of
`ClassFieldTheory.hilbertProductFormula`. This is the only ownership direction: no CFT file
imports QFI.

**From the [profinite-cohomology roadmap](../ProfiniteCohomology/README.md)**, namespace
`TauCetiRoadmap.ProfiniteCohomology`.

| Consumer milestone | Supplier layer | Exact declaration | Mathematical type |
|---|---|---|---|
| Layer 7A, the group and the carrier of every statement of Layers 7 to 9 | 1, 9 | `AbsoluteGaloisGroup`, `TopRep`, `continuousCohomology` | `Gal(Kˢ/K)`, and `TopRep R G ⥤ TopModuleCat R` |
| Layer 7A, the mod-2 coefficient object and its pairing | 13 | `trivialF2`, `trivialF2_isSmoothDiscrete`, `f2Pairing` | `𝔽₂` with the trivial action as an object of `TopRep ℤ G_K`, smooth discrete, with multiplication as a `TopPairing` |
| Layer 7A, the cup product; Layers 7C, 8 and 9 | 12 | `TopPairing`, `cup`, `cup_add_left`, `cup_add_right`, `cup_res`, `cup_infl`, `cup_projection`, `cup_gradedComm`, `degreeCast`, `ofDiscreteModulePairing` | `Hᵐ(G, X) × Hⁿ(G, Y) → H^{m+n}(G, Z)`, biadditive, with the four naturality squares and the projection formula |
| Layer 7A, restriction and inflation | 1 | `map`, `res`, `infl`, `coeffMap` | `Hⁿ(G, X) ⟶ Hⁿ(H, Y)` for a compatible pair, and its three named instances |
| Layer 7A, corestriction | 10 | `corestriction`, `corestrictionLe`, `corestriction_comp_res`, `corestriction_mackey` | `Hⁿ(U, res X) ⟶ Hⁿ(G, X)` for open `U`, with `cor ∘ res = (G : U) · id` and the double-coset formula |
| Layer 7A, Kummer classes; Layer 8's classes | 9 | `KummerCoeff`, `powerClassQuotient`, `kummerMap`, `kummerIso`, `kummerMapCanonical`, `kummerIso_res`, `kummerIso_norm`, `kummerCoeff_continuousSMul` | `Kˣ ⧸ (Kˣ)ⁿ ≃* Multiplicative (H¹(G_K, μ_n))` for `n` invertible in `K`, with the restriction and norm squares |
| Layer 7A, the multiplicative coefficients; Layer 7B's comparison | 9 | `UnitsCoeff`, `unitsCoeff_continuousSMul`, `kummerShortExact`, `hilbert90`, `h2KummerToUnits`, `h2KummerToUnits_injective`, `h2KummerToUnits_range` | `Additive Kˢˣ` as a discrete `G_K`-module, `H¹(G_K, Kˢˣ) = 0`, and `H²(G_K, μₙ) ↪ H²(G_K, Kˢˣ)` with image the `n`-torsion |
| Layer 7A, the transfer along `L/K`; Layers 8 and 9 | 9, with 10 and 13 | `galoisSubgroup`, `galoisSubgroup_index`, `galoisSubgroupEquiv`, `galoisF2Iso`, `galoisRes`, `galoisCor`, `galoisEvens`, `galoisConj`, `galoisRes_cup`, `galoisCor_cup`, `galoisRes_galoisEvens`, `galoisEvens_add`, `galoisRes_comp`, `galoisRes_embedding_independent`, `galoisCor_embedding_independent`, `galoisEvens_embedding_independent` | restriction, corestriction and the index-two Evens norm attached to a finite separable `L/K`, with their laws and independence of the embedding |
| Layer 7A, the Evens norm; Layer 9's formula | 13 | `evensNorm`, `evensNormIndexTwo`, `evensConj`, `evensNorm_res`, `evensNorm_polarization`, `evensNorm_cor_shapiro`, `evensNorm_identity_infl` | `H¹(U, 𝔽₂) → H²(G, 𝔽₂)` for open `U` of index two, with its four characterizing identities |
| Layer 7B, the comparison with the explicit model | 8, 12 | `explicitCup11`, `explicitIso_cup` | the agreement of the explicit bidegree-`(1,1)` cup with `cup` |

**From the [semisimple-algebras
roadmap](../RepresentationTheory/SemisimpleAlgebras/README.md).**

| Consumer milestone | Supplier layer | Exact declaration | Mathematical type |
|---|---|---|---|
| Layer 5, the symbol | 4 | `tensorProduct_isSimpleRing` | a tensor product of central simple `K`-algebras is simple |
| Layer 5, the symbol | 4 | `tensorOp_algEquiv_matrix` | `A ⊗_K Aᵒᵖ ≃ₐ[K] M_{finrank K A}(K)` |
| Layer 5, the group law | 6 | `brauerCommGroup` | the `CommGroup` structure on `BrauerGroup K` |
| Layer 7B, splitting | 6 | `IsSplittingField` | a splitting field of a central simple algebra |

Layer 7B also needs a finite **separable** splitting field. The semisimple-algebras
roadmap states that milestone in prose and has no target signature for it, so this
roadmap states the theorem it uses and the contract table gains a row when that
signature exists.

## What is missing (build here)

Everything below the linear algebra:

- the hyperbolic plane as a studied object, and the dichotomy between isotropy and
  splitting;
- Witt decomposition, Witt cancellation, and the Witt index;
- Witt's chain-equivalence theorem, without which no invariant of diagonal tuples is
  well defined on isometry classes;
- the representation predicate and the value-set calculus;
- the Witt ring `W(K)`, the fundamental ideal `I(K)`, and Pfister forms;
- the quaternion symbol layer, with its norm form, the split-or-division dichotomy, and
  the four-fold splitting criterion;
- the classical invariants `dim mod 2`, `d`, and `d±`;
- the Brauer-valued Hasse and Clifford invariants, and the classification in dimension
  at most 3;
- the uniformizer predicate of Layer 6A, its square-class representatives in odd residue
  characteristic, and the binary norm form `b = x² − Δ y²` that Layers 6B to 6D apply,
  each stated against the local-fields-ramification roadmap's valuation, filtration,
  and norm group;
- the quadratic defect, the Hilbert symbol over a nonarchimedean local field with the
  dyadic case, bimultiplicativity, and nondegeneracy, together with the identification
  of the symbol with the mod-2 specialization of the local duality pairing;
- the local classification by `(dim, d, s)`, with `u(K) = 4` and the unique anisotropic
  quaternary form;
- the `μ₂` coefficient identification of Layer 7A, and the mod-2 laws read through it:
  the Kummer class of a unit, the square-class isomorphism, and `h2MuToUnits`;
- the comparison of the Brauer group with `H²`, and the identification of the quaternion
  class with a Kummer cup product;
- the cup-norm theorem in each of its five descriptions, over any field in which `2` is
  invertible;
- the Stiefel-Whitney classes `w₁` and `w₂` of forms, defined on isometry classes and not
  only on diagonal tuples, with the exact comparison between `w₂` and the Clifford
  invariant;
- the Scharlau transfer, and the relative Stiefel-Whitney formula in degrees 1 and 2.

None of this exists upstream as stated. Each object gets its complete basic theory, and
not only the milestone that the headline needs.

`Suggested.lean` fixes Lean forms for the design decisions that are most likely to fork
an implementation, together with the worked examples. It prototypes the carrier for
isometry classes, the chain-equivalence relation, the four-fold criterion, the Brauer
symbol and the Hasse invariant, the Witt ring with its fundamental ideal and the
Clifford invariant, the Layer 6A objects stated against the supplied valuation and
filtration, the quadratic defect with its exponent,
the Hilbert symbol, the `μ₂` identification of Layer 7A with its laws, the
Brauer comparison, `w₁` and `w₂` on isometry classes, and the Scharlau transfer with the
relative Stiefel-Whitney formula. It is illustrative and not exhaustive, and this README
is the definitive document.

---

## The build, in layers

The order below is the dependency order. Each layer lists its direct prerequisites.
Each prerequisite carries one of these sources:

- **[Mathlib]** for an existing Mathlib declaration;
- **[Tau Ceti]** for an existing accepted Tau Ceti declaration;
- **[Layer n]** for an earlier milestone of this roadmap;
- **[Local Fields Ramification, Layer n]**, **[Profinite Cohomology, Layer n]**,
  **[Class Field Theory, Layer n]**, and **[SSA Layer n]**
  for a named layer of a roadmap this one consumes. Every such
  prerequisite appears as a row of the contract table above, with its exact declaration.

Layers 0 to 6 use no cohomology, and only Layer 5 uses the Brauer group. There is one
exception, stated where it occurs: the second milestone of sublayer 6E, which identifies
the Hasse invariant with the invariant map of local class field theory, uses Layer 7B and
Class Field Theory's degree-two invariant, so it is placed after Layer 7B in the build order.

### Layer 0: square classes, diagonal calculus, and chain equivalence

Prerequisites:

- **[Mathlib]** `weightedSumSquares`, `QuadraticMap.Equivalent`,
  `QuadraticMap.Anisotropic`, `Equiv.Perm`, `Relation.ReflTransGen`;
- **[Tau Ceti]** `TauCeti.SquareClassGroup` and `TauCeti.squareClass_eq_zero_iff`.

Milestones:

- **Square-class interop.** Consume `TauCeti.SquareClassGroup` and add what the
  invariants need:
  - the multiplicative avatar `Kˣ ⧸ Subgroup.square Kˣ`, with the `ZMod 2`-module
    dictionary to the landed additive one;
  - pushforward along a field map;
  - finiteness transfer through the `Nat.card` API, which is the interface that Layer 6
    consumes.
- **Representation and value sets.** Define `Represents Q a` and `unitValueSet Q` as
  fixed in the convention table, with the basic calculus:
  - `unitValueSet` is closed under multiplication by squares, so it is a union of
    square classes;
  - `Represents Q 0` holds on every nonzero space, which is why the classification
    statements use `unitValueSet`;
  - the **representation criterion** (Lam I.2.3, I.3.5): for regular `Q` and `a : Kˣ`,
    `a ∈ unitValueSet Q` if and only if `Q ⊥ ⟨−a⟩` is isotropic.

  Every later question about represented values is turned into an isotropy question
  through the criterion.
- **Binary forms in normal form.** Two theorems, both about units `a b c d`:
  - **representation normal form** (Lam I.2.3 (2)):
    `c ∈ unitValueSet ⟨a,b⟩ ↔ ⟨a,b⟩ ≅ ⟨c, abc⟩`. The second coefficient is `abc`
    because its square class must be `ab/c`, and `ab/c = abc` modulo squares. State
    both spellings and prove them equal, because the sources use both.
  - **binary equivalence criterion** (Lam I.5.1): `⟨a,b⟩ ≅ ⟨c,d⟩` if and only if
    `IsSquare (a*b*(c*d))` and the two forms represent a common unit.
- **Chain equivalence.** Every diagonal invariant rests on this theorem, so the
  relation is stated exactly. For `w w' : Fin n → Kˣ`:
  - `PermutationStep w w'`: there is `σ : Equiv.Perm (Fin n)` with `w' i = w (σ i)`;
  - `BinaryStep w w'`: there are distinct `i j : Fin n` with `w k = w' k` for
    `k ∉ {i,j}` and `⟨w i, w j⟩ ≅ ⟨w' i, w' j⟩`;
  - `DiagonalStep w w'` is the disjunction of the two;
  - `DiagonalChain := Relation.ReflTransGen DiagonalStep`.

  A transposition is already a `BinaryStep`, because `⟨a,b⟩ ≅ ⟨b,a⟩`, so
  `PermutationStep` adds no generating data. Prove that containment as a lemma and keep
  both relations, because permutation invariance is the form that later proofs apply.

  The theorem is the equivalence

  ```text
  DiagonalChain w w'  ↔  weightedSumSquares w ≅ weightedSumSquares w'
  ```

  The two directions are not equally hard. Left to right is elementary, because each
  step is an isometry and isometry is transitive. Right to left is **Witt's
  chain-equivalence theorem** (Lam I.5.2), and it is the difficult direction. Prove it
  by a convenient route. State the comparison with Serre IV Thm 5 on contiguous
  orthogonal bases as a separate theorem, so that a development that uses contiguity can
  be consumed. Contiguity is a comparison target, and never an alternative definition of
  the relation above.
- **The descent principle.** A function `f` on diagonal tuples of units that is
  invariant under `PermutationStep` and under `BinaryStep` descends uniquely along
  `Quotient.mk` to a function on `RegularFormClass K` that agrees with `f` on each
  presentation. State it once in exactly this form. Apply it for `discr`,
  `signedDiscr`, `hasseInvariant`, `localHasse`, `w₁`, and `w₂`.

Basic API for the objects introduced here:

- constructors: `RegularFormPresentation`, `regularFormSetoid`, `RegularFormClass`,
  `Represents`, `unitValueSet`, `PermutationStep`, `BinaryStep`, `DiagonalChain`;
- examples: `⟨1,1⟩` and `⟨1,−1⟩` over `ℚ`; the single `BinaryStep` from `⟨1,1⟩` to
  `⟨2,2⟩` over `ℚ`;
- morphisms: the quotient map from presentations to classes; the descent principle as
  the universal property;
- functoriality: pushforward of square classes and of presentations along a field map
  `K →+* L`, with `discr` and dimension commuting with it;
- comparison lemmas: `DiagonalChain` against `Equivalent`; `IsSquare (a*b)` against
  equality in the square-class group; contiguous orthogonal bases against
  `DiagonalChain`;
- naturality: the descent principle commutes with pushforward along `K →+* L`;
- edge cases: rank `0` and rank `1`, where the empty and singleton products appear;
  `Represents Q 0`, which is not a statement about `unitValueSet`;
- downstream interfaces: Layers 3, 5, 6, and 8 each obtain a well-defined invariant
  from the descent principle.

⚠ Nearby false generalization. Equal length and equal discriminant do not give a chain,
so they do not give an isometry. Over `ℚ`, `⟨1,1⟩` and `⟨−1,−1⟩` have discriminant
`[1]`, and they are not isometric, because one is positive definite and the other is
negative definite.

### Layer 1: hyperbolic planes and Witt theory

Prerequisites:

- **[Mathlib]** `QuadraticMap.prod`, `QuadraticMap.Nondegenerate`, `basisRepr`,
  `exists_orthogonal_basis`, `Module.finrank`;
- **[Layer 0]** the representation criterion and the binary normal forms.

Milestones:

- **The hyperbolic plane.** `ℍ_q := ⟨1, −1⟩`, which is equivalent to the `xy`-form
  because `2` is invertible. Prove that `ℍ_q` represents every unit, that
  `⟨a, −a⟩ ≅ ℍ_q`, that a regular isotropic form splits off a hyperbolic plane
  (Lam I.3.4), and, as a consequence, that a regular isotropic form is universal.
- **Witt decomposition** (Lam I.4.1). Every form splits as
  `q ≅ q_t ⊥ (m × ℍ_q) ⊥ q_a`, where `q_t` is the zero form on the radical and `q_a` is
  anisotropic, and all three parts are unique up to isometry. Define the **Witt index**
  `m` and the **anisotropic part**. For regular `q`, the Witt index is the dimension of
  a maximal totally isotropic subspace (Lam I.4.4).
- **Witt cancellation** (Lam I.4.2): `q ⊥ q₁ ≅ q ⊥ q₂ → q₁ ≅ q₂` for regular `q`,
  proved through hyperplane reflections (Lam I.4.5 to I.4.7). The regularity hypothesis
  on the cancelled summand is part of the statement.
- **Reflections and Cartan-Dieudonné** (Lam I.7). For regular `Q` and `v` with
  `Q v ≠ 0`, the **reflection** is `τ_v x = x − (polar Q x v / Q v) • v`. Prove that
  `τ_v` is an isometry, that `τ_v v = −v`, that `τ_v` fixes `v^⊥` pointwise, and that
  `τ_v ∘ τ_v = id`. **Cartan-Dieudonné**: every isometry of a regular `n`-dimensional
  quadratic space is a product of at most `n` reflections. The identity is the empty
  product.
- **Witt's extension theorem** (Lam I.4.9): an isometry between regular subspaces of a
  regular space extends to the whole space. Mathlib has no form of this theorem, and
  Layer 6 and Layer 9 both use it.

Basic API:

- constructors: `hyperbolicPlane`, `wittIndex`, `anisotropicPart`, `reflection`;
- examples: `ℍ_q` over `ℚ`; `⟨1,1⟩` over `ℚ`, which is anisotropic and has Witt index
  `0`;
- morphisms: reflections and the isometry group; the extension of an isometry from a
  subspace;
- functoriality: the Witt index and the anisotropic part are invariants of
  `Equivalent`. Under a field extension the Witt index cannot decrease, and the
  extension of the anisotropic part need not stay anisotropic. An equality holds only
  under a stated anisotropy-preservation hypothesis. ⚠ Do not claim that
  `anisotropicPart` commutes with base change: `⟨1,1⟩` over `ℝ` has Witt index `0`, and
  over `ℂ` it is hyperbolic with Witt index `1` and zero anisotropic part;
- comparison lemmas: the Witt index against the dimension of a maximal totally
  isotropic subspace; the `xy`-form against `⟨1,−1⟩`;
- naturality: `anisotropicPart (q ⊥ r)` against `anisotropicPart q ⊥ anisotropicPart r`
  in the Witt ring of Layer 4;
- edge cases: the zero form; a form on the zero space; rank 1, where isotropy fails
  always;
- downstream interfaces: Layer 4 needs cancellation for the Witt ring, and Layer 6
  needs the extension theorem for the local uniqueness arguments.

⚠ Nearby false generalization. Cartan-Dieudonné has a classical counterexample in
dimension 4 over `𝔽₂`, which the standing hypothesis `Invertible (2 : K)` excludes. Do
not state the theorem for a general field.

### Layer 2: quaternion algebras and the four-fold splitting criterion

The route through quaternion algebras, rather than through a cocycle computation, is
deliberate. Each equivalence proved here is reusable, and a cocycle identity is not.
Nothing in this layer needs central simplicity, and no milestone here assumes it.

Prerequisites:

- **[Mathlib]** `QuaternionAlgebra`, `star`, `mul_star_eq_coe`,
  `QuaternionAlgebra.Basis` with `Basis.lift`, `QuadraticAlgebra K a 0` with its `norm`,
  `Matrix (Fin 2) (Fin 2) K`;
- **[Layer 0]** the binary normal forms;
- **[Layer 1]** the hyperbolic plane and the splitting of an isotropic form.

Milestones:

- **Norm form.** For `a, b ∈ Kˣ`, `Nrd(x) = x · star x` is scalar, by Mathlib's
  `mul_star_eq_coe`. Package `x ↦ (x * star x).re` as a `QuadraticForm K ℍ[K,a,b]` and
  prove `Nrd ≅ ⟨1, −a, −b, ab⟩ = ⟨⟨a, b⟩⟩`, the 2-fold Pfister form. Prove that the
  **pure part** on the trace-zero subspace is `⟨−a, −b, ab⟩`, and that
  `Nrd(xy) = Nrd(x)·Nrd(y)`.
- **Split or division** (Lam III.2.2, III.2.7). `ℍ[K,a,b]` is a division algebra, or is
  isomorphic to `Matrix (Fin 2) (Fin 2) K`, according to whether `Nrd` is anisotropic.
  Route: `x ≠ 0` is invertible if and only if `Nrd(x) ≠ 0`, by the `star`-inverse; and
  if `Nrd` is isotropic, then run the explicit `M₂(K)`-basis through
  `QuaternionAlgebra.Basis.lift`. Both halves are computations with the norm form.
- **Symbol relations at the algebra level**, each an `AlgEquiv` (Lam III.2.11):
  `(a,b) ≅ (b,a)`; `(a, c²b) ≅ (a,b)`; `(a, −a) ≅ M₂(K)`; `(a, b²) ≅ M₂(K)`;
  `(1, b) ≅ M₂(K)`; and the **Steinberg relation** `(a, 1−a) ≅ M₂(K)` for `a : Kˣ` with
  `1 − a ≠ 0`.
- **Naturality of quaternion equivalences.** A `K`-algebra equivalence
  `f : ℍ[K,a,b] ≃ₐ[K] ℍ[K,c,d]` commutes with `star`, preserves the reduced trace and
  the reduced norm, maps the trace-zero subspace onto the trace-zero subspace, and
  restricts to an isometry of pure norm forms `⟨−a,−b,ab⟩ ≅ ⟨−c,−d,cd⟩`. Without this
  milestone, equality of quaternion invariants gives no isometry, and the dimension-3
  classification of Layer 5 has no proof.
- **The four-fold splitting criterion**, the main theorem of the layer (Lam III.2.7 and
  III.4.2, Serre III.1.1-1.2, Gille-Szamuely 1.1.9). For `a, b ∈ Kˣ` the following are
  equivalent:
  1. `ℍ[K,a,b]` splits, that is `≃ₐ[K] Matrix (Fin 2) (Fin 2) K`;
  2. `b` is a norm from the quadratic algebra `K(√a)`, that is
     `∃ z : QuadraticAlgebra K a 0, z.norm = b`;
  3. `b = x² − ay²` has a solution in `K`;
  4. `⟨1, −a, −b⟩` is isotropic.

  When `a` is a square all four conditions hold, so no hypothesis on `a` is carried.
  The norm form `x² − a y²` is then universal. A fifth equivalent condition, the
  vanishing of the Kummer cup `(a) ∪ (b)`, is Layer 7C, and is kept out of here so that
  Layers 0 to 6 need no cohomology.

Basic API:

- constructors: `quaternionNormForm`, `pureNormForm`, the splitting predicate;
- examples: `ℍ[ℚ,−1,−1]`, a division algebra; `ℍ[ℚ,1,b]`, split for every `b`;
  `ℍ[ℚ_2,2,5]`, a division algebra; `ℍ[ℚ_2,5,5]`, split;
- morphisms: `AlgEquiv` between quaternion algebras; the induced isometry of pure norm
  forms;
- functoriality: base change `ℍ[K,a,b] ⊗_K L ≃ₐ[L] ℍ[L,a,b]`, and the splitting
  predicate under a field map;
- comparison lemmas: the four conditions of the criterion against each other;
  `⟨⟨a,b⟩⟩` against `Nrd`; `QuadraticAlgebra K a 0` against `K(√a)`;
- naturality: `star` and the reduced norm commute with every `K`-algebra equivalence;
- edge cases: `a` a square; `b` a square; `a = 1`; the split case, where the norm form
  is hyperbolic;
- downstream interfaces: Layer 3's binary quaternion lemma, Layer 4's Pfister theory,
  Layer 5's Brauer class, and Layer 6C's Hilbert symbol.

⚠ Bimultiplicativity of the symbol is not provable at this layer. Over a general field,
a comparison of `(a, bc)` with `(a,b)` and `(a,c)` is a statement about a group law that
does not exist yet, and it has no `AlgEquiv` formulation. Do not substitute an ad hoc
statement. It is Layer 5 in `Br(K)`, and Layer 6C in `{±1}`, in each case after the
codomain exists.

### Layer 3: the classical invariants that need no Brauer group

Everything here is a function of a diagonalization, well defined by the descent
principle, with values in `ℕ`, in `ZMod 2`, or in the square-class group. The Hasse
invariant is not in this layer, because its codomain is a group of Brauer classes, which
Layer 5 supplies.

Prerequisites:

- **[Mathlib]** `discr'`, `basisRepr`, `Matrix.det`, `ZMod 2`;
- **[Layer 0]** the descent principle and the binary equivalence criterion;
- **[Layer 2]** the symbol relations and the norm form.

Milestones:

- **Dimension and dimension mod 2**, with `Equivalent`-invariance, and the induced ring
  map to `ZMod 2` that Layer 4 uses.
- **Discriminant and signed discriminant** on `RegularFormClass K`. Prove
  well-definedness through determinants of Gram matrices, that is Mathlib's `discr'`
  transported by `basisRepr`, and also through the descent principle applied to
  `w ↦ ∏ i, w i`. Prove that the two descriptions agree.
- **The exact formulas**, for `q` of rank `m` and `r` of rank `n`, in `Kˣ ⧸ (Kˣ)²`:

  ```text
  d(q ⊥ r)  = d(q) · d(r)                d±(q ⊥ r)  = (−1)^{mn} · d±(q) · d±(r)
  d(λ • q)  = λ^m · d(q)                 d±(λ • q)  = λ^m · d±(q)
  d(q ⊗ r)  = d(q)^n · d(r)^m            d±(q ⊗ r)  = (−1)^{mn(mn−1)/2} d(q)^n d(r)^m
  ```

  together with `signedDiscr_eq_sign_mul_discr : d±(q) = (−1)^{m(m−1)/2} · d(q)`, which
  is the only conversion that a later proof uses. Values on the standard forms:
  `d±⟨a⟩ = a`, `d±(ℍ_q) = 1`, and `d±⟨⟨a,b⟩⟩ = 1`.
- **The binary quaternion lemma.** If `⟨a,b⟩ ≅ ⟨c,d⟩` for units `a b c d`, then
  `ℍ[K,a,b] ≃ₐ[K] ℍ[K,c,d]` (Lam III.2.11 with Layer 2's norm form). This is the one
  nontrivial input to the well-definedness of the Hasse invariant in Layer 5, and it is
  proved here, where its codomain is only an isomorphism class of algebras.
- **Chain induction, prepared.** Two lemmas that Layer 5, Layer 6C, and Layer 8 feed
  into the descent principle. A function of the form `w ↦ ∏_{i<j} F (w i) (w j)` into a
  commutative monoid is:
  - `PermutationStep`-invariant as soon as `F` is symmetric;
  - `BinaryStep`-invariant as soon as `F` is bimultiplicative and `F a b = F c d`
    whenever `⟨a,b⟩ ≅ ⟨c,d⟩`.

  State both for an abstract commutative monoid `M` and an abstract `F : Kˣ → Kˣ → M`.
  Then Layer 5 with `M = BrauerGroup K`, Layer 6C with `M = ℤˣ`, and Layer 8 with
  `M = H²(G_K, 𝔽₂)` written additively each invoke one lemma instead of repeating the
  induction.
- **The invariant dictionary, as documentation.** Record in the file docstring which
  named invariant each source means: O'Meara's `∏_{i≤j}`, Serre's `ε`, Lam's `s`, and
  Lam's `c`, with the ⚠ Wall caution of the convention table. There is no definition
  here, and no formula that mentions a Brauer class.

Basic API:

- constructors: `discr`, `signedDiscr`, `dimMod2`;
- examples: `d±⟨a⟩ = a`; `d±(ℍ_q) = 1`; `d(⟨−1,−1⟩) = [1]`;
- morphisms: the ring map `RegularFormClass K → ZMod 2` given by dimension;
- functoriality: `discr` and `signedDiscr` commute with base change along `K →+* L`;
- comparison lemmas: `signedDiscr_eq_sign_mul_discr`; the Gram-determinant description
  against the product description;
- naturality: the two chain-induction lemmas, stated for an abstract monoid, so that
  each later layer instantiates them;
- edge cases: rank `0` and rank `1`, where `d± = d`; scaling by a square;
- downstream interfaces: Layer 4's `I/I² ≅ Kˣ/(Kˣ)²`, Layer 5's Hasse invariant,
  Layer 6D's classification, and Layer 8's `w₁`.

### Layer 4: the Witt ring and the fundamental ideal

This layer is free of the Brauer group. Everything below is about `RegularFormClass K`
and the rings built from it. The maps into `Br(K)[2]` are Layer 5.

Prerequisites:

- **[Mathlib]** `QuadraticForm/TensorProduct.lean`, `Ideal`, `AddMonoidHom`,
  `Ring.toGrothendieckGroup`-style constructions;
- **[Layer 1]** Witt decomposition and cancellation;
- **[Layer 2]** the norm form and the four-fold criterion;
- **[Layer 3]** the discriminant formulas and the dimension map.

Milestones:

- **`Ŵ(K)` and `W(K)`** (Lam II.1). The commutative monoid `(RegularFormClass K, ⊥)`
  with the multiplication induced by `⊗` is a commutative semiring. Its Grothendieck
  group is the **Witt-Grothendieck ring** `Ŵ(K)`, and the **Witt ring** `W(K)` is the
  quotient by the ideal generated by `ℍ_q`. Well-definedness rests on Layers 1 and 2,
  that is on cancellation and on the tensor product. Every regular form's Witt class is
  represented by its anisotropic part, and two anisotropic regular forms with the same
  Witt class are isometric, by Witt decomposition and cancellation. Prove the basic
  theory: `W` as a functor for field embeddings, and the dimension-mod-2 ring map
  `W(K) → ZMod 2`. General torsion theorems for `W(K)` are excluded.
- **The fundamental ideal.** `I(K) = ker(W(K) → ZMod 2)`. The generation statements are
  elementary and are proved here:
  - `I` is generated as an ideal, and indeed as an additive group, by the 1-fold Pfister
    forms `⟨⟨a⟩⟩ = ⟨1,−a⟩`;
  - `Iⁿ` is generated as an additive group by the `n`-fold Pfister forms
    `⟨⟨a₁,…,aₙ⟩⟩`, which follows from the previous item and from the definition of a
    power of an ideal. State it for general `n`, and record `n = 2` and `n = 3` as the
    cases that later layers use;
  - `I/I² ≅ Kˣ/(Kˣ)²` through `d±`, which is where the signed discriminant is forced.

  No statement about `I³/I⁴` or about the higher filtration is claimed.
- **Pfister forms.** `⟨⟨a₁,…,aₙ⟩⟩` in every degree as the `n`-fold tensor product, with
  the theory developed for `n ≤ 2`:
  - `⟨⟨a,b⟩⟩` is the norm form of `ℍ[K,a,b]` (Layer 2);
  - **round**: for `n ≤ 2`, every `c ∈ unitValueSet ⟨⟨a₁,…,aₙ⟩⟩` is a similarity factor,
    that is `c • ⟨⟨a₁,…,aₙ⟩⟩ ≅ ⟨⟨a₁,…,aₙ⟩⟩`;
  - `⟨⟨a,b⟩⟩` is isotropic if and only if it is hyperbolic;
  - `⟨⟨a,b⟩⟩` is hyperbolic if and only if `ℍ[K,a,b]` splits, which is the four-fold
    criterion stated in the Witt ring.

  The general theory of `n`-fold Pfister forms, that is roundness in all degrees, the
  Arason-Pfister Hauptsatz, and function-field methods, is excluded. The four items
  above are what Layers 5 and 8 consume.

Basic API:

- constructors: `wittGrothendieckRing`, `wittRing`, `fundamentalIdeal`, `pfisterForm`;
- examples: `W(ℂ) ≅ ZMod 2`; `W(ℝ) ≅ ℤ` through the signature; `⟨⟨1⟩⟩ = ⟨1,−1⟩`, which
  is zero in `W(K)`;
- morphisms: `W(K) → W(L)` for a field embedding; the dimension map `W(K) → ZMod 2`;
  the discriminant map `I/I² → Kˣ/(Kˣ)²`;
- functoriality: `W` as a functor, with `I` and `Iⁿ` mapped into each other by a field
  embedding;
- comparison lemmas: a Witt class against its anisotropic representative; a Pfister form
  against a quaternion norm form;
- naturality: the generation of `Iⁿ` by Pfister forms is stable under a field
  embedding;
- edge cases: `n = 0`, where `⟨⟨⟩⟩ = ⟨1⟩`; the hyperbolic class, which is zero in
  `W(K)`; the zero ring case, which does not occur for a field;
- downstream interfaces: Layer 5's homomorphism `c : I² → Br(K)[2]`, and Layer 8's
  Stiefel-Whitney classes on `I²`.

⚠ Nearby false statement. Roundness in the form used here is proved only for `n ≤ 2`.
The unrestricted statement, for every `n`-fold Pfister form, is true but is excluded,
because the proof needs the Pfister theory that this roadmap excludes. Do not cite the
excluded general statement in a proof.

### Layer 5: the Brauer-valued invariants

This is the first layer in which a symbol can be multiplied. The carrier is Mathlib's
`BrauerGroup K`, and the group law is `brauerCommGroup` of the semisimple-algebras
roadmap, whose multiplication is induced by `⊗_K`. What Mathlib lacks besides the law is
the central simplicity of `ℍ[K,a,b]`, which is the first milestone below. The quaternion
symbol is then the class of an algebra and not an abstract pairing.

Prerequisites:

- **[Mathlib]** `CSA`, `IsBrauerEquivalent`, `BrauerGroup`, `Algebra.IsCentralSimple`,
  `CliffordAlgebra` with its grading and even subalgebra;
- **[SSA Layer 4]** the tensor product of two central simple algebras is central simple,
  with the finrank formula, and the opposite-algebra package;
- **[SSA Layer 6]** the `CommGroup` structure on `BrauerGroup K` and the quotient API
  for `Brauer.CSA_Setoid`;
- **[Layer 2]** the symbol relations and the split-or-division dichotomy;
- **[Layer 3]** the binary quaternion lemma and the chain-induction lemmas;
- **[Layer 4]** the generation of `I²` and of `I³` by Pfister forms.

Milestones:

- **Quaternion algebras are central simple.** For `a b : Kˣ` and `2` invertible,
  `ℍ[K,a,b]` is central over `K`, is simple, and is finite-dimensional. This is a target
  here, because `[(a,b)] ∈ BrauerGroup K` is undefined without it. State it for
  `ℍ[K,a,b,c]` with `c·(b² + 4a) ≠ 0`, the generality in which the proof runs, and note
  that `ℍ[K,a,b] = ℍ[K,a,0,b]` satisfies the hypothesis because `b·4a ≠ 0`.
- **The quaternion symbol in `Br(K)`.** The class `[(a,b)] := ⟦ℍ[K,a,b]⟧`, which the
  central-simplicity milestone makes well formed, with the API that later layers
  cite:
  - symmetry `[(a,b)] = [(b,a)]`;
  - square-class invariance in each argument, `[(a, c²b)] = [(a,b)]`;
  - two-torsion `[(a,b)]² = 1`, from `ℍ[K,a,b]ᵒᵖ ≃ₐ[K] ℍ[K,a,b]` through `star`;
  - **bilinearity** `[(a, bc)] = [(a,b)]·[(a,c)]`, and the same in the first argument,
    from the algebra relation `(a,b) ⊗ (a,c) ∼ (a,bc)` (Gille-Szamuely 1.5.2 for the
    statement, Lam III.2.11 for the linkage);
  - `[(a, 1−a)] = 1` for `a : Kˣ` with `1 − a ≠ 0`, and `[(a,−a)] = 1`;
  - the resulting factorization through square classes, that is the biadditive map
    `Kˣ/(Kˣ)² × Kˣ/(Kˣ)² → Br(K)[2]`;
  - **invariance under binary equivalence**: `⟨a,b⟩ ≅ ⟨c,d⟩` gives `[(a,b)] = [(c,d)]`,
    which is Layer 3's binary quaternion lemma read in `Br(K)`. This is what the descent
    of the Hasse invariant uses, and it does not follow from symmetry, 2-torsion, and
    bilinearity alone: a symmetric bilinear pairing on the square-class group can take a
    nonzero value at `([2],[−1])` and still satisfy those three, while
    `⟨2,−1⟩ ≅ ⟨1,−2⟩` forces the value `1`.
- **The Hasse invariant** `hasseInvariant : RegularFormClass K → BrauerGroup K`, with
  `s(⟨a₁,…,aₙ⟩) = ∏_{i<j} [(aᵢ, aⱼ)]` and the empty product for `n ≤ 1`.
  Well-definedness is Layer 3's chain-induction lemma with `M = BrauerGroup K` and
  `F a b = [(a,b)]`. Symmetry and bilinearity are the bullet above, and
  `F a b = F c d` for `⟨a,b⟩ ≅ ⟨c,d⟩` is Layer 3's binary quaternion lemma. Lam V.3.18
  is this argument. Then the two formulas, for `q` of rank `n` and `r` of rank `m`,
  writing `s = hasseInvariant`:

  ```text
  s(q ⊥ r)  = s(q) · s(r) · [(d(q), d(r))]
  s(λ • q)  = s(q) · [(λ, −1)]^{n(n−1)/2} · [(λ, d(q))]^{n−1}
  ```

  (Lam p. 119 and V.3.16. The second formula follows from bilinearity and from
  `[(λ,λ)] = [(λ,−1)]`, and it is written out because each source states it in a
  different convention.)
- **Classification in dimension at most three** (Lam V.3.21). Two regular forms of the
  same dimension `≤ 3` are isometric if and only if they have the same `d` and the same
  `s`. The proof from the invariants back to an isometry runs through Layer 2's
  naturality of quaternion equivalences on pure norm forms.
- **The Clifford invariant.** Mathlib supplies the Clifford algebra, its grading, and
  its even subalgebra, and not the central-simplicity theorems, which are milestones
  here. For regular `q` on a finite-dimensional space:
  - if `dim q` is even, then `CliffordAlgebra q` is finite-dimensional central simple
    over `K`;
  - if `dim q` is odd, then the even subalgebra `CliffordAlgebra.even q` is
    finite-dimensional central simple over `K`;
  - both constructions are invariant under `Equivalent`, because an isometry induces an
    algebra equivalence, so the Brauer classes agree;
  - hence `cliffordInvariant q : BrauerGroup K`, the class of the algebra that the
    parity selects;
  - and the Lam V.3.20 comparison with the Hasse invariant,
    `c(q) = s(q) · [(−1, d(q))]^{(n−1)(n−2)/2} · [(−1,−1)]^{(n+1)n(n−1)(n−2)/24}`, with
    the ⚠ Wall caution of the convention table. On `I²`, where `dim = 2m`, the formula
    reduces to `c = s · [(−1,−1)]^{m(m−1)/2}`.
- **The `I²` homomorphism.** Using Layer 4's generation of `I²` by 2-fold Pfister forms,
  construct the group homomorphism `c : I² → Br(K)[2]` induced by the Clifford
  invariant. Prove that it vanishes on `I³` by checking it on Layer 4's 3-fold Pfister
  generators (Lam V.3.4), and obtain `c̄ : I²/I³ → Br(K)[2]` from the universal property
  of the quotient. No injectivity claim, no surjectivity claim, and no classification
  claim for `c̄` is a milestone here. Injectivity is Merkurjev's theorem, which no
  roadmap in this family proves, and it is an explicit exclusion rather than a promised
  interface.

Basic API:

- constructors: `quaternionClass`, `hasseInvariant`, `cliffordInvariant`, `c̄`;
- examples: `[(a, −a)] = 1`; `[(1,b)] = 1`; `hasseInvariant ⟨a⟩ = 1`;
  `hasseInvariant ⟨a,b⟩ = [(a,b)]`;
- morphisms: the biadditive map `Kˣ/(Kˣ)² × Kˣ/(Kˣ)² → Br(K)[2]`; the homomorphism
  `c : I² → Br(K)[2]`;
- functoriality: base change `BrauerGroup K → BrauerGroup L`, with the symbol and the
  Hasse invariant commuting with it;
- comparison lemmas: `hasseInvariant` against `cliffordInvariant` (Lam V.3.20);
  `hasseInvariant` against O'Meara's `∏_{i≤j}` symbol;
- naturality: the descent of `hasseInvariant` along `Quotient.mk`, and its compatibility
  with `⊥` and with scaling;
- edge cases: rank `0` and rank `1`, where `s = 1`; a hyperbolic form; `a` or `b` a
  square;
- downstream interfaces: Layer 6C's compatibility theorem, and Layer 8's identity
  `ι(hasseInvariant q) = w₂(q)`.

### Layer 6: forms over a nonarchimedean local field

Scope: `K` is a nonarchimedean local field of characteristic `0`, that is a finite
extension of `ℚ_p`, for every prime `p` including `p = 2`. The dyadic case is included
throughout, and it is not a hypothesis swap away from the `ℚ_2` case, because the number
of square classes, the unit filtration, and the explicit formulas all depend on
`[K : ℚ_2]`. The main theorems are therefore stated at that generality from the start.
Serre's closed formulas and the `8 × 8` table over `ℚ_2` are the acceptance suite.

The content of this layer is independent of Layer 5. The one theorem that relates them
is stated at the end of 6C, with its own prerequisites.

#### 6A. The local-field substrate, consumed

The general arithmetic of a nonarchimedean local field belongs to the
[local-fields-ramification roadmap](../LocalFieldsRamification/README.md), and this sublayer consumes it. The
normalized valuation is that roadmap's `normalizedValuation`, the unit filtration is its
`unitFiltration`, the absolute ramification index `e = v_K(2)` is its
`absoluteRamificationIndex K 2`, and the graded pieces, the power-class counts with the
identification of the two spellings of the square classes, the unramified extensions and
their norm groups are its milestones. Nothing here defines a second valuation, a second
filtration or a second ramification index: a second one would need a comparison lemma at
every use site, and every statement of 6B, 6C and 6D is written against the supplied
objects.

One object remains this roadmap's own, because the supplier does not name it, and three
statements remain because the supplier owns the mathematics but exports no target
signature for the shape the later sublayers consume. Both kinds are listed below. Two
further entries carry no work and are there to fix a name: they record which supplier
declaration `e` and the square classes are read through, because 6B, 6C and 6D read both
constantly. The supplier rows are in the contract table under
["Cross-roadmap contract"](#cross-roadmap-contract).

Scope: `K` is a nonarchimedean local field with `2` invertible. In odd residue
characteristic that is any such field, and in residue characteristic `2` it is a finite
extension of `ℚ_2`, because `𝔽₂((t))` has `2 = 0`.

Prerequisites:

- **[Mathlib]** `IsNonarchimedeanLocalField`, `ValuativeRel`, `𝒪[K]`, `𝓂[K]`, `𝓀[K]`,
  `ℚ_[p]`, `ℤ_[p]`, `PadicInt.toZModPow`, Hensel's lemma;
- **[Local Fields Ramification, Layer 0]** `normalizedValuation` with `normalizedValuation_surjective`,
  `normalizedValuation_eq_one_iff` and `normalizedValuation_irreducible`;
  `ramificationIndex`, `inertiaDegree`, `card_residueField`,
  `ramificationIndex_mul_inertiaDegree`; `absoluteRamificationIndex` with
  `normalizedValuation_natCast` and `absoluteRamificationIndex_eq_zero_iff`;
- **[Local Fields Ramification, Layer 1]** `unitFiltration` with `mem_unitFiltration_zero`,
  `mem_unitFiltration_succ_congr`, `mem_unitFiltration_succ_valuation`,
  `unitFiltration_antitone` and `iInf_unitFiltration`; `square_eq_range_powMonoidHom`;
  `teichmuller` with `teichmuller_section`; `card_powerClasses_of_isUnit`,
  `card_powerClasses_mixed`, `card_squareClasses_of_isUnit`, `card_squareClasses_dyadic`;
  `unitFiltration_le_range_powMonoidHom_two` with
  `not_unitFiltration_le_range_powMonoidHom_two`; the milestone *Graded pieces*;
- **[Local Fields Ramification, Layer 2]** `normGroup`, `map_norm_unitFiltration_zero` and
  `mem_normGroup_iff_dvd_normalizedValuation`; the milestone *Existence and uniqueness*;
- **[Layer 0]** the square-class calculus and the `Nat.card` finiteness API.

Milestones:

- **Uniformizers.** `IsUniformizer π` says that `v_K(π) = 1` for the supplied valuation,
  and one exists. It is a predicate and not a component of a package, because an element
  of valuation one is not unique: over `ℚ_2` both `2` and `−2` are uniformizers. A theorem
  that needs a uniformizer takes it, and a theorem whose statement is independent of the
  choice says so. The local-fields-ramification roadmap pins uniformizers through `Irreducible` in
  `𝒪[K]` and proves one direction in `normalizedValuation_irreducible`; the equivalence of
  the two descriptions is a single named lemma here, and every later statement uses
  whichever side is convenient.
- **The absolute ramification index, consumed.** `e` is the supplier's
  `absoluteRamificationIndex K 2`, the decoded value `v_K(2)` of the supplied valuation.
  Under the standing hypothesis `Invertible (2 : K)` the element `2` is a unit, so `e` is
  not data, and `e = 0` says exactly that the residue characteristic is odd. Nothing is
  defined here; the supplier's defining equation and vanishing criterion are what the
  statements below use.
- **The square-class dictionary, consumed.** This roadmap takes square classes in
  `Subgroup.square Kˣ`, and both the local-fields-ramification power-class count and the
  profinite-cohomology Kummer isomorphism are stated at `(powMonoidHom n).range`. The
  identification at `n = 2` is the supplier's `square_eq_range_powMonoidHom`, and it is
  what lets the counts below rest on the supplier's theorem and Layer 7A's Kummer
  isomorphism be stated on square classes.
- **The local square theorem, consumed in its sharp form** (O'Meara 63:1). With
  `e = absoluteRamificationIndex K 2`, `U(K, 2e+1) ⊆ (Kˣ)²`, and the bound is sharp:
  `U(K, 2e) ⊄ (Kˣ)²`. Both halves are the supplier's, against the supplied filtration and
  in the generality 6B's classification of unit defects needs:
  `unitFiltration_le_range_powMonoidHom_two` and
  `not_unitFiltration_le_range_powMonoidHom_two`. Nothing is restated here. 6B needs the
  sharpness and not only the containment, because a defect list built on a depth that is
  not attained would classify nothing.
- **The square-class counts, consumed in the `4 · q^e` form 6D uses.** `Kˣ/(Kˣ)²` is
  finite, which is a separate statement from its order. The order is
  `card_squareClasses_of_isUnit`, that is `4`, when the residue
  characteristic is odd, and `card_squareClasses_dyadic`, that is `4 · q^e` with
  `q = #𝓀[K]` and `e = absoluteRamificationIndex K 2`, when the residue
  characteristic is `2`. For a finite extension of `ℚ_2` of degree `N = e·f` the second
  reads `2^{N+2}`, and over `ℚ_2` it reads `8`. Both are the supplier's count
  `#(Kˣ/(Kˣ)ⁿ) = n · #μ_n(K) · q^{v_K(n)}` at `n = 2`, where `#μ_2(K) = 2` because `2` is
  invertible. What is stated here, and is not the supplier's, is the choice of
  representatives: for odd residue characteristic the four classes are represented by
  `1, u, π, uπ`, where `u` is a unit whose residue is a nonsquare. That choice of `u` is
  part of the statement and is never left implicit.
- **The unramified quadratic extension, in the norm-equation form 6B and 6C consume.**
  There is a nonsquare unit `Δ` such that `K(√Δ)/K` is the unramified quadratic extension,
  and `b` is a norm from it exactly when `v_K(b)` is even; equivalently every unit is a
  norm and a uniformizer is not. The local-fields-ramification roadmap owns the unramified extension
  and the norm group, and states the criterion at `mem_normGroup_iff_dvd_normalizedValuation`,
  namely `x ∈ normGroup L/K ↔ f ∣ v_K(x)`; at `f = 2` that is the parity condition above.
  What this statement adds is the passage to the norm equation `b = x² − Δ y²`, which is
  the shape 6B's evaluation formula and 6C's symbol computation apply, and which needs no
  extension-building API.

Basic API for the objects introduced here:

- constructors: `IsUniformizer` and `q = Nat.card 𝓀[K]`; `e` is the supplier's
  `absoluteRamificationIndex K 2` and is constructed there;
- examples: `ℚ_[p]` with `π = p`; `ℚ_2`, where `e = 1` and `#(ℚ_2ˣ/(ℚ_2ˣ)²) = 8` on the
  basis `−1, 2, 5`;
- morphisms: none are introduced; the inclusions and quotient maps of the filtration are
  the supplier's;
- functoriality: for a finite extension `L/K` the supplier's
  `normalizedValuation_algebraMap` gives `v_L ∘ (algebraMap K L) = e(L/K) · v_K`, and
  `U(K,i)` maps into `U(L, e(L/K)·i)`;
- comparison lemmas: `IsUniformizer` against the supplier's `Irreducible` convention; the
  multiplicative square-class group against `TauCeti.SquareClassGroup`. The comparison of
  `Subgroup.square Kˣ` with `(powMonoidHom 2).range` is the supplier's
  `square_eq_range_powMonoidHom` and is not restated;
- naturality: the counts are invariant under an isomorphism of local fields, because the
  supplied valuation is;
- edge cases: odd residue characteristic, where `e = 0` and `U(K,1) ⊆ (Kˣ)²`; the residue
  field `𝔽₂`, where `𝓀[K]ˣ` is trivial and `𝒪[K]ˣ = U(K,1)`;
- downstream interfaces: 6B's defect classification, 6C's symbol computations, and 6D's
  counting arguments.

⚠ Sharpness of the local square theorem. Over `ℚ_2`, `e = 1` and
`U(ℚ_2, 2) = 1 + 4ℤ_2` contains `5`, which is not a square. So `2e+1` cannot be lowered
to `2e`.

#### 6B. The quadratic defect

Bimultiplicativity is the one hard theorem of Layer 6, and the route used for it is
O'Meara's, which runs on the quadratic defect. The defect therefore has its own
statements here. Throughout, `e = v_K(2)`, so `e = 0` exactly when the residue
characteristic is odd.

Prerequisites:

- **[Mathlib]** `FractionalIdeal`, `FractionalIdeal.spanSingleton`, the `Lattice` and
  `OrderBot` instances on `FractionalIdeal`, `IsFractionRing 𝒪[K] K`;
- **[Local Fields Ramification, Layers 0 and 1]** `normalizedValuation` and
  `unitFiltration`, which
  every statement below is written against;
- **[Layer 6A]** the absolute ramification index, the local square theorem in its sharp
  form, and the unramified norm description.

Milestones:

- **The carrier.** For general `a : Kˣ` the defect is a fractional ideal and not an
  ideal of `𝒪[K]`, because every `a − ξ²` has negative valuation when `v_K(a) < 0`. The
  object is

  ```lean
  quadraticDefect (a : Kˣ) : FractionalIdeal (𝒪[K])⁰ K
  ```

  the largest fractional ideal contained in every `spanSingleton ((a : K) − ξ²)` for
  `ξ : K`. This is O'Meara's `𝔡(a) = ⋂_{ξ : K} (a − ξ²) · 𝒪[K]` in a type that holds it.
  Mathlib's `FractionalIdeal` carries a `Lattice` and no infima of infinite families, so
  the Lean definition is the greatest-lower-bound property:

  ```text
  ∀ ξ : K, 𝔡(a) ≤ (a − ξ²) · 𝒪[K]      and
  ∀ 𝔢, (∀ ξ : K, 𝔢 ≤ (a − ξ²) · 𝒪[K]) → 𝔢 ≤ 𝔡(a)
  ```

  Uniqueness is antisymmetry. Existence is the first milestone. The fractional ideals
  `(a − ξ²) · 𝒪[K]` are totally ordered, so the family has an infimum. That infimum is
  `𝓂[K]^{δ(a)}` when the exponent is finite, and `0` when it is not. State both
  descriptions.
- **The defect exponent.** `δ(a) = sup_ξ v_K(a − ξ²)` is unbounded exactly on squares,
  so its type is

  ```lean
  defectExponent (a : Kˣ) : WithTop ℤ
  ```

  with `δ(a) = ⊤` if and only if `a` is a square. `𝔡` is the object of the sources, and
  `δ` is the object that the computations below use. Every statement about the parity of
  `δ` carries the hypothesis that `a` is not a square, where `δ(a)` is an integer.
- **The calculus of the defect**, for `a c : Kˣ`:
  - `𝔡(a) = 0` if and only if `a` is a square;
  - `𝔡(a c²) = (c)² · 𝔡(a)` as fractional ideals, that is `δ(a c²) = δ(a) + 2 v_K(c)`.
    So the parity of `δ` is an invariant of the square class, and `𝔡` is an invariant up
    to squares of principal ideals;
  - `𝔡(a) ≤ 1`, that is `𝔡(a) ⊆ 𝒪[K]`, when `a ∈ 𝒪[K]ˣ`. So for a unit the defect is
    the integral ideal `𝓂[K]^{δ(a)}`, and the classification below is a statement about
    ideals of `𝒪[K]`;
  - `𝔡(a) = a · 𝒪[K]` when `v_K(a)` is odd, because then
    `v_K(a − ξ²) = min(v_K(a), 2 v_K(ξ))` for every `ξ`, the two valuations never being
    equal. This is what lets the case analysis below use `δ` alone.
- **The possible defects of a unit** (O'Meara 63:2, on top of the local square theorem
  of 6A). The defect of `u : 𝒪[K]ˣ` is one of

  ```text
  0,   𝓂[K]^{2e} = 4𝒪[K],   𝓂[K]^{2k+1}  for 0 ≤ k < e
  ```

  a list of length `e + 2`. For odd residue characteristic the list is `{0, 𝒪[K]}`, and
  the statement is Hensel's lemma. Over `ℚ_2` the list is `{0, 4ℤ_2, 2ℤ_2}`, which are
  the defects of `1`, of `5`, and of `−1`. The dyadic computation below terminates
  because this list is finite.
- **The ramification dictionary.** For `a` a nonsquare, so that `δ(a)` is an integer,
  `K(√a)/K` is unramified if and only if `δ(a)` is even, and is ramified if and only if
  `δ(a)` is odd. A square has `𝔡(a) = 0` and a trivial extension. Among the unit square
  classes exactly one has `𝔡(u) = 4𝒪[K]`, namely the class of the `Δ` with `K(√Δ)` the
  unramified quadratic extension of 6A.

Then the three symbol computations of O'Meara 63:11 to 63:13, each written out.

- **Evaluation against the unramified class.** For `Δ` as above and every `b : Kˣ`,

  ```text
  (Δ, b)_K = (−1)^{v_K(b)}.
  ```

  This is 6A's `N(K(√Δ)ˣ) = {x : v_K(x) even}` read through the norm description of the
  symbol, that is 6C item 1. It is the only closed formula available at this
  generality, and the statements below are proved against it.
- **Multiplicativity, in the form in which it is proved: an index theorem.** For
  `a : Kˣ` a nonsquare,

  ```text
  (Kˣ : N_{K(√a)/K}(K(√a)ˣ)) = 2.
  ```

  Bimultiplicativity then follows by group theory, and it is stated that way. The map
  `b ↦ (a,b)_K` is the `{±1}`-valued indicator of the subgroup `N(K(√a)ˣ) ≤ Kˣ`, and the
  indicator of a subgroup `H ≤ G` is a homomorphism `G → ℤˣ` exactly when `(G : H) ≤ 2`.
  That lemma contains no arithmetic and belongs with Layer 0's square-class calculus.
  Multiplicativity in the first argument then follows from symmetry, that is 6C item 2.

  The two inequalities have different weights. The bound `≥ 2` is the witness list of
  the next milestone. The bound `≤ 2`, that is the statement that a product of two
  non-norms is a norm, is the theorem, and O'Meara's §63A computation proves it. Two
  reductions make it smaller, and both are milestones:
  - `(Kˣ)² ⊆ N(K(√a)ˣ)` and `−a ∈ N(K(√a)ˣ)`, the second because `−a = N(√a)`. So the
    norm group is a union of square classes, and the index is computed inside the finite
    group `Kˣ/(Kˣ)²` of 6A;
  - after `a` is normalized in its square class so that `v_K(a) ∈ {0, 1}`, the unit
    norms are exactly the units among

    ```text
    u² (1 − a t²)   and   u² (−a) (1 − a t²),      u : 𝒪[K]ˣ,  t : 𝒪[K],
    ```

    where the second family is `−a` times the first, and occurs only for `a` a unit.
    (`x² − a y²` is a unit only when `min(v_K(x), v_K(y)) = 0`. Divide by the square of
    whichever of `x` and `y` is a unit. For `v_K(a) = 1` the two valuations have
    different parities, so `v_K(x) = 0` and only the first family survives.) The index
    question is therefore a question about the unit values of one binary form.
- **Nondegeneracy.** For `a : Kˣ` a nonsquare there is `b : Kˣ` with `(a,b)_K = −1`. The
  witness is read off the defect, in the same three cases into which the proof of the
  index theorem splits.
  1. `v_K(a)` odd: take `b = Δ`, by the evaluation formula and symmetry. The matching
     upper bound is the unit-norm description above, applied to `a = π u`.
  2. `a` a unit with `𝔡(a) = 4𝒪[K]`: take `b = π`, by the evaluation formula again,
     because `a` is `Δ` up to squares. Here `N(K(√a)ˣ) = {x : v_K(x) even}` exactly, so
     6A closes this case of the index theorem.
  3. `a` a unit with `𝔡(a) = 𝓂[K]^d`, `d` odd, `0 < d < 2e`. This case is empty unless
     the residue characteristic is `2`. Here `K(√a)/K` is ramified of discriminant
     `𝓂[K]^{2e−d+1}`, hence of that conductor exponent, and the statement in the form
     that Layer 6 uses is

     ```text
     U(K, 2e−d+1) ⊆ N(K(√a)ˣ)   and   U(K, 2e−d) ⊄ N(K(√a)ˣ),
     ```

     where the second half is the witness. Also `1 − a ∈ N(K(√a)ˣ)` has odd valuation
     `d`, after `a` is normalized as `a = 1 + ε` with `v_K(ε) = d`, which is what
     `𝔡(a) = 𝓂[K]^d` says. So the norm group is not contained in the even-valuation
     subgroup, and the unit part decides the index. ⚠ The containment does **not**
     identify the unit norms with `U(K, 2e−d+1) · (𝒪[K]ˣ)²`. That product can have index
     `4` or more in `𝒪[K]ˣ`, already for `K = ℚ_2(√2)` and `d = 1`. The defect
     computation closes the difference. This case carries the dyadic content of the
     sublayer.

  Over `ℚ_2` case 3 reads: `a = −1`, `d = 1`, `e = 1`. Then `U(ℚ_2, 2) = 1 + 4ℤ_2` lies
  in the norms, that is the classes `[1]` and `[5]`, which are sums of two squares, and
  `3` is the non-norm that `U(ℚ_2, 1) ⊄ N` supplies.

Basic API:

- constructors: `quadraticDefect`, `defectExponent`, the unramified class `Δ`;
- examples over `ℚ_2`: `𝔡(1) = 0`, `𝔡(5) = 4ℤ_2`, `𝔡(−1) = 2ℤ_2`;
- morphisms: none, because `𝔡` is not a homomorphism; see the counterexample below;
- functoriality: none is claimed. ⚠ A base change can turn a nonsquare into a square,
  and then the defect becomes `0` rather than scaling: in `L = K(√Δ)` the element `Δ` is
  a square, and in a ramified extension containing `√a` so is `a`. Any base-change
  formula therefore carries the hypothesis that the class stays nonsquare, and the split
  case is stated separately;
- comparison lemmas: `𝔡` against `defectExponent`; `𝔡` against the ramification of
  `K(√a)`; `𝔡` against membership in `U(K,i)`;
- naturality: `𝔡(a c²) = (c)² 𝔡(a)`, so `𝔡` is defined on square classes up to squares
  of principal ideals;
- edge cases: `a` a square, where `𝔡(a) = 0`; `v_K(a)` odd, where `𝔡(a) = a·𝒪[K]`; odd
  residue characteristic, where the list of unit defects has two entries;
- downstream interfaces: 6C's bimultiplicativity and nondegeneracy.

⚠ Counterexample to multiplicativity of the defect. Over `ℚ_2`, `𝔡(−1) = 2ℤ_2` and
`𝔡(5) = 4ℤ_2`, and `−5 ≡ 3 mod 8` gives `𝔡(−5) = 2ℤ_2`, which is not `8ℤ_2`. So `𝔡` is
not multiplicative, and no proof may assume that it is.

The quadratic defect is required API and not only a proof device. Its carrier, its
calculus, and the classification of unit defects are deliverables of this sublayer,
whatever route a later implementer takes to bimultiplicativity.

#### 6C. The Hilbert symbol and the local Hasse invariant

**The Hilbert symbol is this roadmap's, in both halves.** The first half is the
norm-criterion description of the mod-2 pairing, which is stated in Layer 7C over any
field in which `2` is invertible. The second half is the identification of that
description with the classical `{±1}`-valued symbol over a nonarchimedean local field,
which is this sublayer's. The class-field-theory roadmap owns the local invariant and
the cohomological Kummer-cup pairing and defines no quadratic form or quaternion algebra.
The comparison is the frozen declaration `hilbertSymbol_eq_cohomological`; no CFT
milestone depends on it. The frozen `hilbertSymbol_productFormula` then translates
`ClassFieldTheory.hilbertProductFormula` into multiplicative signs.

Prerequisites:

- **[Layer 2]** the four-fold splitting criterion;
- **[Layer 3]** the binary quaternion lemma and the chain-induction lemmas;
- **[Local Fields Ramification, Layers 0 and 1]** `normalizedValuation` and
  `unitFiltration`;
- **[Class Field Theory, Layers 2--3]** `H`, `muNRep`, `kummerClass`,
  `h2MuEquivZMod_mixed`, `kummerCupPairing`, `localSymbol`, and
  `tateDualityPairing_perfect_mixed`, for the comparison below;
- **[Layer 6A]** the uniformizer predicate, the absolute ramification index, the local
  square theorem, the square-class counts, and the unramified norm description;
- **[Layer 6B]** the defect computations.

Milestones, in this order:

1. **Definition.** `hilbertSymbol a b : ℤˣ` is `+1` when `∃ x y : K, b = x² − a y²`, and
   `−1` otherwise, for `a b : Kˣ`. Nothing about quaternion algebras or about their
   classification enters the definition, so nothing later is circular.
2. **Agreement with the other two descriptions.** `(a,b)_K = 1` if and only if `b` is a
   norm from `K(√a)`, and if and only if `z² − ax² − by² = 0` has a nontrivial zero.
   This is Layer 2's four-fold criterion, specialized. Prove square-class invariance in
   each argument.
3. **Symmetry** `(a,b)_K = (b,a)_K`. After it, the two orientations of the symbol, by
   `b ∈ N(K(√a)ˣ)` and by `a ∈ N(K(√b)ˣ)`, are interchangeable, and a source may be read
   in either.
4. **The defect computations** of 6B, ending in the norm-index theorem.
5. **Bimultiplicativity** `(a, bc)_K = (a,b)_K · (a,c)_K`, with the dyadic case
   included. It follows from the index theorem and the indicator lemma in the second
   argument, and from symmetry in the first (O'Meara 63:11 to 63:13; Serre III Thm 2 for
   `K = ℚ_p`).
6. **Nondegeneracy.** For a nonsquare `a` there is `b` with `(a,b)_K = −1`, with the
   witnesses that 6B lists by defect.
7. **The local Hasse invariant** `localHasse q = ∏_{i<j} (aᵢ, aⱼ)_K ∈ ℤˣ` for
   `q ≅ ⟨a₁,…,aₙ⟩`. It is well defined by Layer 3's chain-induction lemma with
   `M = ℤˣ`. Symmetry and bilinearity are items 3 and 5. The binary condition
   `(a,b)_K = (c,d)_K` for `⟨a,b⟩ ≅ ⟨c,d⟩` follows from Layer 3's binary quaternion
   lemma and from item 2. The two formulas of Layer 5 hold here in `{±1}`.
8. **Explicit formulas over `ℚ_p`**, as the acceptance suite (Serre III Thm 1). For odd
   `p`, and `a = p^α u`, `b = p^β v`:
   `(a,b) = (−1)^{αβ ε(p)} (u|p)^β (v|p)^α` with `ε(p) = (p−1)/2 mod 2`, which consumes
   `legendreSym` and `TauCeti/NumberTheory/LegendreSymbol/SquareClass.lean`. For the
   case `p = 2`, the formula is `(a,b) = (−1)^{ε(u)ε(v) + α ω(v) + β ω(u)}` with
   `ε(u) = (u−1)/2` and `ω(u) = (u²−1)/8 mod 2`, both read off
   `PadicInt.toZModPow 3`. Also state the general
   odd-residue-characteristic formula, with the quadratic residue character of `𝓀[K]` in
   place of the Legendre symbol. There is no closed formula of that kind for a general
   dyadic `K`, which is why 6B carries the dyadic content.
9. **The `8 × 8` table over `ℚ_2`** on the representatives `{±1, ±5, ±2, ±10}`, as a
   family of decidable computations. The table is the test that the dyadic formula is
   correct.
10. **The symbol is the mod-2 specialization of the CFT pairing.** Class Field Theory
    builds `localSymbol` from `kummerClass`, `kummerCupPairing`, and the arithmetic
    invariant on `H²(G_K, μ₂)`, and proves the corresponding local duality pairing
    perfect. The milestone `hilbertSymbol_eq_cohomological` says that it agrees with
    `hilbertSymbol` after the dictionary `0 -> +1`, `1 -> -1`. It is stated after Layer
    7C, because the comparison runs through the Kummer cup--norm theorem.
11. **The global product formula is inherited.** Apply the sign dictionary to
    `ClassFieldTheory.hilbertProductFormula`. The resulting frozen declaration
    `hilbertSymbol_productFormula` is an export to `GlobalQuadraticForms`, not a local-
    global classification theorem here.
12. **The two Hasse invariants agree**, which is stated after Layer 6D as sublayer 6E,
    because it consumes the classification.

Basic API:

- constructors: `hilbertSymbol`, `localHasse`;
- examples: `(−1,−1)_{ℚ_2} = −1`; `(−1,−1)_{ℚ_p} = +1` for odd `p`; `(2,5)_{ℚ_2} = −1`;
  `(5,5)_{ℚ_2} = +1` with the witness `5 = 5² − 5·2²`;
- morphisms: the biadditive pairing `Kˣ/(Kˣ)² × Kˣ/(Kˣ)² → ℤˣ`;
- functoriality: the symbol is unchanged when either argument is multiplied by a square,
  so it is a function on pairs of square classes. Behaviour under a base change `L/K` is
  not part of this layer;
- comparison lemmas: the three descriptions of item 2; the symbol against the splitting
  of `ℍ[K,a,b]`; the symbol against `localHasse` of a binary form;
- naturality: `localHasse` descends along `Quotient.mk` and satisfies the two Layer 5
  formulas in `{±1}`;
- edge cases: `a` or `b` a square, where the value is `+1`; `a = 1`; rank `0` and
  rank `1`, where `localHasse = 1`;
- downstream interfaces: 6D's classification, sublayer 6E, and Layer 7C's fifth
  equivalent condition.

⚠ Nearby false generalization. Bimultiplicativity fails over a general field. Take
`K = ℚ` and `a = −1`. A positive rational is a sum of two squares only when every prime
congruent to `3` modulo `4` occurs to an even power. So `3` and `7` are not norms from
`ℚ(i)`, and `21 = 3·7` is not a norm either. The indicator of the norm group is
therefore not a homomorphism. The index-2 statement of 6B is the local input that makes
it one.

#### 6D. The classification and its corollaries

Prerequisites:

- **[Layer 1]** Witt decomposition, cancellation, and the extension theorem;
- **[Layer 3]** the discriminant;
- **[Layer 6A]** the square-class count and the unramified norm group;
- **[Layer 6C]** the Hilbert symbol, bimultiplicativity, nondegeneracy, and
  `localHasse`.

Milestones:

- **The classification** (O'Meara 63:20, Serre IV Thm 7). Two regular forms over `K` are
  isometric if and only if `(dim, d, s)` agree, where `d` is the plain discriminant in
  `Kˣ/(Kˣ)²` and `s = localHasse`. Because the dimension is part of the tuple,
  `(dim, d±, s)` is an equivalent complete invariant, and the conversion is
  `signedDiscr_eq_sign_mul_discr`. The plain `d` is the primary invariant of this
  roadmap.
- **Realization** (O'Meara 63:23, Serre IV Prop 6). A triple `(n, d, s)` with `n ≥ 1`,
  `d ∈ Kˣ/(Kˣ)²`, and `s ∈ {±1}` is realized by a regular form, except in exactly two
  cases: `n = 1` with `s = −1`; and `n = 2` with `d = [−1]` and `s = −1`. Every other
  triple occurs. Both exceptions are forced, because the empty product gives `s = +1` in
  dimension 1, and `⟨a,−a⟩` has `s = (a,−a)_K = +1`.
- **Isotropy by rank** (Serre IV Thm 6), in the fixed convention:
  - rank 1: never isotropic;
  - rank 2: isotropic if and only if `d = [−1]`;
  - rank 3: isotropic if and only if `s = (−1, −d)_K`;
  - rank 4: isotropic if and only if `d ≠ [1]`, or `d = [1]` and `s = (−1,−1)_K`;
  - rank at least 5: always isotropic.
- **Representation**, as a corollary. For regular `q` and `a : Kˣ`,
  `a ∈ unitValueSet q` if and only if `q ⊥ ⟨−a⟩` is isotropic, by Layer 0. The
  right-hand side is decided by the rank list above, applied to the invariants of
  `q ⊥ ⟨−a⟩`, which are
  `(dim q + 1, −a·d(q), localHasse q · (−a, d(q))_K)`. Write out the description of
  `unitValueSet q` rank by rank (O'Meara 63:21, Serre IV cor. to Thm 6).
- **`u(K) = 4`.** Every regular form of dimension at least 5 over `K` is isotropic, and
  there is an anisotropic form of dimension 4 (O'Meara 63:19).
- **The anisotropic quaternary form is unique** up to isometry (O'Meara 63:17-18,
  Serre IV Thm 7 cor.). It is the norm form of the unique quaternion division algebra
  over `K`, and `⟨1,1,1,1⟩` realizes it when `K = ℚ_2`. Equivalently there are exactly
  two quaternion algebras over `K` up to isomorphism. That statement is a consequence of
  the theory here, and it is never used to define the symbol. It is what makes the
  two-element group `Q(K)` of 6E available without cohomology.

Basic API:

- constructors: the invariant triple `(dim, d, s)`, and the realization map from triples
  to classes;
- examples over `ℚ_2`: `⟨1,1,1,1⟩`, anisotropic; `⟨−1,−1⟩`, which realizes
  `(2, [1], −1)`;
- morphisms: the injection of `RegularFormClass K` into the set of admissible triples;
- functoriality: the triple is computed from `d` and from the symbol, so its behaviour
  under a base change is whatever 6C proves for those two. This layer claims no further
  base-change formula;
- comparison lemmas: `(dim, d, s)` against `(dim, d±, s)`; the isotropy list against the
  realization list;
- naturality: the classification is stated on `RegularFormClass K`, so it commutes with
  the descent principle;
- edge cases: rank `0`; the two excluded triples; the anisotropic quaternary form;
- downstream interfaces: 6E, and the local classification that integral-lattice theory
  consumes.

⚠ Nearby false generalization. The triple `(dim, d, s)` is not a complete invariant over
a general field. Over `ℝ` the forms `⟨1,1,1,1⟩` and `⟨−1,−1,−1,−1⟩` both have dimension
`4`, discriminant `[1]`, and Hasse invariant `+1`, because `(−1,−1)_ℝ = −1` occurs six
times. They are not isometric. Similarly `u(K) = 4` uses the local hypothesis:
`u(ℝ) = ∞` and `u(𝔽_q) = 2`.

#### 6E. The two Hasse invariants agree, and both are the invariant map

Prerequisites:

- **[Layer 5]** the quaternion symbol and `hasseInvariant`;
- **[Layer 6C]** `localHasse`;
- **[Layer 6D]** the uniqueness of the quaternion division algebra;
- **[Layer 7B]** the 2-torsion comparison `ι`, for the second milestone only;
- **[Class Field Theory, Layers 2--3]** the local invariant normalization
  `h2MuEquivZMod_mixed` and its `localSymbol`, for the second milestone only.

Milestone 1. The subgroup `Q(K) ≤ BrauerGroup K` generated by the quaternion classes is
`{1, [D]}`, where `D` is the quaternion division algebra of 6D, so the map
`ε : Q(K) ≃* ℤˣ` with `ε [D] = −1` is well defined. Every `hasseInvariant q` lies in
`Q(K)`, because it is a product of quaternion classes, and

```text
ε (hasseInvariant q) = localHasse q
```

termwise from Layer 2's four-fold criterion. This milestone needs no cohomology: Layer 6C
builds `localHasse` from the Hilbert symbol alone, and Layer 5 builds `hasseInvariant`
from the Brauer group alone. Layer 7C's local specialization consumes it.

Milestone 2. `ε` is the degree-two local invariant of Class Field Theory. Precisely,
`Q(K) = Br(K)[2]`, and under the identification `Br(K)[2] ≅ H²(G_K, μ₂)` of Layer 7B,
`h2MuEquivZMod_mixed` carries the division class to the nonzero element of `ZMod 2`.
Equivalently, the usual embedding in `ℚ/ℤ` carries `[D]` to `1/2`. So

```text
localSymbol (a) (b) = 0   if and only if   (a,b)_K = +1,
```

and the Hasse invariant of a form is the local invariant of its Brauer class. The
cohomological carrier and normalization are imported from CFT; this roadmap proves only
the quaternion/quadratic-form comparison. Class Field Theory owns the invariant map and
states no theorem about quaternion algebras or quadratic forms, so this identification,
which mentions both, is stated here.

This second milestone is the one place in Layers 0 to 6 that uses cohomology, and it comes
after Layer 7B in the build order; the ordering section says so. Its two ingredients are
each owned elsewhere, and neither is assumed by any earlier statement.

### Layer 7: the Brauer group in Galois cohomology

The comparison of the algebraic Brauer group with `H²` is owned here. It is a piece of
mathematics, that is the theory of crossed products, and not a formality.

#### 7A. The mod-2 operations, consumed, and the `μ₂` adapters

The continuous cohomology of a profinite group, with its cup product, its Kummer theory,
its restriction and corestriction, and its Evens norm, belongs to the
[profinite-cohomology roadmap](../ProfiniteCohomology/README.md). This sublayer consumes
those declarations. It defines no cup product, no restriction, no corestriction, no
Kummer isomorphism and no Evens norm, because a second one of any of them would need a
comparison theorem at every use site and would leave two theories that only prose says
agree.

The carrier is that roadmap's `trivialF2` object over its `AbsoluteGaloisGroup`, which is
the automorphism group of the separable closure with its Krull topology. Taking that
object as the carrier, rather than a private `𝔽₂` representation, is what lets the
supplier's `cup`, `res`, `corestriction` and `evensNormIndexTwo` apply here directly. The
names `H¹(G_K, 𝔽₂)` and `H²(G_K, 𝔽₂)` in the statements below are abbreviations for it and
implement nothing.

What this sublayer owns is three things, and each is a milestone.

Prerequisites:

- **[Profinite Cohomology, Layers 1 and 9]** `AbsoluteGaloisGroup`, `TopRep`,
  `continuousCohomology`, `map`, `res`, `infl`, `coeffMap`;
- **[Profinite Cohomology, Layer 9]** `KummerCoeff`, `powerClassQuotient`, `kummerMap`,
  `kummerIso`, `kummerMapCanonical`, `kummerIso_res`, `kummerIso_norm`,
  `kummerCoeff_continuousSMul`, `UnitsCoeff`, `unitsCoeff_continuousSMul`,
  `kummerShortExact`, `hilbert90`, `h2KummerToUnits`, `h2KummerToUnits_injective`,
  `h2KummerToUnits_range`, `galoisSubgroup`, `galoisSubgroup_index`,
  `galoisSubgroupEquiv`, `galoisF2Iso`, `galoisRes`, `galoisCor`, `galoisEvens`,
  `galoisConj`, and their laws;
- **[Profinite Cohomology, Layer 10]** `corestriction`, `corestrictionLe`,
  `corestriction_comp_res`, `corestriction_mackey`;
- **[Profinite Cohomology, Layer 12]** `TopPairing`, `cup`, `cup_add_left`,
  `cup_add_right`, `cup_res`, `cup_infl`, `cup_projection`, `cup_gradedComm`,
  `degreeCast`, `ofDiscreteModulePairing`;
- **[Profinite Cohomology, Layer 13]** `trivialF2`, `trivialF2_isSmoothDiscrete`,
  `f2Pairing`, `evensNorm`, `evensNormIndexTwo`, `evensConj`, `evensNorm_res`,
  `evensNorm_polarization`, `evensNorm_cor_shapiro`, `evensNorm_identity_infl`;
- **[Layer 0]** the square-class group and the square-class dictionary of 6A.

Milestones:

- **The coefficient identification specific to `μ₂`.** The supplier's Kummer coefficients
  are `μₙ(Kˢ)` written additively, and its Evens norm and its `𝔽₂` cup product are stated
  on the trivial `𝔽₂` object. Under `Invertible (2 : K)` these agree at `n = 2`, and this
  roadmap owns the agreement:
  - `mu2EquivZMod2 : μ₂ ≃+ ZMod 2`. Its type pins it, because the only additive
    self-equivalence of `ZMod 2` is the identity, so no normalization law is needed;
  - the Galois action on `μ₂` is trivial, since `μ₂ = {±1} ⊆ K`. This is the content: at
    `n > 2` the corresponding statement is false, which is why every mod-2 statement of
    Layers 7 to 9 carries `Invertible (2 : K)` and not a general `n`;
  - hence an isomorphism of coefficient objects between the supplier's `μ₂` coefficients
    and its trivial `𝔽₂` object. This is the only coefficient transport used below.

  With it, the **Kummer class** `(a) ∈ H¹(G_K, 𝔽₂)` of a unit is the supplier's
  `kummerMapCanonical` at `n = 2` read through that transport, and not a second Kummer
  cocycle; and the **Kummer isomorphism on square classes**
  `Kˣ/(Kˣ)² ≃ H¹(G_K, 𝔽₂)` is the supplier's `kummerIso` at `n = 2` read through it and
  through 6A's square-class dictionary. Both are stated, and the second sends a square
  class to the Kummer class of a representative.
- **The map from `H²(G_K, 𝔽₂)` into the cohomological Brauer group.** The coefficients
  `Additive Kˢˣ` are the supplier's `UnitsCoeff`, and the injection of `H²(G_K, μₙ)` into
  `H²(G_K, Kˢˣ)` with image the `n`-torsion is its `h2KummerToUnits` with its two
  theorems, from the long exact sequence of `1 → μₙ → Kˢˣ → Kˢˣ → 1` together with
  Hilbert 90. What is stated here is the mod-2 form `h2MuToUnits`, that composite read
  through the `μ₂` transport, with its injectivity and its 2-torsion image, since it is
  the form Layers 7B and 8 name. Its body is a real term over the supplier's map, so the
  two cannot drift.
- **What the transfer along a finite separable `L/K` adds here.** The supplier owns the
  passage from a `K`-embedding `σ : L → Kˢ` to the open subgroup `G_L ≤ G_K`, the
  transport of its `𝔽₂`-cohomology, the resulting `galoisRes`, `galoisCor` and
  `galoisEvens`, the choice-free conjugate `galoisConj`, the two Evens identities

  ```text
  res (N x)   = x ∪ σ·x
  N (x + y)   = N x + N y + cor (x ∪ σ·y)
  ```

  functoriality in a tower `M/L/K`, and independence of the embedding. None of that is
  rebuilt here. ⚠ The conjugate is not optional: the cross term of the quadratic expansion
  is a cup with `σ·y` and not with `y`. What is left for this sublayer is the part that
  mentions this roadmap's own notions:
  - restriction on the multiplicative coefficients, which is not an instance of
    `galoisRes`: `UnitsCoeff K` and `UnitsCoeff L` are coefficient objects over different
    groups;
  - restriction of a Kummer class is the Kummer class of the image, and corestriction of a
    Kummer class is the Kummer class of the norm, each the supplier's Kummer square at
    `n = 2` read through the `μ₂` transport;
  - compatibility of `h2MuToUnits` with restriction.

Basic API:

- constructors: `mu2EquivZMod2` and the coefficient-object isomorphism; the Kummer class
  and the square-class isomorphism; `h2MuToUnits`; restriction on the multiplicative
  coefficients;
- examples: `(a) = 0` exactly when `a` is a square; over `ℚ_2`, the eight Kummer classes
  of the square-class representatives `{±1, ±5, ±2, ±10}`;
- morphisms: `h2MuToUnits`, which is additive, and restriction on the multiplicative
  coefficients;
- functoriality: the supplier's towers and independence of the embedding carry over
  unchanged, so nothing here mentions a chosen embedding;
- comparison lemmas: the square-class Kummer isomorphism against the supplier's
  `kummerIso`; `h2MuToUnits` against restriction;
- naturality: each adapter law is the transport of the corresponding supplier theorem, and
  is named as such;
- edge cases: `L = K`, where the supplier's subgroup is everything and its three
  operations are the identity; a square `a`, where the Kummer class vanishes;
- downstream interfaces: Layer 7B's comparison, Layer 7C's cup criterion, Layer 8's
  classes, and Layer 9's relative formula.

#### 7B. The comparison with `H²`

Prerequisites:

- **[SSA Layer 6]** `brauerCommGroup` and `IsSplittingField`;
- **[Layer 5]** the quaternion class and its bilinearity;
- **[Layer 7A]** the carriers, the Kummer class, and `h2MuToUnits`;
- **[Profinite Cohomology, Layer 12]** `cup` at `f2Pairing`, which is the cup product
  every statement below uses.

Milestones:

1. **A finite Galois splitting field.** By SSA Layer 6, `A` is split by a finite
   separable `L/K`. Its Galois closure `M/K` is finite Galois and splits `A`, because an
   extension of a splitting field splits `A`. This is stated here rather than assumed,
   because the crossed-product construction starts from it.
2. **The crossed-product package**, which is what the comparison is built from, and
   which is a list of separate targets rather than one step:
   - the 2-cocycle attached to a finite Galois `L/K` that splits `A`, together with the
     crossed-product algebra of a 2-cocycle;
   - Brauer equivalence corresponds to cohomologous cocycles;
   - multiplication of crossed products corresponds to addition of cocycles;
   - inflation along `Gal(M/K) ↠ Gal(L/K)` for `L ⊆ M`, so that the classes for
     different splitting fields are comparable;
   - the finite-quotient description of `H²_cont(G_K, Additive Kˢˣ)` as the colimit over
     finite Galois `L/K`;
   - Hilbert 90 for `L/K` finite Galois, which is what makes the comparison injective.

   (Gille-Szamuely 4.4, Serre *Local Fields* X.)
3. **The comparison isomorphism**

   ```lean
   Additive (BrauerGroup K) ≃+ H²_cont (G_K) (Additive Kˢˣ)
   ```

   assembled from milestone 2. Multiplication of Brauer classes goes to addition of
   cohomology classes, which is what `≃+` records.
4. **The 2-torsion comparison**

   ```lean
   Br₂ K := MonoidHom.ker (powMonoidHom 2 : BrauerGroup K →* BrauerGroup K)
   ι : Additive ↥(Br₂ K) ≃+ H²_cont (G_K) 𝔽₂
   ```

   obtained from milestone 3 and from `h2MuToUnits`, whose image is the 2-torsion. In
   prose this is `ι : Br(K)[2] ≃ H²(G_K, μ₂)`. Both maps are named definitions, and the
   square `h2MuToUnits ∘ ι = (the comparison) ∘ (the inclusion of the 2-torsion)` is a
   theorem. An unnamed equivalence, or the bare existence of an injection, is not this
   milestone.
5. **Base-change naturality.** For `L/K` finite separable, the square that compares
   `ι_K` with `ι_L` along base change of algebras and restriction of cohomology classes
   commutes. Its Lean form needs the base-change homomorphism
   `BrauerGroup K → BrauerGroup L` of the semisimple-algebras roadmap, which that
   roadmap states in prose.
6. **The symbol as a cup product.** `ι [(a,b)] = (a) ∪ (b)`, the cup being the supplied
   `cup` at the canonical `𝔽₂` pairing and the classes being Layer 7A's Kummer classes.
7. **Compatibility of the two structures.** `ι` carries the product `[(a,b)] · [(a,c)]`
   to the sum `(a) ∪ (b) + (a) ∪ (c)`. Layer 5's bilinearity and Layer 8's additivity
   are then the same statement on two sides.
- **The cyclic computation, stated rather than implied.** The proof of milestone 6 is
  the one place where a cocycle meets an algebra, so its steps are separate targets. For
  `L = K(√a)` with `a` a nonsquare, `H²(Gal(L/K), Lˣ) ≃ Kˣ / N_{L/K}(Lˣ)`, which is the
  degree-two computation for a cyclic group of order two. Under it, the inflation of
  `(a) ∪ (b)` corresponds to the class of `b`. Hence `(a) ∪ (b) = 0` if and only if
  `b ∈ N_{L/K}(Lˣ)`. The case where `a` is a square is separate and trivial.

Basic API:

- constructors: `ι`, the crossed-product cocycle, the comparison isomorphism;
- examples: `ι [(a,−a)] = 0`; `ι [(a, 1−a)] = 0`;
- morphisms: the comparison isomorphism itself, and its restriction to 2-torsion;
- functoriality: compatibility with base change along a finite separable `L/K`, that is
  `ι_L ∘ (base change) = res ∘ ι_K` on 2-torsion;
- comparison lemmas: the crossed-product class against the cocycle; `ι` against
  `h2MuToUnits`;
- naturality: `ι` carries multiplication to addition, which is milestone 7;
- edge cases: a split algebra, whose class is `0`; `a` a square, where the cyclic
  computation degenerates;
- downstream interfaces: Layer 7C's fifth equivalent condition and Layer 8's identity
  for `w₂`.

#### 7C. The cup-norm theorem

**This sublayer is the canonical owner of the Kummer-cup/norm-equation criterion.** It is
stated over an arbitrary field in which `2` is invertible, which is the right generality:
no statement here carries a local hypothesis, and none excludes the dyadic case. The local
identification with the classical `{±1}`-valued symbol is 6C's, and is the only statement
below that assumes a local field.

Prerequisites: **[Layer 2]**, **[Layer 6C]** for the local identification only,
**[Layer 7A]**, **[Layer 7B]**, and **[Profinite Cohomology, Layer 12]** `cup` at
`f2Pairing`.

- The square-class dictionary `(·) : Kˣ/(Kˣ)² ≃ H¹(G_K, μ₂)` is Layer 7A's square-class
  isomorphism, with compatibility with `TauCeti.SquareClassGroup` as a stated lemma.
- **The cup-norm theorem**, the canonical statement of this roadmap. For `a b : Kˣ`,

  ```text
  (a) ∪ (b) = 0   if and only if   ∃ x y : K, b = x² − a y²
  ```

  in `H²(G_K, μ₂)`, with the cup product the supplied one at the canonical `μ₂` pairing,
  so that a zero pairing cannot satisfy it. The hypothesis is `Invertible (2 : K)` and
  nothing further; in particular the statement is not restricted by any condition on the
  residue characteristic. Given 7B this is the last step of the cyclic computation
  together with the four-fold criterion (Serre, *Local Fields* XIV §2 Prop. 4-5;
  Gille-Szamuely 4.7).
- **The other four descriptions, each a named theorem.** The vanishing of `(a) ∪ (b)` is
  equivalent to each of:
  - the splitting of `ℍ[K,a,b]`, which is Layer 2's four-fold criterion and is the bridge
    a consumer uses to move between the algebra and the class;
  - the quadratic-algebra norm condition, that is `∃ z : K(√a), N z = b`;
  - the isotropy of `⟨1, −a, −b⟩`;
  - over a nonarchimedean local field, `(a,b)_K = +1` for the `{±1}`-valued
    `hilbertSymbol` of Layer 6C.

  Together with the theorem above these are the five-fold criterion, and each direction
  is available to a consumer as one named theorem rather than as a chain to be assembled.
- Corollaries: `(a) ∪ (1−a) = 0` for `a : Kˣ` with `1 − a ≠ 0`, from Layer 2's algebra
  splitting; `(a) ∪ (−a) = 0`; and bilinearity of the cup product as a restatement of
  Layer 5's bimultiplicativity, which is the supplied `cup_add_left` and `cup_add_right`
  read through the Kummer isomorphism.

### Layer 8: Stiefel-Whitney classes

Prerequisites:

- **[Layer 0]** the descent principle;
- **[Layer 3]** the discriminant and the chain-induction lemmas;
- **[Layer 7A]** the Kummer class, the square-class isomorphism, and `h2MuToUnits`;
- **[Profinite Cohomology, Layer 12]** `cup` at `f2Pairing`;
- **[Layer 7B]** and **[Layer 7C]** for the comparison with the Brauer-valued
  invariants.

This layer defines `w₁` and `w₂` only. The total class and the higher classes need a
graded cohomology ring in every degree, which is an exclusion of this roadmap; see
"Scope".

Milestones:

- **Definition in degrees 1 and 2** (Delzant; Milnor's `w` in *Algebraic K-theory and
  quadratic forms* §4). For a diagonal tuple, `w₁⟨a₁, …, aₙ⟩ = ∑ᵢ (aᵢ)` and
  `w₂⟨a₁, …, aₙ⟩ = ∑_{i<j} (aᵢ)(aⱼ)`.
- **Invariance under isometry, and the descended definitions.** The tuple-level
  definitions above are invariant under `PermutationStep` and `BinaryStep`: permutation
  invariance is immediate, and the binary step is the cup identity `(a)(b) = (c)(d)` for
  `⟨a,b⟩ ≅ ⟨c,d⟩`, which is Layer 7C applied to Layer 0's binary criterion. By Layer 0's
  descent principle they therefore descend to **named functions `w₁` and `w₂` on
  `RegularFormClass K`**, agreeing with the tuple-level definitions on every presentation.
  Those descended functions, composed with Layer 0's class of a regular form, are what
  `w₁(q)` and `w₂(q)` mean for a form `q` throughout this roadmap. In particular two
  regular forms that are `QuadraticMap.Equivalent` have the same `w₁` and `w₂`, which is
  the statement a consumer needs in order to apply Layer 9 to a form given by a
  construction rather than by a tuple. A milestone that stopped at the tuple level would
  force every consumer to supply a diagonalization and to prove independence itself.
- **The two low-degree identities.** `w₁(q) = (d(q))` with the plain discriminant;
  `w₁(q ⊥ r) = w₁(q) + w₁(r)`; and
  `w₂(q ⊥ r) = w₂(q) + w₂(r) + w₁(q) ∪ w₁(r)`, which is the degree-2 part of the
  product formula for a total class, stated degreewise.
- **`w₂` is the image of the Hasse invariant.** `ι(hasseInvariant q) = w₂(q)`,
  immediately from 7B, because both sides are defined on a diagonalization. The Hasse
  invariant is a product and `w₂` is a sum, so the Lean statement is
  `ι (Additive.ofMul (hasseInvariant q)) = w₂ q`. The same `Additive.ofMul` occurs in
  front of each Brauer class below.
- ⚠ **The comparison with the Clifford invariant, exact.** `c(q)` and `s(q)` differ by
  dimension-dependent terms, so a source that says "`w₂` is the Hasse-Witt invariant"
  must be read through the convention table first. Fröhlich and Serre state their
  trace-form results with `w₂` against the Witt invariant, with correction terms of
  `(2) ∪ (d)` type. Write

  ```text
  A_n = C(n−1, 2) mod 2      B_n = C(n+1, 4) mod 2
  ```

  for the binomial coefficients that are the exponents `(n−1)(n−2)/2` and
  `(n+1)n(n−1)(n−2)/24` of Lam V.3.20. The milestone is the identity

  ```text
  ι(c(q)) = w₂(q) + A_n · ((−1) ∪ d(q)) + B_n · ((−1) ∪ (−1))
  ```

  in `H²(G_K, μ₂)`, with `ι` from 7B, with `d(q)` the plain discriminant class, and with
  the whole identity written additively. Keep a `docs`-level note that maps the
  Fröhlich, Serre, and Kahn statements onto it.

Basic API:

- constructors: `sw1` and `sw2` on tuples, and their descents `sw1Class` and `sw2Class` on
  `RegularFormClass K`;
- examples, each naming its forms rather than a bare square class, because `w₁` and `w₂`
  are invariants of forms: `w₁(⟨1⟩ⁿ) = 0` and `w₂(⟨1⟩ⁿ) = 0`; `w₁⟨a⟩ = (a)` and
  `w₂⟨a⟩ = 0`; `w₂⟨a,b⟩ = (a) ∪ (b)`; the values on `⟨⟨a,b⟩⟩`; and the table of `w₁` and
  `w₂` over `ℚ_2` for the eight forms `⟨a⟩` with `a` in `{±1, ±5, ±2, ±10}`, together
  with the sixteen binary forms `⟨1, a⟩` and `⟨a, a⟩`;
- morphisms: `w₁` as an additive map on `(RegularFormClass K, ⊥)`, and `w₂` as the
  quadratic map whose polarization is the cup product, which is the displayed
  orthogonal-sum identity;
- functoriality: `w₁` and `w₂` commute with restriction along a finite separable `L/K`,
  that is `res (wᵢ q) = wᵢ (q ⊗_K L)`;
- comparison lemmas: `w₂` against the image of `hasseInvariant` under `ι`; `w₂` against
  the image of `cliffordInvariant` under `ι`, which is the displayed identity; `w₁`
  against `d` and not against `d±`;
- naturality: the descent of `w₁` and `w₂` along `Quotient.mk`, and their invariance under
  `QuadraticMap.Equivalent`;
- edge cases: rank `0`, where both classes vanish; a hyperbolic form; `a` a square,
  where `(a) = 0`;
- downstream interfaces: Layer 9's relative Stiefel-Whitney formula, which is stated on
  the descended `w₁` and `w₂`.

### Layer 9: transfer and the relative Stiefel-Whitney formula

Prerequisites:

- **[Mathlib]** `LinearMap.compQuadraticMap'`, `Algebra.trace`, `Algebra.traceForm`,
  `traceForm_nondegenerate`, `LinearMap.BilinMap.toQuadraticMap`;
- **[Tau Ceti]** `TauCeti/NumberTheory/EffectiveBounds/TraceForm.lean` and
  `TauCeti/FieldTheory/Trace`;
- **[Layer 1]** to **[Layer 4]** for the form theory and the Witt ring;
- **[Layer 7A]** the carriers for `K` and for `L`, and the Kummer class;
- **[Profinite Cohomology, Layer 9]** `galoisRes`, `galoisCor`, `galoisEvens`,
  `galoisConj` and their laws, which are the transfer along `L/K`;
- **[Profinite Cohomology, Layers 12 and 13]** `cup` at `f2Pairing`, and
  `evensNormIndexTwo` with `evensNorm_res` and `evensNorm_polarization`, which
  `galoisRes_galoisEvens` and `galoisEvens_add` transport;
- **[Layer 8]** the Stiefel-Whitney classes.

Milestones:

- **Which functional.** For `L/K` finite, the nonzero elements of `Hom_K(L,K)` form a
  torsor under `Lˣ`: `Hom_K(L,K)` is one-dimensional as an `L`-vector space under
  `(λ · s)(x) = s(λ x)`, so for nonzero `s` and `s'` there is a unique `λ : Lˣ` with
  `s'(x) = s(λ x)`. Prove this first. Without it, the change-of-functional theorem
  compares only a chosen family of functionals and not every two. For `L/K` finite
  separable, `Algebra.trace K L ≠ 0` follows from `traceForm_nondegenerate`, so
  the trace is a legitimate default.
- **The Scharlau transfer** (Lam VII §1, Scharlau Ch. 2 §5). For `L/K` finite separable,
  a nonzero `K`-functional `s`, and a form `q` over `L`, the transfer is
  `s_*(q) = s ∘ q` on the `K`-space underlying the `L`-space of `q`. Milestones:
  `dim_K s_*(q) = [L:K] · dim_L q`; `s_*(q)` is regular for regular `q`; additivity over
  `⊥`; **Frobenius reciprocity** `s_*(q ⊗ res_{L/K} r) ≅ s_*(q) ⊗ r`; and **change of
  functional** `(λ · s)_* q ≅ s_*(⟨λ⟩ ⊗ q)`, which with the torsor theorem says exactly
  how much the transfer depends on `s`.
- **The transfer respects isometry.** Isometric forms over `L` transfer to isometric forms
  over `K`, so `s_*` is a function of the isometry class and not of the form. Without it
  the transfer of a class is not defined, and the formula below would have to name a
  presentation of each side.
- **On Witt rings.** `s_*` takes a hyperbolic plane over `L` to a hyperbolic form over
  `K`, because a Lagrangian stays a Lagrangian, so it descends to `W(L) → W(K)`. The
  descended map is additive, and by Frobenius reciprocity it is a `W(K)`-module map. It
  is **not** a ring homomorphism, and the file that defines it says so, because that is
  the usual mistaken expectation.
- **The trace form.** `Tr_*⟨1⟩` is the quadratic form of `Algebra.traceForm`, and for
  `L = K(√d)` it is `⟨2, 2d⟩`. Prove it through `TauCeti/FieldTheory/Trace`'s
  diagonalization API rather than by re-deriving the trace computations. The twisted
  forms `Tr_*⟨a⟩` for `a : Lˣ` are the objects that Kahn's theorem evaluates.
- **The Galois setup.** Fix a separable closure `Kˢ` that contains `L`. Then
  `G_L = Gal(Kˢ/L)` is an open subgroup of `G_K` of index `[L:K]`, and restriction,
  corestriction, and the Evens norm are the Layer 7A adapters attached to a `K`-embedding
  `σ : L → Kˢ`, each the supplied subgroup-indexed operation composed with the transport
  of `G_L`-cohomology to `L`-cohomology. Their independence of `σ` is a Layer 7A theorem:
  conjugate embeddings give conjugate subgroups, and the induced maps agree. The formula
  below is therefore about `L/K` and not about a chosen embedding.
- **The relative Stiefel-Whitney formula, on the forms themselves** (Kahn, *Classes de
  Stiefel-Whitney de formes quadratiques et de représentations galoisiennes réelles*,
  Invent. Math. 78 (1984) 223-256, **Théorème 2**, read in degrees `≤ 2`; Kozlowski,
  Proc. AMS 91 (1984) 309-313, Thm 1.1, for the homotopy-level transfer; Evens, Trans.
  AMS 108 (1963) 54-65, for the norm). This is the milestone of the layer. For `L/K`
  quadratic and separable and `a : Lˣ`, with `x = (a) ∈ H¹(G_L, 𝔽₂)`:

  ```text
  w₁(Tr_*⟨a⟩) = w₁(Tr_*⟨1⟩) + cor(x)
  w₂(Tr_*⟨a⟩) = w₂(Tr_*⟨1⟩) + N^{Ev}(x) + w₁(Tr_*⟨1⟩) ∪ cor(x)
  ```

  Nothing in the statement is a chosen diagonalization. The left-hand sides are Layer 8's
  descended `w₁` and `w₂` applied to the isometry classes of the two transferred forms
  themselves, which exist by Layer 8's invariance milestone and by the transfer's respect
  for isometry; the right-hand sides use the canonical corestriction, cup, and index-two
  Evens norm attached to `L/K`. A consumer applies it to a quadratic extension and its
  trace forms and supplies no presentation of either side. The hypotheses
  `[FiniteDimensional K L]`, `[Algebra.IsSeparable K L]`, `finrank K L = 2`, and the
  regularity of the two transferred forms are part of the statement.
- **The calculational corollary, on diagonal tuples.** The same identity with `w₁` and
  `w₂` read on tuples `t` and `b` that present `Tr_*⟨1⟩` and `Tr_*⟨a⟩`, which is the shape
  a computation over a fixed base uses. It follows from the theorem above through the
  agreement of the descended `w₁` and `w₂` with their tuple-level definitions, and it is a
  corollary and not the milestone: a roadmap whose only statement were this one would
  leave every consumer to produce two diagonalizations and to prove that the answer does
  not depend on them.
- ⚠ The total-class form `w(Tr_* q) = N^{Ev}(w(q)) · w(Tr_*⟨1⟩)^{rank q}`, that is
  Théorème 2 for an arbitrary finite separable `L/K` and an arbitrary `q`, is an
  exclusion of this roadmap. It needs a graded cohomology ring, an Evens norm in every
  degree, and the multiplicative extension `N^{Ev}(1 + x) = 1 + cor(x) + … + N^{Ev}(x)`,
  together with a target in which a class with constant term `1` is invertible. See
  "Scope".
- **Finite dyadic specialization**, as the final acceptance example. `K` is a finite
  extension of `ℚ_2`, `L = K(√d)` is quadratic, and `q = ⟨a⟩`. The two identities are then
  computations in the finite group `H²(G_K, 𝔽₂)`, with the square classes of `L` supplied
  by 6A's count, and they are the sharpest available test of the signs and of the
  conjugate in the polarization term.

Basic API:

- constructors: `scharlauTransfer`, `traceTransfer`, the induced map `W(L) → W(K)`;
- examples: `Tr_*⟨1⟩ ≅ ⟨2, 2d⟩` for `K(√d)/K`; the `ℂ/ℝ` computation of the landed
  effective-bounds file, as the archimedean instance;
- morphisms: `s_* : W(L) → W(K)`, additive and `W(K)`-linear;
- functoriality: transitivity `s_* ∘ t_* = (s ∘ t)_*` for a tower `M/L/K`, and
  compatibility with base change;
- comparison lemmas: change of functional `(λ · s)_* q ≅ s_*(⟨λ⟩ ⊗ q)`; the torsor
  theorem; Frobenius reciprocity;
- naturality: independence of the choice of embedding `L ↪ Kˢ`, which is a Layer 7A
  theorem;
- edge cases: `L = K`, where the transfer is scaling; `q = 0`; a functional that is not
  the trace;
- downstream interfaces: the form-level formula is the layer's public statement, and the
  diagonal corollary is what a computation over a fixed base applies.

⚠ Nearby false statements. The transfer is not a ring homomorphism on Witt rings.
Kahn's Théorème 2 needs `L/K` separable, and the transfer of forms has no such formula
for an inseparable extension. The Evens norm is not additive, and the corestriction term
in the expansion above records that failure. The cross term of that expansion is a cup
with the **conjugate** class and not with the class itself; a formula without the
conjugate is a different statement, and neither this roadmap nor the profinite-cohomology
roadmap supplies it.

---

## Worked examples (acceptance criteria)

Discharge these together with their layers. Each one catches a vacuous definition or a
sign error.

- `⟨1,1⟩ ≇ ⟨1,−1⟩` over `ℚ`, because one form is anisotropic and the other is the
  hyperbolic plane. This is the smallest example in which the dimension alone does not
  classify (Layer 1).
- `ℍ_q = ⟨1,−1⟩` represents every `a ∈ ℚˣ`, with the witness
  `((a+1)/2)² − ((a−1)/2)² = a` (Layer 1).
- Chain equivalence in one instance: `⟨1,1⟩ ≅ ⟨2,2⟩` over `ℚ`, because both forms
  represent `2` and both have discriminant `1`, exhibited as a single `BinaryStep`
  (Layer 0).
- `ℍ[ℚ,−1,−1]` is a division algebra; `ℍ[ℚ,1,b] ≃ₐ M₂(ℚ)` for every `b ∈ ℚˣ`; and
  `ℍ[ℚ_2,2,5]` is a division algebra while `ℍ[ℚ_2,5,5]` splits (Layer 2).
- The four-fold criterion over `ℚ_2` at two points: at `(a,b) = (2,5)`, where all four
  conditions fail; and at `(a,b) = (5,5)`, where all four hold with the witness
  `5 = 5² − 5·2²` (Layers 2 and 6).
- `(−1,−1)_{ℚ_2} = −1` and `(−1,−1)_{ℚ_p} = +1` for odd `p`, so Hamilton's quaternions
  are ramified at `2` and at `∞` and nowhere else among these places. Over `ℝ`,
  `(−1,−1)_ℝ = −1` through `Quaternion.normSq` positivity (Layer 6, with the `ℝ` case
  consuming Mathlib's `ℍ[ℝ]`).
- The full `8 × 8` Hilbert-symbol table over `ℚ_2` on `{±1, ±5, ±2, ±10}`, as decidable
  computations. Single entries worth naming: `(2,5) = −1`; `(5,5) = +1` with the witness
  above; `(2,−1) = +1`; `(−1,−1) = −1` (Layer 6).
- Exactly one anisotropic quaternary form over `ℚ_2` up to isometry, realized by
  `⟨1,1,1,1⟩`; and every form of dimension 5 over `ℚ_p` is isotropic (Layer 6).
- The realization exceptions are sharp: no regular form over `ℚ_2` has
  `(n, d, s) = (1, [1], −1)` or `(2, [−1], −1)`, while `(2, [1], −1)` is realized by
  `⟨−1,−1⟩`, whose discriminant is `[1]` and whose Hasse invariant is
  `(−1,−1)_{ℚ_2} = −1` (Layer 6).
- `Tr_*⟨1⟩ ≅ ⟨2, 2d⟩` for `ℚ(√d)/ℚ` and for `ℚ_2(√d)/ℚ_2`, which recovers the `ℂ/ℝ`
  computation of `TauCeti/NumberTheory/EffectiveBounds/TraceForm.lean` as the
  archimedean sibling (Layer 9).
- An instance of the relative formula in low degree: `K = ℚ_2`, `L = ℚ_2(√5)`, the
  unramified quadratic extension, and `q = ⟨a⟩`, with both sides of the degree-≤-2
  identity computed as `a` runs over the eight unit square classes of `L`, that is over
  the image
  of `𝒪[L]ˣ` in `Lˣ/(Lˣ)²`. That image is the kernel of the parity-of-valuation map and
  has order `8`, while `Lˣ/(Lˣ)²` has order `16` by Layer 6A with `[L : ℚ_2] = 2`. A
  uniformizer represents the missing coset and is excluded here deliberately (Layer 9).

### Consumed-interface checks

These are not milestones. They are one-line confirmations that the API this roadmap
consumes says what the later statements assume.

- `ℍ[ℝ]` is a division ring, which is Mathlib's, and is the archimedean instance of the
  split-or-division dichotomy.
- `traceForm_nondegenerate` applies to a finite separable extension, which is
  what makes the trace a legitimate default functional in Layer 9.
- The Layer 7A adapters are defined by real terms built from the supplied `res`,
  `corestriction`, `evensNormIndexTwo`, `cup` and `kummerMapCanonical`, and not by
  `sorry`. So the check that the supplied operations have the types the statements of
  Layers 7 to 9 assume is the elaboration of those definitions, and a drift in a supplier
  signature is a build failure here rather than a silent disagreement.

## Ordering and parallelism

Layers 0 to 4 are free of cohomology and of the Brauer group, and can be built
immediately. Within them, Layer 0 comes first, because everything diagonal rests on it.
Layers 1 and 2 are independent of each other. Layer 3 needs both, and Layer 4 needs
Layers 1 to 3.

Layer 5 is the first layer that rests on another roadmap's code. It needs the
semisimple-algebras roadmap's Layer 4 and Layer 6, because `BrauerGroup K` is a quotient
and not a group without them. It also needs the quaternion central-simplicity theorem,
which is proved here.

Layer 6 has this internal order: 6A, then 6B, then 6C, then 6D, then 6E. Sublayer 6A
consumes the local-fields-ramification roadmap, and 6B to 6D depend on Layers 0 to 3 and on nothing
else outside this roadmap. Sublayer 6E has two milestones with different prerequisites:
the first depends on Layer 5 and on 6D, and the second additionally on Layer 7B and on
Class Field Theory's invariant normalization, so it is built after Layer 7B. Layer 6C's
comparison milestone likewise comes after Layer 7C, because the identification of the
two sides runs through the Kummer cup--norm theorem.

Layer 7A consumes the profinite-cohomology roadmap and depends on Layer 0 for the
square-class language and on 6A for the square-class dictionary. Layer 7B depends on
Layer 5, on Layer 7A, and on the semisimple-algebras roadmap's Layer 6. Layer 7C depends
on Layer 2 and on Layer 7B, and its local identification on Layer 6C. Layer 8 depends on
Layer 7. Layer 9 splits: the transfer half needs only Layers 1 to 4 and can be built
together with Layer 5; the relative-formula half needs Layer 8 and the supplier's transfer
along `L/K`, which Layer 7A consumes.

Every statement of a layer uses only earlier layers, Mathlib, landed Tau Ceti files, and
the three roadmaps of the contract table. The two exceptions to the numbering, both named
above, are 6C's duality milestone and 6E's second milestone; each is stated where its
subject matter belongs and built where its prerequisites are ready.

## References

- T. Y. Lam, *Introduction to Quadratic Forms over Fields*, GSM 67, AMS (2005),
  PRIMARY. Ch. I (diagonalization I.2, hyperbolic I.3, Witt decomposition and
  cancellation I.4, chain equivalence I.5.2, reflections I.7), Ch. II (Witt ring, square
  classes), Ch. III (quaternion algebras and norm forms, III.2.7, III.2.11), Ch. V §3
  (Clifford, Witt, and Hasse invariants, V.3.17-3.21, the Wall caution p. 120), Ch. VI
  (local fields, VI.2), Ch. VII (Scharlau transfer VII.1), Ch. X (Pfister forms).
- J.-P. Serre, *A Course in Arithmetic*, GTM 7, Springer (1973), PRIMARY for the local
  theory. Ch. II §3.3 (squares in `ℚ_p`, `ε` and `ω`), Ch. III (Hilbert symbol:
  III.1.1-1.2, Thm 1 formulas including `p = 2`, Thm 2 nondegeneracy), Ch. IV §2 (the
  invariants `d` and `ε`; Thm 5 well-definedness, Thm 6 isotropy, Prop 6 realization,
  Thm 7 classification and the unique anisotropic quaternary corollary).
- O. T. O'Meara, *Introduction to Quadratic Forms*, Springer (1963; Classics reprint
  2000), §63: §63A (the quadratic defect and the local square theorem), 63:11-13 (symbol
  computation, bimultiplicativity, nondegeneracy), 63:16 (unramified norms), 63:17-18
  (the anisotropic quaternary space), 63:19 (`u = 4`), 63:20 (classification), 63:21
  (representation), 63:23 (existence). ⚠ O'Meara's Hasse symbol is `∏_{i≤j}`, translated
  by the convention table.
- O. T. O'Meara, *Quadratic forms over local fields* (1955), the paper antecedent of
  §63.
- B. Kahn, *Classes de Stiefel-Whitney de formes quadratiques et de représentations
  galoisiennes réelles*, Invent. Math. 78 (1984) 223-256, Théorèmes 1-3; the source of
  Layer 9's relative formula.
- A. Kozlowski, *The Evens-Kahn formula for the total Stiefel-Whitney class*, Proc. AMS
  91 (1984) 309-313, Thm 1.1.
- L. Evens, *A generalization of the transfer map in the cohomology of groups*, Trans.
  AMS 108 (1963) 54-65, the norm map.
- P. Guillot, *The computation of Stiefel-Whitney classes*, Ann. Inst. Fourier 60 (2010)
  565-606, a computational companion for Stiefel-Whitney classes of representations.
- J. Milnor, *Algebraic K-theory and quadratic forms*, Invent. Math. 9 (1970) 318-344,
  §4: `w` on square classes and the `I^n`-filtration picture.
- P. Gille, T. Szamuely, *Central Simple Algebras and Galois Cohomology*, CUP (2nd ed.
  2017): 1.1.9 (the four-fold criterion), 1.5 (symbol bilinearity), Ch. 2 and 4.4
  (crossed products, cyclic algebras, and `Br(K) ≅ H²`), Ch. 4 (cup products and the
  symbol). The reference of record for Layers 5 and 7.
- W. Scharlau, *Quadratic and Hermitian Forms*, Springer (1985), Ch. 2 §5 (transfer),
  Ch. 5 (local fields).
- R. Elman, N. Karpenko, A. Merkurjev, *The Algebraic and Geometric Theory of Quadratic
  Forms*, AMS Colloq. 56 (2008): II §7 is the source of Mathlib's `Nondegenerate`, and
  the modern reference for Layers 0 to 4.
- J.-P. Serre, *Local Fields*, GTM 67, Springer (1979): Ch. X (crossed products and
  `H²`), XIV §2 (the symbol as a cup product and the norm criterion).
- L. C. Grove, *Classical Groups and Geometric Algebra*, GSM 39, AMS (2002), cited only
  for the characteristic-2 exclusion note.

## Ownership and coordination

- The [semisimple-algebras
  roadmap](../RepresentationTheory/SemisimpleAlgebras/README.md) owns central simple
  algebras, Skolem-Noether, the Brauer group, and splitting fields. Layer 5 here takes
  the quaternion case, the Clifford case, and the 2-torsion package. Layer 7B takes the
  crossed-product comparison. Where both roadmaps name the same fact, the
  semisimple-algebras statement is the statement of record.
- The [multiquadratic roadmap](../Multiquadratic/README.md) owns multi-root towers of
  quadratic extensions. This roadmap owns the form theory of one quadratic step. The
  shared language is `TauCeti.SquareClassGroup`.
- The [local-fields-ramification
  roadmap](../LocalFieldsRamification/README.md) owns the general arithmetic of a
  nonarchimedean local field. Sublayer 6A consumes it through the exact contract above:
  the normalized valuation, the unit filtration and its graded pieces, the Teichmüller
  section, the ramification and residue degrees, the power-class counts, the unramified
  extensions and their norm groups are all that roadmap's. This roadmap defines no
  second valuation and no second filtration.
  What 6A adds is the uniformizer predicate, the choice of square-class representatives in
  odd residue characteristic, and the passage from that roadmap's norm-equation criterion
  to the binary form `b = x² − Δ y²` that 6B and 6C apply. The local square theorem in its
  sharp form and the square-class counts are consumed by name and are not restated.
- The [profinite-cohomology roadmap](../ProfiniteCohomology/README.md) owns continuous
  cohomology and its operations. Sublayer 7A consumes it through the exact contract
  above: the carrier, the cup product, restriction, inflation, corestriction, Kummer
  theory, the multiplicative coefficients, the index-two Evens norm with its four
  identities, and the transfer along a finite separable `L/K` are all that roadmap's.
  This roadmap defines no second cup product, no second Kummer isomorphism, no second
  Evens norm, and no second restriction or corestriction. What 7A adds is the coefficient
  identification specific to `μ₂` and the mod-2 laws read through it.
- **This roadmap owns the quadratic-form side of that boundary**: the quadratic defect,
  the Hilbert symbol and both of its identifications, the local classification, the
  Brauer comparison, the Stiefel-Whitney classes, and the Scharlau transfer with the
  relative formula. In particular the Hilbert symbol is owned here in both halves, the
  norm-criterion description of the mod-2 pairing and its identification with the
  classical `{±1}`-valued symbol over a local field; Class Field Theory supplies the
  cohomological pairing and its arithmetic normalization and states no comparison with
  the norm-equation symbol.
- **Local class field theory is consumed, not rebuilt.** The invariant map is the
  class-field-theory roadmap's. Sublayer 6E's second milestone consumes it to
  identify the two-element group of quaternion classes with `Br(K)[2]` and the Hasse
  invariant with the invariant map. Nothing here reproves reciprocity, the Artin map, or
  the existence theorem, and no statement here is an alternative construction of the
  invariant map. The exact imported reciprocity theorem is
  `ClassFieldTheory.hilbertProductFormula`; the exact QFI consequences are
  `hilbertSymbol_eq_cohomological` and `hilbertSymbol_productFormula`. No Class Field
  Theory declaration imports or depends on QFI.
- **Global form theory is downstream.** `GlobalQuadraticForms` owns Hasse--Minkowski,
  local-global isotropy and isometry, and global classification and realization. This
  roadmap exports local invariants and the two Hilbert-symbol bridge declarations to it,
  but supplies none of those global theorems.
- Other formalizations cover overlapping ground, including a Hasse--Minkowski
  development over `ℚ` and a staging repository for the Brauer group. They are evidence
  and provenance only, not ownership claims. Their revisions, licences, and adaptation
  conditions are recorded in [PROVENANCE.md](PROVENANCE.md), which is not normative.
- Single-purpose formalizations of several of these targets over dyadic bases exist
  outside this repository. They are evidence that the statements are formalizable, and
  not prescriptions of form. The map is in [PROVENANCE.md](PROVENANCE.md), which is not
  normative.
