# Roadmap: bianchi modular forms

**Summary.** A Bianchi modular form is a modular form for `GL₂` over an imaginary quadratic field `K`. The
group `GL₂(𝓞_K)` acts on hyperbolic three-space `ℍ³` instead of the upper half-plane, so there is
no complex structure to be holomorphic for, and the two definitions in use both replace
holomorphy by harmonicity: a weight-two form is a `Γ₀(𝔫)`-invariant cuspidal harmonic `1`-form on `ℍ³`
with a Fourier–Bessel expansion, or, equivalently, a class in the cuspidal part of the group
cohomology `H¹(Γ₀(𝔫), ℂ)`. The equivalence of the two is the Eichler–Shimura–Harder isomorphism,
and the second description is the one the LMFDB computes with and the one every arithmetic
invariant is read from. This roadmap builds both descriptions for weight two and level
`Γ₀(𝔫) ≤ GL₂(𝓞_K)`, proves the comparison, and then develops everything the LMFDB's Bianchi
newform pages display: Hecke operators at *all* prime ideals, including the bookkeeping over the
ideal classes of `K` that nonprincipal primes force, oldforms and newforms, Atkin–Lehner and
Fricke eigenvalues, the `L`-function with its functional equation and sign, the analytic rank and
Cremona's `L`-ratio, twists, base change from classical newforms, CM forms, and the relation to
elliptic curves over `K`. It ends with the modular-symbol presentation and duality theorems for these spaces
and with the Bianchi–Swan–Cremona fundamental domains for the nine class-number-one fields as
worked examples.

The primary carrier is the **cuspidal cohomology of the `Γ₀(𝔫)`-groups over all ideal classes**,
`H¹_cusp(𝔫) := ⊕_{[𝔞] ∈ Cl(K)} H¹_cusp(Γ₀(𝔫, 𝔞), ℂ)`, where `Γ₀(𝔫, 𝔞) ⊂ GL₂(K)` is the
stabilizer of the lattice `𝓞_K ⊕ 𝔞` with its level structure (Layer 0), built from Mathlib's
`groupCohomology` and the cusp stabilizers; `Γ₀(𝔫, 𝓞_K) = Γ₀(𝔫)` is the LMFDB's group. For
`h_K > 1` this space decomposes by unramified central characters, and the LMFDB's forms are its
trivial-central-character part `H¹_cusp(𝔫)^S` (1.5), the whole space when `h_K = 1`. The
**analytic carrier**, ℂ³-valued functions on `ℍ³`, is stated against the hyperbolic three-space
and the Bianchi groups of the [Kleinian-groups roadmap](../KleinianGroups/README.md) and the
`K`-Bessel function of the
[automorphic-forms roadmap](../AutomorphicFormsOnReductiveGroups/README.md) (§4.5), and is
compared with the cohomological one in Layer 3 through the adelic Bianchi eigenforms of the
[modularity-and-Langlands-extensions roadmap](../ModularityAndLanglandsExtensions/README.md)
(§§4.26–4.27). **Weight** is two throughout the arithmetic layers, which is the LMFDB's weight;
the cohomological spaces of Layer 1 are defined for every weight `k ≥ 2`, to give the intrinsic cohomological dimensions underlying dimension-table comparisons, and no other layer depends on `k > 2`.

Suggested home: `TauCeti/NumberTheory/Bianchi/`, with files for the groups and cusps, the
cohomological spaces, the harmonic forms and their expansions, the comparison, Hecke operators,
newforms and Atkin–Lehner operators, `L`-functions, twists and base change, CM, elliptic curves,
modular symbols, and the fundamental domains.

`Suggested.lean` states the boundary-dimension theorem `finrank_H1_sub_cuspidal` and
Vogtmann's full classification `cuspidalH1_sl2Image_eq_bot_iff`, with the concrete definitions
needed to express them. Its module docstring identifies the carriers missing for the other
headline theorems. API targets and Checks are specified in this README in prose. The definitions `cusps`,
`cuspidalHom` and `cuspidalH1` make sense over any field K; `H1` and `homEquiv` use
any group in Type. The maps `toGLK` and `sl2Image` need only the field and its ring of
integers. The arithmetic assertions retain the standing number-field hypotheses.

## Scope and ownership

This roadmap serves the LMFDB's **Bianchi newform** pages (`bmf`) and the Bianchi side of its
**elliptic curves over imaginary quadratic fields** pages (`ecnf`). Every column of the
`bmf_forms` and `bmf_dims` tables is listed in Layer 1 or Layer 4 and assigned an owner.

### Owned here

- The congruence subgroups `Γ₀(𝔫)`, `Γ₁(𝔫)`, `Γ(𝔫)` of `GL₂(𝓞_K)`, their `SL₂` versions, the
  component groups `Γ₀(𝔫, 𝔞)`, their indices, cusps and cusp stabilizers (Layer 0).
- The cohomological spaces `H¹(Γ, E_k)`, their cuspidal and Eisenstein parts, finiteness,
  the rational and integral structures, the sum over ideal classes with its central operators and
  trivial-central-character subspace, and the comparison with the Betti cohomology of the locally
  symmetric space (Layer 1).
- The weight-two harmonic forms on `ℍ³`, the slash action, growth and cuspidality, the
  Fourier–Bessel expansion with the coefficient map `c(𝔪)` indexed by integral ideals, and the
  Petersson inner product (Layer 2).
- The classical Eichler–Shimura–Harder comparison, assembled from the adelization of the
  classical forms and the adelic comparison of the Langlands-extensions roadmap (Layer 3).
- Hecke operators `T_𝔭` for every prime ideal `𝔭` on the total space over the ideal classes,
  `U_𝔭` at `𝔭 ∣ 𝔫`, the Hecke algebra, its commutativity, integrality and self-adjointness,
  eigenforms, Hecke fields, and the eigenvalue–coefficient comparison (Layer 4).
- Degeneracy and trace maps, oldforms and newforms, multiplicity one, strong multiplicity one,
  Atkin–Lehner operators `W_𝔮` and the Fricke operator `W_𝔫` with their signs (Layer 5).
- The `L`-function `L(F, s)`, its Euler product, the completed function `Λ(F, s)`, the
  functional equation and its sign, the analytic rank, and Cremona's `L`-ratio (Layer 6).
- Twists by finite-order Hecke characters, base change from classical newforms with the
  LMFDB's `bc` invariant, and CM forms with the LMFDB's `CM` invariant (Layer 7).
- The relation to elliptic curves over `K`: the predicate "`F` has an elliptic curve", the
  direction from curves to forms as a consumed theorem, the CM and Eisenstein cases, and the
  distinction between base-change forms and base-change curves (Layer 8).
- Modular symbols over `K`, the finite cellular presentation of `H¹_cusp` and its Hecke action, and the Bianchi–Swan–Cremona fundamental domains of the
  nine class-number-one fields (Layer 9).

### Not owned here

- Pseudobases, rank/Steinitz classification and simultaneous invariant factors are
  ClassicalArithmeticCompletion §7.0(a)–(d); Layer 0 specializes them to level pairs.
- The K-Bessel Mellin transform is MaassForms §2.1(v); Layer 6 specializes and rescales it.
- The proper-order Picard/CM dictionary, conjugation and thirteen-order classification are
  ImaginaryQuadraticClassNumber §§H1.4, H3.1 and H3.6; §8.4 makes the deduction over K.

- **Everything indexed by an ordering or a stored list**: the ideal labels `N.i`, the suffix
  `a, b, …` of a newform in a level, the `short_label`, `level_number`, the choice of
  defining polynomial of the Hecke field (`hecke_poly`), the ordering of the eigenvalue table,
  and the completeness and reliability statements of the database are not targets. This
  roadmap states the **intrinsic label prefix**: the field
  `K`, the level ideal `𝔫`, and the invariants a form is sorted by (dimension, then the
  eigenvalue sequence), never the index.
- **Weight `k > 2` arithmetic**: Hecke theory, newforms and `L`-functions of higher weight are
  the adelic theory of the Langlands-extensions roadmap (§4.27); here only the cohomological
  spaces of all weights are defined (1.3), for the dimension tables.
- **Nontrivial nebentypus**: the LMFDB's Bianchi forms have trivial character; `Γ₁(𝔫)` appears
  only as the comparison group of 1.7.
- **Mordell–Weil data of the curves** over `K`: `rank`, `torsion`, `regulator`, `sha` and
  `tamagawa` are the [elliptic-curves roadmap](../EllipticCurves/README.md)'s and are in Tau Ceti
  for every number field (`fg_point_of_numberField` and `regulator` at the pin);
  the period `omega` over `K` is
  `EllipticCurvePeriodsAndModularParametrizations` 2.5 (`globalPeriod`), and the BSD formula over
  `K` is its 3.6 (`bsdFactor`, `analyticShaOrder`) and 3.7 (`WeakBSD`, `StrongBSD`). The
  elliptic-curves roadmap pins its own BSD quotient to `K = ℚ` and is not the owner over `K`.
  Only the analytic side of the correspondence is here.
- **Humbert's volume formula** for a general imaginary quadratic field and the Eisenstein series
  on `ℍ³` that prove it: named in the Kleinian-groups roadmap as a roadmap-for-a-roadmap; the two
  covolumes it supplies are consumed, nothing is added.
- **Maass forms on `ℍ³`**: the weight-`0` Laplace eigenfunction theory for the one group
  `PSL₂(ℤ[i])` (its Fourier–Bessel expansion, Hecke operators and `L`-function) is `MaassForms`
  Layer 7, which states no other Bianchi group, no level, no continuous spectrum and no trace
  formula. This roadmap uses none of these: its Laplacian is the Hodge Laplacian on `1`-forms
  (2.2), and the spectral theory of `Γ \ ℍ³` beyond `MaassForms` Layer 7 is not a target here.
- **Hilbert modular forms** and the real quadratic side of the `ecnf` pages: `HilbertModularForms`.
- **Torsion in `H¹(Γ, ℤ)`**, Galois representations attached to torsion classes, and the
  `p`-adic theory: the Langlands-extensions and locally-symmetric-spaces roadmaps.

### The LMFDB boundary rule

A predicate invariant under isomorphism of the form (its eigensystem) is defined here; anything
that depends on an ordering, a normal form or a system convention is not a target.
The columns of `bmf_forms` map as follows: `field_label` (the field `K`, prefix only),
`level_label` and `level_norm` (the ideal `𝔫` and `N𝔫`, 0.1), `label_suffix`, `short_label`,
`level_number`, `label` (labels), `weight` (always `2`), `dimension` (4.7), `hecke_eigs` and
`hecke_poly` (4.5, 4.7), `AL_eigs` (5.6), `sfe` (6.3), Lratio (6.6), `bc` (7.5), `CM` (7.7),
`curve_status` (8.2), `field_bad_primes` and `level_bad_primes` (0.1), `cuspidal` (1.2). The
columns of `bmf_dims` are `gl2_dims` and `sl2_dims` with `cuspidal_dim` and `new_dim` per weight
(1.3, 5.2).

### Further scope boundaries

- Ideal labels, newform suffixes, `hecke_poly`'s polredabs normalization, eigenvalue orderings,
  and the completeness tables are database conventions, not targets.
- Weight `k > 2` Hecke theory, newforms, `L`-functions and higher-weight base change: the
  Langlands-extensions roadmap's adelic theory (§4.27, §4.40–4.43).
- Nontrivial nebentypus and `Γ₁(𝔫)`-newforms.
- Humbert's formula and Eisenstein series on `ℍ³`; the spectral theory of the Laplacian on
  functions on `Γ \ ℍ³` (`MaassForms` Layer 7 for `PSL₂(ℤ[i])` only).
- Torsion in `H¹(Γ, ℤ)` and its Galois representations; `p`-adic Bianchi forms; the Galois
  representations attached to Bianchi newforms (Harris–Soudry–Taylor, Berger–Harcos, and
  Scholze) and their local–global compatibility beyond what 8.1 consumes.
- Dimension formulas by the trace formula; the Bianchi Eichler–Selberg trace formula.
- Mordell–Weil data, periods, regulators and the BSD formula for curves over `K` (the
  elliptic-curves roadmap and Tau Ceti; `EllipticCurvePeriodsAndModularParametrizations` 2.5,
  3.6–3.7 for the period and the BSD quotient); modular parametrizations of curves over `K`
  by Bianchi forms (none exist: `Y₀(𝔫)` is a real three-fold).
- The QM abelian surfaces of rational newforms without elliptic curves; Bianchi forms over fields
  of class number `h_K > 1` are in scope (Layers 0–8 are stated for all `K`), but the
  Eichler–Shimura–Harder theorem for `GL₂` over non-imaginary-quadratic number fields is not.


## Conventions

Throughout, `K` is an imaginary quadratic field: `[Field K] [NumberField K] [IsTotallyComplex K]
[Fact (Module.finrank ℚ K = 2)]`, as the Kleinian-groups roadmap states it, together with a chosen
embedding `ι : K →+* ℂ`. `𝓞 K` is its ring of integers, `d_K = discr K < 0` its discriminant,
`w_K = #(𝓞 K)ˣ ∈ {2, 4, 6}`, `h_K = classNumber K`, and `δ_K = (√d_K)` its different. The level
`𝔫` is a nonzero integral ideal. `K` lives in `Type`, because Mathlib's `Rep ℂ Γ` puts the
coefficient ring and the group in one universe and `ℂ : Type`; nothing else pins a universe.

### Normalizations

| Subject | Convention |
| --- | --- |
| Level | `Γ₀(𝔫) = {γ ∈ GL₂(𝓞_K) : γ₂₁ ∈ 𝔫}`, a **`GL₂`-level** as the LMFDB's knowl `mf.bianchi.level` fixes it. `Γ₀ˢᴸ(𝔫) = Γ₀(𝔫) ∩ SL₂(𝓞_K)` is the `SL₂`-level of the `sl2_dims` tables. |
| Component groups | For a nonzero integral ideal `𝔞`, `Γ₀(𝔫, 𝔞) = {γ ∈ GL₂(K) : γ₁₁, γ₂₂ ∈ 𝓞_K, γ₁₂ ∈ 𝔞⁻¹, γ₂₁ ∈ 𝔞𝔫, det γ ∈ 𝓞_Kˣ}`, the stabilizer in `GL₂(K)` of the pair `𝓞_K ⊕ 𝔞 ⊃ 𝓞_K ⊕ 𝔞𝔫`. `Γ₀(𝔫, 𝓞_K)` is the image of `Γ₀(𝔫)`. Representatives of the ideal classes are integral ideals, one per class, and every statement about the total space is accompanied by its independence of the representatives (1.5). |
| Pairs | A **level-`𝔫` pair** is `(L, M)` with `L ⊂ K²` an `𝓞_K`-lattice and `M ⊂ L` an `𝓞_K`-submodule with `L/M ≅ 𝓞_K/𝔫`. Hecke, degeneracy, Atkin–Lehner and Fricke operators are *defined* on pairs (4.1, 5.1, 5.5), and the matrix formulas are theorems. |
| Central character | For a nonzero ideal `𝔟`, the **central operator** `S_𝔟 (L, M) := (𝔟L, 𝔟M)` moves the Steinitz class by `[𝔟]²` and is the identity on `GL₂(K)`-orbits for principal `𝔟` (the scalar matrix). On the total space of 1.5 the `S_𝔟` act through `Cl(K)` and split it by the unramified central characters `ω : Cl(K) → ℂˣ`; for `h_K > 1` characters `ω ≠ 1` occur (a twist `F ⊗ χ` by an unramified `χ` has central character `χ²`). The LMFDB's forms have **trivial central character**: eigenforms, newforms and every arithmetic invariant live in `H¹_cusp(𝔫)^S`, the subspace fixed by every `S_𝔭` (1.5), which is the whole total space when `h_K = 1`. |
| `ℍ³` and the action | The Kleinian-groups roadmap's `H3 = {p : EuclideanSpace ℝ (Fin 3) // 0 < p 2}`, written `z = (x, y)` with `x = p 0 + i p 1 ∈ ℂ` and `y = height p > 0`; `GL₂(K)` acts through `ι`, the quotient `GL₂(ℂ) → PGL₂(ℂ) = PSL(2, ℂ)` and that roadmap's `pslAction`. The coordinate formula `γ·(x, y) = (((ax + b)conj(cx + d) + a c̄ y²) / (|cx + d|² + |c|² y²), y / (|cx + d|² + |c|² y²))` for `det γ = 1` is that roadmap's `smul_def`; a general `γ` acts through `γ / √(det γ)`, so `(0, −1; N, 0)` sends `(0, y)` to `(0, 1/(|N| y))`. |
| Weight-two forms | ℂ³-valued functions `F = (F₁, F₂, F₃)` on `H3`, identified with the `1`-form `ω_F = F₁ β₁ + F₂ β₂ + F₃ β₃` in the coframe `β₁ = −dx/y`, `β₂ = dy/y`, `β₃ = dx̄/y`. The slash action is pullback: `F ∣ γ := F'` where `ω_{F'} = γ^* ω_F`. The `3 × 3` matrix of the LMFDB's knowl `mf.bianchi.weight2` describes this action on the rescaled vector `(2F₁, F₂, 2F₃)`, the coefficients of `ω_F` in the coframe `(β₁/2, β₂, β₃/2)`; on `F` itself the matrix is conjugated by `diag(2, 1, 2)` (2.1). Pullback is insensitive to scaling `γ`, so forms for `GL₂(𝓞_K)` need no determinant normalization. |
| Harmonic | `dω = 0` and `δω = 0`; hence `Δω = 0` for `Δ = dδ + δd`. For cuspidal forms the converse follows from decay and integration by parts (2.2). The Casimir description of the knowl `mf.bianchi` is a theorem, not the definition. |
| Fourier–Bessel expansion | With `√d_K := i √|d_K|`, `e_α(x) := exp(2πi Tr_{K/ℚ}(αx / √d_K))` and `λ_α := 4π|α| / √|d_K|`, a cuspidal weight-two form on the component `𝔞` has `F₂(x, y) = ∑_{0 ≠ α ∈ 𝔞} c_𝔞(α) y² K₀(λ_α y) e_α(x)`; its other components are `F₁ = ∑ c_𝔞(α) (α / 2|α|) y² K₁(λ_α y) e_α(x)` and `F₃ = ∑ c_𝔞(α) (ᾱ / 2|α|) y² K₁(λ_α y) e_α(x)` (2.4). The **arithmetic coefficient of an integral ideal** is `c(𝔪) := c_𝔞(α)/N𝔞` for `𝔪 = (α)𝔞⁻¹` (2.5). The middle component defines the raw coefficient c_𝔞; the other two are consequences of `dω = 0`. |
| Normalization | A newform is normalized by `c(𝓞_K) = 1`; cohomologically a newform is an eigenline, and the coefficient map is the eigenvalue map (4.5). |
| Hecke operators | On pairs, `T_𝔭 (L, M) = ∑_{L' ⊂ L, L/L' ≅ 𝓞_K/𝔭} (L', M ∩ L')` for `𝔭 ∤ 𝔫` and `U_𝔭 (L, M) = ∑_{L' as above, L' ⊅ M_𝔭} (L', M ∩ L')` for `𝔭 ∣ 𝔫`, where `M_𝔭 ⊃ M` is the sublattice with `L/M_𝔭 ≅ 𝓞_K/𝔭`. On coefficients of forms with trivial central character, `c(𝔪, T_𝔭 F) = c(𝔭𝔪, F) + N𝔭 · c(𝔭⁻¹𝔪, F)` with `c = 0` on non-integral ideals (4.4). `T_𝔭` moves the component of Steinitz class `[𝔞]` to that of `[𝔞𝔭]`. |
| Atkin–Lehner and Fricke | For `𝔮 = 𝔭ᵉ` exactly dividing `𝔫 = 𝔮𝔫'`: `W_𝔮 (L, M) = (M_𝔮, 𝔮L ∩ M_{𝔫'})`, with `M_𝔮`, `M_{𝔫'}` the intermediate lattices of 5.1; `W_𝔫 (L, M) = (M, 𝔫L)` is the Fricke operator. `W_𝔮² = S_𝔮`, so these are involutions of `H¹_cusp(𝔫)^S` (and of the total space when `𝔮` is principal), and for `𝔫 = (N)` principal and `h_K = 1` the Fricke operator is the slash by `(0, −1; N, 0)` (5.5). |
| Sign | `ε(F) := −(eigenvalue of W_𝔫 on F)`, as the knowl `mf.bianchi.sign` fixes it; it equals the sign of the functional equation (6.3). |
| `L`-function | `L(F, s) = ∑_{𝔪} c(𝔪) N𝔪^{−s}` over nonzero integral ideals, **arithmetic normalization**: central point `s = 1`, functional equation `s ↔ 2 − s`, `Λ(F, s) = (d_K² N𝔫)^{s/2} Γ_ℂ(s)² L(F, s)` with `Γ_ℂ(s) = 2 (2π)^{−s} Γ(s)`, conductor `d_K² N𝔫`, motivic weight `1`. In the `L`-functions roadmap's cards this is the `ArithmeticLFunctionData` of weight `1` whose analytic translation has complex gamma shifts `{1/2, 1/2}`. |
| Analytic rank | `ord_{s=1}` of the entire continuation of `L(F, s)`, never of Mathlib's raw `LSeries` (6.5). |
| `L`-ratio | The absolute value of the sum of component relative-symbol pairings against one primitive generator of the global rational new eigenline (6.6); its integral lattice is fixed in 1.6. |
| Twist | `π_F ⊗ (ψ ∘ det)` for a finite-order Hecke character `ψ` has central character `ψ²`; for `ψ² = 1` its newvector gives the Bianchi newform with `c(𝔭, F ⊗ ψ) = ψ(𝔭) c(𝔭, F)` for almost all `𝔭`; it is unique by strong multiplicity one (7.1). |
| Base change | `F` is the base change of a classical newform `f` of weight `2` when `c(𝔭, F) = a_p(f)` for `𝔭 ∣ p` split or ramified and `c(𝔭, F) = a_p(f)² − 2 χ_f(p) p` for `p` inert, at every `p ∤ N_f d_K` (7.3); `f` may have nebentypus `χ_f ∈ {1, χ_K}`, the characters trivial on `N_{K/ℚ}(K^×)`. The LMFDB's integer `bc` is defined in 7.5. |
| CM | `F` has CM when `F ⊗ ψ = F` for a quadratic ray class character `ψ ≠ 1` of `K`; the CM field is the quadratic extension `L_ψ/K`. When `L_ψ = K M` for an imaginary quadratic field `M ≠ K`, the LMFDB's integer `CM` is the discriminant of `M`; `M` is unique (7.7). |
| Rational primes | `p` is **inert** when `p𝓞_K` is prime, equivalently `𝔭 = (p)` for the prime `𝔭` above `p`; otherwise `𝔭 ∣ p` has residue degree `1`. In Lean this is the test `𝔭.asIdeal = Ideal.span {(p : 𝓞 K)}`. |
| No `native_decide` | Finite checks on explicit matrices are `decide` or `norm_num`, as in the Kleinian-groups roadmap. |

## Exact supplier contracts

### From Mathlib

- `NumberField K`, `𝓞 K`, `NumberField.discr`, `NumberField.classNumber`, `ClassGroup (𝓞 K)`
  with `ClassGroup.mk0` and `ClassGroup.mk0_surjective`, `Ideal.absNorm`,
  `Ideal.finite_setOfPred_absNorm_eq`, `IsDedekindDomain.HeightOneSpectrum` with
  `HeightOneSpectrum.isMaximal`, finite residue fields, `FractionalIdeal` with inverses,
  `IsTotallyComplex`.
- `Matrix.GeneralLinearGroup` (`GL (Fin 2) R`), `Matrix.SpecialLinearGroup`,
  `Matrix.ProjectiveSpecialLinearGroup`, `Matrix.GeneralLinearGroup.toLin`, `Projectivization`
  with its `MulAction` instance for any group acting linearly (so for `GL (Fin 2) K` and its
  subgroups), `MulAction.stabilizer`,
  `MulAction.orbitRel.Quotient`, `Subgroup.relIndex`, `Doset`.
- `groupCohomology` with `H1`, `H1π`, `H1IsoOfIsTrivial : H1 A ≅ (Additive G →+ A)` for a
  trivial representation, `Rep.trivial`, and the functoriality `groupCohomology.map`.
- `LSeries`, `LSeries.abscissaOfAbsConv`, `analyticOrderNatAt`, `Complex.Gamma`.
- `WeierstrassCurve`, `WeierstrassCurve.map`, `WeierstrassCurve.baseChange`,
  `WeierstrassCurve.IsElliptic`.
- `Complex.besselJ` is the only Bessel function in Mathlib; `K₀`, `K₁` are consumed from the
  automorphic-forms roadmap's §4.5, not built here.

### From Tau Ceti

- `TauCeti.summable_absNorm_rpow_ideal_iff`
  (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Convergence.lean`): for a number
  field K and real t, the sum of N𝔞^(−t) over nonzero integral ideals converges
  exactly when t > 1; §6.1 applies this twice to the ideal-divisor majorant.
- `TauCeti.normCoeff` and `TauCeti.normCoeff_eq_sum_normFiber`
  (`TauCeti/NumberTheory/ArithmeticDirichletSeries/NormCoeff.lean`), and
  `TauCeti.regroupByNorm`, `TauCeti.LSeriesSummable_normCoeff`, `TauCeti.LSeries_normCoeff`
  (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Regroup.lean`): apply the native
  finite norm sums and absolute-convergence regrouping to the Bianchi ideal coefficients.

- `TauCeti.GlobalNumberFields.Modulus`, `RayClassGroup`, `idealClass`, `integralIdealsPrimeTo`,
  `RayClassCharacter 𝔪 = RayClassGroup 𝔪 →* ℂˣ`, `HeckeCharacter K`, `IsFiniteOrder`,
  `ofRayClassCharacter`, `rayClassCharacterAt`, `isFiniteOrder_iff_exists_rayClassCharacter`
  (`TauCeti/NumberTheory/NumberField/Global/{RayClass,HeckeCharacter}/`).
- `HeckeRing.GL2.Newform N k` with `χ`, `eigenvalue n hn` at indices coprime to `N`, `analyticRank`,
  and, for trivial nebentypus, the Fricke sign of `TauCeti/NumberTheory/ModularForms/LFunction/Sign.lean`
  (`frickeCompletedL_sub_eq` takes `f.χ = 1`).
- `WeierstrassCurve.frobeniusTrace` and `WeierstrassCurve.pointCount` for a Weierstrass curve
  over a finite field (`TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean`), with the
  Hasse bound.
- The abstract Hecke ring `𝕋 Δ H R` of `TauCeti/NumberTheory/HeckeRing/` with its convolution
  product, degree and commutativity criterion; the lattice-pair description of 4.1 is compared with
  the double-coset ring of `(Γ₀(𝔫, 𝔞), Δ₀(𝔫, 𝔞))` in 4.3.
- Nothing on `ℍ³`, Bianchi groups, Bianchi forms, Bessel functions of the second kind, or
  `L`-functions of `GL₂` over number fields: those are the roadmaps named above.

### From named roadmaps

- From ClassicalArithmeticCompletion §7.0(a)–(d): pseudobases of lattices over a
  Dedekind domain, classification by rank and Steinitz class, and simultaneous invariant
  factors for an inclusion. Apply (c) to L and (d) to M ⊂ L with cyclic quotient 𝓞_K/𝔫
  in §0.2; these are distinct inputs (Voight, Theorems 9.3.6, 9.3.9–9.3.10, pp.138–139;
  Weibel, The K-book I§3, Propositions 3.4–3.5, pp.17–18, as located by that supplier).
- From MaassForms §2.1(v): for complex μ, ν with Re μ > |Re ν|,
  ∫₀∞ K_ν(y)y^(μ−1)dy = 2^(μ−2)Γ((μ−ν)/2)Γ((μ+ν)/2)
  (DLMF 10.43.19). Section 6.2 uses ν = 0 and y ↦ λy with λ > 0.
- From ImaginaryQuadraticClassNumber §H1.4: proper invertible ideal Picard groups
  and the surjection on passage to the maximal order; §H3.1: irreducibility and degree
  h(𝒪) of the class polynomial, its CM roots, and complex conjugation acting by inversion
  on their proper ideal classes; §H3.6: the thirteen class-number-one order discriminants.
- From AutomorphicLFunctionsAndLocalFactors §§AL.2.2.1–AL.2.2.5: local last-row levels,
  conductor, Casselman's dimension formula and the normalized Whittaker newvector
  (Casselman, Theorem 1, p.302 and Corollary to the Proof, p.306). Section 5.2 uses
  dimension max(0,r−c(π)+1) with the trivial central character, at every finite place.

- From the [Kleinian-groups roadmap](../KleinianGroups/README.md): `H3` with `volume`, `dist`,
  `height`, the quaternionic Möbius action of `PSL(2, ℂ)` (its Layer 0); discreteness, proper
  discontinuity, fundamental domains and `covolume` (Layer 1); Dirichlet domains and the
  face-pairing criterion `isFundamentalDomain_of_facePairing` (Layer 2); `bianchi F ι` and the
  principal congruence subgroups `bianchiGamma` with their torsion-freeness and indices
  (Layer 3); the two covolumes `catalanConstant / 3` and `√3 · L(2, χ₋₃) / 8` and the
  statement of Humbert's formula (Layer 4). This roadmap adds no second hyperbolic space, no
  second measure, and no second Bianchi group: `Γ₀(𝔫)` is a subgroup of `GL₂(𝓞_K)` mapped into
  `PSL(2, ℂ)` through that roadmap's embedding `ι`.
- From the [arithmetic locally symmetric spaces roadmap](../ArithmeticLocallySymmetricSpaces/README.md):
  the adelic quotient `X_K` and its decomposition into arithmetic quotients (ALS.0.6–0.7), Betti
  cohomology as group cohomology (ALS.1.5), finiteness of Betti cohomology (ALS.2.4), Hecke
  correspondences and their composition (ALS.3.5, ALS.3.8), degeneracy maps and the old-space
  splitting at a prime (ALS.3.14), the boundary triangle (ALS.4.1), unnormalized spherical Satake and its action on
  transported boundary strata (ALS.4.2–4.3, used on a neat cover and descended over ℚ),
  and automorphic forms, constant
  terms and cusp forms (ALS.F.6).
- From the [modularity-and-Langlands-extensions roadmap](../ModularityAndLanglandsExtensions/README.md):
  the planned adelic eigenform carrier, normalized ideal coefficients and associated
  cuspidal representation (§4.27); the planned Hecke-equivariant isomorphism and its inverse
  between adelic cusp forms of weight `k` and parabolic cohomology of
  `Y₁(𝔫)` over **all** ideal classes (§4.26); the Ramanujan bound
  `|c(𝔭, f)| ≤ 2 N𝔭^{(k−1)/2}` (§4.40) and its cohomological form (§4.43).
- From the [automorphic-forms roadmap](../AutomorphicFormsOnReductiveGroups/README.md): the
  `K`-Bessel function `K_ν(u) = ∫₀^∞ e^{−u cosh t} cosh(νt) dt` with its differential equation
  `u²K'' + uK' − (u² + ν²)K = 0`, `K_ν = K_{−ν}` and the asymptotic `√(π/2u) e^{−u}` (§4.5), and
  the `GL₂` adelization dictionary (§§7.2–7.3). Only `K₀` and `K₁` occur here.
- From the [`GL₂` automorphic representations roadmap](../GL2AutomorphicRepresentationsAndTransfer/README.md):
  cuspidal automorphic representations of `GL₂(𝔸_K)`, their Whittaker expansions and strong
  multiplicity one (R16.4), the classical-to-adelic dictionary over `ℚ` (R16.6.1), the unramified
  base-change Satake rule (R17.4.1), quadratic base change (R17.4.2), all-place Weil–Deligne restriction including wild places
  (R17.4.3), and its cuspidality
  criterion (R17.4.5).
- From the [elliptic-curve modularity roadmap](../EllipticCurveModularityImaginaryQuadratic/README.md):
  `imaginary_quadratic_modularity`, the automorphic representation `π_E` of every elliptic
  curve `E/K`, cuspidal for geometrically non-CM `E`, with `L(E/K, s) = L(π_E, s − 1/2)`.
- From the [`L`-functions roadmap](../LFunctions/README.md): the analytic card
  `AnalyticLFunctionData` with `HasFunctionalEquation`, `ArithmeticLFunctionData` and the
  normalization translation (Layer 0), and the Grossencharacter cards `grossencharacterData`
  (Layer 6) that the CM forms' `L`-functions factor through.
- From the [modular-forms roadmap](../ModularForms/README.md) and Tau Ceti: the classical
  newform carrier `HeckeRing.GL2.Newform N k` with `eigenvalue`, `χ` and `analyticRank`
  (Layers 4 and 6 there), the Fricke sign for **trivial nebentypus** (Layer 7 there; Tau Ceti's
  `frickeCompletedL_sub_eq`, stated for `f.χ = 1`, the only case 6.4 uses), CM forms as
  self-twists (Layer 9), and the conjugate newform `f^σ` (Layer 8G).
- From the [global-number-fields roadmap](../GlobalNumberFields/README.md) and Tau Ceti:
  `Modulus`, `RayClassGroup`, `idealClass`, `RayClassCharacter`, `HeckeCharacter`,
  `IsFiniteOrder`, `isFiniteOrder_iff_exists_rayClassCharacter` (Layers 2 and 9), and
  `rayClassQuotient` with `ker_rayClassQuotient`.
- From the [class-field-theory roadmap](../ClassFieldTheory/README.md): Tau Ceti's `classField`,
  the class field `globalClassField K N` of an open finite-index subgroup `N ≤ C_K` with
  `globalClassField_index` (Layer 12), the ray-class Artin map with `rayClassArtinMap_idealClass`
  (Layer 12), and the arithmetic Frobenius normalization `globalArtinMap_isArithFrobAt`
  (Layer 11). That roadmap names neither the field cut out by a ray class character nor the
  splitting dictionary `ψ(𝔭) = 1 ⟺ 𝔭` splits; both are built here from these declarations (7.1).
- From the [elliptic-curves roadmap](../EllipticCurves/README.md) and Tau Ceti: base change of
  Weierstrass curves (Layer 0.5), `frobeniusTrace` and `pointCount` over finite fields (Layer 3),
  the local conductor exponent and the conductor ideal `𝔫_E` of a curve over a number field
  (Layer 4), and complex multiplication of a curve (Layer 1).

## How to read the build

Layer 0 builds the arithmetic quotients and cusps. Layer 1 supplies their cohomology and
integral lattices; Layers 2–3 identify harmonic forms with that cohomology and establish the
compactified homology pair. Layers 4–5 build all-prime correspondences, new eigenlines and
the rational relative pairing. Layer 6 supplies the functional equation and period ratio;
Layers 7–8 compare twists, base change, CM and elliptic curves. Layer 9 proves the cellular
presentation and the full level-one vanishing classification. Each target lists the inputs
needed by its statement or proposed proof route.

## Layer 0: the groups and the cusps

### 0.1 The level and its invariants

Define `Γ₀(𝔫) : Subgroup (GL (Fin 2) (𝓞 K))` by `γ₂₁ ∈ 𝔫` , `Γ₁(𝔫)` by additionally `γ₂₂ ≡ 1 mod 𝔫`, and `Γ(𝔫)` as the kernel of
reduction mod `𝔫` ; `Γ₀ˢᴸ(𝔫)` is the intersection with
`SL₂(𝓞 K)` (the comap along `Matrix.SpecialLinearGroup.toGL`). Prove `Γ(𝔫) ⊴ Γ₁(𝔫) ⊴ Γ₀(𝔫)`, `Γ₀(𝔫)/Γ₁(𝔫) ≃* (𝓞_K/𝔫)ˣ` through `γ ↦ γ₂₂`,
and the index formula

```text
[GL₂(𝓞_K) : Γ₀(𝔫)] = #ℙ¹(𝓞_K/𝔫) = N𝔫 · ∏_{𝔭 ∣ 𝔫} (1 + 1/N𝔭),
```

by surjectivity of reduction `SL₂(𝓞_K) → SL₂(𝓞_K/𝔫)` (consume the Kleinian-groups roadmap's
Layer 3 surjectivity for principal congruence subgroups, stated there for `PSL₂` and lifted here)
and the transitive action of `SL₂(𝓞_K/𝔫)` on `ℙ¹(𝓞_K/𝔫)`. Reduction `GL₂(𝓞_K) → GL₂(𝓞_K/𝔫)` is
not onto in general, since `det` would need `𝓞_Kˣ → (𝓞_K/𝔫)ˣ` onto (for `ℚ(√−2)` and `𝔫 = (5)`,
`{±1}` against a group of order `24`); the `SL₂` route is what the index needs. Define the **level norm** `N𝔫 =
Ideal.absNorm 𝔫`, the **level bad primes** (rational primes dividing `N𝔫`) and the **field bad
primes** (rational primes dividing `d_K`), the two search filters of the LMFDB. Compare with the
Kleinian-groups roadmap: the image of `Γ(𝔫) ∩ SL₂(𝓞_K)` in `PSL(2, ℂ)` under `ι` is its
`bianchiGamma K ι 𝔫`.

- For nonzero level, the three congruence groups have the stated normal inclusions and Γ₀/Γ₁ is the lower-right unit quotient.
- Reduction through SL₂ identifies the Γ₀ index with the projective-line cardinality; the level norm and its rational prime support are invariant under equality of ideals.

**Checks.**

- At unit level the reduction target is the zero ring; Γ(𝓞_K) = Γ₀(𝓞_K) and the index is 1.
- At Gaussian prime norm 5 the index is 5(1+1/5) = 6.
- For 𝔫 = 0 the norm is 0 and the finite-index formula is excluded; it is not a limiting case of the product.

*Needs:* Mathlib ideal quotient and Chinese remainder theorem; KleinianGroups Layer 3 reduction surjectivity.

### 0.2 The component groups

Define Γ₀(𝔫, 𝔞) ≤ GL₂(K) by the conditions in Conventions (`Gamma0Component`),
for nonzero 𝔫 and 𝔞. Fix an integral representative 𝔞_c of each ideal class using
`ClassGroup.mk0_surjective`, and write Γ₀(𝔫)_c = Γ₀(𝔫, 𝔞_c).

- Identify this group with the stabilizer of the pair
  (𝓞_K ⊕ 𝔞, 𝓞_K ⊕ 𝔞𝔫), for the action through `Matrix.GeneralLinearGroup.toLin`.
- At 𝔞 = 𝓞_K it is the image of Γ₀(𝔫) under the inclusion `toGLK`.
- For x ∈ K× with x𝔞 integral, conjugation by diag(1,x) identifies Γ₀(𝔫,𝔞)
  with Γ₀(𝔫,x𝔞); any two component groups are commensurable.
- Level-𝔫 pairs of fixed Steinitz class form one GL₂(K)-orbit, and their orbit set is
  Cl(K). Use ClassicalArithmeticCompletion §7.0(c) for the ambient rank-two lattice
  and §7.0(d) for the inclusion: the invariant factors are (1,𝔫), so the representative
  pair has class [𝔞]. This is the level-pair specialization of those classifications.

**Checks.**

- For 𝔞 = 𝓞_K the off-diagonal conditions are b ∈ 𝓞_K and c ∈ 𝔫.
- For 𝔞 = (2) and unit level, (1,1/2;0,1) preserves 𝓞_K ⊕ (2) but not 𝓞_K².
- Conjugation by diag(1,2) sends b to b/2 and c to 2c, agreeing with the two fractional-ideal conditions.
- For I = (2,1+√−5), st(𝓞_K ⊕ I) = [I] ≠ 1, whereas st(I ⊕ I) = [I]² = 1;
  the first lattice cannot be identified with 𝓞_K².

*Needs:* Mathlib fractional ideals and class group; ClassicalArithmeticCompletion
§7.0(a)–(d) pseudobases, Steinitz classification and simultaneous invariant factors;
§0.1 level structure.

### 0.3 Discreteness and the hyperbolic quotient

Prove that the image of `Γ₀(𝔫, 𝔞)` in `PSL(2, ℂ)` is discrete and cofinite, by commensurability
with the image of `SL₂(𝓞_K)` (Kleinian-groups Layer 3, `isDiscrete_bianchi`, and Layer 4's finite
covolumes for `d_K = −3, −4`). For every imaginary quadratic K construct the **translation Ford region**
F̃_K = {(x,y) : x ∈ P_K, |cx+d|²+|c|²y² ≥ 1 for every primitive (c,d), c ≠ 0},
where P_K is a translation parallelogram for 𝓞_K. The effective stabilizer of infinity
in PSL₂(𝓞_K) also contains x ↦ u²x, for u ∈ 𝓞_K×, of order w_K/2.
Choose a measurable fundamental sector Q_K for 𝓞_K ⋊ (𝓞_K×)² on ℂ, with boundary
identifications, and define the **folded Ford region** F_K by the same hemisphere
inequalities with x ∈ Q_K.

- Prove Swan's finite-sidedness: only finitely many primitive hemispheres contribute
  faces over a translation cell, with an upper bound B_K on |c|² for these faces.
- Prove that F_K is a fundamental region up to its identified boundary: choose a
  maximum-height representative, then its representative in Q_K. Distinct interior
  representatives cannot be related by a non-cuspidal matrix (the hemisphere inequality
  would be strict in one direction) or by a cusp rotation. Singular boundary cusps
  account for the nonprincipal ideal classes; no union of copies of F̃_K removes rotations.
- Prove finite volume, including neighborhoods of every cusp class, and generic
  multiplicity w_K/2 for F̃_K relative to F_K. Use the face-pairing criterion for the
  resulting sector and its paired faces (Swan, geometric construction, pp.1–77).

The
explicit hemisphere lists for the nine class-number-one fields are 9.4. For the projective image G of Γ₀(𝔫, 𝔞), put P = PSL₂(𝓞_K) and H = G ∩ P.
Derive vol(G) = [P:H] vol(P)/[G:H] from the supplier's index law applied to the two
inclusions of H (Cremona, §2.2, p.283, for the index-two projective GL₂/SL₂ comparison), and the quotient `Y₀(𝔫, 𝔞) = Γ₀(𝔫, 𝔞) \ H3` as an orbifold of
finite volume. Record the units: `diag(u, 1) ∈ Γ₀(𝔫, 𝔞)` for `u ∈ 𝓞_Kˣ` acts on `H3` by
`(x, y) ↦ (ux, y)`, a rotation about the vertical axis, so `Y₀(𝔫, 𝔞)` is the quotient of the
`SL₂`-quotient `(Γ₀(𝔫, 𝔞) ∩ SL₂(K)) \ H3` by a group of order `2`: `det` identifies
`Γ₀(𝔫, 𝔞) / (𝓞_Kˣ · (Γ₀(𝔫, 𝔞) ∩ SL₂(K)))` with `𝓞_Kˣ/(𝓞_Kˣ)²`, of order `2` for every `K`,
generated by `diag(ζ, 1)` for a generator `ζ` of `𝓞_Kˣ` (`ζ = −1`, `i`, or a primitive sixth
root of unity), since `diag(v², 1) = v · diag(v, v⁻¹)`.

**Checks.**

- At unit level in the principal component, H = P and [G:H] = 2, giving vol(G) = vol(P)/2.
- For K = ℚ(i) this is Catalan/6, whereas vol(P) = Catalan/3.
- In the centered Gaussian square (1/4,2) and (−1/4,2) have hemisphere values
  at least 4 > 1 and are identified by diag(i,−i). Thus F̃_K has volume 2·Catalan/3;
  selecting one rotation sector gives vol(F_K) = Catalan/3.
- For the Eisenstein field the effective rotation order is 6/2 = 3, so
  vol(F̃_K) = 3 vol(F_K); the two regions cannot both have quotient covolume.
- For G ≤ P of index m the intersection is G, giving m·vol(P); the two-index
  formula recovers the supplier's inclusion case.

*Needs:* §0.2 commensurability; KleinianGroups Layers 1–4 fundamental domains and index law.

### 0.4 Cusps and cusp stabilizers

The cusps of `Γ ≤ GL₂(K)` are the orbits `Γ \ ℙ¹(K)`, with `ℙ¹(K) = Projectivization K (Fin 2 → K)`
and Mathlib's action of `GL (Fin 2) K` restricted to `Γ` (`Suggested.lean`: `cusps`, the
`MulAction.orbitRel.Quotient`). Define the **cusp stabilizer** `Γ_c = MulAction.stabilizer Γ c`. Prove: the stabilizer of `∞ = [1 : 0]` in `Γ₀(𝔫, 𝔞)` is
`{(a, b; 0, d) : a, d ∈ 𝓞_Kˣ, b ∈ 𝔞⁻¹}`, an extension of a finite group by the translation lattice
`𝔞⁻¹`. For an arbitrary cusp c choose σ_c ∈ GL₂(K) with σ_c ∞ = c. The group
Γ_c ∩ σ_c N(K) σ_c⁻¹ is a rank-two translation lattice. After quotienting scalar units,
Γ_c is an extension of this lattice by the actual finite image of its diagonal ratio a/d;
this image depends on the cusp and need not be the full unit group (N is upper unipotent). The cusps of `Γ₀(𝔫, 𝔞)` are finite in number
(the orbits of `Γ₀(𝔫, 𝔞) \ GL₂(K) / B(K)`, finite because `GL₂(𝓞_K)`-orbits on `ℙ¹(K)` are the
`h_K` ideal classes and the intersection of Γ₀(𝔫, 𝔞) with GL₂(𝓞_K) has finite index in both).
This is the commensurability argument, using the cusp-class bijection in Vogtmann, §2,
(2.2), p.400.

- The stabilizer of infinity has translation lattice 𝔞⁻¹ and upper-triangular unit diagonal.
- For every cusp the conjugated unipotent intersection has rank two; the quotient by translations and scalars is its actual finite diagonal-ratio image.
- Conjugate cusp representatives have conjugate stabilizers, and arithmetic component groups have finitely many cusp orbits.

**Checks.**

- At infinity the translation lattice is 𝔞⁻¹, of ℤ-rank 2.
- At cusp 0, Γ_c ∩ N(K) = {1}, of rank 0; the conjugated unipotent group gives rank 2.
- For K = ℚ(i), π = 2+i and level (π²), the cusp 1/π forces a ≡ d mod π
  in cusp coordinates. The four units have distinct residues in 𝔽₅, so a = d and the
  rotation group has order 1, whereas its order at infinity is 4.

*Needs:* §0.2 commensurability; the projective action and finite covolume from §0.3.

### 0.5 The cusp count for class number one

For `h_K = 1`: the cusps of `Γ₀(𝔫)` are in bijection with the pairs `(𝔡, ū)` where `𝔡 ∣ 𝔫` and
`ū ∈ (𝓞_K/𝔤_𝔡)ˣ / im(𝓞_Kˣ)`, `𝔤_𝔡 := 𝔡 + 𝔫𝔡⁻¹`; for primitive coordinates [a:b], let 𝔡 = (b)+𝔫 and choose its generator δ.
The unit residue is a(b/δ) mod 𝔤_𝔡. Multiplying (a,b) by a unit t multiplies the
residue by t². An element of Γ₀(𝔫) multiplies it modulo 𝔤_𝔡 by its determinant;
for Γ₀ˢᴸ(𝔫) only the coordinate-square ambiguity remains. Replacing δ by vδ transports
the residue by v⁻¹. Prove that these operations give a bijection; the proof is the
primitive-column reduction modulo 𝔫 and the Chinese remainder theorem, applied separately
at each prime power (compare Cremona, §2.1, Lemma 2.1.5, p.282, in the rational case). Hence

```text
#cusps Γ₀(𝔫) = ∑_{𝔡 ∣ 𝔫} #( (𝓞_K/𝔤_𝔡)ˣ / im 𝓞_Kˣ ),      #cusps Γ₀ˢᴸ(𝔫) = ∑_{𝔡 ∣ 𝔫} #( (𝓞_K/𝔤_𝔡)ˣ / im (𝓞_Kˣ)² ).
```

The `SL₂` version replaces the units by their squares, because the stabilizer of `∞` in
`SL₂(𝓞_K)` acts on `[c : d]` through `d ↦ u⁻² d`. Checks: `Γ₀(𝔭)` has `2` cusps for every prime
`𝔭`; over `ℚ(i)`, `Γ₀((2 + i)²)` has `3` cusps while `Γ₀ˢᴸ((2 + i)²)` has `4`, because the units
`{±1, ±i}` map onto `𝔽₅ˣ` (`i ≡ 3 mod (2 + i)`) but their squares only onto `{±1}`. For `h_K > 1`
the count is the sum over components of the orbit description of 0.4, and is stated as that
sum; no principal-coordinate parametrization is asserted for a nonfree component lattice.

**Checks.**

- At prime level, the two divisor classes give two cusps.
- At Gaussian level (2+i)² the GL₂ and SL₂ counts are 3 and 4 respectively.
- The translation matrix (1,1;0,1) sends [0:1] to [1:1]; both denominators give
  𝔡 = 𝓞_K, so the cusp invariant is unchanged.

*Needs:* §0.1 reduction; §0.4 cusp orbits; the Chinese remainder theorem.

### 0.6 Finite generation and presentations

Prove that `Γ₀(𝔫, 𝔞)` is finitely generated and finitely presented, from the finite-sidedness of a
fundamental polyhedron of a finite-index subgroup (Kleinian-groups Layer 2, `dirichletDomain`;
the Poincaré polyhedron theorem for face pairings is a target there, and the finite generation
from a finite-sided Dirichlet domain is proved here) together with the Reidemeister–Schreier
passage to finite-index subgroups (Mathlib's `Subgroup.fg_of_index_ne_zero`). For `d_K ∈ {−3, −4}`
state the explicit presentations of `PSL₂(𝓞_K)` (Swan; the Kleinian-groups roadmap's Layer 3
carries the generators): `PSL₂(ℤ[i]) = ⟨a, l, t, u ∣ a² = l² = (al)² = (tl)² = (ul)² = (at)³ =
(ual)³ = [t, u] = 1⟩` with `a = (0, −1; 1, 0)`, `l = (−i, 0; 0, i)`, `t = (1, 1; 0, 1)`,
`u = (1, i; 0, 1)`, whose abelianization is `(ℤ/2)²`; the verification that the eight relations
hold is a `decide` on `2 × 2` matrices, and completeness of the presentation is the theorem
(Şengün §2.3, p.6, for the geometric presentation method).

**Checks.**

- In the Gaussian presentation, a² = l² = −I, hence both equal 1 projectively.
- The translations t and u commute: their upper-right entries add to 1+i in either order.
- Abelianizing the displayed relations gives 2a = 2l = 0, t = a and u = a+l, hence (ℤ/2)².

*Needs:* §0.3 finite-sided domains; KleinianGroups Layer 2 face pairings; Mathlib Subgroup.fg_of_index_ne_zero.

### Examples

At Gaussian level (2+i)² the GL₂ and SL₂ cusp counts are 3 and 4 (§0.5).

### Dependencies

Mathlib number fields, ideals and matrix groups; ClassicalArithmeticCompletion §7.0; KleinianGroups Layers 0–4.

## Layer 1: cohomological Bianchi forms

### 1.1 The cohomology space

For `Γ ≤ GL₂(K)` define `H¹(Γ, ℂ) := groupCohomology.H1 (Rep.trivial ℂ Γ ℂ)` (`Suggested.lean`:
`H1`) and the comparison `H¹(Γ, ℂ) ≃ₗ[ℂ] (Additive Γ →+ ℂ)`, Mathlib's `H1IsoOfIsTrivial`
(`homEquiv`, a real body). State the restriction
`res_S : H¹(Γ, ℂ) → H¹(S, ℂ)` for a subgroup `S` as `groupCohomology.map S.subtype` and prove that
under the comparison it is precomposition with the inclusion.

- For every group Γ in Type, the trivial-coefficient H¹ comparison is a complex linear equivalence with additive homomorphisms.
- Restriction to a subgroup becomes precomposition with its inclusion under this equivalence.

**Checks.**

- For the trivial group H¹ = 0 and Hom(1,ℂ) = 0.
- For Γ = ℤ, evaluation on 1 identifies both sides with ℂ.
- For Γ = S₃, its abelianization has order 2 and both sides are zero over ℂ; this excludes using arbitrary functions on Γ.

*Needs:* Mathlib groupCohomology.H1IsoOfIsTrivial and Rep.trivial.

### 1.2 Cuspidal and Eisenstein parts

Define the **cuspidal** (parabolic) subspace

```text
H¹_cusp(Γ, ℂ) := ⋂_{c ∈ ℙ¹(K)} ker ( res : H¹(Γ, ℂ) → H¹(Γ_c, ℂ) ),
```

the homomorphisms `Γ → ℂ` vanishing on every cusp stabilizer (`Suggested.lean`: `cuspidalHom` on
the `Hom` model, `cuspidalH1` on `H¹`). Prove that it suffices to intersect over one cusp per
`Γ`-orbit, and that it equals the kernel of restriction to the translation
subgroups `Γ_c ∩ σ_c N(K) σ_c⁻¹` alone, for Γ a component group or a finite-index subgroup of one, (a homomorphism to `ℂ` kills the torsion of `Γ_c`). Define the
**Eisenstein** quotient `H¹_Eis := H¹ / H¹_cusp` and, for these arithmetic Γ, prove `dim H¹_Eis(Γ) = #{cusps c : the image
of Γ_c in PGL₂(ℂ) is a translation lattice}`, the cusps whose stabilizer contains no rotation,
equivalently every `γ ∈ Γ_c` is a scalar times a unipotent matrix (`tr(γ)² = 4 det γ`): a rotation
`x ↦ ux` with `u ≠ 1` kills `H¹(Γ_c, ℂ)`, while a translation lattice has `H¹(Γ_c, ℂ) = ℂ²`; the
image of restriction to the boundary is a Lagrangian half of `⊕_c H¹(Γ_c, ℂ)` (the boundary
triangle ALS.4.1 and Poincaré duality on the Borel–Serre compactification). For the `GL₂`-groups
`Γ₀(𝔫, 𝔞)` the cusps `∞` and `0` never count, for every `K`: `diag(−1, 1)` fixes both and acts as
the rotation `x ↦ −x`. A form is **cuspidal** (the LMFDB's `cuspidal` flag) when its class lies in
`H¹_cusp`. Check: for `PSL₂(ℤ[i])` and `PSL₂(ℤ[ω])` the single cusp has a rotating stabilizer, so
`H¹_Eis = 0` and `H¹(Γ, ℂ) = H¹_cusp(Γ, ℂ)`, while for `PSL₂(𝓞_K)` with `w_K = 2` and `h_K = 1`
the single cusp has stabilizer `{±(1, b; 0, 1)}` and contributes `dim H¹_Eis = 1`; for
`GL₂(𝓞_K) = Γ₀(𝓞_K)` with the same `K` it contributes `0`.

- Cusp-restriction kernels are complex submodules and are unchanged when one takes one cusp from each orbit.
- For arithmetic Γ, translation-subgroup restrictions have the same common kernel as full stabilizer restrictions.
- The quotient by that kernel has dimension the number of translation-only cusps, with no contribution from a rotating cusp.

**Checks.**

- For PSL₂(ℤ[i]) a rotating cusp has invariant boundary H¹ of dimension 0 and Eisenstein dimension 0.
- For the scalar-unit cusp of PSL₂(𝓞_K), w_K = 2, its boundary H¹ has dimension 2 and the restriction image has dimension 1.
- For the GL₂ cusp the rotation by −1 kills that boundary H¹, giving 0 rather than 1.

*Needs:* §0.4 cusp stabilizers; §0.6 arithmetic finiteness; ArithmeticLocallySymmetricSpaces ALS.4.1 boundary triangle.

### 1.3 Weights and coefficient modules

For `k ≥ 2` define the coefficient module `E_k := Sym^{k−2}(ℂ²) ⊗ conj(Sym^{k−2}(ℂ²))` as a
representation of `GL₂(K)` through `ι`, where `conj` is the representation twisted by complex
conjugation, and `H¹(Γ, E_k)`, `H¹_cusp(Γ, E_k)` with the same kernel definition. `E_2 = ℂ` is the
trivial representation and 1.1–1.2 are the case `k = 2`. Record dimensions with both the coefficient parameter and the group or total component space.
use k for the cohomological parameter and m for the analytic parameter of
LMFDB knowl mf.bianchi.weight. The minimal SU₂-type is Sym^(2k−2), so m = 2k−2,
its dimension is 2k−1, and dim E_k = (k−1)². A dimension table indexed by m is therefore
read at k = (m+2)/2; the two indices coincide only at 2. The LMFDB table renderer reads the stored weight keys unchanged
(lmfdb/bianchi_modular_forms/bianchi_modular_form.py, bmf_field_dim_table, weight-key loop).
A stored dimension is compared with this cohomology using its coefficient-module convention;
the analytic weight knowl alone is not a definition of the table's coefficient parameter.
(ModularityAndLanglandsExtensions §4.41; Şengün §3, pp.7–8, for the coefficient modules).

- At k = 2 the coefficient representation is trivial, and its cohomology and restriction kernel agree with §§1.1–1.2.
- For k ≥ 2 the coefficient module has dimension (k−1)² and minimal analytic type of dimension 2k−1.
- The cuspidal restriction kernel for unequal exponents a ≠ b is zero under the supplied adelic comparison.

**Checks.**

- At k = 2, dim E_k = 1 and the minimal type has dimension 3.
- At k = 3 these dimensions are 4 and 5, and the analytic index is m = 4.
- At k = 4 they are 9 and 7, and m = 6; m = k would give the wrong dimension 5.

 Prove that the
unequal-weight modules `Sym^a ⊗ conj Sym^b`, `a ≠ b`, have zero cuspidal `H¹` (consume the
Langlands-extensions roadmap's §4.26 remark through its adelic comparison; the vanishing is
Harder's), so only the parallel weights carry forms.

*Needs:* §1.2 restriction kernels; ModularityAndLanglandsExtensions §§4.26 and 4.41.

### 1.4 Finite dimensionality

Prove `FiniteDimensional ℂ (H¹(Γ₀(𝔫, 𝔞), E_k))`: from 0.6, `Hom(Γ, ℂ)` is finite-dimensional
for finitely generated `Γ`, and for `k > 2` from finite presentation (the `1`-cocycles are
determined by their values on generators; Şengün §3.1, p.10, describes this cocycle construction). Independently, identify `H¹(Γ₀(𝔫, 𝔞), E_k)` with the
Betti cohomology of `Y₀(𝔫, 𝔞)` with the local system of `E_k` (ALS.1.5, for the torsion-free
finite-index subgroups, and descent to the finite quotient) and consume ALS.2.4's finiteness as the
second proof. Record `dim H¹(Γ₀(𝔫, 𝔞), ℂ) = dim H¹_cusp + dim H¹_Eis` with 1.2's count.

*Needs:* §0.6 finite presentation; §1.1 cocycles; ArithmeticLocallySymmetricSpaces ALS.1.5 and ALS.2.4.

### 1.5 The total space over the ideal classes

Define `H¹_cusp(𝔫, E_k) := ⊕_{c ∈ Cl(K)} H¹_cusp(Γ₀(𝔫)_c, E_k)` (a product over the finite `ClassGroup (𝓞 K)`, with representatives
chosen through `ClassGroup.mk0_surjective`) and prove its independence of the
representatives: for `𝔞' = x𝔞`, conjugation by `diag(1, x)` induces an isomorphism
`H¹_cusp(Γ₀(𝔫, 𝔞)) ≃ H¹_cusp(Γ₀(𝔫, 𝔞'))`, and the composite of two such is the third.

Define the **central operators** `S_𝔟` on the total space (the target central, an endomorphism
of the total space for each nonzero integral ideal `𝔟`), from the
pair map `(L, M) ↦ (𝔟L, 𝔟M)` of the pinned conventions: `(𝔟 ⊕ 𝔟𝔞, 𝔟 ⊕ 𝔟𝔞𝔫)` has Steinitz class
`[𝔟²𝔞]`, a `g ∈ GL₂(K)` carries the representative pair of that class onto it, and conjugation by
`g` is an isomorphism `Γ₀(𝔫, 𝔞_{[𝔟²𝔞]}) ≅ Γ₀(𝔫, 𝔞)` (homothetic pairs have the same stabilizer),
which induces `S_𝔟 : H¹_cusp(Γ₀(𝔫)_c, E_k) → H¹_cusp(Γ₀(𝔫)_{c[𝔟]²}, E_k)`, normalized by
`N𝔟^{2−k}` so that the scalar `β ∈ Kˣ`, which acts on `E_k` by `N(β)^{k−2}`, gives the identity.
Prove: `S_𝔟` is independent of `g`, `S_{𝔟𝔠} = S_𝔟 S_𝔠`, and `S_{(β)} = 1`
(central_span_singleton), so `𝔟 ↦ S_𝔟` factors through `Cl(K)` and the total space is the
direct sum of its eigenspaces for the characters `ω` of `Cl(K)`. Define the
**trivial-central-character subspace** `H¹_cusp(𝔫, E_k)^S := {F : S_𝔭 F = F for every prime 𝔭}`
(trivialCentral), the space of the LMFDB's forms; it equals the total space when `h_K = 1`.

Prove that
the total space is the cohomology of the adelic quotient: `Y₀(𝔫) := X_{K₀(𝔫)}` of ALS.0.6 for
`G = GL₂/K` and `K₀(𝔫) = ∏_v Γ₀(𝔫𝓞_v)`, whose components are the `Y₀(𝔫, 𝔞_c)` (ALS.0.7 with
`det K₀(𝔫) = Ô_Kˣ`, so the component set is `K^× \ 𝔸_{K,f}^× / Ô_Kˣ = Cl(K)`), and
`H¹_cusp(𝔫, E_k) ≅ H¹_cusp(Y₀(𝔫), E_k)` as the ALS roadmap defines the cuspidal part (kernel of
restriction to the Borel–Serre boundary), under which `S_𝔟` is the action of the central idele
of `𝔟`. For `h_K = 1` the total space is `H¹_cusp(Γ₀(𝔫), E_k)`.

- Conjugation transports the component cohomology, and successive representative changes compose to the direct change.
- Central operators multiply with their ideals and are trivial on principal ideals after the stated weight normalization.
- Their common fixed space is a submodule, equals the total space at class number one, and matches the trivial-central-character adelic space.

**Checks.**

- For `h_K = 1` (the nine fields of 9.4, e.g. `K = ℚ(i)`) every `S_𝔟` is the identity and
  `H¹_cusp(𝔫)^S` is the whole total space, at every level.
- `S_{(β)} = 1` for every `β ∈ 𝓞_K ∖ {0}`. Over `K = ℚ(√−23)` (`Cl(K) ≅ ℤ/3`) a prime `𝔭 ∣ 2`
  is nonprincipal of order `3`, so `S_𝔭` carries the component of class `c` to that of
  `c[𝔭]² ≠ c`.
- (reject) Over `ℚ(√−23)`, the base change `F` of `11a1` (level `(11)`, `11` inert) has
  `a_𝔭(F) = a₂(11a1) = −2` at the nonprincipal primes `𝔭 ∣ 2`; its twist by an order-`3`
  character `χ` of `Cl(K)` lies in the total space at level `(11)` with central character
  `χ² ≠ 1` and the non-real eigenvalue `−2χ(𝔭)`, and it is not in `H¹_cusp((11))^S`.

*Needs:* §0.2 component conjugation; §1.2 cuspidality; ArithmeticLocallySymmetricSpaces ALS.0.6–0.7.

### 1.6 Rational and integral structures

For arbitrary Γ ≤ GL₂(K), define rational and integral group cohomology using the
trivial representations. The finiteness and scalar-extension theorems below assume that Γ
is a component group Γ₀(𝔫, 𝔞) or a subgroup of finite index in one, with 𝔫, 𝔞 nonzero.
Prove H¹_cusp(Γ, ℚ) ⊗ ℂ ≅ H¹_cusp(Γ, ℂ), and that H¹(Γ, ℤ) modulo torsion is a
full lattice in H¹(Γ, ℚ). Use H¹(Γ,A) = Hom(Γ_ab,A) for trivial coefficients:
§0.6 gives finitely generated Γ_ab, so its free quotient is ℤʳ and the Hom groups
are ℤʳ, ℚʳ and ℂʳ. The finitely many cusp restrictions are integer matrices;
flat scalar extension preserves their common kernel. This is the degree-one
finite-generation argument (Şengün §3.1, p.8, abelianization, and p.10, cocycles),
not an unrestricted scalar-extension theorem for arbitrary Γ.
Define its cuspidal lattice by intersection with rational cuspidal cohomology. Define the
global lattice as the direct sum of these lattices over all ideal classes; intersection with
the rational new and central-invariant subspaces gives the lattice used in §6.6.

For k > 2 use the component lattice L_𝔞 = 𝓞_K ⊕ 𝔞 and
E_k(L_𝔞) = Sym^(k−2)(L_𝔞) ⊗ conjugate(Sym^(k−2)(L_𝔞)), inside E_k(K).
This specializes the integral algebraic coefficient construction of
ArithmeticLocallySymmetricSpaces ALS.F.7 (integral algebraic coefficient lattices,
with conjugation transport) to the component lattice. Its symmetric powers and tensor
product are functorial on projective lattices, so stabilization follows from §0.2;
Şengün §3, p.8, specifies the polynomial action and its conjugate tensor factor.

- Every component group preserves its own coefficient lattice; conjugation transports
  both the group and the lattice.
- An inclusion of component lattices induces the corresponding integral symmetric-tensor
  map; on dual coefficients it induces the map in the reverse direction. Specify these
  maps, restriction and transfer on the two legs of every integral correspondence.
- At weight two the coefficient maps are identities on ℤ. All Hecke integrality claims
  in the arithmetic layers concern this weight; higher-weight normalizations belong to
  ModularityAndLanglandsExtensions §4.27.

- For arithmetic Γ the integral Hom lattice spans rational H¹, and the common cusp-restriction kernel commutes with extension to ℂ.
- Intersecting that lattice with the rational cuspidal, new and central-invariant subspaces gives their full lattices.
- The symmetric-tensor lattice is stable under its component group; conjugation transports both data, with reverse maps on dual coefficients.

**Checks.**

- For Γ = ℤ with trivial coefficients, H¹(Γ, ℤ) ⊗ ℚ = ℤ ⊗ ℚ = ℚ = H¹(Γ, ℚ).
- For the non-arithmetic rational translation group Γ = (ℚ,+), Hom(Γ,ℤ) = 0 but
  Hom(Γ,ℚ) = ℚ. Thus the integral lattice assertion fails without finiteness.
- For 𝔞 = (2), γ = (1,1/2;0,1) sends 2e₂ to e₁+2e₂ and preserves L_𝔞.
  At k = 3 the tensor model on 𝓞_K² instead produces coefficient 1/4 and is not stable.

*Needs:* §0.6 finite presentation; §0.4 finite cusp set; §1.2 boundary kernel;
ArithmeticLocallySymmetricSpaces ALS.F.7 (integral algebraic coefficients).

### 1.7 The `Γ₁`–`Γ₀` comparison

Prove `H¹_cusp(Γ₀(𝔫, 𝔞), E_k) = H¹_cusp(Γ₁(𝔫, 𝔞), E_k)^{(𝓞_K/𝔫)ˣ}`, the invariants under the
diamond action of `Γ₀/Γ₁` (inflation–restriction, Mathlib's `H1InfRes_exact`, with the finite
quotient acting semisimply over `ℂ`). This is the adapter through which the Langlands-extensions
roadmap's `Y₁(𝔫)` statements (§4.26) are read on the LMFDB's `Γ₀(𝔫)`.

**Checks.**

- For the trivial quotient Γ₀/Γ₁, taking invariants changes no vector.
- For a quotient of order 2 over ℂ, the projector (1+g)/2 sends a +1 eigenvector to itself and a −1 eigenvector to 0.
- Over characteristic 2 that projector is undefined; the assertion uses characteristic zero.

*Needs:* §0.1 diamond quotient; §1.2 cuspidality; Mathlib H1InfRes_exact.

### Examples

At k = 3 the coefficient dimension is 4 and the minimal-type dimension is 5 (§1.3).

### Dependencies

Layer 0; Mathlib group cohomology; ArithmeticLocallySymmetricSpaces ALS.0.6–0.7, ALS.1.5, ALS.2.4, ALS.4.1 and ALS.F.7.

## Layer 2: harmonic forms on `ℍ³`

### 2.1 The slash action and the automorphy matrix

For `γ ∈ GL₂(ℂ)` and a ℂ³-valued function `F` on `H3`, define `F ∣ γ` by `ω_{F ∣ γ} = γ^* ω_F` in
the pinned coframe. Prove the matrix formula: for `det γ = 1`, `z = (x, y)`, `r = cx + d`,
`s = cy`,

```text
(F ∣ γ)(z) = A(γ, z) · F(γ z),   A(γ, z) = (1 / (|r|² + |s|²)) · ( r̄², r̄ s, s² ; −2 r̄ s̄, |r|² − |s|², 2 r s ; s̄², −r s̄, r² ),
```

equivalently the coframe law `γ^* β_i = ∑_j A(γ, z)_{ji} β_j`. The knowl's matrix
`M(γ, z) = (1 / (|r|² + |s|²)) · ( r̄², 2 r̄ s, s² ; −r̄ s̄, |r|² − |s|², r s ; s̄², −2 r s̄, r² )`,
its `Sym²(J(γ, z)⁻¹)` with `J(γ, z) = (cx + d, −cy ; c̄ y, conj(cx + d))`, is
`A = D⁻¹ M D` for `D = diag(2, 1, 2)`: `M` is the same action written on `(2F₁, F₂, 2F₃)`, and
`M = conj(P⁻¹)` for the pullback matrix `P = Aᵗ`. Prove `F ∣ (γγ') = (F ∣ γ) ∣ γ'` (both `A` and `M`
satisfy `A(γγ', z) = A(γ', z) A(γ, γ'z)`) and `F ∣ (λγ) = F ∣ γ` for `λ ∈ ℂ^×`. Checks:
`diag(u, 1)` with `|u| = 1` rotates, and `(F ∣ diag(u, 1))(x, y) = diag(u, 1, ū) F(ux, y)`
(`γ^* β₁ = u β₁`, `γ^* β₃ = ū β₃`); at `x = 0` the inversion `(0, −1; 1, 0)` has
`A = M = (0, 0, 1; 0, −1, 0; 1, 0, 0)`, while at `x ≠ 0` the off-diagonal entries of `A` and `M`
differ by the factors `2` and `1/2`.

- Pullback gives the right slash law F ∣ (γγ′) = (F ∣ γ) ∣ γ′ and the identity acts trivially.
- Nonzero scalar rescaling of γ leaves the slash unchanged, and the two coframe matrices are related by A = D⁻¹MD.

**Checks.**

- For γ = 1 the slash matrix is diag(1,1,1).
- For diag(i,1), the outer coefficients multiply by i and −i and the middle coefficient by 1.
- At inversion with x = y = 1, the middle basis vector maps to (1/2,0,−1/2), with squared norm 1 for §2.6's metric.

*Needs:* KleinianGroups Layer 0 Möbius action and hyperbolic metric.

### 2.2 Harmonic forms, growth and the space `M₂(Γ)`

Define `M₂(Γ)` for `Γ ≤ GL₂(K)` of finite index in some `Γ₀(𝔫, 𝔞)`: smooth `F` with
`F ∣ γ = F` for all `γ ∈ Γ`, `dω_F = δω_F = 0`, and polynomial growth at every cusp (`‖F(σ_c (x, y))‖
≤ C y^m` as `y → ∞`, uniformly in `x` mod the translation lattice, for `σ_c ∈ GL₂(K)` with
`σ_c ∞ = c`). Prove that `Δω = 0` is equivalent to closedness and coclosedness for
smooth cusp forms with exponential decay, by integration by parts; no such converse is
asserted from moderate growth alone, and derive the Casimir form of the knowl as a theorem. Prove `M₂(Γ)`
is a ℂ-vector space and `F ↦ F ∣ g` is an isomorphism `M₂(Γ) → M₂(g⁻¹Γg)`.

- The invariant closed and coclosed forms with the stated growth form a complex vector space.
- Slash by g gives an isomorphism from M₂(Γ) to M₂(g⁻¹Γg).
- For exponentially decaying cusp forms, integration by parts identifies Hodge harmonicity with closedness and coclosedness; moderate growth alone is not sufficient.

**Checks.**

- The zero form is invariant, closed and coclosed.
- The cusp-coordinate form F = (0,y²,0) is closed and coclosed but has nonzero constant term y²; harmonicity alone is not cuspidality.
- The constant coefficient vector (1,0,0) gives −dx/y, whose derivative is y⁻² dy∧dx ≠ 0; arbitrary invariant coefficient vectors are not harmonic.

*Needs:* §2.1 pullback; KleinianGroups Layer 0 hyperbolic metric.

### 2.3 Cusp forms

Define the **constant term** of `F` at a cusp `c`: `a₀(F, c) := ∫_{ℂ / Λ_c} (F ∣ σ_c)(x, y) dx`,
with `Λ_c` the translation lattice of `σ_c⁻¹ Γ σ_c ∩ N(K)`; prove that its vanishing does not
depend on `σ_c` (another choice is `σ_c β` with `β ∈ B(K)` upper triangular, which rescales and
rotates the constant term) and that for `F` harmonic it is `(c₁ y, c₂ y², c₃ y)` with constants
`c_i` (`dω = 0` and `δω = 0` on a function of `y` alone), and define
`S₂(Γ) := {F ∈ M₂(Γ) : a₀(F, c) = 0 ∀ c}`. This is the
knowl `mf.bianchi.weight2`'s condition, stated for every cusp rather than for `γ ∈ PSL₂(𝓞_K)`
only, which is the same thing for `h_K = 1` and the right thing in general. Prove that cusp forms
decay exponentially at every cusp.

- The constant-term map is linear and has harmonic shape (c₁y,c₂y²,c₃y).
- Its vanishing is invariant under changing cusp coordinates by the upper Borel.
- The common vanishing subspace S₂(Γ) consists of exponentially decaying forms at every cusp.

**Checks.**

- The zero form has constant term 0 at every cusp.
- The local harmonic constant mode (0,y²,0) has nonzero averaged middle component, so fails cuspidality.
- For a nonzero Fourier character on ℂ/Λ, its integral is 0, independently of the chosen lattice parallelogram.

*Needs:* §0.4 cusp coordinates; §2.2 closedness and coclosedness.

### 2.4 The Fourier–Bessel expansion

For `F ∈ S₂(Γ₀(𝔫, 𝔞))` prove the expansion of the pinned conventions, in three steps: (i) `F` is
invariant under translation by `𝔞⁻¹` and under the rotations `diag(u, 1)`, so each component is a
Fourier series over the dual lattice, which under the pinned pairing is indexed by `α ∈ 𝔞`;
(ii) `dω = 0` and `δω = 0` reduce, mode by mode, to a second-order ODE in `y` whose solutions
decaying as `y → ∞` are `y² K₀(λ_α y)` for the `β₂`-component, with the first and third
components determined by closedness as `(α/2|α|) y² K₁(λ_α y)` and `(ᾱ/2|α|) y² K₁(λ_α y)` times
the same coefficient (the automorphic-forms roadmap's §4.5 supplies `K₀`, `K₁`, their ODE and
asymptotics; the growing solution `I₀` is excluded by the growth condition); (iii) the `α = 0`
term is the constant term and vanishes. Prove `c_𝔞(uα) = c_𝔞(α)` for `u ∈ 𝓞_Kˣ` (rotation
invariance) and the convergence of the expansion, absolutely and locally uniformly with all
derivatives. Check: the mode `α` is a closed form only with the stated phases `α/2|α|`,
`ᾱ/2|α|`; with the phases `∓ i/2` and no dependence on `arg α` the `dx ∧ dy` coefficient of
`dω` is `i y K₀ (2πα/√d_K + 2π|α|/√|d_K|)`, nonzero for every `α` off a single ray.

**Checks.**

- For K = ℚ(i) and α = 1, λ_α = 2π and the two phases are 1/2 and 1/2.
- For α = i the phases are i/2 and −i/2; replacing them by the phases for α = 1 fails closedness.
- The index α = 0 is excluded from phase division and contributes the separate constant term, which is 0 for a cusp form.

*Needs:* §2.3 cusp condition; AutomorphicFormsOnReductiveGroups §4.5 Bessel functions.

### 2.5 Coefficients indexed by ideals

Define `c(𝔪, F) := c_{𝔞_c}(α)/N𝔞_c` for an integral ideal `𝔪` of class `[𝔞_c]⁻¹`, where `𝔪 = (α)𝔞_c⁻¹`,
`α ∈ 𝔞_c` determined up to units, and `c(𝔪, F)` is the coefficient on the component `c`; prove
well-definedness (2.4's unit invariance) and independence of the representatives under the
isomorphisms of 1.5: if 𝔞' = x𝔞 then transport gives
F'₂(z,y) = F₂(xz,|x|y), hence c_𝔞′(xα) = |x|² c_𝔞(α) and N𝔞' = |x|² N𝔞.
The quotient is therefore unchanged. The adelic identification uses these arithmetic coefficients in §3.1, with c(𝓞_K) = 1;
coefficients on non-integral ideals are zero (BCGNT §1.3, pp.9–11 in arXiv:2309.15880v3).

- Unit invariance of the raw coefficient makes c(𝔪,F) independent of the generator α.
- Transport by 𝔞 ↦ x𝔞 scales both raw coefficient and ideal norm by |x|², so their quotient is unchanged.
- The arithmetic coefficient is linear in F, agrees with the normalized adelic coefficient, and is zero on non-integral ideals.

**Checks.**

- For 𝔞 = 𝓞_K the arithmetic coefficient equals the raw coefficient.
- Replacing 𝔞 by 2𝔞 sends a raw coefficient 1 to 4 and its norm 1 to 4,
  leaving the arithmetic coefficient 1/1 = 4/4 = 1.
- Replacing α by a unit multiple changes neither raw nor arithmetic coefficient.

*Needs:* §1.5 transport; §2.4 expansion.

### 2.6 The Petersson inner product

Define `⟨F, G⟩ := ∫_{Γ \ H3} ⟨ω_F, ω_G⟩_{hyp} dvol` for `F ∈ S₂(Γ)`, `G ∈ M₂(Γ)`, the pointwise
hyperbolic inner product of `1`-forms (Gram matrix diag(2,1,2) in the pinned complex coframe) integrated against the
Kleinian-groups roadmap's `volume` over a measurable fundamental domain; prove convergence (cusp
decay against finite cusp volume), independence of the domain, positive definiteness on `S₂(Γ)`,
and invariance `⟨F ∣ g, G ∣ g⟩_{g⁻¹Γg} = ⟨F, G⟩_Γ`. Extend to the total space over classes as
the orthogonal sum. The matrix of §2.1 satisfies A* diag(2,1,2) A = diag(2,1,2);
this metric fixes every adjoint in §§4.6 and 5.1 (Cremona §1, pp.276–279,
for the invariant differential-form interpretation).

- For cuspidal F and moderate-growth G the Petersson integral converges and is independent of a measurable fundamental region.
- It is positive definite on S₂, invariant under conjugation transport, and the total space is the orthogonal sum over components.

**Checks.**

- Writing z = u+iv gives ‖−dz/y‖² = ‖d z̄/y‖² = 2 and ‖dy/y‖² = 1.
- At inversion with z = y = 1, (0,1,0) maps to (1/2,0,−1/2): both squared norms are 1.
- With the Euclidean Gram matrix that same image has squared norm 1/2, so it fails invariance.

*Needs:* §2.3 exponential decay; KleinianGroups Layer 0 metric and volume.

### 2.7 Weight-two forms with `SL₂`-level

Define `S₂(Γ₀ˢᴸ(𝔫))` by the same construction and prove `S₂(Γ₀(𝔫)) = S₂(Γ₀ˢᴸ(𝔫))^{𝓞_Kˣ}`,
the invariants under the rotations `diag(u, 1)`: the `GL₂`-space sits inside the larger
`SL₂`-space as the knowl `mf.bianchi.level` says, and the `sl2_dims` tables are for the larger one.

- The GL₂ space identifies with the unit-rotation invariants of the SL₂ space.
- Square units act trivially on SL₂-invariant weight-two forms, so the effective quotient has order two.

**Checks.**

- The +1 eigenspace of the quotient rotation has GL₂ invariants equal to itself.
- The −1 eigenspace has invariant subspace 0 in characteristic zero.
- A square unit gives a scalar times an SL₂ matrix, hence acts as 1 on the SL₂-invariant weight-two forms.

*Needs:* §0.3 determinant quotient; §2.3 cusp forms.

### Examples

Inversion sends (0,1,0) to (1/2,0,−1/2) at x = y = 1; its squared norm is 1 (§2.6).

### Dependencies

Layers 0–1; KleinianGroups Layers 0–1; AutomorphicFormsOnReductiveGroups §4.5.

## Layer 3: Eichler–Shimura–Harder

### 3.1 Adelization

Construct `ad : ⊕_c S₂(Γ₀(𝔫)_c) → (cusp forms on GL₂(𝔸_K) of level K₀(𝔫), K_∞-type of the
1-forms)` — the Bianchi case of the automorphic-forms roadmap's `GL₂` adelization §7.2 — and
prove it is an isomorphism onto the vector-valued cuspidal functions of weight `2` of the
Langlands-extensions roadmap's §4.27 that are right `K₀(𝔫)`-invariant, with inverse "restrict
to the components `H3 × g_c K₀(𝔫)`". Their central characters are exactly the unramified
`ω : Cl(K) → ℂˣ` (trivial on `Ô_Kˣ` and on `ℂˣ`); `ad` carries `S_𝔟` (1.5) to the action of the
central idele of `𝔟`, hence the trivial-central-character part `⊕_c S₂(Γ₀(𝔫)_c)^S` onto the
forms with trivial central character. Strong approximation for `SL₂` gives the
component decomposition (1.5); the `K_∞ = ℂ^× U(2)`-type is the three-dimensional
representation on `1`-forms at the base point `(0, 1)`. Prove the Fourier comparison: the
coefficient of 2.5 equals the Whittaker coefficient of §4.27 up to the normalization.

- Adelization and restriction to component representatives are inverse linear maps.
- They preserve the normalized Fourier coefficients and intertwine central ideal operators with central ideles.

**Checks.**

- For class number one the adelic component set has one element.
- For a class group of order 3, the central operator indexed by a generator sends class c to c+2 modulo 3.
- An order-three central character has value ζ² ≠ 1 at that generator, so its eigenspace is excluded from trivial central character.

*Needs:* §1.5 component decomposition; §2.5 coefficients; AutomorphicFormsOnReductiveGroups §§7.2–7.3; ModularityAndLanglandsExtensions §4.27.

### 3.2 The comparison with cohomology

Define the classical map `ES : S₂(Γ) → H¹(Γ, ℂ)` by `F ↦ [γ ↦ ∫_{z₀}^{γ z₀} ω_F]` (closed
form, so the integral is path-independent and the class is independent of `z₀`), prove it lands
in `H¹_cusp(Γ, ℂ)` (the integral between two points of a horosphere at a cusp tends to zero with
the height, by cusp decay), and prove the **Eichler–Shimura–Harder theorem**: `ES` is an
isomorphism `S₂(Γ₀(𝔫, 𝔞)) ≅ H¹_cusp(Γ₀(𝔫, 𝔞), ℂ)` for every `𝔞`, hence on the total spaces. The
route: under 3.1 and the de Rham identification `H¹(Γ \ H3, ℂ) = H¹(Γ, ℂ)` (ALS.1.5), `ES`
is the differential-form comparison of ModularityAndLanglandsExtensions §4.26,
restricted to diamond invariants via §1.7. For each cuspidal π its contribution is
the K₀(𝔫)-invariants of π_f ⊗ H¹(𝔤,K_∞;π_∞⊗E₂). The archimedean factor has dimension one;
the finite-level factor may have larger dimension (Harder §3.6.2.2, p.74;
ArithmeticLocallySymmetricSpaces ALS.5b.5). Multiplicity one holds on the newspace at
conductor level, as in §5.3.

- Integration is independent of the path and basepoint at the level of cohomology and lands in the cusp-restriction kernel.
- For each component it is an isomorphism onto cuspidal H¹, hence also for their direct sum.

**Checks.**

- A new eigenline at conductor level contributes dimension 1·1 = 1.
- The two degeneracy images of 121.1-a at level (11)(1+i) contribute 2·1 = 2.
- Their good-prime eigensystems agree; treating archimedean multiplicity as total multiplicity
  would incorrectly identify the two images.

*Needs:* §3.1; §1.7; ArithmeticLocallySymmetricSpaces ALS.1.5 and ALS.5b.5;
ModularityAndLanglandsExtensions §4.26.

### 3.3 Hecke equivariance and the real structure

Prove that `ES` intertwines the slash action with conjugation, `ES(F ∣ g) = g^* ES(F)`, so that
every operator defined on pairs in Layers 4–5 acts compatibly on both sides, and that complex
conjugation `F ↦ F̄` on forms (`ω_{F̄} = conj(ω_F)`) corresponds to the real structure
`H¹_cusp(Γ, ℝ) ⊗ ℂ` on cohomology.

**Checks.**

- The zero form integrates to the zero cocycle.
- A concatenation of paths with integrals a and b has integral a+b, fixing the cocycle direction.
- Complex conjugating a real-valued differential fixes its integrals; conjugating i times it changes the integral by i ↦ −i.

*Needs:* §3.2 integration and §2.1 pullback.

### 3.4 Weight `k`

State the comparison `S_k(Γ₀(𝔫, 𝔞)) ≅ H¹_cusp(Γ₀(𝔫, 𝔞), E_k)` for `k > 2` as the same
specialization of §4.26 with coefficients, with `S_k` the Langlands-extensions roadmap's
vector-valued forms of minimal SU₂-type Sym^(2k−2) restricted to the components; no classical analytic theory of weight `k > 2`
is built here, and this statement exists so that 5.2's `new_dim` is defined for every weight.

*Needs:* §1.3 weights; ModularityAndLanglandsExtensions §4.26.

### 3.5 Compactified pairs and cuspidal homology

For each arithmetic component Γ use the Borel–Serre compactification X_Γ of Γ\H3
and its boundary ∂X_Γ (ArithmeticLocallySymmetricSpaces ALS.4.1); with torsion present,
use the orbifold pair and its integral homology, and pass to a torsion-free finite cover
for the characteristic-zero comparison. Define M_Γ = H₁(X_Γ,∂X_Γ;ℚ) and
C_Γ = H₁(X_Γ;ℚ)/im H₁(∂X_Γ;ℚ). The long exact sequence identifies C_Γ with ker ∂
in M_Γ, where ∂ maps to H₀(∂X_Γ;ℚ). These are Bianchi specializations of the
supplier's pair and boundary triangle, not new compactification constructions
(Şengün §3, pp.7–8; Cremona §2.2, Theorem 2, p.284, for the cusp-adjoined model).

- Prove C_Γ ⊗ ℂ pairs perfectly with H¹_cusp(Γ,ℂ), hence with S₂(Γ) by §3.2.
- A geodesic {α,β}, oriented from α to β, defines a relative class with boundary
  [β]−[α]. Integrating cusp forms converges, and on C_Γ agrees with evaluation of
  the cohomology class. Relate the rational cusp-adjoined homology to C_Γ by collapsing
  each boundary component; over ℤ retain the image lattice and its finite-index changes.

**Checks.**

- ∞ is outside H3 but is a boundary cusp; the uncompactified pair (Γ\H3,cusps) is undefined.
- If dim H₁(X) = 1 and dim im H₁(∂X) = 1, then dim C = 0, not 1.
- A geodesic from α to itself has boundary [α]−[α] = 0 and zero integral.

*Needs:* §1.6 integral lattices; §3.2 integration;
ArithmeticLocallySymmetricSpaces ALS.4.1 boundary triangle.

### Examples

A newvector contributes dimension 1 at conductor level and dimension 2 after one unramified level raise (§3.2).

### Dependencies

Layers 1–2; AutomorphicFormsOnReductiveGroups §§7.2–7.3; ModularityAndLanglandsExtensions §§4.26–4.27; ArithmeticLocallySymmetricSpaces ALS.1.5, ALS.4.1 and ALS.5b.5.

## Layer 4: Hecke operators

### 4.1 Hecke correspondences on pairs

For a prime `𝔭 ∤ 𝔫` define the correspondence `T_𝔭` on level-`𝔫` pairs by the pinned formula and
prove: `L' ↦ (L', M ∩ L')` lands in level-`𝔫` pairs (`𝔭 ∤ 𝔫` gives `L'/(M ∩ L') ≅ 𝓞_K/𝔫`); there
are `N𝔭 + 1` sublattices `L'` (the lines of `L/𝔭L ≅ (𝓞_K/𝔭)²`); the Steinitz class moves by `[𝔭]`;
and the correspondence commutes with the `GL₂(K)`-action, hence descends to the orbits. For
`𝔭 ∣ 𝔫` define `U_𝔭` by the sum over the `N𝔭` sublattices `L'` not containing `M_𝔭`, and prove
that `(L', M ∩ L')` is again a level-`𝔫` pair. Define the composite correspondences `T_𝔪` for
every integral ideal `𝔪` by `T_{𝔭𝔮} = T_𝔭 T_𝔮` for coprime `𝔭 ∤ 𝔮`, 
`T_{𝔭^{r+1}} = T_𝔭 T_{𝔭^r} − N𝔭 · S_𝔭 T_{𝔭^{r−1}}` for `𝔭 ∤ 𝔫` (the central correspondence `S_𝔭` of the pinned conventions is
what makes both sides move the Steinitz class by `[𝔭]^{r+1}`), and `T_{𝔭^r} = U_𝔭^r` for `𝔭 ∣ 𝔫`.

- Allowed sublattices give level-𝔫 pairs and commute with GL₂(K) transport.
- Their degrees are N𝔭+1 off the level and N𝔭 on it, with Steinitz shift [𝔭].
- Coprime correspondences multiply, the good-prime recurrence retains S_𝔭, and the bad-prime powers are powers of U_𝔭.

**Checks.**

- At norm 2, ℙ¹(𝔽₂) has 3 lines and the good correspondence has 3 terms.
- At a bad norm-2 prime exactly one forbidden line is removed, leaving 2 terms.
- For class g of order 3, T_𝔭² and S_𝔭 both move class c to cg²; omitting S_𝔭 in the recurrence would mismatch components.

*Needs:* §0.2 lattice pairs; §1.5 central action; Mathlib finite residue fields.

### 4.2 The operators on cohomology and on forms

For a target representative pair P_b = (L_b,M_b), index the form operator by
**superpairs** P⁺ = (L⁺,M⁺), obtained from §4.1's allowed subpairs
P′ = (L′,M_b ∩ L′) of P_b by P⁺ = 𝔭⁻¹P′. Thus L_b ⊂ L⁺,
L⁺/L_b ≅ 𝓞_K/𝔭, and M⁺ = 𝔭⁻¹M_b ∩ L⁺. Off the level these are exactly
reverse subpair arrows: M⁺ ∩ L_b = M_b. At 𝔭 ∣ 𝔫 the condition instead is
𝔭L⁺ ⊅ M_b(𝔭), where M_b(𝔭) is the intermediate lattice of index 𝔭; the level lattice is still 𝔭⁻¹M_b ∩ L⁺. This distinguishes
U from its transpose. Their source class is c = b[𝔭]⁻¹. Choose δ ∈ GL₂(K) carrying
P⁺ to the fixed source pair P_c, and define

    (T_𝔭 F)^(b) = Σ_{P⁺} F^(c) ∣ δ

with U_𝔭 in place of T_𝔭 at 𝔭 ∣ 𝔫. The indexing is by cosets Γ_c δ:
changing δ to ηδ with η ∈ Γ_c does not change F^(c) ∣ δ. Right multiplication
is not a representative-independence argument.

- Prove that there are N𝔭+1 superpairs off the level and N𝔭 on the level. Off
  the level M⁺ = M_b + 𝔫L⁺. At a bad prime retain the displayed level lattice
  and forbidden-line condition; using M⁺ ∩ L_b = M_b would give the other orientation.
- On geometric pairs the forward subpair arrow has class c → c[𝔭]; reversing
  it has class b → b[𝔭]⁻¹. The scaled subpair construction also has this latter
  shift, at every prime. Pullback of source forms along δ sends the c summand to
  c[𝔭]. Multiplying P⁺ by 𝔭 recovers P′; this scaling has class shift [𝔭]²
  and is the central correspondence S_𝔭. It cannot be suppressed for a
  nonprincipal ideal. Off the level the scaled and reversed correspondences agree;
  on the level the reverse has a different level-pair condition.
- Prove agreement with restriction, conjugation and transfer on cohomology
  (ArithmeticLocallySymmetricSpaces ALS.3.5), and with ES of §3.3. The adelic
  convention is K₀(𝔫) diag(1,ϖ_𝔭) K₀(𝔫), with the two legs oriented to give
  this pullback action. On homology use its transpose under the integration pairing.
- The maps preserve M₂, S₂ and cuspidal cohomology; at weight two restriction,
  identity coefficient maps and transfer preserve the rational and integral lattices
  of §1.6 (Şengün §4, pp.11–12). Higher coefficient maps are those of §1.6.

**Checks.**

- For π = 2+i at unit level, the five matrices (1,b;0,π) have the same image
  lattice 𝓞e₁ ⊕ π𝓞e₂. Their inverse-image superlattices are distinct: multiplying
  them by π gives the five sublattices with columns (π,0) and (−b,1).
  The sixth gives columns (1,0) and (0,π), so there are six, not two.
- Equivalently δ′_b = (π,b;0,1) and diag(1,π) give the six image sublattices;
  π(δ′_b)⁻¹ = (1,−b;0,π), with sixth diag(π,1), gives §4.3's form cosets.
- Locally at level πᵉ, e ≥ 1, the q allowed superpairs have
  L⁺ = 𝓞e₁ + 𝓞π⁻¹(e₂−be₁) and M⁺ = 𝓞e₁ + π^(e−1)𝓞e₂,
  for b mod π. Their quotient is 𝓞/πᵉ, and δ = (1,b;0,π) sends them
  to the source pair. The extra good-prime coset diag(π,1) corresponds to
  L′ = 𝓞e₁ + π𝓞e₂ = M_b(𝔭), the forbidden sublattice.
- In contrast, reversing the bad-prime arrow gives q superpairs sharing
  L⁺ = π⁻¹𝓞e₁ + 𝓞e₂ with different M⁺. These give the transpose U action,
  not the q upper-triangular cosets just displayed.
- For a nonprincipal class g of order 3, subpairs move 1 → g and superpairs
  move 1 → g²; form pullback moves g² → 1. Scaling by 𝔭 moves g² → g,
  so replacing it by a scalar identity loses the central operator.
- At Gaussian norm 2 on the level there are 2 terms; off it there are 3.

*Needs:* §4.1 correspondences; §1.5 central action; §1.6 coefficient maps;
§2.1 slash law; §3.3 comparison; ArithmeticLocallySymmetricSpaces ALS.3.5.

### 4.3 Principal primes and the double-coset ring

For a principal prime `𝔭 = (π)` with `𝔭 ∤ 𝔫` prove that `T_𝔭` preserves every component and equals the
double-coset operator `[Γ₀(𝔫, 𝔞) diag(1, π) Γ₀(𝔫, 𝔞)]` on it, with the coset decomposition
`Γ₀(𝔫, 𝔞) diag(1, π) Γ₀(𝔫, 𝔞) = ⊔_{b ∈ 𝔞⁻¹/π𝔞⁻¹} Γ₀(𝔫, 𝔞) (1, b; 0, π) ⊔ Γ₀(𝔫, 𝔞) (π, 0; 0, 1)`;
let Δ₀(𝔫,𝔞) consist of the invertible K-matrices preserving the level pair
(not necessarily onto), and use the abstract integral Hecke ring
`𝕋 Δ₀(𝔫,𝔞) Γ₀(𝔫,𝔞) ℤ`. Let A_pr be its unital subalgebra generated by
these principal good-prime double cosets, the principal bad-prime U double cosets,
and integral scalar double cosets. Construct the representation homomorphism
A_pr → End_ℤ(H¹_cusp(Γ₀(𝔫,𝔞),ℤ)) using §4.2. Define the principal operator
algebra as its image, and identify it with A_pr modulo the kernel of this action
(the annihilator of the module). After extending scalars compare with the rational
and complex operator algebras. No injectivity is asserted. At class number one all
prime ideals are principal, so its image is the all-prime operator algebra;
this does not identify A_pr with the entire abstract monoid Hecke ring
(Şengün §4, pp.11–12, defines the algebra inside endomorphisms).

Check: for `K = ℚ(i)`, `𝔭 = (2 + i)`, the six
cosets off the level are `(1, b; 0, 2 + i)`, `b ∈ {0, 1, 2, 3, 4}`, and `(2 + i, 0; 0, 1)`.
At a principal prime dividing the level, U_𝔭 has just the first N𝔭 cosets.

- Principal good-prime cosets give the N𝔭+1-term slash sum; principal bad-prime cosets give the N𝔭-term sum.
- The action is a ring homomorphism, and its operator image is the abstract generated subalgebra modulo its action kernel.
- Scalar extension compares the integral, rational and complex actions; it does not assert faithfulness.

**Checks.**

- At π = 2+i off the level the degree is 5+1 = 6.
- At level (π) the degree is 5; diag(π,1) is absent because its upper-left entry
  vanishes modulo π, unlike every matrix in Γ diag(1,π) Γ.
- The identity correspondence has degree 1, independently of the chosen representatives.
- At Gaussian unit level H¹ = 0. The abstract identity basis vector has coefficient 1
  on its double coset, but its operator is 0; the image and the quotient by its
  annihilator are the zero ring.
- For a nonunit π the scalar cosets [πI] and [I] are distinct, while both act as 1
  on weight-two forms. Their difference is another kernel element.

*Needs:* §4.1 lattice correspondences; §4.2 restriction and transfer.

### 4.4 The coefficient recurrence

Prove `c(𝔪, T_𝔭 F) = c(𝔭𝔪, F) + N𝔭 · c(𝔭⁻¹𝔪, S_𝔭 F)` for `𝔭 ∤ 𝔫`, which is
`c(𝔭𝔪, F) + N𝔭 · c(𝔭⁻¹𝔪, F)` on the trivial-central-character part, and `c(𝔪, U_𝔭 F) = c(𝔭𝔪, F)` for
`𝔭 ∣ 𝔫`, with `c(I, F) = 0` for non-integral `I`, from §4.2's correspondence maps and §2.4's expansion, dividing every raw coefficient
by N𝔞 as in §2.5; the class-group bookkeeping is exactly that the term `α` of component `[𝔞]` and the term
`πα`-type of component `[𝔞𝔭]` both index the ideal `𝔭𝔪`. Derive the multiplicativity
`c(𝔪𝔪', F) = c(𝔪, F) c(𝔪', F)` for coprime `𝔪, 𝔪'` and the prime-power recurrence for an
eigenform normalized by `c(𝓞_K, F) = 1`.

**Checks.**

- For eigenvalue 1 at norm 5 the good recurrence gives c(𝔭²) = 1−5 = −4.
- At a bad prime of eigenvalue −1 the first three powers have coefficients −1, 1, −1.
- For 𝔪 = 𝓞_K, the term c(𝔭⁻¹𝔪) is 0 because its ideal is not integral; thus c(𝔭) equals the eigenvalue.

*Needs:* §2.4 expansion; §2.5 arithmetic normalization; §4.2 Hecke action.

### 4.5 Eigenforms, eigenvalues and the coefficient comparison

Define a (Hecke) **eigenform** of level `𝔫` as a nonzero `F ∈ H¹_cusp(𝔫, ℂ)^S` (trivial central
character, 1.5) with `T_𝔭 F = a_𝔭 F`
for every prime `𝔭` (including `U_𝔭` at `𝔭 ∣ 𝔫`), with its **eigenvalue system**
`a : HeightOneSpectrum (𝓞 K) → ℂ` (the eigenform carrier, with existence on a nonzero space proved in §4.6; the `T_𝔭` commute with the `S_𝔟`,
so they preserve it). The **coefficient map** of a newform (5.3) is the function `c(·, F)` on
integral ideals determined by the eigenvalue system: `c(𝓞_K, F) = 1`, `c(𝔭, F) = a_𝔭`,
`c(𝔪𝔪', F) = c(𝔪, F) c(𝔪', F)` for coprime `𝔪, 𝔪'`,
`c(𝔭^{r+2}, F) = a_𝔭 c(𝔭^{r+1}, F) − N𝔭 · c(𝔭^r, F)` for `𝔭 ∤ 𝔫`, and `c(𝔭^r, F) = a_𝔭^r`
for `𝔭 ∣ 𝔫` (4.4); on the analytic side it is 2.5's arithmetic Fourier–Bessel coefficient, including the factor 1/N𝔞. Prove: on the analytic side a normalized eigenform has
`c(𝔭, F) = a_𝔭` for all `𝔭` (4.4 at `𝔪 = 𝓞_K`), hence `c(𝔪, F) = a_𝔪`, the eigenvalue of `T_𝔪`,
for every integral `𝔪`; this is the knowl `mf.bianchi.newform`'s identification of eigenvalues
with arithmetic Fourier coefficients and ModularityAndLanglandsExtensions §4.27's
eigenvalue normalization read classically. The **`hecke_eigs`** column is the eigenvalue system at every prime, `U_𝔭`'s
eigenvalue at `𝔭 ∣ 𝔫` included (for `2.0.4.1-100.2-a` its first entries are `0` at `(1 + i)`,
where `(1 + i)² ∣ 𝔫`, and `−1, −1` at `(2 ± i)`); the newform page's eigenvalue table omits the
primes dividing the level, and the ordering of the list is a label matter.

- On a normalized analytic eigenform the arithmetic prime coefficient is its Hecke eigenvalue, including U at bad primes.
- Coprime multiplicativity and the respective good/bad recurrences determine all ideal coefficients from c(𝓞_K) = 1.
- Membership in the central-invariant subspace is part of the eigenform condition.

**Checks.**

- `2.0.4.1-121.1-a` gives an eigenform of level `(11)` over `ℚ(i)` with `a_{(1+i)} = −2`,
  `a_{(3)} = −5`, `a_{(2±i)} = 1`, `a_{(7)} = −10`, `a_{(3±2i)} = 4`, `a_{(11)} = 1`.
- Its coefficients satisfy `c(𝓞_K) = 1`, `c((2+i)) = 1` and, by the good recurrence at
  `N𝔭 = 5`, `c((2+i)²) = 1² − 5 = −4`.
- At a bad prime the rule is `c(𝔭^r) = a_𝔭^r`: for `2.0.4.1-100.2-a`, `a_{(1+i)} = 0` gives
  `c((1+i)^r) = 0` for every `r ≥ 1`, and `a_{(2+i)} = −1` gives `c((2+i)^r) = (−1)^r`.
- (reject) 1.5's twist over `ℚ(√−23)` by an order-`3` class character is an eigenvector of every
  `T_𝔭` on the total space but not an eigenform: it is not in `H¹_cusp((11))^S`.

*Needs:* §4.4 recurrence; §1.5 central invariants.

### 4.6 Commutativity, integrality, self-adjointness

Prove that the `T_𝔭`, `U_𝔭` commute (the correspondences compose commutatively on pairs: both
composites `T_𝔭 T_𝔮` and `T_𝔮 T_𝔭` sum over the sublattices of index `𝔭𝔮` with the same
multiplicities, ALS.3.8 for the adelic composition); that at weight two the operators preserve the total integral lattice of §1.6
(the coefficient maps and restriction/transfer are those of §4.2), so eigenvalues are **algebraic integers**; that the adjoint of `T_𝔭`
for `𝔭 ∤ 𝔫` for the Petersson product on `S₂` is `S_𝔭⁻¹ T_𝔭` (the correspondence `L ⊃ L'`
reversed sends `L'` to the lattices `L` with `L' ⊂ L ⊂ 𝔭⁻¹L'`, which are `𝔭⁻¹` times the
sublattices of index `𝔭` in `L'`), so `T_𝔭` is **self-adjoint** on the trivial-central-character
part `S₂(𝔫)^S` and the `a_𝔭` of an eigenform are **real** (on the total space for `h_K > 1` they
need not be: 1.5's check); and that the `U_𝔭` for `𝔭 ∣ 𝔫` need not be self-adjoint. Derive that
eigenforms for the `T_𝔭` with `𝔭 ∤ 𝔫` exist and form an orthogonal basis of `S₂(𝔫)^S`, and that
the eigenvalues of `T_𝔭` lie in
`[−2√N𝔭, 2√N𝔭]` by the Ramanujan bound of the Langlands-extensions roadmap (§4.40 with `k = 2`;
§4.43 for the cohomological statement on the principal component).

*Needs:* §1.6 integral lattice; §2.6 metric; §4.1 correspondences; ArithmeticLocallySymmetricSpaces ALS.3.8; ModularityAndLanglandsExtensions §4.40.

### 4.7 The Hecke field and the dimension of a form

Define `ℚ(F) := ℚ(a_𝔭 : 𝔭 ∤ 𝔫) ⊂ ℂ`, prove it is a **totally real number field** (finite over `ℚ`
because the `a_𝔭` generate the ring of endomorphisms of a lattice of finite rank; real under every
embedding because every `σ : ℚ(F) → ℂ` gives the eigensystem `σ ∘ a`, which occurs in
`H¹_cusp(𝔫, ℚ)^S ⊗ ℂ` (the `S_𝔭` are defined over `ℚ`) by Galois conjugation of the rational
Hecke algebra and so has real eigenvalues by 4.6), and define the **dimension** of `F` as
`[ℚ(F) : ℚ]`, the LMFDB's `dimension` (the targets heckeField, the `IntermediateField ℚ ℂ`
generated by the `a_𝔭` with `𝔭 ∤ 𝔫`, `dimension := Module.finrank ℚ (heckeField F)`, and
`IsRational F := heckeField F = ⊥`). A **rational newform** is one with `ℚ(F) = ℚ`;
its eigenvalues are rational integers in `[−2√N𝔭, 2√N𝔭]`.

- The good-prime eigenvalues generate a finite totally real field, with rationality equivalent to degree one.
- A rational eigenvalue is integral and satisfies the Ramanujan bound; on newforms the bad eigenvalues add no field generators.

**Checks.**

- `2.0.4.1-121.1-a`, `2.0.4.1-100.2-a` and `2.0.4.1-16384.1-d` are rational: `ℚ(F) = ℚ`,
  dimension `1`, although the classical form behind `16384.1-d` has coefficient field `ℚ(√2)`
  (7.5).
- The eigenvalues of `121.1-a` lie in the Ramanujan interval: `|a_{(3)}| = 5 ≤ 6 = 2√9` and
  `|a_{(7)}| = 10 ≤ 14 = 2√49`.
- Only the good primes generate `ℚ(F)`; at `𝔭 ∣ 𝔫` a newform has `a_𝔭 ∈ {0, ±1}` (5.3), so the
  bad eigenvalues add nothing.
- (reject) 1.5's twist over `ℚ(√−23)` has the non-real eigenvalue `−2χ(𝔭)`, so the field it
  generates is not totally real: the theorem needs the trivial central character.

*Needs:* §4.6 integral Hecke action and adjoints; §1.6 rational structure.

### 4.8 Hecke correspondences with determinant markings

For SL₂-level retain the determinant marking instead of identifying lattices by arbitrary
GL₂(K) maps. Fix wedge² K² ≅ K. For every nonzero fractional ideal 𝔞, let L_𝔞 = 𝓞_K ⊕ 𝔞
and Γ₀ˢᴸ(𝔫,𝔞) = Stab_SL₂(K)(L_𝔞, 𝓞_K ⊕ 𝔞𝔫). Use the direct sum of their cuspidal
cohomology, indexed by actual determinant ideals 𝔞, not just ideal classes. This is the
cohomology of level pairs with determinant-one isomorphisms. Two such pairs with the same
determinant ideal are SL₂(K)-isomorphic: a GL₂(K) isomorphism has unit determinant ratio,
which is corrected by a diagonal automorphism of the source pair.

- An index-𝔭 sublattice has determinant ideal 𝔞𝔭. Restriction and transfer define the
  T_𝔭 and U_𝔭 maps from the 𝔞 summand to the 𝔞𝔭 summand, for every prime ideal.
- Forgetting determinant markings gives the GL₂ pair groupoid of §4.1. Take coinvariants for transport along
  determinant changes in K×, including the unit action within a fixed ideal, and prove
  that the resulting Hecke module is the GL₂ total space of §1.5. Finite unit invariants
  give the GL₂ comparison on each representative component in characteristic zero.
- A principal prime still needs a generator to identify the target determinant ideal with
  the source; changing that generator changes the identification by a unit action.
  Ideal-only operators on the GL₂ quotient are independent of it. A single SL₂ component
  receives only correspondences returning to its determinant class, with this marking data.

**Checks.**

- For K = ℚ(√−23) and 𝔭 above 2 of class g, an index-𝔭 sublattice moves class 1 to g ≠ 1.
- Three successive moves give g³ = 1; returning to the chosen determinant ideal still
  requires a generator of 𝔭³ and its induced identification.
- Replacing a principal generator π by uπ changes the SL₂ identification by diag(u,1);
  on unit invariants its action is 1, recovering the GL₂ operator.

*Needs:* §0.2 lattice classification; §1.3 coefficients; §2.7 unit invariants;
§4.1 lattice correspondences; ArithmeticLocallySymmetricSpaces ALS.3.5 restriction and transfer.

### Examples

At norm 5 the good correspondence has 6 terms and the bad correspondence has 5 (§4.3).

### Dependencies

Layers 1–3; ArithmeticLocallySymmetricSpaces ALS.3.5 and ALS.3.8; Tau Ceti Hecke ring; ModularityAndLanglandsExtensions §4.40 for the bound.

## Layer 5: old and new, Atkin–Lehner, newforms

### 5.1 Degeneracy and trace maps

For `𝔪 ∣ 𝔫` and `𝔢 ∣ 𝔫𝔪⁻¹` define `β_𝔢 : (level-𝔫 pairs) → (level-𝔪 pairs)`,
`β_𝔢(L, M) = (M_𝔢, M_{𝔢𝔪})`, where for `𝔡 ∣ 𝔫` the lattice `M_𝔡` is the unique `M ⊂ M_𝔡 ⊂ L`
with `L/M_𝔡 ≅ 𝓞_K/𝔡` (cyclic quotients have one submodule of each index); prove
`M_𝔢/M_{𝔢𝔪} ≅ 𝓞_K/𝔪`, the `GL₂(K)`-equivariance, the Steinitz shift by `[𝔢]`, and that
`β_{𝓞_K}` is the forgetful map and `β_{𝔫𝔪⁻¹}` is `(L, M) ↦ (M_{𝔫𝔪⁻¹}, M)`. Transport to
`β_𝔢^* : H¹_cusp(𝔪, E_k) → H¹_cusp(𝔫, E_k)` and the traces `β_{𝔢,*}` in the other direction
(ALS.3.6, ALS.3.14 for a prime `𝔢`); prove `β_{𝔢,*}` is the Petersson adjoint of `β_𝔢^*` under
3.2 with §2.6's Gram matrix, and the commutation `T_𝔭 β_𝔢^* = β_𝔢^* T_𝔭` for `𝔭 ∤ 𝔫`
(Şengün §4, pp.11–12, restriction/conjugation/transfer; the intermediate-lattice
formula is the specialization of ArithmeticLocallySymmetricSpaces ALS.3.14 to cyclic quotients).

*Needs:* §0.2 level pairs; §1.6 coefficient maps; §2.6 metric; §3.3 equivariance;
ArithmeticLocallySymmetricSpaces ALS.3.6 and ALS.3.14.

- Every intermediate quotient has the required index, and each degeneracy map is equivariant with the stated Steinitz shift.
- Pullback and trace are adjoint at weight two and commute with good-prime Hecke operators away from the raised level.

**Checks.**

- For 𝔢 = 𝓞_K, M_𝔢 = L and the degeneracy map forgets part of the level.
- At a prime level raise, 𝔢 takes the two values 𝓞_K and 𝔭, giving two degeneracy maps.
- For a cyclic quotient 𝓞_K/𝔭² the intermediate indices are 1, N𝔭, (N𝔭)²; using a noncyclic quotient would not give unique intermediate lattices.

### 5.2 Old and new subspaces

Define `H¹_old(𝔫, E_k) := ∑_{𝔪 ∣ 𝔫, 𝔪 ≠ 𝔫} ∑_{𝔢 ∣ 𝔫𝔪⁻¹} im β_𝔢^*` and
`H¹_new(𝔫, E_k) := ⋂_{𝔪 ≠ 𝔫, 𝔢} ker β_{𝔢,*}`, submodules of the total space (the targets
oldSubspace, newSubspace), and prove `H¹_cusp = H¹_old ⊕ H¹_new`
(isCompl_oldSubspace_newSubspace), both
Hecke-stable and stable under the `S_𝔟`, orthogonal for the Petersson product at `k = 2`. The
intrinsic new dimension at cohomological weight k is `dim H¹_new(𝔫, E_k)^S`
(the whole new space when `h_K = 1`); comparison with the LMFDB's `new_dim` uses §1.3's
coefficient convention,
for the GL₂ total space; the SL₂ comparison retains the determinant markings of §4.8.
Prove the GL₂ dimension relation
`dim H¹_cusp(𝔫) = ∑_{𝔪 ∣ 𝔫} #{𝔢 ∣ 𝔫𝔪⁻¹} · dim H¹_new(𝔪)`, the injectivity of
`⊕_𝔢 β_𝔢^*` on the new space of each lower level (the Bianchi Main Lemma: a form all of whose
coefficients c(𝔪) with 𝔪 coprime to 𝔫 vanish is old).
Use §3.1 adelization, §3.4 for higher coefficients, and the local dimension formula
max(0,r−c(π)+1) of AutomorphicLFunctionsAndLocalFactors §AL.2.2.4
(Casselman, Theorem 1, p.302; Corollary to the Proof, p.306), with the
normalized Whittaker vectors of §AL.2.2.5. Their translated vectors give the
r−c(π)+1 independent degeneracy images. Tensor over the finite places and use
GL2AutomorphicRepresentationsAndTransfer R16.4 multiplicity one. The Main Lemma
then follows from this decomposition and Fourier uniqueness; it is not an
unproved transfer of the rational Atkin–Lehner argument. Cremona §1, p.278,
describes the oldclass multiplicity in the Euclidean Bianchi case.

- The sum of degeneracy images and intersection of trace kernels are complementary, with orthogonality at weight two.
- They are central-stable and Hecke-stable; the local newvector multiplicities give the displayed divisor-sum dimension formula.

**Checks.**

- At `𝔫 = 𝓞_K` there is no proper divisor: `H¹_old = 0` and `H¹_new` is the whole total space.
- Over `ℚ(i)` at `𝔫 = (11)` the only proper divisor is `𝓞_K`, whose cuspidal space is `0` (9.3,
  level-one vanishing for `d_K = −4`), so `H¹_old((11)) = 0` and `121.1-a` lies in `H¹_new((11))`.
- At level `(11)(1+i)` the two degeneracy images of `121.1-a`, for `𝔢 ∈ {𝓞_K, (1+i)}`, span a
  two-dimensional subspace of `H¹_old` (the injectivity of `⊕_𝔢 β_𝔢^*`).
- (reject) An old subspace built from the forgetful maps `β_{𝓞_K}^*` alone misses the second
  image above, and its complement with `H¹_new` fails.

*Needs:* §5.1 degeneracy maps; §2.6 metric; §§3.1 and 3.4 adelic comparison;
§4.4 coefficients; AutomorphicLFunctionsAndLocalFactors §§AL.2.2.4–AL.2.2.5;
GL2AutomorphicRepresentationsAndTransfer R16.4 multiplicity one.

### 5.3 Newforms, multiplicity one

Define a **newform** of level `𝔫` as an eigenform in `H¹_new(𝔫, ℂ)`, normalized by
`c(𝓞_K, F) = 1` on the analytic side (a newform, an eigenform whose class
lies in `H¹_new(𝔫, ℂ)`). Prove
**multiplicity one**: the eigenspace of a newform's
eigensystem (restricted to `𝔭 ∤ 𝔫`) in `H¹_new(𝔫, ℂ)^S` is one-dimensional, so a newform is an
eigenvector of the `U_𝔭` as well, and its bad eigenvalues are `a_𝔭² = 1` when `𝔭 ‖ 𝔫` and
`a_𝔭 = 0` when `𝔭² ∣ 𝔫` (the weight-two case of Atkin–Lehner–Li's bad-prime
classification, proved here through 4.4 and 5.2 as the modular-forms roadmap's Layer 4 proves it
over `ℚ`). Prove that normalized new eigenlines span `H¹_new(𝔫, ℂ)^S` (§3.2's archimedean dimension one,
local newvector dimension one at the conductor, and §4.6 semisimplicity).

- A new eigensystem has a one-dimensional eigenspace and a unique arithmetic normalization.
- Its bad-prime eigenvalues square to 1 at conductor exponent one and vanish at exponent at least two.
- Normalized new eigenlines span the central-invariant newspace.

**Checks.**

- `121.1-a` is a newform of level `(11)`, and `a_{(11)}² = 1` at the exact divisor `(11)`.
- `100.2-a` is a newform of level `(10)`: `a_{(1+i)} = 0` since `(1+i)² ∣ (10)`, and
  `a_{(2±i)} = −1`, whose squares are `1`.
- (reject) A `U_{(1+i)}`-eigenvector in the two-dimensional span of the oldforms of `121.1-a` at
  level `(11)(1+i)` (5.2's check) is an eigenform of that level but not a newform.

*Needs:* §5.2 newspace; §4.6 semisimplicity; GL2AutomorphicRepresentationsAndTransfer R16.2 local newvectors.

### 5.4 Strong multiplicity one

Prove: two newforms `F` of level `𝔫` and `F'` of level `𝔫'` with `a_𝔭(F) = a_𝔭(F')` for all but
finitely many `𝔭` satisfy `𝔫 = 𝔫'` and `F = F'`. The route is through 3.1 and the `GL₂`
automorphic representations roadmap's strong multiplicity one (R16.4.4) together with the
newvector theory identifying the level with the conductor of `π_F`; state separately the
fixed-level version (two newforms of level `𝔫` agreeing off a finite set are equal), which has
the elementary proof through 5.2's Main Lemma.

*Needs:* §3.1 adelization; GL2AutomorphicRepresentationsAndTransfer R16.4 strong multiplicity one and R16.2 local conductor.

### 5.5 Atkin–Lehner and Fricke operators

For `𝔮 = 𝔭ᵉ ‖ 𝔫` define `W_𝔮` on pairs by the pinned formula and transport it to the total
space (the targets atkinLehner, taking the exact-divisor hypothesis
`∃ 𝔫', 𝔫 = 𝔮𝔫' ∧ 𝔮 ⊔ 𝔫' = ⊤` as an argument, and `fricke := W_𝔫`, whose hypothesis is the
elementary identity 𝔫 = 𝔫·1 with 𝔫 + 1 = 1) and prove: it is well defined
(`M_𝔮/(𝔮L ∩ M_{𝔫'}) ≅ 𝓞_K/𝔫`), `GL₂(K)`-equivariant, moves the Steinitz class by `[𝔮]`,
`W_𝔮² = S_𝔮` (`W_𝔮²(L, M) = (𝔮L, 𝔮M)`), which is the identity on `H¹_cusp(𝔫)^S` and, for
principal `𝔮`, on the total space, but moves the components by `[𝔮]²` otherwise, `W_𝔮 W_𝔮' = W_𝔮' W_𝔮`
for distinct exact prime-power divisors, `W_𝔫 = ∏_{𝔮} W_𝔮` with `W_𝔫(L, M) = (M, 𝔫L)` the
**Fricke operator**, `W_𝔮 T_𝔭 = T_𝔭 W_𝔮` for `𝔭 ∤ 𝔫`, and `W_𝔮 U_𝔭 W_𝔮 = U_𝔭^*` (the adjoint)
on `H¹_cusp(𝔫)^S` for `𝔭 ∣ 𝔮`. Prove the matrix form for `h_K = 1` and `𝔫 = (N)`: `W_𝔫 F = F ∣ (0, −1; N, 0)`, and
for `𝔮 = (Q)`, `W_𝔮 F = F ∣ (Qa, b; Nc, Qd)` with `Q²ad − Nbc ∈ Q 𝓞_Kˣ`; the independence of the
choice of `a, b, c, d` is part of the statement. All operators act on the GL₂ total space. On SL₂-level they act between the
determinant-marked summands of §4.8; an identification with one summand retains its marking data.

- The intermediate-lattice formula is equivariant and preserves the level-pair quotient.
- Its square is S_𝔮, distinct exact factors commute, and their product is the Fricke operator.
- On central invariants these are involutions; the matrix formula is independent of the chosen matrix satisfying its determinant condition.

**Checks.**

- For 𝔮 = 𝔫 the complementary divisor is 1, so 𝔫 + 1 = 1 and the exact-divisor condition holds.
- For `h_K = 1` and `𝔫 = (N)` the Fricke operator is the slash by `(0, −1; N, 0)`, and
  `W_𝔮² = S_𝔮` is the identity on the whole total space.
- Over `ℚ(√−23)` and a nonprincipal exact divisor `𝔮`, `W_𝔮²` carries the component of class `c`
  to that of `c[𝔮]² ≠ c`.
- (reject) At `𝔫 = (10)` over `ℚ(i)` the prime `(1+i)` is not an exact divisor
  (`(1+i)² ∣ (10)`): `W_{(1+i)}` is undefined, and the operator at that prime is `W_{(2)}`.

*Needs:* §4.1 pairs; §5.1 intermediate lattices; §2.6 adjoints; §4.8 determinant markings.

### 5.6 Atkin–Lehner eigenvalues

Prove that a newform is an eigenvector of every `W_𝔮` with eigenvalue `w_𝔮(F) ∈ {±1}` (5.3's
multiplicity one and `W_𝔮² = S_𝔮 = 1` on `H¹_cusp(𝔫)^S`; the target alEigenvalue F 𝔮), that `w_𝔫(F) = ∏_𝔮 w_𝔮(F)`, and that `a_𝔭(F) = −w_{𝔭}(F)`
for 𝔭 ‖ 𝔫. For this last identity, use the unramified Steinberg twist
π_𝔭 = St ⊗ μdet, with μ² = 1: the arithmetic U eigenvalue is μ(ϖ) and the
Atkin–Lehner matrix has eigenvalue −μ(ϖ). The latter is computed in the Iwahori
line: summing the q+1 translates into the spherical level gives 0 because St
has no spherical vector, and isolates U+W. This fixes the minus sign, rather
than inferring it from the involution alone. The local representation and conductor
inputs are GL2AutomorphicRepresentationsAndTransfer §§R16.2.1 and R16.3.2
(Casselman, principal/special case p.305, as located in R16.2.1); the q cosets
are §4.3 and the trace is §5.1. The **`AL_eigs`** column is the list
of `w_𝔭(F)` over the primes `𝔭 ∣ 𝔫`, where `w_𝔭` means `w_𝔮` for the exact divisor `𝔮 = 𝔭ᵉ`.
The **sign** is `ε(F) := −w_𝔫(F)`, minus the Fricke eigenvalue (the target sign).

**Checks.**

- `100.2-a`: `w_{(2)} = −1`, `w_{(2±i)} = +1 = −a_{(2±i)}`, Fricke eigenvalue
  `(−1)(+1)(+1) = −1`, so `ε(F) = +1`.
- `121.1-a`: `a_{(11)} = 1` gives `w_{(11)} = −1`, the Fricke eigenvalue, so `ε(F) = +1`.
- `10000.1-b` and `34225.3-a` have `AL_eigs` `−1, 1`, Fricke eigenvalue `−1` and `ε = +1`;
  `16384.1-d` has `AL_eigs = −1` and `ε = +1`.
- (reject) The sign is not `+w_𝔫`: for `100.2-a` that would give `−1`, against root number `+1`
  and analytic rank `0`.

*Needs:* §4.3 cosets; §5.1 trace; §5.3 new multiplicity one; §5.5 involutions;
GL2AutomorphicRepresentationsAndTransfer §§R16.2.1 and R16.3.2 Steinberg twist.

### 5.7 Galois conjugates and real newforms

For an embedding `σ : ℚ(F) → ℂ` define `F^σ` as the newform with eigensystem `σ ∘ a` (exists by 4.7,
unique by 5.4), prove `ℚ(F^σ) = σ(ℚ(F))`, `w_𝔮(F^σ) = w_𝔮(F)`, and that the orbit of `F` under
embeddings has size `[ℚ(F) : ℚ]` — the LMFDB's **dimension** again, this time as an orbit size —
and that the `ℚ`-irreducible Hecke submodule `V ⊂ H¹_new(𝔫, ℚ)^S` with `F ∈ V ⊗ ℂ` has
dimension `[ℚ(F) : ℚ]`, `V ⊗ ℂ` being spanned by the `F^σ` (the knowl `mf.bianchi.spaces`' dimension; the
analogue of the modular-forms roadmap's Layer 8G).
Prove that the **complex conjugate form** `F̄` (coefficients `conj c(𝔪)`) equals `F` (the
eigenvalues are real), so no "dual" column exists for Bianchi newforms, and that the
**Galois-conjugate form** `F^τ` under `τ : K → K` complex conjugation (`c(𝔪, F^τ) = c(τ𝔪, F)`,
level `τ𝔫`) is a newform of level `τ𝔫`, equal to `F` when `F` is a base change (7.3).

- Coefficient embeddings give unique conjugate newforms and transport their Hecke fields.
- The orbit has size the coefficient-field degree, and each rational Atkin–Lehner sign is fixed.
- Conjugating the base field transports level and ideal coefficients, while complex conjugation of the coefficients fixes a trivial-central-character form.

**Checks.**

- For rational eigenvalues the coefficient-field orbit has size 1.
- For the abstract coefficient-field element √2, the two embeddings give √2 and −√2 and the orbit has size 2.
- Conjugating ideals preserves their norms; the total Dirichlet coefficients of F and F^τ agree even when their individual ideal coefficients differ.

*Needs:* §4.7 rational Hecke algebra; §5.4 uniqueness.

### 5.8 Rational extension of the symbol pairing

Let M = ⊕_Γ H₁(X_Γ,∂X_Γ;ℚ) and C = ⊕_Γ C_Γ as in §3.5, at fixed level 𝔫,
and let B = M/C = im(∂) ⊂ ⊕_Γ H₀(∂X_Γ;ℚ). For a rational cuspidal new
eigensystem a of trivial central character, construct a polynomial Q in finitely many
good-prime Hecke operators, with rational coefficients, annihilating B and with Q(a) ≠ 0.
Here the boundary quotient is degree-zero cusp homology; it is not the whole boundary
cohomology or a residual non-Eisenstein localization.

- Compute its Hecke action from §0.4's cusp orbits and §4.2's transpose correspondence.
  Over a finite character splitting field, each simultaneous eigencharacter on the
  full cusp H₀ has value N𝔭·χ₁(𝔭)+χ₂(𝔭) off a finite set, for finite-order
  ray class characters χ₁,χ₂; B has a subset of these eigencharacters.
  The two diagonal translations act on the finite Levi cusp sets as commuting
  permutations; describe each finite set as a quotient of ray class groups at its
  transported level and decompose its rational permutation module after adjoining
  the requisite roots of unity. The coefficients N𝔭 and 1 are the full unnormalized spherical
  Satake transform. Obtain this from ArithmeticLocallySymmetricSpaces ALS.4.2–4.3
  (Newton–Thorne, arXiv:1511.04913v1, Lemma 2.4(1), pp.9–10,
  and Proposition 3.4, p.29),
  using every transported Levi level. Pass to a neat finite cover and descend by
  the finite deck group over ℚ. The passage to finite ray class characters is the
  GL₂/K degree-zero specialization, using GlobalNumberFields Layers 2 and 9.
- Separate the boundary spectrum from a using §4.6: choose a prime off this finite
  set and the level with q = N𝔭 ≥ 7. Each boundary eigenvalue β has
  |β| ≥ q−1 > 2√q ≥ |a_𝔭|, since |χᵢ(𝔭)| = 1. Set Q(X) to the characteristic
  polynomial of T_𝔭 on B over ℚ. Cayley–Hamilton gives Q(T_𝔭)B = 0 and
  separation gives Q(a_𝔭) ≠ 0. If B = 0 use Q = 1. This supplies a polynomial
  for every level and every rational cuspidal new eigensystem; the auxiliary prime
  used in the proof does not restrict the all-prime Hecke module.
- Define relative evaluation by ⟨m,v⟩ = ⟨Q(T)m,v⟩/Q(a) for v in the a-eigenline
  and m ∈ M. Prove agreement with integration of the rapidly decreasing harmonic
  representative from §3.2, using Hecke equivariance and Q(T)m ∈ C. It is therefore
  independent of Q. After clearing the polynomial's coefficients, its numerator
  is integral on the image lattices of §§1.6 and 3.5; no assertion of integral
  invertibility of Q(a) is made.

The generic compactification and parabolic Hecke action are supplied; the finite cusp
module, its spectral estimate and this relative pairing are the Bianchi specialization
(Cremona §2.2, Theorem 2, pp.283–284, for the Euclidean symbol model;
Şengün §4, pp.11–12, for correspondence and duality conventions).

**Checks.**

- For scalar boundary action q+1, X−(q+1) annihilates B and
  |a| ≤ 2√q < q+1 gives a nonzero evaluation for q ≥ 2.
- For B = 3·(0,1;1,0), B²−9I = 0, but B−3I has eigenvalue −6.
  At a = 0 the quadratic polynomial evaluates to −9 ≠ 0 over ℚ.
- At q = 7, every boundary eigenvalue has absolute value at least 6, whereas
  2√7 < 6; at q = 2 the bound 1 < 2√2 is insufficient, explaining the
  auxiliary-prime choice. If χ₁ = χ₂ = −1 the boundary eigenvalue is −(q+1),
  so a single factor X−(q+1) does not suffice in general.
- Modulo 3 the denominator −9 is 0; the rational pairing has no such residual claim.
- For B = 0, Q = 1 and Q(a) = 1, so relative evaluation is the existing pairing on C.

*Needs:* §0.4 cusp orbits; §1.6 rational lattices; §3.5 relative module;
§4.2 transpose Hecke maps; §4.6 bound; §5.3 rational new eigenline;
ArithmeticLocallySymmetricSpaces ALS.4.1–4.3 boundary and parabolic action;
GlobalNumberFields Layers 2 and 9 finite ray class characters.

### Examples

The two degeneracy images of 121.1-a span a two-dimensional oldspace (§5.2).

### Dependencies

Layers 3–4; ArithmeticLocallySymmetricSpaces ALS.3.6, ALS.3.14 and ALS.4.1–4.3; GL2AutomorphicRepresentationsAndTransfer R16.4.

## Layer 6: `L`-functions, sign, analytic rank, `L`-ratio

### 6.1 The Dirichlet series and the Euler product

For a newform F specialize `TauCeti.normCoeff` to its ideal arithmetic coefficient
function, so `a_n = ∑_{N𝔪 = n} c(𝔪,F)` by `TauCeti.normCoeff_eq_sum_normFiber`
(the Bianchi specialization dirichletCoeff), and define
`L(F, s) := LSeries a s` (the target LFunction, Mathlib's `LSeries` of these coefficients).
Prove |c(𝔭ʳ)| ≤ (r+1)N𝔭^(r/2) off the level by factoring the recurrence
polynomial, whose two roots have absolute value √N𝔭; at bad primes use
|a_𝔭| ≤ 1. Multiplicativity gives |c(𝔪)| ≤ d(𝔪)N𝔪^(1/2), where d counts
ideal divisors. Consequently c(𝔪) = O(N𝔪^(1/2+ε)) for every ε > 0, hence
also O(N𝔪), and the series converges absolutely for Re s > 3/2 (in particular
for Re s > 2). Use the ideal-divisor Euler product ζ_K(t)² for t > 1, or
its elementary divisor bound. The Ramanujan input is §4.6, namely
ModularityAndLanglandsExtensions §4.40 (BCGNT, arXiv:2309.15880v3,
Theorem E, p.10). For the divisor majorant write d(𝔪) as the number of
factorizations 𝔪 = 𝔞𝔟 and apply
`TauCeti.summable_absNorm_rpow_ideal_iff` twice at t = Re s−1/2 > 1;
then regroup by norm using the supplied `TauCeti.regroupByNorm`. Prove
the Euler product

```text
L(F, s) = ∏_{𝔭 ∤ 𝔫} (1 − a_𝔭 N𝔭^{−s} + N𝔭^{1 − 2s})^{−1} · ∏_{𝔭 ∣ 𝔫} (1 − a_𝔭 N𝔭^{−s})^{−1}
```

on `Re s > 2`, from 4.4's recurrences.

- The finite norm sums define the Dirichlet coefficients and recover the ideal-indexed series in its half-plane of absolute convergence.
- Multiplicativity gives the displayed Euler factors at every prime; the Ramanujan and divisor bounds give absolute convergence for Re s > 3/2.

**Checks.**

- For `121.1-a` over `ℚ(i)`: `a_1 = 1`, `a_2 = c((1+i)) = −2`, `a_3 = 0` (no ideal of norm `3`),
  `a_5 = c((2+i)) + c((2−i)) = 2`, `a_9 = c((3)) = −5`.
- Its Euler factor at `(3)` is the inverse of `1 + 5 · 9^{−s} + 9^{1−2s}`, and at `(11) ∣ 𝔫`
  the inverse of `1 − 121^{−s}`.
- If a = 2√q the repeated-root recurrence gives c(𝔭ʳ) = (r+1)q^(r/2):
  for r = 0,1,2 these are 1, 2√q, 3q. Thus distinct Satake roots are not required.
- (reject) The `L`-function does not determine the form: `2.0.7.1-44.3-a` and its conjugate
  `2.0.7.1-44.4-a` have the same `a_n`, since `N(τ𝔪) = N𝔪`.

*Needs:* §4.4 coefficient recurrence; §4.6 Ramanujan bound; §5.3 bad eigenvalues;
TauCeti.summable_absNorm_rpow_ideal_iff;
TauCeti.regroupByNorm and TauCeti.LSeriesSummable_normCoeff; Mathlib LSeries.

### 6.2 The Mellin transform along the geodesic

For `h_K = 1` prove, on `Re s > 2`,

```text
∫₀^∞ F₂(0, y) y^{2s − 3} dy = (w_K / 4) · Γ(s)² · (√|d_K| / 2π)^{2s} · L(F, s),
```

from MaassForms §2.1(v), specialized to ν = 0:
`∫₀^∞ K₀(λy) y^{s−1} dy = 2^{s−2} λ^{−s} Γ(s/2)²`, for Re s > 0 and λ > 0
(DLMF 10.43.19, with the positive change of scale), and the expansion 2.4 (the sum over
`α ≠ 0` counts each principal ideal `w_K` times). For general `h_K` prove the same identity
component by component: `∑_{c} N𝔞_c^{s−1} ∫₀^∞ F₂^{(c)}(0, y) y^{2s−3} dy` equals the right-hand
side, because the term `α ∈ 𝔞_c` has `N((α)𝔞_c⁻¹) = |α|² / N𝔞_c` and the arithmetic coefficient is c_𝔞(α)/N𝔞.
Under 𝔞 ↦ 2𝔞 the integral scales by 4^(1−s), canceling the weight factor 4^(s−1);
at s = 1 both are 1, so the component sum has no norm weights. Define
`Λ(F, s) := (d_K² N𝔫)^{s/2} Γ_ℂ(s)² L(F, s)` and record
`Λ(F, s) = (d_K² N𝔫)^{s/2} · (16 / w_K) · |d_K|^{−s} · ∑_c N𝔞_c^{s−1} ∫₀^∞ F₂^{(c)}(0, y) y^{2s−3} dy`.

- The Mellin integral recovers the Dirichlet series on Re s > 2 with the displayed gamma and discriminant factors.
- The norm-weighted component sum is independent of ideal representatives and determines the completed function on that half-plane.

**Checks.**

- For representative scaling by 2 and s = 1, the integral and norm weight both scale by 1.
- For s = 2 they scale by 1/4 and 4, whose product is 1.
- For s = 3 they scale by 1/16 and 16, whose product is 1; using exponent s would instead introduce a factor 4.
- At ν = 0, μ = 2 and λ = 1, integration of the defining kernel gives
  ∫₀∞ sech²(t)dt = 1 = 2⁰Γ(1)²; λ = 2 gives 1/4 on both sides.
- At μ = ν = 0 the integral diverges near 0; the strip excludes this value.

*Needs:* §2.4 expansion; §2.5 coefficient normalization; MaassForms §2.1(v) Mellin transform, Re μ > |Re ν|, specialized with ν = 0 and λ > 0.

### 6.3 The functional equation and the sign

Prove that `Λ(F, s)` extends to an entire function with

```text
Λ(F, 2 − s) = ε(F) · Λ(F, s),      ε(F) = −w_𝔫(F) ∈ {±1},
```

for `h_K = 1` and `𝔫 = (N)` by the classical argument: split the Mellin integral at
`y = |N|^{−1/2} = (N𝔫)^{−1/4}`, apply `W_𝔫` (5.5), which acts through `(0, −1/√N; √N, 0)`, sends
`(0, y)` to `(0, 1/(|N| y))` and pulls `β₂` back to `−β₂` along `x = 0`, so that
`F₂(0, 1/(|N| y)) = −w_𝔫(F) F₂(0, y)`; then `I(s) := ∫₀^∞ F₂(0, y) y^{2s−3} dy` satisfies
`I(s) = −w_𝔫(F) |N|^{2−2s} I(2 − s)`, which with `(d_K² N𝔫)^{s/2} |d_K|^{−s} = |N|^s` is the
functional equation; use the exponential decay of both halves. For general
`𝔫` and `h_K` prove the equation through 3.1 and the `L`-function of `π_F` (the automorphic
`L`-function and its functional equation are consumed from the `GL₂` automorphic representations
roadmap's R16.4 and the Godement–Jacquet theory it cites; the classical statement is that
`L(F, s) = L(π_F, s − 1/2)` and `ε(F)` is the global root number), with the identification of the
root number with `−w_𝔫(F)` proved through the local Atkin–Lehner eigenvalues (the targets
sign of 5.6, completedLFunction, the entire function equal to
`(d_K² N𝔫)^{s/2} Γ_ℂ(s)² L(F, s)` on `Re s > 2`, and completedLFunction_two_sub). Package the result
as an `ArithmeticLFunctionData` of the `L`-functions roadmap (weight `1`, conductor `d_K² N𝔫`,
complex gamma shifts `{0, 0}` in the arithmetic card, root number `ε(F)`, no poles) with
`HasFunctionalEquation`, and prove that its analytic translation has complex gamma shifts
`{1/2, 1/2}` and the same root number. The **`sfe`** column is `ε(F)`.

**Checks.**

- `121.1-a`: conductor `d_K² N𝔫 = 16 · 121 = 1936 = 11 · 176` and `ε(F) = +1`, which is PARI's
  root number of `11a1/ℚ(i)` and `ε(11a1) ε(176b2)` (6.4).
- `100.2-a`: `ε(F) = +1`, PARI's root number of `20a1/ℚ(i)`, with Fricke eigenvalue `−1`.
- (reject) The centre is `s = 1` and the reflection `s ↦ 2 − s`; the analytic normalization
  `s ↦ 1 − s` of the `L`-functions roadmap's cards is the translate by `1/2`, not this function.

*Needs:* §3.1 adelization; §5.5 Fricke; §6.2 Mellin transform; GL2AutomorphicRepresentationsAndTransfer R16.4; LFunctions Layer 0.

### 6.4 The sign of a base change and a check

Prove, for `F` the base change of a classical newform `f` of trivial nebentypus (the supplied automorphic base change),
`ε(F) = ε(f) · ε(f ⊗ χ_K)`, where `f ⊗ χ_K` again has trivial nebentypus and both ε are classical root numbers, equal at weight two to minus Tau
Ceti's Fricke signs (`frickeCompletedL_sub_eq`, stated for `f.χ = 1`), from
`L(F, s) = L(f, s) L(f ⊗ χ_K, s)` (GL2AutomorphicRepresentationsAndTransfer R17.4.3) and the uniqueness of the functional equation's root
number (the `L`-functions roadmap's `HasFunctionalEquation` determines it). Check against Tau Ceti's
classical Fricke sign: for `11a1` over `ℚ(i)`, `ε(11a1) = ε(176b2) = +1`, whereas
both Fricke signs are −1. Thus (−w_f)(−w_twist) = (−1)(−1) = +1, the Bianchi root number.
The factor in Tau Ceti's theorem is i² = −1.

*Needs:* §6.3 root number; GL2AutomorphicRepresentationsAndTransfer R17.4.3 all-place base change; Tau Ceti frickeCompletedL_sub_eq.

### 6.5 The analytic rank

Define `analyticRank F := analyticOrderNatAt (Λ(F, ·)) 1`, the order of vanishing of the entire
continuation at the central point `s = 1` (never of Mathlib's `LSeries`, which is `0` off its
half-plane of convergence), prove `Λ(F, ·) ≠ 0` so the order is finite, prove the **parity**
`(−1)^{analyticRank F} = ε(F)` from 6.3, and record the LMFDB's three displayed states: `0` when
`L(F, 1) ≠ 0`; odd when `L(F, 1) = 0` and `ε(F) = −1`; `≥ 2` and even when `L(F, 1) = 0` and
`ε(F) = +1`. The **`anrank`** display is a function of Lratio (6.6) and `sfe`. The exact rank,
when positive, is a conditional datum of the database and is not a target.

- The continuation is nonzero, so its central vanishing order is finite.
- The parity of that order is its root number; order zero is equivalent to a nonzero central value.

**Checks.**

- `analyticRank F = 0` for `121.1-a` (`L(11a1, 1)/Ω = 1/5`, `L(176b2, 1)/Ω = 1`), for `100.2-a`
  and for `10000.1-b` (`Lratio = 2`).
- `34225.3-a` has `ε = +1` and `Lratio = 0`, so its analytic rank is even and at least `2`.
- (reject) `analyticOrderNatAt (LSeries a) 1` is `0` for every `F` (*Boundary and off-hypothesis
  checks*); the definition must use the continuation.

*Needs:* §6.3 continuation and functional equation; Mathlib analyticOrderNatAt.

### 6.6 The global rational period and L-ratio

Let F be a rational normalized newform of conductor 𝔫 and trivial central character.
In the total rational newspace fixed by the central operators, let V_F be its good-prime
Hecke eigenspace. Prove dim_ℚ V_F = 1 by §5.3 and rational descent, and intersect V_F
with the global integral lattice of §1.6. Choose one primitive generator v_F; the only
ambiguity is its simultaneous sign. Some component projections may be zero. Define Ω_F ∈ ℂ×
by ES(F) = Ω_F v_F. For z_c = {0,∞} in the relative module of §3.5 define

    Lratio(F) = |Σ_c ⟨z_c,v_F⟩|.

Prove this is a nonnegative rational number using the rational relative pairing of §5.8,
and independent of the simultaneous sign and of representative ideals transported as in §1.5.
Section 6.2 at s = 1 gives, with the oriented signed sum r_F,
L(F,1) = 16π² Ω_F r_F/(w_K |d_K|); the component weights are 1.
Consequently Lratio(F) = 0 if and only if L(F,1) = 0, equivalently analyticRank F > 0.
This is the global lattice version of the period construction (Cremona §1, pp.276–279;
for general ideal classes the owned prerequisites are §§1.6, 3.5 and 5.8).

- The generator lies in one global rational eigenline, not separate lines chosen on each component.
- Relative evaluation is rational after clearing the boundary-annihilating Hecke polynomial;
  its denominator need not be a single a_𝔭−N𝔭−1.
- The normalization of F is its arithmetic coefficient c(𝓞_K) = 1; Ω_F compares this
  normalization with the fixed integral lattice and is nonzero.

**Checks.**

- For a global line spanned by (1,1), the allowed generators are ±(1,1), giving signed
  sums ±2 and absolute value 2. The independent choice (1,−1), giving 0, is not allowed.
- At s = 1 the representative change 𝔞 ↦ 2𝔞 gives integral factor 4⁰ = 1 and weight 4⁰ = 1.
- A component projection 0 contributes 0; no nonzero eigenline on that component is required.
- In class number one the LMFDB examples give ratios 2, 1, 0 for
  2.0.7.1-10000.1-b, 2.0.4.1-16384.1-d, 2.0.4.1-34225.3-a respectively.

*Needs:* §1.6 global lattice; §3.5 compactified pair and §5.8 rational relative pairing; §5.3 new multiplicity one;
§6.2 Mellin identity and §6.3 continuation.

### 6.7 Newforms of `SL₂`-level

Record that the `L`-function and sign are defined only for `GL₂`-level newforms: an `SL₂`-newform
that is not `𝓞_Kˣ`-invariant has no multiplicative coefficient map indexed by ideals (its `c_𝔞(α)`
depends on `α` beyond `(α)`), and the LMFDB attaches no `L`-function to it.

*Needs:* §4.8 determinant markings; §6.1 normalized ideal coefficients.

### Examples

A primitive global eigenvector (1,1) gives absolute period sum 2 under either simultaneous sign (§6.6).

### Dependencies

Layers 3–5; MaassForms §2.1(v); LFunctions Layer 0; GL2AutomorphicRepresentationsAndTransfer R16.4 and R17.4.3 for the base-change sign.

## Layer 7: twists, base change, CM

### 7.1 Twists by finite-order Hecke characters

For a ray class character `ψ : RayClassCharacter 𝔪` (Tau Ceti; every finite-order Hecke character
is one, `isFiniteOrder_iff_exists_rayClassCharacter`) with values `ψ(𝔭) := ψ(idealClass 𝔪 𝔭)` at
`𝔭 ∉ supp 𝔪`, and a newform `F` of level `𝔫`, form the unique cuspidal automorphic twist π_F ⊗ (ψ ∘ det), with central character ψ² and
conductor dividing `lcm(𝔫, 𝔣_ψ²)` with `𝔣_ψ` the conductor of `ψ`, with local eigenvalue `a_𝔭(π_F ⊗ ψ) = ψ(𝔭) a_𝔭(F)`
for all `𝔭 ∤ 𝔫 𝔣_ψ` (the targets twist, for quadratic `ψ`, twistLevel with
`twistLevel_dvd : twistLevel F ψ ∣ 𝔫 · 𝔪²`, and twist_eigenvalue): existence
through 3.1 and the twist `π_F ⊗ (ψ ∘ det)` of the automorphic representation (when ψ² = 1 its newvector descends to the Bianchi newform F ⊗ ψ of §5.3);
uniqueness on the general carrier is strong multiplicity one (GL2AutomorphicRepresentationsAndTransfer R16.4). Prove
`(F ⊗ ψ) ⊗ ψ' = F ⊗ ψψ'` off the bad primes and `F ⊗ 1 = F`. The trivial central character is
preserved only for `ψ² = 1`; for general `ψ` the twist has central character `ψ²` and lies outside
the trivial-central-character spaces `H¹_cusp(𝔫')^S` (for an unramified `ψ` with `ψ² ≠ 1` it lies
in the total space `H¹_cusp(𝔫)` itself, in the `ψ²`-part of 1.5), so state the level bound and
eigenvalue rule for all `ψ` but the membership in `H¹_cusp(𝔫', ℂ)^S` for quadratic `ψ` only.

For a quadratic `ψ ≠ 1` of modulus `𝔪`, define the **quadratic extension cut out by `ψ`**,
`L_ψ := classField K (globalClassField K N_ψ)` with `N_ψ := ker (ψ ∘ rayClassQuotient 𝔪)`, an
open subgroup of index `2` of the idele class group `C_K` (`rayClassQuotient` is surjective with
kernel the ray subgroup, `ker_rayClassQuotient`), and prove `[L_ψ : K] = 2` (`globalClassField_index`)
and the **splitting dictionary**: for `𝔭 ∉ supp 𝔪`, `ψ(𝔭) = 1` exactly when `𝔭` splits in
`L_ψ`, from `rayClassArtinMap_idealClass` and `globalArtinMap_isArithFrobAt` (the class-field-theory
roadmap's Layers 12 and 11). Checks: for `K = ℚ(√−7)` and `ψ = χ₅ ∘ N_{K/ℚ}`, `L_ψ = K(√5)` and the
prime `(√−7)` (residue field `𝔽₇`, `5` not a square) is inert, `ψ((√−7)) = (5/7) = −1`; the
trivial character is excluded because `N_1 = C_K` has class field `K`.

- Twisting multiplies central character by ψ² and good-prime coefficients by ψ(𝔭); successive twists multiply their characters.
- The trivial twist is the identity, and quadratic twists remain in the trivial-central-character newform carrier.
- For a nontrivial quadratic ray character the class field has degree two, and its unramified splitting condition is ψ(𝔭) = 1.

**Checks.**

- `F ⊗ 1 = F`, and `(F ⊗ ψ) ⊗ ψ = F` for quadratic `ψ`.
- `2.0.7.1-10000.1-b` equals its own twist by `ψ = χ₅ ∘ N_{K/ℚ}` (7.6), so `a_𝔭 = 0` wherever
  `ψ(𝔭) = −1`, e.g. at `(√−7)`.
- `2.0.11.1-256.1-a` has a base change `F ⊗ ψ` for a quadratic `ψ` that is ramified at
  `(√−11)` and so is not of the form `χ ∘ N_{K/ℚ}` (7.4's boundary check).
- (reject) For an order-`3` character `χ` of `Cl(ℚ(√−23))` the twist of the base change of
  `11a1` has central character `χ² ≠ 1` and leaves the trivial-central-character spaces (1.5).

*Needs:* §3.1 adelization; §5.3 newforms; GL2AutomorphicRepresentationsAndTransfer R16.4 twists; ClassFieldTheory Layers 11–12.

### 7.2 Classical newforms and their eigenvalue systems

Consume Tau Ceti's `HeckeRing.GL2.Newform N 2` with nebentypus `χ_f` and eigenvalues `a_p(f)` at
`p ∤ N`. Prove, for a quadratic character `χ_K` of conductor `|d_K|` (the Kronecker character of
`K`, defined from `d_K` and compared with the splitting of primes through the completed
number-field-arithmetic roadmap's Layer 1), that `χ_f ∘ N_{K/ℚ}` is trivial exactly when
`χ_f ∈ {1, χ_K}` — the two characters whose newforms can base change to trivial central character.

**Checks.**

- A trivial rational central character restricts to the trivial character over K.
- The quadratic character χ_K also restricts trivially; at an inert prime its value is −1 and residue-degree two gives (−1)² = 1.
- The kernel has these two characters; a character with nontrivial restriction cannot define a trivial-central-character Bianchi newform.

*Needs:* ClassFieldTheory Layers 11–12 norm reciprocity; the classical newform central character.

### 7.3 Base change

Define IsBaseChangeOf F f, for a Bianchi newform `F` and Tau Ceti's classical
`f : HeckeRing.GL2.Newform N 2` (eigenvalues `a_p(f)` at `p` coprime to `N`, nebentypus
`χ_f = dirichletLift`), by the pinned rule: for every rational prime `p` with `p ∤ N` and
`p ∤ d_K`, and every prime `𝔭 ∣ p𝓞_K`, `a_𝔭(F) = a_p(f)² − 2 χ_f(p) p` when `𝔭 = p𝓞_K` (`p`
inert) and `a_𝔭(F) = a_p(f)` otherwise (`p` split). It is a relation between eigenvalue systems,
and prove the **existence theorem** (exists_isBaseChangeOf): for every
classical newform `f` of weight `2`, level `N` and nebentypus `χ_f ∈ {1, χ_K}`, there is a Bianchi
newform `F` of level dividing `N𝓞_K` (with equality when `(N, d_K) = 1`) with IsBaseChangeOf F f,
**unless** `f` has CM by `K` (`f ⊗ χ_K = f`), in which case the eigenvalue system `𝔭 ↦` (rule)
is Eisenstein — it is `ψ(𝔭) + ψ̄(𝔭)` for the Hecke character `ψ` of `K` with `f = θ_ψ` — and occurs
in `H¹_Eis` and not in `H¹_cusp`. The route: the quadratic base change of the `GL₂` automorphic
representations roadmap (R17.4.2) applied to `π_f` (R16.6.1), the Satake rule R17.4.1 (`A_v ↦ A_v^f`,
whose trace at `f = 2` is `a_p² − 2 χ_f(p) p`), the cuspidality criterion R17.4.5 (non-cuspidal
exactly when `π_f ⊗ χ_K ≅ π_f`), and 3.1 to descend to a newform. Prove the `L`-function
identity `L(F, s) = L(f, s) L(f ⊗ χ_K, s)` with every Euler factor, including wild
places: apply local Weil–Deligne restriction and Artin induction
(GL2AutomorphicRepresentationsAndTransfer R17.4.3). Coprimality is needed for the simple
conductor equality, not for this L-function identity, and the conductor relation for the base change in general as a statement about
`π_F`'s conductor (the local base change of the conductor exponent is not a closed formula at
`p ∣ d_K` with `p ∣ N`, and the level of `F` is defined as the conductor of `π_F`, 5.4). Prove
uniqueness: `IsBaseChangeOf F f ∧ IsBaseChangeOf F f' ⟹ f' = f ∨ f' = f ⊗ χ_K` (strong
multiplicity one over `ℚ`, the modular-forms roadmap's Layer 5), and the converse `F` of `f` and
of `f ⊗ χ_K` coincide. Prove `F^τ = F` for a base change (5.7). For trivial nebentypus,
at p ∥ N with p ∤ d_K, let r be the residue degree of 𝔭/p. The Steinberg parameter
restricts with a_𝔭 = a_p^r, so w_𝔭 = −(−w_p)^r. Split primes preserve w_p;
inert primes have w_𝔭 = −1 (R17.4.3 retains the monodromy operator).

**Local checks.**

- For 11a1 ⊗ χ₋₄ at p = 11, a_p = −1 and w_p = +1. In ℚ(i) the prime is inert:
  a_(11) = (−1)² = 1 and w_(11) = −1.
- For split multiplicative reduction a_p = 1; residue degrees 1 and 2 both give a_𝔭 = 1.
- The twist has level 176 and gcd(176,4) = 4, but has the same base change as 11a1.
  At 2 its rational local factor is 1; that of 11a1 is (1+2T+2T²)⁻¹. Their product is
  the factor at (1+i), which has norm 2. Thus the ramified factor is retained.


- The base-change relation determines a unique Bianchi newform when the classical form has no self-twist by χ_K.
- Its cuspidal descents are f and f ⊗ χ_K, with the same all-place base change.
- The Euler-product identity includes ramified places through Weil–Deligne restriction, and the base-change form is fixed by conjugation of K.

**Checks.**

- `121.1-a` is the base change of `11a1`: `a_{(3)} = (−1)² − 6 = −5`,
  `a_{(7)} = (−2)² − 14 = −10`, `a_{(2±i)} = a₅ = 1`, `a_{(3±2i)} = a₁₃ = 4`.
- `100.2-a` is the base change of both `20a1` and `80b1 = 20a1 ⊗ χ₋₄` (uniqueness up to `χ_K`),
  with `a_{(3)} = (−2)² − 6 = −2` and `a_{(19)} = (−4)² − 38 = −22`.
- `16384.1-d` is the base change of the level-`512` newform with coefficient field `ℚ(√2)`:
  `a_{(3)} = 2 − 6 = −4`, `a_{(7)} = 8 − 14 = −6`.
- (reject) For `f = 32a` over `ℚ(i)` the relation holds for the Eisenstein system, and no newform
  `F` exists (`f ⊗ χ_K = f`).

*Needs:* §3.1 adelization; §5.3 newforms; GL2AutomorphicRepresentationsAndTransfer R16.6.1 and R17.4.1–R17.4.5.

### 7.4 Base change and twists; the `bc` sign

Define `IsBaseChange F := ∃ N f, IsBaseChangeOf F f` and
`IsTwistOfBaseChange F := ∃ ψ quadratic, IsBaseChange (F ⊗ ψ)`, with `N` ranging over positive
integers and `f` over `HeckeRing.GL2.Newform N 2`. Prove that the classical form is forced to have `χ_f ∈ {1, χ_K}`: by 5.4
and 3.1, `π_F` is the base change of `π_f`, whose central character is `χ_f ∘ N_{K/ℚ}`, and `F`
has trivial central character, so 7.2 applies. Prove: `IsBaseChange F ⟺ F^τ = F`
(the Galois-conjugate newform of 5.7 equals `F`), the Bianchi case of cyclic descent (R17.4.4,
supplied there), and that IsTwistOfBaseChange is strictly weaker (the check in the worked
examples). The LMFDB's `bc` is positive for base changes and negative for twists of base changes
that are not base changes; its absolute value is 7.5's integer for `F` when `F` is a base change
and for a base change `F ⊗ ψ`, `ψ` quadratic, when `F` is a twist of one (the page's "twist of
the base change of a form over `ℚ` with coefficients in `ℚ(√d)`").

- Base change is equivalent to invariance under conjugation of K.
- A quadratic twist of a base change need not itself be a base change; the two predicates give the stated sign distinction.

**Checks.**

- IsBaseChange holds for `121.1-a` and `100.2-a` (`bc = 1`).
- `2.0.7.1-10000.1-b` has `IsTwistOfBaseChange F ∧ ¬ IsBaseChange F` (its eigenvalues at the two
  primes above `11` are `3` and `−3`, so `F^τ ≠ F`) and `bc = −5`; `2.0.11.1-256.1-a` has the same
  two properties and `bc < 0`.
- Of the three ideals of norm `100` in `ℤ[i]` only `(10)` is `τ`-stable, so only level `100.2`
  can carry a base change.

*Needs:* §7.3 base change; GL2AutomorphicRepresentationsAndTransfer R17.4.4 descent.

### 7.5 The coefficient field of the classical form

For a base change `F` of `f` define `bcField F := CoefficientField f` (the modular-forms roadmap's
Layer 8); prove it is independent of the choice of `f` (7.3's uniqueness: `f` and `f ⊗ χ_K` have
the same coefficient field) and that `ℚ(F) ⊂ bcField F` with `[bcField F : ℚ(F)] ∈ {1, 2}`, the
degree being `2` exactly when `f` has an inner twist by `χ_K` (`f ⊗ χ_K = f^σ`, `σ ≠ 1`), in which
case, writing bcField F = ℚ(F)(√δ) for δ ∈ ℚ(F)× not a square,
a_p(f) ∈ ℚ(F) for split good p and a_p(f) ∈ √δ·ℚ(F) for inert good p.
To prove the field assertion, work in a normal closure of CoefficientField f:
an automorphism fixes all base-change eigenvalues exactly when it carries f to
f or f ⊗ χ_K, by the cuspidal fibre theorem of
GL2AutomorphicRepresentationsAndTransfer §R17.4.6 (Langlands, §11,
Lemma 11.6(b), p.205 of the IAS electronic transcription). The fixed-field theorem gives degree at most two;
in degree two its nontrivial automorphism acts as χ_K(p) on a_p at good primes.
Thus the ±1 eigenspaces are ℚ(F) and √δ·ℚ(F). This is a deduction from the
supplied fibre theorem and coefficient conjugation, not an additional base-change theorem. The LMFDB's integer
`|bc|` is `1` when `bcField F = ℚ` and the squarefree `d > 1` with `bcField F = ℚ(√d)` when the
field is quadratic (the knowl's "coefficients in `ℚ(√d)`"); the general statement is the field.
Check, the knowl's phenomenon of a classical newform with quadratic Hecke field whose base change
is rational: `2.0.4.1-16384.1-d` is the base change of the newform `f` of level `512` with
coefficient field `ℚ(√2)`, `a₃(f)² = 2` and `a₇(f)² = 8`, so `a_{(3)}(F) = 2 − 6 = −4` and
`a_{(7)}(F) = 8 − 14 = −6`, while `a₅(f) = 2`, `a₁₃(f) = 6` are rational; `bcField F = ℚ(√2)`,
`ℚ(F) = ℚ`, and the LMFDB's `bc` is `2`.

- The classical coefficient field is unchanged by the two possible descents.
- Its degree over the Bianchi field is at most two, and degree two is equivalent to the specified nontrivial inner twist.
- In the quadratic case, split and inert good-prime coefficients lie in the +1 and −1 eigenspaces of the relative field involution respectively.

**Checks.**

- `16384.1-d`: `bcField F = ℚ(√2)`, `ℚ(F) = ℚ`, `[bcField F : ℚ(F)] = 2`, `bc = 2`.
- `121.1-a`: `bcField F = ℚ`, `bc = 1`; for `100.2-a` both `20a1` and `80b1` give `ℚ`.
- In ℚ(√2), the involution sends √2 to −√2 and fixes 2; the eigenspaces are
  ℚ and √2ℚ. For a general base field ℚ(F), the relative radicand δ belongs
  to ℚ(F)× and need not be a rational squarefree integer.
- `10000.1-b`: `|bc| = 5`, the field `ℚ(√5)` of the base change `F ⊗ ψ`.

*Needs:* §7.3 uniqueness up to χ_K; §4.7 coefficient fields;
GL2AutomorphicRepresentationsAndTransfer §§R17.4.2 coefficient conjugation and
R17.4.6 cuspidal fibres; ModularForms Layer 8G conjugate newforms;
Mathlib finite Galois fixed-field correspondence.

### 7.6 CM forms

Define `IsCM F := ∃ 𝔪 (ψ : RayClassCharacter 𝔪), ψ ≠ 1 ∧ ψ² = 1 ∧ F ⊗ ψ = F`, equivalently
`ψ(𝔭) a_𝔭(F) = a_𝔭(F)` for all `𝔭 ∉ supp 𝔪 ∪ supp 𝔫`, equivalently `a_𝔭(F) = 0` whenever
`ψ(𝔭) = −1` (the knowl `mf.bianchi.cm`'s characterization). Prove that a self-twisting
character is quadratic (compare central characters), that `F` is the automorphic induction of
a Hecke character `Ψ` of `L_ψ` (7.1) for each CM character `ψ` (consumed from R17.4.5's
identification of the quadratic exceptional case with induction), so that `L(F, s) = L(Ψ, s)` is a
Grossencharacter `L`-function of the `L`-functions roadmap's Layer 6, and that the CM characters
of `F` form a group of order `1` or `2`. For the last: if `ψ₁ ≠ ψ₂` were two nontrivial CM
characters, write `F = Ind Ψ` from `L_{ψ₁}`; then `F ⊗ ψ₂ = Ind(Ψ · (ψ₂ ∘ N))` with
`ψ₂ ∘ N_{L_{ψ₁}/K} ≠ 1` (its kernel on characters of `K` is `{1, ψ₁}`), so `Ψ^c = Ψ · (ψ₂ ∘ N)` for
the nontrivial automorphism `c` of `L_{ψ₁}/K`, and the two characters of `ℂˣ` that `Ψ` has at the
two complex places of `L_{ψ₁}` above that of `K` coincide (a finite-order character of `ℂˣ` is
trivial); but they are the archimedean Langlands parameter of `π_F`, which for the cohomological
type of 3.2 is `z ⊕ z̄`, two distinct characters. This is why the classical `D₂` phenomenon of
weight `1` does not occur here. The CM field `L_F := L_ψ` is therefore well defined.

- Self-twist equality is equivalent to vanishing at primes where the quadratic character is −1, by strong multiplicity one.
- Every nontrivial self-twist gives quadratic automorphic induction; the cohomological infinity type makes its nontrivial character unique.

**Checks.**

- `2.0.7.1-10000.1-b` has CM with `L_F = K(√5) = K(√−35)`: `a_𝔭 = 0` at both primes above `2`, at
  `(√−7)` and at the primes above `23`, and `a_𝔭 ≠ 0` at `(3)` and above `11` and `29`.
- `121.1-a` has no CM (`CM = 0`).
- (reject) `ψ = 1` is excluded; the system of `32a2` over `ℚ(i)`, with CM by `K` itself, is
  Eisenstein and belongs to no newform (7.3, 8.4).

*Needs:* §7.1 characters; GL2AutomorphicRepresentationsAndTransfer R17.4 quadratic induction; LFunctions Layer 6.

### 7.7 The CM discriminant

Prove that `L_F` is a **CM field**, hence Galois and biquadratic over `ℚ` with exactly one
imaginary quadratic subfield `M ≠ K` and `L_F = KM`. For the two embeddings `σ₁, σ₂` of `L_F`
extending `ι`, the Hecke character `Ψ` of `L_F` inducing `F` (7.6) has infinity type `σ₁ σ̄₂`
(`z` at one complex place of `L_F` and `z̄` at the other, matching the parameter `z ⊕ z̄` of 7.6).
By Weil's admissibility condition (the infinity type is trivial on a finite-index subgroup of the
units), `σ₁(ε) conj(σ₂(ε))` is a root of unity for every unit `ε` of `L_F`; since
`σ₁(ε) σ₂(ε) = ι(N_{L_F/K} ε)` is a root of unity too, `σ₁(ε)/conj(σ₁(ε))` is one, so a power of
every unit is real under `σ₁`. A totally complex quartic field has unit rank `1` and `𝓞_Kˣ` is
finite, so a unit of infinite order generates a totally real quadratic subfield `L_F⁺`, and
`L_F = K L_F⁺` is biquadratic with third quadratic subfield `M`, imaginary because `K` is and
`L_F⁺` is not. Boundary check: the other infinity type `σ₁ σ₂ = ι ∘ N_{L/K}` is admissible on
every quartic `L ⊃ K` and forces nothing; it is excluded because its parameter at the complex
place of `K` would be `z ⊕ z`. Define `cmDiscriminant F := discr M`
(the target `cmDiscriminant`, with `cmDiscriminant_spec`: `M` is imaginary quadratic,
`discr M ≠ d_K`, and `a_𝔭 = 0` whenever `(discr M / N𝔭) = −1` at odd `N𝔭` with `𝔭 ∤ 𝔫`). Prove: `L_F = K(√d)` for
`d ∈ ℚ^× ∖ ℚ^{×2}` has `M = ℚ(√d)` if `d < 0` and `M = ℚ(√(d · d_K))` if `d > 0`, so the two
descriptions `K(√d) = K(√(d d_K))` give the same `M`. The LMFDB stores a squarefree `d` with
`M = ℚ(√d)` and displays `discr M`; the invariant is `M`. Check: over `K = ℚ(√−7)`,
`K(√−35) = K(√5)`, `M = ℚ(√−35)`, `discr M = −35`. Off-hypothesis check: `K(√(1 + 2i))` over
`ℚ(i)` is a non-Galois quartic field (`(1 − 2i)/(1 + 2i) = (1 − 2i)²/5` is not a square in
`ℚ(i)`), so no weight-two Bianchi newform has CM by it.

- The inducing field is biquadratic over ℚ with a unique imaginary quadratic subfield distinct from K.
- The CM discriminant is that subfield discriminant and is unchanged by replacing d with dd_K in the same quadratic extension of K.

**Checks.**

- `cmDiscriminant F = −35` for `2.0.7.1-10000.1-b`, displayed `−35` since `−35 ≡ 1 mod 4`.
- (reject) It is not `5` for `L_F = K(√5)`: with `d > 0` the invariant is `discr ℚ(√(5 · (−7)))`.
- (reject) `K(√(1 + 2i))` over `ℚ(i)` is not Galois over `ℚ`, so no newform has it as CM field.

*Needs:* §7.6 self-twists and infinity types; ClassFieldTheory Layers 11–12.

### Examples

At inert p = 11 the trace −1 becomes 1 and the Atkin–Lehner sign +1 becomes −1 (§7.3).

### Dependencies

Layers 4–6; GL2AutomorphicRepresentationsAndTransfer R16.6.1 and R17.4.1–R17.4.5; ClassFieldTheory Layers 11–12; LFunctions Layer 6.

## Layer 8: elliptic curves over `K`

### 8.1 From a curve to a newform

For an elliptic curve `E/K`, consume `imaginary_quadratic_modularity` (the elliptic-curve
modularity roadmap): `π_E` is an automorphic representation of `GL₂(𝔸_K)` with
`L(E/K, s) = L(π_E, s − 1/2)`, cuspidal when `E` is geometrically non-CM. Prove, for
geometrically non-CM `E`: `π_E` is a weight-two adelic Bianchi eigenform (the Langlands-extensions
roadmap's §4.27 check), hence by 3.1–3.2 and 5.3 there is a unique newform `F_E` of level the
conductor `𝔫_E` (the elliptic-curves roadmap's Layer 4) with `a_𝔭(F_E) = N𝔭 + 1 − #Ẽ(𝔽_𝔭) =
frobeniusTrace (W.map (mk 𝔭))` for every prime `𝔭` of good reduction of a model `W` minimal at
`𝔭`; `F_E` is rational; `ε(F_E)` is the root number of `E/K` and `analyticRank F_E` is the
analytic rank of `E/K`; `w_𝔭(F_E) = −a_𝔭(E)` at multiplicative primes. Define
`IsModularBy F W := ∀ 𝔭 good for W, a_𝔭(F) = frobeniusTrace (W.map (Ideal.Quotient.mk 𝔭))` for
an integral model `W : WeierstrassCurve (𝓞 K)`, where "`𝔭` good for `W`" is `Δ(W) ∉ 𝔭`
(the targets IsModularBy, HasEllipticCurve), and prove that `IsModularBy F_E W` holds for every
integral model of `E` (good primes of a non-minimal model are good primes of the curve).

- The modular newform of a geometrically non-CM curve has rational coefficients, its conductor as level, and the matching good-prime Frobenius traces.
- The trace equality holds for every integral model at each prime where that model has good reduction.

**Checks.**

- `121.1-a` is modular by `11a1 ×_ℚ K`: `a_{(1+i)} = a₂(11a1) = −2` and, over `𝔽₉`,
  `a_{(3)} = a₃² − 2 · 3 = −5`.
- The condition is empty at primes dividing `Δ(W)`: it says nothing at `(11)`, where
  `a_{(11)} = 1` is 8.5's `w_𝔭 = −a_𝔭(E)`.
- `100.2-a` is modular by both `20a1 ×_ℚ K` and `80b1 ×_ℚ K`, isomorphic over `K`.

*Needs:* EllipticCurveModularityImaginaryQuadratic endpoint imaginary_quadratic_modularity; §3.1 adelization; §5.3 newforms.

### 8.2 The predicate "has an elliptic curve" and `curve_status`

Define `HasEllipticCurve F := ∃ W : WeierstrassCurve (𝓞 K), (W.baseChange K).IsElliptic ∧
IsModularBy F W`. Prove: `HasEllipticCurve F` implies `F` is rational (4.7) and determines the
isogeny class of the curve (Faltings' isogeny theorem, consumed from the elliptic-curve
modularity roadmap's supplier chain as it cites it; stated here as "two curves with the same
`a_𝔭` at almost all `𝔭` are isogenous", a cited theorem, not a target). The LMFDB's
`curve_status ∈ {+1, 0, −1}` records whether a matching curve is in the database (`+1`), is not
but should exist (`0`), or does not exist (`−1`); the mathematical content is the predicate
`HasEllipticCurve F` and the two theorems of 8.3–8.4 that decide it in specific cases. The
converse to 8.1 — that every rational newform has an elliptic curve or a QM abelian surface — is
a conjecture (the knowls `mf.bianchi.2.0.4.1-34225.3-a.top` and `mf.bianchi.2.0.7.1-10000.1-b.top`
exhibit rational newforms with no elliptic curve), and is not stated as a target; `0` is a
database state, not a theorem.

- A matching elliptic curve forces rationality of the newform.
- Matching traces at almost all primes determine the isogeny class, while rationality alone does not imply existence.

**Checks.**

- HasEllipticCurve holds for `121.1-a` (with `W = 11a1 ×_ℚ K`), `16384.1-d` and
  `2.0.11.1-256.1-a`.
- (reject) `2.0.7.1-10000.1-b` has none (8.4: every order of `ℚ(√−35)` has class number `≥ 2`);
  its `curve_status` is `−1`.
- (reject) Rationality does not imply it: `2.0.4.1-34225.3-a` is rational, and the LMFDB attaches
  a QM abelian surface instead.

*Needs:* §8.1 local compatibility; §4.7 Hecke fields; the isogeny theorem in the modularity supplier chain.

### 8.3 Base-change forms and base-change curves

Prove: if `F` is the base change of a rational classical newform `f` whose curve is `E_f/ℚ`
(classical modularity, consumed from the elliptic-curve modularity roadmap's Layer 0 through
Tau Ceti's classical carrier), then `HasEllipticCurve F` holds with `W = E_f ×_ℚ K`
(the elliptic-curves roadmap's base change) — the base-change rule of 7.3 is the statement
`#Ẽ(𝔽_𝔭)` for `𝔭 ∣ p` inert equals `p² + 1 − (a_p² − 2p)`. A curve `E/K` that is a base change
has a base-change form (`F_E` is the base change of the classical form of `E₀` when
`E ≅ E₀ ×_ℚ K`). Prove the two failures of the converse. (i) A base-change form may have curves
none of which is a base change: if `F = BC(f)` with `bcField F ≠ ℚ` (7.5) and `HasEllipticCurve F`,
then a base change `E₀ ×_ℚ K` with form `F` would give the rational newform `f_{E₀}` with
`BC(f_{E₀}) = F`, so `f_{E₀} ∈ {f, f ⊗ χ_K}` by 7.3's uniqueness, and both are irrational; the
knowl `mf.bianchi.2.0.4.1-16384.1-d.top` records such a form (`bc = 2`, 7.5's check), whose curve
is a `ℚ`-curve since `F^τ = F`. (ii) `F_E` is a base change exactly when `E` is `K`-isogenous to its
conjugate `E^τ` (7.4 and the isogeny theorem of 8.2); a `ℚ`-curve in the LMFDB's sense
(isogenous to `E^τ` over `K̄` only) that is geometrically non-CM has
F_E^τ = F_E ⊗ χ for a quadratic character χ: the rank-one geometric Hom module
has Galois action through {±1}. For CM curves use instead the finite-order character
relating the two CM Hecke characters over KM, after matching their CM types by conjugation and automorphic induction (§7.6);
its order need not divide two. The finite-order ratio follows from their identical
infinity types, and local compatibility gives the induced representation of the conjugate.

**Checks.**

- A K-defined isogeny gives χ = 1 in the non-CM case.
- A nontrivial rank-one Galois action has image {±1}, hence a quadratic splitting field.
- Over K = ℚ(i), E: y² = x³+2+i and its conjugate have j = 0 and are geometrically
  isomorphic via (x,y) ↦ (u²x,u³y), with u⁶ = (2−i)/(2+i). At the prime over 13 with
  i = 5 their point counts are 7 and 9 and their traces 7 and 5. These are not quadratic
  twists: unramified quadratic twisting gives ±7, while ramified twisting cannot preserve
  their unramified local representation. Here M = ℚ(√−3) differs from K, as in §8.4.

*Needs:* §7.6 automorphic induction; §8.2 isogeny comparison; the geometric Hom modules
from EllipticCurves Layer 1.
 The `ecnf` columns `base_change` (list of curves over `ℚ`) and `q_curve` are curve-side
predicates of the elliptic-curves roadmap; the form-side `bc` is 7.4's; the comparison theorems
are here.

### 8.4 CM curves

Prove: if `E/K` has CM by an order in an imaginary quadratic field `M`, then (i) for `M = K` the
eigenvalue system `a_𝔭(E)` is Eisenstein (`ψ(𝔭) + ψ̄(𝔭)` for the Grossencharacter `ψ` of `E`),
no cuspidal newform has it, and the LMFDB's `ecnf` page says "Bianchi modular form is not
cuspidal"; (ii) for `M ≠ K` there is a cuspidal newform `F_E` with CM by `KM/K` (7.6), with
`cmDiscriminant F_E = discr M`. Conversely prove: if `F` has CM with CM field `L_F = KM` and
`HasEllipticCurve F`, then the curve has potential CM by an order `𝒪 ⊂ M` and `j(E) ∈ K`. Since
`[ℚ(j(E)) : ℚ] = h(𝒪)` and, for `h(𝒪) = 2`, both conjugates of `j(E)` are real (every class of a
group of order `2` is ambiguous), `ℚ(j(E)) ⊂ K` forces `h(𝒪) = 1`: `j(E)` is one of the thirteen
rational CM `j`-invariants of the knowl `ec.complex_multiplication` and `𝒪` one of the thirteen
class-number-one orders, so `M ∈ {ℚ(√−1), ℚ(√−2), ℚ(√−3), ℚ(√−7), ℚ(√−11), ℚ(√−19), ℚ(√−43),
ℚ(√−67), ℚ(√−163)}`. The same argument with `M = K` shows that (i) occurs only for the nine
class-number-one `K`. The check in the worked examples is `M = ℚ(√−35)` over `K = ℚ(√−7)`: every
order of `M` has class number at least `h(−35) = 2` (`Pic 𝒪 → Pic 𝓞_M` is onto), so no curve
exists.

The degree and conjugation statements are the CM dictionary of
ImaginaryQuadraticClassNumber §H3.1; the thirteen orders are §H3.6, and the
Picard surjection for nonmaximal orders is §H1.4. Only the deduction from j(E) ∈ K
is made here.

**Checks.**

- At discriminant −35 the reduced forms (1,1,9) and (3,1,3) give h = 2.
  Both classes are their own inverses, so both j-values are real of degree 2;
  neither generates a subfield of an imaginary quadratic K.
- At discriminants −3 and −4, h = 1 and j = 0 and 1728 respectively, so j ∈ ℚ ⊂ K.
- The order of conductor 2 in ℚ(i) has discriminant −16 and Picard number 1;
  restricting the thirteen-order assertion to maximal orders would miss it.

*Needs:* §7.6 induction; §7.7 CM field; EllipticCurves Layer 1 CM vocabulary;
ImaginaryQuadraticClassNumber §§H1.4, H3.1 and H3.6.

### 8.5 Local data agreement

Prove `𝔫_{F_E} = 𝔫_E` (conductor equals level) and `w_𝔭(F_E) = −a_𝔭(E) = ∓1` for split and
non-split multiplicative reduction, from the local Langlands compatibility of
`imaginary_quadratic_modularity` ("its finite local parameters agree with the Weil–Deligne
parameters") and the newvector theory; this is the statement behind the LMFDB's linking of a
newform `K-𝔫-x` with the isogeny class `K-𝔫-x` of the same label prefix.

*Needs:* §5.6 local Atkin–Lehner signs; EllipticCurveModularityImaginaryQuadratic local compatibility.

### 8.6 The `L`-function of the curve

Prove `L(E/K, s) = L(F_E, s)` as an equality of `ArithmeticLFunctionData` cards up to
`EqOffZero` (the `L`-functions roadmap's comparison predicate), hence equality of root numbers and
analytic ranks; for base changes, `L(E/K, s) = L(E₀, s) L(E₀ ⊗ χ_K, s)`.

*Needs:* §6.3 arithmetic L-function; §8.5 local compatibility; LFunctions Layer 0 comparison of cards.

### Examples

The two CM curves at the prime above 13 have traces 7 and 5, excluding a quadratic twist (§8.3).

### Dependencies

Layers 5–7; EllipticCurveModularityImaginaryQuadratic endpoint imaginary_quadratic_modularity; EllipticCurves Layers 0.5, 1, 3 and 4; ImaginaryQuadraticClassNumber §§H1.4, H3.1 and H3.6.

## Layer 9: modular symbols and fundamental domains

### 9.1 Oriented cellular relations

For the compactified pair of §3.5, prove a finite presentation of its relative homology
from an equivariant tessellation. Generators are oriented edge orbits; relations are oriented
face boundaries and stabilizer actions with their orientation signs. For a triangular face
with vertices α, β, γ the boundary is {α,β}+{β,γ}−{α,γ} = 0.
A finite set of edge types is allowed; generation by translates of {0,∞} alone is asserted
only when the tessellation proves it (Cremona §2.2, Theorem 2, pp.283–284, and §2.3,
pp.287–290, for the Euclidean cases). The nine class-number-one fields supply worked
geometric presentations, with all required edge types in the non-Euclidean cases.

- The presentation maps each edge to its relative homology class and each face boundary to zero.
- Reversing an edge changes its sign; an element fixing both endpoints preserves it.
- The resulting map is an isomorphism after rationalization, compatible with the boundary
  map and with the compactification comparison of §3.5.

**Checks.**

- The inversion a exchanges 0 and ∞, giving m + a m = m−m = 0.
- The Gaussian matrix l = diag(−i,i) fixes both endpoints, giving m−l m = 0.
- The projective relation l² = 1 does not give 2m = 0: at prime level its boundary
  is 2([∞]−[0]) ≠ 0, because these are different cusps.

*Needs:* §0.6 finite presentation; §3.5 compactified relative homology;
KleinianGroups Layer 2 face pairings.

### 9.2 Cuspidal homology and Hecke compatibility

Prove that the cellular presentation of §9.1 identifies the cuspidal quotient C_Γ
of §3.5 with its geometric homology model and identifies its complex dual with S₂(Γ).
The dimension is dim S₂(Γ) = dim C_Γ. Equivalently, before quotienting absolute cycles
by the image of boundary cycles, it is dim H₁(X_Γ,ℚ) − dim im H₁(∂X_Γ,ℚ).
No second Eisenstein subtraction is made after this quotient (Şengün §3, pp.7–8;
Cremona §2.2, Theorem 2, p.284).

Prove that the lattice correspondences of §4.1 induce the same Hecke action on this
presentation and on cohomology, under the integration pairing. This is a theorem about
maps and relations, independent of any procedure for finding matrices.

**Checks.**

- With absolute-cycle dimension 1 and boundary-image dimension 1, dim C_Γ = 0.
- With dimensions 2 and 1, dim C_Γ = 1 and its perfect dual also has dimension 1.
- Subtracting 1 again in the second case would give 0, contradicting perfect duality.

*Needs:* §3.5 pairing; §4.1 correspondences; §9.1 cellular presentation.

### 9.3 Dimension bookkeeping

Prove `χ(Γ₀(𝔫, 𝔞)) = 0` for the orbifold Euler characteristic (odd dimension, torsion-free
finite-index subgroups have `χ = ½ χ(∂) = 0` with torus boundaries), the duality
`dim H¹_cusp(Γ, ℂ) = dim H²_cusp(Γ, ℂ)`, and the two dimension facts the LMFDB's tables rest on:
`dim H¹(Γ, ℂ) = dim H¹_cusp + #(lattice cusps)` (1.2) and the old/new relation of 5.2. Prove the full level-one classification `cuspidalH1_sl2Image_eq_bot_iff`:
H¹_cusp(PSL₂(𝓞_K),ℂ) = 0 if and only if

d_K ∈ {−4, −8, −3, −20, −24, −7, −11, −15, −19, −23, −31, −39, −47, −71}

(Vogtmann, p.399, complete list and converse). The map `sl2Image` is the image of
SL₂(𝓞_K) in GL₂(K), using `toGLK`; finite central kernel {±1} does not change this
complex cohomology or its cusp-restriction kernel.

**Checks.**

- d_K = −20 lies in the list and gives vanishing although h_K = 2.
- Among the nine class-number-one fields the vanishing cases are −3, −4, −7, −8, −11, −19;
  the cases −43, −67, −163 have positive cuspidal dimension.
- The squarefree radicands 1, 2, 5, 6 give discriminants −4, −8, −20, −24;
  using their negatives as discriminants would exclude valid fields.

*Needs:* §1.2 parabolic cohomology; §0.4 cusp orbits; §9.1 finite cellular presentation.

### 9.4 The Bianchi fundamental domains

For each of the nine class-number-one fields determine §0.3's folded Ford region F_K
explicitly, using Q_K, the fundamental sector for translations and rotations of order w_K/2.
It is a fundamental region for PSL₂(𝓞_K) with one cusp class, and the deliverable is the finite list of hemispheres
`S_{c,d} = {|cx + d|² + |c|² y² = 1}` that carry a face of the floor, with 0.3's bound `B_K` made
explicit. Prove the
**Euclidean case**: for `d_K ∈ {−3, −4, −7, −8, −11}` the floor consists of unit hemispheres
`|c| = 1` alone, and its lowest point has `y² = 1 − M_K` where `M_K` is the Euclidean minimum
`max_x min_{a ∈ 𝓞_K} |x − a|²`: `1/2, 1/3, 4/7, 3/4, 9/11` for `d = 1, 3, 7, 2, 11`, so the
lowest floor heights squared are `1/2, 2/3, 3/7, 1/4, 2/11`. Record the boundary fact for `ℚ(√−11)`
that the hemispheres `S_{2,d}` pass through the lowest vertices of the floor (height² `2/11` is
attained by `|c|² = 4` at `x = 1/2 + i·10/(4√11)`) without contributing a face. For the
non-Euclidean fields prove that hemispheres with `|c| > 1` carry faces: `|c|² = 4` for `d = 19`;
`|c|² ∈ {4, 9}` for `d = 43`, where the hemispheres `S_{±4,d}` (`|c|² = 16`) touch the floor only
at vertices and carry no face; `|c|² ∈ {4, 9, 16, 23}` for `d = 67`; `|c|² ∈ {4, 9, 16, 25, 36}`
and more for `d = 163`; prove the resulting face incidences and fundamental-domain property
(Swan, pp.1–77, geometric fundamental-domain construction). Finite geometric descriptions are mathematical targets, not an enumeration procedure.

*Needs:* §0.3 finite domains; KleinianGroups Layer 2 face-pairing criterion.

### 9.5 Covolumes and the two consumed domains

Record, as acceptance tests of 9.4 against the Kleinian-groups roadmap, that integrating `volume`
over the folded region `F_{ℚ(i)}` gives `catalanConstant / 3` and over `F_{ℚ(ω)}` gives `√3 L(2, χ₋₃) / 8`
(that roadmap's `covolume_bianchiGaussian`, `covolume_bianchiEisenstein`), and that the domains
of its Layer 2 for `Γ(2 + i)` and `Γ(3 + ω)` are tiled by `60`, respectively `168`, translates of
`F_K` (its indices). For the other seven fields `covolume (PSL₂(𝓞_K)) = |d_K|^{3/2} ζ_K(2) / (4π²)`
is Humbert's formula, a roadmap-for-a-roadmap there and not a target here; the finiteness of the
volume of `F_K` is proved directly in 0.3.

*Needs:* §9.4 domains; KleinianGroups Layers 3–4 indices and covolumes.

### Examples

Vogtmann gives vanishing at discriminant −20 and nonvanishing at −43 (§9.3).

### Dependencies

Layers 0–1 and §3.5; Layer 4 Hecke maps; KleinianGroups Layers 2–4.

## Downstream consumers

The elliptic-curve comparison of Layer 8 supplies intrinsic Bianchi newform data for
elliptic curves over imaginary quadratic fields. The integral Hecke module and its
period pairing supply arithmetic consumers with all prime ideals and all class components.

## Worked examples

Each example names the invariants that Layers 0–9 define and the milestone computing them. Levels
are written both as ideals and with the LMFDB's ideal label, decoded with the LMFDB's own
labelling code; the index inside the label is not a target.

- **`2.0.4.1-121.1-a`, the base change of `11a1` to `K = ℚ(i)`.** Level `(11)` (`11` inert),
  `N𝔫 = 121`, `[GL₂(ℤ[i]) : Γ₀((11))] = 122` (0.1); `Γ₀((11))` has `2` cusps (0.5). The newform
  `F` is `IsBaseChangeOf F 11a1` (7.3), `bc = 1` (7.5, coefficient field `ℚ`), `CM = 0` (7.6);
  eigenvalues (4.5, 7.3): `a_{(1+i)} = −2`, `a_{(3)} = −5 = (−1)² − 6`, `a_{(2±i)} = 1`,
  `a_{(7)} = −10 = (−2)² − 14`, `a_{(3±2i)} = 4`, each checked against
  `frobeniusTrace` of the reduction of `11a1 ×_ℚ K` (8.1, 8.3); `a_{(11)} = 1 = −w_{(11)}` (5.6;
  `11a1` has split multiplicative reduction); `ε(F) = +1` (6.3, 6.4: `ε(11a1) = ε(176b2) = +1`,
  and PARI's root number of `11a1/ℚ(i)` is `+1`); `analyticRank F = 0` (6.5), since
  `L(11a1, 1)/Ω = 1/5` and `L(176b2, 1)/Ω = 1`, both nonzero; `HasEllipticCurve F` with
  `W = 11a1 ×_ℚ K` (8.2); `F^τ = F` (5.7, 7.4). The `L`-function has conductor
  `d_K² N𝔫 = 16 · 121 = 1936 = 11 · 176` (6.3).
- **`2.0.4.1-100.2-a`, level `(10)` over `ℚ(i)`.** Of the three ideals of norm `100` in `ℤ[i]`,
  `(1+i)²(2+i)²`, `(10)` and `(1+i)²(2−i)²`, only `(10)` is stable under conjugation, so only
  `100.2 = (10)` can carry a base change (7.3, 5.7: the level of a base change is `τ`-stable).
  `F` is the base change of `20a1` and of its twist `80b1 = 20a1 ⊗ χ₋₄` (7.3's uniqueness up to
  `χ_K`), whose base changes to `K` are isomorphic curves; eigenvalues `a_{(3)} = −2 = (−2)² − 6`,
  `a_{(7)} = −10`, `a_{(11)} = −22`, `a_{(3+2i)} = a_{(3−2i)} = 2`, `a_{(4±i)} = −6`,
  `a_{(19)} = −22 = (−4)² − 38` (4.5, 7.3, 8.1); Atkin–Lehner eigenvalues `w_{(1+i)} = −1` (the
  LMFDB's value, equal to `w₂(20a1) = −1`), `w_{(2+i)} = w_{(2−i)} = w₅(20a1) = +1 = −a₅(20a1)`
  (5.6, 7.3), Fricke eigenvalue `−1`, hence `ε(F) = +1` (6.3; PARI's root number of
  `20a1/ℚ(i)` is `+1`); `analyticRank F = 0` (`L(20a1, 1)/Ω = 1/6`, `L(80b1, 1)/Ω = 1/2`); the
  conductor exponent of `20a1 ×_ℚ K` at `(1 + i)` is `2` (Kodaira type `IV`) and `1` at `(2 ± i)`
  (type `I₂`), so `𝔫_E = (1+i)²(2+i)(2−i) = (10)` (8.5).
- **The Eisenstein base change.** `32a2 : y² = x³ − x` has CM by `ℤ[i]`; over `K = ℚ(i)` its
  conductor is `(8)` and its eigenvalue system is `ψ(𝔭) + ψ̄(𝔭)` for the Grossencharacter `ψ` of
  `K` of conductor `(1+i)³`; it occurs in no `H¹_cusp(𝔫, ℂ)` (7.3, 8.4(i)); the `ecnf` page of
  such a curve says "Bianchi modular form is not cuspidal". Likewise `27a1` (CM by `ℚ(√−3)`) over
  `ℚ(√−3)`. Boundary check for 7.3: `IsBaseChangeOf` is a relation between eigenvalue systems and
  holds for the Eisenstein system; the existence theorem's conclusion "`F` is a newform" is what
  fails, exactly when `f ⊗ χ_K = f`.
- **`2.0.7.1-10000.1-b`, CM without a curve.** `K = ℚ(√−7)`, level of norm `10⁴`, the ideal
  `𝔭₂⁴ (5)²` with `𝔭₂` one of the two primes above `2` (not `τ`-stable, so not a base change,
  7.4); `IsCM F` with `L_F = K(√−35) = K(√5)`, `M = ℚ(√−35)`, `cmDiscriminant F = −35` (7.6–7.7,
  the display `−35` since `−35 ≡ 1 mod 4`); `a_𝔭 = 0` for every `𝔭` inert in `K(√5)/K` (both
  primes above `2`, `(√−7)`, the primes above `23`; nonzero at `(3)` and above `11`, `29`, which
  split); `¬ HasEllipticCurve F` (8.4: every order of `ℚ(√−35)` has class number `≥ 2`). It is a
  twist of a base change, `IsTwistOfBaseChange F ∧ ¬ IsBaseChange F` (the eigenvalues at the two
  primes above `11` are `3` and `−3`, so `F^τ ≠ F`), with the LMFDB's `bc = −5`: the twist
  of the base change of a classical form with coefficients in `ℚ(√5)` (7.4–7.5). `AL_eigs` are
  `−1, 1`, `ε(F) = +1`, and the LMFDB's Lratio is `2 ≠ 0`, so `analyticRank F = 0` (5.6, 6.3,
  6.5–6.6). The
  LMFDB's `curve_status` is `−1`.
- **`2.0.4.1-34225.3-a`, rational, non-CM, not a twist of a base change, no curve.** Level
  `(2i − 1)² (i − 6)² = (153 + 104i)`, of norm `5² · 37² = 34225`, not `τ`-stable; `AL_eigs` are
  `−1, 1`, `ε(F) = +1` and the LMFDB's Lratio is `0`, so analyticRank F is even and at least
  `2` (6.5–6.6);
  the LMFDB records that it is attached to
  a QM abelian surface and not to an elliptic curve: `¬ HasEllipticCurve F` is not decided by 8.3
  or 8.4, and the roadmap states no theorem deciding it (8.2); it is the example showing the
  converse of 8.1 is false as a statement about elliptic curves alone.
- **`2.0.4.1-16384.1-d`, base-change form, non-base-change curve.** Level `(128) = (1+i)^{14}`.
  The form is rational and the base change of the newform `f` of level `512` with coefficient
  field `ℚ(√2)` (7.5's check: `a_{(3)} = a₃(f)² − 6 = −4`, `a_{(7)} = a₇(f)² − 14 = −6`,
  `a_{(2±i)} = a₅(f) = 2`), so `bcField F = ℚ(√2)` and the LMFDB's `bc` is `2`; `AL_eigs = −1`,
  `ε(F) = +1`, the LMFDB's Lratio is `1`. Its curve is not a base change of a curve over `ℚ` (8.3 (i)): the two
  predicates of 8.3 differ, and `bc > 0` does not imply `base_change ≠ []` on the `ecnf` side.
- **`2.0.11.1-256.1-a`, twist of a base change.** `K = ℚ(√−11)`, level `(16) = (2)⁴` (`2` inert);
  the LMFDB records "not a base change, but a twist of the base change of a form over `ℚ`" and an
  elliptic curve: `IsTwistOfBaseChange F ∧ ¬ IsBaseChange F` (7.4), `bc < 0`, `HasEllipticCurve F`
  (8.2). Boundary check for 7.4: the twisting character `ψ` is not of the form `χ ∘ N_{K/ℚ}` for
  a Dirichlet character `χ` (a twist by one of those turns a base change into the base change of
  `f ⊗ χ`). Every quadratic character of `K` unramified outside `2` has that form, since `h_K = 1`
  and the `2`-units `⟨−1, 2⟩` of `K` are rational, so `ψ` is ramified at `(√−11)`; for example,
  the base changes to `K` of the curves `7744b1`, `7744c1`, `7744q1`, `7744r1`
  (`7744 = 2⁶ · 11²`) twisted by `K(√(±2√−11))` have conductor `(16)`. Hence `F^τ ≠ F` while
  `(F ⊗ ψ)^τ = F ⊗ ψ`.
- **`2.0.7.1-44.3-a` and `2.0.7.1-44.4-a`, a conjugate pair.** Levels `𝔭₂ 𝔭̄₂ (2a−3)` and
  `𝔭₂ 𝔭̄₂ (2a+1)` over `ℚ(√−7)` (`a² − a + 2 = 0`), swapped by `τ`; the two forms are `F` and
  `F^τ` (5.7), neither a base change (7.4), each with an elliptic curve (the LMFDB's friends
  lists), and `L(F, s) = L(F^τ, s)` as `L`-functions of the Weil restriction (6.3: the `L`-function
  of `F^τ` has the same coefficients `a_n`, since `N(τ𝔪) = N𝔪`).
- **`2.0.8.1-32.1-a` over `ℚ(√−2)`**, level `(4√−2) = (√−2)⁵`, `τ`-stable, a base change whose
  `L`-function is also that of a Hilbert newform over `ℚ(√2)` (the LMFDB's friends): the classical
  form `f` has `f ⊗ χ₋₄ = f` (CM by `ℚ(i)`: `f = 32a`), so `L(f, s) L(f ⊗ χ₋₈, s) = L(f, s) L(f ⊗ χ₈, s)`
  (6.4, 7.3); the base change is cuspidal because the CM field `ℚ(i)` is not `K`.
- **Cusps and indices** (0.1, 0.5): `Γ₀((2+i)²) ≤ GL₂(ℤ[i])` has index `30` and `3` cusps;
  `Γ₀ˢᴸ((2+i)²)` has `4`; `Γ₀((1+i)²)` has `3` cusps for both; `Γ₀((11))` has index `122` and
  `2` cusps.
- **Hecke cosets** (4.3): for `𝔭 = (2+i)` over `ℚ(i)`, `T_𝔭` on `H¹(Γ₀(𝔫))` with `𝔭 ∤ 𝔫` is the
  sum over the six cosets `(1, b; 0, 2+i)`, `b ∈ {0, 1, 2, 3, 4}`, and `(2+i, 0; 0, 1)`, and the
  recurrence `a_{𝔭²} = a_𝔭² − 5` (4.4).
- **Level one** (1.2, 9.3): `H¹(PSL₂(ℤ[i]), ℂ) = 0 = H¹(PSL₂(ℤ[ω]), ℂ)` (one cusp with a rotating stabilizer and
  no cuspidal part), `H¹(PSL₂(𝓞_K), ℂ) = ℂ` and `H¹_cusp = 0` for
  `d_K ∈ {−7, −8, −11, −19}`, and `H¹_cusp(PSL₂(𝓞_K), ℂ) ≠ 0` for `d_K ∈ {−43, −67, −163}`.
- **Fundamental domains** (9.4): floors of unit hemispheres only for the five Euclidean fields with
  lowest heights squared `1/2, 1/4, 2/3, 3/7, 2/11` (`d = 1, 2, 3, 7, 11`); faces with
  `|c|² = 4` from `d = 19` on, `|c|² = 9` from `d = 43` on, `|c|² ∈ {16, 23}` at `d = 67`, and
  `|c|² ∈ {16, 25, 36}` at `d = 163`; the `ℚ(√−11)` vertex tangency of `|c|² = 4` and the
  `ℚ(√−43)` vertex tangency of `|c|² = 16`.
- **Ramanujan and the L-ratio denominator** (§§4.6, 5.8, 6.6): at a good prime of
  norm 9 the cuspidal bound is |a_𝔭| ≤ 6, while each degree-zero boundary eigenvalue
  has absolute value at least 8. The characteristic polynomial of the boundary action
  annihilates that quotient and is nonzero at a_𝔭. A single factor X−10 is valid only
  when the boundary action is the scalar 10.

### Boundary and off-hypothesis checks

- A ℂ³-valued function whose `1`-form is closed but not co-closed (e.g. `ω = df` for a nonconstant
  invariant `f`) is not harmonic: both halves of 2.2 are needed.
- The mode `α` with the knowl's phases `∓ i/2` is not closed (2.4's check); the coefficient `c` is
  read from `F₂` precisely so that no phase convention enters the arithmetic.
- `T_𝔭` for a nonprincipal `𝔭` is not an endomorphism of any single `H¹_cusp(Γ₀(𝔫, 𝔞), ℂ)` (it
  moves the component); the Hecke algebra of 4.3 generated by the principal `T_𝔭` alone does not
  separate newforms when `h_K > 1`, which is why the eigenvalue system is indexed by all primes.
- `U_𝔭` at `𝔭 ∣ 𝔫` is not self-adjoint and its eigenvalues are not real in general on the whole
  space; on newforms they are `0, ±1` (5.3).
- `W_𝔮` for `𝔮` not an exact divisor is not defined: `(L, M) ↦ (M_𝔮, 𝔮L ∩ M_{𝔫'})` fails to be a
  level-`𝔫` pair when `𝔮` and `𝔫𝔮⁻¹` share a prime.
- The sign is `−w_𝔫`, not `w_𝔫`: for `2.0.4.1-100.2-a` the Fricke eigenvalue `−1` goes with root
  number `+1` and analytic rank `0`.
- `analyticOrderNatAt (LSeries a) 1` is `0` for every `F`: the series is not summable on
  `Re s < 3/2`, where Mathlib's `LSeries` is the junk value `0` identically, and the order of the
  zero function is `⊤`, whose `toNat` is `0`; 6.5 uses the continuation.
- On the total space for `h_K > 1` the `T_𝔭` are not self-adjoint and eigenvalues need not be
  real: 1.5's twist of the base change of `11a1` over `ℚ(√−23)` by an order-`3` class character
  has `a_𝔭 = −2χ(𝔭) ∉ ℝ` at the primes above `2`; it is excluded by the trivial central character
  (`S_𝔭 F = χ(𝔭)² F ≠ F`).
- `W_𝔮² = S_𝔮` is not the identity on the total space for nonprincipal `𝔮`: it moves the
  component of class `c` to `c[𝔮]²` (5.5).
- For the `GL₂`-level the cusp `∞` contributes nothing to `H¹_Eis` (1.2): `diag(−1, 1) ∈ Γ₀(𝔫)`
  rotates by `π` about it, for every `K`; for `PSL₂(𝓞_K)` with `w_K = 2` and `h_K = 1` it
  contributes `1`.
- The knowl's slash matrix applied to `F` itself is not the pullback in the coframe
  `β₁ = −dx/y, β₂ = dy/y, β₃ = dx̄/y`: at `x ≠ 0` its off-diagonal entries differ from `A(γ, z)`
  by the factors `2` and `1/2` (2.1).
- IsBaseChangeOf F f for `f = 32a` over `ℚ(i)` holds for the Eisenstein system and no newform
  `F` exists (7.3).
- The CM discriminant is not `d` for `L_F = K(√d)` with `d > 0`: over `ℚ(√−7)`, `K(√5) = K(√−35)`
  and the invariant is `−35` (7.7).
- HasEllipticCurve is not implied by rationality: `2.0.4.1-34225.3-a` (8.2).
- `Γ₀((2+i)²)` over `ℚ(i)` has `3` cusps and not `1 + 4 + 1 = 6`: the units act on
  `(𝓞_K/𝔭)ˣ = 𝔽₅ˣ` transitively (0.5).

## References

- L. Bianchi, *Sui gruppi di sostituzioni lineari con coefficienti appartenenti a corpi quadratici
  immaginarî*, Math. Ann. 40 (1892), 332–412 — the fundamental domains of 9.4.
- R. G. Swan, *Generators and relations for certain special linear groups*, Adv. Math. 6 (1971),
  1–77 — the presentations of 0.6 and the termination of the hemisphere search in 9.4.
- J. E. Cremona, *Hyperbolic tessellations, modular symbols, and elliptic curves over complex
  quadratic fields*, Compositio Math. 51 (1984), 275–324 — the modular symbols of 9.1–9.2 for the
  five Euclidean fields, the `L`-ratio of 6.6, and the examples the LMFDB's tables grew out of.
- J. E. Cremona and E. Whitley, *Periods of cusp forms and elliptic curves over imaginary
  quadratic fields*, Math. Comp. 62 (1994), 407–429 — the fields `d_K ∈ {−19, −43, −67, −163}`.
- J. Elstrodt, F. Grunewald and J. Mennicke, *Groups Acting on Hyperbolic Space*, Springer
  Monographs in Mathematics (1998) — Chapters 1–2 for `ℍ³` and its isometries, Chapter 7 for the
  Bianchi groups and their fundamental domains, Chapter 8 for Humbert's formula (consumed through
  the Kleinian-groups roadmap).
- G. Harder, *Eisenstein cohomology of arithmetic groups. The case `GL₂`*, Invent. Math. 89
  (1987), 37–118 — §§3.1–3.2 and §3.6 for the cuspidal cohomology, its one-dimensional
  multiplicity and the vanishing for unequal weights (consumed through the Langlands-extensions
  roadmap's §4.26).
- K. Vogtmann, *Rational homology of Bianchi groups*, Math. Ann. 272 (1985), 399–419 — the
  level-one vanishing list of 9.3.
- M. H. Şengün, *Arithmetic aspects of Bianchi groups*, in *Computations with Modular Forms*,
  Contrib. Math. Comput. Sci. 6, Springer (2014), 279–315 — the survey of Layers 1, 4, 9 and of the
  elliptic-curve correspondence of Layer 8, with the QM and CM phenomena of 8.2 and 8.4.
  Section and page locators here use the author preprint arXiv:1204.6697v4, whose pages begin at 1.
- J. Bygott, *Modular forms and modular symbols over imaginary quadratic fields*, PhD thesis,
  Exeter (1998), and M. Lingham, *Modular forms and elliptic curves over imaginary quadratic
  fields*, PhD thesis, Nottingham (2005) — the class-number-`>1` bookkeeping of 0.2, 1.5, 4.1.
- G. Boxer, F. Calegari, T. Gee, J. Newton and J. A. Thorne, *The Ramanujan and Sato–Tate
  conjectures for Bianchi modular forms*, Forum Math. Pi (2025) — §1.3 for the adelic definition
  and normalization of Bianchi eigenforms consumed through the Langlands-extensions roadmap.
- W. Casselman, *On some results of Atkin and Lehner*, Math. Ann. 201 (1973),
  301–314 — Theorem 1 and its corollary for local newvectors.
- J. Newton and J. A. Thorne, *Torsion Galois representations over CM fields and
  Hecke algebras in the derived category*, arXiv:1511.04913v1 — Lemma 2.4 and
  Proposition 3.4 for the parabolic Hecke maps consumed in §5.8.
- R. P. Langlands, *Base Change for GL(2)*, Ann. of Math. Studies 96 (1980) — quadratic base
  change and its cuspidality criterion, consumed through the `GL₂` automorphic representations
  roadmap (R17.4).
- A. Weil, *Dirichlet Series and Automorphic Forms*, Lecture Notes in Math. 189 (1971) — the
  functional equation by the Mellin transform along the geodesic, the shape of 6.2–6.3.
- A. Weil, *On a certain type of characters of the idèle-class group of an algebraic
  number-field*, Proc. Int. Symp. Algebraic Number Theory, Tokyo–Nikko 1955, 1–7 — the
  admissibility condition on infinity types of algebraic Hecke characters used in 7.7.
- The LMFDB knowls `mf.bianchi`, `mf.bianchi.weight2`, `mf.bianchi.fourierbessell`,
  `mf.bianchi.hecke_algebra`, `mf.bianchi.newform`, `mf.bianchi.spaces`, `mf.bianchi.level`,
  `mf.bianchi.sign`, `mf.bianchi.anr`, `mf.bianchi.base_change`, `mf.bianchi.cm`,
  `mf.bianchi.labels`, `nf.ideal_labels`, `mf.base_change`, `ec.base_change`, `ec.q_curve`,
  `ec.complex_multiplication`, and the LMFDB source `lmfdb/bianchi_modular_forms/` and
  `lmfdb/ecnf/` — the invariants this roadmap formalizes, in the LMFDB's own words.

- LMFDB contributors, bianchi_modular_form.py, bmf_field_dim_table, weight-key loop
  ([source](https://github.com/LMFDB/lmfdb/blob/main/lmfdb/bianchi_modular_forms/bianchi_modular_form.py)):
  the renderer reads dimension keys without defining their coefficient-module convention (§1.3).
