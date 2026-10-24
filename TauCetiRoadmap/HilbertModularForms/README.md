# Roadmap: Hilbert modular forms

Let `F` be a totally real number field of degree `n ≥ 2`. A Hilbert modular form is a holomorphic
function on the product `ℍ^Σ` of one upper half-plane per real place of `F`, transforming under a
congruence subgroup of `GL₂⁺(F)` by a weight vector `k ∈ ℤ^Σ`. The LMFDB's section
`ModularForm/GL2/TotallyReal` (`hmf`) holds Hilbert newforms of parallel weight `2` over totally
real fields of small degree, each given by its base field, its level ideal, its Hecke
eigenvalues at the prime ideals, its Atkin–Lehner eigenvalues, the degree of its Hecke field, and
two flags (complex multiplication, base change). The elliptic-curve section `ecnf` links a curve
over a totally real field to the Hilbert newform with the same `L`-function.

This roadmap builds the **classical analytic theory** that gives every one of those objects a
definition: the groups `Γ₀(𝔫)_𝔟` on each narrow-class component, the slash action, Fourier
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
`HilbertModularForm`. [`Suggested.lean`](Suggested.lean) states only what can be stated over
Mathlib and the pinned Tau Ceti: the domain, the group and the slash of Layer 0, the lattices,
the groups `Γ₀(𝔫)_𝔟` and the systems of representatives of Layer 1, the spaces `M_k(Γ)`,
`S_k(Γ)` and `M_k(𝔫; R)` with Fourier, constant-term and normalized ideal coefficients of
Layer 2, the finite-dimensionality theorems of Layer 3, the `L`-series of a tuple (8.1) and the
two local-factor polynomials of 9.4. Every other target — the Petersson product, the component
transport, the Hecke, central and Atkin–Lehner operators, old and new subspaces, newforms and
their invariants, completed `L`-functions, twists, CM, base change, the Doi–Naganuma lift and the
LMFDB interface — is specified, with its definition and Checks, in this README only. This
document is definitive.

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
  R16.4.3, the local newvector theory R16.2 and R16.6.2, global Jacquet–Langlands R17.3.1 with
  R17.3.3, R17.3.5, R17.3.9, base change R17.4 (R17.4.1, R17.4.3–R17.4.5, R17.4.8), and
  automorphic induction R17.5.1. All enter through the dictionary of Layer 6.
- From [Automorphic Galois representations](../AutomorphicGaloisRepresentations/README.md): the
  Galois representation of a Hilbert newform (its Layer 3, §3.10) and the characterization of CM
  by virtual reducibility (§§3.15–3.16). Layer 9 here defines CM by self-twist, as the LMFDB does,
  and cites that roadmap for the equivalence with the induced-representation description.
- From [Automorphic bundles](../AutomorphicBundles/README.md): the geometric Hilbert modular forms
  (B4.9 "geometric and analytic classical forms", B4.4 the `SlashAction` adapter), their rational
  structures and base change (B4.18), the Hilbert `q`-expansions (B5.16), the `q`-expansion
  principle (B5.17) and the cusp criterion (B5.18). Layer 7 here consumes them for the
  rationality of Fourier coefficients and the Galois action on newforms.
- From [Hilbert modular varieties and Shimura curves](../HilbertModularVarietiesAndShimuraCurves/README.md):
  the moduli-theoretic components and Hecke isogenies of its H3 (H3.6, H3.8), the component
  comparison H1.10 and the real-quadratic cusps H5.2. The components here are the classical
  groups `Γ₀(𝔫)_𝔟`; their identification with the polarization classes of H3 is cited, not rebuilt.
- From [Quaternionic modular forms](../QuaternionicModularForms/README.md): the spaces of forms on
  a totally definite quaternion algebra (its §2.1), their Hecke action (§3.1), the class sets and
  stabilizers (§0.3); and from the sibling `QuaternionArithmetic` roadmap the Brandt matrices of
  an Eichler order. Layer 10 states the dictionary against these objects.
- From [Adelic algebraic groups](../AdelicAlgebraicGroups/README.md): the `S`-arithmetic
  decomposition and the strong approximation theorem for the norm-one group `D¹` of a central
  simple algebra (its §4.2), applied to `D = M₂(F)`, where `D¹ = SL₂`. The finiteness of the
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
  forms and the sibling `QuaternionArithmetic` roadmap.
- **Modularity of elliptic curves** over totally real fields, and the conductor and local data
  of a curve over a number field: the modularity theorems are
  [Potential modularity and compatible systems](../PotentialModularityAndCompatibleSystems/README.md)';
  the curve-side invariants are the [Elliptic curves](../EllipticCurves/README.md) roadmap's and
  the sibling `EllipticCurvePeriodsAndModularParametrizations`'. Layer 11 states the matching
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

## Standing hypotheses

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

## Pinned conventions

| Subject | Convention |
| --- | --- |
| Domain | `ℍ^Σ := InfinitePlace F → ℍ`. No ordering of the places is chosen; `Fin n` never indexes anything. |
| Group | `GL₂⁺(F) := {γ ∈ GL (Fin 2) F : det γ ≫ 0}`, acting on `ℍ^Σ` by `(γ • z) w = σ_w(γ) • z w` through `Matrix.GeneralLinearGroup.map σ_w` and Mathlib's `UpperHalfPlane.glAction`. Because every `σ_w(γ)` has positive determinant, Mathlib's conjugation `σ` never fires and the action is the Möbius action. Matrices act on column vectors. |
| Weight | `k : Σ → ℤ` with all `k_w` of one parity (`Even (k_v - k_w)`). `k₀ := max_w k_w` and `m_w := (k₀ - k_w)/2 ∈ ℕ`. *Parallel weight* `k` means `k_w = k` for all `w`, so `m = 0`. The LMFDB's weight vector `[k_1, …, k_n]` is `k` read along its own ordering of the places. |
| Slash, arithmetic normalization | `(f ∣_k γ)(z) = ∏_w σ_w(det γ)^{k_w + m_w - 1} · j(σ_w γ, z_w)^{-k_w} · f(γ • z)`, with `j(g, τ) = UpperHalfPlane.denom g τ`. In parallel weight this is the product over `w` of the factors `|det|^{k-1} denom^{-k}` of Mathlib's `f ∣[k] g`, and for `F = ℚ` it is the arithmetic normalization of the Modular Forms roadmap. A scalar `a ∈ F^×` acts by `N(a)^{k₀ - 2}` (signed norm; `det(a·1) = a²` is totally positive for every `a`). |
| Unitary normalization | The LMFDB knowl `mf.hilbert` writes the transformation law with the factor `∏_w j(σ_w γ, z_w)^{k_w} σ_w(det γ)^{-k_w/2}`. The two slashes differ by `N(det γ)^{(k₀-2)/2}` (Layer 0.4), which is `1` whenever `det γ` is a totally positive **unit**; so on every group `Γ₀(𝔫)_𝔟` the two laws agree, and the difference is visible only in Hecke operators, where the arithmetic one is used. |
| Holomorphy | `IsHolomorphic f := DifferentiableOn ℂ (f ∘ (ofComplex ∘ ·)) {z : Σ → ℂ ∣ ∀ w, 0 < (z w).im}`, with Mathlib's `UpperHalfPlane.ofComplex` applied coordinatewise. Equality with the manifold notion on the product charted space is a theorem (0.2), not the definition. |
| Lattice of a component | `L_𝔟 := 𝒪_F ⊕ 𝔟 ⊂ F²` (column vectors). `Γ_𝔟 := Stab_{GL₂⁺(F)}(L_𝔟) = {(a b; c d) : a, d ∈ 𝒪_F, b ∈ 𝔟⁻¹, c ∈ 𝔟, det ∈ 𝒪_{F,+}^×}`, and `Γ₀(𝔫)_𝔟 := {γ ∈ Γ_𝔟 : c ∈ 𝔫𝔟}`. This is the knowl's `Γ₀(𝔑)_𝔟` verbatim (with `a, d ∈ 𝒪_F` made explicit). `𝒪_{F,+}^×` is Tau Ceti's `totallyPositiveIntegerUnits`. |
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
| Twist | `(f ⊗ χ)` for a finite-order Hecke character `χ` whose square is unramified at every finite place is the form with `c(𝔪, f ⊗ χ) = χ(𝔪) c(𝔪, f)` for `𝔪` prime to the conductor of `χ` (9.1), `χ(𝔪)` being `HeckeCharacter.idealCharacter`. For `χ²` ramified at a finite place the twist has no central character in the sense of 5.2 and is not a form of any level `𝔫'` here. |
| CM | `f` has CM when `f` and `f ⊗ χ` have the same good coefficients for some nontrivial finite-order `χ` — the knowl `mf.cm`. Such `χ` is quadratic and cuts out a totally imaginary quadratic extension (9.4). |
| Base change | `g` over `K` is a base change of `f` over `F ⊆ K` when `L_𝔮(g, T) = L_𝔭^{(r)}(f, T)` for all but finitely many primes `𝔮 ∣ 𝔭` of `K`, `r` the residue degree — the knowl `mf.base_change`. `f` *is a base change* when it is a base change of a newform over a proper subfield `F₀ ⊊ F`, the case `F₀ = ℚ` using the Modular Forms roadmap's `Newform`. |
| Sign of the functional equation | `Λ(f, s) = ε(f) Λ(f^ρ, k₀ - s)`, `f^ρ` the form with conjugate coefficients; for `ψ = 1`, `f^ρ = f`, and `ε(f) = (-1)^{n k₀/2} ∏_{𝔮 ‖ 𝔫} ε_𝔮(f)` with the sign `(-1)^{nk₀/2}` read as `i^{nk₀}`; in parallel weight `2`, `ε(f) = (-1)^n ∏ ε_𝔮(f)`. |

## What Mathlib supplies

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

## What Tau Ceti supplies

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
- `HeckeRing.GL2.Newform N k`, `Newform.dirichletLift`, `TauCeti.CoefficientField`,
  `Newform.satakeParameters`, and the classical Hecke-ring realization of
  `TauCeti.NumberTheory.HeckeRing.*`, whose double-coset formalism Layer 5 reuses.

## What is missing

Nothing about Hilbert modular forms exists in Mathlib or Tau Ceti: no product of upper
half-planes with a `GL₂⁺(F)`-action, no `Γ₀(𝔫)_𝔟`, no Fourier expansion over a fractional
ideal, no Koecher principle, no reduction theory for `GL₂` over a totally real field, no Hecke
operators between components, no Hilbert newforms, no Hilbert `L`-function, no twist, no CM or
base-change predicate, no Doi–Naganuma lift. The adelic, Galois-theoretic and geometric roadmaps
named above leave the classical function spaces, the Fourier-coefficient calculus and the
comparison between the two undefined; those are built here.

## The build, in layers

Each milestone states what is proved, under which hypotheses, and what it rests on. "Rests on"
names Mathlib, Tau Ceti at the pin, earlier milestones of this roadmap, or a cited milestone of
another roadmap; nothing rests on a milestone that follows it.

## Layer 0: the domain, the group, the slash action, holomorphy

### 0.1 The domain and the action

Define `ℍ^Σ := InfinitePlace F → ℍ` and `GL₂⁺(F)` as the subgroup of `GL (Fin 2) F` of matrices
with totally positive determinant. Define `toGLReal w : GL (Fin 2) F →* GL (Fin 2) ℝ` as
`Matrix.GeneralLinearGroup.map σ_w`, and the action `γ • z := fun w => toGLReal w γ • z w` of
`GL₂⁺(F)` on `ℍ^Σ`. Prove: it is a `MulAction`; `(γ • z) w` is the Möbius transform
`(a_w z_w + b_w)/(c_w z_w + d_w)` (from `UpperHalfPlane.coe_smul_of_det_pos`); the imaginary part
law `Im((γ • z) w) = σ_w(det γ) Im(z_w) / |j(σ_w γ, z_w)|²`; the kernel of the action is the
centre `F^× ∩ GL₂⁺(F)`; the action is continuous and holomorphic in `z`.

*Rests on:* Mathlib `UpperHalfPlane.glAction`, `im_smul_eq_div_normSq`, `IsTotallyPositive`.

### 0.2 Holomorphy on `ℍ^Σ`

Define `IsHolomorphic (f : ℍ^Σ → ℂ)` by the pinned convention. Prove: sums, products, scalar
multiples and compositions with `γ •` of holomorphic functions are holomorphic; a function of
the form `z ↦ e(Tr(μz))` is holomorphic; `IsHolomorphic f ↔ MDifferentiable 𝓘(ℂ, Σ → ℂ) 𝓘(ℂ) f`
for the product charted space `piChartedSpace` on `ℍ^Σ`; a locally uniform limit of holomorphic
functions is holomorphic (Weierstrass, from Mathlib's several-variable `DifferentiableOn` limit
theorems applied on the open set `{z ∣ ∀ w, 0 < Im z_w}`); and the Cauchy estimates on
polydiscs, which Layer 3 uses.

*Rests on:* Mathlib `UpperHalfPlane.ofComplex`, `mdifferentiable_iff`, `piChartedSpace`.

### 0.3 The weight-`k` slash

Define `Weight F` as `k : Σ → ℤ` with the parity field, `k₀`, `m`, and the predicate
`IsParallel`. Define `f ∣_k γ` by the pinned formula and prove the `SlashAction` laws for
`GL₂⁺(F)` acting on `ℍ^Σ → ℂ`: `f ∣_k 1 = f`, `(f ∣_k γ) ∣_k δ = f ∣_k (γδ)` (from
`denom_cocycle` at each place and multiplicativity of `det`), additivity, and
`f ∣_k (a·1) = N(a)^{k₀ - 2} f` for every `a ∈ F^×` (the signed norm; `a·1 ∈ GL₂⁺(F)` since `a² ≫ 0`). Prove that `f ∣_k γ` is holomorphic when
`f` is (0.2). In parallel weight prove `(f ∣_k γ)(z) = ∏_w (slash factor of `∣[k] (σ_w γ)` at z_w) · f(γ • z)`,
the comparison with Mathlib's one-variable slash.

*Rests on:* 0.1, 0.2, Mathlib `denom_cocycle`.

### 0.4 The unitary normalization

Define `f ∣_k^{u} γ` with the factor `∏_w σ_w(det γ)^{k_w/2} j^{-k_w}` (real powers of a positive
real) and prove `f ∣_k γ = N(det γ)^{(k₀ - 2)/2} · (f ∣_k^{u} γ)`. Deduce that the two agree on
every `γ` whose determinant is a totally positive unit, hence on every `Γ₀(𝔫)_𝔟`, and that
Mathlib's `∣[k]` for `GL (Fin 2) ℝ` matches the arithmetic one on the positive-determinant
subgroup. The unitary slash is used in no other milestone.

*Rests on:* 0.3; `NumberField.norm_pos_of_isTotallyPositive` (Tau Ceti) for the real power.

## Layer 1: lattices, the groups `Γ₀(𝔫)_𝔟`, and cusps

### 1.1 The lattices `L_𝔟` and their stabilizers

Define `L_𝔟 := {(x, y) ∈ F² : x ∈ 𝒪_F, y ∈ 𝔟}` as an `𝒪_F`-submodule of `Fin 2 → F`, prove it is
a full lattice (free of rank `2` over `ℤ`, spanning `F²` over `ℚ`), define
`Γ_𝔟 := {γ ∈ GL₂⁺(F) : γ L_𝔟 = L_𝔟}`, and prove the matrix description of the pinned
conventions: `γ ∈ Γ_𝔟 ↔ a, d ∈ 𝒪_F ∧ b ∈ 𝔟⁻¹ ∧ c ∈ 𝔟 ∧ det γ ∈ 𝒪_{F,+}^×`. Prove
`Γ_{𝒪_F} = GL₂⁺(𝒪_F)`, and that `Γ_𝔟 ∩ SL₂(F)` is Mathlib's `SL₂(𝒪_F)` conjugated when `𝔟` is
principal. Define the *generalized index* `[L : L']` of two full lattices in `F²` as a fractional
ideal (the product of the elementary-divisor ideals), prove `[L_𝔟 : γ L_𝔠] = (det γ) 𝔠 𝔟⁻¹`, and
`[L_𝔟 : L_𝔠] = 𝔠𝔟⁻¹` when `𝔠 ⊆ 𝔟`.

*Rests on:* Mathlib `FractionalIdeal`, `Module.Free`; Tau Ceti `totallyPositiveIntegerUnits`.

### 1.2 The congruence subgroups

Define `Γ₀(𝔫)_𝔟 := {γ ∈ Γ_𝔟 : c ∈ 𝔫𝔟}`, `Γ₁(𝔫)_𝔟 := {γ ∈ Γ₀(𝔫)_𝔟 : d - 1 ∈ 𝔫}`,
`Γ(𝔫)_𝔟 := {γ ∈ Γ₁(𝔫)_𝔟 : a - 1 ∈ 𝔫, b ∈ 𝔫𝔟⁻¹}`, and for each the determinant-one subgroup
`Γ_i¹(𝔫)_𝔟 := Γ_i(𝔫)_𝔟 ∩ SL₂(F)` (the LMFDB's `sl` ambient type; the sibling
`HilbertModularSurfaces` reads `Γ₀¹(𝔫)_𝔟` and `Γ(𝔫)_𝔟` from here). Prove: all are subgroups;
`Γ(𝔫)_𝔟 ⊴ Γ_𝔟` is the kernel of reduction modulo `𝔫` on `L_𝔟`; `det` maps `Γ₀(𝔫)_𝔟` and
`Γ₁(𝔫)_𝔟` onto `𝒪_{F,+}^×` and `Γ(𝔫)_𝔟` onto `{ε ∈ 𝒪_{F,+}^× : ε - 1 ∈ 𝔫}`, with kernels
`Γ_i¹(𝔫)_𝔟` and sections `ε ↦ diag(ε, 1)`; `[Γ_𝔟 : Γ₀(𝔫)_𝔟] = N(𝔫) ∏_{𝔭 ∣ 𝔫}(1 + N𝔭⁻¹)` (every element of `Γ_𝔟` is
`diag(ε, 1)` times an element of `SL(L_𝔟)`, and `diag(ε, 1) ∈ Γ₀(𝔫)_𝔟`, so the index is that of
the Borel in `SL₂(𝒪_F/𝔫)`, by the surjection `SL₂(𝒪_F) → SL₂(𝒪_F/𝔫)`);
`Γ₀(𝔫)_𝔟 ⊆ Γ₀(𝔪)_𝔟` for `𝔪 ∣ 𝔫`; `Γ₀(𝔫)_𝔟` contains the translations `(1 b; 0 1)`, `b ∈ 𝔟⁻¹`,
and the diagonal matrices `(ε 0; 0 1)`, `(ε 0; 0 ε)`, `ε ∈ 𝒪_{F,+}^×`; the image of `Γ₀(𝔫)_𝔟` in
`∏_w PGL₂(ℝ)` is discrete. For `F = ℚ` (excluded from the roadmap, but the sanity check is
stated) the definitions reduce to `Γ₀(N)`.

*Rests on:* 1.1; Mathlib `Matrix.SpecialLinearGroup`, `Ideal.absNorm`; the finiteness of
`𝒪_F/𝔫`.

### 1.3 Commensurability and conjugation

Prove that for `γ ∈ GL₂⁺(F)` the groups `Γ₀(𝔫)_𝔟` and `γ Γ₀(𝔫)_𝔠 γ⁻¹` are commensurable
(Mathlib's `Commensurable`), with `γ Γ_𝔠 γ⁻¹ = Γ_{γ 𝔠}` when `γ L_𝔠` is again of the form `L_{𝔟}`.
Prove the **component transport**: for `α ≫ 0`, `diag(1, α) Γ₀(𝔫)_𝔟 diag(1, α)⁻¹ = Γ₀(𝔫)_{α𝔟}`.
Prove that `L_𝔟 ≅ L_𝔠` as `𝒪_F`-modules iff `[𝔟] = [𝔠]` in `ClassGroup`, and that an isomorphism
of totally positive determinant exists iff `[𝔟] = [𝔠]` in `NarrowClassGroup F` (Steinitz class
with sign).

*Rests on:* 1.1, 1.2; Mathlib `Subgroup.Commensurable`; Tau Ceti `NarrowClassGroup.mk0_eq_mk0_iff`.

### 1.4 Cusps

The boundary is `ℙ¹(F)`, acted on by `GL₂⁺(F)`. Define the cusp set `Cusps Γ := Γ \ ℙ¹(F)` for
`Γ = Γ₀(𝔫)_𝔟`. Prove: the map `(a : c) ↦ [a𝒪_F + c𝔟⁻¹] ∈ ClassGroup (𝓞 F)` is constant on
`Γ_𝔟`-orbits and induces a bijection `Cusps Γ_𝔟 ≃ ClassGroup (𝓞 F)`, so `Γ_𝔟` has `h_F` cusps;
`Cusps Γ₀(𝔫)_𝔟` is finite, of cardinality at most `h_F · [PΓ_𝔟 : PΓ₀(𝔫)_𝔟]`; the stabilizer
`Γ_κ` of a cusp `κ` is conjugate in `GL₂⁺(F)` to a group of upper triangular matrices
`(ε b; 0 ε')` whose translation part `Λ_κ := {b : (1 b; 0 1) ∈ γ⁻¹Γγ}` is a full lattice in `F` and
whose unit part `U_κ := {ε/ε'}` is a finite-index subgroup of `𝒪_{F,+}^×`. Prove the squarefree
count: for squarefree `𝔫`, `#Cusps Γ₀(𝔫)_𝔟 = h_F · 2^{ω(𝔫)}`, through the parametrization of
cusps by pairs `(𝔞, [·])` with `𝔞 ∣ 𝔫` and a class. The analogous count with the unit quotient
`(𝒪_F/(𝔞 + 𝔫𝔞⁻¹))^×/𝒪_{F,+}^×` for non-squarefree `𝔫` is a milestone of the same shape and is
stated with that quotient explicit.

*Rests on:* 1.1–1.3; Mathlib `ClassGroup`; Tau Ceti `finiteIndex_totallyPositiveUnits`.

### 1.5 Systems of representatives

Define `NarrowRepresentatives F` (a section `rep` of `NarrowClassGroup.mk` on invertible
fractional ideals, `NarrowClassGroup.mk (rep c) = c`). Prove existence (`mk_surjective`), and
that for two systems `R, R'` and every class `c` there is `α_c ≫ 0` with `rep'(c) = α_c · rep(c)`,
unique up to `𝒪_{F,+}^×`; so by 1.3, `diag(1, α_c) Γ₀(𝔫)_{rep c} diag(1, α_c)⁻¹ = Γ₀(𝔫)_{rep' c}`.
The LMFDB's choice of the ideal `𝔟` for each component is a choice of `R` and carries no
mathematics; the induced isomorphism of the spaces of forms is 2.3.

*Rests on:* 1.3; Tau Ceti `NarrowClassGroup.mk_surjective`, `mk0_eq_mk0_iff`.

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

*Rests on:* 0.2; Mathlib Fourier series on tori (`fourierCoeff`, `hasSum_fourier_series_L2`) on
the `n`-torus `F_ℝ/Λ`, and `differentIdeal`.

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

For a subgroup `Γ ≤ GL₂⁺(F)` commensurable with some `Γ_𝔟`, define `M_k(Γ)` as the
`Submodule ℂ (ℍ^Σ → ℂ)` of holomorphic `f : ℍ^Σ → ℂ` with `f ∣_k γ = f` for all `γ ∈ Γ` — **no
cusp condition** — with multiplication `M_k(Γ) × M_{k'}(Γ) → M_{k + k'}(Γ)` for weights of
compatible parity, and the restriction maps `M_k(Γ) → M_k(Γ')` for `Γ' ≤ Γ`. Prove the **parity lemma**: if `k₀` is odd and `𝒪_F` has a
unit of norm `-1`, then `M_k(Γ₀(𝔫)_𝔟) = 0` (slash by `(u 0; 0 u)`, which acts by `N(u)^{k₀-2}`);
more generally `M_k(Γ) = 0` whenever `Γ` contains a scalar `u·1` with `N(u)^{k₀} = -1`.
Define `M_k(𝔫; R) := ∏_{c} M_k(Γ₀(𝔫)_{rep c})`. Prove the **component transport**: for two
systems `R, R'` with the `α_c` of 1.5, `f ↦ (f_c ∣_k diag(1, α_c)⁻¹)_c` is a linear isomorphism
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

### 2.4 Normalized coefficients

Define `c(𝔪, f)` by the pinned convention and prove it independent of the generator `μ`: for
`μ' = εμ`, `a(εμ) ∏ (εμ)_w^{m_w} = ∏ ε_w^{k_w + 2m_w - 1} a(μ) ∏ μ_w^{m_w} = N(ε)^{k₀ - 1} a(μ) ∏ μ_w^{m_w}`
and `N(ε) = 1`. Prove that `c(·, f)` determines `f` (injectivity of `f ↦ c(·, f)` on `M_k(𝔫; R)`,
from the uniqueness in 2.1 and the fact that every `μ ∈ (𝔟𝔡⁻¹)_+` generates an integral ideal in
the class of `𝔟⁻¹𝔡`), that it is invariant under the transport of 2.3, and that in parallel
weight `c(𝔪, f) = a_𝔟(μ)`. Package `c(·, f)` as `TauCeti.IdealArithmeticFunction F` and prove
linearity in `f`. Define the constant terms `a_0(f_𝔟)`.

*Rests on:* 2.3; Tau Ceti `IdealArithmeticFunction`, `zeroExtend`.

### 2.5 Constant terms at every cusp

For `f ∈ M_k(Γ)` and `γ ∈ GL₂⁺(F)`, prove that `f ∣_k γ ∈ M_k(γ⁻¹Γγ)` and that `γ⁻¹Γγ` again
contains a full translation lattice and a finite-index unit group, so `f ∣_k γ` has an expansion
and a constant term `a_0(f ∣_k γ)` (2.1–2.2). Prove that `a_0(f ∣_k γ)` depends only on the cusp
`γ • ∞ ∈ Cusps Γ` up to a nonzero scalar (`a_0(f ∣_k γδ) = ∏ σ_w(det δ)^{k_w + m_w - 1} a_0(f ∣_k γ)`
for `δ` in the cusp stabilizer), hence that the vanishing of `a_0(f ∣_k γ)` is a property of the
cusp. Prove **cuspidality in non-parallel weight**: if `k` is not parallel, then every constant
term vanishes (the unit law of 2.3 at `μ = 0` reads `a_0 = ∏_w ε_w^{-m_w} a_0` for `ε ∈ U_κ`, and
`∏_w ε_w^{m_w} ≠ 1` for some `ε` when the `m_w` are not all equal, by Dirichlet's unit theorem).

*Rests on:* 1.4, 2.1–2.4; Mathlib `NumberField.Units.rank`.

### 2.6 Cusp forms

Define `S_k(Γ) := {f ∈ M_k(Γ) : ∀ γ ∈ GL₂⁺(F), a_0(f ∣_k γ) = 0}` and prove it equals the
kernel of the finite family of constant-term maps indexed by `Cusps Γ` (2.5). Prove that
`S_k(Γ)` is stable under `f ↦ f ∣_k γ` for `γ ∈ GL₂⁺(F)` (as a map `S_k(Γ) → S_k(γ⁻¹Γγ)`), under
the restriction maps, and that `M_k(Γ) · S_{k'}(Γ) ⊆ S_{k+k'}(Γ)`. Prove the **decay at cusps**:
for `f ∈ S_k(Γ)` and every `γ`, `(f ∣_k γ)(z) → 0` as `min_w Im z_w → ∞`, uniformly in `Re z`,
with the rate `O(e^{-c · min_w Im z_w})`. In Suggested.lean the condition `a_0(f ∣_k γ) = 0` is
written as convergence to `0` of the box means of 2.1 together with integrability of `f ∣_k γ` on
every box, which every holomorphic `f` satisfies; this keeps `S_k(Γ)` visibly a submodule.

*Rests on:* 2.2, 2.5.

## Layer 3: reduction theory and finite dimensionality

### 3.1 Siegel sets

Define, for a cusp `κ` of `Γ` with the data `(Λ_κ, U_κ)` of 1.4 transported to `∞`, the Siegel
set `𝔖_κ(C, t) := γ_κ · {z : Re z ∈ C, Im z ∈ 𝒞_t}` where `C ⊂ F_ℝ` is a compact fundamental
parallelotope for `Λ_κ` and `𝒞_t ⊂ (ℝ_{>0})^Σ` is the set of `y` with `N(y) ≥ t` lying in a
fixed closed fundamental cone for the action of `U_κ` by `y ↦ ε y` (Mathlib's
`NumberField.mixedEmbedding.fundamentalCone` restricted to the positive orthant and to the
finite-index subgroup `U_κ`). Prove the **reduction theorem**: there is `t > 0` such that
`ℍ^Σ = Γ · ⋃_{κ ∈ Cusps Γ} 𝔖_κ(C_κ, t)` — every orbit meets one of finitely many Siegel sets
(Freitag, Ch. I §2; the classical proof through the minimum of `N(Im(γ•z))⁻¹ = N(|j(γ,z)|²)/N(Im z)`
over `Γ`, whose existence is the finiteness of lattice points in a compact set). Prove the
**Siegel-set finiteness**: `{γ ∈ Γ : γ 𝔖_κ ∩ 𝔖_{κ'} ≠ ∅}` is finite, and the **height
bound**: on `𝔖_κ(C, t)` every `z` has `min_w Im z_w ≥ c(t) > 0`.

*Rests on:* 1.4; Mathlib `NumberField.mixedEmbedding.fundamentalCone`, `NumberField.Units`;
the Minkowski lattice-point finiteness of
[Global Number Fields](../GlobalNumberFields/README.md) Layer 3A for the counting input.

### 3.2 The invariant measure and finite covolume

Define the measure `dμ := ∏_w dx_w dy_w / y_w²` on `ℍ^Σ` and prove its `GL₂⁺(F)`-invariance
(from `im_smul_eq_div_normSq` and the one-variable Jacobian at each place). Prove that each
Siegel set has finite measure
(`∫_{𝒞_t} N(y)^{-2} dy < ∞` by the substitution `y = s · u` with `N(u) = 1`, which turns it into
`vol(𝒞_1 ∩ {N = 1}) ∫_t^∞ s^{n-2} ds/s^{n}`), hence that `Γ \ ℍ^Σ` has finite volume, and that a
fundamental domain exists as a measurable set `𝔉_Γ` contained in the union of the Siegel sets.

*Rests on:* 3.1; Mathlib `MeasureTheory` (Haar measure on `ℝ^Σ`, change of variables).

### 3.3 The Hecke bound

For `f ∈ S_k(Γ)`, define `φ_f(z) := |f(z)| ∏_w (Im z_w)^{k_w/2}` and prove it is
`Γ`-invariant (0.3, 0.4: `|f| ∏_w y_w^{k_w/2}` is invariant under the unitary slash, and on `Γ`
the two normalizations agree; the exponent is `k_w/2`, not `k_w/2 + m_w`, since `∏_w ε_w^{m_w} ≠ 1`
for units `ε` in non-parallel weight), tends to `0` at every cusp (2.6), and is therefore bounded on
`ℍ^Σ` with a maximum attained in `⋃_κ 𝔖_κ ∩ {φ_f ≥ sup/2}`, a compact set that varies with `f`.
Deduce the **Hecke bound** `|c(𝔪, f)| ≤ C_f · N𝔪^{k₀/2}` for cusp forms (2.1's coefficient
integral at `y_w = 1/σ_w(μ)` gives `|a(μ)| ≤ C ∏_w σ_w(μ)^{k_w/2}`, and the factor `∏_w σ_w(μ)^{m_w}`
of the normalized coefficient turns this into `C N(μ)^{k₀/2}`), and for all `f ∈ M_k(Γ)` in
parallel weight `k` (non-parallel weights are cuspidal by 2.5) the bound `|c(𝔪, f)| ≤ C_f · N𝔪^{k}`
from the boundedness of `|f| N(y)^{k}` on Siegel sets (2.2). For `F = ℚ` the first is
Mathlib's `O(n^{k/2})`.

*Rests on:* 2.6, 3.1, 0.4.

### 3.4 The Petersson inner product

Define `⟨f, g⟩ := ∫_{𝔉_Γ} f(z) conj(g(z)) ∏_w (Im z_w)^{k_w} dμ(z)` (the integrand is `Γ`-invariant
by 3.3; the exponent `k_w`, not `k₀`, is forced in non-parallel weight) for `f, g ∈ M_k(Γ)`
with at least one a cusp form, prove absolute convergence (3.2, 3.3), independence of the
fundamental domain, Hermitian positivity on `S_k(Γ)`, and the normalization-free invariance
`⟨f ∣_k γ, g ∣_k γ⟩_{γ⁻¹Γγ} = N(det γ)^{k₀ - 2} ⟨f, g⟩_Γ`. Prove that `⟨·,·⟩` on `S_k(Γ)` is the
restriction of the `L²` inner product of `L²(𝔉_Γ, ∏ y_w^{k_w} dμ)` and that the inclusion
`S_k(Γ) → L²` is continuous for the sup-norm of `φ_f`.

*Rests on:* 3.2, 3.3.

**Checks.**

- `⟨f, f⟩ > 0` for the newform `2.2.5.1-31.1-a`, which spans `S_2((5w - 2))` over `ℚ(√5)`, and
  `⟨f, g⟩` is the complex conjugate of `⟨g, f⟩`.
- At a scalar `γ = a·1`, `a ∈ F^×`, both sides of the invariance law are
  `N(a)^(2(k₀ - 2)) ⟨f, g⟩`, since `f ∣_k (a·1) = N(a)^(k₀ - 2) f` and `det(a·1) = a²`.
- The weight factor is `∏_w (Im z_w)^(k_w)`: with `N(Im z)^(k₀)` in its place the integrand is not
  `Γ`-invariant in non-parallel weight, and a formalisation must not accept that variant.

### 3.5 Finite dimensionality

Prove `FiniteDimensional ℂ (S_k(Γ))`: point evaluations `f ↦ f(z)` are bounded on the unit ball
of `(S_k(Γ), ⟨·,·⟩)` (mean-value inequality on a polydisc around `z`, 0.2), so the unit ball is a
normal family, every sequence in it has a locally uniformly convergent subsequence whose limit
is again in `S_k(Γ)` (0.2 and dominated convergence for the cusp decay of 2.6), and the unit
ball is compact in the `L²` topology; a Hilbert space with compact unit ball is finite
dimensional (Mathlib `FiniteDimensional.of_isCompact_closedBall₀`). Then prove
`FiniteDimensional ℂ (M_k(Γ))` from the exact sequence
`0 → S_k(Γ) → M_k(Γ) → ℂ^{Cusps Γ}` of constant-term maps (2.5), and the bound
`finrank M_k(Γ) ≤ finrank S_k(Γ) + #Cusps Γ`. Deduce `FiniteDimensional ℂ (M_k(𝔫; R))`, and that for `k₀ ≤ 0` the only forms are the
constants in weight `0` (maximum principle for `|f|` on the finite-volume quotient, using the
boundedness of 2.2).

*Rests on:* 0.2, 2.5, 3.4; Mathlib `FiniteDimensional.of_isCompact_closedBall₀`, Montel-type
compactness (`TendstoLocallyUniformly` on open sets of `ℂ^Σ`).

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

### 4.2 Weight `2` by Hecke's trick

For `k = 2` define `E_κ(z, s) := Σ_δ (1 ∣_2 γ_κ⁻¹δ)(z) · N(Im(γ_κ⁻¹δ • z))^{s}` for `Re s > 0`,
prove convergence, the functional equation in `s` of its constant term, and the limit
`E_κ(z) := lim_{s → 0⁺} E_κ(z, s)`. Prove that the limit is **holomorphic** because `n ≥ 2`: the
non-holomorphic part of the constant term is a product of `n` factors each carrying `1/Γ(s)`,
against a single simple pole of `ζ_F(1 + 2s)`, so it is `O(s^{n-1}) → 0`. (For `F = ℚ` this term
is `-3/(πy)`; its vanishing is what distinguishes the Hilbert case.) Prove `E_κ ∈ M_2(Γ)` with
`a_0(E_κ ∣_2 γ_{κ'}) = δ_{κκ'}`.

*Rests on:* 4.1; Mathlib `dedekindZeta` and its pole (`NumberField.dedekindZeta_residue`),
`Complex.Gamma`.

### 4.3 The decomposition `M_k = S_k ⊕ E_k`

For even parallel `k ≥ 2` define `E_k(Γ) := span {E_κ : κ ∈ Cusps Γ}` and prove
`M_k(Γ) = S_k(Γ) ⊕ E_k(Γ)` with `finrank E_k(Γ) = #Cusps Γ` (the constant-term matrix is the
identity), that the sum is orthogonal for the Petersson product whenever it converges, and
`finrank M_k(Γ₀(𝔫)_𝔟) = finrank S_k(Γ₀(𝔫)_𝔟) + #Cusps Γ₀(𝔫)_𝔟`. Deduce the sharper bound
`|c(𝔪, f)| ≤ C_f · N𝔪^{k - 1}` for every `f ∈ M_k(Γ)` from 3.3 on the cuspidal part and the
divisor-sum coefficients of the Eisenstein part (for `F = ℚ`, Mathlib's `O(n^k)`). For
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

## Layer 5: Hecke operators

### 5.1 Double-coset operators between components

For fractional ideals `𝔟, 𝔠`, a nonzero integral ideal `𝔪`, and the level `𝔫`, define
`Δ_𝔫(𝔠 ← 𝔟; 𝔪) := {α ∈ GL₂⁺(F) : α L_𝔟 ⊆ L_𝔠, [L_𝔠 : α L_𝔟] = 𝔪, α_{21} ∈ 𝔫𝔠}` — the matrices
`(a b; c d)` with `a ∈ 𝒪_F`, `b ∈ 𝔟⁻¹`, `c ∈ 𝔫𝔠`, `d ∈ 𝔠𝔟⁻¹`, `(det α) 𝔟 𝔠⁻¹ = 𝔪` (1.1). Prove:
it is nonempty iff `[𝔟] = [𝔪𝔠]` in `NarrowClassGroup F`; it is stable under `Γ₀(𝔫)_𝔠` on the
left and `Γ₀(𝔫)_𝔟` on the right; the left quotient `Γ₀(𝔫)_𝔠 \ Δ_𝔫(𝔠 ← 𝔟; 𝔪)` is finite, of
cardinality `Σ_{𝔞 ∣ 𝔪} N𝔞` for `𝔪` prime to `𝔫` and `N𝔪` for `𝔪` supported on `𝔫`
(the count of sublattices `L' ⊆ L_𝔠` with `L_𝔠/L' ≅ 𝒪_F/𝔪`-cyclic-type of the right class,
respecting the Borel condition); and explicit representatives for `𝔪 = 𝔭` prime:
`N𝔭 + 1` of them when `𝔭 ∤ 𝔫`, `N𝔭` when `𝔭 ∣ 𝔫`, of the shape `(π_𝔭 a; 0 1)`-like matrices
once a totally positive generator of the principal ideal `𝔭 𝔠 𝔟⁻¹` is fixed. For
`f ∈ M_k(Γ₀(𝔫)_𝔠)` define `f ∣ [Δ] := Σ_{α ∈ Γ₀(𝔫)_𝔠 \ Δ} f ∣_k α` and prove it lies in
`M_k(Γ₀(𝔫)_𝔟)`, is independent of the representatives, preserves cusp forms (2.6), and is
compatible with the transport of 2.3. This is the `GL₂(F)` instance of the double-coset
formalism of the [Modular Forms](../ModularForms/README.md) roadmap's Layer 2(a); the abstract
Hecke ring of Mathlib's `HeckeRing/Defs.lean` is consumed for the pair `(Γ₀(𝔫)_𝔟, Δ_𝔫(𝔟 ← 𝔟; ·))`
when `𝔟 = 𝔠`, and the general `(𝔠, 𝔟)` operators are the bimodule version, defined directly.

*Rests on:* 0.3, 1.1–1.3, 2.3, 2.6; Mathlib `HeckeRing/Defs.lean`.

### 5.2 `T_𝔪`, `S_𝔪`, and the central action

On `M_k(𝔫; R)` define `(T_𝔪 f)_c := f_{c[𝔪]⁻¹} ∣ [Δ_𝔫(rep(c[𝔪]⁻¹) ← rep(c); 𝔪)]`, and
`(S_𝔪 f)_c := f_{c[𝔪]⁻²} ∣ [Δ'_𝔫(rep(c[𝔪]⁻²) ← rep(c); 𝔪)]` with
`Δ' := {α ∈ Δ_𝔫(· ← ·; 𝔪²) : α L_𝔟 = 𝔪 L_𝔠}` (a single left coset). Prove: `T_𝔪` and `S_𝔪` are
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

### 5.5 Petersson adjoints and simultaneous diagonalization

Equip `S_k(𝔫; R)` with `⟨f, g⟩ := Σ_c ⟨f_c, g_c⟩_{Γ₀(𝔫)_{rep c}}`, the sum over the components of
the products of 3.4. Prove that for `𝔪` prime to `𝔫` the Petersson adjoint of `T_𝔪` is
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
that `|λ_𝔪| ≤ C N𝔪^{k₀/2}` for an eigenvector normalized by `c(𝒪_F, f) = 1` (3.3).

*Rests on:* 3.4, 3.5, 5.3, 5.4.

### 5.6 The Fricke and Atkin–Lehner matrices

For `𝔮 ‖ 𝔫` (`𝔮 = 𝔭^{v_𝔭(𝔫)}`, exact divisor, `𝔮 + 𝔫𝔮⁻¹ = 𝒪_F`) define the Atkin–Lehner
operator `W_𝔮 : M_k(𝔫; R) → M_k(𝔫; R)` by the double coset of matrices
`α = (a b; c d) ∈ GL₂⁺(F)` with `a, d ∈ 𝔮`, `b ∈ 𝔟⁻¹`-type, `c ∈ 𝔫𝔟`-type conditions and
`(det α) = 𝔮 · (class shift)` — the matrices normalizing `Γ₀(𝔫)` that are "`𝔮`-primitive" —
mapping the component `c` to `c[𝔮]⁻¹`, normalized by `N𝔮^{-(k₀ - 2)/2}` so that `W_𝔮² = ⟨[𝔮]⟩`
and `W_𝔮` is an involution on `M_k(𝔫, 1; R)`. Prove: `W_𝔮` is well defined up to the central
action, commutes with the central action (the double coset of a scalar matrix commutes with every
double coset) and so **preserves** each `M_k(𝔫, ψ; R)`, preserves cusp forms, commutes exactly with
`T_𝔪` for `𝔪 + 𝔮 = 𝒪_F` (including `U_𝔭` for `𝔭 ∣ 𝔫𝔮⁻¹`), satisfies `W_𝔮 U_𝔭 W_𝔮⁻¹ = S_𝔭 U_𝔭^{*}`
(`U_𝔭^{*}` the Petersson adjoint, 5.5; on `M_k(𝔫, ψ; R)` the factor is `ψ([𝔭]) N𝔭^{k₀ - 2}`) for
`𝔭 ∣ 𝔮`, and `W_𝔮 W_𝔮' = W_{𝔮𝔮'}` up to the central action for coprime exact divisors; `W_𝔫` is the
**Fricke operator**. There is no nebentypus here, so `W_𝔮` does not invert `ψ`: the classical
`S_k(N, χ) → S_k(N, χ̄)` has no analogue.

*Rests on:* 5.1, 5.2, 5.5.

**Checks.**

- Over `ℚ(√5)` at `𝔫 = (5w - 2)`, `W_𝔫` acts on `S_2(𝔫)` by `+1`, the LMFDB's
  `AL_eigenvalues = [[(5w - 2), 1]]` for `2.2.5.1-31.1-a`.
- When `h⁺_F = 1`, `W_𝔮² = ⟨[𝔮]⟩` is the identity, so `W_𝔮` is an involution.
- `W_𝔮` preserves `M_k(𝔫, ψ; R)`: an operator modelled on the classical
  `S_k(N, χ) → S_k(N, χ̄)`, which inverts `ψ`, is the wrong definition.
- Level `𝒪_F` has no exact prime-power divisor, so `2.2.24.1-1.1-a` has `AL_eigenvalues = []`.

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

Define, for `f ∈ M_k(𝔫; R)`, `Φ_f : GL₂(𝔸_F) → ℂ` by `Φ_f(γ g_c k g_∞) := (f_c ∣_k g_∞)(i)` for
`γ ∈ GL₂(F)`, `k ∈ K₀(𝔫)`, `g_∞ ∈ GL₂(F_∞)⁺`, `i = (i)_w ∈ ℍ^Σ`. Prove it is well defined
(2.3, 6.1), left `GL₂(F)`-invariant, right `K₀(𝔫)`-invariant, of weight `k_w` under
`SO₂(ℝ)` at each place, with the central character attached to `ψ` and `k₀` when
`f ∈ M_k(𝔫, ψ; R)`, smooth, of moderate growth (3.3); and prove the inverse: a function with
these properties annihilated by the antiholomorphic Cauchy–Riemann operator at every real place
comes from a unique `f`. Prove that `f` is a cusp form iff `Φ_f` is cuspidal, by identifying the
adelic constant term with the classical constant terms at all cusps of all components (2.5).
This is the Hilbert-field instance of the supplier's R16.6.1 adapter, which is stated there for
`F = ℚ` only.

*Rests on:* 0.3, 2.5, 3.3, 6.1; the supplier's R16.1.6 finite-level automorphic functions.

### 6.3 Hecke compatibility

Prove that under `f ↦ Φ_f` the classical `T_𝔭` of 5.2 corresponds to the adelic double coset
`K₀(𝔫) diag(π_𝔭, 1) K₀(𝔫)` acting by right convolution, `S_𝔭` to `K₀(𝔫) π_𝔭 K₀(𝔫)`, and the
central action `⟨c⟩` to the action of the finite ideles of class `c` (with the normalization
`N𝔭^{-(k₀-2)}`), so that the **shared eigensystem** of the supplier's R16.4.4 attached to `Φ_f`
for a newform `f` has coordinates `t_𝔭 = c(𝔭, f)`, `N𝔭 · s_𝔭 = ψ([𝔭]) N𝔭^{k₀ - 1}` for `𝔭 ∤ 𝔫`
(the arithmetic normalization; the unitary one is its `arithmeticToUnitary` with
`z_𝔭 = N𝔭^{-(k₀-1)/2}`). This is the adapter the supplier calls `ofNewform` for `F = ℚ`,
constructed here for Hilbert newforms. Conclude that `S_k(𝔫, ψ; R)` is identified with a
finite-dimensional space of cusp forms on `GL₂(𝔸_F)` of level `K₀(𝔫)`, weight `k`, and central
character attached to `ψ`, Hecke-equivariantly.

*Rests on:* 5.2–5.4, 6.2; the supplier's R16.4.4 interface.

### 6.4 What the dictionary transports

State and prove, as corollaries of 6.2–6.3 and the cited adelic theorems, the classical
statements used below: **multiplicity one** — for a system `λ = (λ_𝔭)_{𝔭 ∤ 𝔫}` of eigenvalues,
the simultaneous `λ`-eigenspace of the good `T_𝔭` in `S_k(𝔫, ψ; R)` is the space of weight-`k`
vectors fixed by `K₀(𝔫)` in a single cuspidal automorphic representation `π_λ`, of dimension the
number of ideal divisors of `𝔫 𝔠(π_λ)⁻¹`, `𝔠(π_λ)` the conductor of R16.6.2 (R16.2, R16.4.3,
R16.4.4); in particular it is a line when `𝔠(π_λ) = 𝔫`; **strong multiplicity one** — two
systems of good eigenvalues at levels `𝔫, 𝔫'` and equal weight that agree for all but finitely
many `𝔭 ∤ 𝔫𝔫'` agree at every `𝔭 ∤ 𝔫𝔫'` and have the same `π`, hence the same conductor and the
same `ψ` (R16.4.4); the **bad-prime local structure** of R16.6.2, as a statement about the
`U_𝔭`-eigenvalue of a `K₀(𝔫)`-fixed vector in `π` of conductor exactly `𝔫`, which Layer 7 reads
on the coefficients; and the hypotheses under which Jacquet–Langlands (R17.3.1), base change
(R17.4) and automorphic induction (R17.5.1) produce a classical form (Layers 9–10). Each is a
theorem about the classical objects with the adelic statement as a cited input.

*Rests on:* 6.1–6.3; the cited supplier milestones.

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
multiplicativity and these recurrences (Diamond–Shurman Prop. 5.8.5 over `F`).

*Rests on:* 5.3, 5.4, 6.4, 7.2.

### 7.5 Hecke orbits, the coefficient field, Galois conjugates

Define `CoefficientField f := IntermediateField.adjoin ℚ (range (c(·, f))) ⊆ ℂ`. Prove that it
is a **number field**: the span of `{T_𝔪 f}` is finite dimensional, the operators `T_𝔪` have
integral characteristic polynomials on a `ℤ`-structure of `S_k(𝔫; R)` — the rational structure
is **consumed** from [Automorphic bundles](../AutomorphicBundles/README.md) B4.18 (rational
forms and field base change) through the geometric–analytic comparison B4.9 and the
`q`-expansion comparison B5.13/B5.16, which identify `S_k(𝔫; R)` with the base change to `ℂ` of a
`ℚ`-space on which the Hecke operators act and whose `q`-expansion coefficients at the cusps
are the `c(𝔪, f)` — so every `c(𝔪, f)` is an algebraic integer and `ℚ({c(𝔪, f)})` is finite
over `ℚ`. Prove that for `ψ = 1` the field is **totally real** (5.5: real eigenvalues of
self-adjoint operators, and the conjugates below are again eigenvalues). Define the Galois
conjugate `f^σ` for `σ : CoefficientField f →+* ℂ` as the unique newform with
`c(𝔪, f^σ) = σ(c(𝔪, f))` (existence from the `ℚ`-structure, as a form; newform-ness and
uniqueness from 7.2–7.3), and the **Hecke orbit** `{f^σ}` of cardinality
`finrank ℚ (CoefficientField f)` — the LMFDB's `dimension`. Prove that the orbit, the level, the
weight and the conductor of `ψ` are constant on an orbit,
and that `c(𝔭, f^σ) = σ(c(𝔭, f))` makes the LMFDB's `hecke_eigenvalues` of the orbit the
coordinates of one element of `CoefficientField f` per prime.

*Rests on:* 5.5, 7.2–7.4; Automorphic bundles B4.9, B4.18, B5.13, B5.16.

**Checks.**

- `CoefficientField f = ℚ` and `dimension = 1` for `2.2.5.1-31.1-a`.
- For Dembélé–Voight's newform at `𝔫 = (w + 3)²` over `ℚ(√5)`, `CoefficientField f = ℚ(√3)`,
  `dimension = 2`, and the conjugate `f^σ` with `σ(t) = -t` has `c((2), f^σ) = -t`,
  `c((w - 5), f^σ) = -4t` (`t² = 3`).
- `2.2.40.1-1.1-a` has a real quadratic coefficient field (totally real, as `ψ = 1`) and a Hecke
  orbit of two newforms.

### 7.6 Coefficients at the bad primes

For a newform `f` of level `𝔫`, central character `ψ`, and `𝔭 ∣ 𝔫`, prove: `c(𝔭, f) ≠ 0` iff
`v_𝔭(𝔫) = 1`, and then `c(𝔭, f)² = ψ([𝔭]) N𝔭^{k₀ - 2}`, so `|c(𝔭, f)| = N𝔭^{k₀/2 - 1}`. Since `ψ`
factors through the narrow class group it is unramified at every finite place, so the local
component of `π_f` at `𝔭` has unramified central character: at `v_𝔭(𝔫) = 1` it is an unramified
twist of the Steinberg representation (whose `U_𝔭`-eigenvalue is `μ(ϖ) N𝔭^{k₀/2 - 1}` with
`μ² = ψ_𝔭`), and at `v_𝔭(𝔫) ≥ 2` it has no unramified character in its inducing data, so the
newvector's `U_𝔭`-eigenvalue is `0`. These are the supplier's R16.6.2 local cases, transported by
6.4 (the ramified-principal-series case with a nonzero eigenvalue needs a ramified central
character and does not occur here); for `ψ = 1` and `𝔭² ∣ 𝔫` the conclusion `c(𝔭, f) = 0` and for
`𝔭 ‖ 𝔫` the conclusion `c(𝔭, f) = ±N𝔭^{k₀/2 - 1}` are the statements that the Atkin–Lehner signs
refine.

*Rests on:* 6.4, 7.4; GL₂ automorphic representations and transfer R16.6.2.

### 7.7 Atkin–Lehner signs

For a newform `f` and an exact divisor `𝔮 ‖ 𝔫` prove that `W_𝔮 f = λ_𝔮(f) f` for a scalar
`λ_𝔮(f)` with `λ_𝔮(f)² = ψ([𝔮])`: `W_𝔮` commutes with the good `T_𝔪`, preserves the new subspace,
the level and `ψ` (5.6), so multiplicity one (6.4) makes `W_𝔮 f` a multiple of `f`, and
`W_𝔮² = ⟨[𝔮]⟩` gives the square. (`W_𝔫 f` is **not** a multiple of the conjugate newform `f^ρ`,
which has central character `ψ⁻¹` and good eigenvalues `ψ([𝔪])⁻¹ c(𝔪, f)`; the classical
`f ∣ W_N = λ f^ρ` reflects the inversion of the nebentypus, which is absent here.) For `ψ = 1`
write `ε_𝔮(f) := λ_𝔮(f) ∈ {±1}`, that the signs
multiply (`ε_{𝔮𝔮'} = ε_𝔮 ε_𝔮'`), that for `𝔭 ‖ 𝔫`, `c(𝔭, f) = -ε_𝔭(f) N𝔭^{k₀/2 - 1}`, and that
for `𝔭² ∣ 𝔫` the sign `ε_{𝔭^{v}}(f)` is not determined by the coefficients (a genuine extra
invariant). Prove `ε_𝔮(f^σ) = ε_𝔮(f)` for Galois conjugates. For general `ψ` the
**pseudo-eigenvalue** `λ_𝔮(f)` above has `|λ_𝔮(f)| = 1` and is a square root of `ψ([𝔮])`; no `±1`
sign is claimed. These are the Hilbert instances of the Modular
Forms roadmap's Layer 6 theorems and are proved by the same route: the coefficient formulas 5.4
and 7.6 and strong multiplicity one 6.4.

*Rests on:* 5.5, 5.6, 6.4, 7.4, 7.6.

**Checks.**

- `2.2.5.1-31.1-a`: `c((5w - 2), f) = -1`, so `ε_(5w - 2)(f) = -c((5w - 2), f) = +1`.
- `2.2.5.1-81.1-a` at level `(3)²`: `c((3), f) = 0` by 7.6, and `ε_(9)(f)` is not determined by
  the coefficients.
- Level `𝒪_F` has no Atkin–Lehner signs: `2.2.24.1-1.1-a`, `2.2.29.1-1.1-a` have
  `AL_eigenvalues = []`.

## Layer 8: `L`-functions

### 8.1 The Dirichlet series and its Euler product

For `f ∈ M_k(𝔫; R)` define `L(f, s) := LSeries (normCoeff (c(·, f))) s`, the ideal Dirichlet
series `Σ_𝔪 c(𝔪, f) N𝔪^{-s}` regrouped by norm. Prove absolute convergence for
`Re s > k₀/2 + 1` when `f` is a cusp form and for `Re s > k₀ + 1` in general (3.3 and the
norm-fibre finiteness behind Tau Ceti's `normCoeff`). For a newform of central character `ψ` prove the **Euler product**
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

### 8.2 The completed `L`-function and its functional equation

For a newform `f` of level `𝔫` define
`Λ(f, s) := (N(𝔫) |d_F|²)^{s/2} ∏_w (2π)^{-(s - m_w)} Γ(s - m_w) · L(f, s)`. Prove, by the
Hecke–Shimura method: `Λ(f, s)` is the Mellin transform
`∫_{F_{ℝ,+}^×/𝒪_{F,+}^×} Σ_c (f_c ∣ W_𝔫)(iy)-weighted integrand` of the components along the
imaginary axes (the unit group acts on `y`; the fundamental domain is that of 3.1), hence has an
**entire** continuation, is bounded in vertical strips, and satisfies
`Λ(f, s) = ε(f) Λ(f^ρ, k₀ - s)` with `ε(f) = i^{nk₀} · λ_𝔫(f)`, `λ_𝔫(f)` the `W_𝔫`-eigenvalue of 7.7
(the Mellin transform is taken over the whole idele class group of `F`, which is where `f^ρ`
enters for `ψ ≠ 1`);
for `ψ = 1`, `f^ρ = f` and `ε(f) = (-1)^{nk₀/2} ∏_{𝔮 ‖ 𝔫} ε_𝔮(f)`. For parallel weight `2`,
`ε(f) = (-1)^n ∏ ε_𝔮(f)`. For `F = ℚ` this is the Modular Forms roadmap's Layer 7 equation with
`i^k`. Prove `|ε(f)| = 1`, and `ε(f) ∈ {±1}` when `ψ = 1`.

*Rests on:* 2.6, 3.1, 5.6, 7.7, 8.1; Mathlib `mellin`, `Complex.Gamma`.

**Checks.**

- `2.2.5.1-31.1-a`: `ε(f) = (-1)^2 · ε_(5w - 2)(f) = +1`.
- At level one, `ε(f) = (-1)^2 = 1` for `2.2.24.1-1.1-a` and `2.2.29.1-1.1-a`.
- In parallel weight `2` over a real quadratic field every `m_w = 0`, so
  `Λ(f, s) = (N(𝔫) d_F²)^(s/2) ((2π)^(-s) Γ(s))² L(f, s)`; for `2.2.5.1-31.1-a`,
  `N(𝔫) d_F² = 31 · 25 = 775`.
- For `ψ = 1`, `f^ρ = f`.

### 8.3 The `L`-function card and the analytic invariants

Construct the [L-functions](../LFunctions/README.md) roadmap's `ArithmeticLFunctionData` of a
newform: coefficients `normCoeff (c(·, f))` with `coeff 0 = 0`, arithmetic weight `k₀ - 1`,
conductor `N(𝔫) · |d_F|²`, gamma shifts `gammaC = {(k_w - 1)/2 : w ∈ Σ}` after the
`NormalizationTranslation` to the analytic normalization (so the degree is `2n` and the analytic
centre is `1/2`), root number `ε(f)`, completed function `Λ(f, ·)` recentred, empty polar
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

## Layer 9: twists, complex multiplication, base change

### 9.1 Twists by finite-order Hecke characters

For a finite-order Hecke character `χ` of `F` with conductor `𝔣` (a `Modulus` with finite part
`𝔣₀`) **whose square is unramified at every finite place** — `χ²` factors through
`NarrowClassGroup F`, equivalently `χ²` is trivial on the totally positive principal ideals prime
to `𝔣₀` — and a newform `f` of level `𝔫`, define the function `f ⊗ χ` on each component by the
coefficients `c(𝔪, f ⊗ χ) := χ(𝔪) c(𝔪, f)` (`idealCharacter` for `𝔪 + 𝔣₀ = 𝒪_F`, `0` otherwise)
and prove it is a cusp form of level dividing `lcm(𝔫, 𝔣₀²)` with central character `ψχ²` — the
classical proof writes `χ(μ)` on a residue class as a Gauss sum and recognizes a finite linear
combination of translates `f ∣_k (1 a/π; 0 1)`; the real-place signs of `χ` are absorbed by the
central character `ψχ²` (whose infinity type is unchanged), so `f ⊗ χ ≠ 0` for every such `χ`.
The hypothesis on `χ²` is forced by the carrier: `M_k(𝔫'; R)` has only central characters of
`NarrowClassGroup F`, and for `χ²` ramified at `𝔭` the twisted representation `π_f ⊗ χ` has a
central character ramified at `𝔭`, hence no vector fixed by the scalars `𝒪_𝔭^× ⊆ K₀(𝔫')` (6.3),
so it lies in no `M_k(𝔫'; R)`; twists by such `χ` are not defined here. The level `lcm(𝔫, 𝔣₀²)`
is Atkin–Li's `lcm(N, q², q · cond(εχ))` with `ε = ψ` unramified at the finite places, so that
`𝔣₀ · cond(ψχ) ∣ 𝔣₀²`. Define the **primitive associate** `(f ⊗ χ)^{new}` (7.3) and prove
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
- A `χ` with `χ²` ramified at a finite place is rejected: `f ⊗ χ` lies in no `M_k(𝔫'; R)`.

### 9.2 Inner twists and the CM predicate

Define an **inner twist** of a newform `f` as a pair `(σ, χ)` with `σ` an embedding of
`CoefficientField f` and `χ` a finite-order Hecke character such that
`c(𝔭, f^σ) = χ(𝔭) c(𝔭, f)` for all `𝔭 ∤ 𝔫𝔣₀`; prove the group law and that `χ` is then
determined by `σ`. Define `HasCM f` as the existence of a **nontrivial** `χ` with
`(id, χ)` an inner twist — the knowl `mf.cm`: `f` equals its twist by `χ` on good coefficients.
Prove: such `χ` is quadratic (`χ² = 1`: by the cited characterization of 9.3, `π_f ≅ π_f ⊗ χ`
forces `π_f` to be induced from the kernel of `χ`, which has index `2`); `χ` is odd at every
real place, so it defines a totally imaginary quadratic extension `K/F` (a real place where `χ`
is even would make the induced representation non-holomorphic there), that is, `K` is a CM field with maximal
totally real subfield `F` (Mathlib `NumberField.IsCMField`); and `c(𝔭, f) = 0` for every `𝔭 ∤ 𝔫`
inert in `K/F`. Prove that `HasCM` is constant on Hecke orbits and invariant under twisting by
any `χ'` admissible in 9.1. The LMFDB's `is_CM` is `HasCM f`.

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

### 9.3 CM forms from Hecke characters of CM extensions

Let `K/F` be a CM extension and `ξ` an algebraic Hecke character of `K` (`HeckeCharacter K`
with `IsAlgebraic`) whose algebraic infinity type has exponents `(n_τ, n_{τ̄})` with
`n_τ + n_{τ̄} = k₀ - 1` and `|n_τ - n_{τ̄}| = k_w - 1` at the two complex embeddings `τ, τ̄` above
`w`, and with `ξ ≠ ξ ∘ (conjugation)`. Define the coefficients
`c(𝔪) := Σ_{𝔄 ⊆ 𝒪_K, N_{K/F}(𝔄) = 𝔪} ξ(𝔄)` (sum over integral ideals of `K` of relative norm `𝔪`,
`ξ(𝔄)` the ideal character, `0` at ideals meeting the conductor). Prove that they are the
coefficients of a newform `θ_ξ` of weight `k`, level `𝔡_{K/F} N_{K/F}(𝔣_ξ)`, and central
character `ξ|_F · χ_{K/F}`, and that `HasCM θ_ξ` with inner twist `χ_{K/F}`. Existence is
**consumed**: automorphic induction from `GL₁(𝔸_K)` to `GL₂(𝔸_F)`
([GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md)
R17.5.1, the dihedral case), transported by 6.4; the coefficient identity is the split/inert
trace formula of that construction, and the level is its conductor. Prove the converse by
citation: a CM newform in the sense of 9.2 is `θ_ξ` for some `(K, ξ)`
([Automorphic Galois representations](../AutomorphicGaloisRepresentations/README.md) §§3.15–3.16).
Record the coefficient-field consequence: `CoefficientField θ_ξ` is the field generated by the
values of `ξ`, and `c(𝔭, θ_ξ) = ξ(𝔓) + ξ(𝔓̄)` at split `𝔭 = 𝔓𝔓̄`.

*Rests on:* 7.2, 7.5, 9.2; Tau Ceti `HeckeCharacter.IsAlgebraic`, `AlgebraicInfinityType`;
the cited supplier milestones.

### 9.4 The base-change relation

For number fields `F ⊆ K`, a newform `f` over `F` with local factors `L_𝔭(f, T)` (8.1) and a
newform `g` over `K`, define `IsBaseChangeOf g f` by the pinned convention:
`L_𝔮(g, T) = L_𝔭^{(r)}(f, T)` for all but finitely many primes `𝔮` of `K`, where `𝔮 ∣ 𝔭`,
`r = f(𝔮/𝔭)`, and `h^{(r)}` is the polynomial whose roots are the `r`-th powers of the roots of
`h` (Mathlib: `Polynomial` with `Multiset.map (· ^ r)` on roots, over `ℂ`). Prove the Satake
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

- For `h = 1 - sT + eT²`, `h^{(2)} = 1 - (s² - 2e)T + e²T²`; Suggested.lean's `powRoots h 2`
  computes this polynomial.
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
`IsBaseChangeOf g f`, of level the conductor of the base-changed representation
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
`𝒪_F` and trivial central character with these coefficients, `IsBaseChangeOf f_g g`, and
`L(f_g, s) = L(g, s) · L(g^ρ, s)`. Prove the Fourier-coefficient formula away from the different:
for `ν ∈ (𝔡⁻¹)_+` with `(ν√D)` prime to `(√D)`, `a(ν) = Σ_{d ∈ ℕ, d ∣ ν√D} d^{k-1} b(D N(ν)/d²)`
(here `ν√D ∈ 𝒪_F`, `d ∣ ν√D` means `ν√D/d ∈ 𝒪_F`, and `D N(ν) = |N(ν√D)| ∈ ℕ`). The formula is
**not** asserted at `ν` with `(√D) ∣ ν√D`: at `ν = 1` it would give `b(D)`, which is never real
(`|b(D)|² = D^{k-1}` and `b(D) ∉ ℝ` for every newform of nebentypus `χ_D`), whereas a level-one
eigenform has `c((√D), f_g) = b(D) + b̄(D) = 2 Re b(D)` (its Euler factor at `(√D)` has degree `2`).
The proof route is Zagier's: a kernel function `Ω(z, τ)`, a Hilbert modular form in `z ∈ ℍ²`
and a form in `τ ∈ ℍ` of weight `k` for `Γ₀(D)` with character `χ_D`, whose Petersson product
with `g` is `f_g`; holomorphy and modularity of `f_g` follow from those of `Ω`. The kernel is a
Poincaré-type series of weight `k` in each variable: for `k > 2` it converges absolutely by the
lattice-point counting of 4.1, and for `k = 2` it is defined by Hecke's trick with the limit
analysis of 4.2 (the same `n = 2` cancellation). Record that
`g ↦ f_g` is Hecke-equivariant (`T_p ↦ T_𝔭 + T_{𝔭'}` at split `p`), that `f_g = f_{g^ρ}`, and that
`f_g ≠ 0` (`c(𝒪_F, f_g) = 1`).

*Rests on:* 2.3, 4.1, 4.2, 5.4, 7.4, 8.1, 9.4; Modular Forms Layers 4 and 7 (the newform `g`,
its nebentypus, its Euler factors and conjugate).

**Checks.**

- `F = ℚ(√29)`, `g ∈ S_2(Γ₀(29), χ_29)` with `t² = -5`: the lift is `2.2.29.1-1.1-a`, with
  `c((2)) = b(2)² + 4 = -1`, `c((3)) = b(3)² + 6 = 1`, `c(𝔭_5) = b(5) = -3`, `c(𝔭_7) = b(7) = 2`.
- At the ramified prime, `c((√29)) = b(29) + b̄(29) = -6`, not `b(29) = -3 + 2t`; the
  Fourier-coefficient formula at `ν = 1` would give the non-real `b(29)`.
- `c(𝒪_F, f_g) = 1`, so `f_g ≠ 0`, and `f_g = f_{g^ρ}`.

## Layer 10: the Jacquet–Langlands dictionary

### 10.1 The `𝔇`-new subspace

For a squarefree `𝔇 ∣ 𝔫` define `S_k(𝔫; R)^{𝔇-new}` as the intersection over `𝔭 ∣ 𝔇` of the
orthogonal complements of the images of `ι` and `V_𝔭` from level `𝔫𝔭⁻¹` (7.1), and prove it is
Hecke-stable and spanned by the images, under the level-changing operators at the primes of
`𝔫𝔪⁻¹`, of the newforms of level `𝔪 ∣ 𝔫` with `v_𝔭(𝔪) = v_𝔭(𝔫)` for every `𝔭 ∣ 𝔇`; in
particular `S_k(𝔫; R)^{rad(𝔫)-new} = S_k(𝔫; R)^{new}`, and `S_k(𝔫; R)^{𝔇-new} ⊇ S_k(𝔫; R)^{new}`.

*Rests on:* 7.1–7.3.

### 10.2 The dictionary with totally definite quaternion algebras

Let `B` be a quaternion algebra over `F` ramified at every real place and at the primes of a
squarefree `𝔇 ‖ 𝔫` (`v_𝔭(𝔫) = 1` for `𝔭 ∣ 𝔇`, so that `𝔫𝔇⁻¹` is prime to `𝔇`), with `n + ω(𝔇)` even, and `𝒪_B` an Eichler order of level `𝔫𝔇⁻¹`
(Quaternionic modular forms §0.1). State and prove by citation the **Jacquet–Langlands
dictionary**: the space of quaternionic modular forms of weight `k` and level `𝒪̂_B^×`
(Quaternionic modular forms §2.1 with the weight of its §1.1; in parallel weight `2`, functions
on the class set of §0.3), modulo the forms factoring through the reduced norm in parallel
weight `2`, is isomorphic as a module over the `T_𝔭`, `𝔭 ∤ 𝔫` (§3.1 there, 5.2 here) to
`S_k(𝔫; R)^{𝔇-new}`, compatibly with the central action and with `U_𝔭` at `𝔭 ∣ 𝔫𝔇⁻¹`, the
eigenvalue at `𝔭 ∣ 𝔇` on the quaternionic side being `-ε_𝔭(f) N𝔭^{k₀/2 - 1}` (7.7). Inputs:
[GL₂ automorphic representations and transfer](../GL2AutomorphicRepresentationsAndTransfer/README.md)
R17.3.1, R17.3.3, R17.3.5 and R17.3.9, transported by 6.4 and by the supplier's quaternionic
dictionary. Record the parity constraint: no such `B` exists when `n + ω(𝔇)` is odd, which is why
the LMFDB's computations for even-degree `F` at squarefull level use an indefinite algebra and
the sibling `QuaternionArithmetic`'s Shimura-curve side.

*Rests on:* 5.2, 6.4, 7.7, 10.1; Quaternionic modular forms §§0.1, 0.3, 1.1, 2.1, 3.1; the cited
R17.3 milestones.

### 10.3 Brandt matrices and traces

Define nothing new: for the Eichler order of 10.2, the Brandt matrices `B(𝔭)` are the matrices
of the Hecke operators of Quaternionic modular forms §3.1 on the class-set basis, as the sibling
`QuaternionArithmetic` roadmap defines them. Prove the **trace identity**
`Tr(T_𝔭 ∣ S_2(𝔫; R)^{𝔇-new}) = Tr(B(𝔭)) - (number of norm-factoring forms) · (N𝔭 + 1)`
in parallel weight `2` for `𝔭 ∤ 𝔫`, and the characteristic-polynomial identity
`charpoly(T_𝔭 ∣ S_k(𝔫; R)^{𝔇-new}) = charpoly(B_k(𝔭))` on the cuspidal part in general, as
corollaries of 10.2. This is the statement that certifies the LMFDB's tables: the Hecke
eigenvalues it stores are the eigenvalues of Brandt matrices, and the identity is what a
certificate for a stored `hecke_eigenvalues` list checks against.

*Rests on:* 10.2.

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
| `AL_eigenvalues` | `𝔮 ↦ ε_𝔮(f)` for `𝔮 ‖ 𝔫`, `ψ = 1` | 7.7 |
| `is_CM` | `HasCM f` | 9.2 |
| `is_base_change` | `IsBaseChange f` | 9.4 |
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

Define `HasLMFDBIntrinsicPrefix f (d r D N : ℕ) := HasLMFDBIntrinsicLabel F d r D ∧ Ideal.absNorm 𝔫 = N`,
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

### 11.3 The elliptic-curve interface

For a function `a : HeightOneSpectrum (𝓞 F) → ℤ` and a newform `f` of level `𝔫`, define
`IsAttachedTo f a`: `f` has parallel weight `2`, trivial central character,
`CoefficientField f = ℚ`, and `c(𝔭, f) = a 𝔭` for all `𝔭 ∤ 𝔫`. Prove uniqueness of `f`
given `(a, 𝔫)` (strong multiplicity one, 6.4), that `IsAttachedTo` is invariant under the
transport of 2.3, and that it implies `L(f, s) = Σ a-generated Euler product` on good primes.
The curve side — the conductor ideal of an elliptic curve `E/F` and its traces of Frobenius
`a_𝔭(E) = N𝔭 + 1 - #Ẽ(𝔽_𝔭)` — is the [Elliptic curves](../EllipticCurves/README.md) roadmap's and
the sibling `EllipticCurvePeriodsAndModularParametrizations`'; **modularity** — that for every
`E/F` of conductor `𝔫_E` some `f` of level `𝔫_E` satisfies `IsAttachedTo f (a_·(E))`, known for real quadratic `F` and for
many other totally real fields — is the theorem of
[Potential modularity and compatible systems](../PotentialModularityAndCompatibleSystems/README.md)
and is consumed as a statement there; this roadmap supplies the predicate and proves that the
LMFDB's displayed link `ecnf ↔ hmf` is `IsAttachedTo`, with the `L`-function card of 8.3 equal
(`EqOffZero`) to the curve's.

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
at every listed good prime: this is the acceptance test for `IsAttachedTo`. Its Galois conjugate
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
an invariant not determined by the coefficients (7.7). The rejection test: a CM field for a
newform of level `𝔫` is a totally imaginary quadratic extension unramified at the finite primes
outside `𝔫` (9.3). For `2.2.5.1-31.1-a` the totally negative classes in `F^×/F^{×2}` supported on
`𝔫` are `-1` and `-(3w + 5) = -w(5w - 2)`, and both `F(√-1)` and `F(√(-(3w + 5)))` have relative
discriminant divisible by `(2)²` (`(2) ∤ 𝔫`), so no CM field exists and `HasCM` is rejected on the
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
elliptic curves over `ℚ(√6)` with everywhere good reduction: `IsAttachedTo f (a_·(E))` with
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
for conjugate primes) and 9.2 (`HasCM` is rejected: a CM field would be `F(√-1)` or `F(√(-(w + 3)))`, both of relative
discriminant divisible by `(2)² ∤ (w + 3)²`; and `(w - 4)` is inert in the first and `(3)` in the
second, while `c((w - 4), f) = -2t` and `c((3), f) = -1` are nonzero). At `𝔫 = (w + 4)²`, norm
`361`, Example 6.7 gives rational
newforms `f, g` with `c((2), f) = 2 = -c((2), g)`, `c((w+2), f) = -3 = c((w+2), g)`,
`c((3), f) = 1 = -c((3), g)`: `g = (f ⊗ χ)^{new}` for the quadratic character of
`F(√(w(w+4)))/F` (9.1); both are rejected by `IsBaseChange` (`c((w+5), f) = 3 ≠ -6 = c((w-6), f)`).

### Rejection tests

- A tuple `(f_𝔟)` with one component holomorphic and invariant but with a Fourier coefficient
  `a(μ) ≠ 0` at a `μ` that is not totally positive cannot exist (2.2); the function
  `z ↦ e(Tr(μz))` for `μ ∈ 𝔡⁻¹` with `σ_1(μ) > 0 > σ_2(μ)` is holomorphic and
  `𝒪_F`-periodic but is not invariant under `(ε 0; 0 1)`, and is rejected from `M_k`.
- The constant function `1` lies in `M_0(Γ)` and in no `M_k(Γ)` with `k ≠ 0`; it is not a cusp
  form (2.6).
- Over `ℚ(√5)` the odd-weight spaces vanish (2.3); over `ℚ(√3)`, where no unit has norm `-1`,
  the parity lemma is silent and odd parallel weights are not excluded.
- A normalized good eigenform at level `𝔫𝔭` obtained from a newform `g` of level `𝔫` as
  `g + c · V_𝔭 g` is not a newform and not a `U_𝔭`-eigenvector in general (7.3's uniqueness is of
  the pair `(𝔪, g)`, not of `f`).
- The LMFDB's `is_base_change = yes` is a heuristic determination (its reliability knowl says
  so); `IsBaseChange` is the predicate, and a form with `c(σ𝔭, f) = c(𝔭, f)` for all tested `𝔭`
  is not thereby proved to satisfy it (9.5 gives the implication in the other direction, and the
  descent theorem only for cyclic `F/ℚ` with the equality at **all** primes).

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

Layers 0–2 are sequential. Layer 3 (reduction theory) and Layer 4 (Eisenstein series, which
needs 3.1's counting and 3.4 for orthogonality) follow Layer 2; Layer 5 needs Layers 2 and 3
(3.4–3.5 for adjoints and diagonalization) and can proceed in parallel with Layer 4. Layer 6 needs
Layers 5 and the cited adelic suppliers. Layer 7 needs Layers 5–6; 7.5 additionally needs
Automorphic bundles. Layers 8, 9, 10 are independent of one another after Layer 7 (9.6 also uses
8.1; 10.2 uses 7.7). Layer 11 collects Layers 7–9.

## References

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
- L. Dembélé and J. Voight, "Explicit methods for Hilbert modular forms", in *Elliptic Curves,
  Hilbert Modular Forms and Galois Deformations*, Birkhäuser, 2013, [arXiv:1010.5727](https://arxiv.org/abs/1010.5727).
  §2 (Definition 2.1, (2.4)–(2.7): the parallel-weight-`2` definitions, the Fourier expansion
  over `(𝔡⁻¹)_+`, `T_𝔭` in the arithmetic normalization), §3 (Theorem 3.9,
  Eichler–Shimizu–Jacquet–Langlands), §6 (Examples 6.3, 6.4, 6.6, 6.7 used above), §7 (the
  arbitrary-class-number description, (7.10) the weight-`(k, m)` slash). This is the source the
  LMFDB's data documentation cites.
- K. Doi and H. Naganuma, "On the functional equation of certain Dirichlet series", *Invent.
  Math.* 9 (1969), 1–14; D. Zagier, "Modular forms associated to real quadratic fields", *Invent.
  Math.* 30 (1975), 1–46 — the Doi–Naganuma lift and its kernel function (9.6).
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
