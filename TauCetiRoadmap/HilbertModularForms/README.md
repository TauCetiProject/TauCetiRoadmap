# Roadmap: hilbert modular forms

**Summary.** Let `F` be a totally real number field of degree `n ≥ 2`. A Hilbert modular form is a holomorphic
function on the product `ℍ^Σ` of one upper half-plane per real place of `F`, transforming under a
congruence subgroup of `GL₂⁺(F)` by a weight vector `k ∈ ℤ^Σ`. The LMFDB's section
`ModularForm/GL2/TotallyReal` (`hmf`) holds Hilbert newforms of parallel weight `2` over totally
real fields of small degree, each given by its base field, its level ideal, its Hecke
eigenvalues at the prime ideals, its Atkin–Lehner eigenvalues, the degree of its Hecke field, and
two flags (complex multiplication, base change). The elliptic-curve section `ecnf` links a curve
over a totally real field to the Hilbert newform with the same `L`-function.

This roadmap extends the supplied parallel-weight analytic theory to nonparallel weights
and builds its further analytic and newform dictionaries: the groups `Γ₀(𝔫)_𝔟` on each narrow-class component, the slash action, Fourier
expansions over the totally positive elements of a fractional ideal, Koecher's principle, cusp
forms, reduction theory and finite dimensionality, Eisenstein series, Hecke operators on Fourier
coefficients, old and new subspaces, newforms with their coefficient fields and Atkin–Lehner
signs, `L`-functions with their functional equation, twists, complex multiplication, base change
(with the Doi–Naganuma lift for real quadratic fields), and the Jacquet–Langlands dictionary to
totally definite quaternion algebras through which the LMFDB's tables are computed. The adelic
representation theory, the Galois representations, and the geometry of the Hilbert modular
varieties are not built here; where a classical theorem has only an adelic proof, the roadmap
builds the **classical–adelic dictionary** (Layer 6) and consumes the adelic theorem through it.

The carrier is a function `ℍ^Σ → ℂ` with `ℍ^Σ := InfinitePlace F → ℍ`, Mathlib's upper half-plane
indexed by the infinite places of `F` (all real by `NumberField.IsTotallyReal F`), acted on
componentwise by Mathlib's `GL (Fin 2) ℝ`-action through the real embeddings. The arithmetic of
`F` — fractional ideals, the different, the narrow class group, totally positive elements, ray
class and Hecke characters — is consumed from Mathlib and Tau Ceti and never redefined.

Suggested home: `TauCeti/NumberTheory/HilbertModularForms/`, with files `Domain`, `Group`,
`Fourier`, `Koecher`, `Reduction`, `Eisenstein`, `Hecke`, `Newforms`, `Dictionary`, `LFunction`,
`Twist`, `BaseChange`, `JacquetLanglands`, `LMFDB`. Public declarations live in the namespace
`HilbertModularForm`. [`Suggested.lean`](Suggested.lean) states the headline Fourier expansion (`hasSum_fourier`),
Koecher principle (`koecher`), nonparallel cuspidality
(`constantTerm_slash_eq_zero_of_not_isParallel`), full expansion injectivity
(`fullExpansion_injective`) and its cusp specialization (`cusp_coeff_injective`),
Hecke bound (`exists_norm_coeff_le`), and finite dimensionality
(`finiteDimensional_cuspForms`, `finiteDimensional_modularForms`). It also states negative-weight vanishing
(`modularForms_eq_bot_of_top_neg`) with nonzero level and absolute cusp L-series
convergence (`LSeriesSummable_of_isCuspForm`) for Re(s)>k₀/2+1 and general-form
convergence (`LSeriesSummable_of_modularForm`) for Re(s)>k₀+1. Each theorem uses
the analytic carriers defined there with real bodies. The module docstring identifies
the missing carriers for the other headlines, which remain targets in this README.

## Prerequisites

The Mathlib and Tau Ceti declarations consumed are listed under *What Mathlib supplies* and
*What Tau Ceti supplies*. Roadmaps: [Global Number Fields](../GlobalNumberFields/README.md)
Layers 2, 4, 9, 10; [Modular Forms](../ModularForms/README.md) Layers 2–7 (the `F = ℚ` theory
this one generalizes, and the source of base-change inputs);
[Number Field Arithmetic](../../Completed/NumberFieldArithmetic/README.md) Layers 4, 8;
[Arithmetic Dirichlet Series](../../Completed/ArithmeticDirichletSeries/README.md) Layers 0–3;
[L-functions](../LFunctions/README.md) Layers 0 and 3; and the suppliers named in *Scope and
ownership*.

## Scope and ownership

### Owned here

This is the nonparallel-weight and analytic/dictionary extension of the classical parallel-weight
construction in NoncommutativeAndEquivariantIwasawa §F.5. On the common domain k≥2, its form
and cusp carriers, slash, expansions with constants, normalized ideal coefficients, character
spaces and Hecke operators are used. The extensions below are compared with those objects,
including all representative and differential factors; they do not construct another
parallel-weight theory. Weight zero and negative weights are additional analytic cases.


- the domain `ℍ^Σ`, the group `GL₂⁺(F)` of totally positive determinant, its action, the
  weight-`k` slash action in the arithmetic normalization, and holomorphy on `ℍ^Σ` (Layer 0);
- the lattices `L_𝔟 = 𝒪_F ⊕ 𝔟`, the groups `Γ₀(𝔫)_𝔟`, `Γ₁(𝔫)_𝔟`, `Γ(𝔫)_𝔟` and their
  determinant-one subgroups `Γ_i¹(𝔫)_𝔟` with their structure, the component
  transport between representatives of one narrow class, cusps and their finiteness (Layer 1);
- Fourier expansions, **Koecher's principle**, the spaces `M_k(Γ)` and `M_k(𝔫)`, the normalized
  coefficients `c(𝔪, f)` indexed by nonzero integral ideals, the parity lemma, constant terms and
  cusp forms, cuspidality in non-parallel weight (Layer 2);
- reduction theory (Siegel sets, finite covolume), the Hecke bound, the Petersson inner product,
  and **finite dimensionality** by the Hilbert-space argument (Layer 3);
- Eisenstein series of even parallel weight, including weight `2` through Hecke's trick, and the
  decomposition `M_k = S_k ⊕ E_k` (Layer 4);
- Hecke operators `T_𝔪` and `S_𝔪` as double-coset operators between components, the central
  action of the narrow class group, the central-character eigenspaces `M_k(𝔫, ψ)`, the
  coefficient formulas, commutativity, Petersson adjoints, simultaneous diagonalization, the
  Atkin–Lehner and Fricke operators (Layer 5);
- the **classical–adelic dictionary** for `Γ₀(𝔫)`: the comparison between the tuple of component
  functions and a function on `GL₂(F)\GL₂(𝔸_F)`, Hecke-equivariant, with its inverse (Layer 6);
- old and new subspaces, newforms as the LMFDB defines them, Hecke orbits, the coefficient field,
  Galois conjugates, bad-prime coefficients, Atkin–Lehner signs (Layer 7);
- the `L`-function of a Hilbert form as an ideal Dirichlet series, its Euler product, the
  completed `L`-function and the Hecke–Shimura functional equation, the `L`-function card (Layer 8);
- twists by finite-order Hecke characters, the CM predicate, the coefficient description of CM
  forms, the base-change predicate and relation, the Doi–Naganuma lift (Layer 9);
- the Jacquet–Langlands dictionary to totally definite quaternion algebras, stated on the
  `𝔇`-new subspace, and the Brandt-matrix trace identity (Layer 10);
- the LMFDB invariants of a Hilbert newform and the elliptic-curve interface (Layer 11).

### Consumed, not redefined

- From AutomorphicSpectralTheory §§1.5, 1.15a–1.15b: the Eisenstein constant-term
  formula, meromorphic continuation and functional equation, and the factorization
  of the raw GL₂ intertwiner into a Hecke L-ratio and local integrals. Section 4.2
  owns the cusp-indexed, parallel-weight-two specialization and its holomorphic limit.

- From KTheoryLowDegrees §5.4: the index ideal of a map of determinant lines,
  its local scalar description and invariance under line isomorphisms. Section 1.1
  uses this for inclusions of full lattices and extends to fractional indices by
  clearing a denominator; it owns the oriented rank-two component formulas.

- From [NoncommutativeAndEquivariantIwasawa](../NoncommutativeAndEquivariantIwasawa/README.md)
  §F.5: hilbertForms, hilbertCuspForms and hilbertQExpansion, their parallel-weight k≥2
  slash and character laws, every component and cusp, the all-cusp and standard-component
  integral lattices, normalized ideal coefficients with constants and representative
  factors, and all good and level-dividing Hecke operators. The comparison targets here
  identify the parallel specialization of the nonparallel formulas with these supplied
  objects, not merely with abstract isomorphic spaces. The two integral lattices remain distinct.

- From Mathlib and Tau Ceti: everything in *Prerequisites*. In particular the narrow class group
  is `NumberField.NarrowClassGroup F` (Tau Ceti), identified with
  `RayClassGroup (narrowModulus F)` by Tau Ceti's `narrowEquivNarrowClassGroup`; a finite-order
  Hecke character is `TauCeti.GlobalNumberFields.HeckeCharacter F` with `IsFiniteOrder`, and its
  values on ideals prime to its conductor are `HeckeCharacter.idealCharacter`.
- From [Global Number Fields](../GlobalNumberFields/README.md): Layer 2 (moduli, ray class
  groups, the narrow class group as the ray class group of `narrowModulus`), Layer 9 (Hecke and
  ray class characters, conductors, primitivity), Layer 10 (infinity types; `IsAlgebraic` is the
  hypothesis on the Hecke characters of CM extensions in Layer 9 here).
- From [Modular Forms](../ModularForms/README.md): the `ℚ`-side objects that base change starts
  from — `HeckeRing.GL2.Newform N k`, its nebentypus `dirichletLift`, `CoefficientField`
  (Layers 4 and 8 there) — and the Hecke-ring definitions of its Layer 2(a), on which the
  double-coset operators of Layer 5 are modelled.
- From [Arithmetic Dirichlet Series](../../Completed/ArithmeticDirichletSeries/README.md):
  `IdealArithmeticFunction`, `normCoeff`, `EulerProductData` (Layers 0–3 there);
  the coefficient function of a Hilbert form is an `IdealArithmeticFunction F`.
- From [L-functions](../LFunctions/README.md): the card `ArithmeticLFunctionData` with its
  `NormalizationTranslation`, `HasFunctionalEquation`, `HasMeromorphicContinuation` and
  `EqOffZero` (its Layer 0). Layer 8 here constructs the card of a Hilbert newform and proves its
  predicates; it defines no second completed-`L`-function record.
- From [GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md):
  the adelic carriers of R16.1 (finite-level automorphic functions, the compact subgroups
  `K₀(𝔫)`), the eigensystem interface and strong multiplicity one of R16.4.4, multiplicity one
  R16.4.3, the local newvector theory R16.2 and R16.3, global Jacquet–Langlands R17.3.1 with
  R17.3.3, R17.3.5, R17.3.9, base change R17.4 (R17.4.1, R17.4.3–R17.4.5, R17.4.8), and
  automorphic induction R17.4.16. The completed functional equation, trace
  additive character and discriminant-square conductor are R16.5.4, with
  archimedean factors R16.3.6. All enter through the dictionary of Layer 6. General local newvectors are supplied by
  AutomorphicLFunctionsAndLocalFactors AL.2.2, and local factors by GL2AutomorphicRepresentationsAndTransfer
  R16.3. The Hilbert comparison with these is owned here; the classical R16.6.2 has base field ℚ.
- From [Automorphic Galois representations](../AutomorphicGaloisRepresentations/README.md): the
  Galois representation of a Hilbert newform (its Layer 3, §3.10) and the characterization of CM
  by virtual reducibility (§§3.15–3.16). Layer 9 here defines CM by self-twist, as the LMFDB does,
  and cites that roadmap for the equivalence with the induced-representation description.
- From [Automorphic bundles](../AutomorphicBundles/README.md): the geometric Hilbert modular forms
  (§11.9, geometric and analytic classical forms), their rational
  structures over the defining field and field base change (§11.18), the Hilbert expansions
  (§12.17), expansion principle (§12.18) and cusp criterion (§12.19). Layer 7 here consumes them for the
  rationality of Fourier coefficients and the Galois action on newforms.
- From [Hilbert modular varieties and Shimura curves](../HilbertModularVarietiesAndShimuraCurves/README.md):
  the moduli-theoretic components and Hecke isogenies of its H3 (H3.6, H3.8), the component
  comparison H1.10 and the real-quadratic cusps H5.2. The components here are the classical
  groups `Γ₀(𝔫)_𝔟`; their identification with the polarization classes of H3 is cited, not rebuilt.
- From [Quaternionic modular forms](../QuaternionicModularForms/README.md): the spaces of forms on
  a totally definite quaternion algebra (its §2.1), their Hecke action (§3.1), the class sets and
  stabilizers (§0.3). Layer 10 uses the matrices of its Hecke action on the class-set basis,
  formed with Mathlib `LinearMap.toMatrix`, and states the dictionary against these objects.
- From [Adelic algebraic groups](../AdelicAlgebraicGroups/README.md): the `S`-arithmetic
  decomposition and the strong approximation theorem for the norm-one group `D¹` of a central
  simple algebra (its §4.2), applied to `D = M₂(F)`, where `D¹ = SL₂`.
  Its §3.4 targets “Siegel sets cover” and “Siegel property” supply the generic
  reduction and finite-intersection theorems; §3.1 here identifies their
  projective GL₂ cusp coordinates. The finiteness of the
  double coset `GL₂(F)⁺\GL₂(𝔸_{F,f})/K₀(𝔫)` and its identification with the narrow class group
  (Layer 6) rest on it.
- From [Number Field Arithmetic](../../Completed/NumberFieldArithmetic/README.md): the ramified
  primes of `F` (Layer 4.3 there; the LMFDB column `field_bad_primes`) and the intrinsic field
  label prefix `HasLMFDBIntrinsicLabel` (Layer 8.1 there, implemented as Tau Ceti's
  `TauCeti.NumberField.HasLMFDBIntrinsicLabel`).

### Not owned here

- **Adelic automorphic forms and representations of `GL₂(𝔸_F)`**, local representation theory,
  newvectors, multiplicity one, base change, Jacquet–Langlands: GL₂ automorphic representations
  and transfer. Layer 6 builds the comparison map, not the representation theory.
- **Galois representations** of Hilbert modular forms and the Eichler–Shimura–Carayol theorems:
  Automorphic Galois representations.
- **Geometry**: the Hilbert modular varieties as moduli spaces, their compactifications,
  automorphic bundles, the geometric `q`-expansion principle: Hilbert modular varieties and
  Shimura curves, Automorphic bundles. For real quadratic `F`, the surfaces `Γ\ℍ²`, their cusp
  resolutions, elliptic points, Euler numbers and the **Shimizu dimension formulas** belong to the
  sibling `HilbertModularSurfaces` roadmap; this roadmap proves finite dimensionality and no
  closed dimension formula.
- **Quaternion algebras**, Eichler orders, class sets and Brandt matrices: Quaternionic modular
  forms §§0.1–0.3 and 3.1; the basis-matrix presentation in §10.3 uses that action.
- **Modularity of elliptic curves** over totally real fields, and the conductor and local data
  of a curve over a number field: potential modularity over an extension is supplied by
  [PotentialModularityAndCompatibleSystems](../PotentialModularityAndCompatibleSystems/README.md) §5.1
  for given lifts satisfying its residual and local-type hypotheses.
  Base-field modularity and full local-factor comparison are separate explicit inputs to §11.3;
  the basic curve carrier is from [EllipticCurves](../EllipticCurves/README.md), and §11.3 states
  the exact additional full-local-factor input needed by its comparison. Layer 11 states the matching
  predicate between a newform and a trace-of-Frobenius function.
- **Bianchi modular forms** (imaginary quadratic base fields): the sibling `BianchiModularForms`
  roadmap.
- **Half-integral weight**, Jacobi forms, Siegel modular forms: `HalfIntegralWeightModularForms`
  and `SiegelModularForms`.
- **Weight one** Hilbert modular forms and the totally odd Artin representations attached to
  them: GL₂ automorphic representations and transfer R17.5.10 and Automorphic Galois
  representations Layer 2. Every weight here has `k_w ≥ 2` wherever a theorem needs it, and the
  weight-one case is excluded from the newform theory.
- **Labels and orderings.** The LMFDB boundary rule applies: an invariant of the newform up to
  isomorphism of the data (the base field, the level ideal, the weight, the Hecke eigenvalue
  function on prime ideals, the Hecke field up to isomorphism, the flags) is defined here; the
  ordering of the prime ideals that linearizes `hecke_eigenvalues`, the index `i` of the level
  label `N.i`, the orbit letter, the stored defining polynomial of the Hecke field, and the
  completeness of the tables are not targets. The intrinsic prefix of a form's label — field
  label prefix, level norm — is stated in Layer 11.
- **`p`-adic and overconvergent** Hilbert modular forms, ordinary projectors, Hida families:
  Quaternionic modular forms Layers 4–5, Ordinary automorphic forms and modularity lifting.

## Conventions

The base field is `[Field F] [NumberField F] [NumberField.IsTotallyReal F]` with
`1 < Module.finrank ℚ F`, taken as an explicit hypothesis by every theorem that uses it (the
definitions are stated without it). Write `Σ` for
`InfinitePlace F`; every `w ∈ Σ` is real, and `σ_w : F →+* ℝ` is
`embedding_of_isReal (IsTotallyReal.isReal w)`. Write `𝒪_F` for `𝓞 F`, `𝔡 = 𝔡_F` for the
different `differentIdeal ℤ 𝒪_F`, and `x ≫ 0` for `NumberField.IsTotallyPositive x`. Levels `𝔫`
are nonzero integral ideals; `𝔟` ranges over invertible fractional ideals
`(FractionalIdeal (𝓞 F)⁰ F)ˣ`. The degree-one case `F = ℚ` is excluded everywhere: it is the
[Modular Forms](../ModularForms/README.md) roadmap, and the definitions here (no cusp condition,
by Koecher) would be wrong for it.

### Normalizations

| Subject | Convention |
| --- | --- |
| Domain | `ℍ^Σ := InfinitePlace F → ℍ`. No ordering of the places is chosen; `Fin n` never indexes anything. |
| Group | `GL₂⁺(F) := {γ ∈ GL (Fin 2) F : det γ ≫ 0}`, acting on `ℍ^Σ` by `(γ • z) w = σ_w(γ) • z w` through `Matrix.GeneralLinearGroup.map σ_w` and Mathlib's `UpperHalfPlane.glAction`. Because every `σ_w(γ)` has positive determinant, Mathlib's conjugation `σ` never fires and the action is the Möbius action. Matrices act on column vectors. |
| Weight | `k : Σ → ℤ` with all `k_w` of one parity (`Even (k_v - k_w)`). `k₀ := max_w k_w` and `m_w := (k₀ - k_w)/2 ∈ ℕ`. *Parallel weight* `k` means `k_w = k` for all `w`, so `m = 0`. The LMFDB's weight vector `[k_1, …, k_n]` is `k` read along its own ordering of the places. |
| Slash, arithmetic normalization | `(f ∣_k γ)(z) = ∏_w σ_w(det γ)^{k_w + m_w - 1} · j(σ_w γ, z_w)^{-k_w} · f(γ • z)`, with `j(g, τ) = UpperHalfPlane.denom g τ`. In parallel weight this is the product over `w` of the factors `|det|^{k-1} denom^{-k}` of Mathlib's `f ∣[k] g`, and for `F = ℚ` it is the arithmetic normalization of the Modular Forms roadmap. A scalar `a ∈ F^×` acts by `N(a)^{k₀ - 2}` (signed norm; `det(a·1) = a²` is totally positive for every `a`). |
| Unitary normalization | The LMFDB knowl `mf.hilbert` writes the transformation law with the factor `∏_w j(σ_w γ, z_w)^{k_w} σ_w(det γ)^{-k_w/2}`. The two slashes differ by `N(det γ)^{(k₀-2)/2}` (Layer 0.4), which is `1` whenever `det γ` is a totally positive **unit**; so on every group `Γ₀(𝔫)_𝔟` the two laws agree, and the difference is visible only in Hecke operators, where the arithmetic one is used. |
| Holomorphy | `IsHolomorphic f := DifferentiableOn ℂ (f ∘ (ofComplex ∘ ·)) {z : Σ → ℂ ∣ ∀ w, 0 < (z w).im}`, with Mathlib's `UpperHalfPlane.ofComplex` applied coordinatewise. Equality with the manifold notion on the product charted space is a theorem (0.2), not the definition. |
| Lattice of a component | `L_𝔟 := 𝒪_F ⊕ 𝔟 ⊂ F²` (column vectors). `Γ_𝔟 := Stab_{GL₂⁺(F)}(L_𝔟) = {(a b; c d) : a, d ∈ 𝒪_F, b ∈ 𝔟⁻¹, c ∈ 𝔟, det ∈ 𝒪_{F,+}^×}`, and `Γ₀(𝔫)_𝔟 := {γ ∈ Γ_𝔟 : c ∈ 𝔫𝔟}`. This is the group convention of the knowl (with `a, d ∈ 𝒪_F` made explicit). `𝒪_{F,+}^×` is Tau Ceti's `totallyPositiveIntegerUnits`. |
| Components | Forms of level `𝔫` are tuples indexed by the narrow class group: a *system of representatives* `R` is a function `rep : NarrowClassGroup F → (FractionalIdeal (𝓞 F)⁰ F)ˣ` with `NarrowClassGroup.mk (rep c) = c`, and `M_k(𝔫; R) := ∏_c M_k(Γ₀(𝔫)_{rep c})`. Two systems give canonically isomorphic spaces (1.5); every invariant below is proved independent of `R`. The component of class `c` is written `f_c`, or `f_𝔟` for `𝔟 = rep c`. |
| Translation lattice and exponents | `Γ₀(𝔫)_𝔟` contains the translations by `𝔟⁻¹`, so `f_𝔟` expands over the trace dual `(𝔟⁻¹)^∨ = 𝔟𝔡⁻¹`: `f_𝔟(z) = Σ_{μ ∈ (𝔟𝔡⁻¹)_+ ∪ {0}} a_𝔟(μ) e(Tr(μz))`, `e(x) = exp(2πix)`, `Tr(μz) = Σ_w σ_w(μ) z_w`. The trace dual is Mathlib's `FractionalIdeal.dual ℤ ℚ`. |
| Ideal coefficients | For a nonzero integral ideal `𝔪` let `c` be the narrow class with `[𝔪] = [rep(c)⁻¹ 𝔡]` in `NarrowClassGroup F`, and let `μ ≫ 0` generate `𝔪 · rep(c) · 𝔡⁻¹`. The **normalized coefficient** is `c(𝔪, f) := a_{rep c}(μ) · ∏_w σ_w(μ)^{m_w}`. It does not depend on `μ` (2.4). In parallel weight it is the knowl's `a_𝔪`. `c(𝔪, f)` is an `IdealArithmeticFunction F` (`zeroExtend`ed by `0` at `⊥`). |
| Cusp form | `f` is a cusp form when the constant term `a_0(f_𝔟 ∣_k γ)` vanishes for every component `𝔟` and every `γ ∈ GL₂⁺(F)`. No growth condition is imposed anywhere; Koecher's principle supplies it. |
| Hecke operators | `T_𝔪` and `S_𝔪`, for every nonzero integral ideal `𝔪`, are the double-coset operators of Layer 5; `(T_𝔪 f)_c` is built from the component `f_{c[𝔪]⁻¹}` and `(S_𝔪 f)_c` from `f_{c[𝔪]⁻²}`. `T_𝔭` at `𝔭 ∣ 𝔫` is the same definition and is also written `U_𝔭`; there is no second operator. The *central action* of `[𝔪] ∈ NarrowClassGroup F` is `⟨[𝔪]⟩ := N𝔪^{-(k₀-2)} S_𝔪`. `M_k(𝔫, ψ)` is the `ψ`-eigenspace of the central action for a character `ψ : NarrowClassGroup F →* ℂˣ`; `ψ = 1` is the LMFDB's default and the only case in which Atkin–Lehner *signs* are defined. |
| Coefficient formula | On `M_k(𝔫, ψ)` and for `𝔭 ∤ 𝔫`: `c(𝔪, T_𝔭 f) = c(𝔪𝔭, f) + ψ([𝔭]) N𝔭^{k₀ - 1} c(𝔪𝔭⁻¹, f)`, the last term read as `0` when `𝔭 ∤ 𝔪`; for `𝔭 ∣ 𝔫`: `c(𝔪, T_𝔭 f) = c(𝔪𝔭, f)`. For `F = ℚ` these are the Modular Forms roadmap's formulas. |
| Newform | A nonzero `f ∈ S_k(𝔫, ψ)^{new}` that is an eigenvector of every `T_𝔭` with `𝔭 ∤ 𝔫`, normalized by `c(𝒪_F, f) = 1`. That it is an eigenvector of every `T_𝔪` is a theorem (7.4). "Eigenform" alone means an eigenvector of all `T_𝔪` and of the central action. |
| Eigenvalues | For a newform, `T_𝔪 f = c(𝔪, f) f`. The LMFDB's `hecke_eigenvalues` are the values `c(𝔭, f)` at the prime ideals, read along an ordering of the primes that is a database convention, not a target. |
| Atkin–Lehner | For `𝔮 = 𝔭^{v_𝔭(𝔫)}` exactly dividing `𝔫` and `ψ = 1`, `W_𝔮` is the normalized involution of 5.6 and `ε_𝔮(f) ∈ {±1}` its eigenvalue on a newform (7.7). For `𝔭 ‖ 𝔫`, `c(𝔭, f) = -ε_𝔭(f) N𝔭^{k₀/2 - 1}`; in parallel weight `2`, `c(𝔭, f) = -ε_𝔭(f)`. The LMFDB's `AL_eigenvalues` are the `ε_𝔮(f)`. |
| Coefficient field | `CoefficientField f := ℚ({c(𝔪, f)}) ⊆ ℂ`, an `IntermediateField ℚ ℂ`, as in the Modular Forms roadmap; the LMFDB's `dimension` is `finrank ℚ (CoefficientField f)`. |
| `L`-function | `L(f, s) = Σ_𝔪 c(𝔪, f) N𝔪^{-s}`, regrouped by norm into Mathlib's `LSeries` through `normCoeff`. Arithmetic normalization, centre `k₀/2`, motivic weight `k₀ - 1`; the card's analytic gamma shifts are `(k_w - 1)/2` at each `w` (all complex), the conductor is `N(𝔫) · |d_F|²`, the degree `2n`. |
| Twist | `(f ⊗ χ)` for any finite-order Hecke character `χ` is the form with `c(𝔪, f ⊗ χ) = χ(𝔪) c(𝔪, f)` for `𝔪` prime to the conductor of `χ` (9.1), `χ(𝔪)` being `HeckeCharacter.idealCharacter`. The twist lies in the nebentypus ψχ² space of §2.7; if χ² is ramified, this is not the unramified specialization of §5.2. |
| CM | `f` has CM when `f` and `f ⊗ χ` have the same good coefficients for some nontrivial finite-order `χ` — the knowl `mf.cm`. Such `χ` is quadratic and cuts out a totally imaginary quadratic extension (9.4). |
| Base change | `g` over `K` is a base change of `f` over `F ⊆ K` when `L_𝔮(g, T) = L_𝔭^{(r)}(f, T)` for all but finitely many primes `𝔮 ∣ 𝔭` of `K`, `r` the residue degree — the knowl `mf.base_change`. `f` *is a base change* when it is a base change of a newform over a proper subfield `F₀ ⊊ F`, the case `F₀ = ℚ` using the Modular Forms roadmap's `Newform`. |
| Sign of the functional equation | `Λ(f, s) = ε(f) Λ(f^ρ, k₀ - s)`, `f^ρ` the form with conjugate coefficients; for `ψ = 1`, `f^ρ = f`, and `ε(f) = i^{Σ_w k_w} ∏_{𝔭 ∣ 𝔫} ε_{𝔭^{v_𝔭(𝔫)}}(f)` where the product runs over prime ideals dividing the level, each contributing its full prime-power Atkin–Lehner sign; in parallel weight `2`, `ε(f) = (-1)^n ∏_{𝔭 ∣ 𝔫} ε_{𝔭^{v_𝔭(𝔫)}}(f)`. |

The analytic signatures use UpperHalfSpace, realEmbedding, toGLReal, GL2Pos, det₀,
entry, Weight (with IsParallel, top and m), slash and IsHolomorphic. The component data
are Gamma0 and NarrowRepresentatives. The Fourier definitions are tracePairing, expTrace,
basePoint, box, boxMean, fourierCoeff, constantTerm and dualLattice; modularForms,
cuspForms, HilbertModularForms, IsCuspForm and cuspSubmodule supply the spaces. The
coefficient definition is coeff; the convergence statements use the native L-series directly. The proved
actions upperHalfSpaceSMul and upperHalfSpaceMulAction and support identities smul_apply, slash_add, slash_smul, slash_zero, entry_mul, det₀_mul,
det₀_inv and entry_inv are used only to construct their actions and submodules.

## Exact supplier contracts

### From Mathlib

- `ℍ` with the `GL (Fin 2) ℝ`-action, `denom`, the cocycle `denom_cocycle`, `im_smul_eq_div_normSq`,
  and the weight-`k` slash `f ∣[k] g` with its `SlashAction` laws (`ModularForm.slash_def`, `SlashActions.lean`,
  `UpperHalfPlane/MoebiusAction.lean`); `UpperHalfPlane.ofComplex` and `mdifferentiable_iff`
  (`UpperHalfPlane/Manifold.lean`), which Layer 0 lifts to products.
- `NumberField.IsTotallyReal`, `IsTotallyReal.finrank`, `embedding_of_isReal`,
  `InfinitePlace.mult`, the finiteness of `InfinitePlace F`.
- `FractionalIdeal`, `FractionalIdeal.dual`, `differentIdeal`, `coeIdeal_differentIdeal`,
  `Ideal.absNorm`, `Ideal.absNorm_span_singleton`, `ClassGroup`, `HeightOneSpectrum`.
- `LSeries`, `LSeriesSummable`, `ArithmeticFunction`, the Euler-product API, Mellin transforms
  and `WeakFEPair` (consumed through the L-functions roadmap's level transport).
- `Matrix.GeneralLinearGroup.map`, `Matrix.GeneralLinearGroup.det`, `Matrix.SpecialLinearGroup`.
- `UnitAddTorus.hasSum_mFourier_series_L2`,
  `UnitAddTorus.hasSum_mFourier_series_of_summable` and
  `UnitAddTorus.hasSum_mFourier_series_apply_of_summable`
  (`Mathlib/Analysis/Fourier/AddCircleMulti.lean`): product-torus L² convergence,
  and uniform/pointwise convergence for continuous functions with summable coefficients.
- `MeasureTheory.L2.inner_def` (`Mathlib/MeasureTheory/Function/L2Space.lean`):
  the integral of the conjugate-first pointwise inner product.
- `Module.Finite.pi` (`Mathlib/RingTheory/Finiteness/Basic.lean`):
  finite products of finite modules, applied to the narrow-class tuple after §3.5.
- `Complex.cderiv_eq_deriv` and `Complex.norm_cderiv_le`
  (`Mathlib/Analysis/Complex/LocallyUniformLimit.lean`): first-derivative Cauchy
  estimate on a positive-radius disk contained in a holomorphy domain.

### From Tau Ceti

- `NumberField.IsTotallyPositive` with its multiplicative API, `totallyPositiveUnits`,
  `totallyPositiveIntegerUnits`, `finiteIndex_totallyPositiveUnits`,
  `exists_isTotallyPositive_sub_mem` (every residue class contains a totally positive integer).
- `NumberField.NarrowClassGroup`, `NarrowClassGroup.mk`, `mk_surjective`, `mk0`, `mk0_eq_mk0_iff`,
  `mkPrincipal_eq_one_iff`, `toClassGroup` with its kernel, finiteness
  (`NarrowClassGroup/Finite.lean`), and `narrowEquivNarrowClassGroup` to the ray class group of
  `narrowModulus F`.
- `TauCeti.NumberField.HasLMFDBIntrinsicLabel F d r D` (`NumberField/IntrinsicLabel.lean`), the
  intrinsic prefix of the field label.
- `TauCeti.GlobalNumberFields.Modulus`, `RayClassGroup`, `RayClassCharacter`,
  `RayClassCharacter.onIdeals`, `HeckeCharacter`, `HeckeCharacter.IsFiniteOrder`,
  `conductor`, `idealCharacter`, `IsAlgebraic`, `AlgebraicInfinityType`,
  `ContinuousInfinityType.baseChange`.
- `TauCeti.IdealArithmeticFunction`, `zeroExtend`, `normCoeff`, `EulerProductData`.
- `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub`
  (`TauCeti/NumberTheory/NumberField/DedekindZeta.lean`): the holomorphic remainder
  on Re(s)>1−1/[F:ℚ], agreeing with ζ_F(s)−ρ/(s−1) on Re(s)>1.
- `HeckeCharacter.idealCharacter_apply_toPrincipalIdeal_eq_embeddingCharacter_inv`
  (`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean`):
  the inverse monomial law for a matching infinity type and a totally positive
  generator congruent to 1 modulo the finite conductor.
- `HeckeRing.GL2.Newform N k`, `Newform.dirichletLift`, `TauCeti.CoefficientField`,
  `Newform.satakeParameters`, and the classical Hecke-ring realization of
  `TauCeti.NumberTheory.HeckeRing.*`, whose double-coset formalism Layer 5 reuses.

### From TauCetiRoadmap.KTheoryLowDegrees

- §5.4, index ideal of a map of lines: for the inclusion det(rL′)→det(L),
  its local determinant scalar generates the index ideal, with invariance under
  line isomorphisms. Section 1.1 clears r to obtain a fractional ideal.

### From TauCetiRoadmap.AutomorphicSpectralTheory

- §1.5 (cuspidal constant term), §1.15a (meromorphic Eisenstein series and
  intertwining identities), and §1.15b (rank-one scattering coefficient): take
  GL₂ over F, upper Borel induction, fixed finite level, weight two at every real
  place, and self-dual trace-character measures. With induction difference
  t=1+2s, the spherical finite factor is L^S(t,χ)/L^S(t+1,χ); retain the raw
  local operators at every exceptional finite place. No spherical assumption
  is made at level primes. Section 4.2 compares these families with its cusp sums.

## How to read the build

Each milestone states what is proved, under which hypotheses, and what it rests on. "Rests on"
names Mathlib, Tau Ceti at the pin, preceding targets or exact supplier sections. Layers 0–2
set the nonparallel analytic conventions; Layers 3–5 give estimates and operators; Layer 6
compares adelic forms; Layers 7–11 construct newforms and their arithmetic dictionaries.
The general-form estimate in §3.3 is a consequence of §4.3 and is not an input to it.

## Layer 0: the domain, the group, the slash action, holomorphy

### 0.1 The domain and the action

Define `UpperHalfSpace` as InfinitePlace F→ℍ, `realEmbedding` as the real embedding
σ_w, `toGLReal` as its map on GL₂, and `GL2Pos` as the subgroup of matrices of
totally positive determinant. The coordinate projections `entry` and `det₀`
read the matrix and its nonzero determinant. Define the componentwise action through
`UpperHalfPlane.glAction`. Its API is:

- The real embeddings preserve 0, 1, addition and multiplication; mapping matrices
  preserves products and inverses (`Matrix.GeneralLinearGroup.map`).
- The action is a group action and is continuous in z; its w coordinate is
  (a_w z_w+b_w)/(c_w z_w+d_w), whose denominator is nonzero on ℍ
  (`UpperHalfPlane.coe_smul_of_det_pos`, `UpperHalfPlane.denom_ne_zero`).
- Its imaginary part is σ_w(det γ) Im(z_w)/|c_w z_w+d_w|²
  (`UpperHalfPlane.im_smul_eq_div_normSq`); positive determinant makes it positive.
- Its kernel is the scalar matrices: a Möbius map fixing every z has c=b=0
  and a=d by the quadratic polynomial identity, and embeddings are injective.
  Holomorphy follows from the displayed rational formula.

**Checks.**

- Identity has entries (1,0;0,1), determinant 1, denominator 1 and sends i to i.
- Translation (1,1;0,1) sends i to 1+i, with imaginary part 1; it is not in the kernel.
- Inversion (0,−1;1,0) sends 2i to i/2: 1·2/|2i|²=1/2.
- Scalar 2I has determinant 4 at each place and sends i to i; the negative-determinant
  matrix diag(−1,1) has determinant −1 and is excluded from this subgroup.

*Needs:* Mathlib `UpperHalfPlane.glAction`, the displayed Möbius declarations,
`Matrix.GeneralLinearGroup.map`; Tau Ceti `NumberField.IsTotallyPositive`.

### 0.2 Holomorphy on ℍ^Σ

Define `IsHolomorphic` by complex differentiability of the coordinatewise
`UpperHalfPlane.ofComplex` extension on the open polyhalf-plane. Its API is:

- Sums, products and scalar multiples are holomorphic, as are compositions with
  the action of §0.1 (`DifferentiableOn.add`, `DifferentiableOn.mul`,
  `DifferentiableOn.const_smul`, `DifferentiableOn.comp`).
- This predicate agrees with manifold differentiability on the product of upper
  half-planes, by `UpperHalfPlane.mdifferentiable_iff` in each product chart.
- The functions exp(2πi Tr(μz)) are holomorphic, by complex exponential and linearity
  of the trace pairing. Locally uniform limits of holomorphic functions on this
  open set are holomorphic; prove this product-domain comparison using the
  coordinate Cauchy integrals.
- For a closed polydisc centred at z inside the holomorphy domain, with radii
  r_w>0 and |f|≤M on it, prove |∂_w f(z)|≤M/r_w by
  `Complex.cderiv_eq_deriv` and `Complex.norm_cderiv_le`
  (`Mathlib/Analysis/Complex/LocallyUniformLimit.lean`). Iterating the Cauchy
  integrals gives |∂^α f(z)|≤M∏_w α_w!/r_w^α_w for every multi-index α.

**Checks.**

- Constant 1 has derivative 0; every Cauchy bound reads 0≤M/r_w for M≥1.
- On a polydisc centred at z₀, f(z)=z_w−z₀,w has derivative 1 and M=r_w,
  giving 1≤r_w/r_w=1. Radius zero is excluded, not assigned a 0/0 estimate.
- The function conj(z_w) has real-direction derivative 1 and imaginary-direction
  quotient −1; it is not complex differentiable.

*Needs:* §0.1; Mathlib `UpperHalfPlane.ofComplex`, `UpperHalfPlane.mdifferentiable_iff`,
`piChartedSpace`, and the Cauchy declarations above.

### 0.3 The weight-k slash

Define `Weight` as an integer vector with common parity, `Weight.IsParallel` as
constancy, `Weight.top` as its maximum k₀, and `Weight.m` by m_w=(k₀−k_w)/2.
Define `slash` by the arithmetic formula in Conventions (Dembélé–Voight,
§7, equation (7.10), arXiv:1010.5727v2). Its API is:

- The maximum exists since a number field has a nonempty finite set of infinite
  places; m_w≥0 and k_w+2m_w=k₀. The parity hypothesis makes integer division exact.
- The slash is additive and complex-linear, fixes f at the identity, and satisfies
  (f∣γ)∣δ=f∣(γδ), by `UpperHalfPlane.denom_cocycle` and multiplicativity of determinant.
- For every nonzero scalar a, f∣(aI)=N(a)^(k₀−2)f, with signed norm. This follows
  from 2(k_w+m_w−1)−k_w=k₀−2 at each place.
- The slash preserves holomorphy. For parallel weight it is the product of
  Mathlib's one-variable arithmetic factors (`ModularForm.slash_def`).

**Checks.**

- Weights (2,4) give k₀=4 and m=(1,0), with (2+2,4+0)=(4,4).
- Weights (2,3) are rejected: the difference −1 is odd, and division would give
  2+2·0=2≠3. Parallel (4,4) gives m=(0,0) and is parallel; (2,4) is not.
- Scalar 2 over ℚ(√5) in parallel weight four gives at each place 4³·2⁻⁴=4,
  hence total factor 16=N(2)². The identity factor is 1; translation has factor 1.
- The norm −1 unit (1+√5)/2 at odd parallel weight three acts by −1;
  replacing signed norm by absolute norm would incorrectly give +1.

*Needs:* §§0.1–0.2; Mathlib `UpperHalfPlane.denom_cocycle`,
`ModularForm.slash_def`, finite nonempty infinite places.

### 0.4 The unitary normalization

Define the unitary slash by the factor ∏_w σ_w(det γ)^(k_w/2)j_w^(−k_w),
using real powers of positive determinants. Its API is:

- It is a complex-linear right slash action preserving holomorphy, by the same
  determinant and denominator cocycles as §0.3.
- The arithmetic slash is N(det γ)^((k₀−2)/2) times the unitary slash, since
  k_w+m_w−1−k_w/2=(k₀−2)/2 at every place.
- On matrices with totally positive unit determinant their ratio is 1, so the
  invariant spaces for the two normalizations coincide on Γ₀(𝔫)_𝔟.
  Mathlib's one-variable GL₂ slash is the arithmetic normalization.

**Checks.**

- Scalar 2 in weight four over ℚ(√5) has unitary factor (4²·2⁻⁴)²=1;
  the arithmetic/unitary ratio is N(det(2I))=16.
- In parallel weight two the ratio is N(det γ)^0=1 for every γ, not only units.
- For γ=diag(ε,1), ε=(3+√5)/2 of norm 1, the norm ratio is 1 in every weight;
  for γ=diag(2,1) in weight four the ratio is 4, so equality fails.

*Needs:* §0.3; Tau Ceti `NumberField.norm_pos_of_isTotallyPositive`.

### Examples

Over ℚ(√5), inversion sends (2i,2i) to (i/2,i/2), whereas scalar 2 fixes
both coordinates. The latter still acts on weight-four functions by 16 under
the arithmetic slash and by 1 under the unitary slash.

### Dependencies

Mathlib product complex analysis and real matrix action; the parallel-weight supplier in Scope and ownership.

## Layer 1: lattices, the groups `Γ₀(𝔫)_𝔟`, and cusps

### 1.1 The lattices `L_𝔟` and their stabilizers

Define `L_𝔟 := {(x, y) ∈ F² : x ∈ 𝒪_F, y ∈ 𝔟}` as an `𝒪_F`-submodule of `Fin 2 → F`, prove it is
a full lattice (free of rank `2[F:ℚ]` over `ℤ`, spanning `F²` over `ℚ`; projective of rank `2` over `𝒪_F`, without asserting freeness when `𝔟` is nonprincipal), define
`Γ_𝔟 := {γ ∈ GL₂⁺(F) : γ L_𝔟 = L_𝔟}`, and prove the matrix description of the pinned
conventions: `γ ∈ Γ_𝔟 ↔ a, d ∈ 𝒪_F ∧ b ∈ 𝔟⁻¹ ∧ c ∈ 𝔟 ∧ det γ ∈ 𝒪_{F,+}^×`
(Assaf et al., arXiv:2301.10302v2, §2.1, (2.1.4)–(2.1.5), p. 3). Prove
`Γ_{𝒪_F} = GL₂⁺(𝒪_F)`, and that `Γ_𝔟 ∩ SL₂(F)` is Mathlib's `SL₂(𝒪_F)` conjugated when `𝔟` is
principal. Define the *generalized index* [L:L′] of two full lattices in F²
by choosing nonzero r∈𝒪_F with rL′⊆L and taking (r)⁻² times the supplied
index ideal of the determinant-line inclusion det(rL′)→det(L)
(KTheoryLowDegrees §5.4). Prove independence of r, agreement with the
product of elementary-divisor ideals for L′⊆L, and `[L_𝔟 : γ L_𝔠] = (det γ) 𝔠 𝔟⁻¹`, and
`[L_𝔟 : L_𝔠] = 𝔠𝔟⁻¹` when `𝔠 ⊆ 𝔟` (Voight, *Quaternion algebras*,
August 5, 2026 edition, Definition 9.6.1, Lemmas 9.6.3–9.6.4, 9.6.7 and
9.6.9, pp. 143–144). The determinant-line ratio gives the definition without
an inclusion; after localization it is the determinant of a change of basis,
so multiplication along chains and the displayed formulas follow, including
for nonprincipal ideals.

*Rests on:* Mathlib `FractionalIdeal`, `Module.Free`; Tau Ceti `totallyPositiveIntegerUnits`; KTheoryLowDegrees §5.4 (determinant-line indices).

**Checks.**

- Over ℚ(√5), with w=(1+√5)/2, (1,0),(w,0),(0,1),(0,w) give ℤ-rank 4=2·2.
- Over ℚ, the same rank formula gives 2=2·1.
- For nonprincipal 𝔟, the determinant module is 𝔟; a free 𝒪_F-basis would incorrectly make it principal.
- Over ℚ, [ℤ²:diag(2,3)ℤ²]=(6), while reversing the two lattices gives (1/6).
  For the identity matrix the index is (1); using an inverse determinant swaps 6 and 1/6.
- The chain ℤ² ⊇ (2ℤ⊕ℤ) ⊇ (2ℤ⊕3ℤ) gives (2)(3)=(6).
- For L=ℤ² and L′=3ℤ⊕(1/2)ℤ, clearing by r=2 gives 6/4=3/2,
  and r=4 gives 24/16=3/2; omitting the rank-two correction gives 6 or 24.


The lattice and index API follows the definitions above.

- The lattice has rational span F² and determinant module 𝔟; its stabilizer is the displayed matrix subgroup.
- Generalized indices multiply along lattice chains and transform by the determinant ideal.

### 1.2 The congruence subgroups

Define `Γ₀(𝔫)_𝔟 := {γ ∈ Γ_𝔟 : c ∈ 𝔫𝔟}`, `Γ₁(𝔫)_𝔟 := {γ ∈ Γ₀(𝔫)_𝔟 : d - 1 ∈ 𝔫}`,
`Γ(𝔫)_𝔟 := {γ ∈ Γ₁(𝔫)_𝔟 : a - 1 ∈ 𝔫, b ∈ 𝔫𝔟⁻¹}`, and for each the determinant-one subgroup
`Γ_i¹(𝔫)_𝔟 := Γ_i(𝔫)_𝔟 ∩ SL₂(F)` (the LMFDB's `sl` ambient type; the sibling
`HilbertModularSurfaces` reads `Γ₀¹(𝔫)_𝔟` and `Γ(𝔫)_𝔟` from here). Prove: all are subgroups;
`Γ(𝔫)_𝔟 ⊴ Γ_𝔟` is the kernel of reduction modulo `𝔫` on `L_𝔟`; `det` maps `Γ₀(𝔫)_𝔟` and
`Γ₁(𝔫)_𝔟` onto `𝒪_{F,+}^×` and `Γ(𝔫)_𝔟` onto `{ε ∈ 𝒪_{F,+}^× : ε - 1 ∈ 𝔫}`, with kernels
`Γ_i¹(𝔫)_𝔟` and sections `ε ↦ diag(ε, 1)`; `[Γ_𝔟 : Γ₀(𝔫)_𝔟] = N(𝔫) ∏_{𝔭 ∣ 𝔫}(1 + N𝔭⁻¹)` (every element of `Γ_𝔟` is
`diag(ε, 1)` times an element of `SL(L_𝔟)`, and `diag(ε, 1) ∈ Γ₀(𝔫)_𝔟`, so the index is that of
the Borel in SL₂(𝒪_F/𝔫). For nonprincipal 𝔟, trivialize the invertible
module 𝔟/𝔫𝔟 over 𝒪_F/𝔫 and lift elementary upper and lower unipotents
from 𝔟⁻¹ and 𝔟; these generate SL₂ of each local factor, giving surjectivity
from SL(L_𝔟), without claiming that L_𝔟 is free);
`Γ₀(𝔫)_𝔟 ⊆ Γ₀(𝔪)_𝔟` for `𝔪 ∣ 𝔫`; `Γ₀(𝔫)_𝔟` contains the translations `(1 b; 0 1)`, `b ∈ 𝔟⁻¹`,
and the diagonal matrices `(ε 0; 0 1)`, `(ε 0; 0 ε)`, `ε ∈ 𝒪_{F,+}^×`; the image of `Γ₀(𝔫)_𝔟` in
`∏_w PGL₂(ℝ)` is discrete. For `F = ℚ` (excluded from the roadmap, but the sanity check is
stated) the definitions reduce to `Γ₀(N)` (Assaf et al., §2.1,
(2.1.4), (2.1.7)–(2.1.10), p. 3, and §2.2, p. 4, for the groups,
determinant sequences and projective discreteness; Cremona,
arXiv:2601.17524v1, §2, p. 3 and §2.2, p. 4, for the index and reduction
argument in the free component). The nonprincipal extension uses the
local trivialization just described and the count
#ℙ¹(𝒪_F/𝔭^r)=(N𝔭)^r+(N𝔭)^(r−1), for r≥1, followed by the
Chinese remainder theorem.

Assaf's Γ₁ imposes a≡1, whereas this roadmap imposes d≡1.
With J=(0 −1;1 0), conjugation γ↦JγJ⁻¹ identifies Assaf's
Γ₁(𝔫) at the fractional ideal 𝔫⁻¹𝔟⁻¹ with this Γ₁(𝔫)_𝔟:
(a b;c d) maps to (d −c;−b a). This also identifies the corresponding Γ₀ groups; it does not equate the two Γ₁ subgroups at
an unchanged component. The determinant sections here are diag(ε,1),
where the a-congruence convention instead uses diag(1,ε).

*Rests on:* 1.1; Mathlib `Matrix.SpecialLinearGroup`, `Ideal.absNorm`; the finiteness of
`𝒪_F/𝔫`.


The subgroup API is the reduction and determinant comparison above.

- Reduction, inclusion at divisible levels, and determinant-one kernels commute with the inclusions into GL₂⁺(F).
- Translations by 𝔟⁻¹ and the stated unit diagonals belong to Γ₀; the determinant sections recover their input units.

**Checks.**

- At unit level the reduction target is the zero quotient and Γ(1)=Γ₁(1)=Γ₀(1)=Γ_𝔟.
- Over ℚ at level 2, (1,1;0,1) is in Γ₀ and Γ₁, but not Γ(2): its upper-right entry is 1 mod 2.
- At level 2 the lower unipotent (1,0;1,1) is excluded from Γ₀, while (1,0;2,1) belongs.
- Over ℚ(√5), put w=(1+√5)/2 and u=w²=w+1. Modulo (2), u−1=w≠0,
  so diag(u,1) meets this Γ₁ condition but not Assaf's at the same component;
  conjugation by J gives diag(1,u), with a−1=0. Here u is totally positive.
- Over ℚ the indices at levels 1, 2 and 4 are 1, 3 and 6; at norm-2 prime
  power exponent two the local count is 2²+2=6, not 2²+1=5.

### 1.3 Commensurability and conjugation

Prove that for `γ ∈ GL₂⁺(F)` the groups `Γ₀(𝔫)_𝔟` and `γ Γ₀(𝔫)_𝔠 γ⁻¹` are commensurable
(Mathlib's `Commensurable`), with `γ Γ_𝔠 γ⁻¹ = Γ_{γ 𝔠}` when `γ L_𝔠` is again of the form `L_{𝔟}`.
Prove the **component transport**: for `α ≫ 0`, `diag(1, α) Γ₀(𝔫)_𝔟 diag(1, α)⁻¹ = Γ₀(𝔫)_{α𝔟}`.
Prove that `L_𝔟 ≅ L_𝔠` as `𝒪_F`-modules iff `[𝔟] = [𝔠]` in `ClassGroup`, and that an isomorphism
of totally positive determinant exists iff `[𝔟] = [𝔠]` in `NarrowClassGroup F` (Steinitz class
with sign).

*Rests on:* 1.1, 1.2; Mathlib `Subgroup.Commensurable`; Tau Ceti `NarrowClassGroup.mk0_eq_mk0_iff`.

### 1.4 Cusps

The boundary is `ℙ¹(F)`, acted on by `GL₂⁺(F)`. Define the cusp set C(Γ) := Γ \ ℙ¹(F) for
`Γ = Γ₀(𝔫)_𝔟`. Prove: the map `(a : c) ↦ [a𝒪_F + c𝔟⁻¹] ∈ ClassGroup (𝓞 F)` is constant on
`Γ_𝔟`-orbits and induces a bijection C(Γ_𝔟) ≃ ClassGroup (𝓞 F), so `Γ_𝔟` has `h_F` cusps;
C(Γ₀(𝔫)_𝔟) is finite, of cardinality at most `h_F · [PΓ_𝔟 : PΓ₀(𝔫)_𝔟]`; the stabilizer
`Γ_κ` of a cusp `κ` is conjugate in `GL₂⁺(F)` to a group of upper triangular matrices
`(ε b; 0 ε')` whose translation part `Λ_κ := {b : (1 b; 0 1) ∈ γ⁻¹Γγ}` is a full lattice in `F` and
whose unit part `U_κ := {ε/ε'}` is a finite-index subgroup of `𝒪_{F,+}^×`. For every nonzero level, put
𝔤_𝔞=𝔞+𝔫𝔞⁻¹ for each integral ideal divisor 𝔞 of 𝔫, and let U_𝔞 be the
image of the totally positive units under reduction to (𝒪_F/𝔤_𝔞)^×. Prove

    #C(Γ₀(𝔫)_𝔟) = h_F Σ_{𝔞|𝔫} #((𝒪_F/𝔤_𝔞)^× / U_𝔞).

For each ordinary ideal class and each divisor 𝔞, the corresponding cusp fibre
is a torsor for this quotient; choosing residue generators identifies it with
the quotient, without claiming a canonical choice of generator. The formula
is independent of 𝔟 (Assaf et al., arXiv:2301.10302v2, §3.1, Lemma 3.1.8,
p. 6; proof of Corollary 3.1.18, (3.1.20)–(3.1.21), p. 7; Corollary 3.1.23
and (3.1.25)–(3.1.27), pp. 7–8). Their §3.1 permits every totally real F;
the total over narrow components has the additional factor h_F⁺.
For squarefree 𝔫 every 𝔤_𝔞 is the unit ideal, its residue unit group has one
element, and the formula becomes h_F·2^(ω(𝔫)).

*Rests on:* 1.1–1.3; Mathlib `ClassGroup`; Tau Ceti `finiteIndex_totallyPositiveUnits`.


The cusp API retains the translation and unit data at each chosen cusp.

- The ideal-class map is unchanged by scaling homogeneous coordinates and by Γ_𝔟; its fibres are the orbits at full level.
- Conjugation to infinity identifies cusp stabilizers, translation lattices and finite-index positive-unit groups.
- The ordinary-class and divisor fibres have the displayed unit-quotient cardinality,
  and their sum counts the cusps of each component, without a narrow-class factor.

**Checks.**

- At level one over ℚ(√5), the class number is 1, so the cusp set has one element.
- For a squarefree one-prime level over ℚ(√5), the count is 1·2¹=2; at the unit level it is 1·2⁰=1.
- The coordinates (1:0) and (2:0) define the same cusp and ideals (1),(2) of the same ordinary class; a coordinate-dependent ideal representative would fail.
- At level 𝔭² over ℚ(√5), take 𝔭=(2) and w=(1+√5)/2. The residue field
  is 𝔽₄, where w²=w+1 and w³=1. The positive unit w² maps to a generator
  of its three-element unit group, so the middle quotient has size 3/3=1.
  The three divisors 1,𝔭,𝔭² therefore contribute 1+1+1=3 cusps, whereas
  omitting the positive-unit image would give 1+3+1=5.

### 1.5 Systems of representatives

Define `NarrowRepresentatives F` (a section `rep` of `NarrowClassGroup.mk` on invertible
fractional ideals, `NarrowClassGroup.mk (rep c) = c`). Prove existence (`mk_surjective`), and
that for two systems `R, R'` and every class `c` there is `α_c ≫ 0` with `rep'(c) = α_c · rep(c)`,
unique up to `𝒪_{F,+}^×`; so by 1.3, `diag(1, α_c) Γ₀(𝔫)_{rep c} diag(1, α_c)⁻¹ = Γ₀(𝔫)_{rep' c}`.
The LMFDB's choice of the ideal `𝔟` for each component is a choice of `R` and carries no
mathematics; the induced isomorphism of the spaces of forms is 2.3.

*Rests on:* 1.3; Tau Ceti `NarrowClassGroup.mk_surjective`, `mk0_eq_mk0_iff`.


The representative-system API uses the native narrow quotient.

- Every class has a representative; two representatives differ by a totally positive principal ideal.
- Two positive generators differ by a positive unit, which acts trivially in the form transport.

**Checks.**

- Over ℚ(√5) the index set has one element, whereas over ℚ(√6) it has two.
- Replacing 𝔟 by 2𝔟 multiplies its norm by 4 in degree two and preserves its narrow class.
- Over ℚ(√6), multiplication by √6 has norm −6 and gives the nontrivial narrow class; an arbitrary principal generator cannot replace a positive one.

### Examples

The discriminating examples are the Checks in §§1.1–1.5: the quadratic lattice basis and component classes.

### Dependencies

Layer 0; fractional ideals and narrow classes from the exact supplier contracts; KTheoryLowDegrees §5.4.

## Layer 2: Fourier expansions, Koecher's principle, the spaces

### 2.1 Fourier expansion of a periodic holomorphic function

For a full lattice `Λ ⊂ F` (an additive subgroup, free of rank `n`, spanning `F`), define its
trace dual `Λ^∨ := {μ ∈ F : Tr_{F/ℚ}(μΛ) ⊆ ℤ}`; prove it is a full lattice, `(Λ^∨)^∨ = Λ`, and
`(𝔟⁻¹)^∨ = 𝔟𝔡⁻¹` for a fractional ideal (Mathlib: `FractionalIdeal.dual ℤ ℚ 𝔟⁻¹ = 𝔟 · 𝔡⁻¹` via
`coeIdeal_differentIdeal`). Prove that a holomorphic `f : ℍ^Σ → ℂ` with `f(z + b) = f(z)` for all
`b ∈ Λ` has a unique expansion `f(z) = Σ_{μ ∈ Λ^∨} a(μ) e(Tr(μz))`, absolutely and locally
uniformly convergent, with `a(μ) = ∫_{F_ℝ/Λ} f(x + iy) e(-Tr(μ(x + iy))) dx` for every
`y ∈ (ℝ_{>0})^Σ`, and the coefficient bound `|a(μ)| ≤ sup_{x} |f(x + iy)| · e^{2π Tr(μy)}`.
`F_ℝ := Σ → ℝ`, `x + iy` the point with coordinates `x_w + i y_w`. Suggested.lean defines `a(μ)`
for any `f` as the limit, as `T → ∞`, of the means of `f(x + i) e(-Tr(μ(x + i)))` over the boxes
`[-T, T]^Σ` (`y_w = 1` at every place); for `f` as above this limit exists and equals the integral,
and it needs no choice of `Λ`.

Prove the lattice-coordinate comparison: a ℤ-basis of Λ identifies F_ℝ/Λ,
with probability Haar measure, with `UnitAddTorus (Fin n)` and identifies Λ^∨
with its integer characters through the trace pairing. Transport the coefficient
integral, independently of the chosen basis. Prove the holomorphic upgrade on
compact subsets of ℍ^Σ: shifting the integration contours inside a slightly larger
compact imaginary region gives exponentially summable majorants for the integer
frequency coordinates, uniformly on that compact subset. Apply the supplied
torus summation theorem to obtain pointwise equality and locally uniform absolute
convergence; L² equality alone is not this conclusion.

The Fourier-coefficient API is:

- The coefficient integral is independent of y and of the fundamental parallelotope,
  with Haar mass one; it is linear in f.
- The box-mean limit exists for periodic holomorphic f and equals that integral.
- The trace-dual support, coefficient bound and expansion uniqueness above hold;
  the lattice-coordinate comparison preserves the sign exp(2πi Tr(μz)).

**Checks.**

- On the coordinate two-torus, 1+2exp(2πix₁) has coefficients 1 at (0,0),
  2 at (1,0), and 0 at (0,1); a one-coordinate restriction cannot distinguish the latter two.
- For f=exp(2πi Tr(μz)), the μ coefficient is 1 at both y=(1,1) and y=(2,2):
  the factors exp(−2π Tr(μy)) and exp(2π Tr(μy)) cancel.
- For f=1 the zero coefficient is 1 and all nonzero lattice coefficients are 0;
  integrating with unnormalized covolume V would instead give V.

*Needs:* §0.2; Mathlib `UnitAddTorus.hasSum_mFourier_series_L2` and
`UnitAddTorus.hasSum_mFourier_series_of_summable`,
`UnitAddTorus.hasSum_mFourier_series_apply_of_summable`
(`Mathlib/Analysis/Fourier/AddCircleMulti.lean`, product probability Haar and continuous
functions with summable coefficients), and `differentIdeal`. The one-circle
`hasSum_fourier_series_L2` in `Mathlib/Analysis/Fourier/AddCircle.lean` is only the
one-dimensional specialization.

### 2.2 Koecher's principle

Let `f` be holomorphic with the expansion of 2.1 for `Λ`, and suppose `f(εz) = χ(ε) f(z)` for all
`ε` in a finite-index subgroup `U ⊆ 𝒪_{F,+}^×` and some character `χ : U → ℂ^×` (this is the
invariance under `(ε 0; 0 1) ∈ Γ`, with `χ(ε) = ∏_w ε_w^{-(k_w + m_w - 1)}`). Prove
**Koecher's principle**: `a(μ) ≠ 0` implies `μ = 0` or `μ ≫ 0`. The proof is the classical one
(Freitag, *Hilbert Modular Forms*, Ch. I §4): if `μ ≠ 0` were not totally positive, the orbit
`{εμ}` would contain elements with `Tr(εμ y)` unbounded below for a suitable `y`, and the
absolute convergence of the series at `z = iy` would fail against the growth of
`|a(εμ)| = |χ(ε)|^(∓1) |a(μ)|`. This uses `n ≥ 2` through the existence of units `ε` with `ε_w` large at one
place and small at another (Dirichlet's unit theorem, `NumberField.Units.rank`). Consequences:
`f` is bounded on every set `{z : Im z_w ≥ c > 0 ∀ w}`; `f(z) → a(0)` as `min_w Im z_w → ∞`
uniformly in `Re z`.

*Rests on:* 2.1; Mathlib `NumberField.Units.rank`, `logEmbedding`; Tau Ceti
`finiteIndex_totallyPositiveUnits`.

### 2.3 The spaces `M_k(Γ)` and `M_k(𝔫; R)`

For nonparallel k, and for the parallel weights below two, extend the supplied form spaces as follows
(Dembélé–Voight, arXiv:1010.5727v2, §7, (7.10), p. 37 and (7.19), p. 40,
for the arbitrary-weight, arbitrary-class component construction; the finite
character extension with its separate global law is §2.7).
For `Γ ≤ GL₂⁺(F)` commensurable with some `Γ_𝔟`, define `M_k(Γ)` as the
`Submodule ℂ (ℍ^Σ → ℂ)` of holomorphic `f : ℍ^Σ → ℂ` with `f ∣_k γ = f` for all `γ ∈ Γ` — **no
cusp condition** — with multiplication `M_k(Γ) × M_{k'}(Γ) → M_{k + k'}(Γ)` for weights of
compatible parity, and the restriction maps `M_k(Γ) → M_k(Γ')` for `Γ' ≤ Γ`. Prove the **parity lemma**: if `k₀` is odd and `𝒪_F` has a
unit of norm `-1`, then `M_k(Γ₀(𝔫)_𝔟) = 0` (slash by `(u 0; 0 u)`, which acts by `N(u)^{k₀-2}`);
more generally `M_k(Γ) = 0` whenever `Γ` contains a scalar `u·1` with `N(u)^{k₀} = -1`.
Define `M_k(𝔫; R) := ∏_{c} M_k(Γ₀(𝔫)_{rep c})`. Prove the **component transport**: for two
systems `R, R'` with the `α_c` of 1.5, `f ↦ (N(α_c)⁻¹ (f_c ∣_k diag(1, α_c)⁻¹))_c` is a linear isomorphism
`M_k(𝔫; R) ≃ M_k(𝔫; R')` (1.3 gives the invariance), independent of the choice of the `α_c`
because `diag(1, ε)` with `ε ∈ 𝒪_{F,+}^×` lies in `Γ₀(𝔫)_𝔟` and acts trivially. Every invariant
of `f` below is proved invariant under this transport. Prove that the translations `(1 b; 0 1)` and diagonals `(ε 0; 0 1)` of 1.2 give each component
the hypotheses of 2.1 and 2.2, so every `f_𝔟` has a Fourier expansion over `(𝔟𝔡⁻¹)_+ ∪ {0}`
with the unit law `a_𝔟(εμ) = ∏_w ε_w^{k_w + m_w - 1} a_𝔟(μ)` for `ε ∈ 𝒪_{F,+}^×`.

*Rests on:* 0.3, 1.2, 1.3, 1.5, 2.1, 2.2.

**Checks.**

- Over `ℚ(√6)` (`2.2.24.1`, `h_F = 1`, `h⁺_F = 2`) a form of level `𝒪_F` is a tuple of two
  components; over `ℚ(√5)` (`2.2.5.1`, `h⁺_F = 1`) the tuple has one component for every `R`.
- The transport from `R` to itself is the identity: `α_c` may be taken in `𝒪_{F,+}^×`, and
  `diag(1, ε)` lies in `Γ₀(𝔫)_𝔟` and acts trivially.
- Over `ℚ(√5)` every odd parallel weight has `M_k(Γ₀(𝔫)_𝔟) = 0` (parity lemma, `N(w) = -1`); over
  `ℚ(√3)`, where no unit has norm `-1`, the parity lemma says nothing.
- The constant function `1` lies in `M_0(Γ)` and in no `M_k(Γ)` with `k ≠ 0`; `z ↦ e(Tr(μz))` for
  `μ ∈ 𝔡⁻¹` with `σ_1(μ) > 0 > σ_2(μ)` is holomorphic and `𝒪_F`-periodic but is not in `M_k`.


The form-space API extends the supplied parallel spaces.

- Addition and complex scalar multiplication are pointwise; restriction along subgroup inclusion is injective.
- Representative transport is a linear equivalence, with inverse given by reciprocal positive generators, and preserves the full expansion data with their transport factors.

### 2.4 Normalized coefficients

Extend the supplied parallel coefficient map to nonparallel weights by the pinned convention
(Dembélé–Voight, arXiv:1010.5727v2, (7.10), p. 37, for the arithmetic slash;
Raghuram–Tanabe, June 20, 2011 version, §4.1.2, (4.3) and the coefficient
definition immediately below (4.4), p. 27, for the normalization in unitary slash).
The explicit adapter is 𝔟=t_ν𝔡, so their exponent ξ=μ and ideal
𝔪=(μ)t_ν⁻¹=(μ)𝔡𝔟⁻¹. The arithmetic slash of §0.3 is their unitary slash multiplied by
N(det γ)^(k₀/2−1); the two agree on Γ₀, whose determinant has norm one.
For the same component function their coefficient a_ν(μ)μ^(−k/2)
becomes c(𝔪,f)=N(μ)^(k₀/2)a_ν(μ)μ^(−k/2)=a_ν(μ)μ^m here.
This derives the different and norm factors from the trace-dual lattice,
rather than using the unadjusted ideal indexing in Dembélé–Voight's Example 7.26.
Prove it independent of the generator `μ`: for
`μ' = εμ`, `a(εμ) ∏ (εμ)_w^{m_w} = ∏ ε_w^{k_w + 2m_w - 1} a(μ) ∏ μ_w^{m_w} = N(ε)^{k₀ - 1} a(μ) ∏ μ_w^{m_w}`
and `N(ε) = 1`. Prove that the full expansion map `f ↦ ((a_0(f_c))_c, c(·, f))` is injective on `M_k(𝔫; R)`
for nonzero level and degree at least two, by uniqueness in 2.1 and Koecher. Prove separately
that positive ideal coefficients determine a cusp form, since its constant terms are zero.
Prove that the positive coefficient map is invariant under the transport of 2.3, and that in parallel
weight `c(𝔪, f) = a_𝔟(μ)`. Package `c(·, f)` as `TauCeti.IdealArithmeticFunction F` and prove
linearity in `f`. Define the constant terms `a_0(f_𝔟)`.

*Rests on:* 2.3; Tau Ceti `IdealArithmeticFunction`, `zeroExtend`.

**Checks.**

- In weight zero, 1 and 0 have positive coefficients all zero, but standard constants 1 and 0.
- On cusp forms the missing constant coordinate is zero; zero coefficients give the zero form.
- Over a quadratic field, 𝔟′=2𝔟 gives c′=4c under raw slash and c′=(4/4)c=c under §2.3; a positive unit has norm 1.
- For the normalization factor at weight (2,4), positive coordinate inputs (2,3) and raw coefficient 1,
  the unitary coefficient is 1/(2·3²)=1/18; multiplication by N(μ)²=36
  gives 2=2¹3⁰, the arithmetic coefficient. In parallel weight two the
  corresponding values are 1/6 and 6·(1/6)=1.


The coefficient API includes constants separately.

- Normalized positive coefficients are linear in the form and independent of the positive generator and representative transport.
- The full standard expansion is injective, and its restriction to the cusp space is injective without the zero coordinate.

### 2.5 Constant terms at every cusp

For `f ∈ M_k(Γ)` and `γ ∈ GL₂⁺(F)`, prove that `f ∣_k γ ∈ M_k(γ⁻¹Γγ)` and that `γ⁻¹Γγ` again
contains a full translation lattice and a finite-index unit group, so `f ∣_k γ` has an expansion
and a constant term `a_0(f ∣_k γ)` (2.1–2.2). Prove that `a_0(f ∣_k γ)` depends only on the cusp
γ • ∞ ∈ C(Γ) up to a nonzero scalar (`a_0(f ∣_k γδ) = ∏_w σ_w(det δ)^{k_w+m_w-1} σ_w(d)^(−k_w) a_0(f ∣_k γ)`
for an upper triangular δ=(a b;0 d) fixing ∞; both diagonal entries are nonzero), hence that the vanishing of `a_0(f ∣_k γ)` is a property of the
cusp. Prove **cuspidality in non-parallel weight**: if `k` is not parallel, then every constant
term vanishes (the unit law of 2.3 at `μ = 0` reads `a_0 = ∏_w ε_w^{-m_w} a_0` for `ε ∈ U_κ`, and
`∏_w ε_w^{m_w} ≠ 1` for some `ε` when the `m_w` are not all equal, by Dirichlet's unit theorem).

*Rests on:* 1.4, 2.1–2.4; Mathlib `NumberField.Units.rank`.

### 2.6 Cusp forms

Define `S_k(Γ) := {f ∈ M_k(Γ) : ∀ γ ∈ GL₂⁺(F), a_0(f ∣_k γ) = 0}` and prove it equals the
kernel of the finite family of constant-term maps indexed by C(Γ) (2.5). Prove that
`S_k(Γ)` is stable under `f ↦ f ∣_k γ` for `γ ∈ GL₂⁺(F)` (as a map `S_k(Γ) → S_k(γ⁻¹Γγ)`), under
the restriction maps, and that `M_k(Γ) · S_{k'}(Γ) ⊆ S_{k+k'}(Γ)`. Prove the **decay at cusps**:
for `f ∈ S_k(Γ)` and every `γ`, `(f ∣_k γ)(z) → 0` as `min_w Im z_w → ∞`, uniformly in `Re z`,
with the rate `O(e^{-c · min_w Im z_w})`. In Suggested.lean the condition `a_0(f ∣_k γ) = 0` is
written as convergence to `0` of the box means of 2.1 together with integrability of `f ∣_k γ` on
every box, which every holomorphic `f` satisfies; this keeps `S_k(Γ)` visibly a submodule.

*Rests on:* 2.2, 2.5.


The cusp-space API uses all cusps.

- It is the kernel of the finite family of constant maps, and is a complex submodule.
- Restriction and slash transport preserve cusp forms; the decay estimate is uniform in the real parts at each cusp.

**Checks.**

- The zero form has every constant term 0 and decay bound 0.
- The weight-zero constant 1 has a₀=1 and is excluded, despite all its positive coefficients being 0.
- At the infinity cusp exp(2πi Tr(z)) along z=(it,…,it) has absolute value exp(−2πnt)→0; its zero constant alone does not establish modularity or vanishing at other cusps.

### 2.7 Finite nebentypus and the nonparallel extension

For a finite-order Hecke character η with infinity part
η_∞(x)=∏_w sgn(x_w)^(k_w) and finite conductor dividing 𝔫, define the
character space by both its global central law and its finite-level law. In the
adelic carrier of GL2AutomorphicRepresentationsAndTransfer R16.1.6 require

    Ψ(g zI) = η(z)⁻¹ |z|_𝔸^{k₀−2} Ψ(g)       (z ∈ 𝔸_F^×),
    Ψ(g u) = (∏_{v|cond(η)_finite} η_v(d_v))⁻¹ Ψ(g)       (u ∈ K₀(𝔫)).

Here d_v is the lower-right entry of u and is a unit at each place in the
product; |π_v|_v=(N𝔭_v)⁻¹ and the infinite norm is ∏_w |x_w|.
These two laws agree on scalar finite units. The infinity condition makes the
central law agree with the arithmetic slash on real scalars, including negative
ones, and η is trivial on diagonal F^×. Transport both laws to tuples through
§6.1–§6.2, writing M_k(𝔫,η;R) and S_k(𝔫,η;R) for the resulting spaces.
The component law is `f_𝔟∣γ=(∏_{v|cond(η)_finite} η_v(d)) f_𝔟` for
γ∈Γ₀(𝔫)_𝔟; it is imposed together with the transported global central law.
Equivalently these are the η eigenspaces for the full norm-normalized inverse
scalar (ray-class diamond) action on Γ₁ tuples, including the action between
components. This action is constructed by the scalar lattice correspondences
of §5.2 with the Γ₁ level data, and compared to adelic translation in §6.3.

Prove the unramified specialization to §5.2: if η is unramified at finite
places and ψ([𝔪])=η(𝔪), the local law is trivial, while inverse scalar translation
by a finite idele of ideal 𝔪 acts by η(𝔪) N𝔪^(k₀−2). Multiplication by
N𝔪^(−(k₀−2)) therefore gives precisely the ψ eigenspace of §5.2.
Parallel k≥2 uses the supplied character space; the extension here permits
nonparallel k and compares the two on their common domain, preserving constants
and normalized ideal coefficients (R16.1.6 for the fixed-central-character
carrier; Dembélé–Voight, arXiv:1010.5727v2, §7, (7.10)–(7.14), pp. 37–39,
for the slash and inverse finite action).

The character-space API is:

- Addition and scalar multiplication preserve the character law; its cusp forms are a submodule.
- Restriction to higher levels divisible by the character conductor and representative
  transport preserve the law.
- The classical–adelic comparison preserves this precise character action. Extend the Hecke and newform dictionary to these
spaces, using η(𝔭) at good primes and the full local parameter at bad primes. The
unramified-central-character conclusions of §§7.6–7.7 keep that explicit hypothesis.

**Checks.**

- For η=1 the local multiplier is 1, and the global law selects the trivial
  central eigenspace of §5.2, rather than the sum over all central characters.
- Over ℚ(√10), let 𝔭=(2,√10) and choose an ordinary class character η with
  η([𝔭])=−1. The ideal has 𝔭²=(2), and is nonprincipal since x²−10y²=±2 is
  impossible modulo 5. At level 1 and weight 0 both η and the trivial character
  have local multiplier 1. For the constant tuple, the matrix (2,√10;√10,6)
  has determinant 2 and carries 𝒪_F² onto 𝔭𝒪_F²; both lattices have index 4.
  The normalized central value at the principal component is 4·(1/4)=1,
  whereas η requires −1. The constant tuple lies in the trivial central space
  and is rejected by η.
- If χ has order three and ζ=χ(u) is primitive, twisting a trivial-character form
  gives multiplier χ(u)²=ζ²≠1 on the scalar unit u, and lands in the χ² space.
- For quadratic χ, χ(u)²=1 and the twisted central character is unchanged.

*Needs:* the parallel-weight supplier in Scope and ownership; §§1.2, 2.3–2.6; GL2AutomorphicRepresentationsAndTransfer R16.1,
finite-level comparison. The Γ₁ scalar correspondence construction uses §5.2; the adelic identification
is proved in Layer 6. Neither the untwisted spaces nor §5.2 use this comparison.

### Examples

The discriminating examples are the Checks in §§2.3–2.7: constant forms, representative changes and character spaces.

### Dependencies

Layers 0–1; Fourier analysis and the parallel-weight expansion and character contracts.

## Layer 3: reduction theory and finite dimensionality

### 3.1 Siegel sets

Define, for a cusp `κ` of `Γ` with the data `(Λ_κ, U_κ)` of 1.4 transported to `∞`, the Siegel
set `𝔖_κ(C, t) := γ_κ · {z : Re z ∈ C, Im z ∈ 𝒞_t}` where `C ⊂ F_ℝ` is a compact fundamental
parallelotope for `Λ_κ` and `𝒞_t ⊂ (ℝ_{>0})^Σ` is the set of `y` with `N(y) ≥ t` lying in a
fixed closed fundamental cone for the action of `U_κ` by `y ↦ ε y` (Mathlib's
`NumberField.mixedEmbedding.fundamentalCone` restricted to the positive orthant and to the
finite-index subgroup `U_κ`). Prove the **reduction theorem**: there is `t > 0` such that
`ℍ^Σ = Γ · ⋃_{κ ∈ C(Γ)} 𝔖_κ(C_κ, t)` — every orbit meets one of finitely many Siegel sets
by the cusp-coordinate specialization of AdelicAlgebraicGroups §3.4, “Siegel
sets cover” and “Siegel property”, applied to PGL₂/F and the projective image
of Γ. Identify its unipotent window with C_κ and its norm-one torus window
with the compact logarithmic unit domain of §1.4; its positive split-torus
coordinate is N(Im z). Enlarge the compact windows and lower the positive
threshold to include their boundaries. This is a comparison with the supplied
reduction theorem, with Γ_𝔟 and its finite-index subgroups as the arithmetic
lattices, and no extra scalar-unit intersections. Prove the
**Siegel-set finiteness**: the image of `{γ ∈ Γ : γ 𝔖_κ ∩ 𝔖_{κ'} ≠ ∅}` in the projective
group is finite, quotienting by the ineffective scalar units. The **height bound** is in
cusp coordinates: on `γ_κ⁻¹ 𝔖_κ(C, t)`, `min_w Im z_w ≥ c(t) > 0`.

*Rests on:* 1.4; AdelicAlgebraicGroups §§3.2 and 3.4 (real Siegel coordinates,
Siegel covering and Siegel property); Mathlib `NumberField.mixedEmbedding.fundamentalCone`, `NumberField.Units`;
the Minkowski lattice-point finiteness of
[Global Number Fields](../GlobalNumberFields/README.md) Layer 3A for the counting input.

**Checks.**

- For ε=(3+√5)/2, every εʲI fixes ℍ²; all these elements have one projective image.
- Under inversion, it maps to i/t: its ordinary height is 1/t, while its cusp-coordinate height is t.
- At the identity cusp with y=(t,t), min y=t and N(y)=t²; the lower bound is in these coordinates.


The Siegel-set API is in cusp coordinates.

- Finitely many translated sets meet all orbits, and intersections have only finitely many projective translates.
- Positive height in the fixed unit cone bounds each imaginary coordinate below.

### 3.2 The invariant measure and finite covolume

Define the measure `dμ := ∏_w dx_w dy_w / y_w²` on `ℍ^Σ` and prove its `GL₂⁺(F)`-invariance
(from `im_smul_eq_div_normSq` and the one-variable Jacobian at each place). Prove that each
Siegel set has finite measure
by using the norm coordinate r=N(y)>0 and y=r^(1/n)u with N(u)=1.
On the norm-one cross-section use the measure dν induced by product logarithmic
measure: ∏_w dy_w/y_w=(dr/r)dν(u). In logarithmic coordinates
`u=(exp(v₁),…,exp(v_{n−1}),exp(−Σvᵢ))` this is `dν=dv₁⋯dv_{n−1}`.
The unit fundamental cross-section has finite ν-volume by the unit lattice theorem,
and N(y)⁻²dy=r⁻²dr dν(u), giving its ν-volume times ∫ₜ∞r⁻²dr=1/t
for t>0. Hence `Γ \ ℍ^Σ` has finite volume, and a
fundamental domain exists as a measurable set `𝔉_Γ` contained in the union of the Siegel sets.

*Rests on:* 3.1; Mathlib `MeasureTheory` (Haar measure on `ℝ^Σ`, change of variables).


The measure API uses the projective quotient to remove ineffective scalars.

- The product hyperbolic measure is invariant under the componentwise GL₂⁺ action.
- Integration on a measurable fundamental domain is independent of the domain for invariant integrable functions.

**Checks.**

- Translation x↦x+1 has Jacobian 1 and leaves dx dy/y² unchanged.
- Dilation z↦2z has Jacobian 4 and y²↦4y², so the density ratio is 1.
- On a rank-one cusp strip of width 1 and height y≥t>0, the volume is ∫ₜ∞y⁻²dy=1/t; t=0 would give infinite volume.
- In degree two, y=(√r eᵛ,√r e⁻ᵛ) has absolute Jacobian 1 and N(y)=r,
  so dy₁dy₂/N(y)²=r⁻²dr dv. With the radius s=√r instead, the Jacobian
  is 2s and the density is 2s⁻³ds dv: at s=3 it is 2/27, not 1/9.
  In norm coordinates the radial integral from t=2 is 1/2.

### 3.3 The Hecke bound

For `f ∈ S_k(Γ)`, define `φ_f(z) := |f(z)| ∏_w (Im z_w)^{k_w/2}` and prove it is
`Γ`-invariant (0.3, 0.4: `|f| ∏_w y_w^{k_w/2}` is invariant under the unitary slash, and on `Γ`
the two normalizations agree; the exponent is `k_w/2`, not `k_w/2 + m_w`, since `∏_w ε_w^{m_w} ≠ 1`
for units `ε` in non-parallel weight), tends to `0` at every cusp (2.6), and is therefore bounded on
`ℍ^Σ`. If f≠0, first deduce sup φ_f>0; the maximum is then attained on the
compact positive superlevel set `⋃_κ 𝔖_κ ∩ {φ_f ≥ sup φ_f/2}`. For f=0 every
point is a maximum; choose i and take C_f=0 in the coefficient bound, without
asserting compactness of the zero superlevel set.
Deduce the **Hecke bound**: for every cusp tuple f there exists C_f≥0 such
that |c(𝔪,f)|≤C_f N𝔪^(k₀/2) for every nonzero integral ideal 𝔪.
Bruinier, arXiv:math/0609763v1, Proposition 1.41(ii), pp. 21–22, gives the
parallel-weight real-quadratic coefficient-integral argument; the general-degree,
nonparallel adapter uses precisely §§2.1, 2.4, 2.6 and the reduction comparison
§3.1. Explicitly, choose B_𝔟≥0 bounding the weighted height of f_𝔟. At y_w=1/σ_w(μ), every
μ_w is positive, and the coefficient integral gives

    |a_𝔟(μ)| ≤ B_𝔟 exp(2πn) ∏_w μ_w^(k_w/2),
    |c(𝔪,f)| ≤ B_𝔟 exp(2πn) (N𝔟/|d_F|)^(k₀/2) N𝔪^(k₀/2).

The exponent identity k_w/2+m_w=k₀/2 and Nμ=N𝔪 N𝔟/|d_F| prove the
second line; take the maximum of its fixed prefactors over the finitely many
components. The positive exponential comes from |e(−Tr(μ(x+iy)))|=exp(2πn).
For a general form of parallel weight k≥0, first prove
`|f(x+iy)| ≤ C_f (1+N(y)^(−k))` by reduction to finitely many cusp sectors, where the
slashed forms are bounded. For each nonzero lower-left entry c of a reducing matrix,
`N(|cz+d|) ≥ |N(c)|N(y)` and the nonzero c belong to fixed fractional lattices, so
`|N(c)|` has a positive lower bound; upper triangular matrices give the constant term
in the estimate. The coefficient integral at y_w=1/μ_w then gives
`|c(𝔪,f)| ≤ C_f N𝔪^k`. Negative parallel weights vanish by §3.5, and nonparallel
forms use the cuspidal bound. Section 4.3 supplies the sharper estimates in even weights.
No boundedness of `|f|N(y)^k` is asserted on an unbounded Siegel set.

*Rests on:* 2.1 (coefficient integral), 2.4 (ideal normalization), 2.6 (cusp decay),
3.1 (finite cusp reduction), 0.4 (unitary slash comparison).


The weighted-height API separates zero from positive superlevels.

- For cusp forms φ_f is invariant, nonnegative and bounded; `φ_{af}=|a|φ_f`.
- For f≠0 its supremum is positive and attained; for f=0 its maximum and coefficient-bound constant are both 0.

**Checks.**

- For f=0 the zero superlevel contains y=(t,…,t) for all t≥1 and is unbounded; no compactness conclusion is made.
- For f=0 and C_f=0 every coefficient inequality is 0≤0, and the maximum at i is 0.
- If |f(z₀)|=1 and y_w=1 at z₀, then φ_f(z₀)=1 and sup φ_f≥1>0, so the threshold sup/2 is positive.
- For weight (2,4), m=(1,0) and positive exponent coordinates (2,3),
  the raw coefficient factor is 2¹3²=18 and the normalization factor is 2;
  their product 36 equals (2·3)^(4/2). The Fourier-extraction exponential
  at y=(1/2,1/3) is exp(4π), not exp(−4π).

### 3.4 The Petersson inner product

Define `⟨f, g⟩ := ∫_{𝔉_Γ} conj(f(z)) g(z) ∏_w (Im z_w)^{k_w} dμ(z)` (the integrand is `Γ`-invariant
by 3.3; the exponent `k_w`, not `k₀`, is forced in non-parallel weight) for `f, g ∈ M_k(Γ)`
with at least one a cusp form, prove absolute convergence (3.2, 3.3), independence of the
fundamental domain, Hermitian positivity on `S_k(Γ)`, and the normalization-free invariance
`⟨f ∣_k γ, g ∣_k γ⟩_{γ⁻¹Γγ} = N(det γ)^{k₀ - 2} ⟨f, g⟩_Γ`. Prove that `⟨·,·⟩` on `S_k(Γ)` is the
restriction of the `L²` inner product of `L²(𝔉_Γ, ∏ y_w^{k_w} dμ)`
(`MeasureTheory.L2.inner_def`): conjugate-linear in the first variable and linear in the second and that the inclusion
`S_k(Γ) → L²` is continuous for the sup-norm of `φ_f`.

*Rests on:* 3.2, 3.3.

**Checks.**

- `⟨f, f⟩ > 0` for the newform `2.2.5.1-31.1-a`, which spans `S_2((5w - 2))` over `ℚ(√5)`, and
  `⟨f, g⟩` is the complex conjugate of `⟨g, f⟩`.
- If ⟨h,h⟩=1, then ⟨ih,h⟩=−i and ⟨h,ih⟩=i; the opposite convention reverses these values.
- At a scalar `γ = a·1`, `a ∈ F^×`, both sides of the invariance law are
  `N(a)^(2(k₀ - 2)) ⟨f, g⟩`, since `f ∣_k (a·1) = N(a)^(k₀ - 2) f` and `det(a·1) = a²`.
- The weight factor is `∏_w (Im z_w)^(k_w)`: with `N(Im z)^(k₀)` in its place the integrand is not
  `Γ`-invariant in non-parallel weight, and a formalisation must not accept that variant.


The Petersson API uses the conjugate-first convention.

- The pairing is conjugate-linear in f, linear in g and conjugate symmetric whenever it converges.
- It is positive definite on cusp forms and changes under slash by the stated positive norm factor.

### 3.5 Finite dimensionality

Every assertion here has nonzero level. At level zero over ℚ(√5), the constant 1
is invariant in parallel weight −2, since upper triangular unit diagonals give
N(det)^(−3)N(d)²=1; this is excluded by the nonzero-level hypothesis.

Prove `FiniteDimensional ℂ (S_k(Γ))` by extending the real-quadratic,
parallel-weight prototype of Bruinier, arXiv:math/0609763v1, §1.4,
Lemma 1.31 and Theorem 1.32, pp. 15–16. The general-degree, nonparallel
extension is a target here: for every fixed nonzero level, component and weight,
prove an A>0 such that sup_z |f(z)|∏_w y_w^(k_w/2) ≤ A‖f‖₂ for every cusp
form f, with A independent of f. Use §0.2's polydisc mean-value estimate on
the compact part and §2.6's Fourier expansion on §3.1's finitely many balanced
cusp domains to obtain this uniform norm comparison. The weight factor is
∏_w y_w^(k_w/2), not N(y)^(k₀/2). Then point evaluations `f ↦ f(z)` are bounded on the unit ball
of `(S_k(Γ), ⟨·,·⟩)` (mean-value inequality on a polydisc around `z`, 0.2), so the unit ball is a
normal family, every sequence in it has a locally uniformly convergent subsequence whose limit
is again in `S_k(Γ)` (0.2 and dominated convergence for the cusp decay of 2.6), and the unit
ball is compact in the `L²` topology; a Hilbert space with compact unit ball is finite
dimensional (Mathlib `FiniteDimensional.of_isCompact_closedBall₀`). Then prove
`FiniteDimensional ℂ (M_k(Γ))` from the exact sequence
`0 → S_k(Γ) → M_k(Γ) → ℂ^{C(Γ)}` of constant-term maps (2.5), and the bound
finrank M_k(Γ) ≤ finrank S_k(Γ) + #C(Γ). Deduce tuple finite dimensionality by the finite-product instance
`Module.Finite.pi` from component finite dimensionality and the finite narrow class group,
and that for `k₀ ≤ 0` the only forms are the
constants in weight `0` (maximum principle for `|f|` on the finite-volume quotient, using the
boundedness of 2.2).
The same norm comparison gives the direct dimension argument: for any finite
orthonormal set f₁,…,f_r, evaluating linear combinations gives
Σ_j |f_j(z)|²∏_w y_w^k_w ≤ A²; integration yields r≤A² vol(Γ∖ℍ^Σ).
At a point where every f_j vanishes the inequality is 0≤A², requiring no division.

**Checks.**

- For component dimensions 1 and 2, the tuple dimension is 1+2=3; a single
  dimension-one component gives 1, not the class-number-one restriction on all tuples.
- With A=2 and volume 3 the orthonormal-set bound is r≤4·3=12; the empty
  family gives 0≤12, and a common zero of the forms gives 0≤4 pointwise.
- At weight (2,4) and y=(2,3), the weighted norm uses 2·3²=18, whereas
  N(y)²=36 is the wrong nonparallel factor; its square in the integral is 324.

*Rests on:* 0.2, 2.5, 2.6, 3.1, 3.4; Mathlib `FiniteDimensional.of_isCompact_closedBall₀`, Montel-type
compactness (`TendstoLocallyUniformly` on open sets of `ℂ^Σ`).

### Examples

The discriminating examples are the Checks in §§3.1–3.5: projective units, cusp height and finite dimensionality.

### Dependencies

Layers 0–2; unit lattices, Haar measure and finite-dimensional normed-space theory.

## Layer 4: Eisenstein series

This layer is stated for **even parallel weight `k ≥ 2`** only. Odd parallel weights are
governed by the parity lemma (2.3) and are not given Eisenstein series here; non-parallel
weights have none (2.5).

### 4.1 Eisenstein series at a cusp, `k ≥ 4`

For `Γ = Γ₀(𝔫)_𝔟`, a cusp `κ = γ_κ • ∞` with stabilizer `Γ_κ`, and even parallel `k ≥ 4`,
define `E_κ(z) := Σ_{δ ∈ Γ_κ \ Γ} (1 ∣_k γ_κ⁻¹δ)(z)`, the sum of the slash factors
`∏_w σ_w(det δ')^{k-1} j(σ_w δ', z_w)^{-k}` over the cosets. Prove absolute and locally uniform
convergence (comparison with `Σ_{(c,d) ∈ L/U} N(|cz + d|)^{-k}` over a lattice `L ⊂ F²` modulo a
unit group, which converges for `k > 2` by the counting of lattice points in `F_ℝ²` of bounded
norm — the same geometry of numbers as 3.1), holomorphy (0.2), and `E_κ ∈ M_k(Γ)`. Prove the
constant terms: `a_0(E_κ ∣_k γ_{κ'}) = δ_{κκ'}` (the coset `δ = 1` contributes `1` at its own
cusp; all other terms have `c ≠ 0` and vanish at `∞` by the expansion of 2.1 applied termwise).

*Rests on:* 1.4, 2.1–2.5, 3.1 (lattice-point counting).


The Eisenstein-series API uses the fixed scaling at each cusp.

- The series converges normally for even k≥4 and transforms as a holomorphic form.
- Its constants are 1 at its chosen cusp and 0 at the other cusps, giving linear independence.

**Checks.**

- At its own cusp the identity coset contributes 1, so the constant is 1.
- At a different cusp the asserted constant is 0; the resulting two-cusp constant matrix is ((1,0),(0,1)).
- For F=ℚ and k=4 the full-level normalization has constant 1 and first coefficient 240; scaling by 2 would give constants 2, so is excluded.

### 4.2 Weight `2` by Hecke's trick

For `k = 2` define `E_κ(z, s) := Σ_δ (1 ∣_2 γ_κ⁻¹δ)(z) · N(Im(γ_κ⁻¹δ • z))^{s}`
for `Re s > 0`, with the cusp scalings and cosets of §4.1. Prove normal convergence
there and compare this family with the weight-two sections of upper-Borel induction
with parameter t=1+2s. Transport the meromorphic continuation and intertwining
functional equation of AutomorphicSpectralTheory §§1.5, 1.15a–1.15b through this
comparison; this comparison of Eisenstein sums uses Iwasawa coordinates and the
cusp scalings, independently of the cuspidal dictionary in Layer 6.

At a cusp κ′ and positive height vector y put Y=N(y). For Re(s)>0 define
Φ(κ,κ′;s) as Y^(1+s) times the difference between the translation-torus
mean of `(E_κ ∣₂ γ_{κ′})(x+iy,s)`, with probability Haar measure, and
δ(κ,κ′)Y^s. Prove independence of y, so that the constant term is
`δ_{κκ′} Y^s + Φ_{κκ′}(s) Y^(-1-s)`.
The coefficient is the matrix entry of the supplied raw intertwiner between the
sections normalized at κ and κ′, after the specified cusp scalings; this fixes its
normalization, rather than just its order of vanishing.

Prove the following adapter for every nonzero level and every component. Decompose
its finite-level inducing sections into finite-order ray-class characters, retaining
all ramified local matrix entries. Write χ for the ratio of the two inducing
characters and let S contain the infinite places and every ramified or
nonspherical finite place, including those from the trace-character measures.
Here L^S is the finite Euler product outside S. Each scattering entry is a finite sum of products
of a holomorphic finite-place factor, a ratio
`L^S(1+2s,χ)/L^S(2+2s,χ)`, and n real-place integrals, evaluated for Re(s)>0 and continued near zero
using the reciprocal gamma function:
`I(s) = ∫_ℝ (x+i)^(-2) |x+i|^(-2s) dx = -√π Γ(s+1/2)/((s+1)Γ(s))`.
The finite factors include the cusp widths and changes of scaling and are
holomorphic near zero, by convergence of the raw finite local integrals at t=1.
The denominator is nonzero there by its absolutely convergent Euler product;
the numerator has at most a simple pole, only for the trivial character. Since
I(s)=−πs+O(s²), every Φ(κ,κ′;s) is O(sⁿ⁻¹). Continue the nonconstant Fourier
coefficients as well and prove that their limits converge normally on compact
subsets and are holomorphic in z. Thus for n≥2 the limit
`E_κ(z) := lim_{s → 0⁺} E_κ(z,s)` is in M₂(Γ) and has constants δ(κ,κ′).

The character-series source for arbitrary totally real degree and level is
Dasgupta–Kakde, arXiv:2010.00650v1, §4, equations (27)–(28), p. 15, and
Theorem 4.5 with its proof, equations (34)–(39), pp. 18–20: the latter writes
Hecke's trick as congruence-restricted lattice sums at an arbitrary cusp and
continues them before specializing s=0. Project its character and level-raising
sections to the Γ₀ invariants and
restrict to the chosen component. Compare the resulting finite sections with
the cusp sections for every s in the convergence half-plane, retaining the
determinant and height factors of the fixed scalings. At s=0 this comparison
is the change of basis given by the constant-term isomorphism (28); an
isomorphism only at s=0 would not determine the scattering family. Bruinier,
Remark 1.35, p. 18, is only the real-quadratic, full-level
prototype, not the source for this general adapter. The scalar zeta remainder
alone does not establish the scattering calculation or the nonconstant expansion.

*Needs:* §§1.4, 2.1, 4.1 (cusp scalings, Fourier expansion and the convergent
sums); AutomorphicSpectralTheory §§1.5, 1.15a–1.15b (constant terms,
continuation, intertwining and local factors); LFunctions Layers 3 and 5
(Dedekind and finite-order Hecke continuation and poles); Mathlib
`Complex.Gamma`, `dedekindZeta`, `NumberField.dedekindZeta_residue` and
`NumberField.dedekindZeta_residue_pos`; Tau Ceti
`TauCeti.exists_differentiableOn_eq_dedekindZeta_sub`
(`TauCeti/NumberTheory/NumberField/DedekindZeta.lean`): on Re(s)>1−1/n,
the holomorphic remainder G agrees with ζ_F(s)−ρ/(s−1) on Re(s)>1,
where ρ=dedekindZeta_residue F>0. Its substitution at 1+2s isolates the
simple pole in the trivial-character term.

**Checks.**

- At n=2 the remainder domain is Re(s)>1/2, containing a neighborhood of 1;
  the residue constant alone has no such domain.
- With ζ_F(1+2s) having leading term ρ/(2s) and 1/Γ(s)² having leading term s²,
  the product has leading term ρs/2 and tends to 0.
- At n=1 the same product has limit ρ/2 rather than 0; this excludes the classical
  nonholomorphic weight-two term from the n≥2 cancellation argument.
- With the actual real integral, I(1)=−π/4 and I(s)/s→−π. For F=ℚ at
  full level the scattering coefficient is I(s)ζ(1+2s)/ζ(2+2s), whose limit
  is −π/(2ζ(2))=−3/π, giving the constant 1−3/(πy). In degree two a
  term H(s)I(s)²ζ_F(1+2s)/ζ_F(2+2s), with H holomorphic, instead has
  leading coefficient H(0)π²ρ/(2ζ_F(2)) times s and tends to 0.
- For two inequivalent cusps in degree n≥2, the constant matrix at s=0 is
  ((1,0),(0,1)); at s≠0 the off-diagonal scattering entries need not vanish.
  A replacement of the whole scattering matrix by a scalar zeta ratio would
  lose these entries and the finite-place level factors.


The regularized-series API keeps the parameter before taking the limit.

- In the convergence half-plane the series has the weight-two transformation law with the prescribed height factor.
- Its limit is holomorphic for n≥2 and has the normalized cusp constants of §4.1.

### 4.3 The decomposition `M_k = S_k ⊕ E_k`

For even parallel `k ≥ 2` define E_k(Γ) := span {E_κ : κ ∈ C(Γ)} and prove
`M_k(Γ) = S_k(Γ) ⊕ E_k(Γ)` with finrank E_k(Γ) = #C(Γ) (the constant-term matrix is the
identity), that the sum is orthogonal for the Petersson product whenever it converges, and
finrank M_k(Γ₀(𝔫)_𝔟) = finrank S_k(Γ₀(𝔫)_𝔟) + #C(Γ₀(𝔫)_𝔟). Deduce `|c(𝔪, f)| ≤ C_f N𝔪^{k-1}` for even parallel `k ≥ 4`, using
`σ_{k-1}(𝔪)/N𝔪^{k-1} ≤ ζ_F(k-1)`. At `k = 2` retain the divisor-sum bound
`|c(𝔪, f)| ≤ C_f σ_1(𝔪)` and hence, for every real `ε > 0`,
`|c(𝔪, f)| ≤ C_{f,ε} N𝔪^{1+ε}`. The cuspidal contribution satisfies §3.3. For
`h_F = 1` and `Γ = Γ_{𝒪_F}` (one cusp) prove **Siegel's formula** for the Fourier expansion of
`E_∞`: `E_∞(z) = 1 + C_k · Σ_{μ ∈ (𝔡⁻¹)_+} σ_{k-1}(μ𝔡) e(Tr(μz))` with
`σ_{k-1}(𝔞) := Σ_{𝔠 ∣ 𝔞} N𝔠^{k-1}` over the integral ideal divisors, where the Poisson summation
of 2.1 applied to each `c ≠ 0` gives `C_k = (2πi)^{kn} / (Γ(k)^n · d_F^{k - 1/2} · ζ_F(k))` and
the functional equation of the Dedekind zeta function ([L-functions](../LFunctions/README.md)
Layer 3) turns this into `C_k = 2^n / ζ_F(1 - k)`. Checks: for `F = ℚ` this is `-2k/B_k`
(`C_4 = 240`, `C_6 = -504`); over `ℚ(√5)`, `ζ_F(-1) = 1/30`, `ζ_F(-3) = 1/60`,
`ζ_F(-5) = 67/630`, so `C_2 = 120`, `C_4 = 240`, `C_6 = 2520/67`. For `h_F > 1` the
coefficients of an individual `E_κ` are class-restricted divisor sums and are not claimed
(*Explicit scope exclusions*).

*Rests on:* 4.1, 4.2, 3.4; [L-functions](../LFunctions/README.md) Layer 3 (Dedekind zeta
functional equation) for the constant `C_k`.

**Checks.**

- For E₂ over ℚ(√5), c(𝔪)=120σ₁(𝔪); at squarefree prime norms 4,5,9 the ratio c(𝔪)/N𝔪 is 120·(5/4)(6/5)(10/9)=200.
- E₂(it,it) tends to 1, while N(t,t)²=t⁴ tends to infinity, excluding the former boundedness route.
- At k=4, σ₃(𝔪)/N𝔪³≤ζ_F(3), a finite bound; ζ_F(1) cannot supply the analogous k=2 constant.


The Eisenstein-space API is determined by the constant-term map.

- The span of the normalized cusp Eisenstein series maps isomorphically to all cusp constants.
- Its intersection with the cusp space is zero and the two spaces sum to the full space.

### Examples

The discriminating examples are the Checks in §4.3: Eisenstein divisor sums in weights two and four.

### Dependencies

Layers 2–3; LFunctions Layers 3 and 5; AutomorphicSpectralTheory §§1.5, 1.15a–1.15b.

## Layer 5: Hecke operators

Extend the supplied parallel-weight operators to nonparallel weights by the formulas below.
On parallel weights k≥2 these formulas are comparison theorems with the supplier’s operators;
they prescribe no second construction. All local factors, including level primes, are retained.

### 5.1 Double-coset operators between components

For fractional ideals `𝔟, 𝔠`, a nonzero integral ideal `𝔪`, and the level `𝔫`, define
`Δ_𝔫(𝔠 ← 𝔟; 𝔪) := {α ∈ GL₂⁺(F) : α L_𝔟 ⊆ L_𝔠, [L_𝔠 : α L_𝔟] = 𝔪, α_{21} ∈ 𝔫𝔠, (α_{11}) + 𝔫 = 𝒪_F}` — the matrices
`(a b; c d)` with `a ∈ 𝒪_F`, `b ∈ 𝔟⁻¹`, `c ∈ 𝔫𝔠`, `d ∈ 𝔠𝔟⁻¹`,
`(det α) 𝔟 𝔠⁻¹ = 𝔪`, and `a` a unit at every prime dividing `𝔫` (1.1). Prove:
it is nonempty iff `[𝔟] = [𝔪𝔠]` in `NarrowClassGroup F`; it is stable under `Γ₀(𝔫)_𝔠` on the
left and `Γ₀(𝔫)_𝔟` on the right; the left quotient `Γ₀(𝔫)_𝔠 \ Δ_𝔫(𝔠 ← 𝔟; 𝔪)` is finite.
Its cardinality is zero when `[𝔟] ≠ [𝔪𝔠]`. Under `[𝔟] = [𝔪𝔠]`, its cardinality is
`Σ_{𝔞 ∣ 𝔪} N𝔞` for `𝔪` prime to `𝔫` and `N𝔪` for `𝔪` supported on `𝔫`
(the count of index-`𝔪` sublattices of the right class respecting the Borel and unit conditions;
the quotient need not be cyclic at good prime powers). Under the same class equality,
construct explicit representatives for `𝔪 = 𝔭` prime:
`N𝔭 + 1` of them when `𝔭 ∤ 𝔫`, `N𝔭` when `𝔭 ∣ 𝔫`, of the shape `(π_𝔭 a; 0 1)`-like matrices
once a totally positive generator of the principal ideal `𝔭 𝔠 𝔟⁻¹` is fixed. For
`f ∈ M_k(Γ₀(𝔫)_𝔠)` define
`f ∣ [Δ] := (N𝔠/N𝔟) Σ_{α ∈ Γ₀(𝔫)_𝔠 \ Δ} f ∣_k α` and prove it lies in
`M_k(Γ₀(𝔫)_𝔟)`, is independent of the representatives, preserves cusp forms (2.6), and is
compatible with the transport of 2.3. This is the `GL₂(F)` instance of the double-coset
formalism of the [Modular Forms](../ModularForms/README.md) roadmap's Layer 2(a); the abstract
Hecke ring of Mathlib's `HeckeRing/Defs.lean` is consumed for the pair `(Γ₀(𝔫)_𝔟, Δ_𝔫(𝔟 ← 𝔟; ·))`
when `𝔟 = 𝔠`, and the general `(𝔠, 𝔟)` operators are the bimodule version, defined directly.

*Rests on:* 0.3, 1.1–1.3, 2.3, 2.6; Mathlib `HeckeRing/Defs.lean`.


The correspondence API is between the specified component spaces.

- Left-coset representatives give the same operator, and the operator is linear and preserves cuspidality.
- Changing the two component representatives intertwines the operator through the normalized transports of §2.3.

**Checks.**

- At unit ideal and equal components the sole coset is the identity; N𝔠/N𝔟=1 and the operator is identity.
- Over ℚ(√6), take 𝔫=𝔪=𝔠=𝒪_F and 𝔟=(√6). The equation
  x²−6y²=−1 is impossible modulo 3, so no unit has norm −1. A generator
  of 𝔟⁻¹ therefore has norm −1/6 and cannot be totally positive:
  the components are incompatible, Δ is empty, and its quotient has 0 cosets, not 1.
- For compatible components at a good norm-4 prime there are 4+1=5 cosets;
  at a level-dividing norm-4 prime there are 4.
- For component norms 1 and 1/2 the multiplier is 1/2; reversing the components gives 2, not 1/2.

### 5.2 `T_𝔪`, `S_𝔪`, and the central action

On `M_k(𝔫; R)` define `(T_𝔪 f)_c := f_{c[𝔪]⁻¹} ∣ [Δ_𝔫(rep(c[𝔪]⁻¹) ← rep(c); 𝔪)]`, and
`(S_𝔪 f)_c := f_{c[𝔪]⁻²} ∣ [Δ'_𝔫(rep(c[𝔪]⁻²) ← rep(c); 𝔪)]` with
`Δ' := {α ∈ GL₂⁺(F) : α L_𝔟 = 𝔪 L_𝔠, α_{21} ∈ 𝔫𝔪𝔠}` (a single left coset).
The central correspondence uses the same factor N𝔠/N𝔟 as §5.1, is separate from Δ,
and has no upper-left unit condition at level primes. The unramified character
space agrees with §2.7 by the inverse-scalar calculation in §6.3. Prove: `T_𝔪` and `S_𝔪` are
`ℂ`-linear endomorphisms of `M_k(𝔫; R)` preserving `S_k(𝔫; R)`; they commute with the transport
of 2.3; `S_𝔪 = N𝔪^{k₀ - 2} · id` when `𝔪 = (m)` with `m ≫ 0` (0.3); `S_𝔪 S_𝔪' = S_{𝔪𝔪'}`;
and `⟨[𝔪]⟩ := N𝔪^{-(k₀ - 2)} S_𝔪` depends only on the narrow class of `𝔪` and defines an action of
`NarrowClassGroup F` on `M_k(𝔫; R)` — the **central action**. Prove the **sign law**: for every
`a ∈ F^×`, `⟨[(a)]⟩ = sgn(N(a))^{k₀} · id` (0.3's scalar law with `S_{(a)} = N(a)^{k₀ - 2}`), so the
central action of the kernel of `NarrowClassGroup F → ClassGroup` is through the character
`[(a)] ↦ sgn(N(a))^{k₀}`. Decompose `M_k(𝔫; R) = ⊕_ψ M_k(𝔫, ψ; R)` over the characters `ψ` of the
finite abelian group `NarrowClassGroup F`, and likewise for cusp forms; `M_k(𝔫, ψ; R) = 0` unless
`ψ([(a)]) = sgn(N(a))^{k₀}` for all `a ∈ F^×` — for even `k₀` exactly when `ψ` factors through
`ClassGroup (𝓞 F)` (this is the parity lemma of 2.3 at `a` a unit). `T_𝔭` for `𝔭 ∣ 𝔫` is the same definition; the
alias `U_𝔭` and the lemma `U_𝔭 = T_𝔭` are recorded as in the Modular Forms roadmap.

*Rests on:* 2.3, 5.1; Tau Ceti `NarrowClassGroup`, its finiteness.

**Checks.**

- Over `ℚ(√5)` at `𝔫 = (5w - 2)`, `S_2(𝔫)` is one-dimensional and `T_(2)`, `T_(2w - 1)`, `T_(3)`
  act on it by `-3`, `-2`, `2`; `U_𝔫 = T_(5w - 2)` acts by `-1`.
- The double-coset count of 5.1 at `𝔭 = (2)` is `N𝔭 + 1 = 5`, and at `𝔭 = (5w - 2) ∣ 𝔫` it is
  `N𝔭 = 31`.
- `S_(m) = N(m)^(k₀ - 2)` for `m ≫ 0`; over `ℚ(√5)`, where `h⁺_F = 1`, the central action is
  trivial and `M_k(𝔫; R) = M_k(𝔫, 1; R)`.
- Over `ℚ(√6)` the nontrivial narrow class `[(√6)]` acts on `S_2(𝒪_F; R)` by
  `sgn(N(√6))^2 = +1`, so the `ψ = sgn` eigenspace is `0` in weight `2`.


The central and Hecke API includes every nonzero ideal.

- The operators are linear, preserve cusp forms and commute with representative transport.
- Central operators multiply by ideal multiplication, and their norm-normalized action factors through the narrow class group with the signed principal law above.

### 5.3 Relations

Prove, as identities of operators on `M_k(𝔫; R)`: `T_𝔪 T_𝔪' = T_{𝔪𝔪'}` for coprime `𝔪, 𝔪'`;
`T_𝔭 T_{𝔭^r} = T_{𝔭^{r+1}} + N𝔭 · S_𝔭 T_{𝔭^{r-1}}` for `𝔭 ∤ 𝔫`, `r ≥ 1`;
`T_{𝔭^r} = T_𝔭^r` for `𝔭 ∣ 𝔫`; `S_𝔪` commutes with every `T_𝔪'`; and all `T_𝔪` commute. The
proofs are the lattice-counting proofs of Shimura's *Introduction to the Arithmetic Theory of
Automorphic Functions*, Theorem 3.24, carried out on the sublattices of `L_𝔠` with the Borel
condition at `𝔫`; commutativity at `𝔭 ∤ 𝔫` comes from the multiplicativity and the recurrence,
and at `𝔭 ∣ 𝔫` from the explicit upper-triangular representatives. Deduce that the algebra
`𝕋_k(𝔫)` generated by all `T_𝔪` and `⟨c⟩` is commutative, and that on `M_k(𝔫, ψ; R)` the
recurrence reads `T_𝔭 T_{𝔭^r} = T_{𝔭^{r+1}} + ψ([𝔭]) N𝔭^{k₀ - 1} T_{𝔭^{r-1}}`.

*Rests on:* 5.1, 5.2.

### 5.4 The coefficient formulas

Prove the pinned coefficient formulas: for `f ∈ M_k(𝔫, ψ; R)` and `𝔭 ∤ 𝔫`,
`c(𝔪, T_𝔭 f) = c(𝔪𝔭, f) + ψ([𝔭]) N𝔭^{k₀ - 1} c(𝔪𝔭⁻¹, f)`, and for `𝔭 ∣ 𝔫`,
`c(𝔪, T_𝔭 f) = c(𝔪𝔭, f)`, where `c(𝔪𝔭⁻¹, f) := 0` when `𝔭 ∤ 𝔪`. The proof is the computation of 5.1's representatives on the expansion of 2.3: the
`(1 a; 0 π)`-type cosets collect the coefficients at `μπ` after the character sum
`Σ_{a ∈ 𝒪_F/𝔭} e(Tr(μa/π))` kills the `μ ∉ π𝔟𝔡⁻¹`, and the `(π 0; 0 1)`-type coset supplies the
`N𝔭^{k₀ - 1}` term through `S_𝔭`. Deduce the general formula
`c(𝔪, T_𝔪' f) = Σ_{𝔞 ∣ 𝔪 + 𝔪', 𝔞 + 𝔫 = 𝒪_F} ψ([𝔞]) N𝔞^{k₀ - 1} c(𝔪𝔪'𝔞⁻², f)` from 5.3, and the
**eigenvalue–coefficient identity**: if `T_𝔪 f = λ_𝔪 f` for all `𝔪` and `c(𝒪_F, f) = 1`, then
`c(𝔪, f) = λ_𝔪` (take `𝔪' = 𝒪_F` in the formula with `𝔪 ↔ 𝔪'`). For `F = ℚ` these are the
Modular Forms roadmap's Layer 2 formulas.

*Rests on:* 2.4, 5.1–5.3.

**Checks.**

- At level (2) over ℚ(√5), the upper-left unit condition excludes diag(2,1); four cosets remain, not five.
- At the square (2)², the bad operator has 4²=16 cosets and U_(2)² shifts c(𝔪) to c(4𝔪), without a central correction.
- At a good norm-4 prime the five cosets give c(𝔪𝔭)+4^(k₀−1)ψ(𝔭)c(𝔪/𝔭).

### 5.5 Petersson adjoints and simultaneous diagonalization

Equip `S_k(𝔫; R)` with
`⟨f, g⟩ := Σ_c N(rep c)^{k₀} ⟨f_c, g_c⟩_{Γ₀(𝔫)_{rep c}}`.
These weights make the product invariant under §2.3: replacing a representative by α times
it multiplies its unweighted pairing by N(α)^(−k₀) and its weight by N(α)^k₀.
The componentwise adjoint formula below uses these weighted component products. Prove that for `𝔪` prime to `𝔫` the Petersson adjoint of `T_𝔪` is
`⟨[𝔪]⟩⁻¹ T_𝔪` (the involution `α ↦ (det α) α⁻¹` carries `Δ_𝔫(rep(c[𝔪]⁻¹) ← rep(c); 𝔪)` onto
`Δ_𝔫(rep(c) ← rep(c[𝔪]⁻¹); 𝔪)` up to the central shift), in the componentwise form
`⟨(T_𝔪 f)_c, g_c⟩_{rep c} = ⟨f_{c[𝔪]⁻¹}, (⟨[𝔪]⟩⁻¹ T_𝔪 g)_{c[𝔪]⁻¹}⟩_{rep(c[𝔪]⁻¹)}`: `T_𝔪` carries
component `c[𝔪]⁻¹` to component `c` and its adjoint carries `c` back, so the two sides pair
different components whenever `[𝔪] ≠ 1` (pairing both sides at `c` would force `T_𝔭` to kill
every form supported on a single component, which is false over `ℚ(√10)`: `𝔭 = (3, 1 + √10)`
is not principal and `c(𝔭, f) = ±√2 ≠ 0` for the level-one newform `2.2.40.1-1.1-a`). On
`S_k(𝔫, ψ; R)` the adjoint is `ψ([𝔪])⁻¹ T_𝔪`: `T_𝔪` is **normal**, and self-adjoint when
`ψ = 1`. Deduce that
`S_k(𝔫, ψ; R)` has an orthogonal basis of simultaneous eigenvectors of all `T_𝔪`, `𝔪 + 𝔫 = 𝒪_F`
(finite dimensionality from 3.5), that the eigenvalues at such `𝔪` are real when `ψ = 1`, and
that `|λ_𝔪| ≤ C N𝔪^(k₀/2)` for an eigenvector normalized by `c(𝒪_F, f) = 1` (3.3).

*Rests on:* 3.4, 3.5, 5.3, 5.4.

### 5.6 The Fricke and Atkin–Lehner matrices

This subsection concerns the unramified finite central characters of §5.2.
For ramified nebentypus use the local newvector operator and its character-changing
target from the general dictionary; it is not asserted to preserve the character.

Use the ideal-lattice construction of Cremona, arXiv:2601.17524v1,
§4.1, Definition 9, p. 12, and the square relation in §4.2.1, p. 13,
as the algebraic model. Its row-lattice operators carry N𝔮⁻¹ and use
ordinary ideal classes; the target here is the oriented column-lattice
comparison with the arithmetic slash and narrow components, with the
normalizing factor specified below. It does not assume an exact divisor
is principal. For an exact divisor 𝔮 of the nonzero level 𝔫, and an output component represented by
𝔟, let 𝔠 represent [𝔟][𝔮]⁻¹. Choose α in GL₂⁺(F) with entries

    α₁₁ ∈ 𝔮,  α₁₂ ∈ 𝔟⁻¹,  α₂₁ ∈ 𝔫𝔠,  α₂₂ ∈ 𝔮𝔠𝔟⁻¹,
    (det α) = 𝔮𝔠𝔟⁻¹.

In local generators of 𝔟 and 𝔠, at 𝔭^r exactly dividing 𝔮 the upper-right entry
and the lower-left entry divided by a generator of 𝔫 are units; the determinant condition
forces this primitivity. At places outside 𝔮 the matrix is an isomorphism of the local
level lattices. Prove existence and uniqueness of the resulting left Γ₀(𝔫)_𝔠 coset.
For existence, fix a totally positive generator δ of 𝔮𝔠𝔟⁻¹, choose the local
level-lattice switches with determinant δ, and apply strong approximation
for SL₂ (AdelicAlgebraicGroups §4.2) to meet their open local cosets.
For choices α and β, the local ratio βα⁻¹ lies in Γ₀(𝔫)_𝔠; intersecting these
conditions with GL₂⁺(F) proves the claimed global coset uniqueness.
Define the component map from M_k(Γ₀(𝔫)_𝔠) to M_k(Γ₀(𝔫)_𝔟) by

    (W_𝔮 f)_𝔟 = N𝔮^(-(k₀-2)/2) (N𝔠/N𝔟) (f_𝔠 ∣_k α).

Under 𝔟′=β𝔟 and 𝔠′=γ𝔠, use α′=diag(1,γ) α diag(1,β)⁻¹;
the norm ratio changes by Nγ/Nβ and intertwines the normalized transport of §2.3.
For 𝔟=𝔠=𝒪_F and 𝔮=𝔫=(π), π totally positive, take α=(0 −1; π 0).
Prove W_𝔮²=⟨[𝔮]⟩, so its restriction to central character 1 is an involution.
Prove: `W_𝔮` is well defined up to the central
action, commutes with the central action (the double coset of a scalar matrix commutes with every
double coset) and so **preserves** each `M_k(𝔫, ψ; R)`, preserves cusp forms, commutes exactly with
`T_𝔪` for `𝔪 + 𝔮 = 𝒪_F` (including `U_𝔭` for `𝔭 ∣ 𝔫𝔮⁻¹`), satisfies on the cusp space `W_𝔮 U_𝔭 W_𝔮⁻¹ = ⟨[𝔭]⟩ U_𝔭^{*}`
(`U_𝔭^{*}` the Petersson adjoint; on `S_k(𝔫, ψ; R)` the factor is `ψ([𝔭])`) for
`𝔭 ∣ 𝔮`, and `W_𝔮 W_𝔮' = W_{𝔮𝔮'}` up to the central action for coprime exact divisors; `W_𝔫` is the
**Fricke operator**. There is no nebentypus here, so `W_𝔮` does not invert `ψ`: the classical
`S_k(N, χ) → S_k(N, χ̄)` has no analogue.

*Rests on:* 1.1–1.3, 5.1, 5.2, 5.5; AdelicAlgebraicGroups §4.2 (SL₂ strong approximation).

**Checks.**

- Over `ℚ(√5)` at `𝔫 = (5w - 2)`, `W_𝔫` acts on `S_2(𝔫)` by `+1`, the LMFDB's
  `AL_eigenvalues = [[(5w - 2), 1]]` for `2.2.5.1-31.1-a`.
- When `h⁺_F = 1`, `W_𝔮² = ⟨[𝔮]⟩` is the identity, so `W_𝔮` is an involution.
- `W_𝔮` preserves `M_k(𝔫, ψ; R)`: an operator modelled on the classical
  `S_k(N, χ) → S_k(N, χ̄)`, which inverts `ψ`, is the wrong definition.
- Level `𝒪_F` has no exact prime-power divisor, so `2.2.24.1-1.1-a` has `AL_eigenvalues = []`.
- For k₀=4, q=4 and ψ=1, a Steinberg new line has a=±4; the adjoint identity gives ±4=±4, not ±64.
- For 𝔮=1 choose α=I, giving W₁=1. For principal level (π), α=(0 −1;π 0) gives the displayed Fricke map.
- For F=ℚ(√10), the nonprincipal 𝔮=(2,√10), level 𝔮, output 𝔟=𝒪_F and input 𝔠=𝔮⁻¹ admit α=(0 −1;1 0): det α=1 and 𝔫𝔠=𝒪_F. In weight two its factor is 1/2. In the reverse component choose α=(2 √10;√10 6), of determinant 2, with factor 2. Their factors multiply to 1; no generator of 𝔮 was assumed.


The Atkin–Lehner API keeps the component source and target.

- The displayed normalized map is independent of its admissible matrix choice and commutes with representative transport.
- Its square is the central class action, and its adjoint relation at level primes is the stated character-weighted identity.

### Examples

The discriminating examples are the Checks in §§5.2–5.6: good and bad primes, central characters and Fricke matrices.

### Dependencies

Layers 0–3; the supplied parallel Hecke operators and abstract double-coset formalism; AdelicAlgebraicGroups §4.2.

## Layer 6: the classical–adelic dictionary

This layer owns the comparison between the classical tuple spaces and the adelic function
spaces of the [GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md)
roadmap, so that its theorems about cuspidal automorphic representations of `GL₂(𝔸_F)` become
theorems about Hilbert newforms. It builds no representation theory.

### 6.1 The component set as a double coset

Let `K₀(𝔫) := ∏_𝔭 K₀(𝔫)_𝔭 ⊆ GL₂(𝒪̂_F)` be the Borel-at-`𝔫` compact open subgroup (the
supplier's R16.1.3 carrier). Prove
`GL₂⁺(F) \ GL₂(𝔸_{F,f}) / K₀(𝔫) ≃ NarrowClassGroup F`, induced by `det` (with `GL₂(F)` in place of
`GL₂⁺(F)` the quotient is `ClassGroup (𝓞 F)`), the finite-idele description of
`ClassGroup (𝓞 F)` ([Global Number Fields](../GlobalNumberFields/README.md) Layer 4) and that
of the narrow class group — `rayClassQuotient : IdeleClassGroup F →* RayClassGroup 𝔪` of its
Layer 7 at `𝔪 = narrowModulus F`, whose ray subgroup is positive at every real place, composed
with Tau Ceti's `narrowEquivNarrowClassGroup` — using strong approximation for `SL₂` with
respect to the archimedean places
([Adelic algebraic groups](../AdelicAlgebraicGroups/README.md) §4.2, for `D = M₂(F)`). Choose
`g_c := diag(1, t_c) ∈ GL₂(𝔸_{F,f})` with `t_c` a finite idele of ideal `rep(c)`, and prove
`GL₂(F) ∩ g_c K₀(𝔫) GL₂(F_∞)⁺ g_c⁻¹ = Γ₀(𝔫)_{rep c}`. This identifies the component set of the
LMFDB's tuples with the connected components of the adelic double coset and, by citation, with
the polarization classes of [Hilbert modular varieties and Shimura curves](../HilbertModularVarietiesAndShimuraCurves/README.md)
H3.6.

*Rests on:* 1.2, 1.5; Global Number Fields Layers 4 and 7; Tau Ceti
`narrowEquivNarrowClassGroup`; Adelic algebraic groups §4.2.

### 6.2 The comparison map

Define, for f∈M_k(𝔫;R), the adelic function Ψ_f by

    Ψ_f(γ g_c u g_∞) = N(rep(c)) (f_c ∣_k g_∞)(i),

where γ∈GL₂(F), u∈K₀(𝔫), g_∞∈GL₂(F_∞)⁺ and i=(i)_w. The slash formula of
§0.3 extends placewise to this real group. Prove the following API
(Dembélé–Voight, §7, (7.10), for the slash; GL2AutomorphicRepresentationsAndTransfer
R16.1, finite-level comparison, for the adelic carrier).

- The formula is independent of the decomposition, left GL₂(F)-invariant and right
  K₀(𝔫)-invariant; for §2.7 use its specified character equivariance instead.
- It has the prescribed rotation weights, is smooth and has moderate growth by §3.3.
  On the η-space its full right central law is
  Ψ_f(gzI)=η(z)⁻¹|z|_𝔸^(k₀−2)Ψ_f(g), as in §2.7 and §6.3.
- Evaluation on g_c g_∞, divided by N(rep(c)) and the nonzero slash factor, recovers f_c.
  With the antiholomorphic Cauchy–Riemann operator vanishing at every real place,
  this is an inverse between the indicated classical and adelic spaces.
- The map is linear, commutes with §2.3's representative transport, and identifies
  cuspidality with the vanishing of all adelic unipotent constant terms.

**Checks.**

- For rep′(c)=α rep(c), take g′_c=diag(1,α)g_c and g′_∞=diag(1,α)g_∞.
  Section 2.3 gives f′_c=N(α)⁻¹ f_c∣diag(1,α)⁻¹, so N(rep′)N(α)⁻¹=N(rep).
- In degree two α=2 gives factors 4 and 1/4, whose product is 1; omitting N(rep) leaves 1/4.
- In parallel weight four over ℚ(√5), the positive finite scalar 2 becomes infinite
  scalar 1/2 and acts by 1/16, whereas its inverse acts by 16. In weight two both are 1.

*Needs:* §§0.3, 2.3, 2.5, 3.3, 6.1; GL2AutomorphicRepresentationsAndTransfer R16.1.6
and its finite-level comparison. R16.6.1 supplies the ℚ specialization only.

### 6.3 Hecke compatibility

Give K₀(𝔫) volume one and use right translation R(h)Ψ(g)=Ψ(gh).
The classical T_𝔭 corresponds to the inverse double coset
(Dembélé–Voight, §7, equations (7.13)–(7.14), arXiv:1010.5727v2)
K₀(𝔫)diag(1,π_𝔭)⁻¹K₀(𝔫), and S_𝔭 to the inverse scalar coset
K₀(𝔫)(π_𝔭 I)⁻¹K₀(𝔫). Prove this at every prime, including 𝔭∣𝔫:
if an inverse right-coset representative gives g_𝔟 h=α⁻¹g_𝔠 u, then
Ψ_f(g_𝔟 h g_∞)=N𝔠(f_𝔠∣αg_∞)(i). Dividing by N𝔟 gives exactly
§5.1's N𝔠/N𝔟 factor, including the single central coset of §5.2.
The normalized central class action therefore corresponds to N𝔭^(−(k₀−2))
times the inverse scalar operator. On §2.7's η-space, the scalar law gives
R((π_𝔭 I)⁻¹)=η(𝔭)q^(k₀−2); its norm-normalization is η(𝔭).
When η is unramified at every finite place, this identifies exactly the
ψ([𝔭])=η(𝔭) eigenspace of §5.2, including nontrivial class characters.

Translate explicitly to the supplier's positive generators. At a good prime put q=N𝔭,
A⁺=[K diag(π,1) K], Z⁺=[K πI K], A⁻=[K diag(π,1)⁻¹ K] and Z⁻=(Z⁺)⁻¹.
The spherical double-coset identities are A⁻=(Z⁺)⁻¹A⁺ and Z⁻=(Z⁺)⁻¹.
Thus if the classical eigenvalues are a=c(𝔭,f) and b=ψ([𝔭])q^(k₀−2),
the raw positive eigenvalues on Ψ_f are a/b and 1/b, with b≠0.
At level primes the upper-left-unit condition in §5.1 fixes diag(1,π),
so retain that full inverse-coset identity; the Weyl interchange
used in the spherical identity is not asserted for K₀(𝔫)_𝔭.

For an occurring cuspidal eigensystem, let Π_Ψ be the right-translation representation
and set π_f=Π_Ψ∨⊗|det|_𝔸^((k₀−2)/2). On its good spherical line the
raw positive eigenvalues are q^(−(k₀−2)/2)a and ψ([𝔭]); its unitary Satake
coordinates in R16.4.4 are therefore

    t_unit = q^(-(k₀-1)/2) a,    s_unit = ψ([𝔭])/q.

Here R16.4.4 divides the raw spherical eigenvalue by √q and the scalar eigenvalue
by q. Undoing that root scaling gives the arithmetic shared coordinates
(t,s)=(a,b), so q s=ψ([𝔭])q^(k₀−1). Use π_f with this specified dual and
norm twist in every transfer, local-factor and central-character comparison below.
For ramified nebentypus use η in place of ψ at good primes and the full local
parameter elsewhere. This constructs the Hilbert counterpart of R16.4.4's newform adapter.

**Checks.**

- For q=4, k₀=4, ψ=1, b=16. Raw Ψ has scalar 1/16; the inverse scalar has
  16, the dual has 16, and the unitary twist multiplies this by 4⁻², giving 1.
- With the same data, raw Ψ has spherical eigenvalue a/16; the dual gives a;
  the twist gives a/4, and division by √4 gives a/8, agreeing with 4⁻³ᐟ²a.
- For k₀=2, q=4, ψ=1, the scalar is 1, but the shared unitary trace is a/2,
  not the raw spherical eigenvalue a.
- For N𝔟=1 and N𝔠=1/2, extraction divides N𝔠 by N𝔟 and gives 1/2;
  in the reverse direction it gives 2, with product 1 as in §5.6.

*Needs:* §§5.1–5.4, 6.2; GL2AutomorphicRepresentationsAndTransfer R16.4.4,
R16.3 (duals and norm twists of parameters).

### 6.4 What the dictionary transports

State and prove, as corollaries of 6.2–6.3 and the cited adelic theorems, the classical
statements used below: **multiplicity one** — for a system `λ = (λ_𝔭)_{𝔭 ∤ 𝔫}` occurring in a nonzero cusp form,
the simultaneous `λ`-eigenspace of the good `T_𝔭` in `S_k(𝔫, ψ; R)` is the space of weight-`k`
vectors fixed by `K₀(𝔫)` in a single cuspidal automorphic representation `π_λ`, of dimension the
number of ideal divisors of `𝔫 𝔠(π_λ)⁻¹`; first prove `𝔠(π_λ) ∣ 𝔫`, so this quotient is integral
(R16.2, R16.4.3,
R16.4.4); in particular it is a line when `𝔠(π_λ) = 𝔫`; **strong multiplicity one** — two
systems of good eigenvalues at levels `𝔫, 𝔫'` and equal weight that agree for all but finitely
many `𝔭 ∤ 𝔫𝔫'` agree at every `𝔭 ∤ 𝔫𝔫'` and have the same `π`, hence the same conductor and the
same `ψ` (R16.4.4); the **bad-prime local structure** of R16.3, as a statement about the
`U_𝔭`-eigenvalue of a `K₀(𝔫)`-fixed vector in `π` of conductor exactly `𝔫`, which Layer 7 reads
on the coefficients; and the hypotheses under which Jacquet–Langlands (R17.3.1), base change
(R17.4) and automorphic induction (R17.4.16) produce a classical form (Layers 9–10). Each is a
theorem about the classical objects with the adelic statement as a cited input.

*Rests on:* 6.1–6.3; the cited supplier milestones.

**Checks.**

- Over ℚ(√5), S₂ at unit level is zero (Dembélé–Voight, Example 6.3, p.28); no eigensystem occurs there.
- An occurring new eigensystem has conductor equal to level, quotient ideal 1, and one divisor, hence a one-dimensional new line.
- For old level 𝔠(π)𝔭, the quotient 𝔭 has two divisors and the unramified-central-character old space has dimension two.

### Examples

The discriminating examples are the Checks in §6.4: the zero cusp space and conductor quotient.

### Dependencies

Layers 1–3 and 5; the exact adelic, local-factor and multiplicity-one suppliers.

## Layer 7: old and new, newforms, and their invariants

### 7.1 Level-changing operators and the old subspace

For `𝔪 ∣ 𝔫`, `𝔪 ≠ 𝔫`, and `β ∈ GL₂⁺(F)`, define the level-changing double-coset operator
`[Γ₀(𝔪)_{rep c'} β Γ₀(𝔫)_{rep c}] : S_k(𝔪; R) → S_k(𝔫; R)` by the recipe of 5.1 with the
lattice conditions of the two levels, and define `S_k(𝔫; R)^{old}` as the span of the images of
all such operators over all `𝔪`, `β`, components. Prove that it is spanned by the images of two
families: the **inclusions** `ι : S_k(𝔫𝔭⁻¹; R) → S_k(𝔫; R)` (restriction along
`Γ₀(𝔫)_𝔟 ⊆ Γ₀(𝔫𝔭⁻¹)_𝔟`) and the **level-raising operators** `V_𝔭 : S_k(𝔫𝔭⁻¹; R) → S_k(𝔫; R)`
given by the single coset `α L_𝔟 = (𝒪_F ⊕ 𝔭𝔠)`-type sublattice of 5.1 with
`c(𝔪, V_𝔭 f) = c(𝔪𝔭⁻¹, f)` (`0` if `𝔭 ∤ 𝔪`), for the primes `𝔭 ∣ 𝔫`; in the principal case
`𝔭 = (π)`, `π ≫ 0`, `(V_𝔭 f)_𝔟(z) = ∏_w σ_w(π)^{-m_w} f_𝔟(πz)` (so `f_𝔟(πz)` in parallel weight). Prove that the old subspace is stable under every
`T_𝔪` (for `𝔪 + 𝔫 = 𝒪_F` because the level-changing operators commute with them; for `U_𝔭`,
`𝔭 ∣ 𝔫`, by the coefficient formulas on `ι` and `V_𝔭`), under the central action, and under the
Atkin–Lehner operators of 5.6, which interchange `ι` and `V_𝔭` up to the central action.

*Rests on:* 5.1–5.4, 5.6.

**Checks.**

- Over `ℚ(√5)`, `S_2(𝔪) = 0` for every `𝔪` of norm `≤ 30` (Dembélé–Voight, Example 6.3), so
  `S_2((5w - 2))^{old} = 0`.
- At level `𝒪_F` the old subspace is `0`: there is no proper divisor to come from.
- `c(𝔪, V_𝔭 f) = c(𝔪𝔭⁻¹, f)` and `0` when `𝔭 ∤ 𝔪`; in particular `c(𝒪_F, V_𝔭 f) = 0`, so
  `g + c · V_𝔭 g` (`g` a newform of level `𝔫𝔭⁻¹`) lies in the old subspace at level `𝔫`.


The old-space API uses all proper divisor levels.

- The old space is spanned by inclusion and prime level-raising images and is stable under the stated operators.
- Level-raising shifts the coefficient index and assigns zero when the shifted ideal is not integral.

### 7.2 The new subspace and newforms

Define `S_k(𝔫; R)^{new}` as the Petersson orthogonal complement of `S_k(𝔫; R)^{old}` in
`S_k(𝔫; R)`, and `S_k(𝔫, ψ; R)^{new}` by intersection. Prove stability under all `T_𝔪` (5.5:
the adjoints of the good `T_𝔪` are multiples of `T_𝔪`, and at `𝔭 ∣ 𝔫` by the explicit adjoint
of `U_𝔭`, which is `W_𝔫 U_𝔭 W_𝔫⁻¹` up to the central action by 5.6; the old subspace is stable under `U_𝔭` and under
`W_𝔫` by 7.1, hence under `U_𝔭^*`), under the central action,
and under the transport of 2.3. Define a **newform** of level `𝔫`, weight `k`, central character
`ψ` by the pinned convention: a tuple `f ∈ M_k(𝔫; R)` lying in `S_k(𝔫; R)^{new}`, lying in the
`ψ`-eigenspace `M_k(𝔫, ψ; R)` of the central action of 5.2, satisfying `T_𝔭 f = c(𝔭, f) f` for
every prime `𝔭 ∤ 𝔫`, and normalized by `c(𝒪_F, f) = 1` (the target structure is
`Newform F 𝔫 k R ψ`, with one field for each of these four conditions).
Prove that the newforms of `S_k(𝔫, ψ; R)^{new}` form an orthogonal basis of it (5.5 and the
multiplicity one of 6.4), and that the set of newforms is finite and independent of `R` up to
the transport.

*Rests on:* 3.4, 5.5, 6.4, 7.1.

**Checks.**

- `2.2.5.1-31.1-a` is a newform of level `(5w - 2)`, weight `2`, `ψ = 1`, and the only one:
  `newspace_dimension = 1`, with `c(𝒪_F, f) = 1` and `c(𝔭, f) = -3, -2, 2` at the primes of
  norm `4, 5, 9`.
- `g + c · V_𝔭 g` with `c ≠ 0` and `g` a newform of level `𝔫𝔭⁻¹` is a normalized eigenvector of
  the good `T_𝔭` at level `𝔫` but not a newform: it is old, and in general not a
  `U_𝔭`-eigenvector. A definition that drops the condition `f ∈ S_k(𝔫; R)^{new}` accepts it.
- At level `𝒪_F` every normalized cuspidal eigenvector of the `T_𝔭` with central character `ψ`
  is a newform (the old subspace is `0`); `2.2.24.1-1.1-a` and `2.2.40.1-1.1-a` are examples.


The newform API retains newness and normalization.

- The new space is Hecke-stable and independent of representative choice under transport.
- Its normalized simultaneous eigenvectors give the finite orthogonal basis in the fixed character space.

### 7.3 The newform decomposition

Prove that every simultaneous eigenvector `f` of the good `T_𝔭` in `S_k(𝔫, ψ; R)` has a unique
newform `g` of a unique level `𝔪 ∣ 𝔫` (its **conductor**), of the same weight and central
character, with `c(𝔭, g) = λ_𝔭(f)` for all `𝔭 ∤ 𝔫`, and that `f` lies in the span of the images
of `g` under the operators of 7.1 from level `𝔪`. Existence is the descent through the old
subspace (7.1 and induction on `𝔫`); uniqueness is strong multiplicity one (6.4). Deduce
`S_k(𝔫, ψ; R) = ⊕_{𝔪 ∣ 𝔫} ⊕_{g newform of level 𝔪} span{images of g}` and the dimension identity
`finrank S_k(𝔫, ψ; R) = Σ_{𝔪 ∣ 𝔫} τ(𝔫𝔪⁻¹) · finrank S_k(𝔪, ψ; R)^{new}`, `τ` the number of
ideal divisors. The LMFDB's `newspace_dimension` is `finrank S_k(𝔫, ψ; R)^{new}` summed over
the `ψ` it displays together.

*Rests on:* 6.4, 7.1, 7.2.

### 7.4 Newforms are eigenforms for every `T_𝔪`

Prove that a newform is an eigenvector of `T_𝔪` for **every** nonzero `𝔪`, including `U_𝔭` at
`𝔭 ∣ 𝔫`, with eigenvalue `c(𝔪, f)` (the eigenvalue–coefficient identity of 5.4 gives the value
once eigen-ness is known; eigen-ness at `𝔭 ∣ 𝔫` comes from 7.2's stability of the new subspace
under `U_𝔭`, the commutation of `U_𝔭` with the good operators, and multiplicity one 6.4), and
that `c(·, f)` is multiplicative: `c(𝔪𝔪', f) = c(𝔪, f) c(𝔪', f)` for coprime `𝔪, 𝔪'`, with the
recurrence `c(𝔭^{r+1}, f) = c(𝔭, f) c(𝔭^r, f) - ψ([𝔭]) N𝔭^{k₀ - 1} c(𝔭^{r-1}, f)` for `𝔭 ∤ 𝔫`
and `c(𝔭^r, f) = c(𝔭, f)^r` for `𝔭 ∣ 𝔫`. Prove the converse characterization: a nonzero
`f ∈ S_k(𝔫, ψ; R)` with `c(𝒪_F, f) = 1` is an eigenform iff its coefficients satisfy
multiplicativity and these recurrences. The Hilbert statement follows by comparing
all normalized ideal coefficients using §§5.3–5.4 and cusp expansion injectivity
§2.6; the coefficient at the unit ideal fixes each eigenvalue. The newform
assertion also uses GL2AutomorphicRepresentationsAndTransfer R16.4.4's strong
multiplicity one through §6.4. Diamond–Shurman Proposition 5.8.5 is the
classical analogue over ℚ, not a source for a general-field theorem.

*Rests on:* 5.3, 5.4, 6.4, 7.2.

### 7.5 Hecke orbits, the coefficient field, Galois conjugates

Define `CoefficientField f := IntermediateField.adjoin ℚ (range (c(·, f))) ⊆ ℂ`. Prove that it
is a **number field**. Use AutomorphicBundles §11.9 for analytic comparison, §11.18 for
base change over a defining number field L for the labeled weight and character, and
§§12.17–12.19 for the Hilbert expansions and cusp criterion. Field base change alone supplies
no integral Hecke lattice. The additional integral contract needed here is a finite full
𝒪_L-lattice in the rational cusp space, stable under every arithmetic T_𝔪, with the
normalized coefficient maps taking values in 𝒪_L. Its construction for nonparallel weights
is a target of this section: construct the all-cusp integral expansion lattice, prove finite
generation and fullness (not just injectivity of expansion), and prove Hecke stability by the
coefficient formulas at every cusp (Shimura 1978, §2, pp. 637–651). Parallel-weight
expansion lattices use the supplier in Scope and ownership. Integral eigenvalues and finite
dimensionality over L then give algebraic integrality and finiteness over ℚ. Prove that for `ψ = 1` the field is **totally real** (5.5: real eigenvalues of
self-adjoint operators, and the conjugates below are again eigenvalues). Define the Galois
conjugate `f^σ` for `σ : CoefficientField f →+* ℂ` as the unique newform with
`c(𝔪, f^σ) = σ(c(𝔪, f))` (existence by extending σ to an automorphism of ℂ and transporting the defining field, labeled weight and character; newform-ness and
uniqueness from 7.2–7.3), and the **Hecke orbit** `{f^σ}` of cardinality
`finrank ℚ (CoefficientField f)` — the LMFDB's `dimension`. Prove that the orbit, the level, the
multiset of weights and the conductor of `ψ` are constant on an orbit; the labeled weight
is transported by the embedding, rather than assumed fixed,
and that `c(𝔭, f^σ) = σ(c(𝔭, f))` makes the LMFDB's `hecke_eigenvalues` of the orbit the
coordinates of one element of `CoefficientField f` per prime.

*Rests on:* 5.5, 7.2–7.4; AutomorphicBundles §§11.9, 11.18, 12.17–12.19; the integral lattice target of this section.

**Checks.**

- `CoefficientField f = ℚ` and `dimension = 1` for `2.2.5.1-31.1-a`.
- For Dembélé–Voight's newform at `𝔫 = (w + 3)²` over `ℚ(√5)`, `CoefficientField f = ℚ(√3)`,
  `dimension = 2`, and the conjugate `f^σ` with `σ(t) = -t` has `c((2), f^σ) = -t`,
  `c((w - 5), f^σ) = -4t` (`t² = 3`).
- `2.2.40.1-1.1-a` has a real quadratic coefficient field (totally real, as `ψ = 1`) and a Hecke
  orbit of two newforms.

**Checks on rational structures.**

- Swapping the embeddings of a quadratic F sends weight (2,4) to (4,2); it does not fix that labeled space.
- Parallel (2,2) is fixed by this permutation.
- A defining field L remains L under L⊗_L L=L; this gives no descent of its space to ℚ.


The coefficient-field and conjugation API includes the integral lattice contract.

- The field generated by normalized coefficients is finite over ℚ and contains algebraic integers as the coefficients.
- Conjugation transports labeled weights and characters and sends each coefficient to its image; embeddings parametrize the Hecke orbit.

### 7.6 Coefficients at the bad primes

For a newform `f` of level `𝔫`, central character `ψ`, and `𝔭 ∣ 𝔫`, prove: `c(𝔭, f) ≠ 0` iff
`v_𝔭(𝔫) = 1`, and then `c(𝔭, f)² = ψ([𝔭]) N𝔭^{k₀ - 2}`, so `|c(𝔭, f)| = N𝔭^{k₀/2 - 1}`. Since `ψ`
factors through the narrow class group it is unramified at every finite place, so the local
component of `π_f` at `𝔭` has unramified central character: at `v_𝔭(𝔫) = 1` it is an unramified
twist of the Steinberg representation (whose `U_𝔭`-eigenvalue is `μ(ϖ) N𝔭^{k₀/2 - 1}` with
`μ² = ψ_𝔭`), and at `v_𝔭(𝔫) ≥ 2` it has no unramified character in its inducing data, so the
newvector's `U_𝔭`-eigenvalue is `0`. These are the supplier's R16.3 local-parameter cases, transported by
6.4 (the ramified-principal-series case with a nonzero eigenvalue needs a ramified central
character and does not occur here); for `ψ = 1` and `𝔭² ∣ 𝔫` the conclusion `c(𝔭, f) = 0` and for
`𝔭 ‖ 𝔫` the conclusion `c(𝔭, f) = ±N𝔭^{k₀/2 - 1}` are the statements that the Atkin–Lehner signs
refine.

*Rests on:* 6.4, 7.4; GL₂ automorphic representations and transfer R16.3.

### 7.7 Atkin–Lehner pseudo-eigenvalues and signs

For a newform `f` and an exact divisor `𝔮 ‖ 𝔫` prove that `W_𝔮 f = λ_𝔮(f) f` for a scalar
`λ_𝔮(f)` with `λ_𝔮(f)² = ψ([𝔮])`: `W_𝔮` commutes with the good `T_𝔪`, preserves the new subspace,
the level and `ψ` (5.6), so multiplicity one (6.4) makes `W_𝔮 f` a multiple of `f`, and
`W_𝔮² = ⟨[𝔮]⟩` gives the square. (`W_𝔫 f` is **not** a multiple of the conjugate newform `f^ρ`,
which has central character `ψ⁻¹` and good eigenvalues `ψ([𝔪])⁻¹ c(𝔪, f)`; the classical
`f ∣ W_N = λ f^ρ` reflects the inversion of the nebentypus, which is absent here.) For `ψ = 1`
write `ε_𝔮(f) := λ_𝔮(f) ∈ {±1}`, that the signs
multiply (`ε_{𝔮𝔮'} = ε_𝔮 ε_𝔮'`), that for `𝔭 ‖ 𝔫`, `c(𝔭, f) = -ε_𝔭(f) N𝔭^{k₀/2 - 1}`, and that
for `𝔭² ∣ 𝔫` the sign `ε_{𝔭^{v}}(f)` is not determined by the single local coefficient `c(𝔭, f) = 0`; the full
normalized newform, and hence its full good coefficient system, determines the sign. Prove `ε_𝔮(f^σ) = ε_𝔮(f)` for Galois conjugates. For general `ψ` the
**pseudo-eigenvalue** `λ_𝔮(f)` above has `|λ_𝔮(f)| = 1` and is a square root of `ψ([𝔮])`; no `±1`
sign is claimed. For every unramified finite central character ψ and every 𝔭 ‖ 𝔫,
prove the coefficient comparison

    c(𝔭, f) = −λ_𝔭(f) N𝔭^(k₀/2 − 1).

For π_f in §6.3’s dual and norm-twist convention, on its local unramified
Steinberg twist by μ the normalized Atkin–Lehner matrix acts on the new line by −μ(ϖ), while the arithmetic U_𝔭 acts by
μ(ϖ)N𝔭^(k₀/2−1); here μ(ϖ)²=ψ([𝔭]). Transport these two actions together
through §6.4, using GL2AutomorphicRepresentationsAndTransfer R16.2.1 and R16.3.2,
so the sign is fixed by the matrix of §5.6, not chosen from its square alone.
The ε formula is precisely the specialization ψ=1. These are the Hilbert instances of the Modular
Forms roadmap's Layer 6 theorems and are proved by the same route: the coefficient formulas 5.4
and 7.6 and strong multiplicity one 6.4.

*Rests on:* 5.5, 5.6, 6.3, 6.4, 7.4, 7.6; GL2AutomorphicRepresentationsAndTransfer R16.2.1 and R16.3.2.

**Checks.**

- `2.2.5.1-31.1-a`: `c((5w - 2), f) = -1`, so `ε_(5w - 2)(f) = -c((5w - 2), f) = +1`.
- `2.2.5.1-81.1-a` at level `(3)²`: `c((3), f) = 0` by 7.6, and `ε_(9)(f)` is not determined by
  this zero local coefficient alone.
- Over F=ℚ(√229), base-change the form of y²+y=x³−x²−10x−20 and twist
  by the unramified cubic class character χ from the splitting field of x³−4x−1.
  At a prime 𝔭 above 11 choose χ(𝔭)=ζ₃. Split multiplicative reduction gives
  c(𝔭)=ζ₃, ψ([𝔭])=ζ₃² and λ_𝔭=−ζ₃: then −λ_𝔭·11⁰=ζ₃ and
  λ_𝔭²=ζ₃², whereas neither λ_𝔭 nor c(𝔭) is a real sign. The cubic has
  discriminant 229, has no rational root (its values at 1 and −1 are −4 and 2),
  is irreducible modulo 11, and has three real roots; its S₃ splitting field is cyclic cubic and everywhere unramified over F.
  For the curve, Δ=−11⁵, c₄=496 and the tangent cone at (5,5) modulo 11
  is Y²−3X²=(Y−5X)(Y+5X), fixing the split-multiplicative value +1.
  The twist and base change are the constructions of §§9.1 and 9.4.
- Level `𝒪_F` has no Atkin–Lehner signs: `2.2.24.1-1.1-a`, `2.2.29.1-1.1-a` have
  `AL_eigenvalues = []`.

### Examples

The discriminating examples are the Checks in §§7.5–7.7: labeled weights, coefficient fields and local signs.

### Dependencies

Layers 5–6; AutomorphicBundles §§11.9, 11.18, 12.17–12.19 and the integral contract in §7.5.

## Layer 8: `L`-functions

### 8.1 The Dirichlet series and its Euler product

For `f ∈ M_k(𝔫; R)` define `L(f, s) := LSeries (normCoeff (c(·, f))) s`, the ideal Dirichlet
series `Σ_𝔪 c(𝔪, f) N𝔪^{-s}` regrouped by norm. Prove absolute convergence for
`Re s > k₀/2 + 1` when `f` is a cusp form and for `Re s > k₀ + 1` in general (§3.3 and the ideal-counting bounds of ArithmeticDirichletSeries Layer 5; finite norm fibres alone do not give convergence). For a newform of central character `ψ` prove the **Euler product**
on `Re s > k₀/2 + 1`:
`L(f, s) = ∏_{𝔭 ∤ 𝔫} (1 - c(𝔭, f) N𝔭^{-s} + ψ([𝔭]) N𝔭^{k₀ - 1 - 2s})⁻¹ · ∏_{𝔭 ∣ 𝔫} (1 - c(𝔭, f) N𝔭^{-s})⁻¹`,
packaged as an `EulerProductData F` whose local factors are these polynomials in `N𝔭^{-s}`, from
the multiplicativity and recurrences of 7.4. Record the local factor `L_𝔭(f, T)` as a polynomial
of degree `2` (`𝔭 ∤ 𝔫`) or `≤ 1` (`𝔭 ∣ 𝔫`), the object the base-change relation of Layer 9 reads.

*Rests on:* 3.3, 7.4; Arithmetic Dirichlet Series `normCoeff`, `EulerProductData`.

**Checks.**

- For `2.2.5.1-31.1-a`: `L_(2)(f, T) = 1 + 3T + 4T²`, `L_(2w - 1)(f, T) = 1 + 2T + 5T²`, and at
  the bad prime `L_(5w - 2)(f, T) = 1 + T`.
- For the same form, the norm-regrouped coefficient at `4` is `c((2), f) = -3` (`2` is inert, so
  `(2)` is the only ideal of norm `4`), and at `11` it is `4 + (-4) = 0`, the sum over the two
  primes of norm `11`.
- The good local factors of `2.2.5.1-31.1-a` are `1 - a_𝔭(E) T + N𝔭 T²` for the attached curve
  `E = 2.2.5.1-31.1-a1` (11.3).


The L-series API is stated using native norm-regrouped coefficients.

- The coefficient at natural index zero is 0; each positive index sums the finitely many ideals of that norm.
- Absolute convergence holds in the two stated half-planes, and the all-prime Euler product of a newform agrees there with the Dirichlet series.

**Checks.**

- At weight four and s=6 the general threshold is 5<6 and the cusp threshold is 3<6; a noncuspidal Eisenstein form satisfies the former.
- For the weight-zero constant form the positive coefficient sequence is zero, and its L-series is 0; no pole is introduced by its constant term.

### 8.2 The completed `L`-function and its functional equation

For a newform `f` of level `𝔫` define
`Λ(f, s) := (N(𝔫) |d_F|²)^{s/2} ∏_w (2π)^{-(s - m_w)} Γ(s - m_w) · L(f, s)`.
The gamma factors and arithmetic/unitary variable shift are those of
Raghuram–Tanabe, §4.4.1, p. 34 and Theorem 4.16, p. 35; the full
conductor-normalized equation is GL2AutomorphicRepresentationsAndTransfer
R16.5.4, transported through §6.3 and §8.1 with t=s−(k₀−1)/2.
A classical proof route is the Hecke–Shimura Mellin method. With d×y=∏_w dy_w/y_w and a fundamental domain D for
`𝒪_{F,+}^×` acting on `(ℝ_{>0})^Σ`, put

    I_𝔟(f,s) = ∫_D f_𝔟(iy) ∏_w y_w^(s-m_w) d×y,
    Λ(f,s) = Q^(s/2) Σ_𝔟 (N𝔟/|d_F|)^s I_𝔟(f,s),  Q=N𝔫 |d_F|².

The norm of a nonzero fractional ideal is positive, so all powers use its real logarithm.
The unit law gives exponent k_w+2m_w−1=k₀−1, making the integrand invariant.
Unfold positive Fourier exponents modulo positive units to the whole positive orthant:
`∫₀^∞ exp(−2πμ_w y) y^(s-m_w) dy/y = (2πμ_w)^(-(s-m_w)) Γ(s-m_w)`.
Since Nμ=N𝔪 N𝔟/|d_F|, this proves the displayed equality in the convergence half-plane.
Replacing 𝔟 by α𝔟 changes I_𝔟 by Nα^(−s) and its prefactor by Nα^s.
Split the integral at the inversion supplied by W_𝔫 and use cusp decay to obtain an
**entire** continuation; prove it is bounded in vertical strips and satisfies
`Λ(f, s) = ε(f) Λ(f^ρ, k₀ - s)`. In general character,
`ε(f) = i^{Σ_w k_w} ∏_{v finite} ε(1/2,π_f,v,ψ_v)`, using the unitary local
representation and the standard trace additive character with self-dual measures,
as in AutomorphicLFunctionsAndLocalFactors AL.2 (standard local functional equation).
The local factors are the supplied epsilon factors, not an unspecified choice of a square root;
for `ψ = 1`, `f^ρ = f` and `ε(f) = i^{Σ_w k_w} ∏_{𝔭 ∣ 𝔫} ε_{𝔭^{v_𝔭(𝔫)}}(f)`. For parallel weight `2`,
`ε(f) = (-1)^n ∏_{𝔭 ∣ 𝔫} ε_{𝔭^{v_𝔭(𝔫)}}(f)`. Each product uses the full prime powers of the
level. The operators for arbitrary exact divisors are those of §§5.6 and 7.7.
For `F = ℚ` this is the Modular Forms roadmap's Layer 7 equation with
`i^k`. Prove `|ε(f)| = 1`, and `ε(f) ∈ {±1}` when `ψ = 1`.

*Rests on:* 2.6, 3.1, 5.6, 6.3, 7.7, 8.1;
GL2AutomorphicRepresentationsAndTransfer R16.3.6 and R16.5.4 for the
representation-theoretic route; Mathlib `mellin`, `Complex.Gamma` for the Mellin route.

**Checks.**

- `2.2.5.1-31.1-a`: `ε(f) = (-1)^2 · ε_(5w - 2)(f) = +1`.
- Over ℚ(√13), let f correspond to y²+xy+y=x³+x²−10x−10
  (Freitas–Le Hung–Siksek, Theorem 1, p. 2). Here c₄=481 and Δ=3⁴5⁴;
  the singular reductions have 5 projective points at both 3 and 5, so a₃=−1
  and a₅=1. The prime 3 splits and 5 is inert, giving prime-power signs
  (+1,+1,−1); the formula gives (−1)²(+1)(+1)(−1)=−1. Multiplying over
  all eight exact divisors would instead give (+1)⁴(+1)⁴(−1)⁴=+1.
- At level one the prime product is empty and equals 1, so `ε(f) = (-1)^2 = 1` for `2.2.24.1-1.1-a` and `2.2.29.1-1.1-a`.
- In parallel weight `2` over a real quadratic field every `m_w = 0`, so
  `Λ(f, s) = (N(𝔫) d_F²)^(s/2) ((2π)^(-s) Γ(s))² L(f, s)`; for `2.2.5.1-31.1-a`,
  `N(𝔫) d_F² = 31 · 25 = 775`.
- For `ψ = 1`, `f^ρ = f`.

**Checks on normalization.**

- For weights (2,4), m=(1,0), inversion contributes i²i⁴=−1, whereas i⁸=1 is incorrect.
- For parallel weight two it contributes (i²)^n=(−1)^n.
- With 𝔟′=2𝔟 in degree two, the Mellin integral changes by 4^(−s) and its prefactor by 4^s, giving product 1.


The completion API retains every archimedean place.

- Mellin integration agrees with the series completion on its convergence half-plane.
- Cusp decay gives an entire continuation; the functional equation uses the dual form and the stated local epsilon factors.

### 8.3 The `L`-function card and the analytic invariants

Construct the [L-functions](../LFunctions/README.md) roadmap's `ArithmeticLFunctionData` of a
newform: coefficients `normCoeff (c(·, f))` with `coeff 0 = 0`, arithmetic weight `k₀ - 1`,
conductor `N(𝔫) · |d_F|²`, gamma shifts `gammaC = {(k_w - 1)/2 : w ∈ Σ}` after the
`NormalizationTranslation` to the analytic normalization (so the degree is `2n` and the analytic
centre is `1/2`), root number `ε(f)`, arithmetic completion `2^n Λ(f, s)` with Deligne complex gamma factors
`Γℂ(s-m_w) = 2(2π)^(-(s-m_w)) Γ(s-m_w)`, and analytic completion
`2^n Q^(-(k₀-1)/4) Λ(f, s+(k₀-1)/2)`, where `Q = N(𝔫)|d_F|²`, empty polar
divisor. Prove its `HasDirichletAgreement`, `HasMeromorphicContinuation`,
`HasFunctionalEquation` (against the card of `f^ρ`, which is the card's dual) and
`HasAverageCoefficientBound` from 8.1–8.2 and 3.3. Define the **analytic rank** as the order of
vanishing of the entire continuation of `Λ(f, ·)` at `s = k₀/2` (never of Mathlib's raw
`LSeries`, which is `0` off its half-plane), prove it is even when `ε(f) = 1` and odd when
`ε(f) = -1` for `ψ = 1`, and define the analytic conductor by the Iwaniec–Kowalski recipe
applied to this card. Prove `L(f^σ, s)` is the card of the conjugate, and that the product over
the Hecke orbit has rational coefficients. The elliptic-curve interface of 11.3 compares this card
with the curve's.

*Rests on:* 7.5, 8.1, 8.2; L-functions Layer 0.

**Checks.**

- `2.2.5.1-31.1-a` has `ε(f) = +1`, so its analytic rank is even; its card has degree `4` and
  conductor `775`.
- The rank is the order of `Λ(f, ·)` at `s = k₀/2 = 1`: Mathlib's `LSeries` at `s = 1` lies outside
  its half-plane of convergence and takes the junk value there, so a definition through the raw
  series is wrong.

**Check on card completion.** For n=2, k₀=2 and Q=775 the analytic completion
is 4·775^(−1/4) times the recentered Λ; degree 4, conductor 775 and centre 1/2 are unchanged.


The card and rank API uses the entire completion.

- Arithmetic-to-analytic translation rescales the completion by the displayed power of Q and factor 2ⁿ.
- The order of vanishing at the centre has the parity of the functional-equation sign in trivial character; conjugate orbit products have rational coefficients.

### Examples

The discriminating examples are the Checks in §§8.1–8.3: local polynomials and completion constants.

### Dependencies

Layers 3–7; ArithmeticDirichletSeries Layers 0–5 and LFunctions Layer 0.

## Layer 9: twists, complex multiplication, base change

### 9.1 Twists by finite-order Hecke characters

For any finite-order Hecke character χ of F with finite conductor 𝔣₀, and a newform f
of level 𝔫 and character η in §2.7, construct the coefficient twist with
c(𝔪,f⊗χ)=χ(𝔪)c(𝔪,f) for ideals prime to 𝔣₀ and zero otherwise.
Prove it is a cusp form with character ηχ² at level dividing
lcm(𝔫,𝔣₀²,𝔣₀ cond(ηχ)_finite). The route uses finite Gauss sums and translations
on the Γ₁ character space, retaining every local conductor. When η is unramified
at finite places this bound reduces to lcm(𝔫,𝔣₀²); χ² need not be unramified.
(Atkin–Li, twists and pseudo-eigenvalues, twist-level theorem; the Hilbert adapter uses
GL2AutomorphicRepresentationsAndTransfer R16.3 at every finite place.)
Define the **primitive associate** `(f ⊗ χ)^{new}` (7.3) and prove
`c(𝔭, (f ⊗ χ)^{new}) = χ(𝔭) c(𝔭, f)` for `𝔭 ∤ 𝔫𝔣₀`, the twist of the `L`-function
`L((f ⊗ χ)^{new}, s)` agreeing with `Σ χ(𝔪) c(𝔪, f) N𝔪^{-s}` up to finitely many Euler factors,
and functoriality `(f ⊗ χ) ⊗ χ' = f ⊗ χχ'` on good coefficients.

*Rests on:* 2.4, 7.3, 7.4; Tau Ceti `HeckeCharacter.idealCharacter`, `conductor`; Global Number
Fields Layer 9.

**Checks.**

- Dembélé–Voight Example 6.7 at `𝔫 = (w + 4)²` over `ℚ(√5)`: `g = (f ⊗ χ)^{new}` for the
  quadratic character `χ` of `F(√(w(w + 4)))/F`, with `c((2), g) = -2 = -c((2), f)`,
  `c((w + 2), g) = -3 = c((w + 2), f)`, `c((3), g) = -1 = -c((3), f)`.
- The twist by the trivial character is `f`.
- A character χ of order three is admitted in the character space: its twist has central
  character ηχ²; it is excluded only from the unramified specialization when χ² is ramified.


The twist API distinguishes the coefficient twist from its primitive associate.

- Good coefficients are multiplied by the ideal-character values; conductor-supported coefficients of the coefficient twist are zero.
- The primitive associate has the prescribed conductor, character and good coefficients, and repeated twists compose on common good ideals.

### 9.2 Inner twists and the CM predicate

Define an **inner twist** of a newform `f` as a pair `(σ, χ)` with `σ` an embedding of
`CoefficientField f` and `χ` a finite-order Hecke character such that
`c(𝔭, f^σ) = χ(𝔭) c(𝔭, f)` for all `𝔭 ∤ 𝔫𝔣₀`; prove the group law and that `χ` is then
determined by `σ` only modulo the self-twist group. Use automorphisms of a common normal
coefficient field to form the group of pairs, with product
`(σ,χ)(τ,η) = (στ, χ · σ(η))`, projection to σ, and kernel the self-twists.
For embeddings of the coefficient field, each nonempty fibre is a torsor under this kernel.
In the absence of nontrivial self-twists the character is unique. Define HasCM f as the existence of a **nontrivial** `χ` with
`(id, χ)` an inner twist — the knowl `mf.cm`: `f` equals its twist by `χ` on good coefficients.
Prove: such `χ` is quadratic (`χ² = 1`: by the cited characterization of 9.3, `π_f ≅ π_f ⊗ χ`
forces `π_f` to be induced from the kernel of `χ`, which has index `2`); `χ` is odd at every
real place, so it defines a totally imaginary quadratic extension `K/F` (a real place where `χ`
is even would make the induced representation non-holomorphic there), that is, `K` is a CM field with maximal
totally real subfield `F` (Mathlib `NumberField.IsCMField`); and `c(𝔭, f) = 0` for every `𝔭 ∤ 𝔫`
inert in `K/F`. Prove that HasCM is constant on Hecke orbits and invariant under twisting by
any `χ'` admissible in 9.1. The LMFDB's `is_CM` is HasCM f.

*Rests on:* 7.5, 9.1; Mathlib `IsCMField`; Class Field Theory for the dictionary between
quadratic Hecke characters and quadratic extensions ([Class Field Theory](../ClassFieldTheory/README.md)
Layer 12, the global correspondence).

**Checks.**

- `2.2.5.1-81.1-a` and `2.2.24.1-1.1-a` have CM (`is_CM = yes`).
- `2.2.5.1-31.1-a` is rejected: the candidate fields `F(√-1)` and `F(√(-(3w + 5)))` both have
  relative discriminant divisible by `(2)²`, and `(3w - 2)`, inert in `F(√-1)`, and `(4w - 1)`,
  inert in `F(√(-(3w + 5)))`, have `c = 4 ≠ 0`.
- Dembélé–Voight's newform at `(w + 3)²` is rejected: `(w - 4)` is inert in `F(√-1)` and `(3)` in
  `F(√(-(w + 3)))`, while `c((w - 4), f) = -2t` and `c((3), f) = -1` are nonzero.

**Check on the self-twist fibre.** For a CM form, (id,1) and (id,χ_CM) both occur:
at inert primes 0=(−1)·0, and at split primes c=1·c. Thus the identity fibre has at least two elements.


The inner-twist API is a group of pairs on a normal coefficient field.

- Projection to coefficient automorphisms has the self-twist kernel; a nonempty fibre is a torsor under that kernel.
- The CM predicate is invariant under coefficient conjugation and admissible twisting, and its nontrivial self-twist is quadratic and totally odd.

### 9.3 CM forms from Hecke characters of CM extensions

Let `K/F` be a CM extension and `ξ` an algebraic Hecke character of `K` (`HeckeCharacter K`
with `IsAlgebraic`) whose algebraic infinity type has exponents `(n_τ, n_{τ̄})` with
`n_τ + n_{τ̄} = 1 - k₀` and `|n_τ - n_{τ̄}| = k_w - 1` at the two complex embeddings `τ, τ̄` above
`w`, with every k_w≥2, and with `ξ ≠ ξ ∘ (conjugation)`. These are the native
idelic exponents: on a principal ideal with generator congruent to 1 modulo the finite
conductor, the ideal value is the inverse embedding monomial
(`HeckeCharacter.idealCharacter_apply_toPrincipalIdeal_eq_embeddingCharacter_inv`,
`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean`). Thus the
ideal-character exponents have sum k₀−1. Define the coefficients
`c(𝔪) := Σ_{𝔄 ⊆ 𝒪_K, N_{K/F}(𝔄) = 𝔪} ξ(𝔄)` (sum over integral ideals of `K` of relative norm `𝔪`,
`ξ(𝔄)` the ideal character, `0` at ideals meeting the conductor). Prove that they are the
coefficients of a newform `θ_ξ` of weight `k`, level `𝔡_{K/F} N_{K/F}(𝔣_ξ)`, and central
character η determined on good primes by
`η(𝔭) N𝔭^(k₀-1) = χ_{K/F}(𝔭) ξ(𝔭𝒪_K)`, equivalently the finite-order
part of the idelic character `ξ|_F · χ_{K/F}` after removing its norm factor, in the space of §2.7, and that HasCM θ_ξ with inner twist `χ_{K/F}`. Existence is
**consumed**: automorphic induction from `GL₁(𝔸_K)` to `GL₂(𝔸_F)`
([GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md)
R17.4.16, applied in unitary normalization to ξᵘ=ξ|·|_𝔸_K^((k₀−1)/2),
with `ξ ≠ ξᶜ` for cuspidality), compared to π_f of §6.3. Its good-prime
roots are q^(−(k₀−1)/2) times the ideal-character values; undo this scaling
before reading arithmetic coefficients and η. The coefficient identity is the split/inert
trace formula of that construction, and the level is its conductor. Prove the converse by
citation: a CM newform in the sense of 9.2 is `θ_ξ` for some `(K, ξ)`
([Automorphic Galois representations](../AutomorphicGaloisRepresentations/README.md) §§3.15–3.16).
Record the coefficient-field consequence: `CoefficientField θ_ξ` is the field generated by the
norm-fibre sums `Σ_{N(𝔄)=𝔪} ξ(𝔄)`, and is contained in the field generated by the individual
values of `ξ`; equality is not asserted. At split `𝔭 = 𝔓𝔓̄`,
`c(𝔭, θ_ξ) = ξ(𝔓) + ξ(𝔓̄)` (AutomorphicGaloisRepresentations §3.15).

*Rests on:* 7.2, 7.5, 9.2; Tau Ceti `HeckeCharacter.IsAlgebraic`, `AlgebraicInfinityType`;
the cited supplier milestones.

The CM-coefficient API is:

- The norm-fibre sums are the normalized ideal coefficients of θ_ξ; at a good
  split prime they are ξ(𝔓)+ξ(𝔓̄), and at a good inert prime the coefficient is 0.
- The conductor, weight and central character are those displayed above, and
  twisting by the quadratic character of K/F fixes θ_ξ, by the induced local parameter.
- The coefficient field is generated by the norm-fibre sums and is contained
  in the field of the inducing values; equality with the latter is not required.

**Checks.**

- For the base change of y²=x³−x to ℚ(√5), the split norm-5 inducing values
  −1+2i and −1−2i sum to −2 and have product 5. The native infinity exponents
  are (−1,0). The form has rational coefficients while these values generate ℚ(i).
- The inverse character has exponents (1,0), whose sum 1 differs from 1−2=−1.
  Its values sum to −2/5 and have product 1/5, so it fails the weight-two condition.
- At an unramified inert prime, the matrix (0,ξ(𝔭𝒪_K);1,0) has trace 0 and
  determinant −ξ(𝔭𝒪_K), agreeing with `χ_{K/F}(𝔭)=−1`. For ξ(𝔭𝒪_K)=−9
  this gives trace 0 and determinant 9, whereas omitting χ gives −9
  (GL2AutomorphicRepresentationsAndTransfer R17.4.16).

### 9.4 The base-change relation

For number fields `F ⊆ K`, a newform `f` over `F` with local factors `L_𝔭(f, T)` (8.1) and a
newform `g` over `K`, define IsBaseChangeOf g f by the pinned convention:
`L_𝔮(g, T) = L_𝔭^{(r)}(f, T)` for all but finitely many primes `𝔮` of `K`, where `𝔮 ∣ 𝔭`,
`r = f(𝔮/𝔭) ≥ 1`. For an Euler polynomial h with h(0)=1, write
h(T)=∏ᵢ(1−αᵢT) with nonzero αᵢ and define h⁽ʳ⁾(T)=∏ᵢ(1−αᵢʳT).
For r≥1 this preserves degree and fixes h⁽ʳ⁾(0)=1. Its multiset of roots in T
is the pushforward of the root multiset of h under λ↦λʳ: the multiplicity
at β is `Σ_{λʳ=β} mult_h(λ)`. Distinct roots may therefore merge. It is independent of the ordering of the αᵢ,
commutes with coefficient embeddings, and composes by (h⁽ʳ⁾)⁽ˢ⁾=h⁽ʳˢ⁾.
For h(T)=det(1−AT) with A invertible this is det(1−AʳT), the supplier's
R17.4.1 unramified restriction rule. Prove the Satake
form: `c(𝔮, g) = p_r(c(𝔭, f), ψ([𝔭]) N𝔭^{k₀ - 1})` with `p_r` the power-sum polynomial
(`p_0 = 2`, `p_1 = s`, `p_{r+2} = s p_{r+1} - e p_r`, the supplier's `satakePowerSum`), so for
`r = 1`, `c(𝔮, g) = c(𝔭, f)`, and for `r = 2`, `c(𝔮, g) = c(𝔭, f)² - 2ψ([𝔭]) N𝔭^{k₀ - 1}`.
Prove uniqueness of `g` given `f` (strong multiplicity one, 6.4), the weight of `g`
(`k_{w'} = k_w` for `w' ∣ w`), the transitivity in towers, and the Galois invariance
`c(σ𝔮, g) = c(𝔮, g)` for `σ ∈ Aut(K/F)`. The base case `F = ℚ` takes `f : HeckeRing.GL2.Newform
N k` with its Euler factors from the Modular Forms roadmap's Layer 7, so `IsBaseChangeOf g f` is
also defined for a classical newform `f`. Define `IsBaseChange g := ∃ F₀ ⊊ K, ∃ f over F₀,
IsBaseChangeOf g f` (with `F₀ = ℚ` through the classical carrier); the LMFDB's `is_base_change`
is this predicate. Prove it constant on Hecke orbits and stable under twisting by characters
factoring through `N_{K/F₀}`.

*Rests on:* 7.5, 8.1; Modular Forms Layer 7; GL₂ automorphic representations and transfer
R17.4.1 (the Satake rule, for the shape of `p_r`).

**Checks.**

- For h=1−3T+2T², h⁽²⁾=1−5T+4T²; the polynomial T²−5T/4+1/4 has the same roots but constant 1/4 and is rejected.
- For h=1−T² and r=2, roots 1 and −1 both map to 1, so h⁽²⁾=(1−T)².
  The multiplicity at 1 is 1+1=2, the degree remains 2 and h⁽²⁾(0)=1;
  A=diag(1,−1) gives the same result from A²=I.
- For h=1 the empty product gives h⁽ʳ⁾=1. For r=1 the result is h.
- For `h = 1 - sT + eT²` with e≠0, `h^{(2)} = 1 - (s² - 2e)T + e²T²`.
- `2.2.29.1-1.1-a` is a base change of `g ∈ S_2(Γ₀(29), χ_29)`: at the inert prime `(2)`,
  `L_2(g, T) = 1 - b(2)T + χ_29(2)·2T²` with `χ_29(2) = -1`, and the `r = 2` relation gives
  `c((2), f) = b(2)² + 4 = -1` (`b(2)² = -5`).
- `2.2.5.1-31.1-a` is not a base change: `c((3w - 2), f) = 4 ≠ -4 = c((3w - 1), f)` for the
  conjugate primes; the same test rejects Dembélé–Voight's form at `(w + 3)²`
  (`c((w - 5), f) = 4t ≠ -2 = c((w + 4), f)`).

### 9.5 Existence of base change

Prove, by citation through 6.4: for `K/F` cyclic of prime degree and a newform `f` over `F` of
any weight `k` (the base-changed weight `k'_{w'} := k_{w'|_F}` has all entries of one parity
because `k` does, so it is a `Weight K`), there is a newform `g` over `K` of weight `k'` with
IsBaseChangeOf g f, of level the conductor of the base-changed representation
([GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md)
R17.4.3, R17.4.5 for cuspidality — `g` exists as a cusp form unless `f` is a CM form by a
character of `K`, in which case the base change is Eisenstein); and for `K/F` solvable
(R17.4.8). Prove the classical corollaries: for `F/ℚ` abelian, every classical newform
`f : Newform N k` has a base change to `F` (a Hilbert newform or an Eisenstein series), and for
`F/ℚ` Galois the base change `g` satisfies `c(σ𝔭, g) = c(𝔭, g)` for all `σ ∈ Gal(F/ℚ)`, the
necessary condition the LMFDB's heuristic tests (`dq.mf.hilbert.reliability`). The converse
(descent) for `F/ℚ` cyclic: a newform `g` with `c(σ𝔭, g) = c(𝔭, g)` for all `σ` and all `𝔭` is a
base change (R17.4.4, supplied descent), stated as a theorem here with that citation.

*Rests on:* 6.4, 9.4; the cited R17.4 milestones.

### 9.6 The Doi–Naganuma lift

Let `F = ℚ(√D)` with `D` a prime, `D ≡ 1 (mod 4)` (so `d_F = D` and `𝔡 = (√D)`), with
`h_F = 1` (then `h⁺_F = 1` as well, the fundamental unit having norm `-1`, so forms of level
`𝒪_F` have a single component), let
`k ≥ 2` be even, and let `g = Σ b(n) qⁿ` be a newform in `S_k(Γ₀(D), χ_D)` with the quadratic
nebentypus `χ_D = (D/·)` (the Modular Forms roadmap's `Newform D k` with `dirichletLift = χ_D`).
Define the coefficient function of `f_g` as the multiplicative `IdealArithmeticFunction F`
determined by the level-one recurrence `c(𝔭^{r+1}) = c(𝔭) c(𝔭^r) - N𝔭^{k-1} c(𝔭^{r-1})` and the
prime values `c(𝔭, f_g) = c(𝔭', f_g) = b(p)` at a split `p = 𝔭𝔭'`,
`c((p), f_g) = b(p²) + p^(k-1) = b(p)² + 2p^(k-1)` at an inert `p`, and `c((√D), f_g) = b(D) + b̄(D)` at the ramified prime —
the coefficients of the Dirichlet series `L(g, s) L(g^ρ, s)` regrouped by ideals of `F`, `g^ρ`
the newform with conjugate coefficients (`g^ρ = g ⊗ χ_D` on good coefficients). Prove the
**Doi–Naganuma theorem**: there is a newform `f_g ∈ S_k(Γ_{𝒪_F})` of parallel weight `k`, level
`𝒪_F` and trivial central character with these coefficients, IsBaseChangeOf f_g g, and
`L(f_g, s) = L(g, s) · L(g^ρ, s)`. Prove the Fourier-coefficient formula away from the different:
for `ν ∈ (𝔡⁻¹)_+` with `(ν√D)` prime to `(√D)`, `a(ν) = Σ_{d ∈ ℕ, d ∣ ν√D} d^{k-1} b(D N(ν)/d²)`
(here `ν√D ∈ 𝒪_F`, `d ∣ ν√D` means `ν√D/d ∈ 𝒪_F`, and `D N(ν) = |N(ν√D)| ∈ ℕ`). The formula is
**not** asserted at `ν` with `(√D) ∣ ν√D`: at `ν = 1` it would give `b(D)`, which is never real
(`|b(D)|² = D^{k-1}` and `b(D) ∉ ℝ` for every newform of nebentypus `χ_D`), whereas a level-one
eigenform has `c((√D), f_g) = b(D) + b̄(D) = 2 Re b(D)` (its Euler factor at `(√D)` has degree `2`).
The proof route is Zagier's kernel pairing (Theorem 4, p.31), translated to
§3.4's conjugate-first convention. Write K_z for the classical cusp-space vector,
antiholomorphic in z, so that the linear lift is g↦⟨K_z,g⟩; its conjugate in
the integral is holomorphic in z. Fix the scalar by the coefficient formula and
c(𝒪_F,f_g)=1 for normalized eigenforms. Construct this kernel from Zagier's
Poincaré series, prove its transformation laws and the pairing formula; for k>2
prove absolute convergence, and at k=2 use the limiting construction in his
Appendix 1 with §4.2's analytic inputs. Record that
`g ↦ f_g` intertwines `T_p` with each of `T_𝔭` and `T_{𝔭'}` separately at split `p`, that `f_g = f_{g^ρ}`, and that
`f_g ≠ 0` (`c(𝒪_F, f_g) = 1`) (Zagier, §5, equations (95a)–(95c), p. 32,
Theorem 5, p. 33, and Appendix 1, p. 42).

*Rests on:* 2.3, 4.1, 4.2, 5.4, 7.4, 8.1, 9.4; Modular Forms Layers 4 and 7 (the newform `g`,
its nebentypus, its Euler factors and conjugate).

**Checks.**

- `F = ℚ(√29)`, `g ∈ S_2(Γ₀(29), χ_29)` with `t² = -5`: the lift is `2.2.29.1-1.1-a`, with
  `c((2)) = b(2)² + 4 = -1`, `c((3)) = b(3)² + 6 = 1`, `c(𝔭_5) = b(5) = -3`, `c(𝔭_7) = b(7) = 2`.
- At the ramified prime, `c((√29)) = b(29) + b̄(29) = -6`, not `b(29) = -3 + 2t`; the
  Fourier-coefficient formula at `ν = 1` would give the non-real `b(29)`.
- `c(𝒪_F, f_g) = 1`, so `f_g ≠ 0`, and `f_g = f_{g^ρ}`.

**Check on split Hecke operators.** In the D=29, p=5 example, each of T_𝔭 and T_𝔭′
has eigenvalue −3, matching b(5); their sum has eigenvalue −6 and is not the transported T₅.

### Examples

The discriminating examples are the Checks in §§9.1–9.6: twists, CM traces and split Hecke actions.

### Dependencies

Layers 2 and 4–8; the precise transfer and character contracts cited in each subsection.

## Layer 10: the Jacquet–Langlands dictionary

### 10.1 The `𝔇`-new subspace

For a squarefree `𝔇 ∣ 𝔫` define `S_k(𝔫; R)^{𝔇-new}` as the intersection over `𝔭 ∣ 𝔇` of the
orthogonal complements of the images of `ι` and `V_𝔭` from level `𝔫𝔭⁻¹` (7.1), and prove it is
Hecke-stable and spanned by the images, under the level-changing operators at the primes of
`𝔫𝔪⁻¹`, of the newforms of level `𝔪 ∣ 𝔫` with `v_𝔭(𝔪) = v_𝔭(𝔫)` for every `𝔭 ∣ 𝔇`; in
particular `S_k(𝔫; R)^{rad(𝔫)-new} = S_k(𝔫; R)^{new}`, and `S_k(𝔫; R)^{𝔇-new} ⊇ S_k(𝔫; R)^{new}`.

*Rests on:* 7.1–7.3.


The partial-new-space API uses orthogonal complements at the chosen primes.

- The subspace is Hecke-stable and contains the full new space.
- Its newform constituents have exactly the full level valuations at every prime of 𝔇.

**Checks.**

- For 𝔇=1 the intersection is empty and gives the whole cusp space.
- For 𝔇=rad(𝔫) the partial-new space equals the new space, retaining every level prime.
- At 𝔫=1 both old space and excluded-prime set are empty: old=0 and new=full.

### 10.2 The dictionary with totally definite quaternion algebras

Let `B` be a quaternion algebra over `F` ramified at every real place and at the primes of a
squarefree `𝔇 ‖ 𝔫` (`v_𝔭(𝔫) = 1` for `𝔭 ∣ 𝔇`, so that `𝔫𝔇⁻¹` is prime to `𝔇`), with `n + ω(𝔇)` even, and `𝒪_B` an Eichler order of level `𝔫𝔇⁻¹`
(Quaternionic modular forms §0.1). State and prove by citation the **Jacquet–Langlands
dictionary**: the space of quaternionic modular forms of weight `k` and level `𝒪̂_B^×`
(Quaternionic modular forms §2.1 with the algebraic weight and dual convention of its §1.3; in parallel weight `2`, functions
on the class set of §0.3), modulo the forms factoring through the reduced norm in parallel
weight `2`, is isomorphic as a module over the `T_𝔭`, `𝔭 ∤ 𝔫` (§3.1 there, 5.2 here) to
`S_k(𝔫; R)^{𝔇-new}`, compatibly with the central action and with `U_𝔭` at `𝔭 ∣ 𝔫𝔇⁻¹`, the
eigenvalue at 𝔭 ∣ 𝔇 on the ψ summand of the quaternionic side being
−λ_𝔭(f) N𝔭^(k₀/2−1), where λ_𝔭(f)²=ψ([𝔭]) (§7.7). For ψ=1 this is
−ε_𝔭(f) N𝔭^(k₀/2−1). Inputs:
[GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md)
R17.3.1, R17.3.3, R17.3.5 and R17.3.9, transported by 6.4 and by the supplier's quaternionic
dictionary. No such B exists when n+ω(𝔇) is odd. In every even degree,
𝔇=1 is permitted independently of whether the level is squarefull; in odd degree
a totally definite B must ramify at an odd number of finite places
(Dembélé–Voight, Theorem 3.9 and Example 6.3).

**Checks.**

- For n=2 and 𝔇=1, the ramification count is 2+0=2, so a totally definite algebra exists.
- In §7.7's cubic twist over ℚ(√229), take 𝔇=11𝒪_F. Since 229≡3² mod 11,
  there are two primes above 11, each of conductor exponent one; the ramification
  count is 2+2=4. At the prime with χ(𝔭)=ζ₃ the quaternionic eigenvalue is
  −(−ζ₃)·11⁰=ζ₃, and its central character is ζ₃². This also fixes the twist
  convention χ∘Nrd versus χ∘det in the supplier's R17.3.1.
- For n=3 and 𝔇=1, the count is 3+0=3, so it does not exist.
- For n=3 and 𝔇 a single prime, the count is 3+1=4; the parity obstruction disappears,
  while the exact-level condition still requires valuation one at that prime.

*Rests on:* 5.2, 6.4, 7.7, 10.1; Quaternionic modular forms §§0.1, 0.3, 1.3, 2.1, 3.1; the cited
R17.3 milestones.

### 10.3 Brandt matrices and traces

Define nothing new: for the Eichler order of 10.2, the Brandt matrices `B(𝔭)` are the matrices
of the Hecke operators of QuaternionicModularForms §3.1 on its §0.3 class-set basis,
using Mathlib `LinearMap.toMatrix`. Prove the **trace identity**
`Tr(T_𝔭 ∣ S_2(𝔫; R)^{𝔇-new}) = Tr(B(𝔭)) - Tr(T_𝔭 ∣ E_norm)`
where `E_norm` is the norm-factoring subspace. Its trace is
`(N𝔭 + 1) Σ_χ χ([𝔭])`, with multiplicities and the actual norm characters occurring
in parallel weight `2` for `𝔭 ∤ 𝔫`, and the characteristic-polynomial identity
`charpoly(T_𝔭 ∣ S_k(𝔫; R)^{𝔇-new}) = charpoly(B_k(𝔭))` on the cuspidal part in general, as
corollaries of 10.2. This is the statement that certifies the LMFDB's tables: the Hecke
eigenvalues it stores are the eigenvalues of Brandt matrices, and the identity is what a
certificate for a stored `hecke_eigenvalues` list checks against.

*Rests on:* 10.2.

**Checks on the trace subtraction.**

- In Dembélé–Voight, Example 8.1, p.44, at norm 4 the norm characters give 5 and −5; 0−(5−5)=0 is the cusp trace.
- At the principal norm-13 prime the Brandt trace is 36; 36−(14+14)=8=4+4.
- With only the trivial norm character, the formula specializes to Tr(B)−(q+1).

### Examples

The discriminating examples are the Checks in §10.3: norm-character trace subtraction.

### Dependencies

Layers 5–7; QuaternionicModularForms and the general Jacquet–Langlands contracts.

## Layer 11: the LMFDB invariants and the elliptic-curve interface

### 11.1 The invariants of a newform

For a newform `f` of level `𝔫`, weight `k`, central character `ψ`, define and prove the basic
API of the LMFDB's columns, each a function of `f` invariant under the transport of 2.3 and
constant on the Hecke orbit where the LMFDB displays it per orbit:

| Column or display | Definition here | Milestone |
| --- | --- | --- |
| `field_label` prefix `d.r.|D|` | `HasLMFDBIntrinsicLabel F n n |d_F|` | Number Field Arithmetic 8.1 (consumed) |
| `weight`, `hmf_forms.parallel_weight` | `k`; `k₀` when `IsParallel k` | 0.3 |
| `level_ideal`, `level_norm` | `𝔫`, `Ideal.absNorm 𝔫` | 1.2 |
| `level_label` prefix `N` | `Ideal.absNorm 𝔫`; the index `.i` is not a target | — |
| `level_bad_primes` | `{p : p ∣ Ideal.absNorm 𝔫}` | 1.2 |
| `field_bad_primes` | the ramified primes of `F` | Number Field Arithmetic 4.3 (consumed) |
| `hecke_eigenvalues` | `𝔭 ↦ c(𝔭, f) ∈ CoefficientField f` on `HeightOneSpectrum (𝓞 F)` | 7.4, 7.5 |
| `hecke_polynomial` | a defining polynomial of `CoefficientField f` — the field up to isomorphism is intrinsic; the chosen polynomial is not a target | 7.5 |
| `dimension` | `finrank ℚ (CoefficientField f)` = size of the Hecke orbit | 7.5 |
| `AL_eigenvalues` | `𝔭 ↦ ε_{𝔭^{v_𝔭(𝔫)}}(f)` for prime ideals `𝔭 ∣ 𝔫`, `ψ = 1` | 7.7 |
| `is_CM` | HasCM f | 9.2 |
| `is_base_change` | IsBaseChange f | 9.4 |
| newspace dimension | `finrank S_k(𝔫; R)^{new}` | 7.3 |
| central character | `ψ`, trivial when `h⁺_F = 1` | 5.2 |
| `L`-function | the card of 8.3 | 8.3 |
| Hecke orbit, orbit letter | `{f^σ}`; the letter is not a target | 7.5 |

Prove the consistency statements the pages rely on: `c(𝔭, f)` is an algebraic integer with
`|σ(c(𝔭, f))| ≤ 2 N𝔭^{(k₀ - 1)/2}` for every embedding `σ` **as an implication from the
Ramanujan–Petersson bound**, stated as a named hypothesis (its proof is the Galois-representation
owner's), and unconditionally `|c(𝔭, f)| ≤ C_f N𝔭^{k₀/2}` (3.3); `ε_𝔭(f) = -c(𝔭, f)` for `𝔭 ‖ 𝔫`
in parallel weight `2` (7.7); `dimension = 1` iff all `c(𝔭, f) ∈ ℚ` iff all `c(𝔭, f) ∈ ℤ`;
`is_CM = yes` implies `c(𝔭, f) = 0` for half the primes in the sense of Dirichlet density `1/2`
(9.2 and the Chebotarev density of inert primes, [Chebotarev](../Chebotarev/README.md));
`is_base_change = yes` from `ℚ` implies `c(σ𝔭, f) = c(𝔭, f)` for all `σ ∈ Aut(F)` (9.5).

*Rests on:* 1.2, 3.3, 5.2, 7.3–7.5, 7.7, 8.3, 9.2, 9.4, 9.5; Number Field Arithmetic 4.3, 8.1.

### 11.2 The intrinsic label prefix

Define HasLMFDBIntrinsicPrefix f (d r D N : ℕ) := HasLMFDBIntrinsicLabel F d r D ∧ Ideal.absNorm 𝔫 = N,
the invariants a label `d.r.D.i-N.j-x` is built from, and prove it is constant on Hecke orbits
and on Galois-conjugate levels (`σ𝔫` for `σ ∈ Aut(F)`, which the LMFDB stores as separate
forms with the same prefix). The indices `i`, `j`, the letter `x`, and the completeness of a
table are not defined here.

*Rests on:* 7.5, 11.1.

**Checks.**

- `2.2.5.1-31.1-a` has prefix `(d, r, D, N) = (2, 2, 5, 31)`, and so does its conjugate
  `2.2.5.1-31.2-a` at the level `(5w - 3)`.
- `2.2.24.1-1.1-a` has prefix `(2, 2, 24, 1)`.
- `(2, 2, 5, 81)` is rejected for `2.2.5.1-31.1-a`: its level norm is `31`.


The intrinsic-prefix API forgets database orderings.

- The prefix retains only degree, real-place count, discriminant and level norm.
- It is unchanged by coefficient conjugation and by a field automorphism applied to the level.

### 11.3 The elliptic-curve interface

For a function `a : HeightOneSpectrum (𝓞 F) → ℤ` and a newform `f` of level `𝔫`, define
IsAttachedTo f a: `f` has parallel weight `2`, trivial central character,
`CoefficientField f = ℚ`, and `c(𝔭, f) = a 𝔭` for all `𝔭 ∤ 𝔫`. Prove uniqueness of `f`
given `(a, 𝔫)` (strong multiplicity one, 6.4), that IsAttachedTo is invariant under the
transport of 2.3, and that it implies `L(f, s) = Σ a-generated Euler product` on good primes.
For an elliptic curve E/F, apply this comparison only with a modularity witness over F
identifying its rank-two representation with that of f and its exact conductor with 𝔫.
A potential-modularity witness over F′ instead yields attachment over F′; no descent to F
is inferred. For equality of the full cards require equality of every local reciprocal
polynomial, including multiplicative and additive primes, together with conductor and
archimedean factors. Then coefficient equality and analytic continuation give EqOffZero.
The precise curve-side contract is the completed H¹ L-function with good factor
1 − a_𝔭(E)T + N𝔭 T², multiplicative factor 1 − a_𝔭(E)T with a_𝔭(E)=±1, and
additive factor 1, and comparison with the local representation at every finite prime.
This contract and base-field modularity are inputs to the comparison, not consequences
of good-prime trace matching alone. The real-quadratic existence input is precisely:
for every real quadratic F and elliptic curve E/F, there exists a parallel-weight-two
newform of exact level 𝔫_E with matching rank-two compatible system. Potential modularity
alone does not supply this input (Freitas–Le Hung–Siksek, Theorem 1).

*Rests on:* 6.4, 7.4, 7.5, 8.3.

**Checks.**

- `2.2.5.1-31.1-a` is attached to `a_·(E)` for `E = 2.2.5.1-31.1-a1`: `a_𝔭(E) = c(𝔭, f)` at the
  listed good primes, e.g. `-3, -2, 2` at `(2), (2w - 1), (3)`.
- `2.2.29.1-1.1-a` is attached to Tate's curve `y² + xy + ε²y = x³`:
  `a_𝔭(E) = -1, 1, -3, -3, 2, 2, 17` at `(2), (3), 𝔭_5, 𝔭_5', 𝔭_7, 𝔭_7', (11)`.
- The conjugate form `2.2.5.1-31.2-a` is not attached to `a_·(E)` for `E = 2.2.5.1-31.1-a1`: the
  eigenvalues are permuted along `w ↦ 1 - w`, and `a_(3w - 2)(E) = 4` while the conjugate form has
  `-4` there.
- `2.2.40.1-1.1-a` is attached to no `a`: its coefficient field is quadratic, not `ℚ`.


The attachment API is conditional on the stated curve-side contracts.

- Good-prime trace matching at fixed conductor determines at most one normalized newform.
- Transport preserves attachment; equality of full cards uses all local polynomials and archimedean/conductor data.

### Examples

The discriminating examples are the Checks in §§11.1–11.3: label prefixes and elliptic attachment.

### Dependencies

Layers 6–9; the full curve-side contracts stated in §11.3.

## Explicit scope exclusions

- Closed dimension formulas for `S_k(Γ₀(𝔫)_𝔟)` (Shimizu's formula, the elliptic-point and
  cusp contributions), the cusp resolutions and the Euler number of `Γ\ℍ²`: the sibling
  `HilbertModularSurfaces` roadmap for `n = 2`; general `n` is not on any roadmap and is not
  claimed here.
- The Ramanujan–Petersson bound `|c(𝔭, f)| ≤ 2 N𝔭^{(k₀ - 1)/2}` and the Sato–Tate distribution:
  Galois-representation owners; used only as a named hypothesis in 11.1.
- Eisenstein series of odd parallel weight, of non-parallel weight (there are none), with
  character, or at level `𝔫 ≠ 𝒪_F` beyond the existence and dimension count of 4.3, and the
  Fourier coefficients of the individual `E_κ` when `h_F > 1` (class-restricted divisor sums)
  beyond their constant terms: not built.
- Weight one, partial weight one, and the Artin representations of weight-one forms.
- The Eichler–Shimura isomorphism with the cohomology of the Hilbert modular variety, Harder's
  decomposition, and all `H^n`: Hilbert modular varieties and Shimura curves.
- Hecke operators `T(𝔪, 𝔪')` beyond `T_𝔪` and `S_𝔪`, the full abstract Hecke algebra of
  `GL₂(F)`, and its structure theorem: the Modular Forms roadmap's Layer 2(a) at `n = 2` is cited
  for the ring; only its action is built.
- Nearly holomorphic forms, differential operators, Rankin–Selberg integrals, special values of
  `L(f, s)` and periods: not here.
- The LMFDB's `q_expansions` display field (present on a handful of forms): it is the finite
  truncation of 2.3 and needs no definition of its own.

## Worked examples (acceptance criteria)

The data below are the LMFDB's, verified independently where a computation is possible: the
`2.2.5.1` prime list and the eigenvalues of `2.2.5.1-31.1-a` were recomputed from the elliptic
curve `2.2.5.1-31.1-a1` by point counting, and the narrow class numbers, units and differents by
direct computation.

### The base field `2.2.5.1 = ℚ(√5)`

`𝒪_F = ℤ[w]`, `w = (1 + √5)/2`, `d_F = 5`, `𝔡 = (√5) = (2w - 1)`, `h_F = h⁺_F = 1` (the
fundamental unit `w` has norm `-1`, so every unit class has a totally positive representative,
`w²`). There is one component, `𝔟 = 𝒪_F`, `Γ_{𝒪_F} = GL₂⁺(𝒪_F)`, with one cusp (1.4), and
`M_k(𝔫; R)` has a single factor for every `R` (2.3). The parity lemma (2.3) gives
`M_k(Γ₀(𝔫)) = 0` for every odd parallel `k`, since `N(w) = -1`. The LMFDB's prime list begins
`(2)` of norm `4`, `(2w - 1) = (√5)` of norm `5`, `(3)` of norm `9`, `(3w - 2), (3w - 1)` of norm
`11`, `(4w - 3), (4w - 1)` of norm `19`, `(w + 5), (w - 6)` of norm `29`, `(5w - 2), (5w - 3)` of
norm `31`; the ordering of primes of equal norm is a database convention. Every milestone
of Layers 0–5 is exercised on this field with `𝔫 = (5w - 2)` of norm `31`; the double-coset
count of 5.1 at `𝔭 = (2)` is `N𝔭 + 1 = 5`, at `𝔭 = (5w - 2) ∣ 𝔫` it is `N𝔭 = 31`.

### `2.2.5.1-31.1-a`: the first Hilbert newform over `ℚ(√5)`

Parallel weight `2`, level `𝔫 = (5w - 2)`, norm `31`, `ψ = 1`, `dimension = 1`,
`CoefficientField = ℚ`, `is_CM = no`, `is_base_change = no`. `S_2(𝔫)` is one-dimensional (so
`newspace_dimension = 1`), and `S_2(𝔪) = 0` for every `𝔪` of norm `≤ 30` (Dembélé–Voight,
Example 6.3); 7.3 then says every eigenform of level `𝔫` is this newform. Its eigenvalues along
the prime list above are

`c(𝔭, f) = -3, -2, 2, 4, -4, -4, 4, -2, -2, -1, 8, -6, -6, 2, …`

at norms `4, 5, 9, 11, 11, 19, 19, 29, 29, 31, 31, 41, 41, 49`. They satisfy the Hecke bound
`|c(𝔭, f)| ≤ 2√(N𝔭)` of 11.1 (`|-3| ≤ 4` at norm `4`). At the bad prime `𝔭 = (5w - 2)`,
`c(𝔭, f) = -1`, so by 7.7 the Atkin–Lehner eigenvalue is `ε_𝔭(f) = -c(𝔭, f) = +1`, which is the
LMFDB's `AL_eigenvalues = [[(5w - 2), 1]]`; the sign of the functional equation (8.2) is
`ε(f) = (-1)^2 · ε_𝔭(f) = +1`, consistent with the rank `0` of the attached curve. The attached
curve (11.3) is `2.2.5.1-31.1-a1`, `y² + xy + wy = x³ + (1 + w)x² + wx`, of conductor `(5w - 2)`,
with nonsplit multiplicative reduction at `𝔭` (`a_𝔭(E) = -1 = c(𝔭, f)`), and `a_𝔭(E) = c(𝔭, f)`
at every listed good prime: this is the acceptance test for IsAttachedTo. Its Galois conjugate
level `(5w - 3) = (5 + 2w)` carries the conjugate form `2.2.5.1-31.2-a` with the same prefix
(11.2) and the eigenvalues permuted along `w ↦ 1 - w`; the curve
`A : y² + xy + wy = x³ - (1 + w)x²` of Dembélé–Voight Example 6.3, of conductor `(5 + 2w)`, is
attached to that conjugate. `is_base_change = no` is consistent with 9.5, since
`c((3w-2), f) = 4 ≠ -4 = c((3w-1), f)` while `(3w - 1) = σ((3w - 2))`.

### `2.2.5.1-81.1-a`: CM and base change together

Level `(9) = (3)²`, norm `81`, `dimension = 1`, `is_CM = yes`, `is_base_change = yes`. By 9.2
there is a nontrivial quadratic Hecke character `χ` of `ℚ(√5)` with `c(𝔭, f) = 0` at every `𝔭`
inert in the corresponding CM extension `K/F`; by 9.5 the form is Galois-invariant,
`c(σ𝔭, f) = c(𝔭, f)` for the two primes above every split rational prime. The level `(3)²` is
squarefull, so 7.6 with `ψ = 1` gives `c((3), f) = 0`, and the Atkin–Lehner sign `ε_{(9)}(f)` is
not recoverable from the single local coefficient `c((3), f) = 0`; the full normalized coefficient system determines it (7.7). The rejection test: a CM field for a
newform of level `𝔫` is a totally imaginary quadratic extension unramified at the finite primes
outside `𝔫` (9.3). For `2.2.5.1-31.1-a` the totally negative classes in `F^×/F^{×2}` supported on
`𝔫` are `-1` and `-(3w + 5) = -w(5w - 2)`, and both `F(√-1)` and `F(√(-(3w + 5)))` have relative
discriminant divisible by `(2)²` (`(2) ∤ 𝔫`), so no CM field exists and HasCM is rejected on the
ramification condition alone. The coefficient test rejects it as well: `(3w - 2)` is inert in
`F(√-1)` (`N𝔭 = 11 ≡ 3 (mod 4)`) and `(4w - 1)` in `F(√(-(3w + 5)))`, while `c((3w - 2), f) = 4`
and `c((4w - 1), f) = 4` are nonzero.

### Level one over `ℚ(√6)` and `ℚ(√10)`

`F = ℚ(√6)`, `2.2.24.1`: `h_F = 1`, `h⁺_F = 2` (the fundamental unit `5 + 2√6` has norm `+1`),
`𝔡 = (2√6)`. Forms of level `𝒪_F` are tuples of **two** components (2.3). The nontrivial narrow class is
`[(√6)]` (`N(√6) = -6 < 0` and every unit has norm `+1`), a principal class, so by the sign law of
5.2 it acts on `S_2(𝒪_F; R)` by `sgn(-6)^2 = +1`: the central action is trivial in weight `2`, the
`ψ = sgn` eigenspace is `0`, and `S_2(𝒪_F; R) = S_2(𝒪_F, 1; R)` (in odd parallel weight it is the
`ψ = sgn` space that survives). The knowl
`mf.hilbert.2.2.24.1-1.1-a.top` records that `2.2.24.1-1.1-a` is the first newform of level norm
`1` among real quadratic fields ordered by discriminant and corresponds to an isogeny class of
elliptic curves over `ℚ(√6)` with everywhere good reduction: IsAttachedTo f (a_·(E)) with
`level_norm = 1`, `is_CM = yes`, `is_base_change = yes`, `dimension = 1`, `AL_eigenvalues = []` (no exact prime-power divisor of `𝒪_F`), `ε(f) = (-1)^2 = 1`
by 8.2. `F = ℚ(√10)`, `2.2.40.1`: `h_F = h⁺_F = 2` (`3 + √10` has norm `-1`), two components and
two cusps per component (1.4), and `2.2.40.1-1.1-a` is the first level-one newform of
`dimension = 2`, `is_CM = no`, `is_base_change = yes` (knowl `mf.hilbert.2.2.40.1-1.1-a.top`),
attached to an abelian surface with
everywhere good reduction: `CoefficientField f` is a real quadratic field (7.5, totally real
since `ψ = 1`), the Hecke orbit has two elements, and the product of their cards (8.3) has
rational coefficients.

### `2.2.29.1-1.1-a`: the Doi–Naganuma lift at level one over `ℚ(√29)`

`F = ℚ(√29)`, `h_F = h⁺_F = 1`, fundamental unit `ε = (5 + √29)/2` of norm `-1`, `𝔡 = (√29)`.
`S_2(Γ₀(29), χ_{29})` is spanned by one Galois orbit `{g, g^ρ}` with Hecke field `ℚ(√-5)`:
`g = q + t q² - t q³ - 3q⁴ - 3q⁵ + 5q⁶ + 2q⁷ - t q⁸ - 2q⁹ - 3t q¹⁰ + t q¹¹ + 3t q¹² - q¹³ + …`,
`t² = -5`, with `b(29) = -3 + 2t` (so `|b(29)|² = 29` and `b(29) ∉ ℝ`). Its lift (9.6) is the unique
level-one newform `f = 2.2.29.1-1.1-a`, attached (11.3) to Tate's curve `y² + xy + ε² y = x³`
with everywhere good reduction: point counting gives `a_𝔭(E) = -1, 1, -3, -3, 2, 2, 17, -1, -1`
at `(2), (3), 𝔭_5, 𝔭_5', 𝔭_7, 𝔭_7', (11), 𝔭_{13}, 𝔭_{13}'`, matching `b(2)² + 4 = -1`,
`b(3)² + 6 = 1`, `b(5) = -3`, `b(7) = 2`, `b(11)² + 22 = 17`, `b(13) = -1`, and at the ramified
prime `a_{(√29)}(E) = -6 = b(29) + b̄(29)`, not `b(29)`. `is_base_change = yes`, `is_CM = no`,
`dimension = 1`, `ε(f) = (-1)^2 = 1`.

### Dembélé–Voight's square-level forms over `ℚ(√5)`

At `𝔫 = (w + 3)²`, norm `121`, Dembélé–Voight Example 6.6 gives a newform `f` with
`CoefficientField f = ℚ(√3)`, `dimension = 2`, `c((2), f) = t`, `c((w+2), f) = -t`,
`c((3), f) = -1`, `c((w+3), f) = 0`, `c((w-4), f) = -2t`, `c((w-5), f) = 4t`, `c((w+4), f) = -2`,
`t² = 3`. It exercises 7.5 (the orbit `{f, f^σ}`, `σ(t) = -t`), 7.6 (`c((w+3), f) = 0` at the
squarefull level with `ψ = 1`), 9.5 (`is_base_change = no`: `c((w-5), f) = 4t ≠ -2 = c((w+4), f)`
for conjugate primes) and 9.2 (HasCM is rejected: a CM field would be `F(√-1)` or `F(√(-(w + 3)))`, both of relative
discriminant divisible by `(2)² ∤ (w + 3)²`; and `(w - 4)` is inert in the first and `(3)` in the
second, while `c((w - 4), f) = -2t` and `c((3), f) = -1` are nonzero). At `𝔫 = (w + 4)²`, norm
`361`, Example 6.7 gives rational
newforms `f, g` with `c((2), f) = 2 = -c((2), g)`, `c((w+2), f) = -3 = c((w+2), g)`,
`c((3), f) = 1 = -c((3), g)`: `g = (f ⊗ χ)^{new}` for the quadratic character of
`F(√(w(w+4)))/F` (9.1); both are rejected by IsBaseChange (`c((w+5), f) = 3 ≠ -6 = c((w-6), f)`).

### Rejection tests

- A tuple `(f_𝔟)` with one component holomorphic and invariant but with a Fourier coefficient
  `a(μ) ≠ 0` at a nonzero `μ` that is not totally positive cannot exist (2.2); the function
  `z ↦ e(Tr(μz))` for `μ ∈ 𝔡⁻¹` with `σ_1(μ) > 0 > σ_2(μ)` is holomorphic and
  `𝒪_F`-periodic but is not invariant under `(ε 0; 0 1)`, and is rejected from `M_k`.
- The constant function `1` has a(0)=1, which is retained by Koecher. It lies in `M_0(Γ)` and in no `M_k(Γ)` with `k ≠ 0`; it is not a cusp
  form (2.6).
- Over `ℚ(√5)` the odd-weight spaces vanish (2.3); over `ℚ(√3)`, where no unit has norm `-1`,
  the parity lemma is silent and odd parallel weights are not excluded.
- A normalized good eigenform at level `𝔫𝔭` obtained from a newform `g` of level `𝔫` as
  `g + c · V_𝔭 g` is not a newform and not a `U_𝔭`-eigenvector in general (7.3's uniqueness is of
  the pair `(𝔪, g)`, not of `f`).
- The LMFDB's `is_base_change = yes` is a heuristic determination (its reliability knowl says
  so); IsBaseChange is the predicate, and a form with `c(σ𝔭, f) = c(𝔭, f)` for all tested `𝔭`
  is not thereby proved to satisfy it (9.5 gives the implication in the other direction, and the
  descent theorem only for cyclic `F/ℚ` with the equality at **all** primes).

## Downstream consumers

HilbertModularSurfaces uses the analytic forms and congruence groups; the elliptic-curve
comparison uses the full newform and L-function dictionary of Layers 7–11.

## Ordering

```text
Layer 0 ─→ Layer 1 ─→ Layer 2 ─→ Layer 3 ─→ Layer 4
                          │          │
                          └──→ Layer 5 ─→ Layer 6 ─→ Layer 7 ─→ Layer 8
                                                        │          │
                                                        ├──→ Layer 9 ──┘
                                                        └──→ Layer 10
                                          Layer 11 after Layers 7, 8, 9
```

Layers 0–2 are sequential; Layer 1 also uses KTheoryLowDegrees §5.4. Layer 3 (reduction theory) and Layer 4 (Eisenstein series, which
needs 3.1's counting and 3.4 for orthogonality) follow Layer 2; Layer 5 needs Layers 2 and 3
(3.4–3.5 for adjoints and diagonalization) and can proceed in parallel with Layer 4. Layer 6 needs
Layers 5 and the cited adelic suppliers. Layer 7 needs Layers 5–6; 7.5 additionally needs
Automorphic bundles. Layers 8, 9, 10 are independent of one another after Layer 7 (9.6 also uses
8.1; 10.2 uses 7.7). Layer 11 collects Layers 7–9.

## References

- S. Dasgupta and M. Kakde, *On Constant terms of Eisenstein Series*,
  arXiv:2010.00650v1, §4, equations (27)–(28), p. 15; Theorem 4.5 and its
  proof, equations (34)–(39), pp. 18–20. These are the character-indexed
  arbitrary-degree and arbitrary-level formulas used in the cusp-basis adapter
  of §4.2. [Open preprint](https://arxiv.org/abs/2010.00650v1).

- J. Voight, *Quaternion algebras*, author edition dated August 5, 2026,
  Definition 9.6.1, Lemmas 9.6.3–9.6.4, 9.6.7 and 9.6.9, pp. 143–144:
  the fractional-ideal index and its local determinant description.
  [Author copy](https://jvoight.github.io/quat-book.pdf).
- J. E. Cremona, *Hecke operators, Hecke eigensystems, and formal modular forms
  over number fields*, arXiv:2601.17524v1, §2, p. 3; §2.2, p. 4;
  §4.1, Definition 9, p. 12; §4.2.1, p. 13. These locators supply the
  algebraic congruence-group count and ideal-lattice Atkin–Lehner model;
  §§1.2 and 5.6 give the oriented-component adapters.

- J. H. Bruinier, *Hilbert modular forms and their applications*,
  arXiv:math/0609763v1, Proposition 1.25, p. 12; §1.4, Lemma 1.31 and
  Theorem 1.32, pp. 15–16; and Proposition 1.41,
  pp. 21–22. The latter is the parallel-weight, real-quadratic prototype;
  §3.3 supplies the explicit nonparallel, general-degree adapter.
- E. Assaf et al., *A database of basic numerical invariants of Hilbert modular
  surfaces*, arXiv:2301.10302v2, §2.1, (2.1.4)–(2.1.10), p. 3;
  §3.1, Lemma 3.1.8 and Corollaries 3.1.18,
  3.1.23, pp. 5–8. These locators use the preprint numbering and pagination.
- A. Raghuram and N. Tanabe, *Notes on the arithmetic of Hilbert modular forms*,
  author version dated June 20, 2011, §§4.1.1–4.1.5, pp. 26–29;
  §4.4.1 and Theorem 4.16, pp. 34–35.
  [Author copy](https://tildesites.bowdoin.edu/~ntanabe/hilbert_arithmetic.pdf).

- N. Freitas, B. V. Le Hung and S. Siksek, *Elliptic curves over real quadratic fields are modular*, arXiv:1310.7088v4, Theorem 1, p.2.

- E. Freitag, *Hilbert Modular Forms*, Springer, 1990. Chapter I: the Hilbert modular group,
  Siegel sets and reduction theory, Fourier expansions and Koecher's principle, Eisenstein
  series, finite dimensionality and the Hecke bound.
- G. van der Geer, *Hilbert Modular Surfaces*, Ergebnisse (3) 16, Springer, 1988. Chapter I
  (the Hilbert modular group and its cusps — the cusps of `SL₂(𝒪_F)` correspond to the class
  group; Eisenstein series and the weight-`2` holomorphy for `n ≥ 2`), Chapter VI (Hecke
  operators and the Doi–Naganuma lift).
- P. Garrett, *Holomorphic Hilbert Modular Forms*, Wadsworth & Brooks/Cole, 1990. Chapters 1–2
  for the classical theory in arbitrary class number and the lattice description of Hecke
  operators.
- G. Shimura, "The special values of the zeta functions associated with Hilbert modular forms",
  *Duke Math. J.* 45 (1978), 637–679, §2: the component description over the narrow class
  group, the normalized coefficients `c(𝔪, f)` for non-parallel weight, the Hecke operators
  `T(𝔪)` and `S(𝔪)`, the coefficient formula, and the rationality of the coefficient field; §4
  the functional equation. [DOI](https://doi.org/10.1215/S0012-7094-78-04529-5).
- G. Shimura, *Introduction to the Arithmetic Theory of Automorphic Functions*, Princeton,
  1971, Chapter 3 (Theorem 3.24 for the Hecke relations, §3.3 for `Γ₀`-type pairs).
- L. Dembélé and J. Voight, "Explicit methods for Hilbert modular forms", [arXiv:1010.5727v2](https://arxiv.org/abs/1010.5727v2).
  The locators here refer to this version of the preprint.
  §2 (Definition 2.1, (2.4)–(2.7): the parallel-weight-`2` definitions, the Fourier expansion
  over `(𝔡⁻¹)_+`, `T_𝔭` in the arithmetic normalization), §3 (Theorem 3.9,
  Eichler–Shimizu–Jacquet–Langlands), §6 (Examples 6.3, 6.4, 6.6, 6.7 used above), §7 (the
  arbitrary-class-number description, (7.10) the weight-`(k, m)` slash). This is the source the
  LMFDB's data documentation cites.
- K. Doi and H. Naganuma, "On the functional equation of certain Dirichlet series", *Invent.
  Math.* 9 (1969), 1–14; D. Zagier, "Modular forms associated to real quadratic fields", *Invent.
  Math.* 30 (1975), 1–46, §5, equations (95a)–(95c), Theorem 5 and Appendix 1 —
  the Doi–Naganuma lift and its kernel function (9.6);
  [author copy](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/BF01389846/ModFormsRQF.pdf).
- T. Miyake, *Modular Forms*, Springer, 1989, §§4.5–4.6: the `F = ℚ` newform theory whose shape
  Layer 7 follows, and the source of the Modular Forms roadmap's conventions.
- F. Diamond and J. Shurman, *A First Course in Modular Forms*, GTM 228, Springer, 2005,
  §§5.2–5.9 (Prop. 5.8.5 for the eigenform characterization of 7.4).
- The LMFDB knowls `mf.hilbert`, `mf.hilbert.q_expansion`, `mf.hilbert.eigenvalue`,
  `mf.hilbert.dimension`, `mf.hilbert.hecke_orbit`, `mf.hilbert.level_norm`,
  `mf.hilbert.weight_vector`, `mf.hilbert.label`, `mf.cm`, `mf.base_change`,
  `nf.narrow_class_group`, `dq.mf.hilbert.reliability`, `rcs.cande.mf.hilbert`, and the source
  files `lmfdb/hilbert_modular_forms/hilbert_modular_form.py`, `web_HMF.py`,
  `hmf_data_format_new.txt`.
