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

This roadmap builds that theory over a field with `2` invertible. Tau Ceti has since built
the form theory below the Brauer group, Layers 0 to 4, which this roadmap consumes. The high
points are:

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
  invariants at the form level, the Scharlau transfer, and the `Pin⁺` model of the plane
  `⟨1, 1⟩` in `2 × 2` matrices. Mathlib keeps `QuadraticForm` under `LinearAlgebra/`, so
  the form theory stays there.
- `TauCeti/Algebra/Quaternion/` for the quaternion symbol layer and its Brauer-class
  package. Mathlib keeps its quaternion and Brauer material under `Algebra/`.
- `TauCeti/NumberTheory/LocalField/QuadraticForm/` for the quadratic defect, the Hilbert
  symbol, and the local classification. The general local-field arithmetic these consume
  lands where the local-fields-ramification roadmap puts it, and is not duplicated here.
- `TauCeti/FieldTheory/QuadraticForm/` for the cohomological layers, that is the Brauer
  comparison, Stiefel-Whitney classes, the value of the Evens norm, and the relative
  formula. These sit next to the landed `TauCeti/FieldTheory/SquareClassGroup.lean` that
  they consume.

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

Pfister forms in every degree, and the elementary generation statements for `I`, `I²`,
and `I³` that Layer 5 consumes, are Tau Ceti's. Nothing past that is claimed.

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
  `QuadraticMap.Anisotropic`, that is `∀ v, Q v = 0 → v = 0`. The word "isotropic" always
  means `¬ Q.Anisotropic`, that is the existence of a **nonzero** `v` with `Q v = 0`, and is
  never a new predicate. ⚠ Isotropy is not "represents `0`": every form represents `0`
  through the zero vector, an anisotropic form included.
- **Equivalence and diagonal forms.** Isometry classes use `QuadraticMap.Equivalent`,
  that is `Nonempty (Q₁.IsometryEquiv Q₂)`, which already compares forms on different
  spaces. The diagonal form `⟨a₁, …, aₙ⟩` is `QuadraticMap.weightedSumSquares K w` with
  `w : Fin n → K`. For a regular form the weights are units, that is `w : Fin n → Kˣ`
  coerced into `K`. The orthogonal sum of forms on different spaces is
  `QuadraticMap.prod`, and scaling is `a • Q`.
- **Square classes.** The square-class group is Tau Ceti's `TauCeti.SquareClassGroup K`,
  which is `Additive Kˣ ⧸ (Subgroup.square Kˣ).toAddSubgroup`, an `𝔽₂ = ZMod 2`-vector space,
  with the class `squareClass u` of a unit. Its multiplicative avatar is the literal quotient
  `Kˣ ⧸ Subgroup.square Kˣ`, Tau Ceti's `TauCeti.MultiplicativeSquareClassGroup K`, and Tau
  Ceti's `TauCeti.multiplicativeSquareClassEquiv` identifies the two, sending the class of a
  unit to its `squareClass` (`multiplicativeSquareClassEquiv_mk`). Consume those files and do
  not redefine either group. In a quotient-free statement, "same square class" is
  `IsSquare (a * b)` for units `a b : Kˣ`, as in `TauCeti.squareClass_eq_zero_iff` and
  `TauCeti.squareClass_eq_iff_isSquare_mul`. This matches the multiquadratic roadmap's
  `Finset`-product idiom.
- **Representation and value sets.** Tau Ceti's `QuadraticMap.Represents Q a : Prop` is
  `∃ v, Q v = a` for `a : K`, and `QuadraticMap.unitValueSet Q : Set Kˣ` is
  `{a : Kˣ | Represents Q (a : K)}`, the classical `D(q)` of nonzero represented values.
  The two are kept apart. `Represents Q 0` is
  **always true**, for every `Q` and every space, the zero space included, because
  `Q 0 = 0`; it is a theorem with no hypotheses and never a nontrivial fact about `Q`.
  Nontrivial isotropic representation of `0`, that is `¬ Q.Anisotropic`, additionally
  demands a nonzero vector, and the two are never conflated. Every classification
  statement below means `D(q)`, and a value set that contains `0` makes several of them
  false.
- **Discriminant and signed discriminant.** For `q ≅ ⟨a₁, …, aₙ⟩` the *discriminant* is
  `d(q) = a₁ ⋯ aₙ` modulo squares, and the **signed discriminant** is
  `d±(q) = (−1)^{n(n−1)/2} · d(q)`. Both are Tau Ceti's, on the carrier below:
  `TauCeti.RegularFormClass.discr` and `TauCeti.RegularFormClass.signedDiscr`, valued in the
  additive `SquareClassGroup K`, where the sign is written `n.choose 2 • squareClass (−1)`.
  This roadmap's `discr` and `signedDiscr` are the same two invariants read in
  `Kˣ ⧸ (Kˣ)²` through `multiplicativeSquareClassEquiv`, under the names that
  `GlobalQuadraticForms` consumes; neither name is overloaded, and neither is a second
  construction. Serre's classification invariant and the Stiefel-Whitney class `w₁` use the
  plain `d`. The Witt-ring isomorphism `I/I² ≅ Kˣ/(Kˣ)²` and the quadratic-extension
  dictionary use `d±`. The translation `d± = (−1)^{n(n−1)/2} d` is Tau Ceti's
  `signedDiscr_eq_sign_add_discr`, read multiplicatively as `signedDiscr_eq_sign_mul_discr`,
  and every later proof converts through it.
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
  tensor product, which is Tau Ceti's `TauCeti.pfisterFormClass`, the product of the classes
  `1 + ⟨−aᵢ⟩` in the semiring of isometry classes. Its diagonal tuple `TauCeti.pfisterForm`
  carries `∏_{i ∈ S} (−aᵢ)` in slot `k`, where `S` is the set of positions at which the
  binary expansion of `k` has a `1` (`pfisterForm_apply` in `Suggested.lean`, with
  `TauCeti.pfisterForm_one` and `TauCeti.pfisterForm_two`).
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
- **The `Pin⁺` model and the explicit cochains** for Layer 9. The Clifford algebra of
  `(F², ⟨1, 1⟩)` is `M₂(F)` with `e₁ = diag(1, −1)`, `e₂ = [[0, 1], [1, 0]]` and
  `e₁² = e₂² = +1`, so that the lift of `C₂ ≀ C₂` is `D₁₆` and not `Q₁₆`; an orthogonal
  `x` acts on vectors by `v ↦ det(x) · x v xᵀ`; and `G_K` acts on the coordinates of the
  descended plane `W` by `ρ(g)ᵀ`, where `ρ` is the signed-permutation representation. An
  explicit `𝔽₂`-valued 2-cocycle `f` of `G_K` satisfies
  `f(gh, j) + f(g, h) = f(h, j) + f(g, hj)`, a coboundary is
  `(g, h) ↦ ψ(h) − ψ(gh) + ψ(g)`, and the cup of two continuous homomorphisms is
  `(g, h) ↦ χ(g) ψ(h)`, as in the profinite-cohomology roadmap.
- **Additive against multiplicative.** Cohomology is additive and the Brauer group is a
  `CommGroup`. The coefficient modules are therefore `Additive Kˢˣ` and `μ₂ ≅ ZMod 2`,
  and every Lean statement that compares the two worlds transports through `Additive`.
  Layer 7A's comparison is an `≃+` out of `Additive (BrauerGroup K)`. Layer 8's `w₂`,
  Clifford, and Hasse identities are equations in `H²`, written additively. The prose
  keeps the multiplicative notation for Brauer classes and the product notation for the
  Hasse invariant. The transport appears in each declaration.

### The carrier for isometry classes

Layers 3 to 9 speak of functions on isometry classes, and Layer 4 needs a ring whose
elements are such classes. The carrier is Tau Ceti's, in
`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/`, and this roadmap consumes it. It
works with diagonal presentations:

```lean
TauCeti.RegularFormPresentation K := Σ n : ℕ, Fin n → Kˣ
```

Read `(n, w)` as `TauCeti.presentedForm ⟨n, w⟩`, which is
`weightedSumSquares K (fun i => (w i : K))`. Two presentations are related
(`TauCeti.regularFormSetoid`) when the forms they present are `QuadraticMap.Equivalent`.
That relation compares forms on different spaces, so presentations of different lengths
may be compared, and only equal lengths are ever related
(`TauCeti.fst_eq_of_presentedForm_equivalent`). The carrier is

```lean
TauCeti.RegularFormClass K := Quotient (TauCeti.regularFormSetoid K)
```

Tau Ceti supplies what the rest of the roadmap needs of it:

- every regular form on a finite-dimensional space has a class, `TauCeti.formClass Q hQ`,
  computed by any diagonalization (`TauCeti.exists_presentedForm_equivalent`,
  `TauCeti.formClass_mk`);
- two regular forms are `Equivalent` if and only if their classes are equal
  (`TauCeti.formClass_eq_iff`);
- orthogonal sum and tensor product descend to the carrier, which is a commutative
  semiring (`TauCeti.RegularFormClass.mk_add_mk`, `TauCeti.RegularFormClass.mk_mul_mk`,
  `TauCeti.instCommSemiringRegularFormClass`), with the rank as a semiring map to `ℕ`
  (`TauCeti.RegularFormClass.rankHom`), and the class of a sum or a tensor product of forms
  is the sum or the product of the classes (`TauCeti.formClass_prod`,
  `TauCeti.formClass_tmul`);
- the discriminant and the signed discriminant (`TauCeti.RegularFormClass.discr`,
  `TauCeti.RegularFormClass.signedDiscr`), and scalar extension along a field extension,
  with which the rank and the discriminant commute (`TauCeti.RegularFormClass.baseChange`,
  `rank_baseChange`, `discr_baseChange`);
- the descent principle `TauCeti.RegularFormClass.liftDiagonal` of Layer 0, which turns a
  function of presentations into a function of classes.

On the carrier, this roadmap's layers define `hasseInvariant` (Layer 5), `localHasse`
(Layer 6C), and `w₁` and `w₂` (Layer 8), each through the descent principle, and Tau Ceti
builds the Witt rings of Layer 4 from the semiring. `GlobalQuadraticForms` consumes the
carrier and the class of a form under this roadmap's names `RegularFormClass` and
`formClass`, which `Suggested.lean` exports as aliases of Tau Ceti's declarations.

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

- **`TauCeti/FieldTheory/SquareClassGroup/{Basic,Multiplicative}.lean`**:
  `TauCeti.SquareClassGroup K`, an `𝔽₂`-vector space, with `squareClass`,
  `squareClass_eq_zero_iff`, `squareClass_prod`, `squareClass_eq_iff_isSquare_mul`, and
  `linearIndependent_squareClass_iff`, that is linear independence as the statement that no
  nonempty subset product is a square; and the multiplicative avatar
  `MultiplicativeSquareClassGroup K = Kˣ ⧸ Subgroup.square Kˣ` with the dictionary
  `multiplicativeSquareClassEquiv`, pushforward along a field map
  (`RingHom.squareClassMap`, `RingHom.multiplicativeSquareClassMap`), and the finiteness and
  `Nat.card` transfer. This is Layer 0's square-class calculus.
- **`TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/`** (`Basic`, `TensorProduct`,
  `Semiring`, `Discriminant`, `BaseChange`, `Descent`): the carrier `RegularFormClass` with
  its presentations, `formClass`, the semiring, the discriminant and the signed
  discriminant, scalar extension, and the descent principle `RegularFormClass.liftDiagonal`.
  This is Layer 0's carrier and descent principle and Layer 3's discriminants; see "The
  carrier for isometry classes".
- **`TauCeti/LinearAlgebra/QuadraticForm/Diagonal/`** (`Basic`, `WittChain`, `Chain/Basic`,
  `Chain/Induction`): diagonal forms, the chain relations `PermutationStep`, `BinaryStep`,
  `DiagonalStep` and `DiagonalChain`, Witt's chain theorem in rank at least two with the
  rank-zero and rank-one statements, and the pairwise-product lemmas
  `PermutationStep.prod_prod_Ioi_eq` and `BinaryStep.prod_prod_Ioi_eq` through which the Hasse
  invariants and `w₂` meet the descent principle.
- **`TauCeti/LinearAlgebra/QuadraticForm/{Representation,Binary}.lean`** and
  **`TauCeti/Algebra/Quaternion/Binary.lean`**: `QuadraticMap.Represents`,
  `QuadraticMap.unitValueSet`, the representation criterion, the binary normal forms, and the
  binary quaternion lemma.
- **`TauCeti/LinearAlgebra/QuadraticForm/Hyperbolic.lean`**, **`Witt/{Decomposition,
  Cancellation,Extension}.lean`**, **`OrthogonalGroup.lean`** and
  **`CartanDieudonne/Basic.lean`**: the hyperbolic plane `TauCeti.hyperbolicPlane K`, which is
  `⟨1, −1⟩`, and the splitting of a hyperbolic plane off an isotropic regular form
  (`TauCeti.exists_hyperbolicPlane_prod_equivalent`); Witt decomposition with the Witt index
  and the anisotropic part; Witt cancellation; Witt's extension theorem; and reflections with
  the Cartan-Dieudonné theorem. This is Layer 1, and Layer 9's trace-zero case uses the
  hyperbolic plane and its splitting.
- **`TauCeti/Algebra/Quaternion/`** (`NormForm`, `Split`, `SquareSplit`, `Steinberg`,
  `SymbolEquiv`, `AlgEquiv`, `SplittingCriterion`, `BaseChange`): the norm form of
  `ℍ[K,a,b]` and its diagonalization `⟨1, −a, −b, ab⟩`, the symbol relations as explicit
  algebra equivalences, the naturality of quaternion equivalences, the split-or-division
  dichotomy and the four-fold splitting criterion. This is Layer 2.
- **`TauCeti/LinearAlgebra/QuadraticForm/Witt/`** (`Ring`, `FundamentalIdeal`,
  `Discriminant`, `Pfister`, `Round`): the Witt-Grothendieck ring, the Witt ring, the Witt
  class, the dimension map, the fundamental ideal, the signed discriminant on it with
  `I/I² ≅ Kˣ/(Kˣ)²`, the Pfister forms with the additive generation of `Iⁿ` for `n ≥ 1`, and
  the roundness of 1-fold and 2-fold Pfister forms. This is Layer 4.
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
- **`TauCeti/RingTheory/Norm/Quadratic.lean`**: the trace and norm of `b + aθ` in a
  quadratic algebra, `Algebra.IsQuadraticExtension.trace_algebraMap_add_algebraMap_mul` and
  `Algebra.IsQuadraticExtension.norm_algebraMap_add_algebraMap_mul`. Layer 9's square-root
  coordinates are their specialization at `Tr x = 0`.
- **`TauCeti/GroupTheory/SpecificGroups/Dihedral/Basic.lean`**: `TauCeti.dihedralHom`, the
  homomorphism out of `DihedralGroup n` attached to two involutions whose product has order
  `n`, with `dihedralHom_r` and `dihedralHom_sr`. Layer 9's `D̃₁₆ ⊂ M₂(F)` is its image at
  the involutions `t` and `t e₁ t`.
- **Tau Ceti's Galois cohomology**, through the profinite-cohomology roadmap, which
  re-exports it under its own names (the contract table below): the absolute Galois group
  `TauCeti.AbsoluteGaloisGroup`, the open subgroup `TauCeti.galoisSubgroup` of a finite
  extension, whose membership lemma `TauCeti.mem_galoisSubgroup_iff` Layer 9 applies
  directly (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean`); the
  coefficient modules, the Kummer map, its cocycle `TauCeti.kummerCocycle` and
  `TauCeti.kummerMap_eq_kummerCocycleClass`, which is Layer 9's cochain-level Kummer class
  (`TauCeti/FieldTheory/GaloisCohomology/`); and the explicit low-degree complex, whose
  `TauCeti.ContCohomology.mem_Z2_iff` builds Layer 7B's cocycles and whose
  `TauCeti.ContCohomology.explicitCup11_mk` is the `(1, 1)` cup of two cocycles
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/`).

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
  corestriction, Kummer theory, the index-two Evens norm with the identities, the
  index-two exact sequence and the `D₁₆` pullback formula of the contract table below, the
  explicit low-degree complex, and the finite-quotient system with its universal cocone.
  Layer 7A consumes those declarations and adds only the coefficient identification
  specific to `μ₂` and the passage from a field extension to the open
  subgroup by which the supplier's operations are indexed; Layer 7B adds only the
  identification of the supplier's coefficient module `UnitsCoeff K` with the units of
  `Kˢ` and the packaging of a finite Galois subextension as an open normal subgroup with
  its finite quotient. Neither builds a continuous-cohomology carrier, an inflation map,
  or a finite-quotient colimit of its own.
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
  valuation, the unit filtration and the level are the local-fields-ramification
  roadmap's `normalizedValuation`, `unitFiltration` and `natCastValuation`, the last of
  which is read at the argument `2`, so that `e = v_K(2)` throughout. It is that
  declaration and not `absoluteRamificationIndex`, for the reason 6A gives. What Layer 6A adds is the one object that roadmap does not
  name, `IsUniformizer`, which is Tau Ceti's `TauCeti.IsUniformizer`, with its characterizing theorems. A uniformizer is a choice
  satisfying `IsUniformizer`, and never a component of a package: an element of valuation
  one is not unique, so a package that stores one is not unique either.
- **Mod-2 Galois cohomology.** The carrier is the profinite-cohomology roadmap's
  `trivialF2` object over its `AbsoluteGaloisGroup`, which are Tau Ceti's `TauCeti.trivialF2`
  and `TauCeti.AbsoluteGaloisGroup` under that roadmap's names, so that roadmap's `cup`, `res`,
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
`[Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]`. That
roadmap re-exports Tau Ceti's local-field API under its own names, with the same explicit
arguments: `normalizedValuation`, `unitFiltration`, `natCastValuation`,
`UnitFiltrationGraded`, `ramificationIndex`, `inertiaDegree`, `absoluteRamificationIndex` and
`teichmuller` are abbreviations of Tau Ceti's declarations
(`TauCeti/NumberTheory/LocalField/NormalizedValuation.lean`, `UnitFiltration/Basic.lean`,
`NatCastValuation.lean`, `RamificationIndex.lean`, `InertiaDegree.lean`,
`AbsoluteRamificationIndex.lean`, and `TauCeti/RingTheory/Henselian/Teichmuller.lean` for
`TauCeti.teichmuller 𝒪[K]`), and the lemmas about them in the rows below are proved by Tau
Ceti's. This roadmap consumes the supplier's names.

| Consumer milestone | Supplier layer | Exact declaration | Mathematical type |
|---|---|---|---|
| Layer 6A, the valuation; every statement of 6B and 6C | 0 | `normalizedValuation`, `normalizedValuation_surjective`, `normalizedValuation_eq_one_iff`, `normalizedValuation_irreducible` | `Kˣ →* Multiplicative ℤ`, surjective, with the unit equation and the uniformizer equation |
| Layer 6A, the unit filtration; 6B's defect bounds | 1 | `unitFiltration`, `mem_unitFiltration_zero`, `mem_unitFiltration_succ_congr`, `mem_unitFiltration_succ_valuation`, `unitFiltration_antitone`, `iInf_unitFiltration` | `ℕ → Subgroup Kˣ`, decreasing with trivial intersection, in both membership forms |
| Layer 6A, residue and ramification data of a finite extension | 0 | `ramificationIndex`, `inertiaDegree`, `normalizedValuation_algebraMap`, `card_residueField`, `ramificationIndex_mul_inertiaDegree` | `e`, `f`, `v_L ∘ algebraMap = e · v_K`, `#𝓀[L] = #𝓀[K]^f`, and `e · f = [L:K]` |
| Layer 6A, the level `e = v_K(2)`; the thresholds of 6B and the counts of 6D | 0 | `natCastValuation`, `normalizedValuation_natCast`, `natCastValuation_eq_zero_iff`; `absoluteRamificationIndex` with `absoluteRamificationIndex_eq_natCastValuation` for the comparison only | `e = v_K(2)` as `natCastValuation K 2`, named `dyadicLevel` here, with `v_K^×(2) = Multiplicative.ofAdd e` and `e = 0` exactly when `2` is a unit of `𝒪[K]`. ⚠ Not `absoluteRamificationIndex K 2`: that name is reserved for a finite extension of `ℚ_p` and reading it at `p = 2` forces `[Algebra ℚ_[2] K]`, which makes the odd-residue-characteristic branch unsatisfiable rather than false. ⚠ The relative `ramificationIndex K L` of the row above is a third, different invariant |
| Layer 6A, the square-class dictionary; every count of 6D and the Kummer isomorphism of 7A | 1 | `square_eq_range_powMonoidHom` | `Subgroup.square Kˣ = (powMonoidHom 2).range`, the identification of Mathlib's subgroup of squares with the range the supplier's count and the Kummer isomorphism are stated at |
| Layer 6A, the residue field and its unit group | 1 | `teichmuller`, `teichmuller_section` | `𝓀[K]ˣ →* 𝒪[K]ˣ`, a multiplicative section of reduction |
| Layer 6A, the filtration quotients; 6B's approximation steps | 1, with the carrier from 3 | `UnitFiltrationGraded`; milestone *Graded pieces* (no target signature for the two isomorphisms) | the quotient `U(K,i)/U(K,i+1)` as a type, and `U(K,0)/U(K,1) ≃* 𝓀[K]ˣ`, `U(K,i)/U(K,i+1) ≃* 𝓀[K]⁺` for `i ≥ 1`. The two isomorphisms are frozen here as `nonempty_unitFiltrationGraded_zero_equiv` and `nonempty_unitFiltrationGraded_succ_equiv`, on the supplier's carrier |
| Layer 6A, the square-class counts; 6D's counting arguments | 1 | `card_powerClasses_of_isUnit`, `card_powerClasses_mixed`, `card_squareClasses_of_isUnit`, `card_squareClasses_dyadic`; at `dyadicLevel`, `card_squareClass_of_odd` is Tau Ceti's `TauCeti.card_squareClass_of_odd` and `card_squareClass_of_dyadic` is frozen here | `#(Kˣ/(Kˣ)ⁿ) = n · #μ_n(K) · q^{v_K(n)}` in the two regimes, with the `n = 2` values `4` when `2` is a unit of `𝒪[K]` and `4 · q^e` for `K/ℚ_2` finite, at `e = dyadicLevel K` |
| Layer 6A, the local square theorem; 6B's list of unit defects | 1 | `unitFiltration_le_range_powMonoidHom_two`, `not_unitFiltration_le_range_powMonoidHom_two`; at `dyadicLevel`, Tau Ceti's `TauCeti.unitFiltration_le_square` and `TauCeti.not_unitFiltration_le_square`, consumed here under the same names | `U(K, 2e+1) ⊆ (Kˣ)²` for `K/ℚ_2` finite, and its sharpness `U(K, 2e) ⊄ (Kˣ)²`, which 6B's defect list needs in order to know the bound is attained. The supplier's two carry `[Algebra ℚ_[2] K]`, which the odd-residue-characteristic branch cannot satisfy; Tau Ceti's need only `2 ≠ 0` |
| Layer 6A, the unramified class; 6B's evaluation formula | 2 | `normGroup`, `map_norm_unitFiltration_zero`, `mem_normGroup_iff_dvd_normalizedValuation`; milestone *Existence and uniqueness* (no target signature) | the unramified norm group in norm-equation form, `x ∈ normGroup L/K ↔ f ∣ v_K(x)`, with `N_{L/K}(𝒪[L]ˣ) = 𝒪[K]ˣ`; and the unramified extension of each degree. At degree `2` the existence and the uniqueness halves are frozen here, extension-free, as `exists_unramified_class` and `unramified_class_unique` |
| Layer 6, the `ℚ_p` acceptance suite | 0 | the non-vacuity milestone (worked example) | `IsNonarchimedeanLocalField ℚ_[p]` |

**From the [class-field-theory roadmap](../ClassFieldTheory/README.md)**, namespace
`TauCetiRoadmap.ClassFieldTheory`. These declarations are imported; QFI supplies comparison
theorems only.

| Consumer milestone | Supplier layer | Exact declaration | Mathematical type |
|---|---|---|---|
| Layers 6E and 7C, the local invariant normalization | 2--3 | `H`, `muNRep`, `h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu` | continuous `H²(F, mu_n)` and its arithmetic invariant in `ZMod n`, including mixed characteristic |
| Layer 7C, the cohomological Hilbert pairing | 3 | `kummerClass`, `kummerClass_eq_kummerCocycleClass`, `kummerCupPairing`, `kummerCupPairing_bil`, `localSymbol` | the Kummer class, which is Tau Ceti's `kummerMap` carried to `Field.absoluteGaloisGroup F`; the pairing `(x, y) ↦ log_ζ(x) · y` on `μ_n` for a primitive `n`-th root `ζ ∈ F`; and their cup followed by the local invariant. No quadratic-form definition occurs in CFT |
| Layer 7C, nondegeneracy comparison | 3 | `tateDualityPairing`, `tateDualityPairing_perfect_mixed` | local Tate duality between a discrete `A` and `tateDual A`, which is Tau Ceti's internal Hom into `μ_n`, and its perfectness for finite `A` on which the action is smooth (`TauCeti.IsSmoothDiscrete`, found by instance search at `muNRep`), with the invariant normalization supplied by CFT |
| `hilbertSymbol_productFormula`, exported to Global Quadratic Forms | 5 | `finiteHilbertInvariantAt`, `infiniteHilbertInvariantAt`, `finiteHilbertSupport`, `hilbertProductFormula` | finite support and the additive Hilbert reciprocity equation over all finite and infinite places |

The two frozen QFI bridge names are `hilbertSymbol_eq_cohomological` and
`hilbertSymbol_productFormula`. The first identifies QFI's norm-equation/quaternion symbol with
`ClassFieldTheory.localSymbol`; the second is the multiplicative-sign translation of
`ClassFieldTheory.hilbertProductFormula`. This is the only ownership direction: no CFT file
imports QFI.

`hilbertSymbol_eq_cohomological` is derived rather than asserted. Its one input is
`localSymbol_eq_zero_iff_cup`, which says that `ClassFieldTheory.localSymbol` vanishes exactly
when Layer 7A's `cup11` of the two Kummer classes does. Both sides are the profinite-cohomology
roadmap's `cup`: at Class Field Theory's `kummerCupPairing ζ` on `ClassFieldTheory.muNRep 2 F`,
over the coefficient ring `ZMod 2` and `Field.absoluteGaloisGroup F`, and at `f2Pairing` on
`trivialF2`, over `ℤ` and `ProfiniteCohomology.AbsoluteGaloisGroup F`, which is Tau Ceti's
`TauCeti.AbsoluteGaloisGroup F`. Both coefficient modules are Tau Ceti's `KummerCoeff F 2`:
`ClassFieldTheory.muNRepCoeffDictionary` is its identity, with `muNRepCoeffDictionary_continuous`
and `muNRepCoeffDictionary_equivariant`, and Layer 7A's `kummerCoeffIsoTrivialF2` starts from it.
Both Kummer classes are Tau Ceti's `kummerMap` transported, Class Field Theory's by
`kummerClass_eq_kummerCocycleClass` and Layer 7A's through `kummerMapCanonical`. So the content
of the bridge is the naturality of `cup` along the group comparison
`ClassFieldTheory.absoluteGaloisGroupComparison`, along the coefficient isomorphism
`kummerCoeffIsoTrivialF2`, under which `log_ζ(x) · y` is the product of `𝔽₂`, and along the
passage from the coefficient ring `ZMod 2` to `ℤ`, which changes neither the homogeneous cochains
nor their differentials. Given it, Layer 7C's
`cup_kummerClass_eq_zero_iff_hilbertSymbol` and the fact that both symbols take two values force
the equality of signs. ⚠ This bridge does **not** factor through Layer 7B's comparison: the
crossed-product comparison has `Kˢˣ` coefficients and says nothing about the `μ₂`-valued cup that
`localSymbol` is built from.

**From the [profinite-cohomology roadmap](../ProfiniteCohomology/README.md)**, namespace
`TauCetiRoadmap.ProfiniteCohomology`. That roadmap re-exports Tau Ceti's implementation under
its own names, with the same explicit arguments. In the rows below, `AbsoluteGaloisGroup`,
`trivialF2`, `res`, `infl`, `coeffMap`, the Kummer block (`KummerCoeff`, `powerClassQuotient`,
`kummerMap`, `kummerIso`, `kummerMapCanonical`, `kummerIso_res`), the multiplicative block
(`UnitsCoeff`, `kummerShortExact`, `hilbert90`, `h2KummerToUnits` with its two lemmas),
`galoisSubgroup` with `galoisSubgroup_index` and `galoisSubgroupEquiv`, the explicit complex
(`Z2`, `B2`, `H2`, `H2pi`, `DiscreteH2`, `discreteH2Equiv`, `explicitH2IsoContinuousCohomology`,
`explicitCup11`) and the finite-quotient system are abbreviations of Tau Ceti's declarations of
the same names or are proved by them; `trivialF2_isSmoothDiscrete`, `kummerCoeff_continuousSMul`
and `unitsCoeff_continuousSMul` are Tau Ceti's; and `Invariants` is Mathlib's
`FixedPoints.addSubgroup`. This roadmap consumes the supplier's names, so every statement here is
about Tau Ceti's objects and none is about a second copy of them.

| Consumer milestone | Supplier layer | Exact declaration | Mathematical type |
|---|---|---|---|
| Layer 7A, the group and the carrier of every statement of Layers 7 to 9 | 1, 9 | `AbsoluteGaloisGroup`, `TopRep`; Mathlib's `continuousCohomology`, which is what the supplier's operations are typed against | `Gal(Kˢ/K)`, and `TopRep R G ⥤ TopModuleCat R` |
| Layer 7A, the mod-2 coefficient object and its pairing | 13 | `trivialF2`, `trivialF2_isSmoothDiscrete`, `f2Pairing` | `𝔽₂` with the trivial action as an object of `TopRep ℤ G_K`, smooth discrete, with multiplication as a `TopPairing` |
| Layer 7A, the cup product; Layers 7C, 8 and 9 | 12 | `TopPairing`, `cup`, `cup_add_left`, `cup_add_right`, `cup_res`, `cup_infl`, `cup_projection`, `cup_gradedComm`, `degreeCast`, `ofDiscreteModulePairing` | `Hᵐ(G, X) × Hⁿ(G, Y) → H^{m+n}(G, Z)`, biadditive, with the four naturality squares and the projection formula |
| Layer 7A, restriction and inflation | 1 | `res`, `infl`, `coeffMap`, over Mathlib's compatible-pair `ContinuousCohomology.map` | `Hⁿ(G, X) ⟶ Hⁿ(H, Y)` for a compatible pair, and its three named instances |
| Layer 7A, corestriction | 10 | `corestriction`, `corestrictionLe`, `corestriction_comp_res`, `corestriction_mackey` | `Hⁿ(U, res X) ⟶ Hⁿ(G, X)` for open `U`, with `cor ∘ res = (G : U) · id` and the double-coset formula |
| Layer 7A, Kummer classes; Layer 8's classes; Layer 9's Kummer characters | 9, with 3 | `KummerCoeff`, `powerClassQuotient`, `kummerMap`, `kummerIso`, `kummerMapCanonical`, `explicitIso_kummerMap`, `kummerIso_res`, `kummerIso_norm`, `kummerCoeff_continuousSMul`; Layer 3's `explicitIso_coeffMap` | `Kˣ ⧸ (Kˣ)ⁿ ≃* Multiplicative (H¹(G_K, μ_n))` for `n` invertible in `K`, with the restriction and norm squares |
| Layer 7A, the multiplicative coefficients; Layer 7B's comparison | 9 | `UnitsCoeff`, `unitsCoeff_continuousSMul`, `kummerShortExact`, `hilbert90`, `h2KummerToUnits`, `h2KummerToUnits_injective`, `h2KummerToUnits_range` | `Additive Kˢˣ` as a discrete `G_K`-module, `H¹(G_K, Kˢˣ) = 0`, and `H²(G_K, μₙ) ↪ H²(G_K, Kˢˣ)` with image the `n`-torsion |
| Layer 7A, the transfer along `L/K`; Layers 8 and 9 | 9, with 10 and 12 | `galoisSubgroup`, `galoisSubgroup_index`, `galoisSubgroupEquiv`, `galoisF2Iso`, `galoisRes`, `galoisCor`, `galoisRes_cup`, `galoisCor_cup`, `galoisRes_comp`, `galoisRes_embedding_independent`, `galoisCor_embedding_independent` | restriction and corestriction of `𝔽₂`-cohomology along a finite separable `L/K` with a chosen `K`-embedding into `Kˢ`, the cup and projection formulas, functoriality in a tower, and independence of the embedding. `galoisSubgroup K L σ` is Tau Ceti's subgroup fixing `σ L` pointwise, and Layer 9 applies Tau Ceti's `TauCeti.mem_galoisSubgroup_iff` to it directly |
| Layers 7A and 9, the Evens norm, the conjugate and the character of a quadratic extension | 9, transporting 13 | `galoisEvens`, `galoisConj`, `galoisCharacter`, `galoisRes_galoisCor`, `galoisConj_evensConj`, `galoisRes_galoisEvens`, `galoisEvens_add`, `galoisEvens_galoisRes`, `galoisRes_eq_zero_iff`, `galoisEvens_embedding_independent` | for `[L : K] = 2` exactly: the norm `H¹(G_L, 𝔽₂) → H²(G_K, 𝔽₂)`; the conjugate `galoisConj = res ∘ cor − id`, the transport of `evensConj`; the class `χ_{L/K}` of the character with kernel `G_L`; and `res N x = x ∪ σ·x`, `N(x + y) = N x + N y + cor(x ∪ σ·y)`, `N(res y) = y ∪ y + χ_{L/K} ∪ y` and `ker(res : H²(G_K, 𝔽₂) → H²(G_L, 𝔽₂)) = χ_{L/K} ∪ H¹(G_K, 𝔽₂)` |
| Layer 9, the value of the Evens norm; the conjugation convention | 13 | `evensNormIndexTwo`, `homClass`, `evensConj`, `evensConj_eq_conjMapOf`, `WreathC2` with `WreathC2.mk`, `WreathC2.coordA`, `WreathC2.coordB`, `WreathC2.coordC`, `WreathC2.mk_zero`, `WreathC2.coordA_mk`, `WreathC2.coordB_mk`, `WreathC2.coordC_mk`, `WreathC2.mk_mul_mk`, `wreathSection`, `dihedralToWreath`, `wreathD16Cocycle`, `wreathD16Cocycle_isCocycle`, `indexTwoInd`, `continuous_wreathD16Cocycle_indexTwoInd`, `evensNormIndexTwo_eq_ind_pullback` | for an open subgroup `U` of index exactly two: the norm `H¹(U, 𝔽₂) → H²(G, 𝔽₂)`, evaluated on the class `homClass` of a continuous homomorphism; `evensConj` as conjugation by every `s ∉ U`; and, for every `s ∉ U`, `N^{Ev}(α) = (Ind α)^* c_{D₁₆}`, where `Ind α = indexTwoInd : G → C₂ ≀ C₂` and `c_{D₁₆} = wreathD16Cocycle` is the factor set of `dihedralToWreath : D₁₆ → C₂ ≀ C₂` for the section `wreathSection` |
| Layer 9, explicit 2-cocycles of `G_K` and their classes | 1, 3 and 13 | `cochainClass`, `cochainClass_eq_of_sub_eq_d`, `inhomogeneousCochain2`, `inhomogeneousCochain2_d_eq_zero`, `cochainClass_inhomogeneousCochain2_eq_of_coboundary`, `homClass_eq_cochainClass`; milestone *the explicit class map is additive* (no target signature) | the class in `H²(G, 𝔽₂)` of a continuous `𝔽₂`-valued 2-cocycle, cohomologous cocycles having the same class, and the class of a continuous homomorphism as a cochain class. This roadmap's `f2CocycleClass` is the composite at `G_K`; the additivity is frozen here as `f2CocycleClass_add`, and `f2CocycleClass_eq_add` is proved from it and the coboundary rule |
| Layer 7B, the comparison with the explicit model; Layer 9's `cup11_homClass` | 8, 12 | `explicitCup11`, `explicitIso_cup` | the agreement of the explicit bidegree-`(1,1)` cup with `cup` |
| Layer 7B, milestone 2(8), the passage from a finite cocycle to a continuous class | 2, 3 | `Z2`, `B2`, `H2`, `H2pi`, `DiscreteH2`, `discreteH2Equiv`, `explicitH2Obj`, `explicitH2IsoContinuousCohomology` | the explicit inhomogeneous degree-two complex with its class map, and its comparison with the canonical carrier, at `G = G_K` and `M = UnitsCoeff K`; a cocycle is built through Tau Ceti's `TauCeti.ContCohomology.mem_Z2_iff` |
| Layer 7B, milestone 2(8), the finite-quotient description of `H²(G_K, Kˢˣ)` | 0, 4 | `Invariants`, `explicitFiniteQuotientSystem2`, `explicitFiniteQuotientComparison2`, `explicitFiniteQuotientCocone2`, `explicitFiniteQuotientColimit2` | the invariant coefficients `M^U`, the degree-two system over the open normal subgroups of `G_K`, its inflation-and-inclusion cocone into `H²(G_K, M)`, and universality of that cocone |

**From the [semisimple-algebras
roadmap](../RepresentationTheory/SemisimpleAlgebras/README.md).**

| Consumer milestone | Supplier layer | Exact declaration | Mathematical type |
|---|---|---|---|
| Layer 5, the symbol | 4 | `tensorProduct_isSimpleRing` | a tensor product of central simple `K`-algebras is simple |
| Layer 5, the symbol | 4 | `tensorOp_algEquiv_matrix` | `A ⊗_K Aᵒᵖ ≃ₐ[K] M_{finrank K A}(K)` |
| Layer 5, the group law | 6 | `brauerCommGroup` | the `CommGroup` structure on `BrauerGroup K` |
| Layer 7B, splitting | 6 | `IsSplittingField` | a splitting field of a central simple algebra |

Layer 7B also needs a finite **separable** splitting field, and then a finite **Galois**
one. The semisimple-algebras roadmap states the separable milestone in prose and has no
target signature for it, so the shape Layer 7B consumes is frozen here as
`exists_finiteSeparable_splittingField`, produced inside `Kˢ` because Layer 7A's
`galoisSubgroup` is indexed by a `K`-embedding into `Kˢ`; the contract table gains a row
when that signature exists. The Galois refinement `exists_finiteGalois_splittingField` is
this roadmap's own, because no other roadmap states it.

## What is missing (build here)

Tau Ceti has the form theory below the Brauer group: Layers 0 to 4, that is the carrier and
the chain theorem, hyperbolic planes and Witt theory, the quaternion norm form with the
four-fold splitting criterion, the discriminants, and the Witt ring with its fundamental ideal
and Pfister forms (see "From Tau Ceti"). What remains:

- the milestones of Layers 0 to 4 that are marked there as built here: the contiguous-basis
  comparison and the naturality of descent (Layer 0); the degenerate case of Witt
  decomposition and the Witt index as the dimension of a maximal totally isotropic subspace
  (Layer 1); the Gram-determinant description of the discriminant (Layer 3); and
  `W(ℝ) ≅ ℤ` through the signature (Layer 4);
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
- the crossed-product package — the algebra of a cocycle, the cohomologous and
  multiplicative comparisons, the cocycle of a splitting, inflation of a cocycle along a
  compatible pair, surjectivity, and the two inverse identifications — the inflation of a
  finite cocycle into `H²_cont(G_K, Kˢˣ)` with its invariance under cohomologous cocycles
  and under refinement of the splitting field, its identification with the supplied
  finite-quotient comparison leg, and the finite-quotient exhaustion of `H²_cont`; and the
  comparison of the Brauer group with `H²` built from all of that, determined by its value
  on crossed-product classes, together with the identification of the quaternion class
  with a Kummer cup product;
- the cup-norm theorem in each of its five descriptions, over any field in which `2` is
  invertible;
- the Stiefel-Whitney classes `w₁` and `w₂` of forms, defined on isometry classes and not
  only on diagonal tuples, with the exact comparison between `w₂` and the Clifford
  invariant;
- the Scharlau transfer, the twisted trace form, the value of the index-two Evens norm on
  Kummer classes through the `Pin⁺` lift of `C₂ ≀ C₂`, and the relative Stiefel-Whitney
  formula in degrees 1 and 2.

None of this exists upstream as stated. Each object gets its complete basic theory, and
not only the milestone that the headline needs.

`Suggested.lean` fixes Lean forms for the design decisions that are most likely to fork
an implementation, together with the worked examples. It applies Tau Ceti's carrier for
isometry classes, chain theorem and descent principle, its Witt theory, its quaternion
algebras with the four-fold criterion, and its Witt ring with the fundamental ideal and the
Pfister forms; it states the rank-one hypothesis of each invariant descended through the
descent principle; and it prototypes the Brauer symbol with the Hasse and Clifford
invariants on Tau Ceti's `I²`, the Layer 6A objects stated against the supplied valuation
and filtration, the quadratic defect with its exponent,
the Hilbert symbol, the `μ₂` identification of Layer 7A with its laws, the
Brauer comparison, `w₁` and `w₂` on isometry classes, the Scharlau transfer, the `Pin⁺`
model in explicit `2 × 2` matrices with the value of the Evens norm, and the relative
Stiefel-Whitney formula. It is illustrative and not exhaustive, and this README
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

Layer 0 is Tau Ceti's, and this roadmap consumes it. The milestones below are what the later
layers apply, each with the Tau Ceti declaration that supplies it; the two that remain to be
built here are marked as such.

Prerequisites:

- **[Mathlib]** `weightedSumSquares`, `QuadraticMap.Equivalent`,
  `QuadraticMap.Anisotropic`, `Equiv.Perm`, `Relation.ReflTransGen`;
- **[Tau Ceti]** the files listed under "From Tau Ceti": the square-class groups, the
  carrier, the value sets and binary normal forms, the chain relations with Witt's chain
  theorem, and the descent principle.

Milestones:

- **Square-class interop** [Tau Ceti]. The additive `TauCeti.SquareClassGroup` and the
  multiplicative `TauCeti.MultiplicativeSquareClassGroup = Kˣ ⧸ Subgroup.square Kˣ`, with the
  dictionary `multiplicativeSquareClassEquiv` and the `ZMod 2`-module comparison
  `elementaryTwoQuotientEquivSquareClassGroup`; pushforward along a field map
  (`RingHom.squareClassMap`, `RingHom.multiplicativeSquareClassMap`), compatible with the
  dictionary (`RingHom.multiplicativeSquareClassEquiv_map`); and the finiteness transfer
  through the `Nat.card` API (`finite_multiplicativeSquareClassGroup_iff`,
  `natCard_multiplicativeSquareClassGroup`), which is the interface that Layer 6 consumes.
- **Representation and value sets** [Tau Ceti]. `QuadraticMap.Represents` and
  `QuadraticMap.unitValueSet`, as fixed in the convention table, with the basic calculus:
  - `unitValueSet` is closed under multiplication by squares
    (`QuadraticMap.mem_unitValueSet_mul_sq_iff`), so it is a union of square classes;
  - `Represents Q 0` holds for **every** `Q`, by the zero vector, with no hypothesis on
    `Q` and none on its space (`QuadraticMap.represents_zero`). This is exactly what makes
    the full value set useless as an invariant, and the classification statements use
    `unitValueSet`. It is not isotropy: `¬ Q.Anisotropic` asks for a nonzero `v` with
    `Q v = 0`, and an anisotropic form satisfies the first and fails the second;
  - the **representation criterion** (Lam I.2.3, I.3.5),
    `QuadraticMap.mem_unitValueSet_iff_not_anisotropic_prod`: for regular `Q` and `a : Kˣ`,
    `a ∈ unitValueSet Q` if and only if `Q ⊥ ⟨−a⟩` is isotropic. The hypothesis `a : Kˣ`
    carries the whole content of the reduction: the right-hand side is the existence of a
    nonzero vector on which `Q ⊥ ⟨−a⟩` vanishes, and it is only for `a ≠ 0` that its last
    coordinate can be normalized to `1` and the isotropic vector turned into a
    representation of `a` by `Q`. Read at `a = 0` both sides hold for every `Q`, so the
    criterion is a statement about units and is stated only there.

  Every later question about represented values is turned into an isotropy question
  through the criterion.
- **Binary forms in normal form** [Tau Ceti], both about units `a b c d`:
  - **representation normal form** (Lam I.2.3 (2)),
    `TauCeti.mem_unitValueSet_binary_iff_equivalent`:
    `c ∈ unitValueSet ⟨a,b⟩ ↔ ⟨a,b⟩ ≅ ⟨c, abc⟩`. The second coefficient is `abc` because
    its square class must be `ab/c`, and `ab/c = abc` modulo squares; the spelling with
    `ab c⁻¹` presents the same form (`TauCeti.equivalent_binaryNormalForm_inv`);
  - **binary equivalence criterion** (Lam I.5.1), `TauCeti.equivalent_binary_iff`:
    `⟨a,b⟩ ≅ ⟨c,d⟩` if and only if `IsSquare (a*b*(c*d))` and the two forms represent a
    common unit.
- **Chain equivalence** [Tau Ceti]. Every diagonal invariant rests on this theorem. For
  `w w' : Fin n → Kˣ` the relations are:
  - `TauCeti.PermutationStep w w'`: there is `σ : Equiv.Perm (Fin n)` with `w' i = w (σ i)`;
  - `TauCeti.BinaryStep w w'`: there are distinct `i j : Fin n` with `w k = w' k` for
    `k ∉ {i,j}` and `⟨w i, w j⟩ ≅ ⟨w' i, w' j⟩`;
  - `TauCeti.DiagonalStep w w'` is the disjunction of the two;
  - `TauCeti.DiagonalChain := Relation.ReflTransGen DiagonalStep`.

  A transposition is already a `BinaryStep`, because `⟨a,b⟩ ≅ ⟨b,a⟩`, so `PermutationStep`
  adds no generating data (`PermutationStep.to_reflTransGen_binaryStep`). Both relations are
  kept, because permutation invariance is the form that later proofs apply.

  The comparison of chains with isometry depends on the rank `n`:
  - **`n ≥ 2`**: `DiagonalChain w w' ↔ weightedSumSquares w ≅ weightedSumSquares w'`
    (`TauCeti.diagonalChain_iff_equivalent_of_two_le`). Left to right is elementary,
    because each step is an isometry (`DiagonalChain.equivalent`). Right to left is
    **Witt's chain-equivalence theorem** (Lam I.5.2), and it is the difficult direction;
  - **`n = 0`**: both sides hold (`TauCeti.diagonalChain_iff_equivalent_fin_zero`);
  - **`n = 1`**: a chain is equality of the coefficient
    (`TauCeti.diagonalChain_fin_one_iff_eq`), because a binary step needs two distinct
    slots, while `⟨a⟩ ≅ ⟨b⟩` exactly when `a * b` is a square. ⚠ So the equivalence is
    false in rank one: over `ℚ`, `⟨1⟩ ≅ ⟨4⟩` by halving the coordinate, and no chain joins
    them.

  **Built here:** the comparison with Serre IV Thm 5 on contiguous orthogonal bases, stated
  as a separate theorem so that a development that uses contiguity can be consumed.
  Contiguity is a comparison target, and never an alternative definition of the relation
  above.
- **The descent principle** [Tau Ceti], `TauCeti.RegularFormClass.liftDiagonal` with
  `liftDiagonal_mk` and `liftDiagonal_unique`. A function `f` on diagonal presentations
  descends uniquely along `Quotient.mk` to a function on `RegularFormClass K` that agrees
  with `f` on each presentation as soon as it satisfies three hypotheses:
  - `hperm`: `f` is invariant under `PermutationStep`;
  - `hbin`: `f` is invariant under `BinaryStep`;
  - `hone`: in rank one, `f ⟨a⟩ = f ⟨b⟩` whenever `a * b` is a square.

  Rank zero needs no hypothesis, having a single presentation. Ranks at least two need only
  `hperm` and `hbin`, by the chain theorem. Rank one needs `hone`, because no chain joins two
  isometric forms there. ⚠ Without `hone` the principle is false: the function that reads
  off the coefficient in rank one and is `1` in every other rank satisfies `hperm` and
  `hbin` and separates `⟨1⟩` from `⟨4⟩` over `ℚ`.

  The principle is applied to `hasseInvariant` (Layer 5), `localHasse` (Layer 6C), and `w₁`
  and `w₂` (Layer 8), and each records its `hone`:
  - `hasseInvariant`, `localHasse` and `w₂` are products or sums over the pairs `i < j`,
    and in rank one there is no pair, so both sides of `hone` are `1` or `0`;
  - `w₁ = ∑ᵢ (aᵢ)` has `hone : (a) = (b)` whenever `a * b` is a square (`sw1_rankOne`), which
    is the one case where the hypothesis has content.

  The discriminant and the signed discriminant do not go through the descent principle:
  Tau Ceti descends them directly, by the Gram-determinant argument
  `TauCeti.squareClass_prod_eq_of_equivalent`, which covers every rank at once.

Basic API for the objects introduced here, Tau Ceti's except where a milestone is marked
as built here:

- constructors: `RegularFormPresentation`, `regularFormSetoid`, `RegularFormClass`,
  `Represents`, `unitValueSet`, `PermutationStep`, `BinaryStep`, `DiagonalChain`;
- examples: `⟨1,1⟩` and `⟨1,−1⟩` over `ℚ`; the single `BinaryStep` from `⟨1,1⟩` to
  `⟨2,2⟩` over `ℚ`; the rank-one pair `⟨1⟩` and `⟨4⟩` over `ℚ`, isometric and joined by no
  chain;
- morphisms: the quotient map from presentations to classes; the descent principle as
  the universal property (`liftDiagonal_unique`);
- functoriality: pushforward of square classes and of presentations along a field map
  `K →+* L`, with the rank and `discr` commuting with it
  (`TauCeti.RegularFormClass.baseChange`, `rank_baseChange`, `discr_baseChange`);
- comparison lemmas: `DiagonalChain` against `Equivalent`, rank by rank; `IsSquare (a*b)`
  against equality in the square-class group (`squareClass_eq_iff_isSquare_mul`);
  contiguous orthogonal bases against `DiagonalChain`, built here;
- naturality: the descent principle commutes with pushforward along `K →+* L`, built here:
  if `g` on `L`-presentations and `f` on `K`-presentations satisfy the hypotheses and
  `g (p.baseChange L) = f p`, then the descended functions satisfy the same equation on
  `RegularFormClass.baseChange`;
- edge cases: rank `0` and rank `1`, where the empty and singleton products appear and
  where the chain theorem changes form; `Represents Q 0`, which holds for every `Q` and is
  not a statement about `unitValueSet`;
- downstream interfaces: Layers 5, 6C, and 8 each obtain a well-defined invariant from the
  descent principle, and Layer 3's discriminants are Tau Ceti's.

⚠ Nearby false generalization. Equal length and equal discriminant do not give a chain,
so they do not give an isometry. Over `ℚ`, `⟨1,1⟩` and `⟨−1,−1⟩` have discriminant
`[1]`, and they are not isometric, because one is positive definite and the other is
negative definite.

### Layer 1: hyperbolic planes and Witt theory

Layer 1 is Tau Ceti's, and this roadmap consumes it. The milestones below name the Tau Ceti
declarations that supply them; the two that remain to be built here are marked as such.

Prerequisites:

- **[Mathlib]** `QuadraticMap.prod`, `QuadraticMap.Nondegenerate`, `basisRepr`,
  `exists_orthogonal_basis`, `Module.finrank`;
- **[Tau Ceti]** `TauCeti/LinearAlgebra/QuadraticForm/Hyperbolic.lean`,
  `Witt/Decomposition.lean`, `Witt/Cancellation.lean`, `Witt/Extension.lean`,
  `OrthogonalGroup.lean` and `CartanDieudonne/Basic.lean`;
- **[Layer 0]** the representation criterion and the binary normal forms.

Milestones:

- **The hyperbolic plane** [Tau Ceti]. `ℍ_q := ⟨1, −1⟩` is `TauCeti.hyperbolicPlane K`,
  equivalent to the `xy`-form because `2` is invertible
  (`TauCeti.equivalent_hyperbolicPlane_dualProd`), and its class is
  `TauCeti.hyperbolicClass K`. It represents every scalar
  (`TauCeti.represents_hyperbolicPlane`), `⟨a, −a⟩ ≅ ℍ_q`
  (`TauCeti.equivalent_weightedSumSquares_self_neg_hyperbolicPlane`), and a regular isotropic
  form splits off a hyperbolic plane (Lam I.3.4,
  `TauCeti.exists_hyperbolicPlane_prod_equivalent`), so a regular isotropic form is
  universal.
- **Witt decomposition** (Lam I.4.1) [Tau Ceti] for regular forms. A regular form is `m`
  hyperbolic planes plus an anisotropic diagonal form, with `m` its Witt index
  (`QuadraticForm.exists_equivalent_hyperbolicPresentation_prod`). On the carrier,
  `c = m • [ℍ_q] + anisotropicPart c` (`TauCeti.RegularFormClass.wittDecomposition`), where the
  **Witt index** `TauCeti.RegularFormClass.wittIndex` and the **anisotropic part**
  `TauCeti.RegularFormClass.anisotropicPart` are determined by any such decomposition
  (`RegularFormClass.wittIndex_eq`, `RegularFormClass.anisotropicPart_eq`).
  **Built here:** the decomposition `q ≅ q_t ⊥ (m × ℍ_q) ⊥ q_a` of a possibly degenerate
  form, where `q_t` is the zero form on the radical, with all three parts unique up to
  isometry; and, for regular `q`, the Witt index as the dimension of a maximal totally
  isotropic subspace (Lam I.4.4).
- **Witt cancellation** (Lam I.4.2) [Tau Ceti]: `q ⊥ q₁ ≅ q ⊥ q₂ → q₁ ≅ q₂` for regular
  finite-dimensional `q`, with no hypothesis on `q₁` and `q₂`
  (`TauCeti.equivalent_of_equivalent_prod`, and `equivalent_of_equivalent_prod_right` for the
  summand on the right). On the carrier it is the instance
  `IsCancelAdd (RegularFormClass K)`.
- **Reflections and Cartan-Dieudonné** (Lam I.7) [Tau Ceti]. For `Q v` invertible the
  reflection `τ_v x = x − (polar Q x v / Q v) • v` is the element
  `TauCeti.QuadraticMap.reflectionOrthogonal Q v` of the orthogonal group
  `TauCeti.QuadraticMap.orthogonalGroup Q` (`OrthogonalGroup.lean`). **Cartan-Dieudonné**:
  every isometry of a regular `n`-dimensional quadratic space is a product of at most `n`
  reflections (`TauCeti.QuadraticMap.exists_reflectionOrthogonal_list_prod_eq`), the
  identity being the empty product.
- **Witt's extension theorem** (Lam I.4.9) [Tau Ceti]: an isometry between regular
  subspaces of a finite-dimensional quadratic space extends to the whole space, with no
  regularity hypothesis on the ambient form (`QuadraticMap.IsometryEquiv.exists_extension`,
  with the chosen extension `QuadraticMap.IsometryEquiv.extension`). Layer 6 and Layer 9 both
  use it.

Basic API, Tau Ceti's except where marked as built here:

- constructors: `hyperbolicPlane`, `hyperbolicClass`, `RegularFormClass.wittIndex`,
  `RegularFormClass.anisotropicPart`, `QuadraticMap.reflectionOrthogonal`, all in the
  `TauCeti` namespace;
- examples: `ℍ_q` over `ℚ`; `⟨1,1⟩` over `ℚ`, which is anisotropic and has Witt index
  `0` (`TauCeti.anisotropic_presentedForm_one_one`);
- morphisms: reflections and the orthogonal group; the extension of an isometry from a
  subspace;
- functoriality: the Witt index and the anisotropic part are invariants of
  `Equivalent`. Under a field extension the Witt index cannot decrease
  (`RegularFormClass.wittIndex_le_wittIndex_baseChange`), and the extension of the
  anisotropic part need not stay anisotropic. An equality holds only under the
  anisotropy-preservation hypothesis of `RegularFormClass.anisotropicPart_baseChange`.
  ⚠ Do not claim that `anisotropicPart` commutes with base change: `⟨1,1⟩` over `ℝ` has Witt
  index `0`, and over `ℂ` it is hyperbolic with Witt index `1` and zero anisotropic part;
- comparison lemmas: the Witt index against the dimension of a maximal totally
  isotropic subspace, built here; the `xy`-form against `⟨1,−1⟩`;
- naturality: the anisotropic part of `q` represents its Witt class in the Witt ring of
  Layer 4 (`TauCeti.wittClass_anisotropicPart`);
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

Layer 2 is Tau Ceti's, in `TauCeti/Algebra/Quaternion/`, and this roadmap consumes it. The
milestones below name the Tau Ceti declarations that supply them.

Prerequisites:

- **[Mathlib]** `QuaternionAlgebra`, `star`, `mul_star_eq_coe`,
  `QuaternionAlgebra.Basis` with `Basis.lift`, `QuadraticAlgebra K a 0` with its `norm`,
  `Matrix (Fin 2) (Fin 2) K`;
- **[Tau Ceti]** `TauCeti/Algebra/Quaternion/{NormForm,Split,SquareSplit,Steinberg,
  SymbolEquiv,AlgEquiv,SplittingCriterion,BaseChange}.lean`;
- **[Layer 0]** the binary normal forms;
- **[Layer 1]** the hyperbolic plane and the splitting of an isotropic form.

Milestones:

- **Norm form** [Tau Ceti]. For `a, b ∈ Kˣ`, `Nrd(x) = x · star x` is scalar, by Mathlib's
  `mul_star_eq_coe`, and `x ↦ (x * star x).re` is the quadratic form
  `QuaternionAlgebra.normForm a 0 b` on `ℍ[K,a,b]` (`QuaternionAlgebra.normForm_apply`).
  `Nrd ≅ ⟨1, −a, −b, ab⟩ = ⟨⟨a, b⟩⟩`, the 2-fold Pfister form
  (`QuaternionAlgebra.equivalent_normForm_weightedSumSquares`); the **pure part**
  `QuaternionAlgebra.pureNormForm` on the trace-zero subspace is `⟨−a, −b, ab⟩`
  (`QuaternionAlgebra.equivalent_pureNormForm_weightedSumSquares`); and
  `Nrd(xy) = Nrd(x)·Nrd(y)` (`QuaternionAlgebra.normForm_mul`).
- **Split or division** (Lam III.2.2, III.2.7) [Tau Ceti]. `ℍ[K,a,b]` is a division algebra
  exactly when `Nrd` is anisotropic (`QuaternionAlgebra.anisotropic_normForm_iff`), and
  otherwise it is isomorphic to `Matrix (Fin 2) (Fin 2) K`
  (`TauCeti.QuaternionAlgebra.forall_isUnit_or_nonempty_algEquiv_matrix`). Both halves are
  computations with the norm form.
- **Symbol relations at the algebra level** [Tau Ceti], each an `AlgEquiv` (Lam III.2.11):
  `(a,b) ≅ (b,a)` is Mathlib's `QuaternionAlgebra.swapEquiv`; `(a, c²b) ≅ (a,b)` is
  `TauCeti.QuaternionAlgebra.rescaleJEquiv`, with `rescaleIEquiv` in the first slot;
  `(a, −a) ≅ M₂(K)` is `TauCeti.QuaternionAlgebra.aNegAEquivMatrix`; `(a, b²) ≅ M₂(K)` is
  `TauCeti.secondSquareEquivMatrix`; `(1, b) ≅ M₂(K)` is
  `TauCeti.QuaternionAlgebra.oneEquivMatrix`; and the **Steinberg relation**
  `(a, 1−a) ≅ M₂(K)`, for `a` with `a` and `1 − a` units, is
  `TauCeti.QuaternionAlgebra.steinbergEquivMatrix`.
- **Naturality of quaternion equivalences** [Tau Ceti]. A `K`-algebra equivalence
  `f : ℍ[K,a,b] ≃ₐ[K] ℍ[K,c,d]` commutes with `star` (`QuaternionAlgebra.map_star_of_algEquiv`),
  preserves the reduced trace and the reduced norm (`reducedTrace_eq_of_algEquiv`,
  `normForm_eq_of_algEquiv`), maps the trace-zero subspace onto the trace-zero subspace
  (`map_ker_reₗ_of_algEquiv`), and restricts to an isometry of pure norm forms
  `⟨−a,−b,ab⟩ ≅ ⟨−c,−d,cd⟩` (`QuaternionAlgebra.equivalent_weightedSumSquares_of_algEquiv`).
  Without this milestone, equality of quaternion invariants gives no isometry, and the
  dimension-3 classification of Layer 5 has no proof.
- **The four-fold splitting criterion** [Tau Ceti], the main theorem of the layer (Lam III.2.7
  and III.4.2, Serre III.1.1-1.2, Gille-Szamuely 1.1.9),
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`. For `a, b ∈ Kˣ` the following
  are equivalent:
  1. `ℍ[K,a,b]` splits, that is `≃ₐ[K] Matrix (Fin 2) (Fin 2) K`;
  2. `b` is a norm from the quadratic algebra `K(√a)`, that is
     `∃ z : QuadraticAlgebra K a 0, z.norm = b`;
  3. `b = x² − ay²` has a solution in `K`;
  4. `⟨1, −a, −b⟩` is isotropic;
  5. the norm form `⟨⟨a, b⟩⟩` is isotropic.

  Each condition against the first is a named theorem
  (`nonempty_algEquiv_matrix_iff_exists_norm_eq`,
  `nonempty_algEquiv_matrix_iff_exists_eq_sq_sub_mul_sq`,
  `nonempty_algEquiv_matrix_iff_not_anisotropic_weightedSumSquares`,
  `nonempty_algEquiv_matrix_iff_not_anisotropic_normForm`).
  When `a` is a square all five conditions hold, so no hypothesis on `a` is carried.
  The norm form `x² − a y²` is then universal. A further equivalent condition, the
  vanishing of the Kummer cup `(a) ∪ (b)`, is Layer 7C, and is kept out of here so that
  Layers 0 to 6 need no cohomology.

Basic API, Tau Ceti's except where marked as built here:

- constructors: `QuaternionAlgebra.normForm`, `QuaternionAlgebra.pureNormForm`, and the
  splitting predicate `Nonempty (ℍ[K,a,b] ≃ₐ[K] Matrix (Fin 2) (Fin 2) K)`;
- examples: `ℍ[ℚ,−1,−1]`, a division algebra; `ℍ[ℚ,1,b]`, split for every `b`;
  `ℍ[ℚ_2,2,5]`, a division algebra; `ℍ[ℚ_2,5,5]`, split; these are built here, with the
  worked examples;
- morphisms: `AlgEquiv` between quaternion algebras; the induced isometry of pure norm
  forms (`QuaternionAlgebra.pureNormFormIsometryEquivOfAlgEquiv`);
- functoriality: base change `ℍ[K,a,b] ⊗_K L ≃ₐ[L] ℍ[L,a,b]`
  (`TauCeti.QuaternionAlgebra.baseChangeTwoParams`), and the splitting predicate under a
  field map, which follows from it;
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

Everything here is a function of a diagonalization, well defined on `RegularFormClass K`,
with values in `ℕ`, in `ZMod 2`, or in the square-class group. The Hasse invariant is not in
this layer, because its codomain is a group of Brauer classes, which Layer 5 supplies. The
layer is Tau Ceti's except for the two milestones marked as built here.

Prerequisites:

- **[Mathlib]** `discr'`, `basisRepr`, `Matrix.det`, `ZMod 2`;
- **[Tau Ceti]** `RegularFormClass/Discriminant.lean`, `Diagonal/Chain/Induction.lean`, and
  `TauCeti/Algebra/Quaternion/Binary.lean`;
- **[Layer 0]** the descent principle and the binary equivalence criterion;
- **[Layer 2]** the symbol relations and the norm form.

Milestones:

- **Dimension and dimension mod 2** [Tau Ceti]. The rank `TauCeti.RegularFormClass.rank`,
  invariant under `Equivalent` (`TauCeti.rank_formClass`) and a semiring map to `ℕ`
  (`RegularFormClass.rankHom`); the ring map to `ZMod 2` that Layer 4 uses is its composite
  with `Nat.castRingHom (ZMod 2)`.
- **Discriminant and signed discriminant** [Tau Ceti] on `RegularFormClass K`:
  `TauCeti.RegularFormClass.discr` and `TauCeti.RegularFormClass.signedDiscr`, valued in
  `SquareClassGroup K`, with `discr_mk` and `signedDiscr_mk` on presentations and
  `TauCeti.discr_formClass` and `TauCeti.signedDiscr_formClass` on a regular form.
  Well-definedness is the Gram-determinant computation
  `TauCeti.squareClass_prod_eq_of_equivalent`, through Mathlib's `discr'`
  (`QuadraticForm.discr'_weightedSumSquares`). This roadmap's `discr` and `signedDiscr`, with
  `discr_mk`, `signedDiscr_mk` and `signedDiscr_eq_sign_mul_discr`, are the same invariants
  read in `Kˣ ⧸ (Kˣ)²` through `multiplicativeSquareClassEquiv`, with proofs from Tau Ceti's;
  they are the names that `GlobalQuadraticForms` consumes.
- **The exact formulas** [Tau Ceti], for `q` of rank `m` and `r` of rank `n`, written here
  multiplicatively in `Kˣ ⧸ (Kˣ)²`:

  ```text
  d(q ⊥ r)  = d(q) · d(r)                d±(q ⊥ r)  = (−1)^{mn} · d±(q) · d±(r)
  d(λ • q)  = λ^m · d(q)                 d±(λ • q)  = λ^m · d±(q)
  d(q ⊗ r)  = d(q)^n · d(r)^m            d±(q ⊗ r)  = (−1)^{mn(mn−1)/2} d(q)^n d(r)^m
  ```

  These are `discr_add`, `discr_mk_rankOne_mul`, `discr_mul`, `signedDiscr_add`,
  `signedDiscr_mk_rankOne_mul` and `signedDiscr_mul`, stated additively, with scaling by `λ`
  written as multiplication by the rank-one class `⟨λ⟩`. The conversion
  `d±(q) = (−1)^{m(m−1)/2} · d(q)` is `signedDiscr_eq_sign_add_discr`, read here as
  `signedDiscr_eq_sign_mul_discr`, and it is the only conversion that a later proof uses.
  Values on the standard forms: `d±⟨a⟩ = a` (`signedDiscr_mk_rankOne`), `d±(ℍ_q) = 1`
  (`signedDiscr_hyperbolicClass`), and `d±⟨⟨a,b⟩⟩ = 1`, which Tau Ceti states in the Witt
  ring (`WittRing.signedDiscr_oneFoldPfisterClass_mul`).
- **The Gram-determinant description**, built here. For a regular `Q` on a
  finite-dimensional space and any basis of that space, `discr (formClass Q hQ)` is the
  square class of the determinant of the Gram matrix of `Q` in that basis, that is Mathlib's
  `discr'` transported by `basisRepr`. Tau Ceti runs this computation on diagonal
  presentations to prove well-definedness, and does not state it for an arbitrary basis.
- **The binary quaternion lemma** [Tau Ceti],
  `TauCeti.QuaternionAlgebra.nonempty_algEquiv_of_equivalent_binary`: if `⟨a,b⟩ ≅ ⟨c,d⟩`,
  then `ℍ[K,a,b] ≃ₐ[K] ℍ[K,c,d]` (Lam III.2.11), through the functoriality of Clifford
  algebras. This is the one nontrivial input to the well-definedness of the Hasse invariant
  in Layer 5, and its codomain is only an isomorphism class of algebras.
- **Chain induction, prepared** [Tau Ceti]. A function of the form
  `w ↦ ∏_{i<j} F (w i) (w j)` into a commutative monoid is:
  - `PermutationStep`-invariant as soon as `F` is symmetric
    (`TauCeti.PermutationStep.prod_prod_Ioi_eq`);
  - `BinaryStep`-invariant as soon as `F` is multiplicative in its first argument and
    `F a b = F c d` whenever `⟨a,b⟩ ≅ ⟨c,d⟩` (`TauCeti.BinaryStep.prod_prod_Ioi_eq`).

  Both are stated for an abstract commutative monoid `M` and an abstract
  `F : Kˣ → Kˣ → M`. Layer 5 with `M = BrauerGroup K`, Layer 6C with `M = ℤˣ`, and Layer 8
  with `M = H²(G_K, 𝔽₂)` written additively each invoke them instead of repeating the
  induction. In rank one such a product is empty, which discharges the rank-one hypothesis
  of the descent principle.
- **The invariant dictionary, as documentation**, built here. Record in the file docstring
  which named invariant each source means: O'Meara's `∏_{i≤j}`, Serre's `ε`, Lam's `s`,
  and Lam's `c`, with the ⚠ Wall caution of the convention table. There is no definition
  here, and no formula that mentions a Brauer class.

Basic API:

- constructors: `discr`, `signedDiscr`, and the rank, all Tau Ceti's;
- examples: `d±⟨a⟩ = a`; `d±(ℍ_q) = 1`; `d(⟨−1,−1⟩) = [1]`;
- morphisms: the ring map `RegularFormClass K → ZMod 2` given by the rank;
- functoriality: `discr` commutes with base change along `K →+* L`
  (`TauCeti.RegularFormClass.discr_baseChange`), and so does `signedDiscr`, because the rank
  does;
- comparison lemmas: `signedDiscr_eq_sign_mul_discr`; the Gram-determinant description
  against the product description;
- naturality: the two chain-induction lemmas, stated for an abstract monoid, so that
  each later layer instantiates them;
- edge cases: rank `0` and rank `1`, where `d± = d`
  (`RegularFormClass.signedDiscr_eq_discr_of_rank_le_one`); scaling by a square;
- downstream interfaces: Layer 4's `I/I² ≅ Kˣ/(Kˣ)²`, Layer 5's Hasse invariant,
  Layer 6D's classification, and Layer 8's `w₁`.

### Layer 4: the Witt ring and the fundamental ideal

This layer is free of the Brauer group. Everything below is about `RegularFormClass K`
and the rings built from it. The maps into `Br(K)[2]` are Layer 5.

Layer 4 is Tau Ceti's, in `TauCeti/LinearAlgebra/QuadraticForm/Witt/`, and this roadmap
consumes it. `Suggested.lean` opens Tau Ceti's declarations and declares no second ring, ideal,
discriminant map or Pfister form. The one milestone that remains to be built here, `W(ℝ) ≅ ℤ`,
is marked as such.

Prerequisites:

- **[Mathlib]** `Ideal`, `Ideal.Cotangent`, `AddSubgroup.closure`,
  `Algebra.GrothendieckAddGroup`;
- **[Tau Ceti]** `Witt/Ring.lean`, `Witt/FundamentalIdeal.lean`, `Witt/Discriminant.lean`,
  `Witt/Pfister.lean` (the directory `Witt/Pfister/` after the pin) and `Witt/Round.lean`;
- **[Layer 1]** Witt decomposition and cancellation;
- **[Layer 2]** the norm form and the four-fold criterion;
- **[Layer 3]** the discriminant formulas and the dimension map.

Milestones:

- **`Ŵ(K)` and `W(K)`** (Lam II.1) [Tau Ceti]. The commutative monoid
  `(RegularFormClass K, ⊥)` with the multiplication induced by `⊗` is the commutative semiring
  `TauCeti.instCommSemiringRegularFormClass`. Its Grothendieck group is the
  **Witt-Grothendieck ring** `TauCeti.WittGrothendieckRing K`, with the class map
  `TauCeti.toWittGrothendieck`, which is injective by Witt cancellation
  (`toWittGrothendieck_injective`). The **Witt ring** `TauCeti.WittRing K` is the quotient by
  the ideal `TauCeti.hyperbolicIdeal K` generated by `ℍ_q`, which is the cyclic subgroup
  `ℤ · [ℍ_q]` (`mem_hyperbolicIdeal_iff`), with the quotient map `TauCeti.WittRing.mk`. The Witt
  class of a form is `TauCeti.wittClass`, the class map followed by the quotient map. Every
  element of `W(K)` is a Witt class (`wittClass_surjective`), every regular form's Witt class
  is represented by its anisotropic part (`wittClass_anisotropicPart`), and two forms have
  the same Witt class exactly when their anisotropic parts are isometric
  (`wittClass_eq_iff_anisotropicPart_eq`). The dimension-mod-2 ring map is
  `TauCeti.WittRing.dimMod2`. `GlobalQuadraticForms` cites the Witt ring and the quotient
  map as this roadmap's `wittRing` and `toWittRing`, which `Suggested.lean` keeps as reducible
  aliases of `TauCeti.WittRing` and `TauCeti.WittRing.mk`. General torsion theorems for
  `W(K)` are excluded.

  `W` as a functor for field extensions is `TauCeti.WittRing.baseChange : W(K) →+* W(L)`, with
  its value on Witt classes `WittRing.baseChange_wittClass`, the functor laws
  `WittRing.baseChange_self` and `WittRing.baseChange_comp`, and
  `WittRing.map_fundamentalIdeal_pow_le`; these are the localization maps that
  `GlobalQuadraticForms` composes over the completions. They landed in
  `TauCeti/LinearAlgebra/QuadraticForm/Witt/BaseChange.lean` after this repository's Tau Ceti
  pin, and no statement here applies them, so `Suggested.lean` declares no stand-in; when the
  pin moves past them, they are consumed directly.
- **The fundamental ideal** [Tau Ceti]. `I(K) = ker(W(K) → ZMod 2)` is
  `TauCeti.fundamentalIdeal K`, and a Witt class lies in it exactly when the rank is even
  (`wittClass_mem_fundamentalIdeal_iff`). The generation statements:
  - `I` is generated as an additive group, and so as an ideal, by the 1-fold Pfister
    classes `⟨⟨a⟩⟩ = ⟨1,−a⟩`, that is `TauCeti.oneFoldPfisterClass`
    (`fundamentalIdeal_toAddSubgroup_eq_closure_oneFoldPfisterClass`,
    `fundamentalIdeal_eq_span_oneFoldPfisterClass`);
  - `Iⁿ` is generated as an additive group by the `n`-fold Pfister classes for every
    `n ≥ 1`, `TauCeti.fundamentalIdeal_pow_eq_addClosure`, with the cases `n = 2` and `n = 3`
    that Layer 5 uses as `fundamentalIdeal_sq_eq_addClosure` and
    `fundamentalIdeal_cube_eq_addClosure`. ⚠ It is false at `n = 0`: `I⁰ = W(K)` is not
    additively generated by `⟨1⟩`, the only `0`-fold Pfister form (over `ℚ`, `⟨2⟩` is not a
    multiple of `⟨1⟩`). ⚠ Additive generation is the statement Layer 5 needs; the weaker
    ideal generation does not let a homomorphism be defined by its values on the
    generators;
  - `I/I² ≅ Kˣ/(Kˣ)²` through `d±`, which is where the signed discriminant is forced:
    `TauCeti.signedDiscrHom` on `I(K)` is onto (`signedDiscrHom_surjective`) with kernel `I²`
    (`signedDiscrHom_eq_zero_iff`), and induces `TauCeti.fundamentalIdealCotangentEquiv`.
    A Witt class lies in `I²` exactly when it has even rank and trivial `d±`
    (`wittClass_mem_fundamentalIdeal_sq_iff`). These maps are valued in the additive
    `SquareClassGroup K`. Layer 3's multiplicative `signedDiscr` is the same invariant of the
    Witt class carried across `multiplicativeSquareClassEquiv`
    (`signedDiscr_eq_signedDiscr_wittClass` in `Suggested.lean`), and no second
    discriminant map is defined on `W(K)`.

  No statement about `I³/I⁴` or about the higher filtration is claimed.
- **Pfister forms** [Tau Ceti] in every degree, with the theory developed for `n ≤ 2`. The
  diagonal tuple is `TauCeti.pfisterForm a : Fin (2 ^ n) → Kˣ`, whose slot `k` is
  `∏_{i ∈ S} (−aᵢ)` over the positions `S` of the `1`s in the binary expansion of `k`
  (`pfisterForm_apply` in `Suggested.lean`); its isometry class is `TauCeti.pfisterFormClass a`, the product of the
  classes `1 + ⟨−aᵢ⟩` (`pfisterFormClass_eq_mk`); and its Witt class is
  `TauCeti.pfisterClass a`, the product of the one-fold classes (`pfisterClass_eq_prod`), which
  lies in `Iⁿ` (`pfisterClass_mem_fundamentalIdeal_pow`).
  - `⟨⟨a,b⟩⟩` is the norm form of `ℍ[K,a,b]` (Layer 2,
    `QuaternionAlgebra.equivalent_normForm_weightedSumSquares`);
  - **round**: for `n ≤ 2`, every `c ∈ unitValueSet ⟨⟨a₁,…,aₙ⟩⟩` is a similarity factor,
    that is `c • ⟨⟨a₁,…,aₙ⟩⟩ ≅ ⟨⟨a₁,…,aₙ⟩⟩`
    (`TauCeti.oneFoldPfister_smul_equivalent_of_mem_unitValueSet`,
    `TauCeti.twoFoldPfister_smul_equivalent_of_mem_unitValueSet`);
  - `⟨⟨a,b⟩⟩` is isotropic if and only if it is hyperbolic, if and only if `ℍ[K,a,b]` splits,
    which is the four-fold criterion stated in the Witt ring: Tau Ceti's
    `pfisterFormClass_two_tfae`, with `pfisterClass_two_eq_zero_iff`, in
    `Witt/Pfister/Hyperbolic.lean`, which landed after this repository's pin.

  The general theory of `n`-fold Pfister forms, that is roundness in all degrees, the
  Arason-Pfister Hauptsatz, and function-field methods, is excluded. The four items
  above are what Layers 5 and 8 consume.

Basic API, Tau Ceti's except where marked as built here:

- constructors: `WittGrothendieckRing`, `WittRing`, `toWittGrothendieck`, `WittRing.mk`,
  `wittClass`, `fundamentalIdeal`, `oneFoldPfisterClass`, `pfisterForm`, `pfisterFormClass`,
  `pfisterClass`, with this roadmap's aliases `wittRing` and `toWittRing`;
- examples: `W(K) ≅ ZMod 2` for `K` separably closed, so `W(ℂ) ≅ ZMod 2`
  (`WittRing.equivZModTwoOfIsSepClosed`, after the pin); `W(ℝ) ≅ ℤ` through the signature,
  built here; `⟨⟨1⟩⟩ = ⟨1,−1⟩`, which is zero in `W(K)` (`oneFoldPfisterClass_one`);
- morphisms: the dimension map `WittRing.dimMod2`; the discriminant map
  `I/I² → Kˣ/(Kˣ)²`; `WittRing.baseChange`, after the pin;
- functoriality: `W` as a functor, with `I` and `Iⁿ` mapped into each other by a field
  extension (`WittRing.map_fundamentalIdeal_pow_le`, after the pin);
- comparison lemmas: a Witt class against its anisotropic representative; a Pfister form
  against a quaternion norm form;
- naturality: the generation of `Iⁿ` by Pfister forms is stable under a field
  extension (`WittRing.baseChange_pfisterClass`, after the pin);
- edge cases: `n = 0`, where `⟨⟨⟩⟩ = ⟨1⟩` (`pfisterClass_zero`); the hyperbolic class, which
  is zero in `W(K)` (`wittClass_hyperbolicClass`); the zero ring case, which does not occur
  for a field;
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
- **[Layer 4]** Tau Ceti's fundamental ideal `TauCeti.fundamentalIdeal K`, its powers, and
  the generation of `I²` and of `I³` by Pfister classes.

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
  Well-definedness is Layer 0's descent principle, whose two step hypotheses are Layer 3's
  chain-induction lemmas with `M = BrauerGroup K` and `F a b = [(a,b)]`. Symmetry and
  bilinearity are the bullet above, and `F a b = F c d` for `⟨a,b⟩ ≅ ⟨c,d⟩` is Layer 3's
  binary quaternion lemma. Lam V.3.18 is this argument. The rank-one hypothesis holds
  because in rank one the product is empty, so both sides are `1`. Then the two formulas,
  for `q` of rank `n` and `r` of rank `m`, writing `s = hasseInvariant`:

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
- **The `I²` homomorphism**, in six steps. Each is a separate target, because the
  existence of `c` is a theorem about the Clifford invariant and not a formality.
  1. **Additivity on `I²`**, `cliffordInvariant_append_of_mem_I2`:
     `c(q ⊥ r) = c(q) · c(r)` when the Witt classes of both summands lie in Tau Ceti's
     `fundamentalIdeal K ^ 2`, that is when both have even rank and trivial signed
     discriminant (`TauCeti.wittClass_mem_fundamentalIdeal_sq_iff`). The dimension-dependent correction
     terms of the Lam V.3.20 comparison and of `s(q ⊥ r) = s(q) s(r) [(d q, d r)]` cancel
     exactly there. ⚠ Over a general pair the identity is false, so the two hypotheses
     are part of the statement, and `c` is not additive on `W(K)`.
  2. **The value on a 2-fold Pfister generator**,
     `cliffordInvariant_pfisterForm_two`: `c(⟨⟨a,b⟩⟩) = [(a,b)]`, on Tau Ceti's tuple
     `pfisterForm ![a, b]`. Together with step 1 and Layer 4's additive generation this
     determines `c` on all of `I²`.
  3. **Vanishing on a 3-fold Pfister generator**,
     `cliffordInvariant_pfisterForm_three`: `c(⟨⟨a,b,c⟩⟩) = 1` (Lam V.3.4). It is stated
     on the generator, which is the shape a proof by generation can check.
  4. **Generation of `I²` and of `I³`** by those forms is Tau Ceti's
     `fundamentalIdeal_sq_eq_addClosure` and `fundamentalIdeal_cube_eq_addClosure`, the
     cases `n = 2` and `n = 3` of `fundamentalIdeal_pow_eq_addClosure` (Layer 4). ⚠ Additive
     generation, not ideal generation: the ideal statement does not let a homomorphism be
     defined by its values on the generators.
  5. **The homomorphism** `cliffordHomI2 : I² → Br(K)[2]`, from steps 1 and 4, with
     `cliffordHomI2_pfisterClass` computing it on the generator `TauCeti.pfisterClass ![a, b]`
     and
     `cliffordHomI2_two_torsion` placing its image in the `2`-torsion. Without the first
     of those two equations the declaration would assert nothing. Then
     `cliffordHomI2_eq_zero`: it vanishes on `I³`, by step 3 through step 4 at `n = 3`.
  6. **The quotient homomorphism** `cliffordHomI2Bar : I²/I³ → Br(K)[2]`, a named
     declaration together with `cliffordHomI2Bar_mk`, the equation that computes it on a
     representative. An unnamed map out of the quotient is not citable by a consumer, and
     a named one without that equation is not the descent of `c`.

  No injectivity claim, no surjectivity claim, and no classification claim for `c̄` is a
  milestone here. Injectivity is Merkurjev's theorem, which no roadmap in this family
  proves, and it is an explicit exclusion rather than a promised interface.

Basic API:

- constructors: `quaternionClass`, `hasseInvariant`, `cliffordInvariant`,
  `cliffordHomI2`, `fundamentalI3InI2`, and `cliffordHomI2Bar`, that is `c̄`;
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
`unitFiltration`, the level `e = v_K(2)` is its `natCastValuation K 2`, and the graded
pieces, the power-class counts with the
identification of the two spellings of the square classes, the unramified extensions and
their norm groups are its milestones. Nothing here defines a second valuation, a second
filtration or a second ramification index: a second one would need a comparison lemma at
every use site, and every statement of 6B, 6C and 6D is written against the supplied
objects.

One object and a few statements are named here because the supplier does not export them
in the shape the later sublayers consume. Tau Ceti implements most of them in
`TauCeti/NumberTheory/LocalField/{Uniformizer,Squares,SquareClass}.lean`: the uniformizer
predicate `TauCeti.IsUniformizer` with `isUniformizer_iff_exists_irreducible` and
`exists_isUniformizer`, the level `TauCeti.dyadicLevel`, the sharp local square theorem
`TauCeti.unitFiltration_le_square` and `TauCeti.not_unitFiltration_le_square` in every
residue characteristic, and the odd count `TauCeti.card_squareClass_of_odd`. This roadmap's
names for them are aliases of those declarations. Two further entries carry no work and are
there to fix a name: they record which supplier declaration `e` and the square classes are
read through, because 6B, 6C and 6D read both constantly. The supplier rows are in the contract table under
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
  `ramificationIndex_mul_inertiaDegree`; `natCastValuation` with
  `normalizedValuation_natCast` and `natCastValuation_eq_zero_iff`, and
  `absoluteRamificationIndex` with `absoluteRamificationIndex_eq_natCastValuation`;
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

- **Uniformizers** [Tau Ceti]. `IsUniformizer π`, which is `TauCeti.IsUniformizer`, says
  that `v_K(π) = 1` for the supplied valuation, and one exists
  (`TauCeti.exists_isUniformizer`). It is a predicate and not a component of a package, because an element
  of valuation one is not unique: over `ℚ_2` both `2` and `−2` are uniformizers. A theorem
  that needs a uniformizer takes it, and a theorem whose statement is independent of the
  choice says so. The local-fields-ramification roadmap pins uniformizers through `Irreducible` in
  `𝒪[K]` and proves one direction in `normalizedValuation_irreducible`; the equivalence of
  the two descriptions is the single named lemma `TauCeti.isUniformizer_iff_exists_irreducible`,
  and every later statement uses whichever side is convenient.
- **The level `e = v_K(2)`, consumed.** `e` is the supplier's `natCastValuation K 2`, the
  decoded value `v_K(2)` of the supplied valuation, named `dyadicLevel` here after Tau Ceti's
  `TauCeti.dyadicLevel`. Under the
  standing hypothesis `Invertible (2 : K)` the element `2` is a unit, so `e` is not data,
  and `natCastValuation_eq_zero_iff` says that `e = 0` is exactly odd residue
  characteristic. Nothing is defined here; the supplier's defining equation
  `normalizedValuation_natCast` and that vanishing criterion are what the statements below
  use.

  ⚠ It is deliberately **not** the supplier's `absoluteRamificationIndex K 2`. That name
  is reserved by the supplier for a finite extension of `ℚ_p`, so reading it at `p = 2`
  forces `[Algebra ℚ_[2] K]`, and then `e = 0` — the odd-residue-characteristic case every
  count below splits on — is unsatisfiable rather than merely false. The two agree where
  both are defined, by the supplier's `absoluteRamificationIndex_eq_natCastValuation`, and
  `dyadicLevel_eq_absoluteRamificationIndex` is the single place that comparison is used,
  so that a consumer that already has `K/ℚ_2` may quote either.
- **The square-class dictionary, consumed.** This roadmap takes square classes in
  `Subgroup.square Kˣ`, and both the local-fields-ramification power-class count and the
  profinite-cohomology Kummer isomorphism are stated at `(powMonoidHom n).range`. The
  identification at `n = 2` is the supplier's `square_eq_range_powMonoidHom`, and it is
  what lets the counts below rest on the supplier's theorem and Layer 7A's Kummer
  isomorphism be stated on square classes.
- **The local square theorem, consumed in its sharp form** (O'Meara 63:1). With
  `e = v_K(2)`, `U(K, 2e+1) ⊆ (Kˣ)²`, and the bound is sharp:
  `U(K, 2e) ⊄ (Kˣ)²`. Both halves are the supplier's, against the supplied filtration and
  in the generality 6B's classification of unit defects needs:
  `unitFiltration_le_range_powMonoidHom_two` and
  `not_unitFiltration_le_range_powMonoidHom_two`. Those two carry `[Algebra ℚ_[2] K]`,
  which the odd-residue-characteristic branch cannot satisfy. The general shape 6B and 6C
  consume, stated against `dyadicLevel` and valid in both residue characteristics, is Tau
  Ceti's `TauCeti.unitFiltration_le_square` and `TauCeti.not_unitFiltration_le_square`,
  consumed here as `unitFiltration_le_square` and `not_unitFiltration_le_square`. 6B needs
  the sharpness and not only the containment, because a defect list built on a depth that
  is not attained would classify nothing.
- **The square-class counts, consumed in the `4 · q^e` form 6D uses.** `Kˣ/(Kˣ)²` is
  finite, which is a separate statement from its order. The order is
  `card_squareClasses_of_isUnit`, that is `4`, when the residue
  characteristic is odd, and `card_squareClasses_dyadic`, that is `4 · q^e` with
  `q = #𝓀[K]` and `e = v_K(2)`, when the residue
  characteristic is `2`. For a finite extension of `ℚ_2` of degree `N = e·f` the second
  reads `2^{N+2}`, and over `ℚ_2` it reads `8`. Both are the supplier's count
  `#(Kˣ/(Kˣ)ⁿ) = n · #μ_n(K) · q^{v_K(n)}` at `n = 2`, where `#μ_2(K) = 2` because `2` is
  invertible. In the `dyadicLevel` shape 6D consumes, the odd count is Tau Ceti's
  `TauCeti.card_squareClass_of_odd`, consumed here as `card_squareClass_of_odd`; the
  supplier states the dyadic half relative to `ℚ_2`, so its `dyadicLevel` shape is frozen
  here as `card_squareClass_of_dyadic`. What is stated here, and is not the supplier's, is the
  choice of representatives: for odd residue characteristic the four classes are
  represented by `1, u, π, uπ`, where `u` is a unit whose residue is a nonsquare. That
  choice of `u` is part of the statement and is never left implicit.
- **The graded pieces, consumed.** The carrier is the local-fields-ramification roadmap's
  `UnitFiltrationGraded`. That roadmap's Layer 1 milestone *Graded pieces* owns the two
  isomorphisms `U(K,0)/U(K,1) ≃* 𝓀[K]ˣ` and `U(K,i)/U(K,i+1) ≃* 𝓀[K]⁺` for `i ≥ 1` and
  exports no target signature for them, so the shape 6B consumes is frozen here as
  `nonempty_unitFiltrationGraded_zero_equiv` and
  `nonempty_unitFiltrationGraded_succ_equiv`, on that carrier. ⚠ The depth-zero piece is
  multiplicative and the deeper pieces are additive, and the two statements stay apart.
  6B needs the additive form: the classification of unit defects improves an approximation
  `u = 1 + ε` with `v_K(ε) = d` by writing the residue of `ε` as a square, which is
  possible exactly because the piece is `𝓀[K]⁺` and a finite field is perfect.
- **The unramified quadratic extension, in the norm-equation form 6B and 6C consume.**
  There is a nonsquare unit `Δ` such that `K(√Δ)/K` is the unramified quadratic extension,
  and `b` is a norm from it exactly when `v_K(b)` is even; equivalently every unit is a
  norm and a uniformizer is not. The local-fields-ramification roadmap owns the unramified extension
  and the norm group, and states the criterion at `mem_normGroup_iff_dvd_normalizedValuation`,
  namely `x ∈ normGroup L/K ↔ f ∣ v_K(x)`; at `f = 2` that is the parity condition above.
  What this statement adds is the passage to the norm equation `b = x² − Δ y²`, which is
  the shape 6B's evaluation formula and 6C's symbol computation apply, and which needs no
  extension-building API. Both halves are frozen: `exists_unramified_class` for existence,
  with `Δ` of even valuation so that it is a unit up to squares, and
  `unramified_class_unique` for uniqueness, which says that the norm criterion pins `Δ` to
  a single square class. Uniqueness is not decoration: 6B's ramification dictionary says
  that exactly one unit square class has defect `4𝒪[K]`, and that is a statement about a
  class and not about a chosen element.

Basic API for the objects introduced here:

- constructors: `IsUniformizer`, which is Tau Ceti's, and `q = Nat.card 𝓀[K]`; `e` is the
  supplier's `natCastValuation K 2`, named `dyadicLevel` here and constructed there;
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
milestone depends on it, and it rests on the single coefficient comparison
`localSymbol_eq_zero_iff_cup` together with Layer 7C's
`cup_kummerClass_eq_zero_iff_hilbertSymbol`. The frozen `hilbertSymbol_productFormula` then
translates `ClassFieldTheory.hilbertProductFormula` into multiplicative signs.

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
   This is Layer 2's four-fold criterion, specialized. Square-class invariance in each
   argument is `hilbertSymbol_congr_sq`, and it holds over any field, directly from the
   norm equation.
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
   `q ≅ ⟨a₁,…,aₙ⟩`. It is well defined by Layer 0's descent principle, whose two step
   hypotheses are Layer 3's chain-induction lemmas with `M = ℤˣ`. Symmetry and
   bilinearity are items 3 and 5. The binary condition `(a,b)_K = (c,d)_K` for
   `⟨a,b⟩ ≅ ⟨c,d⟩` follows from Layer 3's binary quaternion lemma and from item 2. The
   rank-one hypothesis holds because in rank one the product is empty, so both sides are
   `1`. The two formulas of Layer 5 hold here in `{±1}`.
8. **The symbol on a square-class basis: units against a uniformizer.** Fix a uniformizer
   `π`. Then `Kˣ = π^ℤ × 𝒪[K]ˣ`, so by bimultiplicativity and square-class invariance the
   symbol is determined by three families of values, and each is stated as its own
   theorem, valid in **every** residue characteristic:
   - `(u, u')_K` for units `u, u'`;
   - `(u, π)_K` for a unit `u`;
   - `(π, π)_K = (π, −1)_K`, which is `hilbertSymbol_self`, from `(a, −a)_K = +1` and
     bimultiplicativity. It fixes the diagonal, and it is why no separate convention for
     `(π,π)` is needed.

   Two field-general inputs make the three rules into a table: item 2's
   `hilbertSymbol_congr_sq`, and `hilbertSymbol_neg_self`, that is `(a, −a)_K = +1` with
   the witness `−a = 0² − a·1²`.
9. **The closed formula in odd residue characteristic**, for a general nonarchimedean
   local field and not only for `ℚ_p`. Let `χ` be the quadratic residue character of
   `𝓀[K]`, pulled back to `𝒪[K]ˣ` through reduction; by Hensel's lemma `χ(u) = +1`
   exactly when `u` is a square in `Kˣ`, and the two spellings are interchangeable. Then,
   for `e = 0`:
   - `(u, u')_K = +1` for units `u, u'`, which is Hensel's lemma;
   - `(u, π)_K = χ(ū)`;
   - `(π, π)_K = (π, −1)_K = χ(−1) = (−1)^{(q−1)/2}` with `q = #𝓀[K]`.

   Hence for `a = π^α u` and `b = π^β u'`:

   ```text
   (a,b)_K = (−1)^{αβ (q−1)/2} · χ(ū)^β · χ(ū')^α .
   ```

   At `K = ℚ_p` with `π = p` and `χ = legendreSym` this is Serre III Thm 1,
   `(a,b) = (−1)^{αβ ε(p)} (u|p)^β (v|p)^α` with `ε(p) = (p−1)/2 mod 2`, which consumes
   `legendreSym` and `TauCeti/NumberTheory/LegendreSymbol/SquareClass.lean`.
10. **The closed formula over `ℚ_2`** (Serre III Thm 1). For `a = 2^α u`, `b = 2^β v` with
    `u, v ∈ ℤ_2ˣ`:

    ```text
    (a,b)_{ℚ_2} = (−1)^{ε(u)ε(v) + α ω(v) + β ω(u)} ,
    ```

    with `ε(u) = (u−1)/2 mod 2` and `ω(u) = (u²−1)/8 mod 2`, both functions of `u mod 8`
    and both read off `PadicInt.toZModPow 3`: on the odd residues `1, 3, 5, 7` they are
    `ε = 0,1,0,1` and `ω = 0,1,1,0`. The two auxiliary functions are pinned as real data,
    because they *are* the convention. ⚠ The exponent is computed in `ZMod 2` and only
    then turned into a sign.
11. **A finite dyadic extension.** There is no closed formula of Serre's shape for a
    general finite extension of `ℚ_2`. What determines the symbol completely, and is
    stated in its place, is that it is a **nondegenerate symmetric `𝔽₂`-bilinear form**
    on the finite group `Kˣ/(Kˣ)²`, whose order is 6A's `4·q^e = 2^{[K:ℚ_2]+2}`:
    - symmetry is item 3 and bilinearity is item 5;
    - well-definedness on square classes is `hilbertSymbol_congr_sq`;
    - nondegeneracy is item 7, in the square-class form
      `exists_hilbertSymbol_eq_neg_one_squareClass`;
    - the value against the unramified class is the closed
      `(Δ, b)_K = (−1)^{v_K(b)}` of 6B, which fixes one basis vector outright;
    - every remaining value is decided by 6B's defect computation, through the norm-group
      description `U(K, 2e−d+1) ⊆ N(K(√a)ˣ)` and `U(K, 2e−d) ⊄ N(K(√a)ˣ)` for a unit `a`
      of defect exponent `d`.

    So the symbol over a finite dyadic `K` is a finite table, determined by the items
    above, and the deliverable is that table for `ℚ_2` together with the general
    determination for `K/ℚ_2`.
12. **The `8 × 8` table over `ℚ_2`** on the representatives `{±1, ±5, ±2, ±10}`, as a
    family of decidable computations. The table is the test that the dyadic formula is
    correct. Its content is the Gram matrix on the `𝔽₂`-basis `{−1, 2, 5}` of
    `ℚ_2ˣ/(ℚ_2ˣ)²`, in which `+1` is written `0` and `−1` is written `1`:

    ```text
            −1   2   5
      −1     1   0   0
       2     0   0   1
       5     0   1   0
    ```

    that is `(−1,−1) = −1` and `(2,5) = −1`, with every other basis pairing `+1`. The
    matrix is nondegenerate over `𝔽₂`, which is item 7 read on this basis.
13. **The symbol is the mod-2 specialization of the CFT pairing.** Class Field Theory
    builds `localSymbol` from `kummerClass`, `kummerCupPairing`, and the arithmetic
    invariant on `H²(G_K, μ₂)`, and proves the corresponding local duality pairing
    perfect. The milestone `hilbertSymbol_eq_cohomological` says that it agrees with
    `hilbertSymbol` after the dictionary `0 -> +1`, `1 -> -1`. It is stated after Layer
    7C, because the comparison runs through the Kummer cup--norm theorem, and its only
    input is `localSymbol_eq_zero_iff_cup`, the comparison of Class Field Theory's
    `μ₂`-coefficient cup with Layer 7A's.
14. **The global product formula is inherited.** Apply the sign dictionary to
    `ClassFieldTheory.hilbertProductFormula`. The resulting frozen declaration
    `hilbertSymbol_productFormula` is an export to `GlobalQuadraticForms`, not a local-
    global classification theorem here.
15. **The two Hasse invariants agree**, which is stated after Layer 6D as sublayer 6E,
    because it consumes the classification.

Basic API:

- constructors: `hilbertSymbol`, `localHasse`, and the two `ℚ_2` sign functions `serreEps`
  and `serreOmega`, which are real data;
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
Equivalently, the usual embedding in `ℚ/ℤ` carries `[D]` to `1/2`. So, as an equality of
signs and not only as an equivalence of vanishings,

```text
(a,b)_K = hilbertSign (localSymbol (a) (b)),
```

which is the frozen `hilbertSymbol_eq_cohomological`, with `hilbertSign` the dictionary
`0 ↦ +1`, `1 ↦ −1`. The equality is what is stated: the equivalence
`localSymbol (a) (b) = 0 ↔ (a,b)_K = +1`, which is `localSymbol_eq_zero_iff_cup` composed
with `cup_kummerClass_eq_zero_iff_hilbertSymbol`, determines the sign only once one knows
the target has two elements, and a consumer that needs the sign should not have to reprove
that. So the vanishing statement is the milestone and the sign statement is its
consequence.

**Compatibility with the cup product** at the same normalization is then one step. By
Layer 7B's `ι [(a,b)] = (a) ∪ (b)` and Milestone 1's `ε (hasseInvariant q) = localHasse q`,
the composite `ε ∘ ι⁻¹` carries `(a) ∪ (b)` to `(a,b)_K`; in particular `(a) ∪ (b) = 0`
exactly when `(a,b)_K = +1`, which is Layer 7C's
`cup_kummerClass_eq_zero_iff_hilbertSymbol`, and the sign attached to a nonzero cup is
fixed by the displayed equality. No further normalization convention is introduced
anywhere in Layers 6 to 9.

The Hasse invariant of a form is the local invariant of its Brauer class. The
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
  `f2Pairing`, and `evensNormIndexTwo` with `evensConj`, which Layer 9 consumes through
  the Galois-side declarations of the contract table;
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
  `galoisEvens`, the choice-free conjugate `galoisConj`, the character `galoisCharacter`
  of a quadratic extension, the Evens identities

  ```text
  res (N x)   = x ∪ σ·x
  N (x + y)   = N x + N y + cor (x ∪ σ·y)
  N (res y)   = y ∪ y + χ_{L/K} ∪ y
  ```

  the kernel of restriction in degree two, functoriality in a tower `M/L/K`, and
  independence of the embedding. None of that is rebuilt here. ⚠ The conjugate is not
  optional: the cross term of the quadratic expansion is a cup with `σ·y` and not with
  `y`. What is left for this sublayer is the part that mentions this roadmap's own notions:
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
  every statement below uses;
- **[Profinite Cohomology, Layers 0, 2, 3 and 4]** `Invariants`, the explicit
  inhomogeneous complex `Z2`, `B2`, `H2` with `H2pi` and `DiscreteH2`, the comparison
  `explicitH2IsoContinuousCohomology` with the canonical carrier, and the degree-two
  finite-quotient system `explicitFiniteQuotientSystem2` with its cocone
  `explicitFiniteQuotientCocone2`, legs `explicitFiniteQuotientComparison2` and
  universality `explicitFiniteQuotientColimit2`. Milestone 2's eighth item is stated
  entirely against these; nothing here rebuilds them.

Milestones:

1. **A finite Galois splitting field.**
   - `exists_finiteSeparable_splittingField`: `A` is split by a finite separable
     subextension of `Kˢ/K`. The mathematics is SSA Layer 6's; that roadmap states the
     milestone in prose and exports no target signature, so the shape consumed here is
     frozen under this name, and the contract table gains a row when the signature
     exists. The field is produced **inside** `Kˢ`, because Layer 7A's passage from
     `L/K` to the open subgroup `G_L ≤ G_K` is indexed by a `K`-embedding into `Kˢ`;
   - `exists_finiteGalois_splittingField`: the Galois closure of that field is finite
     Galois and still splits `A`, because an extension of a splitting field splits `A`.
     This is a target here and not an assumption: the crossed-product construction
     indexes its cocycle by `Gal(L/K)`, and a merely separable splitting field has no
     such group.
2. **The crossed-product package.** The comparison is a piece of mathematics, so it is
   built from eight separately citable theorems and not from one step. Each is a
   milestone, and each is reusable on its own: a consumer that needs only "cohomologous
   cocycles have the same class" cites that one statement. (Gille-Szamuely 4.4, Serre
   *Local Fields* X.)

   1. **The crossed-product algebra of a cocycle.** `TwoCocycle K L` is a
      `c : Gal(L/K) × Gal(L/K) → Lˣ` with `σ(c(τ,ρ)) · c(σ,τρ) = c(σ,τ) · c(στ,ρ)`; the
      inhomogeneous normalization is pinned there, because the opposite one inverts the
      comparison. `CrossedProduct L c` is the free `L`-module on symbols `u_σ`, with
      `u_σ · x = σ(x) · u_σ` (`basis_mul_inc`) and `u_σ · u_τ = c(σ,τ) · u_{στ}`
      (`basis_mul_basis`); the cocycle identity is exactly associativity. Its carrier is
      pinned as data, so that these two equations and
      `finrank : dim_K (L,G,c) = [L:K]²` are statable. The theorem of the item is that it
      is central simple over `K`, which is what makes `crossedProductClass` well formed.
   2. **Cohomologous cocycles give Brauer-equivalent algebras.** `Cohomologous z w` is
      `w(σ,τ) = z(σ,τ) · σ(b τ) · b(στ)⁻¹ · b(σ)` for some `b : Gal(L/K) → Lˣ`, and
      `crossedProductClass_eq_of_cohomologous` is the implication.
   3. **Multiplication of cocycles is tensor product of algebras.**
      `crossedProductClass_mul`: the pointwise product of two cocycles presents the
      product of the two Brauer classes. This is what makes the comparison a
      homomorphism, and it is where the normalization of item 1 is felt.
   4. **The cocycle of a split algebra with chosen descent data.**
      `cocycleOfSplitting` takes a finite Galois `L/K` splitting `A` and a chosen
      `L`-algebra isomorphism `φ : L ⊗_K A ≅ M_n(L)`. Each `σ ∈ Gal(L/K)` moves `φ` by a
      `σ`-semilinear automorphism of `M_n(L)`, Skolem-Noether makes that automorphism
      inner, and the chosen conjugators multiply up to the cocycle. This is the only step
      of the comparison that uses Skolem-Noether.
   5. **Independence of the splitting field and of the choices.**
      `cohomologous_cocycleOfSplitting`: two choices of `φ` over the same `L` give
      cohomologous cocycles, because the conjugators of item 4 are determined only up to
      `Lˣ`. `TwoCocycle.comap` inflates a cocycle along a compatible pair — a
      homomorphism `Gal(M/K) → Gal(L/K)` and an embedding `L → M` intertwining it, the
      pair that matters being `AlgEquiv.restrictNormal` with the inclusion for
      `K ⊆ L ⊆ M` — and `crossedProductClass_comap` says the class is unchanged. ⚠ The
      intertwining hypothesis is carried in the type of `comap`: without it the inflated
      function is not a cocycle at all.
   6. **Every Brauer class is obtained.** `exists_galoisCocycle_brauerClass_eq`:
      surjectivity, composing item 1(b) with item 4. `GaloisCocycle K` bundles a finite
      Galois subextension of `Kˢ/K` with a cocycle of its Galois group, so that the
      statement quantifies over a splitting field without quantifying over instances.
   7. **The two maps are mutually inverse.**
      `crossedProductClass_cocycleOfSplitting`: the cocycle attached to a splitting of
      `A` presents `A`. `cohomologous_of_crossedProductClass_eq`: equal crossed-product
      classes over the same `L` come from cohomologous cocycles, which is injectivity,
      and Hilbert 90 for a finite Galois `L/K` is its input.
   8. **Inflation into continuous cohomology.** Items 1 to 7 produce cocycles of the
      finite groups `Gal(L/K)`, while milestone 3 is a statement about
      `H²_cont(G_K, Kˢˣ)`. This item is the whole of the passage between them, and it is
      the only place in the roadmap where they meet.

      `TwoCocycle.inflate` is `TwoCocycle.comap` at the pair
      `(AlgEquiv.restrictNormalHom L, L ⊆ Kˢ)`, whose intertwining hypothesis is
      Mathlib's `AlgEquiv.restrictNormal_commutes`; it turns a cocycle of `Gal(L/K)` into
      one of `G_K`. `unitsCochain` reads that cocycle in the profinite-cohomology
      roadmap's coefficient module `UnitsCoeff K`, which *is* `Additive Kˢˣ`, so the
      translation between this roadmap's multiplicative convention and the supplier's
      additive one is `Additive.ofMul` and nothing else. `unitsCochain_isCocycle₂` says
      that the normalization pinned in item 1 is exactly Mathlib's
      `groupCohomology.IsCocycle₂`, which is what makes the comparison sign-correct.
      `continuous_unitsCochain_inflate` is continuity: the cochain factors through the
      discrete finite `Gal(L/K)`, so ⚠ finiteness of `L/K` is used here and the same
      formula over an infinite normal subextension is a cocycle but not a continuous one.
      `inflateTwoCocycleZ2` is the resulting element of the supplier's `Z2`,
      `unitsClassOfZ2` its class, taken through the supplier's `H2pi` and
      `explicitH2IsoContinuousCohomology` and through nothing else, and
      `inflateTwoCocycleClass` the composite, with `GaloisCocycle.inflateClass` its
      bundled form.

      Three theorems pin that class. `inflateTwoCocycleClass_eq_of_cohomologous`:
      cohomologous cocycles inflate to the same class, because the inflation of the
      coboundary of `b : Gal(L/K) → Lˣ` is the coboundary of the continuous `1`-cochain
      `g ↦ b(g|_L)`. This is stated independently of milestone 3, so that the right-hand
      side of the comparison equation is known to be a function of the class of `z`
      without assuming the comparison exists. `inflateTwoCocycleClass_comap`: refining
      the splitting field does not change the class — in fact `TwoCocycle.inflate_comap`
      says it does not change the cocycle, and the reason is
      `restrictNormalHom_of_comap`, that a compatible pair whose embedding is the
      inclusion inside `Kˢ` computes the restriction homomorphism. ⚠ That hypothesis on
      the embedding cannot be dropped: composing it with a nontrivial element of
      `Gal(M/K)` gives another compatible pair for which the conclusion is false.
      `inflateTwoCocycleClass_eq_finiteQuotientComparison`: the class is the image of
      `finiteLevelClass` under the profinite-cohomology roadmap's degree-two comparison
      leg `explicitFiniteQuotientComparison2`, at the open normal subgroup
      `galoisOpenNormal K L = Gal(Kˢ/L)` with quotient `galoisQuotientMap K L` onto
      `Gal(L/K)` and invariant coefficients `Invariants`. Without it, inflation here and
      the legs of that roadmap's finite-quotient cocone would be two unrelated maps into
      `H²_cont(G_K, Kˢˣ)`.

      **Exhaustion.** `exists_galoisCocycle_inflateTwoCocycleZ2` says that every
      continuous `2`-cocycle is, on the nose and with no coboundary subtracted, inflated
      from a finite Galois subextension. It is the profinite-cohomology roadmap's Layer 4
      strict descent of a continuous `2`-cocycle — the form with no coboundary subtracted,
      which is what makes this an equality of cocycles — read at `G = G_K` and
      `M = UnitsCoeff K` alongside that roadmap's `explicitFiniteQuotientColimit2` at the
      same data, together with Mathlib's infinite Galois correspondence, which presents
      the resulting open normal subgroup of `G_K` as `Gal(Kˢ/L)` for the finite Galois
      `L = (Kˢ)^U`; it is not an independent existential. ⚠ Compactness of `G_K`, and not
      total disconnectedness alone, is what descends a cocycle in both variables at once.
      Composing it with `unitsClassOfZ2_surjective`, which is the isomorphism half and
      needs no descent, gives `exists_galoisCocycle_inflateClass`: every class of
      `H²_cont(G_K, Kˢˣ)` is `GaloisCocycle.inflateClass` of some bundled cocycle. This
      is the cohomological twin of item 6.
3. **The comparison isomorphism**

   ```lean
   Additive (BrauerGroup K) ≃+ H²_cont (G_K) (Additive Kˢˣ)
   ```

   assembled from milestone 2. Multiplication of Brauer classes goes to addition of
   cohomology classes, which is what `≃+` records.

   The equivalence is not the milestone on its own. What determines it is
   `brauerCohomologyEquiv_crossedProductClass`: on the class of the crossed product of a
   cocycle `z` of a finite Galois `L ⊆ Kˢ`, its value is `inflateTwoCocycleClass K L z`,
   with `brauerCohomologyEquiv_galoisCocycle_brauerClass` the bundled form. That equation
   is consistent because both sides descend to cohomology classes (items 2.2 and 2.8) and
   both are unchanged by refining `L` (items 2.5 and 2.8); and it is rigid, because
   `exists_galoisCocycle_brauerClass_eq` reaches every Brauer class by a crossed product,
   which is what `brauerCohomologyEquiv_unique` proves. A named equivalence carrying no
   such equation is not this milestone.
4. **The 2-torsion comparison**

   ```lean
   Br₂ K := MonoidHom.ker (powMonoidHom 2 : BrauerGroup K →* BrauerGroup K)
   ι : Additive ↥(Br₂ K) ≃+ H²_cont (G_K) 𝔽₂
   ```

   obtained from milestone 3 and from `h2MuToUnits`, whose image is the 2-torsion. In
   prose this is `ι : Br(K)[2] ≃ H²(G_K, μ₂)`. Both maps are named definitions, and the
   square `h2MuToUnits ∘ ι = (the comparison) ∘ (the inclusion of the 2-torsion)` is the
   theorem `brauer2EquivH2_h2MuToUnits`. Since `h2MuToUnits` is injective that square
   determines `ι`, which is `brauer2EquivH2_unique`; so `ι` carries no normalization of
   its own, and every statement about it below is derived from that square together with
   the corresponding statement about the comparison of milestone 3. An unnamed
   equivalence, or the bare existence of an injection, is not this milestone.
5. **Base-change naturality.** For `L/K` finite separable, the square that compares
   `ι_K` with `ι_L` along base change of algebras and restriction of cohomology classes
   commutes. Its Lean form needs the base-change homomorphism
   `BrauerGroup K → BrauerGroup L` of the semisimple-algebras roadmap, which that
   roadmap states in prose.
6. **The symbol as a cup product.** `ι [(a,b)] = (a) ∪ (b)`, the cup being the supplied
   `cup` at the canonical `𝔽₂` pairing and the classes being Layer 7A's Kummer classes.
   The computation is made once, on the comparison of milestone 3, as
   `brauerCohomologyEquiv_quaternionClass`; `brauer2EquivH2_quaternionClass` is then a
   consequence of it and of the square of milestone 4, by injectivity of `h2MuToUnits`.
   Its proof is the cyclic computation below, reached through
   `brauerCohomologyEquiv_crossedProductClass` at the cocycle of `K(√a)/K` whose only
   nontrivial value is `b`.
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

- constructors: `TwoCocycle` with `TwoCocycle.ext`, `Cohomologous`, `CrossedProduct` with
  `inc` and `basis`, `crossedProductCSA`, `crossedProductClass`, `TwoCocycle.comap`,
  `TwoCocycle.inflate`, `unitsCochain`, `inflateTwoCocycleZ2`, `unitsClassOfH2`,
  `unitsClassOfZ2`, `inflateTwoCocycleClass`, `galoisOpenNormal`, `galoisQuotientMap`,
  `finiteLevelZ2`, `finiteLevelClass`, `GaloisCocycle` with `brauerClass` and
  `inflateClass`, `cocycleOfSplitting`, `brauerCohomologyEquiv`, and `ι`;
- examples: `ι [(a,−a)] = 0`; `ι [(a, 1−a)] = 0`;
- morphisms: the comparison isomorphism itself, and its restriction to 2-torsion;
- functoriality: compatibility with base change along a finite separable `L/K`, that is
  `ι_L ∘ (base change) = res ∘ ι_K` on 2-torsion;
- comparison lemmas: the crossed-product class against the cocycle;
  `brauerCohomologyEquiv_crossedProductClass` and its bundled form
  `brauerCohomologyEquiv_galoisCocycle_brauerClass`, which determine the comparison; `ι`
  against `h2MuToUnits`; `inflateTwoCocycleClass_eq_finiteQuotientComparison`, which
  identifies inflation with the supplier's finite-quotient comparison leg;
- uniqueness: `brauerCohomologyEquiv_unique` and `brauer2EquivH2_unique`, so that the
  two comparisons carry one normalization between them;
- surjectivity: `exists_galoisCocycle_brauerClass_eq` on the Brauer side and
  `exists_galoisCocycle_inflateClass` on the cohomological side, the latter through
  `unitsClassOfZ2_surjective` and `exists_galoisCocycle_inflateTwoCocycleZ2`;
- invariance: `inflateTwoCocycleClass_eq_of_cohomologous` and
  `inflateTwoCocycleClass_comap`, with `TwoCocycle.inflate_comap` and
  `restrictNormalHom_of_comap` behind the second;
- naturality: `ι` carries multiplication to addition, which is milestone 7;
- edge cases: a split algebra, whose class is `0`; `a` a square, where the cyclic
  computation degenerates;
- downstream interfaces: Layer 7C's cup-norm theorem and Layer 8's identity
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
  The first three follow from the cup-norm theorem through Tau Ceti's splitting criterion
  (`nonempty_algEquiv_matrix_iff_exists_eq_sq_sub_mul_sq` and its siblings), and
  `Suggested.lean` proves them that way.
- Corollaries: `(a) ∪ (1−a) = 0` for `a : Kˣ` with `1 − a ≠ 0`, from Layer 2's algebra
  splitting; `(a) ∪ (−a) = 0`; and bilinearity of the cup product as a restatement of
  Layer 5's bimultiplicativity, which is the supplied `cup_add_left` and `cup_add_right`
  read through the Kummer isomorphism.

### Layer 8: Stiefel-Whitney classes

Prerequisites:

- **[Tau Ceti]** the descent principle `TauCeti.RegularFormClass.liftDiagonal`, the class
  `formClass` with `formClass_eq_iff`, `isSquare_prod_mul_prod_of_equivalent`, and the
  chain-induction lemmas of `Diagonal/Chain/Induction.lean`;
- **[Layer 3]** the discriminant;
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
  definitions above satisfy the three hypotheses of Layer 0's descent principle, each a
  named statement:
  - for `w₁` (`sw1_permutationStep`, `sw1_binaryStep`, `sw1_rankOne`): `w₁` of a tuple is
    the Kummer class of its discriminant (`sw1_eq_kummerSquareClassEquiv`), and equivalent
    tuples of any rank have discriminants in the same square class
    (`TauCeti.isSquare_prod_mul_prod_of_equivalent`). In rank one the hypothesis is
    `(a) = (b)` whenever `a * b` is a square, and it does not follow from the two step
    conditions, since no chain joins `⟨a⟩` to `⟨b⟩`;
  - for `w₂` (`sw2_permutationStep`, `sw2_binaryStep`, `sw2_rankOne`): permutation
    invariance is the symmetry of the cup (`cup11_comm`); the binary step is the cup identity
    `(a)(b) = (c)(d)` for `⟨a,b⟩ ≅ ⟨c,d⟩`, which is Layer 7C applied to Tau Ceti's binary
    criterion, fed to Tau Ceti's `BinaryStep.prod_prod_Ioi_eq`; and in rank one both sides
    are the empty sum `0`.

  By the descent principle they therefore descend to **named functions `w₁` and `w₂` on
  `RegularFormClass K`**, `sw1Class` and `sw2Class`, agreeing with the tuple-level
  definitions on every presentation (`sw1Class_mk`, `sw2Class_mk`).
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
  against `d` and not against `d±` (`sw1Class_eq_discr`);
- naturality: the descent of `w₁` and `w₂` along `Quotient.mk`, and their invariance under
  `QuadraticMap.Equivalent`;
- edge cases: rank `0`, where both classes vanish; rank `1`, where `w₁⟨a⟩ = (a)` depends
  only on the square class of `a` and `w₂⟨a⟩ = 0`; a hyperbolic form; `a` a square, where
  `(a) = 0`;
- downstream interfaces: Layer 9's relative Stiefel-Whitney formula, which is stated on
  the descended `w₁` and `w₂`.

### Layer 9: transfer and the relative Stiefel-Whitney formula

Prerequisites:

- **[Mathlib]** `LinearMap.compQuadraticMap'`, `Algebra.trace`, `Algebra.traceForm`,
  `traceForm_nondegenerate`, `LinearMap.BilinMap.toQuadraticMap`, `Algebra.norm`,
  `Algebra.trace_eq_sum_embeddings`, `Algebra.IsQuadraticExtension` with
  `Algebra.IsQuadraticExtension.sq_eq_trace_smul_sub_norm`, `Matrix` with `Matrix.map`,
  `DihedralGroup`, `orderOf_eq_prime_pow`, `IsSepClosed`;
- **[Tau Ceti]** `TauCeti/NumberTheory/EffectiveBounds/TraceForm.lean` and
  `TauCeti/FieldTheory/Trace`, in particular
  `TauCeti.Algebra.trace_eq_zero_of_sq_algebraMap_of_not_mem_range`;
  `Algebra.IsQuadraticExtension.norm_algebraMap_add_algebraMap_mul` and
  `trace_algebraMap_add_algebraMap_mul` of `TauCeti/RingTheory/Norm/Quadratic`;
  `TauCeti.hyperbolicPlane` and `TauCeti.exists_hyperbolicPlane_prod_equivalent` of
  `TauCeti/LinearAlgebra/QuadraticForm/Hyperbolic`; the class `TauCeti.formClass` with
  `formClass_mk`, and the discriminant `TauCeti.RegularFormClass.discr` with
  `TauCeti.discr_formClass`, of `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass`; the
  normal form `Algebra.IsQuadraticExtension.exists_eq_algebraMap_add_algebraMap_mul` of
  `TauCeti/LinearAlgebra/Dimension/IsQuadraticExtension`; `TauCeti.dihedralHom` with
  `dihedralHom_r` and `dihedralHom_sr` of `TauCeti/GroupTheory/SpecificGroups/Dihedral/Basic`;
  `TauCeti.mem_galoisSubgroup_iff`; `TauCeti.kummerCocycle` with
  `TauCeti.kummerMap_eq_kummerCocycleClass`; and the Cartan-Dieudonné theorem
  `TauCeti.QuadraticMap.exists_reflectionOrthogonal_list_prod_eq` of
  `TauCeti/LinearAlgebra/QuadraticForm/CartanDieudonne`;
- **[Layer 1]** to **[Layer 4]** for the form theory and the Witt ring;
- **[Layer 7A]** the carriers for `K` and for `L`, the Kummer class with
  `kummerSquareClassEquiv`, and `galoisRes_kummerClass`, `galoisCor_kummerClass`;
- **[Layer 7C]** `cup_kummerClass_eq_zero_iff`, for the vanishing of `(t) ∪ (−t)`,
  `(2) ∪ (−1)` and `(d) ∪ (N a)`;
- **[Layer 8]** the Stiefel-Whitney classes, with `sw1Class_eq_discr` and `sw2Class_mk`;
- **[Profinite Cohomology, Layer 9]** `galoisSubgroup`, `galoisSubgroup_index`,
  `galoisSubgroupEquiv`, `galoisF2Iso`, `galoisRes`, `galoisCor`, `galoisEvens`,
  `galoisConj`, `galoisCharacter`, with `galoisRes_galoisCor`, `galoisConj_evensConj`,
  `galoisCor_cup`, `galoisRes_galoisEvens`, `galoisEvens_add`, `galoisEvens_galoisRes`,
  `galoisRes_eq_zero_iff`, and the three embedding-independence theorems, which together
  are the transfer along `L/K`; every statement about the norm, the conjugate or the
  character needs `[L : K] = 2`;
- **[Profinite Cohomology, Layers 1, 3 and 13]** the class of an explicit cocycle,
  `cochainClass` with `cochainClass_eq_of_sub_eq_d`, `inhomogeneousCochain2`,
  `inhomogeneousCochain2_d_eq_zero` and `cochainClass_inhomogeneousCochain2_eq_of_coboundary`;
  the class `homClass` of a continuous homomorphism, with `homClass_eq_cochainClass`; the
  explicit Kummer comparison `explicitIso_kummerMap` with `explicitIso_coeffMap`; and, for an
  open subgroup of index exactly two,
  `evensNormIndexTwo` with `evensConj`, `evensConj_eq_conjMapOf` and the pullback formula
  `evensNormIndexTwo_eq_ind_pullback`, stated through the model `WreathC2` of `C₂ ≀ C₂`
  with its coordinates, `wreathSection`, `dihedralToWreath`, `wreathD16Cocycle`,
  `wreathD16Cocycle_isCocycle`, `indexTwoInd` and `continuous_wreathD16Cocycle_indexTwoInd`;
- **[Profinite Cohomology, Layers 8 and 12]** `cup` at `f2Pairing` with `cup_gradedComm`,
  and `explicitIso_cup`.

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
  forms `Tr_*⟨a⟩` for `a : Lˣ` are the objects that Kahn's theorem evaluates. Tau Ceti's
  `TauCeti/LinearAlgebra/QuadraticForm/Transfer/` builds the same transfer as
  `QuadraticMap.scharlauTransfer`, with the form first, so that `q.scharlauTransfer s` is
  this roadmap's `scharlauTransfer s q`, together with `traceTransfer`, `traceTransfer_sq`
  (the transfer of the unit line is the trace form) and
  `equivalent_traceTransfer_sq_weightedSumSquares_of_sq` (`⟨2, 2d⟩` for every `L` with
  `[L : K] = 2`, `x ∉ K` and `x² = d`). It landed after this repository's Tau Ceti pin, so
  the statements here keep this roadmap's spelling; when the pin moves past it, they are to
  consume it by alias.
- **The twisted trace form.** For `L = K(x)` with `x ∉ K` and `x² = d`, and `a : Lˣ`:
  - in square-root coordinates `N(u + v x) = u² − v² d` (`norm_add_mul_of_sq`, proved in
    `Suggested.lean`) and `Tr(u + v x) = 2u`. These are Tau Ceti's
    `Algebra.IsQuadraticExtension.norm_algebraMap_add_algebraMap_mul` and
    `trace_algebraMap_add_algebraMap_mul` at `Tr x = 0`
    (`TauCeti.Algebra.trace_eq_zero_of_sq_algebraMap_of_not_mem_range`) and `N x = −d`,
    which Mathlib's `Algebra.IsQuadraticExtension.sq_eq_trace_smul_sub_norm` gives from
    `x² = d`;
  - **Kahn's basis.** If `Tr a ≠ 0`, then `1` and `x/a` are orthogonal for `Tr_*⟨a⟩`,
    because `Tr(a · x/a) = Tr x = 0`, and their values are `Tr a` and
    `Tr(d/a) = d · Tr a / N a`; they are independent, because `x/a ∈ K` would put `a` in
    `K x` and force `Tr a = 0`. So `Tr_*⟨a⟩ ≅ ⟨Tr a, d · Tr a / N a⟩`
    (`traceTransfer_weightedSumSquares_equivalent`). ⚠ The hypothesis `Tr a ≠ 0` is
    load-bearing: at `Tr a = 0` both entries vanish, and the form is not `⟨0, 0⟩`;
  - if `Tr a = 0`, then `Tr_*⟨a⟩(1) = 0`, so the regular binary form is isotropic.
    Tau Ceti's `TauCeti.exists_hyperbolicPlane_prod_equivalent` splits off a hyperbolic plane
    with a complement of rank `0`, so `Tr_*⟨a⟩ ≅ ⟨1, −1⟩`, which is
    `TauCeti.hyperbolicPlane K` (`traceTransfer_weightedSumSquares_equivalent_hyperbolic`);
  - **the discriminant.** In both cases `d(Tr_*⟨a⟩) = d · N a` modulo squares
    (`discr_traceTransfer`). It is stated for Tau Ceti's discriminant
    `TauCeti.RegularFormClass.discr` of Tau Ceti's class `formClass` of the transferred
    form, as `squareClass d + squareClass (N a)` in `SquareClassGroup K`. If `Tr a ≠ 0`,
    `TauCeti.discr_formClass` reads the discriminant off Kahn's basis, and
    `Tr a · d · Tr a / N a ≡ d · N a`. At trace zero the form is `TauCeti.hyperbolicPlane K`,
    of discriminant `squareClass (−1)`, and `a = v x`, by Tau Ceti's normal form
    `Algebra.IsQuadraticExtension.exists_eq_algebraMap_add_algebraMap_mul` with
    `Tr(u + v x) = 2u`, gives `−1 ≡ d · N(v x) = −v² d²`. `Suggested.lean` proves it this way
    from the two diagonalizations above. This is the one step of the degree-1 formula that the
    transfer milestones above do not state.
- **The Galois setup, and the imported transfer by name.** Fix a separable closure `Kˢ`
  containing `L`. The passage from a `K`-embedding `σ : L → Kˢ` to the open subgroup
  `G_L ≤ G_K` is `ProfiniteCohomology.galoisSubgroup` with `galoisSubgroup_index`, and the
  transport of its `𝔽₂`-cohomology to `L`-cohomology is `galoisSubgroupEquiv` with
  `galoisF2Iso`. Restriction, corestriction, and the index-two Evens norm attached to
  `L/K` are then `galoisRes`, `galoisCor`, and `galoisEvens`, and the conjugate is
  `galoisConj`. Nothing here is a second copy of any of them: `galoisRes1`, `galoisRes2`,
  `galoisCor1`, `galoisCor2`, `galoisEvens2` and `galoisConj1` are wrappers whose bodies
  *are* those declarations, and they exist only so that the identities below can be read
  in this roadmap's `H¹(G_K, 𝔽₂)` and `H²(G_K, 𝔽₂)`. Three conventions are pinned, and a
  formula that gets any of them wrong is a different statement:
  - **The conjugation convention.** `galoisConj` is `res ∘ cor − id`, which the supplier's
    `evensConj_eq_conjMapOf` shows agrees with conjugation by **every** `s ∈ G_K ∖ G_L`.
    So no element outside `G_L` is chosen, and `σ·x` below always means `galoisConj1 σ x`.
  - **The two Evens identities**, imported as `galoisRes_galoisEvens` and
    `galoisEvens_add`, the supplier's identities 1 and 2 read on the `L/K` side:

    ```text
    res (N x)  = x ∪ σ·x
    N (x + y)  = N x + N y + cor (x ∪ σ·y)
    ```

    ⚠ The Evens norm is not additive, and the cross term is exactly that failure. Its cup
    is formed **over `L`**, with the **conjugate** of the second argument, and only then
    corestricted to `K`. All three choices are load-bearing.
  - **The sign convention of the cup.** In bidegree `(1,1)` the supplier's
    `cup_gradedComm` gives the sign `(−1)^{1·1}`; with `𝔽₂` coefficients `−z = z`, and
    `f2Pairing` is multiplication, which is its own opposite, so the cup is symmetric.
    That is `cup11_comm`, and it is what lets the orthogonal-sum formula for `w₂` and the
    cross term above be read in either order. ⚠ It is a mod-2 fact; the sign survives with
    odd-torsion coefficients.

  Independence of `σ` is the supplier's `galoisRes_embedding_independent`,
  `galoisCor_embedding_independent` and `galoisEvens_embedding_independent`, transported
  here as `galoisCor1_embedding_independent` and `galoisEvens2_embedding_independent`:
  conjugate embeddings give conjugate subgroups and the induced maps agree. The formula
  below is therefore about `L/K` and not about a chosen embedding. The projection formula
  `cor (res x ∪ y) = x ∪ cor y`, the supplier's `galoisCor_cup` transported as
  `galoisCor2_cup11`, is what turns the last term of the degree-2 formula into a
  statement over `K`.
- **The norm of a restricted class, and the kernel of restriction.** Identity 1
  determines `N^{Ev}` only modulo the kernel of restriction
  `H²(G_K, 𝔽₂) → H²(G_L, 𝔽₂)`, and for `L = K(√d)` that kernel is `(d) ∪ H¹(G_K, 𝔽₂)`.
  The supplier's `galoisSubgroup K L σ` is Tau Ceti's subgroup of `G_K` fixing `σ(L)`
  pointwise (`TauCeti.mem_galoisSubgroup_iff`). So the supplier's `galoisCharacter`, the class
  of the character of `G_K` with kernel `G_L`, is the Kummer class of `d`
  (`galoisCharacter_eq_kummerClass`); the supplier's `galoisRes_eq_zero_iff` reads here as
  `galoisRes2_eq_zero_iff`; and the supplier's `galoisEvens_galoisRes`, the fifth index-two
  identity read on the `L/K` side, `N(res y) = y ∪ y + χ_{L/K} ∪ y`, reads here as
  `galoisEvens2_galoisRes1` and evaluates the norm on the classes that come from `K`. Both
  readings are proved in `Suggested.lean` by applying the supplier's theorems. A
  candidate value that differs from the true one by an element of `(d) ∪ H¹(G_K, 𝔽₂)`
  satisfies identity 1 equally well, which is why the value on every Kummer class is
  computed directly, in the next milestone.
- **The value of the Evens norm on a Kummer class** (Kahn, Invent. Math. 78 (1984),
  Lemme II.2.1; Serre, Comment. Math. Helv. 59 (1984), Théorème 1′ at `n = 2`). For
  `L = K(x)` with `x ∉ K`, `x² = d`, and every `a : Lˣ`:

  ```text
  N^{Ev}((a)) = (Tr a) ∪ (−d · N a) + (2) ∪ (d)       if Tr a ≠ 0,
  N^{Ev}((a)) = (2) ∪ (d)                             if Tr a = 0
  ```

  (`galoisEvens2_kummerClass`, `galoisEvens2_kummerClass_of_trace_eq_zero`). The two
  instances that consumers name are corollaries: `N^{Ev}((1 + t√d)) = (2) ∪ (1 − dt²)`
  (`galoisEvens2_kummerClass_one_add`: `Tr = 2`, `N = 1 − dt²` by `norm_add_mul_of_sq`,
  and `(2) ∪ (−1) = 0` because `−1 = 1² − 2 · 1²`) and `N^{Ev}((√d)) = (2) ∪ (d)`
  (`galoisEvens2_kummerClass_sqrt`). The formula covers every `a` at once, so neither a
  reduction to normalized elements nor the polarization enters. The proof is Serre's
  second proof at `n = 2`, in explicit `2 × 2` matrices over `Kˢ`, and it pins three
  conventions, each against a wrong alternative that changes the answer:
  - **`e_i² = +1`.** The Clifford algebra of `(F², ⟨1, 1⟩)` is `M₂(F)`, with
    `e₁ = diag(1, −1)` and `e₂ = [[0, 1], [1, 0]]` (`pinE1`, `pinE2`), `e₁² = e₂² = +1`,
    `e₁ e₂ = −e₂ e₁` and `(y₀ e₁ + y₁ e₂)² = (y₀² + y₁²) · 1` (`pinE1_mul_self`,
    `pinE2_mul_self`, `pinE1_mul_pinE2`, `pinVec_mul_self`, all proved in
    `Suggested.lean`). These signs make the lift of `C₂ ≀ C₂` below the dihedral group
    `D₁₆` of `Pin⁺` and not the quaternion group `Q₁₆`, as the supplier's `D₁₆` class and
    Kahn's and Serre's `(2)(d)` require. ⚠ Mathlib's `CliffordAlgebra.pinGroup`, on which Tau
    Ceti's `CliffordAlgebra.pinToOrthogonal` and `CliffordAlgebra.pinDoubleCover` are built,
    has the other sign: a vector in it has `Q v = −1` and squares to `−1`, so it lifts a
    reflection by an element of order four and lifts `C₂ ≀ C₂` to `Q₁₆`. The model here is
    therefore stated in matrices and not through that group.
  - **The twisted adjoint action.** An orthogonal `x ∈ M₂(F)` acts on vectors by
    `v ↦ det(x) · x v xᵀ`. An orthogonal `2 × 2` matrix is homogeneous, even when its
    determinant is `1` and odd when it is `−1`, so this is `v ↦ (−1)^{|x|} x v x⁻¹`. A
    **`Pin⁺` lift** of `w ∈ O₂(F)` is an orthogonal `x` whose action is `w`
    (`IsPinLift`). With the sign, a unit vector lifts its own reflection; without it,
    `e₁` would act as `diag(1, −1)`, the reflection in the wrong line.
  - **The descent convention.** `g ∈ G_K` acts on the coordinates of a point of `W` below
    by `ρ_a(g)ᵀ`, which is an anti-homomorphism in `g`, while `ρ_a` itself is a
    homomorphism (`kummerPoint_galois`).

  Fix `σ : L → Kˢ`, write `G_L` for `galoisSubgroup K L σ`, and choose `s ∈ G_K ∖ G_L`,
  `r ∈ Kˢ` with `r² = σ(a)`, and a square root `√2 ∈ Kˢ`. For `r ∈ Kˢ` with `r² ∈ K`,
  `rootSign r g ∈ 𝔽₂` records whether `g r = −r` (`rootSign`). It is the Kummer character
  of `r²` (`kummerCharacter`), that is Tau Ceti's Kummer cocycle `g ↦ g r / r ∈ μ₂`
  (`TauCeti.kummerCocycle`) read in `𝔽₂`, and `kummerClass_eq_homClass` says that the Kummer
  class is the class of this character: `kummerMapCanonical` is Tau Ceti's, the supplier's
  `explicitIso_kummerMap` makes it the explicit class of Tau Ceti's `kummerMap`, and Tau Ceti's
  `TauCeti.kummerMap_eq_kummerCocycleClass` computes that class on the cocycle of `r`. The
  route:
  1. **The norm as a pullback.** The supplier proves `N^{Ev}(α) = (Ind α)^* c_{D₁₆}` for
     every open `U` of index two, every `s ∉ U` and every continuous `α : U → 𝔽₂`
     (`evensNormIndexTwo_eq_ind_pullback`), with `Ind α : G → C₂ ≀ C₂` its `indexTwoInd`
     and `c_{D₁₆}` its `wreathD16Cocycle`, the factor set of `dihedralToWreath` for the
     section `wreathSection`. The Kummer class of `a`, carried to `G_L`, is the class of
     `γ ↦ rootSign r γ` (`galoisKummerCharacter`, `galoisF2Iso_inv_kummerClass`), so
     `N^{Ev}((a))` is the class of `c_{D₁₆} ∘ (ρ_a × ρ_a)` for
     `ρ_a = Ind α_a : G_K → C₂ ≀ C₂` (`kummerInd`,
     `galoisEvens2_kummerClass_eq_pullback`). An explicit continuous `𝔽₂`-valued
     2-cocycle of `G_K` is read in `H²(G_K, 𝔽₂)` by `f2CocycleClass`, the supplier's
     `cochainClass` of its `inhomogeneousCochain2`. It kills coboundaries, which is the
     supplier's `cochainClass_inhomogeneousCochain2_eq_of_coboundary`, and it is additive
     (`f2CocycleClass_add`); together these give `f2CocycleClass_eq_add`, proved in
     `Suggested.lean`. The cup of the classes of two continuous homomorphisms `χ`, `ψ` is the
     class of `(g, h) ↦ χ(g) ψ(h)` (`cup11_homClass`).
  2. **The representation on `W`.** `C₂ ≀ C₂` acts on `F²` by signed permutations,
     `(a, b, c) ↦ diag((−1)^a, (−1)^b) · e₂^c` (`wreathSignedPerm`). For `y ∈ L` put
     `φ(y) = (σ(y) r, s(σ(y) r)) ∈ (Kˢ)²` (`kummerPoint`). Then
     `φ(y) · φ(y') = Tr_{L/K}(a y y')` (`kummerPoint_dotProduct`), because `σ` and
     `s ∘ σ` are the two embeddings of `L` into `Kˢ`: so `W = φ(L)` with the unit form of
     `(Kˢ)²` is `Tr_*⟨a⟩`. And `g(φ(y)) = ρ_a(g)ᵀ φ(y)` (`kummerPoint_galois`): `ρ_a` is
     the representation of `G_K` on the roots `r, s r` of `X² − σ(a)` and `X² − s σ(a)`,
     that is, of `M = K(√d, √a, √σa)`, and the descent datum of `W`.
  3. **The lift into `D̃₁₆` and the twisted boundary.** Put `t = (e₁ − e₂)/√2` (`pinT`;
     `t² = +1` by `pinT_mul_self`, proved). The assignment `r ↦ e₁ t`, the rotation by
     `π/4`, and `f ↦ t` is a homomorphism from Mathlib's `DihedralGroup 8` onto
     `D̃₁₆ = ⟨e₁, t⟩` (`pinDihedral`), with `(e₁ t)⁴ = −1` (`pinE1_mul_pinT_pow_four`,
     proved). It is Tau Ceti's `TauCeti.dihedralHom` at the involutions `t` and `t e₁ t` of the
     unit group of `M₂(F)`, whose product `e₁ t` has order `8`, so `pinDihedral_mul` is
     proved in `Suggested.lean` from `dihedralHom_r` and `dihedralHom_sr`. It lies
     over the supplier's `dihedralToWreath`: `pinDihedral z` is a `Pin⁺` lift of the
     signed permutation of `dihedralToWreath z` (`isPinLift_pinDihedral`; `t` lifts the
     swap and `e₁` lifts `diag(−1, 1)`). Through `wreathSection` it gives `pinLift`, whose
     factor set is `c_{D₁₆}`: `pinLift(g) pinLift(h) pinLift(gh)⁻¹ = (−1)^{c_{D₁₆}(g, h)}`
     (`pinLift_mul_mul_inv`). The lift of `ρ_a` is `ρ̃_a = pinLift ∘ ρ_a`
     (`kummerIndLift`), and its **twisted boundary** is
     `δ(ρ̃_a)(g, h) = ρ̃_a(g) · g(ρ̃_a(h)) · ρ̃_a(gh)⁻¹`, with `g` acting on entries
     (`twistedBoundary`, and `twistedBoundaryF2` for its exponent in `𝔽₂`). Since `g`
     fixes `e₁` and `e₂` and sends `t` to `(−1)^{rootSign √2 g} t`, it multiplies
     `pinLift w` by `(−1)^{rootSign √2 g · c(w)}`, where `c(w)` is the top coordinate
     (`pinLift_map_galois`); and the top coordinate of `ρ_a(h)` is `rootSign √d h`, for
     the square root `√d = σ(x)`. So, as matrices (`twistedBoundary_kummerIndLift`),

     ```text
     δ(ρ̃_a)(g, h) = (−1)^{c_{D₁₆}(ρ_a g, ρ_a h) + rootSign √2 g · rootSign √d h},
     ```

     that is, `δ(ρ̃_a) = ρ_a^* c_{D₁₆} + (2) ∪ (d)` at cochain level. This `(2) ∪ (d)` is
     Serre's `(2)(d_E)`: it is the discriminant of `L/K` that enters, and not that of
     `Tr_*⟨a⟩`.
  4. **The diagonalization.** Let `(y₀, y₁)` be an orthogonal basis of `Tr_*⟨a⟩` with
     values `w_j = Tr(a y_j²) ∈ Kˣ`, and let `c_j ∈ Kˢ` with `c_j² = w_j`. The matrix `P`
     whose `j`-th column is `φ(y_j)/c_j` (`kummerFrame`) is orthogonal, and
     `P⁻¹ ρ_a(g) g(P) = diag((−1)^{rootSign c₀ g}, (−1)^{rootSign c₁ g})`
     (`kummerFrame_conj`): in `Z¹(G_K, O₂(Kˢ))`, `ρ_a` is cohomologous to the diagonal
     cocycle of the Kummer characters of `w₀` and `w₁`. In Kahn's basis
     `(w₀, w₁) = (Tr a, d · Tr a / N a)`; at trace zero a hyperbolic basis gives
     `(1, −1)`.
  5. **Invariance, and the diagonal formula.** `P` has a `Pin⁺` lift `P̃`
     (`exists_isPinLift`: by Tau Ceti's Cartan-Dieudonné, `P` is a product of at most two
     reflections in anisotropic vectors, which can be scaled to unit vectors because `Kˢ`
     contains the square roots, and a unit vector lifts its own reflection). Conjugation
     acts on twisted boundaries by `δ(g ↦ P̃⁻¹ x(g) g(P̃)) = P̃⁻¹ δ(x) P̃`
     (`twistedBoundary_conj`), which leaves the scalar `δ(ρ̃_a)` unchanged. The cochain
     `g ↦ P̃⁻¹ ρ̃_a(g) g(P̃)` lifts the diagonal cocycle (`IsPinLift.mul`, `IsPinLift.inv`,
     `IsPinLift.map`), and so does `g ↦ e₁^{rootSign c₀ g} e₂^{rootSign c₁ g}`
     (`pinDiagonalLift`, `isPinLift_pinDiagonalLift`, proved). Two lifts differ by a sign
     (`IsPinLift.eq_or_eq_neg`), here a continuous `(−1)^{ψ(g)}`, which changes the twisted
     boundary by the coboundary of `ψ`. The diagonal lift has entries in `{0, ±1}`, and
     `e₁^a e₂^b · e₁^{a'} e₂^{b'} = (−1)^{b a'} e₁^{a + a'} e₂^{b + b'}`
     (`pinDiagonalLift_mul`, proved; these are the three lines that use `e_i² = +1` and
     `e₁ e₂ = −e₂ e₁`), so its twisted boundary is
     `(g, h) ↦ rootSign c₁ g · rootSign c₀ h`. Hence `δ(ρ̃_a)` is cohomologous to the cup
     `(w₁) ∪ (w₀)` at cochain level (`twistedBoundaryF2_kummerIndLift_cohomologous`).
  6. **The value.** Steps 3 and 5 give
     `c_{D₁₆} ∘ (ρ_a × ρ_a) = rootSign c₁ ∪ rootSign c₀ + rootSign √2 ∪ rootSign √d + ∂ψ`,
     so step 1, `f2CocycleClass_eq_add`, `cup11_homClass` and `kummerClass_eq_homClass`
     give `N^{Ev}((a)) = (w₁) ∪ (w₀) + (2) ∪ (d)`. Since `(w₀) ∪ (w₁) = w₂(Tr_*⟨a⟩)`, this
     is Serre's `w₂(Tr_*⟨a⟩) = N^{Ev}((a)) + (2) ∪ (d)`. In Kahn's basis
     `(Tr a) ∪ (d · Tr a / N a) = (Tr a) ∪ (Tr a) + (Tr a) ∪ (d · N a) = (Tr a) ∪ (−d · N a)`,
     by `1/N a ≡ N a` and `(t) ∪ (−t) = 0` (Layer 7C, since `−t = 0² − t · 1²`); at trace
     zero `(−1) ∪ (1) = 0`.
- **The polarization convention for `w₁` and `w₂`.** `w₁` is additive over `⊥`; `w₂` is
  not, and its polarization is the cup:
  `w₂(q ⊥ r) = w₂(q) + w₂(r) + w₁(q) ∪ w₁(r)`, which is Layer 8's `sw_append`. That is a
  different polarization from the Evens one above, and the degree-2 Kahn formula contains
  both: the `N^{Ev}(x)` term carries the Evens polarization and the
  `w₁(Tr_*⟨1⟩) ∪ cor(x)` term carries the `w₂` one. A source that writes a single
  "polarization" is using one of the two, and the convention table decides which.
- **The relative Stiefel-Whitney formula, on the forms themselves** (Kahn, *Classes de
  Stiefel-Whitney de formes quadratiques et de représentations galoisiennes réelles*,
  Invent. Math. 78 (1984) 223-256, **Théorème 2**, read in degrees `≤ 2`, and Prop. II.3.5
  at rank one; Kozlowski, Proc. AMS 91 (1984) 309-313, Thm 1.1, for the homotopy-level
  transfer; Evens, Trans. AMS 108 (1963) 54-65, for the norm). This is the milestone of the
  layer, and it is a theorem of the layer. For `L/K` quadratic and separable and
  `a : Lˣ`, with `x = (a) ∈ H¹(G_L, 𝔽₂)`:

  ```text
  w₁(Tr_*⟨a⟩) = w₁(Tr_*⟨1⟩) + cor(x)
  w₂(Tr_*⟨a⟩) = w₂(Tr_*⟨1⟩) + N^{Ev}(x) + w₁(Tr_*⟨1⟩) ∪ cor(x)
  ```

  Nothing in the statement is a chosen diagonalization. The left-hand sides are Layer 8's
  descended `w₁` and `w₂` applied to the isometry classes of the two transferred forms
  themselves, Tau Ceti's `formClass` of each, which exist by Layer 8's invariance milestone
  and by the transfer's respect for isometry; the right-hand sides use the canonical
  corestriction, cup, and index-two
  Evens norm attached to `L/K`. A consumer applies it to a quadratic extension and its
  trace forms and supplies no presentation of either side. The hypotheses
  `[FiniteDimensional K L]`, `[Algebra.IsSeparable K L]`, `finrank K L = 2`, and the
  regularity of the two transferred forms are part of the statement.

  The proof is Kahn's. Write `L = K(x)` with `x ∉ K` and `x² = d ∈ Kˣ`, which is possible
  because `2` is invertible.
  - Degree 1: `w₁(q) = (d(q))` (`sw1Class_eq_discr`), `d(Tr_*⟨a⟩) = d · N a` and
    `d(Tr_*⟨1⟩) = d` (`discr_traceTransfer`), and `cor(x) = (N a)`
    (`galoisCor_kummerClass`); both sides are `(d) + (N a)`.
  - Degree 2, the four-line computation. `Tr_*⟨1⟩ ≅ ⟨2, 2d⟩`, so `w₁(Tr_*⟨1⟩) = (d)` and
    `w₂(Tr_*⟨1⟩) = (2) ∪ (2d) = (2) ∪ (d)`, as `(2) ∪ (2) = (2) ∪ (−1) = 0`. Next
    `w₁(Tr_*⟨1⟩) ∪ cor(x) = (d) ∪ (N a) = 0`, because `N a = u² − d v²` (Layer 7C). So
    the right-hand side is `(2) ∪ (d) + N^{Ev}((a))`. If `Tr a ≠ 0`, the left-hand side
    is `w₂⟨Tr a, d · Tr a / N a⟩ = (Tr a) ∪ (−d · N a)`, and by the value of the norm so is
    the right-hand side. If `Tr a = 0`, the left-hand side is `w₂⟨1, −1⟩ = 0`, and the
    right-hand side is `(2) ∪ (d) + (2) ∪ (d) = 0`. Layer 8's `sw2Class_mk`, with Tau
    Ceti's `formClass_mk`, evaluates `w₂` on these diagonalizations.
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

- constructors: `scharlauTransfer`, `traceTransfer`, the induced map `W(L) → W(K)`, and
  the carrier wrappers `galoisRes1`, `galoisRes2`, `galoisCor1`, `galoisCor2`,
  `galoisEvens2`, `galoisConj1`, each with the supplier's operation as its body; the
  `Pin⁺` model `pinE1`, `pinE2`, `pinT`, `pinVec`, `IsPinLift`, `wreathSignedPerm`,
  `pinDihedral`, `pinLift` and `pinDiagonalLift`; and the Galois-side objects `rootSign`,
  `kummerCharacter`, `galoisKummerCharacter`, `f2CocycleClass`, `kummerInd`,
  `kummerPoint`, `kummerFrame`, `twistedBoundary`, `twistedBoundaryF2` and
  `kummerIndLift`, each with a real body;
- examples: `Tr_*⟨1⟩ ≅ ⟨2, 2d⟩` for `K(√d)/K`; the `ℂ/ℝ` computation of the landed
  effective-bounds file, as the archimedean instance; `N^{Ev}((1 + 2i)) = (2) ∪ (5) ≠ 0`
  for `ℚ_2(i)/ℚ_2`;
- morphisms: `s_* : W(L) → W(K)`, additive and `W(K)`-linear; `wreathSignedPerm` and
  `pinDihedral`, which are homomorphisms;
- functoriality: transitivity `s_* ∘ t_* = (s ∘ t)_*` for a tower `M/L/K`, and
  compatibility with base change; `Pin⁺` lifts are carried by the Galois action;
- comparison lemmas: change of functional `(λ · s)_* q ≅ s_*(⟨λ⟩ ⊗ q)`; the torsor
  theorem; Frobenius reciprocity; the Kummer class against its character, and the cup of
  two characters against the product cochain;
- naturality: independence of the choice of embedding `L ↪ Kˢ`, which is a Layer 7A
  theorem; the value of the norm does not depend on the choices of `r`, `s` and `√2` made
  in its proof;
- edge cases: `L = K`, where the transfer is scaling; `q = 0`; a functional that is not
  the trace; `Tr a = 0`, where `Tr_*⟨a⟩` is hyperbolic;
- downstream interfaces: the form-level formula is the layer's public statement, and the
  diagonal corollary is what a computation over a fixed base applies; the value of the
  norm on `(1 + t√d)` and on `(√d)` is what a consumer that computes with the Evens norm
  applies.

⚠ Nearby false statements. The transfer is not a ring homomorphism on Witt rings.
Kahn's Théorème 2 needs `L/K` separable, and the transfer of forms has no such formula
for an inseparable extension. The Evens norm is not additive, and the corestriction term
in the expansion above records that failure. The cross term of that expansion is a cup
with the **conjugate** class and not with the class itself; a formula without the
conjugate is a different statement, and neither this roadmap nor the profinite-cohomology
roadmap supplies it. The value of the norm on `(1 + t√d)` has no term from the kernel of
restriction: `(2) ∪ (1 − dt²) + (d) ∪ (−1)`, which is what the `SD₁₆` class would give,
restricts to `L` exactly as the true value does and is false; over `ℚ_2` with `d = −1` and
`t = 2` it is `0`, while the value is `(2) ∪ (5) ≠ 0`. The lift of `C₂ ≀ C₂` built with
`e_i² = −1` is `Q₁₆`, and its class is not the norm.

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
- The rank-one boundary: `⟨1⟩ ≅ ⟨4⟩` over `ℚ`, and no diagonal chain joins them; and the
  function that reads off the coefficient in rank one and is `1` in every other rank is
  invariant under both kinds of step and separates the two presentations. The first shows
  that the chain theorem needs rank at least two, and the second that the descent principle
  needs its rank-one hypothesis (Layer 0).
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
- The value of the Evens norm pins its sign. Over `ℚ_2`, with `d = −1`, `L = ℚ_2(i)` and
  `a = 1 + 2i`: `Tr a = 2` and `N a = 5`, so `N^{Ev}((a)) = (2) ∪ (5)`, which is nonzero
  because `(2,5)_{ℚ_2} = −1`. Kahn's form `(Tr a) ∪ (−d · N a) + (2) ∪ (d)` is
  `(2) ∪ (5) + (2) ∪ (−1)`, the same class, because `(2,−1)_{ℚ_2} = +1`. The candidate
  `(2) ∪ (5) + (d) ∪ (−1) = (2) ∪ (5) + (−1) ∪ (−1)` is `0`, because `(−1,−1)_{ℚ_2} = −1` and
  `H²(G_{ℚ_2}, 𝔽₂)` has two elements (Layer 6E), although it restricts to `L` exactly as
  the value does (Layer 9).

### Consumed-interface checks

These are not milestones. They are one-line confirmations that the API this roadmap
consumes says what the later statements assume.

- `ℍ[ℝ]` is a division ring, which is Mathlib's, and is the archimedean instance of the
  split-or-division dichotomy.
- `traceForm_nondegenerate` applies to a finite separable extension, which is
  what makes the trace a legitimate default functional in Layer 9.
- The Layer 7A adapters and the Layer 9 carrier wrappers are defined by real terms built
  from the supplied `res`, `corestriction`, `evensNormIndexTwo`, `cup` and
  `kummerMapCanonical`, and not by `sorry`. Concretely `cup11` is `cup` at `f2Pairing`,
  and `galoisRes1`, `galoisRes2`, `galoisCor1`, `galoisCor2`, `galoisEvens2` and
  `galoisConj1` are `galoisRes`, `galoisCor`, `galoisEvens` and `galoisConj` at the
  degrees Layers 8 and 9 use. So the check that the supplied operations have the types
  those layers assume is the elaboration of these definitions, and a drift in a supplier
  signature is a build failure here rather than a silent disagreement.
- The Layer 9 objects of the value of the Evens norm are real terms too: `kummerInd` is the
  supplied `indexTwoInd` at the Kummer character, `pinLift` is `pinDihedral` composed with
  the supplied `wreathSection`, `kummerIndLift` is their composite, and `f2CocycleClass`
  is the supplied `cochainClass` of `inhomogeneousCochain2`. The twisted boundary is a
  definition applied to the named `ρ̃_a`, and the milestones about `ρ_a`, `ρ̃_a` and
  `δ(ρ̃_a)` are statements about those named objects. The only statements quantified over
  a cochain or a lift, `twistedBoundary_conj` and the `IsPinLift` lemmas, are identities
  that hold for every one.
- The wrappers are forced and not cosmetic. The supplier's operations return their values
  through its own cohomology adapter, which is `private`, so instance search cannot reduce
  the result type against `H¹(G_K, 𝔽₂)` and `H²(G_K, 𝔽₂)`: without a normalizing name
  `x + cup P 1 1 y z` fails to synthesize addition even though both sides are
  definitionally equal. Naming each normalized form once is what lets Layer 8's
  orthogonal-sum identities and Layer 9's Evens identities be stated at all.

## Ordering and parallelism

Layers 0 to 4 are free of cohomology and of the Brauer group, and they are Tau Ceti's
except for the milestones marked in them as built here, which can be built immediately.
In the dependency order, Layer 0 comes first, because everything diagonal rests on it.
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
together with Layer 5; the relative-formula half needs Layers 7C and 8, the supplier's
transfer along `L/K`, which Layer 7A consumes, and the supplier's `D₁₆` pullback formula.

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
  galoisiennes réelles*, Invent. Math. 78 (1984) 223-256, Théorèmes 1-3, Lemme II.2.1
  and Prop. II.3.5; the source of Layer 9's relative formula and of the value of the
  Evens norm.
- J.-P. Serre, *L'invariant de Witt de la forme Tr(x²)*, Comment. Math. Helv. 59 (1984)
  651-676, Théorème 1′ and its second proof, which Layer 9 follows at `n = 2` in
  explicit matrices.
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
  to the binary form `b = x² − Δ y²` that 6B and 6C apply. The uniformizer predicate, the
  local square theorem in its sharp form and the odd square-class count are Tau Ceti's and
  are consumed under this roadmap's names.
- The [profinite-cohomology roadmap](../ProfiniteCohomology/README.md) owns continuous
  cohomology and its operations. Sublayer 7A consumes it through the exact contract
  above: the carrier, the cup product, restriction, inflation, corestriction, Kummer
  theory, the multiplicative coefficients, the index-two Evens norm with the identities,
  the index-two exact sequence and the `D₁₆` pullback formula of the contract table, and
  the transfer along a finite separable `L/K` are all that roadmap's.
  This roadmap defines no second cup product, no second Kummer isomorphism, no second
  Evens norm, and no second restriction or corestriction. What 7A adds is the coefficient
  identification specific to `μ₂` and the mod-2 laws read through it. Sublayer 7B consumes
  the same roadmap's explicit degree-two complex and degree-two finite-quotient system, at
  `M = UnitsCoeff K`; it defines no second continuous-cohomology carrier, no second
  inflation, and no second finite-quotient colimit, and
  `inflateTwoCocycleClass_eq_finiteQuotientComparison` is what says so in Lean rather than
  in prose.
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
  conditions are recorded in the private migration and provenance ledger, which is not
  normative roadmap content.
- Single-purpose formalizations of several of these targets over dyadic bases exist
  outside this repository. They are evidence that the statements are formalizable, and
  not prescriptions of form. The source map is maintained in the private migration and
  provenance ledger, not in the normative roadmap.
