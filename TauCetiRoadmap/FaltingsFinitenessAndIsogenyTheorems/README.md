# Roadmap: Faltings finiteness, semisimplicity and isogeny theorems

**Summary.** This roadmap proves the finiteness theorems of Faltings' 1983 paper on abelian
varieties over number fields, with the corrections of his 1984 erratum. Starting from semiabelian
schemes over rings of integers, it defines the modular height `h(A)` of an abelian variety with
semistable reduction as the normalised Arakelov degree of its Hodge line, and proves that only
finitely many principally polarized abelian varieties of a given dimension over a number field `K`
have semiabelian models of bounded height (Satz 1). The proof compares `h` with a projective height
on the Baily–Borel compactification through a proper stack of stable curves over `ℤ`, using that the
Hodge metric has only logarithmic singularities along the boundary. It computes how `h` changes along
an isogeny (Lemma 5), and uses Tate's and Raynaud's local computations with Hodge–Tate weights and
the Weil bound to show that the heights along an `l`-divisible tower become stationary (Satz 2 as the
erratum corrects it). With Zarhin's quaternion construction this gives the Tate conjecture for
abelian varieties over number fields: `V_l(A)` is semisimple and `End_K(A) ⊗ ℤ_l ≅ End_π(T_l(A))`
(Satz 3, Satz 4), with the Hom form, the isogeny criterion by local L-factors and the finiteness of
polarized varieties with prescribed Tate modules (Korollare 1–3). Hermite–Minkowski, the
Chebotarev test-set argument and Weil's bound then give finitely many isogeny classes with good
reduction outside a finite set `S` (Satz 5); Raynaud's determinant theorem pins the height inside an
isogeny class, which gives the Shafarevich conjecture for polarized abelian varieties (Satz 6), its
unpolarized form through Zarhin's trick, the finiteness of curves of genus at least two with good
reduction outside `S`, and its application to Parshin's implication for rational points. The last
layer exports the results to elliptic curves over number fields: semisimplicity, the Tate Hom
comparison, the isogeny criterion by traces of Frobenius and the finiteness of isogeny classes.

The end theorems are Satz 1 (R28.1.11), the corrected Satz 2 (R28.3.4), Satz 3 and Satz 4
(R28.4.5), the isogeny criterion (R28.4.7), Satz 5 (R28.5.3), Satz 6 and its unpolarized form
(R28.5.11, R28.5.13), the finiteness of curves with good reduction outside `S`
(R28.5.15), and the finiteness of elliptic isogeny classes (R28.6.5).

| Layer | Title | Headline targets |
| --- | --- | --- |
| R28.1 | Semiabelian models, modular heights and finiteness of bounded height | the stable-Picard Hodge comparison, uniqueness of semiabelian models, the correspondence stack, uniform commensurability of modular and Hodge lines, the modular height, `HermitianMetric.HasLogSingularities`, Northcott finiteness for logarithmically singular metrics, the fixed-degree Hermite–Minkowski statement, bounded-height finiteness, polarization descent, uniform principal reduction |
| R28.2 | Heights under isogeny and the determinant identity | the isogeny height formula, the isogeny valuation bounds, trivial inertia on the Tate quotient, the differential count at a divisible-group level, cyclotomic decomposition of the character, the local-dimension identity |
| R28.3 | The erratum and the stationarity of heights | the shifted closure tower, divisibility of the shifted toric intersection, stationarity of heights, a polarization reduction, existence of infinitely many isomorphic quotients |
| R28.4 | Semisimplicity and the Tate conjecture | the quaternion matrix, the two-graph subspace, realization of stable subspaces by idempotents, Tate semisimplicity, the integral Tate endomorphism comparison, the integral Tate Hom comparison, the isogeny criterion by local factors, finiteness with prescribed Tate modules |
| R28.5 | Finiteness of isogeny classes and the Shafarevich conjecture | finiteness of Weil polynomials, the finite Frobenius test set, `finite_isogenyClasses`, Raynaud’s determinant identity, `finite_stableLattices`, the polarized Shafarevich theorem, Zarhin’s trick, `shafarevich_unpolarized`, rational Torelli, `finite_curves_goodReduction` |
| R28.6 | Elliptic curves and the integral commutant | the elliptic-to-abelian comparison, `elliptic_semisimple`, `elliptic_tate_hom_iso`, `elliptic_isogenous_iff_ap`, `finite_ellipticIsogenyClass`, the cyclic Hom theorem, integral commutant generation at almost all primes |

## Scope and ownership

This roadmap owns:

1. **Modular heights and Satz 1** (Layer R28.1): the adapter identifying the supplied Hodge line of a
   stable Picard scheme with the curve Hodge line of JacobianChallengePartII Layer 6, the uniqueness of semiabelian models (a consequence of Faltings' Lemma 1, the extension
   theorem for homomorphisms, which ArakelovGeometryAndAbelianHeights §2.0 owns), Faltings' correspondence stack of stable curves over `ℤ` dominating the Siegel moduli
   space (Lemma 2), the comparison of the Hodge and modular line bundles with a uniform constant
   (Korollar to Lemma 2), adapters to the supplied degree, semistable height in Faltings' normalisation and
   logarithmic-metric results, the fixed-degree adapter to supplied Hermite–Minkowski
   finiteness with prescribed ramification (Lemma 4), the descent from geometric to `K`-isomorphism
   classes, polarization descent along isotropic kernels, the polarization reduction with a uniform field
   extension, and Satz 1.
2. **Isogenies and heights** (Layer R28.2): aliases of the supplied isogeny height formula (Lemma 5) and
   valuation bounds, the triviality of inertia on `T_l(A)/T_l(H_i)` (Lemma 6), the count of
   invariant differentials of the levels of an `l`-divisible group, the Hodge–Tate determinant at a
   place above `l`, the description of `l`-adic characters of `Gal(ℚ̄/ℚ)`, the determinant of the
   induced Tate module at `l`, the Frobenius weights of the induced Tate module, and the determinant
   identity `Σ m_i d_i = mh/2`.
3. **The erratum** (Layer R28.3): the toric-intersection shift and the comparison of the supplied
   local closure shift with the global quotient tower of the 1984 erratum, the corrected Satz 2 (heights along
   an `l`-divisible tower become stationary), the polarization reduction to a principally polarized
   semiabelian model, powers of principally polarized models, the invariance of Satz 3 and Satz 4
   under finite extension and isogeny, and the infinitely many isomorphic quotients along a maximal
   isotropic tower.
4. **The Tate conjecture** (Layer R28.4): Zarhin's quaternion construction, `−1` as a sum of four squares
   in `ℤ_l`, Zarhin's idempotent lemma, Satz 3 and Satz 4, Korollar 1 (Hom form), Korollar 2 (the
   isogeny criterion) and Korollar 3.
5. **Finiteness** (Layer R28.5): the specialization of Mathlib's polynomial finiteness to a fixed
   root radius, the Frobenius test set, Satz 5, the
   auxiliary polynomials `P_h` and the bound `N`, the twisted determinant character and its
   unramifiedness, mod `l` characters of `Gal(ℚ̄/ℚ)` unramified outside `l`, Raynaud's determinant
   computation in this setting, heights along isogenies of large prime-power degree, the finiteness
   of stable lattices up to isomorphism in a semisimple `ℚ_l`-representation, the small-prime bound,
   Satz 6, the local maximal-order lattice classification, integral idempotent orbit finiteness and
   the finiteness of direct factors, using the supplied Zarhin trick, the unpolarized Shafarevich theorem,
   the field specialization of JacobianChallengePartII's canonical polarization, the uniqueness
   part of strong Torelli with the perfect-field descent giving the rational Torelli theorem,
   Korollar 1 to Satz 6.
6. **Exports** (Layer R28.6): the identification of Weierstrass elliptic curves with one-dimensional
   abelian varieties as this roadmap uses it, semisimplicity, the Tate Hom comparison, the isogeny criterion and the
   finiteness of isogeny classes for elliptic curves over number fields, the rank-one Hom lemma, the
   integral commutant at almost all primes (Bemerkung 2).

Several general statements are stated here because none of the roadmaps this one builds on
states them: the specialization of Mathlib's polynomial finiteness theorem to a fixed root radius and
the finite Frobenius test set (in the generality the roadmaps building on this one use them), the
descent of polarizations along isotropic subgroups, the
finiteness of direct factors and its integral-order orbit input, the finiteness of stable lattices in a semisimple `l`-adic
representation, the rational Torelli theorem as used here, and the bridge from Weierstrass curves to
abelian varieties of dimension one. The arithmetic degree and height here are the explicit
Faltings-1983 specialization of ArakelovGeometryAndAbelianHeights Layers 1–3; the
fractional-ideal degree formula uses the existing fractional-ideal carrier rather than constructing
another arithmetic intersection theory. R28.1.5 is an adapter to that supplied degree and semistable
height. R28.1.6–R28.1.8 use ArakelovGeometryAndAbelianHeights §§5.1–5.4, and R28.2.1–R28.2.2
use its §§4.1–4.4: the names here are aliases or specializations in the same Faltings normalization,
not separately owned metric, height or isogeny theorems. R28.1.9 specializes
ArithmeticGaloisDuality R02.3.1 to fixed degree in the chosen algebraic closure;
the generic restricted-ramification theorem belongs to that supplier. Zarhin's trick, including graph descent,
is supplied by PadicDifferentialEquationsAndRigidCohomology §RD.5.116 over `Spec(k)`;
R28.5.12 owns its direct-factor application and the stated order-theoretic auxiliaries.
The invariant-differential bundle and its determinant are supplied by
SchemeAndStackFoundations §3.8 and AlgebraicVectorBundles Layers L0B–L0C.
Its arbitrary base-change comparison and, for proper geometrically connected fibres,
`ω_{A/S} ≅ p_*Ω^g_{A/S}`, are used through those suppliers and
AbelianSchemesAndArithmeticModuli §A1.3; they are not additional definitions here.

The rational-point and integral-point applications of Faltings 1983, §6, Satz 7 and
Bemerkung 1, p. 365, are illustrated in the worked Parshin example. Its covering and
de Franchis hypotheses are stated there explicitly. They are not new unconditional
Mordell or Siegel declarations in this roadmap.

This roadmap does not own, and cites:

- **Mathlib**: schemes, morphism properties, the valuative criterion, relative normalisation, group
  objects, number fields with their infinite places, discriminants, the different, the product
  formula, heights on projective space and Northcott for number fields, `p`-adic numbers with
  Hensel's lemma, semisimple rings and modules, bilinear forms and orthogonal complements, induced
  representations, the transfer, determinants and traces, the `l`-adic and mod-`n` cyclotomic
  characters, Galois groups of cyclotomic extensions of `ℚ`, Weierstrass curves.
- **Tau Ceti**: `QuadraticMap.euler_four_squares` in `LinearAlgebra/QuadraticForm/FourSquares`
  already proves the four-square identity for quadratic maps. R28.4.2 keeps the matrix-transpose
  identity and the two-graph construction for an alternating form, which are different statements.
  Abelian varieties over a field with homomorphisms, endomorphisms, products, base
  change and isogenies; homomorphisms of Weierstrass curves with degree and composition; the double
  centralizer theorem; finite locally free commutative group schemes.
- **TauCetiRoadmap roadmaps**: ClassFieldTheory (Kronecker–Weber), Chebotarev (Frobenius classes),
  GlobalNumberFields (ramification in cyclotomic fields), NumberFieldArithmetic (the bound on the
  different exponent), EllipticCurves (dual isogenies, Tate modules, reduction of elliptic curves),
  JacobianChallenge (Jacobians and their principal polarization).
- **Roadmaps this one builds on**: AbelianSchemesAndArithmeticModuli (abelian schemes,
  polarizations, Weil pairings, the arithmetic of Hom), JacobianChallengePartII (relative
  Jacobians, their canonical principal polarization, and the stable Picard Lie and Hodge
  comparisons), AbelianSchemesAndArithmeticModuliPartII (geometric strong Torelli), NeronModelsAndSemistableAbelianVarieties
  (Néron models, semistable reduction, the monodromy criterion, Néron–Ogg–Shafarevich),
  ArithmeticGaloisRepresentations (Tate modules with their Frobenius polynomials, induction and
  determinants), ArithmeticGaloisDuality (bounded-degree Hermite finiteness outside a finite set),
  WeightsInEtaleCohomology (the Weil bound), FiniteFlatGroupsAndIntegralPadicHodgeTheory
  (`p`-divisible groups, Tate's and Raynaud's local theorems), PadicPeriodRings §2 (Tate–Sen),
  PELModuli (the Siegel moduli stack, its coarse space and level rigidity), ShimuraVarieties (the
  Baily–Borel compactification), ArakelovGeometryAndAbelianHeights (semiabelian families, Siegel compactifications,
  the arithmetic degree, semistable height, logarithmic metrics and isogeny variation),
  PadicDifferentialEquationsAndRigidCohomology (Zarhin's trick with graph descent),
  ClassicalArithmeticCompletion (orders and containing maximal orders), AdelicAlgebraicGroups
  (closed-orbit reduction theory),
  ComplexComparisonPartII (analytification), AlgebraicModuliForArithmeticGeometry (Deligne–Mumford
  stacks).
  The exact statements consumed are listed under *Exact supplier contracts*.

This roadmap gives no effective global height bound in Satz 6: that bound comes from a finiteness
argument. Auxiliary constants such as the auxiliary bound have explicit values in worked Checks. It does not prove the
Mordell conjecture by the Vojta–Bombieri or Lawrence–Venkatesh methods, nor Siegel's theorem by
Diophantine approximation; it does not develop Arakelov intersection theory beyond the degree of a
metrized line bundle on `Spec(O_K)`; and it does not treat abelian varieties over function fields.

## Conventions

- **Number fields.** `K` is a number field of degree `m = [K : ℚ]`, `R = O_K` its ring of integers,
  `K̄` an algebraic closure, `π = Gal(K̄/K)` and `π̃ = Gal(ℚ̄/ℚ) ⊇ π` after fixing `K̄ = ℚ̄`. A place
  `v` of `K` is finite (a height-one prime of `R`, Mathlib `IsDedekindDomain.HeightOneSpectrum`) or
  infinite (Mathlib `NumberField.InfinitePlace`); `Nv` is the absolute norm of a finite place. The
  weight of an infinite place is `ε_v = 1` if `v` is real and `ε_v = 2` if `v` is complex (Mathlib
  `InfinitePlace.mult`); this is the weight with which the product formula holds,
  `Σ_v ε_v log|x|_v = log|N_{K/ℚ}(x)|` for `x ∈ K^×`. For every prime `l` and every place `v_i | l`,
  `K_i = K_{v_i}`, `R_i` is its valuation ring, `m_i = [K_i : ℚ_l]`, so `Σ_i m_i = m`, and
  `D_i ⊇ I_i` are the decomposition and inertia groups.
- **Semiabelian schemes.** A semiabelian scheme of relative dimension `g` over a scheme `S` is a
  smooth separated commutative group scheme `p : A → S` whose fibres are connected of dimension `g`
  and are extensions of an abelian variety by a torus. Faltings states only smoothness and the fibre
  condition (§2, p. 350); separatedness and commutativity are part of the definition here, as in
  Faltings–Chai. A *semiabelian model* of an abelian variety `A/K` is a semiabelian scheme over
  `Spec(R)` with generic fibre `A`; it exists exactly when `A` has semistable reduction at every finite
  place, and it is unique up to unique isomorphism (R28.1.2). "`A/K` is semistable" means that it has
  a semiabelian model.
- **The Hodge line and its metric.** For a semiabelian `p : A → S` with zero section `s`,
  `ω_{A/S} = s^*(Ω^g_{A/S})`. Over `ℂ`, for a complex abelian variety `A` of dimension `g`,
  `‖α‖² = 2^{−g} i^{g²} ∫_{A(ℂ)} α ∧ ᾱ` for `α ∈ Γ(A, Ω^g)`; in linear coordinates with
  `α = f·dz_1 ∧ … ∧ dz_g` this is `∫ |f|² dx_1 dy_1 ⋯ dx_g dy_g`, positive for `α ≠ 0`. Faltings prints the factor
  `(i/2)^g`, which differs from `2^{−g} i^{g²}` by `(−1)^{g(g−1)/2}` and makes the form negative for
  `g ≡ 2, 3 mod 4`. *Witness:* for `A = ℂ/(ℤ + τℤ)`, `‖dz‖² = Im τ`; for `A = E_1 × E_2` and
  `α = dz_1 ∧ dz_2`, the printed factor gives `−vol(A)` and the convention here `+vol(A)`. At a real
  place `v` the metric is computed on `A_σ(ℂ)` for the embedding `σ` inducing `v`; at a complex place
  on `A_σ(ℂ)` for either embedding inducing `v` (both give the same value, the form being invariant
  under complex conjugation).
- **Degrees and heights.** A metrized line bundle on `Spec(R)` is a projective `R`-module `P` of rank
  one with norms `‖·‖_v` on `P ⊗_R K_v` at the infinite places. Its degree is
  `deg(P, ‖·‖) = log #(P/R·p) − Σ_{v|∞} ε_v log ‖p‖_v` for any `p ≠ 0` in `P`. The modular height of a
  semiabelian model `A/R` with proper generic fibre is `h(A) = deg(ω_{A/R}, ‖·‖)/m`. This is Faltings'
  normalisation of 1983 (§3, pp. 353–354). *Witness:* for `E/ℚ` semistable with Néron differential
  `ω_E`, `h(E) = −½ log ‖ω_E‖² = −½ log((i/2) ∫_{E(ℂ)} ω_E ∧ ω̄_E)`.
- **Polarizations.** A polarization `λ : A → A^∨` of an abelian variety over a field is an isogeny
  induced by an ample line bundle over the algebraic closure. Its *degree* is `deg λ = #ker λ`, the
  order of the finite group scheme `ker λ`, always a square; "`d`-fold polarized" means `deg λ = d`,
  and principal means `d = 1`. This is Faltings' convention. AbelianSchemesAndArithmeticModuli calls
  a polarization with kernel of rank `d²` "of degree `d`"; a statement there about degree `d` is a
  statement here about degree `d²`. *Witness:* on an elliptic curve `E` with canonical principal
  polarization `λ_E` and `n ≥ 1`, `n·λ_E` has kernel `E[n]` and degree `n²` here. The Weil pairing of `λ` is the
  alternating, `π`-equivariant pairing `e^λ : T_l(A) × T_l(A) → ℤ_l(1)`, perfect when `λ` is principal,
  and `e^λ` also denotes the induced nondegenerate alternating pairing on `ker λ`.
  A *maximal isotropic* finite subgroup scheme means a geometrically Lagrangian one:
  `H = H^⊥` after geometric base change, equivalently isotropic with `(#H)² = #ker λ`.
  Maximality among subgroup schemes defined over the ground field is insufficient. Such an `H`
  need not exist over that field; R28.1.13 and R28.3.5 arrange it by a finite extension.
- **Tate modules.** For a prime `l`, `T_l(A) = lim_n A[l^n](K̄)` with its continuous `π`-action, free of
  rank `2g` over `ℤ_l`, and `V_l(A) = T_l(A) ⊗_{ℤ_l} ℚ_l`. An `l`-divisible subgroup `G ⊆ A[l^∞]` over
  `K` is the same as a `π`-stable saturated `ℤ_l`-submodule `T_l(G) ⊆ T_l(A)` (saturated: `l·x ∈ T_l(G)`
  implies `x ∈ T_l(G)`, equivalently a `ℤ_l`-direct summand); its height is the rank of `T_l(G)`,
  `G_n = G[l^n]`, and `A_n = A/G_n`. For an isogeny `φ : A → B`, `T_l(φ)` is injective and its cokernel
  has order the `l`-part of `deg φ`.
- **Frobenius and local factors.** `F_v ∈ π` is an arithmetic Frobenius at `v` (it induces `x ↦ x^{Nv}` on
  the residue field), defined up to conjugation and inertia. At a finite place `v ∤ l` of good
  reduction, `P_v(A, T) = det(1 − F_v T | T_l(A)) ∈ ℤ[T]` is independent of `l` and
  `L_v(A, s) = P_v(A, Nv^{−s})^{−1}`. *Witness:* for an elliptic curve with good reduction at `v`,
  `P_v(E, T) = 1 − a_v T + Nv·T²`; for `11a1` at `v = 2`, `a_2 = −2` and
  `P_2(T) = 1 + 2T + 2T²`. At bad places use geometric Frobenius on the inertia
  invariants of `H¹_l(A) = V_l(A)^∨`, or arithmetic Frobenius on the Tate coinvariants.
  For a split Tate elliptic curve at `v`, this gives `1 − T`; arithmetic Frobenius on
  the Tate invariant line instead gives `1 − Nv·T`, so that line does not define the local factor.
- **Characters.** `χ_0` is the `l`-adic cyclotomic character, `σ(ζ) = ζ^{χ_0(σ)}` for every `l`-power root
  of unity `ζ` (Mathlib `cyclotomicCharacter`); its reduction mod `l` is the mod-`l` cyclotomic
  character (Mathlib `modularCyclotomicCharacter`). `ℤ_l(1) = T_l(μ)` and `ℤ_l(k) = ℤ_l(1)^{⊗k}`. For a
  finite extension `F/ℚ_l` with `C` the completion of `F̄`, `C(k) = C ⊗_{ℤ_l} ℤ_l(k)` with the diagonal
  semilinear action. `q = l` for `l` odd and `q = 4` for `l = 2`; every `x ∈ ℤ_l^×` is uniquely
  `x = ζ·⟨x⟩` with `ζ` a root of unity in `ℤ_l` and `⟨x⟩ ∈ 1 + qℤ_l`.
- **Induction.** For `π ⊆ π̃` of index `m`, `Ind_π^{π̃}` is induction of continuous representations, and
  `ε : π̃ → {±1}` is the sign of the permutation action of `π̃` on `π̃/π` (the character of `π̃` on
  `Λ^m Ind_π^{π̃}(ℤ)`). *Witness:* for `K = ℚ(√D)`, `ε` is the quadratic character of `K/ℚ`.
- **Isomorphism classes.** "Finitely many" always means finitely many isomorphism classes over the
  field named (over `K`, not over `K̄`), of the objects together with the structure named
  (a polarization when one is fixed).
- **Lean.** Declarations live in `TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems`; names below are
  relative to it. `Suggested.lean` declares `hasGoodReductionAt`,
  `finite_isogenyClasses`, `isStableLattice`, `finite_stableLattices`,
  `finite_directFactors`, `shafarevich_unpolarized`,
  `curveHasGoodReductionAt`, `finite_curves_goodReduction`,
  `ellipticRationalRepresentation`, `elliptic_semisimple`, `elliptic_tate_hom_iso`,
  `elliptic_isogenous_iff_rationalTateModule`, `elliptic_isogenous_iff_ap` and
  `finite_ellipticIsogenyClass`. These state stable-lattice finiteness, finiteness for abelian varieties and curves,
  and the elliptic Tate and isogeny theorems against the pinned carriers. Good reduction
  uses smooth proper local models with geometrically connected fibres, with a
  commutative group structure for abelian varieties. The rational elliptic representation
  is the scalar extension of the integral Tate action. The other targets are specified
  in this README.

## Exact supplier contracts

Each supplier statement is consumed with its own hypotheses; where a target needs more than a
supplier states, the additional statement is part of that target here.

### From Mathlib (pinned)

- Schemes: `AlgebraicGeometry.Scheme`, `Scheme.Hom`, `IsProper`, `IsSeparated`, `Smooth`, `IsFinite`,
  the valuative criterion `IsProper.eq_valuativeCriterion`, relative normalisation
  `Scheme.Hom.normalization`, and Zariski's main theorem in the form
  `IsFinite.of_isProper_of_locallyQuasiFinite` (proper and locally quasi-finite morphisms are finite).
  Group objects `CategoryTheory.GrpObj` and homomorphisms `IsMonHom`.
- Number fields: `NumberField.RingOfIntegers`, `InfinitePlace` with `InfinitePlace.mult` (the weights
  `ε_v`), the product formula `NumberField.prod_abs_eq_one`, `IsDedekindDomain.HeightOneSpectrum`,
  `FractionalIdeal.absNorm`, discriminants `NumberField.discr`, Hermite's theorem
  `NumberField.finite_of_discr_bdd`, the different (`not_dvd_differentIdeal_iff`,
  `NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow`), cyclotomic fields
  (`IsCyclotomicExtension.Rat.galEquivZMod`, `IsCyclotomicExtension.Rat.ramificationIdxIn_eq_of_prime_pow`).
- Heights: `Projectivization.logHeight`, `Projectivization.mulHeight`,
  `NumberField.finite_setOfPred_mulHeight₁_le` (Northcott over a number field), `Height.mulHeight_comp_le`,
  `Height.mulHeight₁_div_eq_mulHeight`.
- `p`-adic numbers: `PadicInt` with `PadicInt.compactSpace`, Hensel's lemma `hensels_lemma`,
  `ZMod.sq_add_sq`, `Nat.sum_four_squares`.
- Algebra: `IsSemisimpleModule`, `IsSemisimpleRing` with `IsSemisimpleRing.ideal_eq_span_idempotent`,
  `Algebra.traceForm`, `LinearMap.BilinForm.IsAlt`, `LinearMap.BilinForm.orthogonal`,
  `LinearMap.BilinForm.finrank_add_finrank_orthogonal`, `LinearMap.det`, `LinearMap.trace`, `Matrix`,
  `Polynomial` (with `Polynomial.roots` and Vieta's formulas), `Polynomial.finite_mahlerMeasure_le`
  (bounded degree and Mahler measure over `ℤ`),
  `Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `Submodule.IsLattice`, Nakayama's lemma.
- Galois theory and representations: `Field.absoluteGaloisGroup`, `cyclotomicCharacter`,
  `modularCyclotomicCharacter`, `Representation.ind`, the transfer `MonoidHom.transfer` with
  `MonoidHom.transfer_eq_prod_quotient_orbitRel_zpowers_quot`.
- Elliptic curves: `WeierstrassCurve`, `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.VariableChange`.
- `Matrix.Module.matrixModule` (scoped): matrices act on `V^n` through their coefficients, with
  `one_smul`, `zero_smul`, `mul_smul` and `Matrix.Module.smul_apply`.

### From Tau Ceti (pinned)

The abelian-variety modules are `TauCeti.AlgebraicGeometry.AbelianVariety.Basic`,
`.MorphismGroup`, `.End.Basic`, `.Product` and `.Isogeny`. Their namespace is
`TauCeti.AlgebraicGeometry.AbelianVariety`; the short names below refer to it.
The Weierstrass Hom modules are `TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Basic`,
`.Hom.Add` and `.MulByInt.Hom`, with namespace `TauCeti.Isogeny.Hom`.

- `TauCeti.AlgebraicGeometry.AbelianVariety` over a field, with `AbelianVariety.Hom` (a commutative group,
  written multiplicatively), `AbelianVariety.End` (a ring), `AbelianVariety.prod`,
  `AbelianVariety.baseChange` and `AbelianVariety.IsIsogeny` (finite and surjective).
- `TauCeti.Isogeny.Hom W₁ W₂` for Weierstrass curves: the zero map and the isogenies, an additive group
  (`Isogeny.Hom.add_comp`), with composition, `Isogeny.Hom.degree`, `Isogeny.Hom.comp_eq_zero_iff` and
  `Isogeny.Hom.degree_zsmul` (`deg(n • f) = n²·deg f` on elliptic targets).
- `AlgHom.centralizer_centralizer_range` in `TauCeti.RingTheory.Semisimple.DoubleCentralizer`
  (the double centralizer theorem for a semisimple algebra acting
  on a finite module) and `TauCeti.finiteLocallyFreeCommAffineGroupSchemeProperty` (finite locally free
  commutative group schemes with Cartier duality).
- `LinearMap.BilinForm.prod` in `TauCeti.LinearAlgebra.BilinearForm.Prod` gives the
  block-diagonal sum of two bilinear forms. the orthogonal-sum form evaluates it on the two coordinatewise
  sums over `Fin 4`; those coordinatewise forms have no dedicated pinned carrier.

### From TauCetiRoadmap roadmaps

- *ClassFieldTheory, Layer 13*: `kroneckerWeber` (every finite abelian extension of `ℚ` lies in a cyclotomic
  field). Used in R28.2.6 and R28.5.6.
- *Chebotarev, Layer 10*: `hasDirichletDensity_frobeniusPrimeSet`, with the consequence that every
  conjugacy class of a finite Galois group is the Frobenius class of infinitely many primes. Used in
  R28.4.7 and R28.5.2.
- *GlobalNumberFields, Layer 10*: ramification in cyclotomic fields. Used in R28.5.6.
- *NumberFieldArithmetic, Layer 6.4* and *LocalFieldsRamification, Layer 3*
  and Tau Ceti `TauCeti.differentExponent_le_ramificationIndex_sub_one_add_natCastValuation`
  in `TauCeti.NumberTheory.LocalField.Different.Wild`: in the wild case, `e ≤ v_𝔓(𝔇) ≤ e − 1 + v_𝔓(e)`;
  in the tame case, `v_𝔓(𝔇) = e − 1`. Thus the upper bound holds in both cases. Used in R28.1.9.
- *EllipticCurves, Layers 1, 2 and 4*: the dual isogeny over `K`, the Tate module of a Weierstrass curve with
  its Galois action, reduction types and `a_v`. Used in Layer R28.6.
- *JacobianChallenge, Layers D and E*: Picard representability and the principal polarization
  of a pointed curve's Jacobian by the theta divisor, independent of translation of theta.
  R28.5.14 obtains the field specialization of the canonical Jacobian polarization on the unpointed Jacobian of
  SchemeAndStackFoundations §3.6 by specializing JacobianChallengePartII §1.4 to `S = Spec(k)`.

### From the roadmaps this one builds on

- *SchemeAndStackFoundations*: §2.20 `RelativeDualizingComplex`, `relativeDualizingModule` and
  `curve_dualizing_comparison` (over a field), for the relative dualising sheaf of a stable curve; §3.8 `invariant_differentials`; §4.15 `StableCurves.Mbar`,
  `Mbar_algebraic_proper_DM` and `level_structure_cover`; §4.17 normal-crossings divisors.
  **AlgebraicVectorBundles** Layers L0B–L0C supplies `determinantObj` with pullback and product
  compatibility. Together these supply the Hodge line `det(e^*Ω¹)` on a smooth group scheme.
  On an abelian scheme its proper pushforward description is
  AbelianSchemesAndArithmeticModuli §A1.3 `relativeInvariantForms` and §A6.38 `AbelianHodgeLine`.
  Section 3.5 supplies `lineBundleNorm`, `lineBundleNorm_pullback` and
  `lineBundleNorm_baseChange` for R28.1.3, with §3.2 `scheme_riemann_hurwitz`.
  Section 3.6 supplies `jacobian` and `jacobian_dim` without a rational-point hypothesis;
  §1.1 supplies descent of sheaf morphisms for R28.5.14. Sections 1.18–1.20 supply
  effective descent, finite-presentation and proper-stack carriers, and the groupoid
  of lifts with a specified generic identification for R28.1.4; §§0.20–0.21 supply
  finite normalization over excellent bases.
- *AlgebraicModuliForArithmeticGeometry*: §5.4 `DMSchematicClosure.stack`, `DMNormalization.stack`,
  `DMNormalization.finite`.
- *JacobianChallengePartII*: §1.2 the relative Jacobian `J(X/S) = Pic⁰_{X/S}`, which over a field
  base is JacobianChallenge Layer D's Jacobian, and §1.3 its base change; §1.4 the canonical
  principal polarization `λ_X`, defined without a degree-one bundle, compatible with every base
  change and equal to `φ_{O(θ_α)}` on a field fibre with a degree-one divisor `α`. For a stable
  family of genus `g ≥ 2` over an integral Noetherian base, §6.1 the Lie comparison
  `Lie(Pic⁰_{C/S}) ≅ R¹q_*O_C`, §6.2 the rank-`g` comparison `q_*ω_{C/S} ≅ e^*Ω¹_{Pic⁰/S}` and
  §6.3 its determinant, each compatible with base change. R28.1.1 adapts §§6.1–6.3 to Faltings'
  Hodge line; R28.5.14 specializes §§1.2–1.4 to a field. The analytic metric stays here.
- *AbelianSchemesAndArithmeticModuliPartII*: B4.1, geometric strong Torelli: for smooth
  projective connected curves of genus `g ≥ 2` over an algebraically closed field, Abel
  embeddings `j`, `j′` and an isomorphism `β` of canonically polarized Jacobians, there are a
  curve isomorphism `α`, a sign `ε` and a point `c` with `j′ ∘ α = ε β ∘ j + c`. R28.5.14 adds the
  uniqueness of `(α, ε, c)` and the descent to a perfect field.
- *ComplexComparisonPartII*: C0.3 `holomorphicBundleDictionary` and C0.4 `CoherentAnalytification`
  are direct prerequisites of Layer R28.1. They identify holomorphic bundles with finite locally free
  analytic sheaves on complex manifolds and analytify coherent sheaves on schemes locally of finite
  type over `ℂ`, compatibly with tensor products. ArakelovGeometryAndAbelianHeights also uses coherent
  analytification in supplying the height and metric comparisons.
- *AbelianSchemesAndArithmeticModuli*: A0.2 `fieldAndEllipticBoundary`; A1.3 `relativeInvariantForms`; A1.6
  `relativeEllipticEquivalence`; A2.2 `AbelianScheme.dual` (with `dual_prod`); A2.5 `Polarization`
  (`Polarization.degree`: the kernel has rank `d²` for a polarization of their degree `d`); A3.3
  `AbelianQuotient`; A3.6 `ThetaGroup` (`ThetaGroup.commutator`, `ThetaGroup.descend`); A3.7
  `polarizedWeilPairing`; A6.1 `Hom.deg` (`deg_functionField`); A6.2 `homTateInjective`; A6.5
  `poincareReducibility`; A6.7 `homFreeFinite` (Hom free of finite rank, `Hom ⊗ ℤ_l → Hom(T_l, T_l)` injective
  with torsion-free cokernel); A6.8 `endQ_isSemisimple` (with `End(A^n) = M_n(End A)` compatibly with `T_l`);
  A6.13 `polarizedIsogenyDegree`; A6.14 Rosati positivity; A6.18 `polarizedAutomorphisms` (finiteness of
  `Aut(A, λ)` and level-`n ≥ 3` rigidity); A6.20 `homDescentFullLevel`; A6.33 `weilRestrictionTate`; A6.38
  `AbelianHodgeLine`. Their "polarization of degree `d`" is a polarization of degree `d²` in the convention
  here.
- *ArithmeticGaloisDuality*: R02.3.1
  `RestrictedRamification.finite_unramifiedOutside_of_finrank_le`, for extensions inside a
  fixed separable closure, with bounded degree and unramified at finite places outside a
  finite set. R28.1.9 retains only the fixed-degree and ambient-closure adapters.
- *ArithmeticGaloisRepresentations*: §1.3 “The Mackey decomposition”, using pinned
  `Rep.mackeyDecomposition` for the abstract isomorphism, and the prose targets
  “The Mackey decomposition” and “The determinant of an induced representation”. Induction is from an open subgroup of a compact group on a finite-rank
  free module; the Mackey restriction subgroup is closed. §1.6
  stable lattices; §1.8 Brauer–Nesbitt (`ContinuousRep.iso_of_charpoly_eq`) in its trace form:
  semisimple representations of dimension `d` with equal traces are isomorphic when `d!` is
  invertible, in particular in characteristic `0`; §5.1 density of `GaloisRep.frobeniusSet` and its
  finite-quotient consequence; §5.3 recognition on a dense subset, both from Frobenius
  polynomials (`GaloisRep.iso_of_frobenius_charpoly_eq`) and from traces when `n!` is invertible; §6.1
  `TateModule.tateModule`, `TateModule.tateModuleRep`, “The elliptic comparison” and
  “Functoriality of the arithmetic adapter”. These use AbelianSchemesAndArithmeticModuli
  §A4.1 `AbelianTate.map` and `AbelianTate.baseChange`; an isogeny induces an injection of Tate
  lattices with cokernel of order its degree's `l`-part, and products give direct sums.
  Section 6.2 transports the supplied alternating pairings into the cyclotomic target,
  perfect when `l ∤ deg λ`, with the supplied product comparison. Section 6.3
  `TateModule.localEulerFactor` uses geometric Frobenius on the inertia invariants of `H¹`,
  equivalently arithmetic Frobenius on the Tate coinvariants; it includes isogeny invariance,
  products and agreement with the Weil–Deligne factor. Section 7.1 supplies
  `ContinuousRep.extPower`. Integral good-reduction polynomials independent of `l` and their
  all-conjugates Weil bounds are WeightsInEtaleCohomology R34.2, “Frobenius on the Tate module
  and first cohomology” and “Purity and integral polynomials at good reduction”, using
  AbelianSchemesAndArithmeticModuli §A6.11 `charpolyTate` and DeligneWeightsAndPurity §1.4.
- *NeronModelsAndSemistableAbelianVarieties*: §3.1 `SemistableReduction` (`toric_zero`); §3.2
  `SemistabilityIsogeny`; §3.3 `SemistableIdentityBasechange`; §3.5 `ToricFiniteFiltration`,
  `FiniteFlatToricFiltration`; §3.6 `Orthogonality`, `FiniteFlatOrthogonality`; §3.7 `InertiaSquareZero`; §3.8–§3.9
  `PicardNeronIdentity`; §3.10 `JacobianIsogenyFactor` (positive dimension over an infinite field) and
  `FiniteSeparableSemistableExtension`; §3.11 `MonodromyCriterion`; §3.12
  `FiniteTorsionSemistability` (semistable over `K(A[n])` at places prime to `n ≥ 3`); §3.13
  `RaynaudExtensionComparison`; §2.4 `ToricCharacter`; §4.13 `StableFamilyPicard`; §5.1 `NeronOggShafarevich`;
  §5.2 `GoodIsogeny`; §6.4 `IsogenyDifferentialExport`; §6.5 `EquationGoodComparison`. These are local
  statements over excellent (henselian) discrete valuation rings; the number-field forms used here apply them
  at each place.
- *HeightsAndUnits*: §1.1 `instNorthcottProjectivizationMulHeight` and
  `instNorthcottProjectivizationLogHeight`; *DiophantineApproximationAndTranscendence*: §§0.2–0.3
  `absoluteProjectiveTupleHeight`, `mulHeight_pow_finrank` and `finite_setOf_absMulHeight₁_le`.
  For a finite extension `L/K` of number fields and a finite tuple `x` over `K`,
  `mulHeight_pow_finrank` in §0.2 states `H_rel,K(x)^[L:K] = H_rel,L(x)`
  for a tuple indexed by any finite type; reversing this equality gives the orientation used here,
  with coordinates mapped along the number-field algebra map `K → L`;
  the zero tuple has height `1`. Applying this to `(x,1)` gives the scalar comparison.
  The absolute tuple height is `H_abs(x) = H_rel,K(x)^(1/[K:ℚ])` and is invariant under
  extension, since `[L:ℚ] = [L:K][K:ℚ]` cancels the relative-height power
  ([Wu, *Arithmetic heights*](https://www.math.columbia.edu/~xiaorunw/diop/08.pdf),
  §2, Lemma 2.5 and Definition 2.7, p. 4).
  These supply the normalization, extension comparisons and projective Northcott used here.

  **Checks.**

  - The tuple `(2,1)` has relative height `2` over `ℚ` and `4` over `ℚ(i)`.
  - Its absolute height is `2` over both fields.
  - The zero tuple has height `1` over both fields, consistent with `1^[L:K] = 1`.
- *DeligneWeightsAndPurity*: DWP.0 §0.14 (eigenvalues of exterior powers), DWP.1 §1.4 (the Weil estimate for
  abelian varieties over `𝔽_q`).
- *FiniteFlatGroupsAndIntegralPadicHodgeTheory*: R07.1.3 `finitePart`; R07.1.8 `BarsottiTate.tateModule`;
  R07.1.14 `BarsottiTate.dim`; R07.1.16 `BarsottiTate.discr_level`; R07.1.17
  `invariantDifferentialsAndAbsoluteDifferent` (`ω_{G[p^v]} ≅ (R/p^vR)^d`; `v_R(𝔇(𝒢)) = length_R ω_𝒢`); R07.1.19 `BarsottiTate.hodgeTate` (the determinant consequence); R07.1.20 `schematicClosure_flat`;
  R07.1.20a `BarsottiTate.quotientFiniteFlatSubgroup` (quotients by finite flat subgroups);
  R07.1.21 `BarsottiTate.exists_of_tateModule_summand` (Tate's Proposition 12); R07.1.33
  `raynaudDeterminantTameDifferent` (Raynaud's Théorème 4.1.1, over a strictly henselian base with `e ≤ p − 1`).
- *WeightsInEtaleCohomology*: R34.2 (Frobenius on the Tate module at good reduction, weights of exterior
  powers).
- *PELModuli*: M2.1 `rigidity`; M6.3 `siegelStack`; M6.5 `coarseModuli`; M6.7 `descentObstruction` (`K`-forms
  split by `K'` ↔ `H^1(Gal(K'/K), Aut_{K'})`); M6.9 `hodgeLine`; M6.10 `moduliPoint`.
- *ShimuraVarieties*: §2.7 `TauCeti.Shimura.baily_borel`; §8.18 `CanonicalModel.minimal_defined_over_reflex`.
- *PadicPeriodRings*: §2 `tateSen` and `tateSen_character` (Tate's theorems on `C(ψ)`: `C(ψ) ≅ C` exactly when `ψ` has finite
  image on inertia; representations with finite image on inertia are `C`-trivial).
- *ArakelovGeometryAndAbelianHeights*: §§1.3–1.6, 1.12–1.14 (the arithmetic degree of a hermitian line bundle on `Spec(O_K)`
  and its comparison with projective heights, including §1.3
  `HermitianBundle.arakelovDegree_ofFractionalIdeal`, `HermitianBundle.arakelovDegree_eq_infinitePlace`
  and `HermitianBundle.arakelovDegree_rescale`), §§2.1–2.8 (the Hodge bundle with its integration metric), §§3.1–3.4
  (the height of a semiabelian model and its base-change invariance), §§4.1–4.4 (the isogeny variation:
  flatness of an isogeny of semiabelian models, its quasi-finite flat kernel, the inclusion of Hodge lattices
  with cokernel `s^*(Ω^1_{G/R})`, the archimedean scaling by `deg φ`, and the bound
  `|v_p(exp(2m(h(B) − h(A))))| ≤ m·v_p(deg φ)`), §§5.1–5.4
  (`HermitianMetric.HasLogSingularities`, its local and tensor API, logarithmic Northcott,
  Hodge growth and `SiegelModuli.modularMetric_logSing`). R28.1.5–R28.1.8 and R28.2.1–R28.2.2
  use aliases and specializations of these objects and results in Faltings' normalization.
- *PadicDifferentialEquationsAndRigidCohomology*: §RD.5.116, Zarhin's trick with its finite-flat
  graph quotient and principal-polarization descent, specialized to `Spec(k)` with a `k`-polarization.
- *ClassicalArithmeticCompletion*: §7.4 `IntegralOrder.IsOrder` (an order is a subalgebra which
  is a full lattice), §7.21 `IntegralOrder.IsMaximalOrder`, §7.56 (every order in a
  finite-dimensional characteristic-zero semisimple algebra lies in a maximal order).
- *AdelicAlgebraicGroups*: AA.3.3, “Reduction for reductive subgroups of GL_n”,
  “Closed-orbit lattice finiteness” and “Rational points on closed orbits”. R28.5.12 constructs
  the arithmetic closed-conjugacy-orbit adapter from these reduction results.

The semiabelian-family carrier and dense-open homomorphism extension are
ArakelovGeometryAndAbelianHeights §2.0 `GroupScheme.IsSemiAbelianFamily` and
`GroupScheme.semiAbelianHom_extend`. The integral principal Siegel compactifications are its
§§5.0a–5.0b `SiegelModuli.ToroidalCompactification`, `SiegelModuli.toroidalFamily`,
`SiegelModuli.MinimalCompactification`, `SiegelModuli.toroidalToMinimal` and
`SiegelModuli.minimalHodgePower_pullback`. They include smooth complex normal-crossings charts,
a proper toroidal stack over all of `ℤ`, a normal projective minimal coarse scheme over `ℤ`,
and a positive Hodge power pulled back from an ample line on that scheme. The integral
base and all primes are retained; a space over `ℤ[1/n]` alone does not provide this contract.
This roadmap's the correspondence stack adds a stable-curve family and a saturated
Hodge subline over an integral proper correspondence, rather than a second Siegel compactification.

## How to read the build

R28.1 defines the modular height of a semistable abelian variety and proves Satz 1, the finiteness of
principally polarized abelian varieties of bounded height over a fixed number field; the proof
compares the height with a projective height through the correspondence stack and the logarithmic
singularities of the Hodge metric. R28.2 computes heights along isogenies and proves the determinant
identity `Σ m_i d_i = mh/2`. R28.3 repairs Satz 2 with the erratum, proves that the heights along an
`l`-divisible tower become stationary, and builds the principally polarized towers. R28.4 proves Satz 3
and Satz 4 by Zarhin's argument and the quaternion construction, with Korollare 1–3. R28.5 proves Satz 5
and Satz 6, removes the polarization, and deduces the finiteness of curves with good reduction outside
`S`, the input to Parshin's implication. R28.6 exports the results to elliptic curves and proves the
integral commutant statement at almost all primes. Subsections are in dependency order within each layer; some Checks and applications point forward.

## Layer R28.1: Semiabelian models, modular heights and finiteness of bounded height

This layer is Sections 2 and 3 of Faltings 1983. It attaches to a semistable abelian variety over a
number field its modular height, and proves that only finitely many principally polarized abelian
varieties of a given dimension over a given number field have bounded height (Satz 1). The height is
compared with a projective height on the Baily–Borel compactification; the comparison is uniform
at the finite places because of a proper stack of stable curves over `ℤ` (Lemma 2 and its
Korollar), and it costs only logarithmic error terms at the infinite places because the Hodge metric
has logarithmic singularities along the boundary (Lemma 3). The layer ends with the reduction from
arbitrary polarizations to principal ones over a uniform field extension, which Layers R28.4 and
R28.5 use.

### R28.1.1 The Hodge determinant of a stable Picard scheme

For a semiabelian scheme `p : A → S` of relative dimension `g`
(a smooth separated commutative group scheme satisfying
ArakelovGeometryAndAbelianHeights §2.0 `GroupScheme.IsSemiAbelianFamily`), with
zero section `s`, use the Hodge line `s^*(Ω^g_{A/S})` supplied by
SchemeAndStackFoundations §3.8 and AlgebraicVectorBundles Layers L0B–L0C.
Prove the stable-Picard Hodge comparison (Faltings 1983, §2, Bemerkung c), p. 351): if `S` is integral Noetherian and
`A = Pic^τ(C/S) = Pic^0(C/S)` for a stable curve `q : C → S` of genus `g ≥ 2`, then
`ω_{A/S} ≅ Λ^g q_*(ω_{C/S})`, where `ω_{C/S}` is the relative dualising sheaf, compatibly with
every base change between integral Noetherian bases. This target is an adapter: the Lie comparison
`Lie(Pic^0(C/S)) ≅ R^1 q_*O_C`, the rank-`g` comparison `q_*ω_{C/S} ≅ e^*Ω^1_{Pic^0/S}` and its
determinant are JacobianChallengePartII §§6.1–6.3, under the same stable genus-`g ≥ 2` hypotheses
over an integral Noetherian base (Kleiman, Theorem 5.11 and Remark 5.12, pp. 42–44, for the first).
What is added here is the identification of their determinant line `det(e^*Ω^1_{Pic^0/S})` with
Faltings' `ω_{A/S} = s^*Ω^g_{A/S}`, through the canonical isomorphism
`s^*Ω^g_{A/S} = Λ^g s^*Ω^1_{A/S}` and AlgebraicVectorBundles L0C's comparison of `Λ^g` with the
determinant of a rank-`g` bundle, both compatible with base change.
The stable-Picard comparison is used on integral Noetherian charts of the correspondence;
no arbitrary-base stable-Picard assertion is needed here.
The pairing used on this line over `ℂ` is supplied by ArakelovGeometryAndAbelianHeights §2.1
`AbelianVariety.faltingsInner`: `⟨α, β⟩ = 2^{−g} i^{g²} ∫_{A(ℂ)} β ∧ ᾱ`, conjugate-linear in
its first argument. Its norm is the one fixed in Conventions.

*Proof route.* Translation identifies `Ω^1_{A/S}` with `p^*(s^*Ω^1_{A/S})`, so
`Ω^g_{A/S} ≅ p^*ω_{A/S}`; for proper `p` the fibres are geometrically connected and reduced, so
`p_*O_A = O_S` universally and `p_*Ω^g ≅ ω`. Base change of `Ω^1` and of the zero section gives the
base-change comparison. For the Picard comparison, compose JacobianChallengePartII §6.3 with the
canonical isomorphisms `det(e^*Ω^1) ≅ Λ^g e^*Ω^1 = s^*Ω^g`; base change follows because each of the
three maps commutes with pullback. The supplied metric is positive because in linear coordinates `α = f dz_1 ∧ ⋯ ∧ dz_g` one has
`α ∧ ᾱ = (−1)^{g(g−1)/2}|f|² dz_1 ∧ dz̄_1 ∧ ⋯ ∧ dz_g ∧ dz̄_g` and `(i/2)dz_j ∧ dz̄_j = dx_j ∧ dy_j`, so
`2^{−g} i^{g²} ∫ α ∧ ᾱ = ∫ |f|² dV > 0`. Faltings states the four remarks without proof, and prints the
factor `(i/2)^g`, which gives `−∫|f|² dV` when `g ≡ 2, 3 mod 4`; the factor here is the corrected one
(Conventions).

*Needs:* ArakelovGeometryAndAbelianHeights §2.0 `GroupScheme.IsSemiAbelianFamily`; for proper `p`,
AbelianSchemesAndArithmeticModuli A1.3 `relativeInvariantForms` and A6.38 `AbelianHodgeLine`
(`AbelianHodgeLine.mk`, `AbelianHodgeLine.baseChange`); NeronModelsAndSemistableAbelianVarieties
§4.13 `StableFamilyPicard` (the degree-zero Picard scheme of a stable family is semiabelian);
JacobianChallengePartII §6.1 (Picard Lie algebra and `R^1 q_*O_C`), §6.2 (curve and Jacobian
Hodge bundles) and §6.3 (their determinant line); SchemeAndStackFoundations §3.8
`invariant_differentials`; AlgebraicVectorBundles L0C (`determinantObj`); ArakelovGeometryAndAbelianHeights §§2.1–2.8
(the Hodge bundle with its integration metric); Mathlib `AlgebraicGeometry.Smooth`,
`AlgebraicGeometry.IsProper`, `CategoryTheory.GrpObj`; Tau Ceti `AbelianVariety`.

**Checks.**
- For an elliptic curve over a discrete valuation ring with multiplicative reduction, the semiabelian
  model (the identity component of the Néron model) is not proper; `ω` is defined through the zero
  section and the proper pushforward comparison does not apply. A definition through `p_*Ω^g` would be wrong here.
- For `A = E_1 × E_2` over `ℂ` and `α = dz_1 ∧ dz_2`, the printed factor gives `(i/2)² ∫ α ∧ ᾱ = −vol(A)`
  and the convention here gives `+vol(A)` (volume for `dx_1 dy_1 dx_2 dy_2`): a definition with the
  printed factor fails positivity.
- For `g = 1` and `A = ℂ/(ℤ + τℤ)`, `⟨dz, dz⟩ = (i/2) ∫ dz ∧ dz̄ = Im τ`; for `g = 1` both factors agree.
- On two stable curves of genus 2 over a field, two elliptic curves meeting in one node
  (`Pic^0 = E_1 × E_2`, proper) and an irreducible curve with one node whose normalisation has
  genus 1 (`Pic^0` an extension of that elliptic curve by `G_m`), `Λ^2` of the two-dimensional space of
  sections of the dualising sheaf is a line, as the Picard comparison requires.
- On a smoothing of an irreducible one-node genus-2 curve over `Spec(k[[t]])`, the Picard
  toric rank jumps from `0` to `1`, while both comparison bundles have rank `2`; a comparison
  that assumes the stable Picard scheme proper excludes this family. The base is integral
  Noetherian, and pullback to its generic and closed points preserves the two isomorphisms.

### R28.1.2 Uniqueness of semiabelian models

Faltings' Lemma 1 (§2, p. 350) is the extension theorem for homomorphisms of semiabelian schemes over
a normal base, which this roadmap takes from ArakelovGeometryAndAbelianHeights §2.0
`GroupScheme.semiAbelianHom_extend`: for a Noetherian normal `S`, a dense open `U` and
semiabelian `G, H` over `S`, restriction `Hom_S(G, H) → Hom_U(G_U, H_U)` is bijective. Prove from it
uniqueness of semiabelian models: for a Dedekind scheme `S = Spec(R)` with fraction field `K` and an abelian
variety `A/K`, two semiabelian models of `A` over `S` are isomorphic by a unique isomorphism inducing
the identity on `A`, and every `K`-homomorphism `A_1 → A_2` of abelian varieties with semiabelian
models extends uniquely to a homomorphism of the models (extension of model homomorphisms).

*Proof route.* Spread a generic-fibre homomorphism to a dense open `U ⊆ S`: the models are locally
of finite presentation, and quasi-compactness of the abelian generic fibre permits a finite cover
and a common open on which the morphism and its group identities are defined. Apply the supplier's
extension theorem to this open. Spread the identity and its inverse in the same way; uniqueness
makes their composites identities. For a general ring of integers, `Spec(K)` itself is not open in
`Spec(R)`. Uniqueness also follows from schematic density of the generic fibre and separatedness
of the target. The graph argument of Faltings' Lemma 1 is part of the supplier theorem, rather than
a new normalization theorem here.

*Needs:* ArakelovGeometryAndAbelianHeights §2.0 `GroupScheme.semiAbelianHom_extend`; R28.1.1.

**Checks.**
- On `Spec(ℤ)`, the generic fibre `Spec(ℚ)` is dense but not open; the spreading step must precede
  the dense-open extension theorem. The theorem retains its normality hypothesis.
- On `S = Spec(R)` with `R` a discrete valuation ring and `A_1 = A_2` the identity component of the
  Néron model of an elliptic curve with multiplicative reduction, every endomorphism of the generic
  fibre extends.
- The extension of a homomorphism is again a homomorphism of group schemes, not merely a morphism of
  schemes; and applied to the identity it makes `h(A)` of R28.1.5 an invariant of `A_K`.

### R28.1.3 The correspondence stack

Fix `g ≥ 1`. Let `𝔄_g` be the Deligne–Mumford stack over `ℤ` of principally polarized abelian schemes
of relative dimension `g`, with universal abelian scheme `A` and coarse space `A_g`; fix `r > 0` with
`ω_{A/𝔄_g}^{⊗r}` descending to a very ample line bundle on `A_g ⊗ ℚ`, let `Ā_g/ℚ ⊆ ℙ^N_ℚ` be the
resulting projective minimal (Baily–Borel) compactification, `Ā_g/ℤ` its closure in `ℙ^N_ℤ` and
`M = O(1)`. Construct the correspondence stack for dimension `g` (Faltings 1983, §2, Lemma 2, p. 352): a proper
integral Deligne–Mumford stack `J` over `Spec(ℤ)`, an open substack `U ⊆ J` and a proper morphism `ψ : U → 𝔄_g`
extending to `ψ̄ : J ⊗ ℚ → Ā_g/ℚ`, together with

- (a) a stable curve `q : C → J` of some genus `g̃ ≥ max(g, 2)` (the stable curve);
- (b) a line subbundle `L ⊆ Λ^g q_*(ω_{C/J})` which is locally a direct summand
  (the Hodge subline);
- (c) over `U`, homomorphisms `α : Pic^τ(C/J) → ψ^*A` and `β : ψ^*A → Pic^τ(C/J)` with `α ∘ β = [d]` for
  some integer `d ≠ 0` (the two Picard homomorphisms);
- (d) over `J ⊗ ℚ` an isomorphism `L^{⊗r} ≅ ψ̄^*M`, where over `U ⊗ ℚ` the bundle `L` is the image of
  `α^* : ψ^*ω_{A/𝔄_g} → Λ^g q_*(ω_{C/J})` and the isomorphism restricts to the `ψ^*`-pull-back of
  `ω^{⊗r} ≅ M` (the generic image identification, the modular-line comparison);
- (e) `ψ̄` is surjective and `ψ̄^{−1}(A_g ⊗ ℚ) ⊆ U` (surjectivity of the generic projection).

Faltings prints the dualising sheaf in (b) as `ω_{C/ℤ}`; it is the relative one over `J`. He does not
state (e); the Korollar (R28.1.4) uses it, and the `J` built below has it.

*Construction.* At the generic point of `𝔄_g`, after a finite extension of that generic field
if necessary, use NeronModelsAndSemistableAbelianVarieties §3.10 `JacobianIsogenyFactor`
over this infinite characteristic-zero field: there are a smooth proper geometrically connected
curve `C_η`, a complement `B_η` and an isogeny `Jac(C_η) → A_η × B_η`
(Milne, *Abelian varieties*, III Theorem 10.1 and proof, pp. 116–117).
Projection gives `α`; a quasi-inverse to the isogeny restricted to `A_η × 0` gives `β`
with `α ∘ β = [d]`, `d ≠ 0`. If the curve has genus one, construct a ramified double
cover of it after a finite extension: choose a positive-degree line bundle, a section of its
square with nonempty reduced zero divisor, and take the smooth double cover defined by that
section. SchemeAndStackFoundations §3.2 `scheme_riemann_hurwitz` gives genus at least two.
For a finite morphism `f : C' → C` of smooth proper geometrically connected curves over this
characteristic-zero field, use its finite locally free structure and §3.5 `lineBundleNorm`,
`lineBundleNorm_pullback` and `lineBundleNorm_baseChange`, together with JacobianChallenge
Layer D's Picard representability. Within the correspondence stack, restrict norm and pullback
to `Pic⁰`, by preservation of the identity component, and prove
`Norm_f ∘ f^* = [deg f]`, compatibly with field extension (Stacks 0BCY, 0BCZ, 0BD2).
For the double cover this is `[2]`, so norm is surjective; compose these maps with `α, β`.
This covering and Picard-map construction belongs to the correspondence stack.
The curve gives a rational map from the resulting dominant cover to `M̄_{g̃}`.
First close its graph over `𝔄_g`; projection to `𝔄_g` is proper because `M̄_{g̃}` is proper,
so this constructs the open correspondence `U`. Its compactification, including the extension
of the stable curve, is part of the integral compactification of the correspondence below; properness of the open
projection alone does not compactify the base. After normalization obtain `J` proper over `ℤ`; (a) holds by pulling back the universal stable curve, and (c) by
extending `α` and `β` from the generic point with the extension theorem of R28.1.2,
`Pic^τ(C/J) = Pic^0(C/J)` being semiabelian. Over `U ⊗ ℚ`, (d) prescribes `L` as the image of `α^*`, which
gives a rational map to the projective bundle of lines in `Λ^g q_*(ω_{C/J})`; replacing `J` by the
normalisation of the closure of its graph makes `L` a local direct summand over all of `J`, which gives
(b) and the second half of (d). For the first half of (d), `J` being normal, it suffices to extend the
isomorphism over one normal `J̃` proper and dominant over `J ⊗ ℂ`: take the normalisation of a
component of `J ×_{Ā_g} 𝒩` dominating `J`, where `φ : 𝒩 → Ā_g(ℂ)` is a smooth toroidal compactification
of a neat-level cover over which the universal family extends to a semiabelian scheme with
`ω^{⊗r} ≅ φ^*M`; over `J̃` the maps `α, β` extend by R28.1.2 and `α^*` identifies the extended `ω` with
`L`. Prove the integral compactification of the correspondence: the generic graph construction admits an integral
proper DM extension with this stable curve and Hodge subbundle, leaving its proper open
projection to `𝔄_g` intact. This is the all-prime completion implicit in Faltings' Lemma 2,
p. 352; it is included in the target, rather than inferred from a good-prime PEL compactification.
One must prove chart compatibility and proper descent over `ℤ` for this extension. The projective
closure of `Ā_g/ℚ` is available over `ℤ` simply by closing it in `ℙ^N_ℤ`; this does not assert a
smooth integral moduli model. After replacing `J` by a graph closure over that projective closure,
`ψ̄^{−1}(A_g ⊗ ℚ) ⊆ U`; `ψ̄` is surjective because its image is closed and contains the generic
point. Faltings records the construction of `J̃` in one sentence; the fibre product is one way of
carrying it out.

*Needs:* PELModuli M6.3 `siegelStack`, M6.5 `coarseModuli`, M6.9 `hodgeLine`; ArakelovGeometryAndAbelianHeights §5.0b (the ample Hodge power,
specialized to the Siegel datum over `ℚ`) and ShimuraVarieties
§2.7 `TauCeti.Shimura.baily_borel` with §8.18 `CanonicalModel.minimal_defined_over_reflex` (the minimal
compactification over `ℚ` and the ample power of the Hodge line); ArakelovGeometryAndAbelianHeights §§5.0a–5.0b
(the smooth toroidal charts and their map to the minimal compactification, used here over `ℂ`) for `φ : 𝒩 → Ā_g(ℂ)` with the semiabelian extension;
SchemeAndStackFoundations §4.15 `StableCurves.Mbar` and `Mbar_algebraic_proper_DM`
(`M̄_{g̃}` is a proper Deligne–Mumford stack over `ℤ`); AlgebraicModuliForArithmeticGeometry §5.4
`DMSchematicClosure.stack` and `DMNormalization.stack`; NeronModelsAndSemistableAbelianVarieties §4.13
`StableFamilyPicard` and §3.10 `JacobianIsogenyFactor`; JacobianChallenge Layer D
(Picard representability); SchemeAndStackFoundations §3.5 `lineBundleNorm`,
`lineBundleNorm_pullback`, `lineBundleNorm_baseChange`, §3.2 `scheme_riemann_hurwitz`;
AbelianSchemesAndArithmeticModuli A6.5 `poincareReducibility`; R28.1.1, R28.1.2;
Mathlib `AlgebraicGeometry.Scheme.Hom.normalization`.

Its API consists of the integral compactification, stable curve, saturated Hodge subline,
two Picard homomorphisms, generic image identification, modular-line comparison and
surjectivity properties specified above.

**Checks.**
- The curve has genus `g̃ ≥ max(g, 2)`; even for `g = 1` the construction uses a
  ramified double cover of the elliptic curve. A degree-one line bundle with a reduced degree-two
  branch divisor gives genus `2` by Riemann–Hurwitz and norm composed with pullback `[2]`.
- `α` is not an isomorphism when `g̃ > g` (the relative dimensions of `Pic^τ(C/J)` and
  `ψ^*A` are `g̃` and `g`); a construction producing an isomorphism is stronger than the source and wrong.
- The integral compactification of the correspondence is over all of `ℤ`. A construction
  over `ℤ[1/N]` fails this contract at primes dividing `N`; the supplier's good-prime compactification
  does not supply the missing fibres.
- `J` is proper over `Spec(ℤ)` while `𝔄_g` is not; `ψ̄` is asserted only over `ℚ`, and the
  Korollar first replaces `J` so that `ψ̄` is defined over `ℤ`.
- Pulled back along a point `Spec(R') → J` with generic point in `U`, `L` is the
  saturation of the image of `α^*(ω_{A/R'})` in `Λ^g q_*(ω_{C/R'})`; defining `L` as the image of `α^*` over
  all of `J` would not give a subbundle.
- For `g = 1` every principally polarized abelian variety of dimension one is its own Jacobian, and the
  classical case `d = 1` with `g̃ = 1` is excluded only because stable curves without marked points have
  genus at least 2.

### R28.1.4 The modular and Hodge line bundles are commensurable

Prove uniform commensurability of modular and Hodge lines (Faltings 1983, §2, Korollar to Lemma 2, pp. 352–353): there is
an integer `e_g > 0`, depending only on `g`, such that for every number field `K` with ring of integers
`R` and every semiabelian `p : A → Spec(R)` whose generic fibre is proper and carries a principal
polarization, the moduli point `ρ : Spec(K) → A_g ⊗ ℚ` extends to `ρ : Spec(R) → Ā_g/ℤ` and, under the
isomorphism `ρ^*M ⊗_R K ≅ ω_{A/R}^{⊗r} ⊗_R K`,
`e_g·ρ^*M ⊆ ω_{A/R}^{⊗r} ⊆ e_g^{−1}·ρ^*M`.

**Integral lifting after a finite extension.** Prove the following arithmetic extension
statement: for a number field `K`, `R = O_K`, a proper finitely presented Deligne–Mumford
stack `X → Spec(R)` and an object `x ∈ X(K)`, there are a finite extension `L/K` and
`x_R ∈ X(O_L)` with a specified isomorphism `x_R|_L ≅ x_L`. The extension is allowed
to ramify. Apply this statement to `X = J ×_{Ā_g} Spec(R)`, once a generic lift of `ρ`
has been chosen over a finite extension (Deligne–Mumford, Theorem 4.19, p. 103,
for the local existence step).

The proof route spreads `x` over a nonempty open of `Spec(R)` using finite presentation.
At each of the finitely many omitted primes, prove the finite-extension DVR existence
criterion for a proper DM stack, retaining the specified generic isomorphism; unlike a
scheme lift, this can require ramification. Take a common finite normal extension containing
the finitely many extensions obtained in these DVR tests. The integral closures are finite
because `R` is excellent. Spread the resulting local objects to neighborhoods of all the
primes above the omitted set. The diagonal is finite (proper and unramified), so a given
generic isomorphism between two such objects extends uniquely on their normal overlaps;
the cocycle identities follow from their generic restrictions. Effective étale descent then
glues the objects over `O_L`. This target owns the finite-extension existence and arithmetic
gluing steps; the stack, lift-groupoid and descent carriers are those of
SchemeAndStackFoundations §§1.18–1.20.

*Proof route.* Replace `J` by the normalisation of the closure of the graph of `ψ̄` in `J ×_ℤ Ā_g/ℤ`, so
that `ψ̄ : J → Ā_g/ℤ` is proper and R28.1.3 continues to hold. `ρ` extends by the valuative criterion,
`Ā_g/ℤ` being projective. By R28.1.3 (e) there are a finite extension `K'/K` with ring of integers `R'`
and a lift `ρ̃ : Spec(R') → J` with generic point in `U`: a nonempty finite-type
geometric fibre over `ρ_K` has a point over a finite extension, and the integral lifting
target above extends that generic object after a further finite extension. Clearing
denominators on a finite affine étale atlas of the noetherian `J`, and descending the
inclusions of line bundles, gives `e_1 > 0`
with `e_1·L^{⊗r} ⊆ ψ̄^*M ⊆ e_1^{−1}·L^{⊗r}`. After base change to `R'` (R28.1.1) compare `ω_{A/R'}` with `ρ̃^*L`:
`α, β` pull back and extend over `Spec(R')` by R28.1.2 with `α ∘ β = [d]`; `ρ̃^*L` is the saturation of
`α^*(ω_{A/R'})`, and since `β^*α^* = d^g` on `ω_{A/R'}` one gets `d^g·ρ̃^*L ⊆ α^*(ω_{A/R'}) ⊆ ρ̃^*L`. So
`e_g = e_1·d^{gr}` works, `d` the least common multiple of the integers of (c) over the finitely many
components of `U`.

*Needs:* R28.1.1–R28.1.3 (proper DM correspondence and its generic projection);
PELModuli M6.5 (moduli point) and M6.3 (finite level covers by fine smooth algebraic
spaces `A_{g,1,n} → 𝔄_g ⊗ ℤ[1/n]`, `n = 3, 4`);
SchemeAndStackFoundations §§1.18–1.20 (effective descent, finite presentation,
proper-stack and compatible valuative-lift carriers), §§0.20–0.21 (finite normalization over
excellent bases); Mathlib `AlgebraicGeometry.IsProper.eq_valuativeCriterion`
(for the projective scheme `Ā_g/ℤ`), `NumberField.RingOfIntegers`.

**Checks.**
- In residue characteristic `2`, level `3` is invertible (`3 = 1` in `𝔽₂`);
  in characteristic `3`, level `4` is invertible (`4 = 1` in `𝔽₃`). These two opens
  cover every prime; the fine level spaces are algebraic spaces.
- For `X = ℙ¹_R`, the point `[1:2]` extends as that same section with `L = K`.
  For the proper DM stack `B(ℤ/2)` over `ℤ_(2)`, the generic torsor `ℚ(√2)`
  has discriminant `8` and cannot extend as a finite étale torsor before extension.
  Over `ℚ(√2)` it becomes the trivial two-sheeted torsor and extends, showing why
  a finite ramified extension is permitted.
- For `X = 𝔾_m` over `ℤ_(2)`, the generic point `2` has valuation `1`, and valuation
  `e > 0` after any finite extension; it never becomes a unit. Properness cannot be dropped.
- `e_g` depends only on `g` (through `J`, `r` and `M`), not on `K`, `A` or the class number of `K`; this is
  what Satz 1 uses.
- Without the boundary control of R28.1.3 the isomorphism holds only over `K`, and nothing is bounded at
  the finite places.
- For an elliptic curve over `ℚ` with multiplicative reduction, `A/ℤ` is the identity component of the
  Néron model and `ρ` meets the boundary of `Ā_1/ℤ`; the inclusions hold there as well.
- The inclusions give `|deg(ρ^*M) − r·deg(ω_{A/R})| ≤ [K : ℚ]·log e_g` when the archimedean metrics agree.

### R28.1.5 Faltings' degree and the modular height

For a number field `K` with ring of integers `R`, use the metrized degree of `(P, ‖·‖)` as the
alias of the supplied degree of a metrized line bundle on `Spec(R)` (Conventions): `deg(P, ‖·‖) = log #(P/R·p) − Σ_{v|∞} ε_v log ‖p‖_v` for any nonzero
`p ∈ P`, and for a semiabelian `p : A → Spec(R)` with proper generic fibre of dimension `g` use the alias
`h(A) = deg(ω_{A/R}, ‖·‖)/[K : ℚ]`, the Hodge line carrying at each infinite place `v` the
metric `‖α‖_v² = 2^{−g} i^{g²} ∫_{A_σ(ℂ)} α ∧ ᾱ` for an embedding `σ` inducing `v` (Faltings 1983, §3,
pp. 353–354). These are adapters to ArakelovGeometryAndAbelianHeights Layers 1–3,
with the following supplied identities in this notation:

- The degree does not depend on the choice of `p`;
- `deg(P ⊗_R R') = [K' : K]·deg(P)` for `K'/K` finite with ring of integers
  `R'`;
- `h(A_{R'}) = h(A)`;
- By R28.1.2, `h(A)` depends only on the abelian variety `A_K`; write `h(A_K)`.

Faltings prints the archimedean factor as `(i/2)^g` and integrates over `A(K_v)`; the corrected factor
is that of the Conventions, and at a real place the integral is over `A_σ(ℂ)`. This degree is the
arithmetic degree of ArakelovGeometryAndAbelianHeights §§1.3–1.6, 1.12–1.14 in Faltings' normalisation (weight `2`
at a complex place is the sum over its two conjugate embeddings), and `h` is the height of its §§3.1–3.4 for a
semiabelian model.

*Proof route.* Replacing `p` by `xp` with `x ∈ K^×` adds `log|N_{K/ℚ}(x)|` to `log #(P/R·p)` and
`Σ_v ε_v log|x|_v = log|N_{K/ℚ}(x)|` to the archimedean sum (product formula). For `K'/K`,
`ω_{A_{R'}/R'} = ω_{A/R} ⊗_R R'` (R28.1.1), the index multiplies by the norm and each infinite place of
`K` splits into places of `K'` whose weights sum to `[K' : K]·ε_v`, the metrics corresponding.

*Needs:* R28.1.1, R28.1.2; ArakelovGeometryAndAbelianHeights Layers 1–3; Mathlib
`NumberField.InfinitePlace`, `NumberField.InfinitePlace.mult`, `NumberField.prod_abs_eq_one`,
`NumberField.RingOfIntegers`, `FractionalIdeal.absNorm`.

For a nonzero fractional ideal `I` of `R` with positive archimedean scalars `c = (c_v)` (norm `‖x‖_v = c_v·|x|_v`), the
degree is `−log N(I) − Σ_v ε_v log c_v`. Computing with any nonzero `p ∈ I` gives
this value, and rescaling every archimedean norm by `t > 0` lowers it by `[K : ℚ]·log t`.
This is ArakelovGeometryAndAbelianHeights §1.3
`HermitianBundle.arakelovDegree_ofFractionalIdeal` at `λ_v = −log c_v`.
The section and rescaling identities are the fractional-ideal cases of
`HermitianBundle.arakelovDegree_eq_infinitePlace` and `HermitianBundle.arakelovDegree_rescale`,
with rescaling parameter `−log t`.

**Checks.**
- For an elliptic curve `E/ℚ` with semistable reduction everywhere and Néron differential `ω_E`,
  `h(E) = −½·log((i/2) ∫_{E(ℂ)} ω_E ∧ ω̄_E)`: minus half the logarithm of the covolume of the period
  lattice of `ω_E`.
- Independence of the metrized degree from its section on `P = R` with the trivial metric: for `p = 1` the degree is `0`, and for
  `p = x ∈ R∖{0}` it is `log|N(x)| − log|N(x)| = 0`.
- Over `ℚ` with `I = (1/2)ℤ` and `c = 1`, `N(I) = 1/2` and the degree is
  `log 2`. With section `p = 1/2`, the index is `1` and `−log|p| = log 2`, agreeing with the formula.
- On the unit ideal with constant norm factor `t > 0`, the degree is
  `−[K : ℚ]·log t`; over `ℚ` with `t = 2` it is `−log 2`. A plus sign fails this test.
- The zero fractional ideal is not an invertible line bundle and has no
  nonzero section. The light formula is total there, but the geometric interpretation excludes it.
- With weight `1` instead of `2` at complex places the degree depends on `p` (take `K = ℚ(i)`,
  `P = R`, `p = 2`: the index is `4` but the archimedean sum would be `log 2`), and `h` is not invariant
  under field extension; a definition with those weights fails both statements.
- For `g = 2` the printed `(i/2)^g ∫ α ∧ ᾱ` is negative, so `log ‖α‖_v` would be undefined.

### R28.1.6 Metrics with logarithmic singularities

Use ArakelovGeometryAndAbelianHeights §5.1 `HermitianMetric.HasLogSingularities`
(Faltings 1983, §3, Definition, p. 355; Faltings–Chai V Definition 4.2 and Remark 4.3,
p. 167). It is a local predicate on the metric of a fixed line-bundle extension `M` on a
complex analytic variety `X`, along a closed analytic `Y` with dense complement.
For a local frame `h` and generators `f_i` of the boundary ideal it bounds both `‖h‖`
and its inverse by `C(1 + |log max_i |f_i||)^n` near `Y`, with `C > 0`, `n ≥ 0`.
On compact `X` finitely many charts give uniform constants. The supplied predicate,
continuous-metric, tensor, dual and modification comparisons are used directly; there is
no additional definition by resolution here. The line extension across `Y` is fixed throughout.

*Needs:* ArakelovGeometryAndAbelianHeights §5.1, including
`HermitianMetric.hasLogSingularities_of_continuous`,
`HermitianMetric.hasLogSingularities_tensor` and
`HermitianMetric.hasLogSingularities_of_modification`.

**Checks.**
- On `X = ℙ^1(ℂ)`, `Y = {0}`, `M = O`, the metric with `‖1‖(t) = |log|t||`
  for `0 < |t| ≤ 1/2` (glued to a constant metric away from `0`) has logarithmic singularities
  with `C = n = 1` throughout this punctured interval: writing `s = −log|t| ≥ log 2`,
  both `s` and `1/s` are at most `1 + s`, since `(log 2)(1 + log 2) > 1`.
  After gluing away from zero enlarge `C` if necessary.
- On the same data the metric with `‖1‖(t) = |t|^{−1/2}` near `0`
  does not, since `|t|^{−1/2}` is not bounded by `C(1 + |log|t||)^n` as `t → 0`; a definition allowing
  polynomial growth in `1/|f|` accepts it.
- For `Y = ∅` every continuous hermitian metric qualifies.
- For the universal elliptic curve near the cusp `q = 0`, with `ω`
  generated by `du/u = 2πi·dz` on the Tate curve, `‖du/u‖² = 4π²·Im τ = −2π·log|q|`, so the Hodge metric
  has growth exponent `1/2` along `q = 0`, hence satisfies the predicate with integer exponent `1`.

### R28.1.7 The Hodge metric has logarithmic singularities along the boundary

Use the alias logarithmic growth of the Hodge metric of ArakelovGeometryAndAbelianHeights §5.3
(Faltings 1983, §3, p. 355; Faltings–Chai V Proposition 4.5, pp. 168–169): for a smooth
complex variety `X`, a normal-crossings divisor `Y` and a semiabelian scheme `A → X`
which is abelian and principally polarized over `X − Y`, the supplied Hodge metric on the
fixed extension `ω_{A/X}` has logarithmic singularities along `Y`. The base need not be proper;
the local predicate of R28.1.6 applies. Use logarithmic growth of the modular metric as the
specialization of its §5.4 `SiegelModuli.modularMetric_logSing` to the Hodge-metrized ample
power `M` on the minimal compactification. The smooth toroidal cover supplies the local charts;
the minimal compactification itself need not be smooth or have a normal-crossings boundary.

*Needs:* ArakelovGeometryAndAbelianHeights §§5.1, 5.3–5.4; R28.1.3, R28.1.6.

**Checks.**
- The singularity is at most a power of `|log|t||`, never a power of `|t|`; this is exactly what Lemma 3
  (R28.1.8) tolerates.
- Elliptic case `g = 1`: for `ℂ/(ℤ + τℤ)` and `q = e^{2πiτ}`, `‖dz‖² = Im τ = −log|q|/(2π)`, so the Hodge norm
  of the invariant differential `du/u = 2πi·dz` of the Tate curve grows like `|log|q||^{1/2}`.
- The metric extends continuously over the good-reduction locus, so the singularity is concentrated
  along `Y`.

### R28.1.8 Northcott for metrics with logarithmic singularities

Use Northcott finiteness for logarithmically singular metrics, the fixed-field specialization of
ArakelovGeometryAndAbelianHeights §5.2 (Faltings 1983, §3, Lemma 3, p. 356): let `X ⊆ ℙ^n_ℤ` be Zariski closed,
`Y ⊆ X` closed, and `‖·‖` a hermitian metric on `O(1)|(X(ℂ) − Y(ℂ))`, invariant under complex
conjugation, with logarithmic singularities along `Y(ℂ)`. For a number field `K` with ring of integers `R`
and `x ∈ X(K) − Y(K)`, let `ρ_x : Spec(R) → X` extend `x` and put `h(x) = deg(ρ_x^*O(1), ‖·‖)/[K : ℚ]`, the
finite places using the integral structure of `O(1)` and each infinite place the metric at the
corresponding point of `X(ℂ) − Y(ℂ)`. Then for every `c` only finitely many `x ∈ X(K) − Y(K)` have
`h(x) ≤ c`. The statement is for `K`-rational points of a fixed number field.

*Proof route.* To apply the proper flat supplier, replace `X` by the schematic closure of
`X_ℚ − Y_ℚ` in `X`. Its structure sheaf is torsion-free over `ℤ`, hence flat; it contains
every point under consideration and its integral extension, and `O(1)` stays ample.
The empty open locus gives the empty set of points. Choose a continuous hermitian metric `‖·‖_1` on `O(1)` over `X(ℂ)`, with normalized height `h_1`; then
`h_1(x) = Projectivization.logHeight(x) / [K : ℚ] + O(1)` on `X(K)` by the supplied
sup-metric degree formula and bounded change of continuous metric. Choose
`s > 0` and integral sections `f_1, …, f_t ∈ Γ(X/ℤ, O(s))` with common zero set exactly `Y`.
Rescale the continuous metric by one positive constant so that `‖f_i‖_1 ≤ e^{−1}` on `X(ℂ)`;
this changes `h_1` by a constant and preserves the integral sections. Put
`F(z) = max_i ‖f_i(z)‖_1`. Outside `Y(ℂ)`, `0 < F(z) ≤ exp(−1)`.
The supplied logarithmic-distance comparison (ArakelovGeometryAndAbelianHeights §§5.1–5.2)
therefore gives uniform `c_1, c_2 ≥ 0` with
`|log(‖·‖/‖·‖_1)(z)| ≤ c_1 + c_2·log(−log F(z))`.
All logarithms in this formula have positive arguments. For each `i` with
`f_i(z) ≠ 0`, monotonicity gives
`log(−log F(z)) ≤ log(−log ‖f_i(z)‖_1)`; no logarithm of a zero evaluation is used.
Faltings prints the left side as `log|(‖·‖/‖·‖_1)(z)|` and does not normalise the `f_i`.
For `x ∈ X(K) − Y(K)` choose `i` with `ρ_x^*(f_i) ≠ 0`; its evaluation is nonzero at every
infinite place, so the same index can be used throughout. Then
`s·[K : ℚ]·h_1(x) ≥ −Σ_v ε_v log ‖f_i(x_v)‖_1 ≥ ε_v·|log ‖f_i(x_v)‖_1|` for each infinite `v`, and summing the
estimate over the infinite places gives `|h(x) − h_1(x)| ≤ c_3 + c_4·log h_1(x)` for `h_1(x) ≥ 1`. So `h(x) ≤ c`
bounds `h_1(x)` and, since `K` is fixed, the relative `Projectivization.logHeight(x)`.
Northcott on `ℙ^n(K)` (normalise a coordinate to `1`
and bound each coordinate's height) leaves finitely many `x`.

*Needs:* R28.1.6; ArakelovGeometryAndAbelianHeights §§5.1–5.2, 1.3–1.6, 1.12–1.14 (comparison of the degree of `ρ_x^*O(1)` with a
continuous metric and the projective height); HeightsAndUnits §1.1 (projective Northcott);
DiophantineApproximationAndTranscendence §§0.2–0.3 (absolute normalization and bounded-degree Northcott); Mathlib `Projectivization.logHeight`,
`Projectivization.mulHeight`, `NumberField.finite_setOfPred_mulHeight₁_le`, `Height.mulHeight_comp_le`,
`Height.mulHeight₁_div_eq_mulHeight`.

**Checks.**
- On `X = ℙ¹_ℤ`, `Y = ∅`, `K = ℚ(i)` and `x_N = (N : 1)` for positive integers `N`, the
  Fubini–Study metric gives `h_1(x_N) = ½ log(N² + 1)`, while
  `Projectivization.logHeight(x_N) = 2 log N`: the coordinate ideal is the unit ideal and
  the complex place has multiplicity two. Thus
  `h_1(x_N) − Projectivization.logHeight(x_N)/2 = ½ log(1 + N⁻²)` is bounded, whereas
  `h_1(x_N) − Projectivization.logHeight(x_N) → −∞`.
- The common zero locus of the `f_i` must be exactly `Y`; a larger zero locus destroys the comparison.
- On `ℙ¹(ℂ)` with `M = O(1)`, let `f_1` vanish at `0` and `f_2 = 0`.
  For a metric ratio `|log|t||` near `0`, the left side grows like `log|log|t||`.
  Here `F(t) = ‖f_1(t)‖_1` and the corrected bound permits this growth. A minimum
  over all sections with Mathlib's real logarithm fails: `Real.log |Real.log 0| = 0`
  makes the zero section force that minimum to be at most zero.
- The estimate is only `|h − h_1| ≤ c_3 + c_4 log h_1`, not a constant bound, and the conclusion
  follows all the same.
- On `X = ℙ^1_ℤ`, `Y = {t = 0}`, a metric `‖·‖ = ‖·‖_1·|t|^{−1}` near `t = 0` (a pole of order one) gives
  `h(x_N) = h_1(x_N) − log N = O(1)` for `x_N = (N : 1)` with `t(x_N) = 1/N`, so infinitely many points have
  bounded height: the logarithmic rate is used.

### R28.1.9 Hermite–Minkowski with prescribed ramification

Use the fixed-degree Hermite–Minkowski statement, the fixed-degree specialization of ArithmeticGaloisDuality
R02.3.1 `RestrictedRamification.finite_unramifiedOutside_of_finrank_le`
(Faltings 1983, §3, Lemma 4, p. 357; Milne, *Abelian varieties*, IV
Theorem 3.1, p. 139): for a number field `K`, a finite set `S` of places of `K` and an integer `n`, there are
only finitely many extensions `K' ⊆ K̄` of `K` of degree `n` unramified outside `S`. The places of `S` may be
wildly ramified; ramification at infinite places does not affect the count.

*Adapter.* Take the subset of the supplier's degree-at-most-`n` set where the degree
equals `n`; for `n ≤ 0` the set is empty. In characteristic zero the separable closure
and the chosen algebraic closure are isomorphic over `K`. Transport intermediate fields
along this isomorphism, preserving degrees and ramification. No quotient by abstract
field isomorphism replaces the count of embedded subfields.

The library realization of the generic input is
`TauCeti.NumberField.finite_of_finrank_le_of_ramifiedSupport_subset` in
`TauCeti.NumberTheory.NumberField.Discriminant.RamifiedSupport.Hermite`, at Tau Ceti
revision `4e9057a126044e69f54ed3b475fd1386de3b14cf`. It counts finite-dimensional
intermediate fields in any fixed ambient field containing `K`, with degree at most `n`
and ramified support contained in the finite places of `S`. This module is absent at
the pinned revision `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The supplier contract uses that declaration and its ramification-support comparison:
unramified at each finite place outside `S` is equivalent to ramified support lying
in the finite places of `S`. At the pin, the same input is built under
ArithmeticGaloisDuality R02.3.1 with this library interface; when importing the existing
module, use a dependency revision containing `4e9057a126044e69f54ed3b475fd1386de3b14cf`.
The local-different and discriminant argument belongs to that generic input.

*Needs:* ArithmeticGaloisDuality R02.3.1
`RestrictedRamification.finite_unramifiedOutside_of_finrank_le`;
TauCetiRoadmap NumberFieldArithmetic Layer 4.3 (`ramifiedSupport` and its membership criterion).

**Checks.**
- For `K = ℚ`, `S = {2, ∞}` and degree exactly `2`, the embedded fields are
  `ℚ(i)`, `ℚ(√2)` and `ℚ(√−2)`. The supplier's degree-at-most-`2` set also contains `ℚ`;
  the fixed-degree adapter removes it. The two embeddings of each quadratic field have
  the same image subfield and do not count twice.
- The discriminant bound depends on the wild part of `S`: the tame value `e − 1` alone does not bound
  the different at places above the residue characteristic; `ℚ(√2)/ℚ` at `2` has `v_𝔓(𝔇) = 3 = e − 1 + v_𝔓(e)`.
- Unramified `e = 1` gives different exponent `0`, so the wild lower bound `e ≤ v_𝔓(𝔇)`
  cannot be used without its wild hypothesis.
- The uses in this roadmap: the descent of R28.1.10 (`K'` containing the 3-division points of all
  members of a geometric class), the uniform extension of R28.1.13 (`K'` containing `K(B[12d])`), the test
  set of R28.5.2, and the Parshin application below.
- Mathlib's `NumberField.hermiteTheorem.finite_of_discr_bdd_of_isReal` counts only fields with a real
  place and is not enough.

### R28.1.10 Descent from geometric to rational isomorphism classes

Prove finiteness of semistable rational forms (Faltings 1983, §3, proof of Satz 1, p. 357): for a number field `K` with
ring of integers `R` and a principally polarized abelian variety `(A_0, λ_0)` over `K`, only finitely many
`K`-isomorphism classes of principally polarized `(A, λ)` over `K` have a semiabelian model over `R` and
satisfy `(A, λ) ⊗ K̄ ≅ (A_0, λ_0) ⊗ K̄`. Without the semiabelian hypothesis the statement is false.

*Proof route.* For a semistable `A`, good reduction at `v` is equivalent to potentially good reduction at
`v` (the toric rank of the semiabelian model is unchanged under finite base change), which depends only
on `A ⊗ K̄`; so all members have good reduction outside one finite set `S`. For each member `K(A[3])` is
Galois over `K` of degree at most `#GL_{2g}(𝔽_3)` and unramified outside `S ∪ {v | 3}`
(Néron–Ogg–Shafarevich), so by R28.1.9 finitely many such fields occur; let `K'` be the Galois closure of
their compositum. If `f : (A, λ)_{K̄} → (B, μ)_{K̄}` is an isomorphism of members, for `σ ∈ Gal(K̄/K')` the
automorphism `f^{−1} ∘ σ(f)` of `(A, λ)_{K̄}` is trivial on `A[3]`, hence the identity by Serre's rigidity, so
`f` is defined over `K'`. The members are then `K`-forms of one `(A, λ)` split by `K'`, classified by
`H^1(Gal(K'/K), Aut_{K'}(A, λ))`, which is finite.

*Needs:* R28.1.9; NeronModelsAndSemistableAbelianVarieties §3.1 `SemistableReduction` (`toric_zero`),
§3.3 `SemistableIdentityBasechange` and §5.1 `NeronOggShafarevich`; AbelianSchemesAndArithmeticModuli
A6.18 `polarizedAutomorphisms` (finiteness of `Aut(A, λ)` and level-3 rigidity; also PELModuli M2.1
`rigidity`); PELModuli M6.7 `descentObstruction`.

**Checks.**
- `g = 1`: the members of a geometric class are twists of one elliptic curve; a quadratic twist by a
  character ramified at a place of good or multiplicative reduction has additive reduction there, so
  semistability everywhere leaves finitely many twists.
- Level 2 does not rigidify: `−1` acts trivially on `A[2]`.
- Without semiabelian models the set is infinite: the quadratic twists of an elliptic curve over `ℚ` by
  all squarefree integers are, for `j(E) ≠ 0, 1728`, pairwise non-isomorphic over `ℚ` and isomorphic over `ℚ̄`.

### R28.1.11 Satz 1: finiteness of bounded modular height

Prove bounded-height finiteness (Faltings 1983, §3, Satz 1, pp. 356–357): fix `g`, a number field `K`
with ring of integers `R`, and `c`. Then there are only finitely many isomorphism classes of pairs
consisting of a semiabelian `p : A → Spec(R)` of relative dimension `g` with proper generic fibre and a
principal polarization of `A_K`, with `h(A) ≤ c`. By R28.1.2 an isomorphism of pairs is the same as a
`K`-isomorphism of the principally polarized generic fibres.

*Proof route.* For `g = 0` the only pair is the zero variety, of height `0`, so the conclusion is
immediate (empty if `c < 0`). For `g > 0`, let `x ∈ A_g(K)` be the moduli point of `(A_K, λ)` and `ρ : Spec(R) → Ā_g/ℤ` its extension;
metrize `M` on `A_g(ℂ)` through `M ≅ ω^{⊗r}` by the Hodge metric and put `h(x) = deg(ρ^*M, ‖·‖)/[K : ℚ]`. The
archimedean metrics of `ρ^*M` and `ω_{A/R}^{⊗r}` agree, and R28.1.4 bounds the finite places, so
`|h(x) − r·h(A)| ≤ log e_g`. By R28.1.7 the metric has logarithmic singularities along
`Ā_g(ℂ) − A_g(ℂ)` (with `Φ = φ`), and R28.1.8 with `X = Ā_g/ℤ ⊆ ℙ^N_ℤ` and `Y` the closure of
`Ā_g/ℚ − A_g/ℚ` leaves finitely many `x` with `h(x) ≤ r·c + log e_g`. Each `x` is one `K̄`-isomorphism class
of principally polarized abelian varieties, and R28.1.10 leaves finitely many `K`-isomorphism classes
with semiabelian models in it.

*Needs:* R28.1.2, R28.1.4, R28.1.5, R28.1.7, R28.1.8, R28.1.10; PELModuli M6.5 `coarseModuli` and M6.10
`moduliPoint`; ArakelovGeometryAndAbelianHeights §5.0b `SiegelModuli.MinimalCompactification` and `SiegelModuli.minimalHodgePower`.

**Checks.**
- The statement is for pairs (model, principal polarization); the polarization degree is fixed to `1`
  here, and R28.1.13 transfers to other degrees.
- The descent step needs level `n ≥ 3` and the finiteness of `Aut(A, λ)`.
- The bad places are the same for all members of one `K̄`-class, which is what makes Lemma 4 apply with
  one `S`; quadratic twists by ramified characters have additive reduction and are excluded.
- The comparison constant is `log e_g` with `e_g` the constant of R28.1.4.

### R28.1.12 Descent of polarizations along isotropic subgroups

For an abelian variety `A` over a field `k` of characteristic `0` and a polarization `λ` of `A` (Conventions),
let `e^λ` be the pairing on the finite group scheme `ker λ`. Prove:

- `e^λ` is alternating and nondegenerate, so `deg λ = #ker λ` is a square and a
  maximal isotropic subgroup of `ker λ` has order `√(deg λ)`;
- Polarization descent (Milne, *Abelian varieties*, I Proposition 13.8 and Remark 13.9, p. 60; Mumford,
  *Abelian varieties*, §23): for an isogeny `π : A → B` over `k`, there is a polarization `μ` of `B` with
  `λ = π^∨ ∘ μ ∘ π` if and only if `ker π ⊆ ker λ` and `e^λ` is trivial on `ker π × ker π`; `μ` is then unique and
  `deg λ = deg μ·(deg π)²`. In particular, for `H ⊆ ker λ` maximal isotropic and `π : A → A/H`, `μ` is principal.
- `e^μ_l(πx, πy) = e^λ_l(x, y)` for `x, y ∈ T_l(A)` (Milne, I Proposition 13.2(b),
  p. 58).
- For polarizations `λ` of `A` and `μ` of `B`, `λ × μ` is a polarization of `A × B` of degree
  `deg λ·deg μ`, whose Weil pairing on `T_l(A × B) = T_l(A) ⊕ T_l(B)` is the orthogonal sum.

*Proof route.* Over `k̄` choose an ample `L` with `λ = φ_L`; the pairing on `ker λ = K(L)` is the commutator
pairing of the theta group, perfect and alternating. If `ker π ⊆ ker λ` is isotropic it is a level subgroup
after a finite extension, `L` descends along `π` to an ample `M` with `π^*M ≅ L` up to the choice of level
structure, and `μ = φ_M` satisfies `λ = π^∨ ∘ μ ∘ π`; the class `μ` does not depend on the choices because
`π^∨ ∘ (·) ∘ π` is injective on `Hom(B, B^∨)` (`π` is an epimorphism and `π^∨` has finite kernel). Uniqueness makes `μ`
Galois-invariant, hence defined over `k`. Degrees multiply along `λ = π^∨ ∘ μ ∘ π`, and `deg π^∨ = deg π`. The product
statement is the definition of the product polarization through `(A × B)^∨ = A^∨ × B^∨`.

*Needs:* AbelianSchemesAndArithmeticModuli A2.2 `AbelianScheme.dual` (with `dual_prod`), A2.5 `Polarization`
(`Polarization.degree`), A3.3 `AbelianQuotient`, A3.6 `ThetaGroup` (`ThetaGroup.commutator`,
`ThetaGroup.descend`), A3.7 `polarizedWeilPairing`, A6.13 `polarizedIsogenyDegree`; ArithmeticGaloisRepresentations
§6.2 the product comparison of the arithmetic Weil-pairing adapter.

**Checks.**
- On an elliptic curve with `λ = n·λ_E` (degree `n²`, kernel `E[n]`, pairing the Weil pairing `e_n`), a cyclic
  `H ⊆ E[n]` of order `n` is maximal isotropic, `E → E/H` has degree `n`, and `n·λ_E = π^∨ ∘ μ ∘ π` with `μ`
  principal.
- Over `ℚ`, the curve `E : y² = x³ − x + 1` has no Galois-stable line in `E[2]`,
  since `X³ − X + 1` is irreducible. For `λ = 2λ_E`, the zero subgroup is maximal
  among rational isotropic subgroups but has order `1`, not `2`; it is not geometrically
  Lagrangian. A finite extension makes the required order-two subgroup rational.
- The whole kernel is not isotropic: for `n > 1` and `H = E[n]`, `E/E[n] ≅ E` via `[n]`, and
  `n·λ_E = [n]^∨ ∘ μ ∘ [n] = n²·μ` has no solution, `λ_E/n` not being a homomorphism; a statement allowing
  non-isotropic `H` fails here.
- Degenerate case: `λ` principal, `H = 0`, `π = id`, `μ = λ`.
- `deg(λ × μ) = deg λ·deg μ`: the product of two principal polarizations is principal, and `λ^k` has degree
  `(deg λ)^k`.

### R28.1.13 The polarization reduction over a uniform extension

Prove uniform principal reduction (Faltings 1983, §5, proof of Korollar 3, p. 362, and §6, proof of
Satz 6, p. 363, where it is used without a separate statement): let `K` be a number field, `S` a finite
set of finite places and `g, d ≥ 1`. There is a finite Galois extension `K'/K`, depending only on
`K, S, g, d`, such that

- (i) for every abelian variety `B/K` of dimension `g` with good reduction outside `S` and every
  polarization `μ` of `B` of degree `d` (a square, Conventions): `B_{K'}` has semistable reduction everywhere, `ker μ` is constant
  over `K'`, and for every subgroup `H ⊆ ker μ` maximal isotropic for `e^μ` the quotient
  `π : B_{K'} → B' = B_{K'}/H` is an isogeny of degree `√d` onto a principally polarized `(B', μ')` with
  `π^*μ' = μ_{K'}`, again semistable everywhere with good reduction outside the places above `S`;
- (ii) if, for a set `𝒮` of `K`-isomorphism classes of such pairs `(B, μ)`, the `(B', μ')` of (i) lie in
  finitely many `K'`-isomorphism classes, then `𝒮` is finite.

No height bound is assumed; heights enter when (ii) is combined with Satz 1. Zarhin's trick is not
needed here, because `S` is fixed and Lemma 4 makes `K'` uniform.

*Proof route.* `K(B[12d])` is Galois over `K` of degree at most `#GL_{2g}(ℤ/12d)` and unramified outside
`S ∪ {v | 12d}`, so by R28.1.9 finitely many such fields occur; `K'` is the Galois closure of their
compositum. Over `K'`, `B` is semistable everywhere by Grothendieck's criterion (level `3` at places
prime to `3`, level `4` at places prime to `2`), and `ker μ ⊆ B[d]` is constant. A maximal isotropic `H`
has order `√d`, and `μ` descends to a principal `μ'` on `B_{K'}/H` (R28.1.12); good and semistable reduction
pass to the isogenous `B'`. Conversely `B_{K'} ≅ B'/π(B[d])` with `π(B[d])` a `K'`-rational subgroup of
`B'[d]`, of which there are finitely many, and `μ_{K'} = π^*μ'`; so each `(B', μ')` gives finitely many
`(B, μ)_{K'}`, and each `(B, μ)` is a `K`-form split by `K'` of one of them, classified by the finite set
`H^1(Gal(K'/K), Aut_{K'}(B, μ))`.

*Needs:* R28.1.9, R28.1.12; NeronModelsAndSemistableAbelianVarieties §3.12 `FiniteTorsionSemistability`,
§3.2 `SemistabilityIsogeny`, §5.1 `NeronOggShafarevich`, §5.2 `GoodIsogeny`;
AbelianSchemesAndArithmeticModuli A3.3 `AbelianQuotient`, A6.18 `polarizedAutomorphisms`; PELModuli
M6.7 `descentObstruction`.

**Checks.**
- For `d = 1`, only the polarization quotient is trivial: `H = 0` and `B' = B_{K'}`.
  Uniform semistable reduction and the finiteness of `K'`-split forms in (ii) still need proof.
- For an elliptic curve (`g = 1`) every polarization is `m·λ_0`, of degree `m²` with kernel `B[m]`; a maximal
  isotropic `H` has order `m`; for `m = p²` one choice is `B[p]` (isotropic because `e_{p²}(x, py') = e_{p²}(px, y') = 1`
  for `x ∈ B[p]`), giving `B' ≅ B`.
- Without a fixed `S` the Hermite–Minkowski step for `K(B[12d])` has no common ramification bound, and
  no uniform `K'` exists, already for `d = 1`: if `E/K` has good reduction at `𝔭 ∤ 2` and `v_𝔭(a) = 1`,
  the twist `E^{(a)}` has additive reduction at `𝔭`, inertia acting on `T_l` (`𝔭 ∤ l`) through the
  character of `K(√a)/K`, which takes the value `−1`; so `E^{(a)}_{K'}` is semistable above `𝔭` only if
  `𝔭` ramifies in `K'`, which fails for almost all `𝔭`. This is why Satz 1 is stated for principal
  polarizations only.

### Examples

- For an elliptic curve `E/ℚ` with semistable reduction, `h(E)` is minus half the log of the covolume of
  the Néron period lattice (R28.1.5); R28.1.4 and R28.1.8 compare `r·h(E)` with the height of the moduli
  point `j(E)` on `Ā_1`, up to `log e_g` at the finite places and the logarithmic error terms of R28.1.8 at
  the infinite places.
- The comparison constant `e_g` and the field `K'` of R28.1.13 are ineffective as constructed; nothing in
  this layer gives an explicit value.

### Dependencies

Mathlib (schemes, valuative criterion, normalisation, Zariski's main theorem in the form "proper and
locally quasi-finite is finite", number fields, heights, the different and discriminants); Tau Ceti
(`AbelianVariety`); TauCetiRoadmap NumberFieldArithmetic (Layer 6.4) and LocalFieldsRamification
(Layer 3); SchemeAndStackFoundations §§2.20, 3.8, 4.15, 4.17; AlgebraicVectorBundles Layers L0B–L0C; JacobianChallengePartII §§6.1–6.3; AlgebraicModuliForArithmeticGeometry §5.4;
ComplexComparisonPartII C0.3–C0.4; AbelianSchemesAndArithmeticModuli A1, A3, A6;
NeronModelsAndSemistableAbelianVarieties Layers 3–5; HeightsAndUnits §1.1;
PELModuli M2, M6; ShimuraVarieties Layers 2 and 8; ArakelovGeometryAndAbelianHeights §§2.0, 5.0a–5.0b;
ArakelovGeometryAndAbelianHeights Layers 1–3 and §§5.1–5.4. R28.1.12 concerns abelian
varieties over a field with no dependence on heights.

## Layer R28.2: Heights under isogeny and the determinant identity

This layer is Section 4 of Faltings 1983 up to the height formula on p. 359. It computes the change of
the modular height along an isogeny (Lemma 5), bounds the primes in the resulting rational number,
and proves the determinant identity `Σ_i m_i d_i = mh/2` for an `l`-divisible subgroup of a semistable
abelian variety. The identity combines three local and global inputs: the triviality of inertia on
the quotient of `T_l(A)` by the Tate module of the formal part (Lemma 6), Tate's Hodge–Tate
decomposition at the places above `l`, and Weil's bound at almost all other primes, glued together
through induction to `Gal(ℚ̄/ℚ)` and the description of `l`-adic characters of that group. Layer R28.3
applies the identity after the shift of the erratum.

Throughout, `K` is a number field of degree `m`, `R = O_K`, `A/R` is semiabelian of relative dimension
`g` with proper generic fibre, `l` is a prime, and `v_1, …, v_r` are the places above `l`.

### R28.2.1 Lemma 5: the isogeny height formula

Use the alias the isogeny height formula of ArakelovGeometryAndAbelianHeights §§4.1–4.2
(Faltings 1983, §4, pp. 357–358, Lemma 5): let `A_1, A_2` be semiabelian over
`Spec(R)` of relative dimension `g` with proper generic fibres, `s` the zero section of `A_1`, and
`φ : A_1 → A_2` an isogeny (by R28.1.2 it suffices to give `φ` on generic fibres). Then `φ` is flat,
`G = ker φ` is a quasi-finite flat commutative group scheme over `R` (in general not finite),
`φ^* : ω_{A_2/R} → ω_{A_1/R}` is injective with `#(ω_{A_1/R}/φ^*ω_{A_2/R}) = #s^*(Ω^1_{A_1/A_2}) = #s^*(Ω^1_{G/R})`,
and
`h(A_2) = h(A_1) + ½·log deg(φ) − (1/m)·log #s^*(Ω^1_{G/R})`,
where `deg φ` is the degree of `φ_K`.

*Proof route.* Extend `φ` and a quasi-inverse `ψ : A_2 → A_1` with `ψ ∘ φ = [deg φ]` on generic fibres over
`Spec(R)` (R28.1.2); `ψ ∘ φ = [deg φ]` then holds over `R` because both sides agree on the schematically
dense generic fibre and `A_1` is separated. The integral half of the formula — flatness of `φ`,
quasi-finite flatness of `G = A_1 ×_{A_2} Spec(R)`, injectivity of `φ^*` on invariant differentials and
the identification of its cokernel with `s^*(Ω^1_{A_1/A_2}) = s^*(Ω^1_{G/R})` (base change of `Ω^1_{A_1/A_2}`
along the zero section of `A_2`) — is the isogeny variation of ArakelovGeometryAndAbelianHeights §§4.1–4.4. At
each infinite place `φ(ℂ)` is a finite map of degree `deg φ`, so pulling back a top form multiplies
`∫ α ∧ ᾱ` by `deg φ` and `‖φ^*α‖_v = (deg φ)^{1/2}·‖α‖_v`. Compute `deg(ω_{A_1/R})` with the section `φ^*t` for a
nonzero `t ∈ ω_{A_2/R}`: `log #(ω_{A_1}/R·φ^*t) = log #(ω_{A_1}/φ^*ω_{A_2}) + log #(ω_{A_2}/R·t)` and
`Σ_v ε_v log ‖φ^*t‖_v = Σ_v ε_v log ‖t‖_v + (m/2)·log deg φ`, since `Σ_v ε_v = m`; divide by `m`.

*Needs:* R28.1.1, R28.1.2, R28.1.5; ArakelovGeometryAndAbelianHeights §§4.1–4.4;
AbelianSchemesAndArithmeticModuli A6.1 `Hom.deg` and A3.3 `AbelianQuotient` (the quasi-inverse, `deg φ`
killing `ker φ`); NeronModelsAndSemistableAbelianVarieties §6.4 `IsogenyDifferentialExport` (the
same inclusion of differential lattices for Néron models); Tau Ceti `AbelianVariety.IsIsogeny`; Mathlib
`IsDedekindDomain.HeightOneSpectrum`.

**Checks.**
- Multiplication by a nonzero integer `n`: `deg[n] = |n|^{2g}`, `G = A[n]`, and
  `#s^*(Ω^1_{A[n]/R}) = #(R/nR)^g = |n|^{gm}`, so the formula reads
  `h(A) = h(A) + g·log|n| − g·log|n|`. For `g > 0`, `[0]` is not an isogeny.
- At a prime `𝔭` of `R` not dividing `deg φ`, `G` is étale over `R_𝔭` and contributes nothing: the finite term
  is supported on the primes dividing `deg φ`.
- Sign: with the metric of R28.1.5 the norm of `φ^*t` is `(deg φ)^{1/2}‖t‖`; the opposite sign violates the
  multiplication-by-`n` check.

### R28.2.2 The primes in the height quotient

Use the isogeny valuation bounds, a consequence of the stronger valuation bounds of
ArakelovGeometryAndAbelianHeights §4.4 (Faltings 1983, §4, p. 358, Bemerkung after Lemma 5): in the
situation of R28.2.1, `exp(2m·(h(A_2) − h(A_1))) = deg(φ)^m·(#s^*(Ω^1_{G/R}))^{−2}` is a rational number in
whose numerator and denominator only primes dividing `deg φ` occur, and for every prime `p`,
`−(2g − 1)·m·v_p(deg φ) ≤ v_p(exp(2m·(h(A_2) − h(A_1)))) ≤ m·v_p(deg φ)`.
More generally, if an integer `n` kills `G`, then `n` kills `Ω^1_{G/R}`.

*Proof route.* For a commutative group scheme `G` over `R`, `[n]` induces multiplication by `n` on
`s^*(Ω^1_{G/R})`; if `[n] = 0` on `G` it factors through the zero section, so `n·s^*(Ω^1_{G/R}) = 0`. As `G ⊆ A_1` is
closed, `s^*(Ω^1_{G/R})` is a quotient of the rank-`g` locally free `s^*(Ω^1_{A_1/R})`, and being killed by
`n = deg φ` it is a quotient of `s^*(Ω^1_{A_1/R})/n`, of order `n^{gm}`; so
`0 ≤ v_p(#s^*(Ω^1_{G/R})) ≤ g·m·v_p(deg φ)`, and `0` for `p ∤ deg φ`. Take `v_p` of R28.2.1.

*Needs:* ArakelovGeometryAndAbelianHeights §§4.1–4.4; R28.2.1; AbelianSchemesAndArithmeticModuli A3.3.

**Checks.**
- Korollar 3 (R28.4.8) consumes exactly this: if for every prime `l` some isogeny `A → B` has `l`-part of its
  degree dividing `N`, then numerator and denominator of `exp(2m(h(B) − h(A)))` divide `N^{(2g−1)m}`, so
  `h(B)` is bounded.
- Sharpness in `m`: an isogeny of degree `p` with kernel étale over `R` gives valuation exactly `m`, which
  exceeds `v_p(deg φ) = 1` when `m ≥ 2`, so the bound "at most `v_p(deg φ)`" without the factor `m` is false;
  the dual isogeny (kernel `μ_p`, `s^*Ω^1 = R/pR`) gives `−m`.
- Multiplication by `p` on an elliptic curve: `deg = p²`, `#s^*Ω^1 = p^m`, valuation `0`, within
  `[−2m, 2m]`.

### R28.2.3 Lemma 6: inertia on the quotient by the formal part

Let `v_i | l`, `K_i = K_{v_i}` with valuation ring `R_i` and closed point `s_i`, and let `Â` be the formal
completion of `A_{R_i}` along the whole special fibre. Write the special fibre as an extension
`0 → T_s → A_s → B_s → 0` of an abelian variety by a torus and lift `T_s` to a torus `T` over `R_i`. Then
`Ĥ_i = Â[l^∞]` is the formal completion of an `l`-divisible group `H_i` over `R_i`, `H_i ⊗ K_i` is an
`l`-divisible subgroup of `A[l^∞] ⊗ K_i`, and likewise for `T[l^∞]`, giving lattices
`T_l(T) ⊆ T_l(H_i) ⊆ T_l(A)`. Prove trivial inertia on the Tate quotient (Faltings 1983, §4, pp. 358–359, Lemma 6):
the inertia group `I_i ⊆ D_i = Gal(K̄_i/K_i)` acts trivially on `T_l(A)/T_l(H_i)`, and `D_i/I_i ≅ ℤ̂` acts on it
through a finite quotient.

*Proof route.* A polarization of `A_K` gives an alternating, `D_i`-equivariant, nondegenerate pairing
`T_l(A) × T_l(A) → ℤ_l(1)`. The toric part `T_l(T)` is orthogonal to the fixed part `T_l(H_i)` (Grothendieck's
orthogonality, SGA 7 I, Exposé IX, 7.3–7.4, valid for every prime including the residue characteristic,
transported to the polarization pairing through the isogeny `A → A^∨`). The ranks are `t` and `t + 2b`
(`t = dim T_s`, `b = dim B_s`), so with nondegeneracy and saturation `T_l(H_i) = T_l(T)^⊥`. Hence
`x ↦ ⟨x, ·⟩|_{T_l(T)}` embeds `T_l(A)/T_l(H_i)` `D_i`-equivariantly into `Hom(T_l(T), ℤ_l(1)) ≅ X^*(T) ⊗ ℤ_l`, on
which inertia acts trivially (`T` splits over an unramified extension) and `D_i/I_i` through a finite
quotient.

*Needs:* NeronModelsAndSemistableAbelianVarieties §3.5 `ToricFiniteFiltration` and
`FiniteFlatToricFiltration`, §3.6 `Orthogonality` and `FiniteFlatOrthogonality` (the case `l` equal to
the residue characteristic by inverse limits of the finite flat statement), §3.13
`RaynaudExtensionComparison` (the lift `T` of `T_s` for the identity component of the Néron model, which is
the semiabelian model by R28.1.2), §2.4 `ToricCharacter`; ArithmeticGaloisRepresentations §6.2
the arithmetic Weil-pairing adapter (alternation and cyclotomic equivariance);
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.8 `BarsottiTate.tateModule`
(the Tate module of the local formal part).

**Checks.**
- Good reduction (`T_s = 0`): `T_l(H_i) = T_l(A)`, the quotient is `0` and the statement is empty.
- Tate curve `E_q` over `K_i` (`B_s = 0`, `t = 1`): `T_l(T) = ℤ_l(1) = T_l(H_i)`, and `T_l(E_q)/ℤ_l(1) ≅ ℤ_l` with
  trivial action for split multiplicative reduction and the unramified quadratic character for
  non-split reduction.
- The conclusion concerns the quotient only: at `v_i | l` the submodule `ℤ_l(1)` of the split Tate curve
  carries `χ_0`, whose restriction to inertia has infinite image, so inertia on `T_l(E_q)` itself is
  neither trivial nor unipotent.

### R28.2.4 Invariant differentials of the levels of an `l`-divisible group

Prove the differential count at a divisible-group level (Faltings 1983, §4, p. 359, applying Tate, *p-divisible groups*, §2,
Proposition 2): let `K_i/ℚ_l` be finite of degree `m_i` with valuation ring `R_i`, and `Γ` an `l`-divisible
group over `R_i` whose connected part has dimension `d`. Then for every `n ≥ 0`,
`#s^*(Ω^1_{Γ[l^n]/R_i}) = l^{n·m_i·d}`. Consequently, if `A → A'` is an isogeny of semiabelian schemes over `R_i`
whose quasi-finite flat kernel has finite part `Γ[l^n]` (the open and closed subgroup scheme finite over
`R_i` containing the unit section), then `#s^*(Ω^1_{A/A'}) = l^{n·m_i·d}`.

*Proof route.* The invariant differentials of `Γ[l^n]` form a free `R_i/l^nR_i`-module of rank `d`, so their
order is `#(R_i/l^nR_i)^d = l^{n m_i d}`. A quasi-finite separated flat group scheme over the henselian `R_i`
is the disjoint union of its finite part and a part with empty special fibre, so `s^*Ω^1` sees only the
finite part; for the isogeny the cokernel of `φ^*` is `s^*(Ω^1_{A/A'}) = s^*(Ω^1_{G/R_i})` as in R28.2.1.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.17
`invariantDifferentialsAndAbsoluteDifferent` (part (i): `ω_{G[p^v]} ≅ (R/p^vR)^d`), R07.1.16
`BarsottiTate.discr_level`, R07.1.3 `finitePart`, R07.1.14 `BarsottiTate.dim`; R28.2.1.

**Checks.**
- Étale `Γ` (`d = 0`), for instance `(ℚ_l/ℤ_l)^{h'}`: the count is `1`.
- Multiplicative `Γ = μ_{l^∞}^{h'}` (`d = h'`): `s^*(Ω^1_{μ_{l^n}}) = R_i/l^n`, count `l^{n m_i h'}`.
- `d` is the dimension of the connected part, not the height: for `E[l^∞]` of an elliptic curve with good
  ordinary or supersingular reduction, height `2`, `d = 1`, count `l^{n m_i}`.
- The local degree enters: for `K_i` ramified over `ℚ_l`, `#(R_i/lR_i) = l^{m_i}`, not `l^{f_i}`.

### R28.2.5 The Hodge–Tate determinant at a place above `l`

Let `G ⊆ A[l^∞]` be an `l`-divisible subgroup over `K` of height `h`, and `C_i` the completion of `K̄_i`.
Suppose `(H_i)`: the `D_i`-stable subspace `W_i = V_l(G) ∩ V_l(H_i)` of `V_l(A)` is the rational Tate module of
an `l`-divisible group `Γ_i` over `R_i` of height `h_i` and dimension `d_i`. Prove the local Hodge–Tate determinant identity
(Faltings 1983, §4, p. 359): `Λ^h V_l(G) ⊗_{ℚ_l} C_i ≅ C_i(d_i)` as semilinear `D_i`-modules. Faltings takes
`Γ_i = G ∩ H_i`, which by the erratum is an `l`-divisible group over `R_i` only after replacing `A` by a
member `A_k` of the tower with `k` large (R28.3.1–R28.3.3).

*Proof route.* Tate's Hodge–Tate decomposition gives `V_l(Γ_i) ⊗ C_i ≅ C_i^{h_i − d_i} ⊕ C_i(1)^{d_i}`. The
quotient `U = V_l(G)/W_i` injects `D_i`-equivariantly into `V_l(A)/V_l(H_i)`, on which by R28.2.3 inertia acts
trivially and `D_i` through a finite quotient, so `U ⊗ C_i ≅ C_i^{h − h_i}` (a representation with finite
image becomes trivial after `⊗ C_i`). Determinants are multiplicative in `0 → W_i → V_l(G) → U → 0`.

*Needs:* R28.2.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.19 `BarsottiTate.hodgeTate` (with
the determinant consequence: `det V_p(G) ⊗ C ≅ C(dim G)`); PadicPeriodRings §2 `tateSen_character`
(Tate's theorems on `C(ψ)` and the Hodge–Tate decomposition: a representation with finite image on
inertia is `C`-trivial); Mathlib `cyclotomicCharacter`.

**Checks.**
- Étale case `d_i = 0` (for instance `G` étale at `v_i`): the determinant is `C_i`-trivial.
- Multiplicative case: for the `l`-divisible group of the torus of a Tate curve over `K_i` (`h = 1`),
  `W_i = V_l(G)`, `d_i = 1` and the determinant is `C_i(1)`.
- The twist is `+1` per formal dimension; with the opposite sign the identity of R28.2.9 would read
  `Σ m_i d_i = −mh/2`, impossible for `h > 0`.

### R28.2.6 `l`-adic characters of `Gal(ℚ̄/ℚ)`

Prove cyclotomic decomposition of the character (Faltings 1983, §4, p. 360): for a prime `l` and every
continuous homomorphism `χ : Gal(ℚ̄/ℚ) → ℤ_l^×` there are a unique `a ∈ ℤ_l` and a character `ψ` of finite
order with `χ = ⟨χ_0⟩^a·ψ` (`⟨·⟩` as in the Conventions). For `k ∈ ℤ`, `χ·χ_0^{−k}` has finite order if and only
if `a = k`. No ramification hypothesis is needed; over a number field other than `ℚ` the statement fails,
which is why the argument induces to `ℚ` first.

*Proof route.* `χ` factors through `Gal(ℚ^{ab}/ℚ)`, which by Kronecker–Weber and the Galois groups of
cyclotomic fields is `lim_n (ℤ/n)^× = ∏_p ℤ_p^×`, with `ℤ_l^×`-component `χ_0`. `⟨χ⟩` restricted to `∏_{p≠l} ℤ_p^×` is
a continuous homomorphism into the torsion-free pro-`l` group `1 + qℤ_l`, so it kills each factor (pro-`p`
part and finite torsion) and hence the dense subgroup they generate. A continuous endomorphism of
`1 + qℤ_l ≅ ℤ_l` is `x ↦ x^a` for a unique `a ∈ ℤ_l`, and `ψ = χ·⟨χ_0⟩^{−a}` takes values in the roots of unity of
`ℤ_l`. Uniqueness: `⟨χ_0⟩` maps onto the torsion-free `1 + qℤ_l`.

*Needs:* TauCetiRoadmap ClassFieldTheory Layer 13 (`kroneckerWeber`); Mathlib `cyclotomicCharacter`,
`IsCyclotomicExtension.Rat.galEquivZMod`.

**Checks.**
- `χ = χ_0`: `a = 1`, and `ψ = χ_0·⟨χ_0⟩^{−1}` is the Teichmüller character, of order `l − 1` for `l` odd; for `l = 2` it is
  the character `χ_0 mod 4`, of order `2`.
- A quadratic character (values `±1`): `a = 0`.
- Over an imaginary quadratic field `F` the analogue fails: the anticyclotomic `ℤ_l`-extension of `F` gives a
  character of `Gal(F̄/F)` of infinite order that is not of this shape.

### R28.2.7 The determinant of the induced Tate module at `l`

Let `π = Gal(K̄/K) ⊆ π̃ = Gal(ℚ̄/ℚ)`, `W̃ = Ind_π^{π̃} T_l(G) ⊆ Ṽ = Ind_π^{π̃} T_l(A)` (of rank `mh`), and
`L = Λ^{mh}(W̃) ⊆ Λ^{mh}(Ṽ)`, on which `π̃` acts by a character `χ : π̃ → ℤ_l^×`. Let `D ⊆ π̃` be a decomposition
group at `l` and `C` the completion of `ℚ̄_l`. Prove the induced determinant identity at l (Faltings 1983, §4, p. 360): if `(H_i)`
of R28.2.5 holds at every `v_i | l`, then `L ⊗_{ℤ_l} C ≅ C(Σ_i m_i d_i)` as semilinear `D`-modules.

*Proof route.* By Mackey, `Res_D Ind_π^{π̃} T_l(G) ≅ ⊕_i Ind_{D_i}^D (T_l(G)|_{D_i})`, with
`D_i = D ∩ g_iπg_i^{−1} ≅ Gal(K̄_{v_i}/K_{v_i})` of index `m_i` in `D` (the places above `l` correspond to the
double cosets `D\π̃/π`). The determinant of an induced representation is
`det Ind_{D_i}^D U = sgn_{D/D_i}^{rank U}·(det U ∘ Ver_{D→D_i})`. By R28.2.5, `det T_l(G)|_{D_i} = χ_0^{d_i}·η_i` with
`η_i` of finite image on the inertia of `D_i`; `χ_0|_{D_i} ∘ Ver = χ_0^{m_i}`, and the transfer maps the inertia
of `D` into that of `D_i`, so `η_i ∘ Ver` and the signs have finite image on inertia. So the character of `D`
on `L` is `χ_0^{Σ m_i d_i}` times a character with finite image on inertia, which is `C`-trivial.

*Needs:* R28.2.5; ArithmeticGaloisRepresentations §1.3 “The Mackey decomposition” (`Rep.mackeyDecomposition`,
the continuous Mackey decomposition target), “The determinant of an induced representation”, §7.1
`ContinuousRep.extPower`; PadicPeriodRings §2 `tateSen_character`;
Mathlib `Representation.ind`, `MonoidHom.transfer`, `cyclotomicCharacter`.

**Checks.**
- For the trivial rank-one representation of the identity subgroup in `C₂`,
  the nonidentity element acts on the induced two-dimensional representation by
  `[[0,1],[1,0]]`, whose determinant is `−1 = sgn(C₂)·1`. Restriction back to
  the identity subgroup is the sum of two trivial lines, as Mackey predicts.
- `K = ℚ` (`m = 1`): `D_1 = D`, there is no induction, and the statement is R28.2.5.
- `l` totally split in `K` (all `m_i = 1`): `L ⊗ C ≅ C(Σ_i d_i)`, one factor per place.
- `l` inert in `K` of degree `m`: one place, `m_1 = m`, twist `m·d_1`; the transfer raises `χ_0` to the power
  `[D : D_1]`.

### R28.2.8 Frobenius weights on the induced Tate module

Prove the induced Frobenius weight statement (Faltings 1983, §4, p. 360): let `p ≠ l` be a prime unramified in `K` such
that `A` has good reduction at every place of `K` above `p` (all but finitely many `p`). Then
`Ṽ = Ind_π^{π̃} V_l(A)` is unramified at `p`, every eigenvalue of an arithmetic Frobenius `F_p` on `Ṽ` is an
algebraic number all of whose complex conjugates have absolute value `p^{1/2}`, and
`χ(F_p) = det(F_p | W̃ ⊗ ℚ_l)`, a product of `mh` of these eigenvalues, is an algebraic number all of whose
conjugates have absolute value `p^{mh/2}`.

*Proof route.* At a place `𝔭 | p` of good reduction `V_l(A)` is unramified and the characteristic polynomial
of `Frob_𝔭` has integer coefficients and roots of absolute value `N𝔭^{1/2} = p^{f_𝔭/2}` (Weil). By Mackey at
`p`, `Res_{D_p} Ind_π^{π̃} V ≅ ⊕_{𝔭|p} Ind_{D_𝔭}^{D_p} V`; as `p` is unramified in `K` inertia acts trivially, `F_p`
permutes the `f_𝔭` cosets of `D_p/D_𝔭` cyclically with `F_p^{f_𝔭}` acting as `Frob_𝔭`, so its characteristic
polynomial on `Ind_{D_𝔭}^{D_p} V` is `Q_𝔭(T^{f_𝔭})`, where
`Q_𝔭(X) = det(X − Frob_𝔭 | V_l(A))` is monic. The eigenvalues on the induced block
are `f_𝔭`-th roots of those of `Frob_𝔭`.
`W̃ ⊗ ℚ_l` is an `F_p`-stable subspace of dimension `mh`.

*Needs:* WeightsInEtaleCohomology R34.2, “Purity and integral polynomials at good reduction”;
ArithmeticGaloisRepresentations §1.3 “The Mackey decomposition” (`Rep.mackeyDecomposition`,
the continuous Mackey decomposition target); DeligneWeightsAndPurity DWP.1 §1.4 (the
Weil estimate for abelian varieties over finite fields); NeronModelsAndSemistableAbelianVarieties §5.1
`NeronOggShafarevich`.

**Checks.**
- `m = 1` and `G = A[l^∞]` (`h = 2g`): `χ(F_p) = det(F_p | V_l(A)) = p^g`, of absolute value `p^{mh/2}`.
- Only absolute values are controlled: `χ(F_p)` need not equal `p^{mh/2}`; a root of unity may remain.
- Excluded primes: `p = l`, primes ramified in `K` and primes of bad reduction, finitely many.

### R28.2.9 The determinant identity

Prove the local-dimension identity (Faltings 1983, §4, pp. 359–360): let `A/K` have a semiabelian model over `R`, `G ⊆ A[l^∞]`
an `l`-divisible subgroup over `K` of height `h`, `m_i = [K_{v_i} : ℚ_l]`, and suppose `(H_i)` of R28.2.5 holds at
every `v_i | l`. Then `Σ_{i=1}^r m_i d_i = mh/2`.

*Proof route.* With `χ` the character of `π̃` on `L` (R28.2.7), R28.2.6 gives `χ = ⟨χ_0⟩^a·ψ`. By R28.2.7 and the
Tate–Sen criterion, `χ·χ_0^{−Σ m_i d_i}` has finite image on the inertia group at `l`; since `⟨χ_0⟩` maps that
inertia group onto an open subgroup of `1 + qℤ_l`, this forces `a = Σ m_i d_i`, so `χ·χ_0^{−Σ m_i d_i}` has finite
order on all of `π̃`. Then for almost all `p`, `χ(F_p) = ζ·p^{Σ m_i d_i}` with `ζ` a root of unity (as `χ_0(F_p) = p`),
and R28.2.8 gives `|χ(F_p)| = p^{mh/2}`; so `Σ m_i d_i = mh/2`. The local statement at `l` gives finiteness on
inertia only; the global form of `χ` is what extends it to a character of finite order.

*Needs:* R28.2.5–R28.2.8; PadicPeriodRings §2 `tateSen_character`;
ArithmeticGaloisRepresentations §1.3; Mathlib `cyclotomicCharacter`.

**Checks.**
- Local degrees matter: `K` quadratic, `l` inert, `E/K` with good supersingular reduction at `l`, `G = E[l^∞]`
  (`h = 2`): one place, `m_1 = 2`, `d_1 = 1`, and `Σ m_i d_i = 2 = mh/2`; without the `m_i` the identity fails.
- Whole Tate module with good reduction: `G = A[l^∞]`, `Γ_i = A[l^∞]` over `R_i`, `d_i = g`, and
  `Σ_i m_i g = mg = m·(2g)/2`.
- CM check: `E` with complex multiplication by an imaginary quadratic `F` in which `l = 𝔩𝔩̄` splits, and `K = F`,
  assuming `E` semistable over `F` (otherwise pass to a finite `K ⊇ F` over which it is, the count below scaling by `[K : F]`),
  `G = E[𝔩^∞]` (`h = 1`): `d = 1` at one place above `l` and `0` at the other, so `Σ m_i d_i = 1 = mh/2`.

### Examples

- For `G = A[l^∞]` the identity is the statement that `det V_l(A) = χ_0^g` up to finite order, i.e. the
  Weil-pairing identity `Λ^{2g}V_l(A) ≅ ℚ_l(g)`.
- For a semistable elliptic curve over `ℚ` (`m = 1`) an `l`-divisible subgroup `G` of height `1` defined over
  `ℚ` would need `d_1 = 1/2` (after the shifts of R28.3.1–R28.3.3, which make `(H_1)` hold), so none exists; over an
  imaginary quadratic `F` with `m = 2`, the CM check above exhibits one.

### Dependencies

Mathlib (number fields, induced representations, transfer, cyclotomic characters); TauCetiRoadmap
ClassFieldTheory (Layer 13); AbelianSchemesAndArithmeticModuli A3, A6; NeronModelsAndSemistableAbelianVarieties
Layers 2, 3, 5, 6; ArithmeticGaloisRepresentations Layers 1, 6, 7; WeightsInEtaleCohomology R34.2;
DeligneWeightsAndPurity DWP.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; PadicPeriodRings §2;
ArakelovGeometryAndAbelianHeights §2.0; ArakelovGeometryAndAbelianHeights §§4.1–4.4; Layer R28.1.

## Layer R28.3: The erratum and the stationarity of heights

Faltings' Satz 2 (§4, p. 358) asserts that the heights `h(A_n)` along an `l`-divisible tower `A_n = A/G_n` are
all equal to `h(A)`. N. Katz observed an error and O. Gabber gave a counterexample; the author's note added in
proof (p. 366) and the 1984 erratum replace the conclusion by eventual stationarity, which is what the
rest of the paper needs. This layer states the two corrections of the erratum, proves the corrected
Satz 2, and builds the principally polarized towers on which Satz 3 and Satz 4 are proved: descent of
polarizations along isotropic subgroups, the reduction to a principally polarized semiabelian model,
powers of such models, the invariance of Satz 3 and Satz 4 under finite extension and isogeny, and the
infinitely many isomorphic quotients along a maximal isotropic tower.

Throughout, `K`, `R`, `m`, `l` and the places `v_i | l` are as in Layer R28.2, `A/R` is semiabelian with proper
generic fibre, `G ⊆ A[l^∞]` is an `l`-divisible subgroup over `K` of height `h`, `G_n = G[l^n]` and `A_n = A/G_n` (with
its semiabelian model, by isogeny invariance of semistable reduction). For `k ≥ 0`, `H_i^{(k)}` is the
`l`-divisible group of R28.2.3 for `A_k`.

### R28.3.1 Erratum (a): closures form an `l`-divisible group after a shift

Use the shifted closure tower as the specialization of FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.1.21 `BarsottiTate.exists_of_tateModule_summand` to `F = H_i` and `M = W`
(Faltings 1984, part a; Tate, *p-divisible groups*, (4.2), Proposition 12 and proof,
pp. 181–182). Here `R_i` is a complete mixed-characteristic DVR with finite, hence perfect,
residue field. Let `W ⊆ T_l(Â)` be a `D_i`-stable saturated sublattice and
`G_{i,n} ⊆ Â` the schematic closures over `R_i` of the levels of the corresponding `l`-divisible subgroup of
`A ⊗ K_i`. These are finite flat with `G_{i,n} ⊆ G_{i,n+1}` and `l·G_{i,n+1} ⊆ G_{i,n}`, and the system is an
`l`-divisible group exactly when the maps `G_{i,n+1}/G_{i,n} → G_{i,n}/G_{i,n−1}` are isomorphisms for all
`n ≥ 1`, which can fail. There is `n_0` such that they are isomorphisms for all `n ≥ n_0`; consequently the
closures in the local quotient tower `B_k = A_{K_i}/E_*[l^k]`, where `E_*` is the generic
divisible subgroup corresponding to `W`, form an `l`-divisible group over `R_i` for `k ≥ n_0`.
Use R07.1.20a `BarsottiTate.quotientFiniteFlatSubgroup` for the integral ambient group
`H_i/G_{i,k}`; the shifted subgroup levels are `G_{i,k+n}/G_{i,k}`. Saturation gives the
direct-summand hypothesis of R07.1.21. R28.3.3 owns the comparison of this local quotient
with the global tower.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.20 `schematicClosure_flat`,
R07.1.20a `BarsottiTate.quotientFiniteFlatSubgroup` and R07.1.21
`BarsottiTate.exists_of_tateModule_summand`; R28.2.3.

**Checks.**
- The defect sits in finitely many levels: from `n_0` on the tail is `l`-divisible.
- `W = T_l(Â)`: the closures are the levels `H_i[l^n]` themselves, and `n_0 = 1`.
- Saturation is needed: in `T = ℤ_l`, `W = lℤ_l` is not saturated (`l·1 ∈ W`, `1 ∉ W`) and corresponds to no
  embedded `l`-divisible subgroup with Tate module `W`; `W = 0` and `W = T` are saturated.
- In Serre's example (Tate, p. 182), independent rational `l`-torsion points `x, y` of an
  ordinary elliptic scheme `X` have the same nonzero reduction. The diagonal generic subgroup
  in `(X/⟨x⟩) × (X/⟨y⟩)` has defective closures. Taking an unrelated global `G = 0` leaves
  `A_k = A` and cannot repair them; quotienting by the levels of `E_*` is essential.

### R28.3.2 Erratum (b): the toric intersection is `l`-divisible after a shift

Prove divisibility of the shifted toric intersection (Faltings 1984, part b): the intersection `G ∩ H_i` of
`l`-divisible groups over `K_i` need not be `l`-divisible, but there is `s_1` such that for `k ≥ s_1` the
intersection `(G/G_k) ∩ H_i^{(k)}` inside `A_k[l^∞] ⊗ K_i` is an `l`-divisible group over `K_i` whose rational
Tate module is `V_l(G) ∩ V_l(H_i) ⊆ V_l(A) = V_l(A_k)`. The defect lives already over `K_i`.

*Proof route.* Over `K_i` the points of `G[l^∞]` and `H_i[l^∞]` are the images of `V_l(G)` and `V_l(H_i)` in
`V_l(A)/T_l(A)`; their intersection contains `(V_l(G) ∩ V_l(H_i) + T_l(A))/T_l(A)` as maximal divisible subgroup
with a finite, possibly nonzero quotient. For `A_k`, `T_l(A_k) = T_l(A) + l^{−k}T_l(G)` and `V_l(H_i^{(k)}) = V_l(H_i)`
(the isogeny `A → A_k` and its quasi-inverse map the formal groups into each other). Put
`Q = V_l(G) ∩ (V_l(H_i) + T_l(A))`; its image in `V_l(G)/(V_l(G) ∩ V_l(H_i))` embeds into the finitely
generated `T_l(A)/(T_l(A) ∩ V_l(H_i))`, so it lies in `l^{−k}`·(image of `T_l(G)`) for `k ≥ s_1`. For such `k` every
point of `(G/G_k) ∩ H_i^{(k)}` lies in `(V_l(G) ∩ V_l(H_i) + T_l(A_k))/T_l(A_k)`, so the intersection equals its
maximal divisible subgroup.

*Needs:* R28.2.3; R28.1.2; AbelianSchemesAndArithmeticModuli A3.3 (quotients and quasi-inverses).

**Checks.**
- The defect of (b) is independent of that of (a): first take the toric-intersection shift `s_1`,
  then the closure shift `n_0` for `A_{s_1}`. The common starting index is `s_1 + n_0`.
- Good reduction at `v_i`: `H_i = A[l^∞]` over `R_i`, the intersection is `G` and `s_1 = 0`.
- Toy lattice case: with `T_l(A) = ℤ_l²`, `V_l(H_i) = ℚ_l·(1, l)` and `T_l(G) = ℤ_l·(1, 0)`, the defect has order `l`
  for `k = 0` and vanishes for `k ≥ 1`.

### R28.3.3 The differential count along the shifted tower

Prove the shifted differential count (Faltings 1983, §4, p. 359, as corrected by Faltings 1984): there is `s_0`
such that for every `k ≥ s_0` and every `i`: the schematic closure in `Â_k` of `(G/G_k) ∩ H_i^{(k)}` is an
`l`-divisible group `Γ_i` over `R_i` with `V_l(Γ_i) = V_l(G) ∩ V_l(H_i)`; for all `n ≥ 0` the finite part of the
kernel of `A_k → A_{k+n}` over `R_i` is `Γ_i[l^n]`; and with `d_i = dim Γ_i`,
`#(s^*(Ω^1_{A_k/A_{k+n}}) ⊗_R R_i) = l^{n m_i d_i}` and `#s^*(Ω^1_{A_k/A_{k+n}}) = l^{n Σ_i m_i d_i}`.

*Proof route.* Take `s_1` from R28.3.2 for all `i`, then `n_0` from R28.3.1 for `A_{s_1}` and the lattices
`T_l(G/G_{s_1}) ∩ T_l(Â_{s_1})`. The generic subgroup for this local application is
`E_* = (G/G_{s_1}) ∩ H_i^{(s_1)}`, divisible by R28.3.2. Prove in this target the
finite/formal quotient comparison: for each `k`, quotienting `A_{s_1}` by the global tail
`(G/G_{s_1})[l^k]` induces on `H_i^{(s_1)}` the quotient by the closure of `E_*[l^k]`,
and identifies the closures of the remaining intersection levels. Indeed the generic
finite-part kernel is precisely `E_*[l^k]`; the quotient of the formal completion has this
closed finite-flat kernel, and its induced map to the target formal completion is an
isomorphism, by the finite-flat quotient comparison and uniqueness of the formal finite part.
Thus the local tower of R28.3.1 gives the required groups in the global tower.
Put `s_0 = s_1 + n_0`; the toric-intersection shift precedes the closure shift, and
`(A_{s_1})_n = A_{s_1+n}`. Over `R_i` the kernel of the
extended isogeny is quasi-finite flat; its finite part has generic fibre the points of `(G/G_k)[l^n]` that
extend into `Â_k`, and being flat it is the closure of that generic fibre, i.e. `Γ_i[l^n]`. R28.2.4 gives the
local count; `s^*(Ω^1_{A_k/A_{k+n}})` is killed by `l^n` (R28.2.2), hence supported above `l`, and its order is the
product of the local orders.

*Needs:* R28.2.2, R28.2.3, R28.2.4, R28.3.1, R28.3.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.3
`finitePart`; AbelianSchemesAndArithmeticModuli A3.3 (finite-flat quotients);
NeronModelsAndSemistableAbelianVarieties §3.5 `FiniteFlatToricFiltration` and §3.13
`RaynaudExtensionComparison` (compatibility of the local formal/finite part with isogenies).

**Checks.**
- `G = A[l^∞]` with good reduction at every `v_i`: `Γ_i = A[l^∞]` over `R_i`, `d_i = g`, and the count `l^{ngm}` agrees
  with `#s^*(Ω^1_{A[l^n]})` from the multiplication check of R28.2.1.
- For fixed `n` the count does not depend on the choice of `k ≥ s_0`, since `d_i` is the multiplicity of the
  weight `C_i(1)` in `(V_l(G) ∩ V_l(H_i)) ⊗ C_i`.
- Nothing is claimed for `k < s_0`: for `A_0` the kernel's finite part need not be a level of an
  `l`-divisible group.

### R28.3.4 Satz 2 as corrected: the heights become stationary

Prove stationarity of heights (Faltings 1983, §4, Satz 2, p. 358, with the note added in proof, p. 366, and
Faltings 1984): for `A`, `G`, `A_n` as above, the sequence `h(A_n)` becomes stationary: there is `s_0` with
`h(A_n) = h(A_{s_0})` for all `n ≥ s_0`. In particular `h(A_n) ≤ max(h(A_0), …, h(A_{s_0}))` for all `n`. The printed
conclusion `h(A_n) = h(A)` for all `n` is false; `s_0` is not effective.

*Proof route.* Choose `s_0` as in R28.3.3. Replacing `A` by `A_{s_0}` changes neither `V_l(G)`, `V_l(H_i)` nor
the Galois modules, and `(A_{s_0})_n = A_{s_0+n}`. For `n ≥ 0`, `A_{s_0} → A_{s_0+n}` is an isogeny of degree `l^{nh}`, and
R28.2.1 with R28.3.3 gives
`h(A_{s_0+n}) − h(A_{s_0}) = ½ log l^{nh} − (1/m) log l^{n Σ m_i d_i} = n·log l·(h/2 − (1/m)Σ_i m_i d_i)`.
The `d_i` are dimensions of `l`-divisible groups `Γ_i` with `V_l(Γ_i) = V_l(G) ∩ V_l(H_i)`, so `(H_i)` holds for
`A_{s_0}` and R28.2.9 gives `Σ m_i d_i = mh/2`.

*Needs:* R28.2.1, R28.2.9, R28.3.1–R28.3.3; NeronModelsAndSemistableAbelianVarieties §3.2
`SemistabilityIsogeny`.

**Checks.**
- Stationarity, not constancy: an argument needing `h(A_n) = h(A_0)` uses a false statement.
- What Layers R28.4 and R28.5 need is boundedness, `h(A_n) ≤ max(h(A_0), …, h(A_{s_0}))`.
- `G = A[l^∞]`: `A_n = A/A[l^n] ≅ A`, so the sequence is constant, consistent with the corrected statement.
- The shift comes before the height computation: the formula is applied only to `A_{s_0} → A_{s_0+n}`.

### R28.3.5 The polarization reduction

Construct a polarization reduction of `(A, λ)` (Faltings 1983, §5, proof of Satz 3 and Satz 4, p. 361, and proof
of Korollar 3, p. 362): for an abelian variety `A` over a number field `K` with a polarization `λ` of degree
`d`, the data of a finite extension `L/K` over which `ker λ` is constant, a subgroup `H ⊆ (ker λ)_L` maximal
isotropic for `e^λ`, the quotient `π : A_L → B = A_L/H` and the principal polarization `μ` of `B` with
`λ_L = π^∨ ∘ μ ∘ π`. After a further finite extension `B` has a semiabelian model over the ring of integers.
Together with R28.3.7 this is how Faltings may assume in Section 5 that `A/K` is principally polarized
and has a semiabelian model over `R`; Zarhin's trick is not needed, because the ground field may be
enlarged.

The API consists of the following statements:

- `λ_L = π^∨ ∘ μ ∘ π`.
- `deg π = √(deg λ)`.
- `deg μ = 1`.
- `ker π = H` is maximal isotropic for `e^λ`, of order `√(deg λ)`.
- If `λ` is principal, `L = K`, `H = 0`, `B = A`, `μ = λ`, `π = id` is a
  polarization reduction.
- For a further finite `L'/L` the base change is a polarization
  reduction over `L'`.
- A further finite `L'/L` over which `B` has a semiabelian model over `O_{L'}`.

*Proof route.* `ker λ` is a finite étale group scheme of order `d` with nondegenerate alternating `e^λ`
(R28.1.12), so `d` is a square and maximal isotropic subgroups have order `√d`. Choose `L` with all points
of `ker λ` rational and `H` maximal isotropic; R28.1.12 gives `μ`, principal and defined over `L`. Semistable
reduction after a finite extension gives the last item.

*Needs:* R28.1.12; NeronModelsAndSemistableAbelianVarieties §3.10 `FiniteSeparableSemistableExtension`
and §3.12 `FiniteTorsionSemistability`; Tau Ceti `AbelianVariety.baseChange`, `AbelianVariety.IsIsogeny`.

**Checks.**
- For an elliptic curve with `λ = n·λ_E` and `E[n] ⊆ E(L)`, a cyclic `H` of order `n` gives
  `deg π = n = √(n²)` and principal `μ`.
- `d = 1` needs no extension for the polarization quotient and `π = id`;
  a further extension may still be needed for semistable reduction.
- The quotient by the whole kernel fails (R28.1.12, second check); a definition
  allowing non-isotropic `H` is wrong.
- For `E/ℚ` with surjective mod-`l` representation and `λ = l·λ_E`, no subgroup of
  order `l` of `E[l]` is defined over `ℚ`, so `L ≠ ℚ`; a definition insisting on `L = K` fails.
- `e^μ(πx, πy) = e^λ(x, y)` on `T_l(A_L)`, the relation the tower argument uses
  to transport isotropy.

### R28.3.6 Powers of a principally polarized semiabelian model

Prove the principally polarized power construction (Faltings 1983, §5, p. 361): if `A/K` has a principal polarization `λ` and a semiabelian
model `𝒜` over `R`, then for `k ≥ 1` the power `A^k` carries the principal polarization `λ^k`, the fibre power
`𝒜^k` is a semiabelian model of `A^k`, `T_l(A^k) = T_l(A)^k` as `π`-modules, and the Weil pairing of `λ^k` is the
orthogonal sum of `k` copies of that of `λ`. Faltings uses `k = 8` (and `k = 2`).

*Proof route.* Products of abelian varieties (Tau Ceti `AbelianVariety.prod`, iterated); R28.1.12 for the
product polarization; the fibre power of a semiabelian scheme is smooth with fibres connected
extensions of `B_s^k` by `T_s^k`; `T_l` commutes with finite products.

*Needs:* R28.1.12; Tau Ceti `AbelianVariety.prod`; ArithmeticGaloisRepresentations §6.1
the functoriality of the arithmetic adapter and §6.2 the product comparison of the arithmetic Weil-pairing adapter; R28.1.1.

**Checks.**
- `k = 1` is the statement for `A` itself.
- `k = 8`: the form on `T_l(A)^8` is the orthogonal sum, which is what makes the subspace of R28.4.2 isotropic.
- Degrees: `deg(λ^k) = (deg λ)^k`, so only principal polarizations stay principal.

### R28.3.7 Invariance of Satz 3 and Satz 4 under finite extension and isogeny

Prove invariance under finite extension and isogeny (Faltings 1983, §5, pp. 360–361): let `A/K` be an abelian variety, `V = V_l(A)`,
`π_K = Gal(K̄/K)`.

- (i) If `L/K` is finite and `V` is a semisimple `π_L`-module, it is a semisimple `π_K`-module.
- (ii) If `L/K` is finite Galois and `End_L(A) ⊗ ℚ_l → End_{π_L}(V)` is bijective, then
  `End_K(A) ⊗ ℚ_l → End_{π_K}(V)` is bijective.
- (iii) An isogeny `A → B` over `K` induces `V_l(A) ≅ V_l(B)` and `End_K(A) ⊗ ℚ ≅ End_K(B) ⊗ ℚ` compatibly with
  these maps, so the statements of (i) and (ii) hold for `A` exactly when they hold for `B`.

Only the `ℚ_l`-form of Satz 4 is invariant; the `ℤ_l`-form is recovered afterwards (R28.4.5).

*Proof route.* (i): `π_L` has finite index in `π_K`; average a `π_L`-equivariant projection onto a
`π_K`-stable `U` over a set of representatives for the left cosets `π_K/π_L`
(characteristic `0`). Conjugating the projection by an element of `π_L` leaves it fixed, so the
coset average is independent of representatives and is `π_K`-equivariant. This coset set need not
be a quotient group; normality is required only in (ii). (ii): `End_K(A) = End_L(A)^{Gal(L/K)}` and
`End_{π_K}(V) = End_{π_L}(V)^{π_K/π_L}`; invariants of a bijection are a bijection and commute with `⊗ ℚ_l`.
(iii): an isogeny `f` with quasi-inverse `g`, `g ∘ f = [deg f]`, gives `x ↦ f ∘ x ∘ g/deg f`.

*Needs:* AbelianSchemesAndArithmeticModuli A6.20 `homDescentFullLevel` (Galois descent of homomorphisms)
and A6.1 `Hom.deg`; ArithmeticGaloisRepresentations §6.1; Mathlib `IsSemisimpleModule`; Tau Ceti
`AbelianVariety.End`, `AbelianVariety.IsIsogeny`.

**Checks.**
- (i) needs finite index: for the trivial subgroup every `V` is semisimple.
- (ii) needs the invariants: for a CM elliptic curve over `ℚ` with CM defined over an imaginary quadratic
  `L`, `End_L(E) ⊗ ℚ` is two-dimensional and `End_ℚ(E) ⊗ ℚ = ℚ`; both sides shrink by the same
  `Gal(L/ℚ)`-invariants.
- (iii) is rational only: `End(A) ⊗ ℤ_l` and `End(B) ⊗ ℤ_l` can differ for isogenous `A, B`.

### R28.3.8 Infinitely many isomorphic quotients along a maximal isotropic tower

Prove existence of infinitely many isomorphic quotients (Faltings 1983, §5, proof of Satz 3 and Satz 4, p. 361, read with the
correction of Satz 2): let `A/K` have a principal polarization `λ` and a semiabelian model over `R`, and let
`W ⊆ V_l(A)` be a `π`-stable subspace, maximal isotropic for the Weil pairing of `λ`. Let `G ⊆ A[l^∞]` be the
`l`-divisible subgroup with `T_l(G) = W ∩ T_l(A)` and `A_n = A/G_n`. Then `G`, the `G_n`, the `A_n` and the isogenies
`A → A_n` are defined over `K`, each `A_n` carries a principal polarization `λ_n` over `K`, the heights `h(A_n)` are
bounded, and infinitely many of the `(A_n, λ_n)` are isomorphic over `K`.

*Proof route.* `T_l(G)` is a `π`-stable saturated lattice of rank `g`, so `G` and its levels are defined over `K`.
`G_n` has order `l^{ng}` and is isotropic for the pairing of `l^n·λ` on `A[l^n]` (order `l^{2ng}`), hence maximal
isotropic, and R28.1.12 gives `l^n·λ = φ_n^∨ ∘ λ_n ∘ φ_n` with `λ_n` of degree `l^{2ng}/(l^{ng})² = 1`. `A_n` has a
semiabelian model; by R28.3.4 the `h(A_n)` are bounded; by Satz 1 (R28.1.11) finitely many `K`-isomorphism
classes of principally polarized `(A_n, λ_n)` occur.

*Needs:* R28.1.11, R28.3.4, R28.1.12, R28.3.5; NeronModelsAndSemistableAbelianVarieties §3.2
`SemistabilityIsogeny`; ArithmeticGaloisRepresentations §6.1.

**Checks.**
- Maximal isotropy, not `π`-stability alone, keeps the polarizations principal: for isotropic `W` with
  `dim W < g` the descended polarization of `A_n` has degree `l^{2n(g − dim W)}`, unbounded, and Satz 1 with
  fixed degree no longer applies.
- Elliptic curves (`g = 1`): every line is maximal isotropic, so a `π`-stable line of `V_l(E)` gives the tower;
  when `V_l(E)` is irreducible there is no such `W`.
- The isomorphisms are over `K`, because Satz 1 counts `K`-isomorphism classes.
- The proof of R28.4.3 needs infinitely many isomorphic `A_n`, not `h(A_n) = h(A)`.

### Examples

- Gabber's counterexample to the printed Satz 2 shows that the shift of R28.3.1–R28.3.2 is necessary; the
  stationary value `h(A_{s_0})` can differ from `h(A_0)`.
- For `G = A[l^∞]` the tower is constant up to isomorphism (`A_n ≅ A` via `[l^n]`) and the
  stationarity theorem applies. For `g > 0` its Tate subspace is all of `V_l(A)`, which is not isotropic;
  this example does not satisfy the maximal-isotropic hypothesis of R28.3.8.

### Dependencies

Layers R28.1 and R28.2; AbelianSchemesAndArithmeticModuli A2, A3, A6; NeronModelsAndSemistableAbelianVarieties
Layer 3; ArithmeticGaloisRepresentations Layer 6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1; Tau
Ceti abelian varieties; Mathlib semisimple modules.

## Layer R28.4: Semisimplicity and the Tate conjecture

This layer is Section 5 of Faltings 1983. From the infinitely many isomorphic quotients along a
maximal isotropic tower (R28.3.8) Zarhin's argument produces, for every `π`-stable subspace `W` of
`V_l(A)`, an idempotent of `End_K(A) ⊗ ℚ_l` with image `W`; the passage from maximal isotropic to arbitrary
`W` is Zarhin's quaternion construction on `A^8`. Semisimplicity of `V_l(A)` (Satz 3) and the Tate
conjecture `End_K(A) ⊗ ℤ_l ≅ End_π(T_l(A))` (Satz 4) follow by the double-centralizer argument; the Hom form,
the isogeny criterion by local L-factors and the finiteness of polarized varieties with prescribed Tate
modules are Korollare 1–3. Milne's notes write out the arguments Faltings attributes to Zarhin
(*Abelian varieties*, IV §2, pp. 135–138).

Throughout, `K` is a number field, `π = Gal(K̄/K)`, `l` is any prime (`l = 2` included), and
`𝓔 = End_K(A) ⊗_ℤ ℚ_l`, a semisimple `ℚ_l`-algebra.

### R28.4.1 `−1` is a sum of four squares in `ℤ_l`

Prove the four-square representation of −1: for every prime `l` there are `a, b, c, d ∈ ℤ_l` with
`a² + b² + c² + d² = −1`. Faltings chooses such a quadruple in `ℚ_l` without comment (§5, p. 361).

*Proof route.* For `l` odd choose integers `b, c` with `b² + c² ≡ −2 (mod l)` and `d = 0`; then
`F(X) = X² + 1 + b² + c²` has `F(1) ≡ 0 (mod l)` and `F'(1) = 2` a unit, and Hensel's lemma gives `a`. For
`l = 2` take `b = c = 1`, `d = 2` and `F(X) = X² + 7`: `‖F(1)‖ = ‖8‖ = 1/8 < 1/4 = ‖F'(1)‖²`, so `a² = −7` has a
2-adic solution.

*Needs:* Mathlib `ZMod.sq_add_sq`, `hensels_lemma`, `PadicInt`.

**Checks.**
- `l = 2` is covered by the explicit quadruple `(a, 1, 1, 2)` with `a² = −7`, not excluded.
- `l = 3`: `b = 1, c = 0` gives `b² + c² = 1 ≡ −2 (mod 3)`, and `a² = −2` has a 3-adic solution with `a ≡ ±1 (mod 3)`.
- Over `ℚ` (or `ℝ`) no such quadruple exists: the statement is genuinely `l`-adic.

### R28.4.2 Zarhin's quaternion construction

This is the construction of Faltings 1983, §5, p. 361; the same matrix appears in
Zarhin's trick (Milne, I Theorem 13.12, p. 60). Let `V` be a vector space over a field
`k`, with an alternating form `e`, and let a group act by similitudes with nonzero factors.
For `a, b, c, d` in any commutative ring, define the quaternion matrix as right
multiplication by `a + bi + cj + dk` in the basis `1, i, j, k`:

```text
       ⎛ a  −b  −c  −d ⎞
  v =  ⎜ b   a   d  −c ⎟
       ⎜ c  −d   a   b ⎟
       ⎝ d   c  −b   a ⎠
```

It satisfies `v·vᵀ = vᵀ·v = (a² + b² + c² + d²)·1` over every commutative ring.
Give `V^4` and `V^8 = V^4 × V^4` the orthogonal-sum forms, and let scalar matrices
act on `V^4` by Mathlib's scoped `Matrix.Module.matrixModule` action, with identity,
zero and composition laws `one_smul`, `zero_smul` and `mul_smul`.
For `W ⊆ V` and `a² + b² + c² + d² = −1`, define the subspace
`W_1 = {(x, vx) : x ∈ W^4} + {(y, −vy) : y ∈ (W^⊥)^4} ⊆ V^8`
as the ordinary sum of the two graph subspaces. Isotropy and invariance hold in every
characteristic. Directness and recovery require `2 ≠ 0`; the dimension and maximal-isotropy
conclusions additionally require finite-dimensional `V` and nondegenerate `e`.
These hypotheses include `k = ℚ_l` for every prime `l`, including `l = 2`.

The API consists of the following statements:

- The quaternion matrix satisfies `v·vᵀ = (a² + b² + c² + d²)·1`,
  and likewise with the factors exchanged.
- An alternating `e` gives an alternating orthogonal-sum form;
  inputs supported in distinct blocks pair to zero, and inputs in one block pair by `e`.
- `W_1` is isotropic for the orthogonal-sum form on `V^8`.
- If `2 ≠ 0`, the graph sum is direct. If also `V` is finite-dimensional and `e`
  nondegenerate, `dim W_1 = 4·dim V = ½·dim V^8`, so `W_1` is maximal isotropic.
- If a group acts on `V` by similitudes of `e` and `W` is stable, `W_1` is
  stable under the diagonal action on `V^8`.
- If `2 ≠ 0`, the linear map `V^8 → V^4`, `(s, t) ↦ ½(s + v^{−1}t)`, maps `W_1` onto `W^4`.
- For `V = V_l(A)` with the Weil pairing of a principal
  polarization, `V^8 = V_l(A^8)` and the orthogonal-sum form is the Weil pairing of `λ^8` (R28.3.6).

*Proof route.* `v·vᵀ = −1` by multiplication, so `v^{−1} = −vᵀ`. For a scalar `4 × 4` matrix `u`, `e(ux, x') = e(x, uᵀx')`,
so `e((x, vx), (x', vx')) = e(x, x') + e(x, vᵀvx') = 0` and likewise for the second summand; the cross terms are
`e(x, y) − e(x, vᵀvy) = 2e(x, y) = 0` for `x ∈ W^4`, `y ∈ (W^⊥)^4`. When `2 ≠ 0`, the sum is direct (`(x, vx) = (y, −vy)` forces
`x = y`, `2vx = 0`), and `dim W + dim W^⊥ = dim V` by nondegeneracy. The group commutes with the scalar `v` and
preserves `W` and `W^⊥`. Every element of `W_1` is `(x + y, v(x − y))`, which the recovery map sends to `x`.

*Needs:* Mathlib `Matrix.transpose`, `LinearMap.BilinForm.IsAlt`, `LinearMap.BilinForm.orthogonal`,
`LinearMap.BilinForm.finrank_add_finrank_orthogonal`; R28.3.6.

**Checks.**
- For `(a, b, c, d) = (2, 3, 5, 7)` over `ℤ`, `v·vᵀ = 87·1`
  (`87 = 4 + 9 + 25 + 49`); a sign error in any off-diagonal entry breaks this.
- The quadruple `(0, 0, 0, 0)` gives zero; `(1, 0, 0, 0)` gives the identity.
- Right multiplication by `(0, 1, 0, 0)` sends `(x₁, x₂, x₃, x₄)` to
  `(−x₂, x₁, x₄, −x₃)`. In particular the third basis vector goes to minus the fourth, fixing
  right multiplication rather than left multiplication.
- For a symplectic pair `u, w` with `e(u, w) = 1`, vectors supported in
  the same coordinate of one block pair to `1`.
- Putting `u` in the first block and `w` in the second gives `0`.
  A cross pairing would fail this test.
- Placing the pair in both blocks gives `2`; constant inputs in all eight
  coordinates pair to `8e(u, w)`. An averaged sum gives the wrong values.
- For the degenerate form, `e = 0` gives zero. Over `𝔽₅` with `V = 𝔽₅`,
  `W = V` and `v = 2I₄`, both graphs sum to all of `V^8`, of dimension `8`,
  not `4·dim V = 4`; this excludes dropping nondegeneracy from the dimension theorem.
  A nonzero symmetric form in characteristic zero fails the alternating API.
- For nondegenerate `e`, `W = 0` gives the graph of `−v` on `V^4`;
  `W = V` gives the graph of `v`. For `V = 0` both graphs and their sum have dimension `0`.
- When `2 ≠ 0`, for symplectic `V` of dimension `2` and `W` a line (so `W^⊥ = W`), `W_1 = W^4 × W^4`, an 8-dimensional
  isotropic subspace of the 16-dimensional `V^8`.
- Over `𝔽₂`, take symplectic `V = 𝔽₂²`, `W = ⟨e₁⟩ = W^⊥` and `v = I₄`.
  Both graphs coincide: each has `16` elements, their ordinary sum has `16` elements
  and dimension `4`, while the external direct sum has `256` elements and dimension `8`.
  The sum is isotropic; neither directness nor recovery nor dimension `8` is asserted.
- Over a field with `2 ≠ 0`, the identity
  graph pairs a symplectic pair to `2`, so it is not isotropic. The condition `v·vᵀ = −1`
  is essential; the identity matrix has `v·vᵀ = +1`.

### R28.4.3 Zarhin's lemma for maximal isotropic subspaces

Prove realization of maximal isotropic subspaces by idempotents (Faltings 1983, §5, p. 361, attributed to Zarhin; Milne,
*Abelian varieties*, IV Lemma 2.4, pp. 136–137): let `A/K` have a principal polarization and a semiabelian
model over `R`, and `W ⊆ V_l(A)` a `π`-stable maximal isotropic subspace. Then there is `u ∈ 𝓔` with `u(V_l(A)) = W`,
and hence an idempotent `e ∈ 𝓔` with `e(V_l(A)) = W`.

*Proof route.* Put `T = T_l(A)`, `V = V_l(A)`, `X_n = (T ∩ W) + l^n T`. The isogeny `f_n : A_n → A` induced by
multiplication by `l^n` maps `T_l(A_n)` isomorphically onto `X_n`. By R28.3.8 there is an infinite set `I` with all
`A_i`, `i ∈ I`, `K`-isomorphic; let `i_0 = min I` and fix isomorphisms `v_i : A_{i_0} → A_i`. Then
`u_i = f_i ∘ v_i ∘ f_{i_0}^{−1} ∈ End_K(A) ⊗ ℚ ⊆ 𝓔` maps `X_{i_0}` onto `X_i ⊆ X_{i_0}`, so all `u_i` lie in the compact set
`End_{ℤ_l}(X_{i_0})`; a limit point `u` lies in the closed subspace `𝓔 ⊆ End(V)`, and `u(X_{i_0}) ⊆ ⋂_i X_i = T ∩ W`.
Conversely each `y ∈ ⋂_i X_i` is `u_i(x_i)` with `x_i ∈ X_{i_0}`, and a limit point `x` of the `x_i` has `u(x) = y`; so
`u(V) = W`. Finally `{w ∈ 𝓔 : w(V) ⊆ W}` is a right ideal of the semisimple `𝓔`, hence `e𝓔` for an idempotent `e`,
and `W = u(V) ⊆ e(V) ⊆ W`.

*Needs:* R28.3.8; AbelianSchemesAndArithmeticModuli A6.7 `homFreeFinite`, A6.2 `homTateInjective`, A6.8
`endQ_isSemisimple`; ArithmeticGaloisRepresentations §6.1 the functoriality of the arithmetic adapter; Mathlib
`PadicInt.compactSpace`, `IsSemisimpleRing.ideal_eq_span_idempotent`; Tau Ceti `AbelianVariety.End`.

**Checks.**
- The limit `u` is shown to lie in `𝓔` (closedness of a finite-dimensional subspace), not merely in
  `End_π(V)`.
- Surjectivity `u(V) = W` uses the second compactness argument, not only `u(V) ⊆ W`.
- Only infinitely many isomorphic members of the tower are used, which the corrected Satz 2 and Satz 1
  give; no equality `h(A_n) = h(A)` is needed.

### R28.4.4 Every stable subspace is the image of an idempotent

Prove realization of stable subspaces by idempotents (Faltings 1983, §5, p. 361; Milne, *Abelian varieties*, IV proof of
Theorem 2.5(a), p. 138): let `A/K` have a principal polarization and a semiabelian model over `R`. Every
`π`-stable subspace `W ⊆ V_l(A)` is `e(V_l(A))` for an idempotent `e ∈ 𝓔`; the same holds for `A × A`.

*Proof route.* Choose `a, b, c, d` by R28.4.1 and form `W_1 ⊆ V_l(A^8)` (R28.4.2), `π`-stable and maximal
isotropic for the principal polarization `λ^8` of the semiabelian `A^8` (R28.3.6). R28.4.3 for `A^8` gives an
idempotent `e_1 ∈ M_8(𝓔)` with `e_1(V^8) = W_1`. With the recovery map `p : V^8 → V^4` and the first projection
`pr_1 : V^4 → V`, both given by matrices over `ℚ_l ⊆ 𝓔`, `W = pr_1(p(e_1(V^8))) = w_1(V) + ⋯ + w_8(V)` where
`(w_1, …, w_8) = pr_1·p·e_1` has entries in `𝓔`. The right ideal `{w ∈ 𝓔 : w(V) ⊆ W}` contains every `w_j`, so it is `e𝓔`
and `W ⊆ e(V) ⊆ W`. `A × A` satisfies the same hypotheses.

*Needs:* R28.4.1, R28.4.2, R28.4.3, R28.3.6; AbelianSchemesAndArithmeticModuli A6.8 (`End(A^n) = M_n(End A)`
compatibly with `T_l`); Mathlib `IsSemisimpleRing.ideal_eq_span_idempotent`; Tau Ceti `AbelianVariety.prod`.

**Checks.**
- The passage from `A^8` back to `A` (recovery map and right ideal) is part of the statement.
- The idempotent lies in `End_K(A) ⊗ ℚ_l` for the field `K` over which `A` is principally polarized and
  semiabelian; R28.3.7 transports the consequences back to the original field.
- A line `W` in `V_l` of an elliptic curve (`W^⊥ = W`) is covered: `W_1 = W^4 × W^4`.

### R28.4.5 Satz 3 and Satz 4

Prove Tate semisimplicity and the integral Tate endomorphism comparison (Faltings 1983, §5, Satz 3 and Satz 4, p. 360): for an abelian
variety `A` over a number field `K` and any prime `l`, the action of `π` on `V_l(A)` is semisimple, and the
natural map `End_K(A) ⊗_ℤ ℤ_l → End_π(T_l(A))` is an isomorphism.

*Proof route.* The map is injective with torsion-free cokernel, so it suffices to prove that
`𝓔 → End_π(V_l(A))` is surjective: if `f ∈ End_π(T_l(A))` then `l^k f` is in the image of `End_K(A) ⊗ ℤ_l` for some `k`,
hence `f` is. By R28.3.5 and R28.3.7 one may enlarge `K` and replace `A` by an isogenous variety, so `A` may be
assumed principally polarized with a semiabelian model over `R`. Satz 3: for a `π`-stable `W = e(V)` (R28.4.4),
`(1 − e)(V)` is a `π`-stable complement, `π` commuting with `𝓔`. Satz 4: for `α ∈ End_π(V)` the graph
`{(x, αx)} ⊆ V ⊕ V = V_l(A × A)` is `π`-stable, hence the image of an element of `End_K(A × A) ⊗ ℚ_l = M_2(𝓔)`;
for `c` in the centralizer of `𝓔` in `End(V)`, `diag(c, c)` commutes with `M_2(𝓔)` and preserves the graph, so `αc = cα`;
thus `α` lies in the double centralizer of `𝓔`, which is `𝓔` because `𝓔` is semisimple.

*Needs:* R28.3.5, R28.3.7, R28.4.4; AbelianSchemesAndArithmeticModuli A6.7 `homFreeFinite` (injectivity with
torsion-free cokernel), A6.8 `endQ_isSemisimple`; ArithmeticGaloisRepresentations §6.1; Tau Ceti
`AlgHom.centralizer_centralizer_range` (double centralizer theorem), `AbelianVariety.End`,
`AbelianVariety.prod`; Mathlib `IsSemisimpleModule`.

**Checks.**
- Both injectivity and surjectivity of `End_K(A) ⊗ ℤ_l → End_π(T_l(A))` are proved, not an equality of
  dimensions.
- The statement is for `End_K`: for `E/ℚ : y² = x³ − x`, with complex multiplication by `ℤ[i]` over `ℚ(i)`,
  `End_ℚ(E) = ℤ` and `End_π(T_l(E)) = ℤ_l`, although `End_{ℚ̄}(E)` has rank `2`.
- The integral statement follows from the rational one only through the torsion-freeness of the
  cokernel.

### R28.4.6 Korollar 1: the Hom form

Prove the integral Tate Hom comparison (Faltings 1983, §5, Korollar 1 and its proof, p. 361; Milne, *Abelian varieties*, IV
Theorem 1.3, p. 132): for abelian varieties `A_1, A_2` over `K` and any prime `l`,
`Hom_K(A_1, A_2) ⊗_ℤ ℤ_l → Hom_π(T_l(A_1), T_l(A_2))` is an isomorphism, and so is
`Hom_K(A_1, A_2) ⊗ ℚ_l → Hom_π(V_l(A_1), V_l(A_2))`.

*Proof route.* Apply R28.4.5 to `A_1 × A_2`: both sides are `2 × 2` block matrices (`End_K(A_1 × A_2)` has blocks
`End A_1`, `Hom(A_2, A_1)`, `Hom(A_1, A_2)`, `End A_2`, and `T_l(A_1 × A_2) = T_l(A_1) ⊕ T_l(A_2)`), and the map respects
the blocks.

*Needs:* R28.4.5; AbelianSchemesAndArithmeticModuli A6.8; ArithmeticGaloisRepresentations §6.1; Tau Ceti
`AbelianVariety.prod`, `AbelianVariety.Hom` (`Hom.instCommGroup`).

**Checks.**
- For `A_1 = A_2` the statement is Satz 4.
- For non-isogenous elliptic curves both sides vanish; for `37a1` and `37b1` over `ℚ`
  (`a_2 = −2` and `0`), `Hom_π(T_l, T_l') = 0`.
- The target is the `π`-equivariant homomorphisms, not all `ℤ_l`-linear maps.
- Non-isogenous higher-dimensional varieties may share a simple factor: for `A_1 = E × E` and
  `A_2 = E × F`, with non-isogenous elliptic `E, F`, `Hom_K(A_1, A_2)` contains the maps to the `E` factor.
  Non-isogeny alone does not imply vanishing of either side.

### R28.4.7 Korollar 2: the isogeny criterion

For abelian varieties `A_1, A_2` over `K` and a prime `l`, prove the isogeny criterion by local factors (Faltings 1983,
§5, Korollar 2 and its proof, p. 361): the following are equivalent:

- (i) `A_1` and `A_2` are isogenous over `K`;
- (ii) `V_l(A_1) ≅ V_l(A_2)` as `π`-modules;
- (iii) `L_v(A_1, s) = L_v(A_2, s)` for almost all places `v` of `K` (Conventions);
- (iv) `L_v(A_1, s) = L_v(A_2, s)` for all finite `v`, where at a place of bad reduction `L_v` is defined by
  `det(1 − Φ_v T | H¹_{l'}(A)^{I_v})^{−1}`, evaluated at `T = Nv^{−s}`, with geometric
  Frobenius `Φ_v` and `l'` different from the residue characteristic. Equivalently use arithmetic
  Frobenius on the inertia coinvariants of `V_{l'}(A)`.

Faltings prints (ii) with `⊗_ℤ ℚ_l`, meaning `⊗_{ℤ_l} ℚ_l`, and defines `L_v` only at almost all places; (iv) uses
the standard definition at the others.

*Proof route.* (i) ⇒ (ii): an isogeny induces `T_l(φ)` injective with finite cokernel. (ii) ⇒ (i): by R28.4.6
`Hom_K(A_1, A_2) ⊗ ℚ_l ≅ Hom_π(V_l(A_1), V_l(A_2))`; after fixing bases `det V_l(f)` is a polynomial function on
`Hom_K(A_1, A_2) ⊗ ℚ_l`, nonzero at the given isomorphism, hence nonzero at some `f` in the dense subgroup
`Hom_K(A_1, A_2) ⊗ ℚ`; an integer multiple of `f` is a homomorphism with `V_l` an isomorphism, so with finite
kernel, an isogeny. (ii) ⇒ (iii): equal characteristic polynomials of `F_v` at good places not above `l`,
independent of `l`. (iii) ⇒ (ii): `V_l(A_1) ⊕ V_l(A_2)` is unramified outside the bad places and those above `l`
(Néron–Ogg–Shafarevich); by Chebotarev the Frobenius elements at the places where (iii) holds are dense in
the image of `π`, so `tr(σ | V_l(A_1)) = tr(σ | V_l(A_2))` for all `σ ∈ π`; both are semisimple (R28.4.5), hence
isomorphic by the trace criterion in characteristic `0`. (iv) ⇒ (iii) is trivial, and (i) ⇒ (iv) because an
isogeny gives `V_{l'}(A_1) ≅ V_{l'}(A_2)` for every `l'`, hence isomorphic dual-cohomology inertia invariants with their geometric Frobenius actions.

*Needs:* R28.4.5, R28.4.6; ArithmeticGaloisRepresentations §1.8 (trace form of Brauer–Nesbitt in
characteristic `0`), §5.1 (density of `GaloisRep.frobeniusSet`), §5.3 (trace recognition on a dense
subset), §6.1, §6.3 `TateModule.localEulerFactor`
(good-reduction comparison and isogeny invariance); NeronModelsAndSemistableAbelianVarieties §5.1
`NeronOggShafarevich`, §5.2 `GoodIsogeny`; TauCetiRoadmap Chebotarev Layer 10
(`hasDirichletDensity_frobeniusPrimeSet`); AbelianSchemesAndArithmeticModuli A6.1, A6.7; Tau Ceti
`AbelianVariety.IsIsogeny`.

**Checks.**
- (iii) concerns almost all `v`: finitely many places cannot separate isogeny classes.
- Without Satz 3, equal Frobenius traces give only equal semisimplifications; semisimplicity is used in
  (iii) ⇒ (ii).
- The curves `11a1`, `11a2`, `11a3` over `ℚ` are isogenous and have equal `a_p` (`a_2 = −2`, `a_3 = −1`, `a_5 = 1`,
  `a_7 = −2`); `37a1` and `37b1` share `a_7 = −1` but have `a_2 = −2` and `0`, so agreement at finitely many primes
  does not give (iii).

### R28.4.8 Korollar 3: finiteness with prescribed Tate modules

Prove finiteness with prescribed Tate modules (Faltings 1983, §5, Korollar 3 and its proof, p. 362): for an abelian
variety `A/K` and `d > 0` (only squares occur as degrees), only finitely many isomorphism classes of `d`-fold
polarized abelian varieties
`B/K` satisfy `T_l(A) ≅ T_l(B)` as `π`-modules for every prime `l`.

*Proof route.* For each `l` lift a `π`-isomorphism `T_l(A) → T_l(B)` through R28.4.6 to `f ∈ Hom_K(A, B) ⊗ ℤ_l` and
approximate it `l`-adically by `φ ∈ Hom_K(A, B)` with `φ ≡ f (mod l)`; then `T_l(φ)` is an isomorphism and `φ` is an
isogeny of degree prime to `l`. Every such `B` has good reduction exactly where `A` does, so R28.1.13 applies
with `S` the bad places of `A`: over a finite `K'` independent of `B`, `A` and all `B` are semiabelian and each
`(B, λ)` is replaced by a principally polarized `(B', λ')` isogenous to it by an isogeny of degree `√d`. Then for
every `l` there is an isogeny `A → B'` whose `l`-part of degree divides `N = √d`, and R28.2.2 shows that
`exp(2[K' : ℚ](h(B') − h(A)))` lies in a finite set; so the `h(B')` are bounded, Satz 1 gives finitely many
`(B', λ')`, and R28.1.13 (ii) finitely many `(B, λ)`.

*Needs:* R28.1.11, R28.1.13, R28.2.2, R28.4.6; NeronModelsAndSemistableAbelianVarieties §5.2 `GoodIsogeny`;
ArithmeticGaloisRepresentations §6.1.

**Checks.**
- The conclusion is finiteness of isomorphism classes of `d`-fold polarized abelian varieties over `K`; the
  polarization is part of the data.
- The hypothesis is used for every `l` (it supplies, for each `l`, an isogeny of degree prime to `l`); from a
  single `l` the height bound is not available.
- The height bound comes from R28.2.2 and the uniform isogeny degree, not from Northcott alone.

### Examples

- For `E/ℚ` without complex multiplication, R28.4.5 gives `End_π(T_l(E)) = ℤ_l` for every `l`, so `V_l(E)` is
  absolutely irreducible as a `ℚ_l[π]`-module (its commutant is `ℚ_l`).
- For `E/ℚ : y² = x³ − x` and `K = ℚ(i)`, `End_K(E) ⊗ ℚ_l = ℚ_l ⊗ ℚ(i)` and `V_l(E)` is a sum of two characters of
  `Gal(K̄/K)` when `l` splits in `ℚ(i)`.

### Dependencies

Layers R28.1–R28.3; AbelianSchemesAndArithmeticModuli A6; ArithmeticGaloisRepresentations Layers 1, 5, 6;
NeronModelsAndSemistableAbelianVarieties Layer 5; TauCetiRoadmap Chebotarev (Layer 10); Tau Ceti abelian
varieties and the double centralizer theorem; Mathlib `p`-adic integers, Hensel's lemma, bilinear forms,
semisimple rings.

## Layer R28.5: Finiteness of isogeny classes and the Shafarevich conjecture

This layer is Section 6 of Faltings 1983. Satz 5 (finitely many isogeny classes with good reduction
outside `S`) follows from the Tate conjecture of Layer R28.4, Weil's bound, Hermite–Minkowski and a finite
Frobenius test set. Satz 6 (finitely many polarized abelian varieties with good reduction outside `S`)
needs a bound on the height inside an isogeny class: for primes `l` above an auxiliary bound `N`, Raynaud's
determinant theorem and the Weil bound force isogenies of `l`-power degree to preserve the height, and for
the finitely many `l ≤ N` the finiteness of stable lattices in the semisimple `V_l(A)` bounds the `l`-part of the
height quotient. The layer then removes the polarization by Zarhin's trick and deduces the finiteness of
curves with good reduction outside `S` (through the rational Torelli theorem), the hypothesis needed
for the worked Parshin application.

Throughout, `K` is a number field of degree `m`, `S` a finite set of places of `K`, `π = Gal(K̄/K) ⊆ π̃ = Gal(ℚ̄/ℚ)`.

### R28.5.1 Finitely many Weil polynomials

Prove finiteness of Weil polynomials: for a real number `r` and an integer `n ≥ 0`, there are only finitely many
monic `P ∈ ℤ[X]` of degree `n` all of whose complex roots have absolute value `r`. With `r = q^{w/2}` this is the
finiteness of Weil `q`-polynomials of weight `w` (Faltings 1983, §6, proof of Satz 5, p. 362; Milne,
*Abelian varieties*, IV proof of Theorem 3.10, p. 144).

*Proof route.* If `r < 0` and `n > 0`, no polynomial satisfies the root condition; for `n = 0` the only
monic polynomial is `1`. For `r ≥ 0`, use
`Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`: monicity and the `n` complex roots,
counted with multiplicity, give `(P.map (Int.castRingHom ℂ)).mahlerMeasure = max(1, r)^n`.
Package this nonnegative bound as `B : ℝ≥0` and apply `Polynomial.finite_mahlerMeasure_le n B`.
The desired set is a subset of that finite set. The generic finiteness theorem for bounded degree
and Mahler measure is supplied by Mathlib.

*Needs:* Mathlib `Polynomial.Monic`, `Polynomial.roots`,
`Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots`, `Polynomial.finite_mahlerMeasure_le`,
`IsAlgClosed.splits_domain`.

**Checks.**
- `n = 2`, `r = √2`: the monic integer quadratics with both roots of absolute value `√2` and real coefficients
  are `X² + aX + 2` with `|a| ≤ 2√2`, i.e. `a ∈ {−2, …, 2}`, together with `X² − 2` (roots `±√2`): six polynomials. The
  factor `1 + 2T + 2T²` of `11a1` at `2` is the reversed `X² + 2X + 2`.
- `n = 0`: only `P = 1`, even for `r < 0` (the root condition is empty).
- `r = 0`: only `X^n`; for `r < 0` and `n > 0` the set is empty.
- The bound needs fixed degree: `X^n − 1` has all roots of absolute value `1` for every `n`, so over all degrees
  the set is infinite.

### R28.5.2 A finite Frobenius test set

Prove the finite Frobenius test set (Deligne, *Preuve des conjectures de Tate et de Shafarevitch*, Théorème 3.1 and its
proof, p. 40; Milne, *Abelian varieties*, IV Lemma 3.8, pp. 142–143; the argument of Faltings 1983, §6, proof
of Satz 5, pp. 362–363): let `S` be a finite set of finite places of `K`, `l` a prime and `d ≥ 1`. There is a finite
set `T` of finite places of `K`, disjoint from `S` and from the places above `l`, such that two semisimple
continuous representations `ρ_1, ρ_2 : π → GL_d(ℚ_l)`, unramified outside `S` and the places above `l`, with
`tr ρ_1(F_v) = tr ρ_2(F_v)` for every `v ∈ T`, are isomorphic.

*Proof route.* By R28.1.9 there are finitely many extensions of `K` of degree at most `l^{2d²}` unramified outside
`S ∪ {v | l}`; let `L` be their compositum, Galois over `K`. By Chebotarev choose `T` finite, disjoint from
`S ∪ {v | l}`, whose Frobenius classes cover `Gal(L/K)`. Given `ρ_1, ρ_2`, choose stable lattices and let `M` be the
`ℤ_l`-span of the image of `π` in `M_d(ℤ_l) × M_d(ℤ_l)`, of rank at most `2d²`. The image of `π` in `(M/lM)^×`, a group of
fewer than `l^{2d²}` elements, factors through `Gal(K'/K)` for some `K' ⊆ L`, so every element of it is the image
of a conjugate of some `F_v`, `v ∈ T`. The images of all `π`-conjugates of these `F_v`
span `M/lM`, and hence `M` by Nakayama. The linear form `tr m_1 − tr m_2` vanishes
on them by conjugacy invariance of trace, hence on `M`, so `ρ_1` and `ρ_2` have the same trace and, being semisimple, are isomorphic.

*Needs:* R28.1.9; TauCetiRoadmap Chebotarev Layer 10 (`hasDirichletDensity_frobeniusPrimeSet`);
ArithmeticGaloisRepresentations §1.6 (stable lattices), §1.8 (trace form of Brauer–Nesbitt in
characteristic `0`), §5.1
the finite-quotient consequence of Frobenius density; Mathlib `Submodule.FG`, Nakayama
(`Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`).

**Checks.**
- `T` depends only on `K, S, l, d`, not on `ρ_1, ρ_2`.
- Semisimplicity is needed: the trivial representation of dimension `2` and a nontrivial unipotent
  extension of trivial by trivial, unramified outside `{v | l}`, have equal traces everywhere and are not
  isomorphic.
- In the standard two-dimensional representation of `S₃` over `ℚ₅`, the image algebra
  has dimension `4`. Three matrices, one for each conjugacy class, cannot span it; their
  conjugates must be included.
- The bound `l^{2d²}` counts `#(M/lM)^× < l^{rank M}`; with `d = 2g` and two representations it is the `8g²` of Faltings.

### R28.5.3 Satz 5: finitely many isogeny classes

Prove `finite_isogenyClasses` (Faltings 1983, §6, Satz 5 and its proof, pp. 362–363; Deligne, Corollaire
3.2, p. 41): for a number field `K`, a finite set `S` of places and `g ≥ 0`, there are only finitely many isogeny
classes of abelian varieties of dimension `g` over `K` with good reduction outside `S`.

The statement `finite_isogenyClasses` uses `hasGoodReductionAt A v`: over the native
local ring `v.valuationSubringAtPrime K`, there is a smooth proper commutative group
scheme with geometrically connected fibres whose generic fibre is group-isomorphic
to `A`. The finite set in the Lean statement consists of finite places; including
infinite places in `S` does not affect good reduction.

The API of `hasGoodReductionAt` includes:

- A smooth proper commutative model with geometrically connected fibres and a
  group-scheme identification of its generic fibre introduces the predicate.
- A group isomorphism `A ≅ B` transports the predicate in both directions by
  composing that generic identification; a bare scheme map does not supply it.
- The predicate is closed under products, using the product model and the product
  of the generic group identifications.

**Checks for `hasGoodReductionAt`.**

- The zero abelian variety has model `Spec(R) → Spec(R)`; each geometric fibre
  has one point and dimension `0`. This gives good reduction at every finite place.
- The projective elliptic model `y² = x³ − x` at `5` has discriminant `64 ≡ 4`
  modulo `5`, a unit, and its zero section supplies the group-compatible generic
  identification. It therefore gives good reduction.
- A candidate with special fibre `Spec(𝔽₂[ε]/(ε²))` cannot witness the predicate:
  `ε ≠ 0` but `ε² = 0`, so that fibre is not geometrically reduced and hence not smooth.
  This rejects the candidate model, not every possible model of its generic fibre.
- Translation by a nonzero point on an elliptic curve sends `0` to that point,
  and fails the group-homomorphism condition on the generic identification.

*Proof route.* For `g = 0` there is just the zero abelian variety. Assume `g > 0` and fix a prime `l`. For `A` of dimension `g` with good reduction outside `S`, `V_l(A)` is unramified outside
`S` and the places above `l` (Néron–Ogg–Shafarevich) and semisimple (R28.4.5). Take `T` from R28.5.2 for the finite
places of `S` and `d = 2g`. For `v ∈ T`, use the monic characteristic polynomial
`Q_v(A, X) = det(X − F_v | V_l(A)) ∈ ℤ[X]`, of degree `2g` and root absolute value `Nv^{1/2}`.
R28.5.1 gives finitely many such `Q_v`, hence finitely many reciprocal local factors
`P_v(A, T) = T^{2g} Q_v(A, 1/T)`. The local factor itself has constant term `1` and leading
coefficient `Nv^g`, so the monic-polynomial lemma cannot be applied to it directly. If `A_1, A_2`
have the same local factors at `T`, their Frobenius traces agree there, so `V_l(A_1) ≅ V_l(A_2)` and `A_1, A_2` are
isogenous by R28.4.7. Faltings' printed proof stops at the spanning statement; the last step is
R28.4.7, (ii) ⇒ (i). The places of `T` must lie outside `S` and away from `l`, which the source leaves implicit.

*Needs:* R28.4.5, R28.4.7, R28.5.1, R28.5.2; WeightsInEtaleCohomology R34.2, “Purity and integral polynomials at good reduction”,
and DeligneWeightsAndPurity DWP.1 §1.4
(Weil's bound); NeronModelsAndSemistableAbelianVarieties §5.1 `NeronOggShafarevich`.

**Checks.**
- The conclusion concerns isogeny classes, not isomorphism classes; and `T` depends only on `K, S, g, l`.
- `g = 0` is trivial (one class). Satz 5 bounds the number of isogeny classes, not their size: over `ℚ` with
  `S = {11}` the class of `11a1` is one of them and contains the three isomorphism classes `11a1`, `11a2`, `11a3`.
- The rank bound `8g²` of the algebra and `#(M/lM)^× ≤ l^{8g²}` (printed `≤`; in fact `<`, `0` not being a unit) is what
  forces the factorisation through `Gal(L/K)`.

### R28.5.4 The auxiliary polynomials and the bound `N`

For an abelian variety `A/K` of dimension `g`, let `n` be the product of the primes `l` at which `K/ℚ` is ramified or `A` has
bad reduction at some place above `l`. Choose a prime `p ∤ n`, and for `0 ≤ h ≤ 2gm` let
`P_h(T) = det(T − F_p | Λ^h Ind_π^{π̃} T_l(A))` for a prime `l ∤ pn`. Prove the auxiliary-polynomial identities (Faltings 1983, §6, proof of
Satz 6, pp. 363–364): the `P_h` have integer coefficients, are independent of `l`, and their complex roots have
absolute value `p^{h/2}`. Define the auxiliary bound `N` for `(A,p)` as an integer `N ≥ max(2, np)` such that no prime `l > N` divides any
of the nonzero integers `P_h(±p^j)` with `0 ≤ h ≤ 2gm`, `0 ≤ j ≤ gm`, `j ≠ h/2`.

*Proof route.* Since `p ∤ n`, `F_p` permutes `π̃/π` in orbits corresponding to the places `v | p`, of lengths `f_v`, and
`F_p^{f_v}` acts on the corresponding block as `F_v`; so `det(T − F_p | Ind T_l(A)) = ∏_{v|p} det(T^{f_v} − F_v | T_l(A))`
(equivalently `Ind T_l(A) = T_l(Res_{K/ℚ} A)`). The polynomials
`Q_v(X) = det(X − F_v | T_l(A))` have integer coefficients independent of `l` and roots of
absolute value `p^{f_v/2}`. The substituted factors `Q_v(T^{f_v})` instead have roots of
absolute value `p^{1/2}`, so `P_1` has roots `α_1, …, α_{2gm}` of absolute value `p^{1/2}`, and
`P_h = ∏_{|I|=h}(T − ∏_{i∈I} α_i)`. For `j ≠ h/2`, `|±p^j| ≠ p^{h/2}`, so `P_h(±p^j)` is a nonzero integer; finitely many pairs
`(h, j)` give finitely many primes. Faltings writes the exponent as `+h/2` and prints the condition `j ≠ h/2` with a
typographical variant of `≠`.

*Needs:* ArithmeticGaloisRepresentations §1.3 “The Mackey decomposition” (`Rep.mackeyDecomposition`,
the continuous Mackey decomposition target), §7.1 `ContinuousRep.extPower`;
AbelianSchemesAndArithmeticModuli A6.33 `weilRestrictionTate`; WeightsInEtaleCohomology R34.2 and
DeligneWeightsAndPurity DWP.0 §0.14 (eigenvalues of exterior powers), DWP.1 §1.4; Mathlib `Representation.ind`.

**Checks for the auxiliary-polynomial identities.**
- At an inert quadratic place (`f_v = 2`), `|α| = p` for a root of `Q_v`; a root `z`
  of `Q_v(T²)` has `|z| = √p`, not `p`.
- `P_0 = T − 1`, and for `j ≠ h/2` the values `P_h(±p^j)` are nonzero by their root
  absolute values. For `j = h/2` they can vanish, so the exclusion is necessary.
- `K = ℚ`, an elliptic curve with good reduction at `p`: `P_0 = T − 1`, `P_1 = T² − a_p T + p`,
  `P_2 = T − p`; for `11a1` and `p = 2`, `P_1 = T² + 2T + 2`.

**Checks for the auxiliary bound.**
- For `11a1/ℚ` and `p = 2`, `n = 11` and `N = 22` satisfies the bound: in the
  ranges `0 ≤ h ≤ 2`, `0 ≤ j ≤ 1`, `j ≠ h/2`, the nonzero evaluations have prime factors
  only `2, 3, 5`.
- For the same curve, `N = 21` fails `N ≥ np = 22`, regardless of the evaluation primes.
- For `A = (11a1)³` and `p = 2`, `N = 22` fails: `P_1(T) = (T² + 2T + 2)³` and
  `P_1(2³) = 82³` is divisible by `41 > 22`. Here `j = 3 ≤ gm`, `h = 1`, `j ≠ h/2`.

### R28.5.5 The twisted determinant character is unramified outside `l`

Let `B_1/K` be semistable everywhere, `l` a prime, `G ⊆ B_1[l]` a `π`-stable subgroup of order `l^h`,
`W_l = G(K̄) ⊆ B_1[l](K̄)`, `W̃_l = Ind_π^{π̃} W_l` (an `𝔽_l`-space of dimension `mh`), `χ : π̃ → 𝔽_l^×` the character of `π̃`
on `Λ^{mh} W̃_l`, and `ε` the sign character of Conventions. Prove unramifiedness of the twisted determinant (Faltings 1983, §6, proof
of Satz 6, p. 364): `χ·ε^h` is unramified at every prime `p' ≠ l`.

*Proof route.* Determinant of an induced representation: `χ = ε^h·(det W_l ∘ Ver)`, with `Ver` the transfer
`π̃ → π^{ab}`, so `χ·ε^h = det W_l ∘ Ver` (`ε² = 1`). For `σ` in an inertia group at `p' ≠ l` the elements `t^{−1}σ^f t`
in the explicit transfer formula lie in inertia groups of places of `K` above `p'`, which act unipotently on
`B_1[l]` (semistable reduction, Grothendieck's criterion) and hence on `W_l`, with determinant `1`.

*Needs:* ArithmeticGaloisRepresentations §1.3 “The determinant of an induced representation”; NeronModelsAndSemistableAbelianVarieties §3.7
`InertiaSquareZero` and §3.11 `MonodromyCriterion`; Mathlib `MonoidHom.transfer`,
`MonoidHom.transfer_eq_prod_quotient_orbitRel_zpowers_quot`, `LinearMap.det`.

**Checks.**
- Without the twist the character can ramify where `K/ℚ` does: for `K = ℚ(√D)` and `h` odd, `ε` is the quadratic
  character of `K/ℚ`.
- Only unipotence (semistability) at `v ∤ l` is used, not good reduction.
- `K = ℚ` (`m = 1`): `ε` is trivial and `χ = det W_l`.

### R28.5.6 Mod-`l` characters of `Gal(ℚ̄/ℚ)` unramified outside `l`

Prove the mod-l cyclotomic character statement (Faltings 1983, §6, proof of Satz 6, p. 364, where it is attributed to class field
theory): a continuous character `ψ : Gal(ℚ̄/ℚ) → 𝔽_l^×` unramified at every prime `p' ≠ l` is a power of the mod-`l`
cyclotomic character `χ_0`.

*Proof route.* The fixed field `F` of `ker ψ` is abelian over `ℚ` and unramified outside `l` (no condition at
infinity). By Kronecker–Weber `F ⊆ ℚ(ζ_n)`; write `n = l^a n'` with `l ∤ n'`. In `Gal(ℚ(ζ_n)/ℚ) ≅ (ℤ/l^a)^× × ∏_{p|n'} (ℤ/p^{k_p})^×`
the inertia group at `p | n'` is the factor `(ℤ/p^{k_p})^×`: it fixes `ℚ(ζ_{n/p^{k_p}})`, in which `p` is unramified, and has
order the ramification index `φ(p^{k_p})`. As `F` is unramified at those `p`, `F ⊆ ℚ(ζ_{l^a})`. The kernel of
`(ℤ/l^a)^× → (ℤ/l)^×` is an `l`-group and `ψ` has order prime to `l`, so `ψ` factors through `(ℤ/l)^×`, cyclic and
generated by `χ_0`.

*Needs:* TauCetiRoadmap ClassFieldTheory Layer 13 (`kroneckerWeber`), GlobalNumberFields Layer 10
(ramification in cyclotomic fields); Mathlib `IsCyclotomicExtension.Rat.galEquivZMod`,
`IsCyclotomicExtension.Rat.ramificationIdxIn_eq_of_prime_pow`, `modularCyclotomicCharacter`.

**Checks.**
- `l = 2`: `𝔽_2^×` is trivial and the statement is empty.
- `l ≡ 3 (mod 4)`: the quadratic character of `ℚ(√−l)/ℚ` is unramified outside `l` and equals `χ_0^{(l−1)/2}`.
- Ramification at infinity is allowed: `χ_0` itself is odd. For `l ≡ 1 (mod 4)` the character of `ℚ(√l)` is
  `χ_0^{(l−1)/2}` and even.

### R28.5.7 Raynaud's determinant computation for kernels killed by `l`

Let `A/K` be semistable everywhere, `N` as in R28.5.4, `B_1, B_2` abelian varieties over `K` isogenous to `A`, and
`φ : B_1 → B_2` an isogeny whose kernel `G` is killed by a prime `l > N`, with `deg φ = l^h`. Let `χ` and `ε` be as in
R28.5.5 for `G ⊆ B_1[l]`, and `l^d = #s^*(Ω^1_{G/R})` for the closure of `G` in the semiabelian model of `B_1`
(`0 ≤ d ≤ gm`). Prove Raynaud’s determinant identity (Faltings 1983, §6, proof of Satz 6, p. 364; Raynaud, *Schémas en
groupes de type (p, …, p)*, Théorème 4.1.1, p. 272): `χ·ε^h = χ_0^d`.

*Proof route.* `l > N ≥ n` makes `K/ℚ` unramified at `l` (so `e = 1 ≤ l − 1` at every `v | l`) and `B_1` of good
reduction above `l`, so the closure of `G` is finite flat over each `R_v`, `v | l`, and étale elsewhere. By R28.5.5
and R28.5.6, `χ·ε^h = χ_0^k` for some `k`. On an inertia group `I ⊆ π̃` at `l`, `I` fixes every coset of `π̃/π` (`K/ℚ` is
unramified at `l`), so `χ·ε^h(σ) = ∏_t det(t^{−1}σt | W_l)` with exactly `f_v` of the `t^{−1}σt` in an inertia group `I_v`
of `K` at each `v | l`. Raynaud's theorem, applied after base change to the strict henselisation of `R_v`
(which does not change inertia), says that `I_v` acts on `det W_l` through the tame character to the power
`v(𝔇(G_v))`, and this valuation is the length of `s^*(Ω^1_{G_v/R_v})`. So `χ·ε^h = χ_0^d` on `I`, and since `χ_0` maps `I`
onto `𝔽_l^×`, `k ≡ d (mod l − 1)`. Faltings cites Raynaud's theorem as "4.11" (it is 4.1.1).

*Needs:* R28.5.4, R28.5.5, R28.5.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.33
`raynaudDeterminantTameDifferent` and R07.1.17 `invariantDifferentialsAndAbsoluteDifferent` (part (ii):
`v_R(𝔇(𝒢)) = length_R ω_𝒢`); NeronModelsAndSemistableAbelianVarieties §3.2 `SemistabilityIsogeny`, §5.2
`GoodIsogeny`; Mathlib `modularCyclotomicCharacter`, `MonoidHom.transfer`.

**Checks.**
- `l > N ≥ np` forces `K/ℚ` unramified at `l`, so Raynaud's hypothesis `e ≤ l − 1` holds with `e = 1`; the argument is
  invalid without it.
- The global identity follows from the local one only through unramifiedness outside `l`, R28.5.6 and the
  surjectivity of `χ_0` on inertia at `l`.
- `K = ℚ` and `G ≅ μ_l` locally at `l`: `h = d = 1` and `χ = χ_0` on inertia (`det μ_l = μ_l`,
  `#s^*(Ω^1_{μ_l/ℤ_l}) = l`); for `G` étale at `l`, `d = 0` and `χ·ε^h = 1`.

### R28.5.8 Heights agree along isogenies of large prime-power degree

Prove height invariance for large-prime isogenies (Faltings 1983, §6, proof of Satz 6, pp. 364–365; Milne,
*Abelian varieties*, IV, account of Faltings 1983, p. 159): with `A`, `N` as above, if `φ : B_1 → B_2` is an isogeny
between abelian varieties over `K` isogenous to `A` whose degree is a power of a prime `l > N`, then
`h(B_1) = h(B_2)`.

*Proof route.* Factor `φ` through isogenies whose kernels are killed by `l`; every intermediate variety is
isogenous to `A`. So assume `l·ker φ = 0` and `deg φ = l^h`. By R28.5.7, `χ·ε^h = χ_0^d`. `χ(F_p)` is a root modulo `l` of the
characteristic polynomial of `F_p` on `Λ^{mh} Ind_π^{π̃} T_l(B_1)`, which is `P_{mh}` because `V_l(B_1) ≅ V_l(A)`; as
`χ(F_p) = ε(F_p)^h·p^d = ±p^d`, `l` divides `P_{mh}(±p^d)`. Since `0 ≤ mh ≤ 2gm`, `0 ≤ d ≤ gm` and `l > N`, the choice of `N`
forces `d = mh/2`, and R28.2.1 gives `h(B_2) − h(B_1) = ½ log l^h − (1/m) log l^d = 0`. Faltings prints `χ_0^d(F_p) = ±p^d`
where `χ(F_p) = ±p^d` is meant.

*Needs:* R28.2.1, R28.5.4, R28.5.7; ArithmeticGaloisRepresentations §6.1.

**Checks.**
- Only isogenies of `l`-power degree with `l > N` are covered; the primes `l ≤ N` are handled by R28.5.10.
- `F_p` is the Frobenius at the fixed auxiliary prime `p ∤ n`, and `p ≠ l` because `l > N ≥ np`.
- The reduction to kernels killed by `l` keeps every intermediate variety in the isogeny class of `A`, so R28.5.7
  applies at every step.

### R28.5.9 Finitely many stable lattices in a semisimple representation

**Local maximal-order lattices.** Prove the maximal-order lattice classification: let
`R` be a discrete valuation ring, `F` its fraction field, `D` a finite-dimensional
central simple `F`-algebra, `O` a maximal
`R`-order and `M` a finite left `D`-module. Any two full `O`-lattices in `M` are
`O`-linearly isomorphic, and the isomorphism extends to a `D`-linear automorphism of `M`
(Yu, Theorem 4.8(2), pp. 13–14; Reiner, Theorems 18.1 and 18.7).
Use the order predicates of ClassicalArithmeticCompletion §§7.4, 7.21.
First, for a complete DVR, construct the valuation on a finite-dimensional central division
algebra over `F`, its unique maximal order, principality of its one-sided ideals and the
freeness of its finite torsion-free modules. Integral Morita equivalence for matrix orders
and conjugacy of maximal orders give the complete-DVR classification (Yu §4.3,
Lemma 4.4 and Theorem 4.5, pp. 12–13).
For an arbitrary DVR, prove preservation and reflection of maximality on completion,
and that two full `O`-lattices in the same `D`-module are isomorphic whenever their
completions are. For the latter, finite presentation identifies completed Hom with Hom
of completions; approximate an invertible completed Hom element modulo the maximal
ideal by an integral Hom element. Its determinant is a unit, so it is an isomorphism.
This supplies the descent step of Yu §4.4, Theorem 4.8(2), pp. 13–14; uniqueness of a
maximal order in a division algebra is asserted only in the complete case.
The case `F/ℚ_l` finite and `R = O_F` is an application. For a semisimple `ℚ_l`-algebra,
apply the central-simple result at each finite-extension center, retaining the
multiplicity in each simple factor.

**Checks for maximal-order lattice classification.**
- For `D = F`, `O = R` and a uniformizer `π`, multiplication by `π` maps `R`
  isomorphically onto `πR`; its rational inverse is multiplication by `π⁻¹`.
- For both `R = 𝔽₂[[t]]` and the noncomplete DVR `𝔽₂[t]_(t)`, multiplication by
  `t` gives `R ≅ tR` and rational determinant `t ≠ 0`. The quotient `R/tR` has
  two elements, so equality of the two lattices would be false in both cases.
- For `D = M₂(F)`, `O = M₂(R)` acting on `F²`, every full stable lattice is isomorphic
  to `R²`; the simple lattice is not a free rank-one `M₂(R)`-module.
- In `D = F × F`, the modules `F × 0` and `0 × F` have the same total `F`-dimension
  but are not isomorphic. The semisimple version fixes the generic module factor by factor.

Prove `finite_stableLattices` (Faltings 1983, §6, proof of Satz 6, p. 363, and Milne, *Abelian varieties*, IV,
account of Faltings 1983, p. 160, both stating it without proof): let `V` be a finite-dimensional `ℚ_l`-vector space
with a group `Γ` acting `ℚ_l`-linearly and semisimply, and let some `Γ`-stable `ℤ_l`-lattice exist. Then the
`Γ`-stable `ℤ_l`-lattices in `V` fall into finitely many classes under `Γ`-equivariant isomorphism; equivalently,
there is a finite set of stable lattices such that every stable lattice is `g(Λ)` for one of them and some
`g ∈ Aut_Γ(V)`.

Define `isStableLattice ρ Λ` to mean that `Λ : Submodule ℤ_[l] V` satisfies
Mathlib's `Submodule.IsLattice ℚ_[l] Λ` and `ρ(γ)(Λ) ⊆ Λ` for every `γ ∈ Γ`.
The `ℤ_l`-module structure on `V` and scalar tower `ℤ_l → ℚ_l → V` are explicit;
semisimplicity means that the associated group-algebra module is semisimple.

Its API consists of the following facts:

- Every such lattice is finitely generated and has full rational span.
- Since `Γ` is a group, the invariance inclusions are equalities, by applying `γ⁻¹`.
- A rational linear automorphism commuting with `ρ` carries stable lattices to stable
  lattices, with the inverse giving transport back.

**Checks for `isStableLattice`.**

- For the trivial action on `ℚ_l²`, `ℤ_l²` has rank `2` and rational span `ℚ_l²`;
  `diag(l,1)` transports it to `lℤ_l × ℤ_l`, another stable lattice.
- In nonzero `V = ℚ_l²`, the zero submodule has rational span dimension `0 ≠ 2`,
  so fails the predicate even though it is invariant. In `V = 0`, it has full span
  and is the unique stable lattice, giving one representative.
- Let a generator of `Γ = ℤ` act on `ℚ_l` by `l`. The full lattice `ℤ_l` is
  preserved by that generator, but its inverse sends `1` to `l⁻¹ ∉ ℤ_l`.
  Invariance under the whole group, not one chosen generator alone, is required.

*Proof route.* Let `B ⊆ End(V)` be the `ℚ_l`-span of the image of `Γ` and `O ⊆ B` the `ℤ_l`-span (an order, contained in
`End(Λ_0)` for a stable `Λ_0`). `B` is semisimple, having the faithful semisimple module `V`. The trace form of `B`
is nondegenerate (characteristic `0`), and every order containing `O` lies in the dual `O^♯` of `O` for it,
traces of elements of an order being integral. ClassicalArithmeticCompletion §7.56 gives
a maximal order `O' ⊇ O`. Its decomposition into the simple factors and
the maximal-order lattice classification gives the classification of full `O'`-lattices in the fixed
`B`-module `V`. For a stable `Λ`, `O'Λ` is an `O'`-lattice, isomorphic to a fixed `Λ'_0` with the same span, and
`l^k O' ⊆ O` for some `k` gives `l^k·O'Λ ⊆ Λ ⊆ O'Λ`; so `Λ` is isomorphic to one of the finitely many `O`-submodules
between `l^kΛ'_0` and `Λ'_0`.

*Needs:* the maximal-order lattice classification above; ClassicalArithmeticCompletion §§7.4
`IntegralOrder.IsOrder`, 7.21 `IntegralOrder.IsMaximalOrder`, 7.56 (containing maximal order);
Mathlib `IsSemisimpleModule`, `IsSemisimpleRing`, `Algebra.traceForm`, `Submodule.IsLattice`
(TauCeti `TauCeti.Submodule.IsLattice.finrank_eq_finrank` and
`LinearEquiv.extendOfIsLattice` in `TauCeti.Algebra.Module.Lattice`), `PadicInt`.

**Checks.**
- The statement is about lattices up to isomorphism of `Γ`-modules, not up to equality or scaling: for trivial
  `Γ` on `ℚ_l²` every lattice is isomorphic to `ℤ_l²`.
- Semisimplicity is necessary: for `Γ = {(1 x; 0 1) : x ∈ ℤ_l}` acting on `ℚ_l²`, the lattices `ℤ_l e_1 ⊕ l^k ℤ_l e_2`
  (`k ≥ 0`) are stable and pairwise non-isomorphic: their coinvariants are
  `ℤ_l ⊕ ℤ_l/l^k`, with torsion orders `1, l, l², …`. Every `Γ`-automorphism of `V` is `(α β; 0 α)`.
- For `V = V_l(A)` the only input from the Tate conjecture is the semisimplicity (R28.4.5).

### R28.5.10 The small primes in an isogeny class

Prove finiteness of height-quotient valuations (Faltings 1983, §6, proof of Satz 6, p. 363): let `A/K` be semistable
everywhere and fix a prime `l`. As `B` ranges over the abelian varieties over `K` isogenous to `A`, the `l`-adic
valuation of the rational number `exp(2m·(h(B) − h(A)))` takes only finitely many values.

*Proof route.* For `B` isogenous to `A` choose an isogeny `ψ : B → A`; `T_l(ψ)` identifies `T_l(B)` with a `π`-stable
lattice `Λ_B ⊆ V_l(A)`. If `Λ_{B_1} ≅ Λ_{B_2}`, R28.4.6 and `l`-adic approximation give an isogeny `B_1 → B_2` of degree
prime to `l`, and R28.2.2 shows that `l` does not occur in `exp(2m(h(B_1) − h(B_2)))`. So the valuation depends only
on the isomorphism class of `Λ_B`, and R28.5.9 (with R28.4.5) gives finitely many classes.

*Needs:* R28.2.2, R28.4.5, R28.4.6, R28.5.9; ArithmeticGaloisRepresentations §6.1.

**Checks.**
- The bound is per prime `l`; Satz 6 uses it only for the finitely many `l ≤ N`.
- The input is an isogeny of degree prime to `l` between `B_1` and `B_2`, which needs Korollar 1 for `B_1 × B_2`
  (Faltings writes "by Satz 4").
- Varieties with isomorphic `T_l` can have different heights; only the `l`-part of the difference is controlled.

### R28.5.11 Satz 6: the Shafarevich conjecture

Prove the polarized Shafarevich theorem (Faltings 1983, §6, Satz 6 and its proof, pp. 363–365): for a number field `K`, a finite
set `S` of places, `g ≥ 0` and `d > 0` (only squares occur as degrees, Conventions), there are only finitely many
isomorphism classes of `d`-fold polarized
abelian varieties of dimension `g` over `K` with good reduction outside `S`.

*Proof route.* For `g = 0` the zero variety has only its principal polarization, so there is one
class if `d = 1` and none otherwise. For `g > 0`, by Satz 5 the varieties fall into finitely many isogeny classes; fix one, with representative
`A`. By R28.1.13 one may pass to a finite extension `K'` independent of `B` over which `A` and all `B` are
semistable and `d = 1`; let `N` be the bound of R28.5.4 for `A` over `K'`. The rational number
`exp(2[K' : ℚ](h(B) − h(A)))` has trivial `l`-part for every `l > N`
(split an isogeny `A → B` into an `l`-primary part, which preserves `h` by R28.5.8, and a part of degree prime to `l`,
which contributes no `l` by R28.2.2), and for each of the finitely many `l ≤ N` its `l`-part takes finitely many values
(R28.5.10). So it lies in a finite set, the `h(B)` are bounded, and Satz 1 gives finitely many principally
polarized `B` over `K'`, hence by R28.1.13 (ii) finitely many `d`-fold polarized `B` over `K`. Faltings refers the
reduction to the proof of Korollar 3, which used a different source of uniformity; here it comes from the
good reduction outside `S` and Lemma 4.

*Needs:* R28.1.11, R28.1.13, R28.2.2, R28.5.3, R28.5.4, R28.5.8, R28.5.10.

**Checks.**
- The polarization degree `d` is fixed, and the reduction to `d = 1` is part of the proof, not a hypothesis.
- The finiteness is of isomorphism classes of polarized abelian varieties over `K`, with good reduction outside a
  fixed finite `S`.
- No naive projective height bound is used: the height bound comes from R28.5.8 and R28.5.10.
- `g = 1`, `d = 1`, `K = ℚ`, `S = {2}`: Ogg's classification lists the elliptic curves over `ℚ` with good reduction
  outside `2`; there are 24 of them, of conductors `32`, `64`, `128` and `256` (Ogg, *Abelian curves of 2-power
  conductor*, 1966). A proof of Satz 6 that produced infinitely many here would be wrong.

### R28.5.12 Zarhin's trick and the finiteness of direct factors

Use Zarhin’s trick, the field specialization of PadicDifferentialEquationsAndRigidCohomology
§RD.5.116, including its finite-flat graph-descent construction: for every abelian variety
`A/k`, `(A × A^∨)^4` carries a principal polarization over `k`. An abelian variety over a
field has a polarization over that field, so the supplier applies over `Spec(k)` without
an extension. Sources: Milne, *Abelian varieties*, I Theorem 13.12, p. 60; Zarhin,
Theorem 1.1(ii) with `O = ℤ`, p. 2, and §4, pp. 4–5 (arXiv:2010.07995v5).

**Arithmetic closed-orbit adapter.** Prove the arithmetic closed-orbit adapter:
for a finite-dimensional semisimple `ℚ`-algebra `E`, a `ℤ`-order `O ⊆ E` and a
geometrically closed conjugacy orbit `X ⊆ E` of the algebraic group `E^×`, the set
`X(ℚ) ∩ O` has finitely many `O^×`-orbits. Construct this specialization of arithmetic
orbit finiteness (Milne, I Theorem 15.5, pp. 65–66, citing Borel 1969, §9.11) using
AdelicAlgebraicGroups AA.3.3: reductive subgroup reduction, closed-orbit lattice finiteness
and rational points on closed orbits. Here `E^×` is reductive by its geometric matrix
algebra decomposition, and `O^×` is arithmetic by the left-regular embedding: it is the
stabilizer of the lattice `O`. The supplied Siegel-domain reduction and lattice bounds
must be transported to this subgroup action; this adapter includes that transport and the
finite-index changes of arithmetic subgroup.

**Checks for the arithmetic closed-orbit adapter.**
- A central scalar orbit is a point; its integral intersection is empty or a singleton.
- For `E = M₂(ℚ)` and `O = M₂(ℤ)`, the rank-one idempotent orbit contains infinitely
  many matrices `(1 n; 0 0)`, all conjugate under `GL₂(ℤ)`.
- The nonzero nilpotent orbit is not closed: `nE₁₂`, `n ≥ 1`, have distinct
  `GL₂(ℤ)`-orbits, detected by the gcd of the entries. Omitting closedness is false.

**Integral idempotents.** Prove finiteness of integral idempotent conjugacy classes: for a
`ℤ`-order `O` in a finite-dimensional semisimple `ℚ`-algebra `E`, its integral idempotents
have finitely many conjugacy classes under `O^×` (Milne, I Proposition 15.4 and
Application 15.8, pp. 65–67). Equivalently, take a finite free `ℤ`-algebra `O` with
semisimple rational algebra `ℚ ⊗_ℤ O`; its scalar map embeds `O` as a full order in that algebra.
Use the preceding adapter. After splitting `E`, idempotents
have finitely many rank vectors. Each corresponding geometric orbit is closed: in each
matrix block it is cut out by `e² = e` and `tr(e) = r`, since characteristic is zero and
idempotents are diagonalizable. Thus no projectivity assertion about the space of images
alone is needed to establish closedness of the conjugacy orbit.

**Checks for finiteness of integral idempotent conjugacy classes.**
- For `O = ℤ`, the two idempotents are `0, 1`.
- For `O = M₂(ℤ)`, there are three classes, represented by `0`, `diag(1,0)`, `1`.
- Rational idempotents `(1 1/n; 0 0)` have unbounded least denominators and infinitely
  many `GL₂(ℤ)`-orbits. They are outside the integral assertion.

Prove `finite_directFactors` (Milne, I Theorem 15.3, pp. 64–65): an abelian variety
`A/k` has finitely many direct factors up to `k`-isomorphism. A factor with complement
is `ker(1 − e)` for an integral idempotent `e ∈ End_k(A)`; conjugate idempotents give
isomorphic factors. Finite generation of Hom and rational semisimplicity identify
`End_k(A)` with an order, and the preceding idempotent theorem applies.

*Needs:* PadicDifferentialEquationsAndRigidCohomology §RD.5.116 (Zarhin's trick);
ClassicalArithmeticCompletion §7.4 `IntegralOrder.IsOrder`; AdelicAlgebraicGroups AA.3.3
(the three reduction contracts above); AbelianSchemesAndArithmeticModuli A2.2
`AbelianScheme.dual`, A6.7 `homFreeFinite`, A6.8 `endQ_isSemisimple`;
the arithmetic closed-orbit adapter and
finiteness of integral idempotent conjugacy classes above.

**Checks.**
- For a principally polarized `A`, `(A × A^∨)^4 ≅ A^8`; taking the principal
  `λ` gives `n = deg λ = 1`, the trivial graph kernel and `deg π = 1` in the supplier construction.
- In characteristic `p`, a `k`-polarization `λ` of degree `n` with non-étale `p`-primary
  kernel is included: the supplier uses finite-group-scheme ranks to get graph rank `n^4`
  and the principal quotient, including inseparable kernels.
- For an elliptic curve, `A^∨ ≅ A` and every direct factor of `E^n` is isomorphic to some `E^k` when `End(E) = ℤ`.
- Integral idempotents are essential: in `M₂(ℚ)` the idempotents
  `(1 1/n; 0 0)` have unbounded denominators as `n ≥ 1` varies. Conjugation by `GL₂(ℤ)`
  preserves the least denominator, so they have infinitely many integral-unit orbits.
  Proposition 15.4 applies to idempotents in `End(A)`, not all of `End(A) ⊗ ℚ`.
- The trick is over `k` itself, without extending the field, which is why it removes the polarization in
  R28.5.13 where R28.1.13 would need a field extension.

### R28.5.13 The Shafarevich theorem without polarization

Prove `shafarevich_unpolarized` (Milne, *Abelian varieties*, IV Theorem 1.4, p. 132, and I Corollary 13.13,
p. 61; Deligne, Corollaire 3.3, p. 41): for a number field `K`, a finite set `S` of places and `g ≥ 0`, there are only
finitely many isomorphism classes of abelian varieties of dimension `g` over `K` with good reduction outside `S`.

The statement `shafarevich_unpolarized` uses the same local-model definition
`hasGoodReductionAt` as R28.5.3, for every `g ≥ 0`.

*Proof route.* For such an `A`, `A^∨` has good reduction outside `S` (the dual of an abelian scheme is an abelian
scheme), so `C = (A × A^∨)^4` has good reduction outside `S` and a principal polarization (R28.5.12). Satz 6 with
`d = 1` and dimension `8g` gives finitely many `C`, and each has finitely many direct factors, among them `A`.

*Needs:* R28.5.11, R28.5.12; AbelianSchemesAndArithmeticModuli A2.2 `AbelianScheme.dual`;
NeronModelsAndSemistableAbelianVarieties §5.1.

**Checks.**
- No polarization degree is fixed; a polarization of unbounded degree would not reduce to Satz 6 directly.
- `g = 1`: the statement is Satz 6 with `d = 1` (elliptic curves are canonically principally polarized), Shafarevich's
  theorem for elliptic curves.
- Only isomorphism classes of the varieties are counted; each has finitely many polarizations of a given
  degree up to isomorphism (Milne, I Theorem 15.1, p. 63), which is the converse transfer.

### R28.5.14 The rational Torelli theorem

**Canonical polarization without a curve point.** Obtain the field specialization of the canonical Jacobian polarization:
for a smooth projective geometrically connected curve `C` of genus `g ≥ 1` over a field `k`, the
abelian variety `jacobian C = Pic⁰_{C/k}` of SchemeAndStackFoundations §3.6 has a canonical
principal polarization `θ_C`, compatible with field extension, and equal to the theta
polarization `φ_{O(θ_P)}` of JacobianChallenge Layer E whenever `P ∈ C(k)`.
This is the case `S = Spec(k)` of JacobianChallengePartII §1.4: its `λ_X` for `X = C` is
defined without a degree-one bundle, and its base-change property along `Spec(k′) → Spec(k)`
gives compatibility with field extension. The adapter owned here is the identification of
JacobianChallengePartII §1.2's `J(C/k)` with `jacobian C` as Tau Ceti abelian varieties: both are
the degree-zero component of JacobianChallenge Layer D's Picard scheme, and the identification
respects the group law and the comparisons under field extension. Transport `λ_X` along it.
Sources: Milne, *Abelian varieties*, III Theorem 6.6 and Summary 6.11, pp. 105–108.

**Checks for the field specialization of the canonical Jacobian polarization.**
- If `C(k)` is nonempty, the construction agrees with the supplied pointed polarization
  (the field-fibre clause of JacobianChallengePartII §1.4 for the degree-one divisor `[P]`);
  replacing the point changes theta by translation and preserves the homomorphism.
- The smooth completion of `y² = −(x⁶ + 1)` over `ℚ` has genus two and no real point:
  its affine right side is negative and its two points at infinity require `sqrt(−1)`.
  Its Jacobian still has this principal polarization over `ℚ`.
- For successive field extensions `k ⊆ k' ⊆ k''`, either base-change route gives the same
  homomorphism on `Pic⁰_{C_{k''}/k''}`; a rational point on `C_{k'}` is not required.
- For `g = 1` and a genus-one curve `C` with `C(k) = ∅`, `θ_C` is the principal polarization of
  the elliptic curve `jacobian C`, although `C` carries no theta divisor over `k`.

Prove rational Torelli (Milne, *Abelian varieties*, III Theorem 12.1, p. 120, Corollary 12.2, p. 121, with the
proof in III §13, pp. 122–127, after Martens; IV Theorem 4.2, p. 144): for smooth projective geometrically
connected curves `C, C'` of genus `g ≥ 2` over a perfect field `k`, if the canonically polarized Jacobians
`(J(C), θ_C)` and `(J(C'), θ_{C'})` are isomorphic over `k`, then `C ≅ C'` over `k`. Over an algebraically closed field
the same holds for every genus. Only injectivity of `C ↦ (J(C), θ_C)` on isomorphism classes is used.

*Proof route.* Over `k̄`, AbelianSchemesAndArithmeticModuliPartII B4.1 supplies geometric strong
Torelli (Milne III Theorem 12.1(a), proved in III §13 after Martens): for points `P`, `P′` with Abel
maps `f_P(Q) = [Q − P]`, `f_{P′}` and a polarized isomorphism `β`, there are `α : C_k̄ ≅ C′_k̄`, a sign and `c` with
`f_{P′} ∘ α = ±β ∘ f_P + c`. This target owns the rest.

- *Uniqueness* (Milne III Theorem 12.1(b)). If two triples satisfy the equation with the same sign
  and `α ≠ α′`, then `[α(Q)] + [α′(Q′)]` is linearly equivalent to `[α′(Q)] + [α(Q′)]` for all
  `Q, Q′`; varying the points gives more than one `g¹_2` on `C′`, impossible for `g ≥ 2`. With
  opposite signs, `α(Q) + α′(Q)` moves in a `g¹_2`, so `C′` is hyperelliptic and `α′` is `α`
  followed by the hyperelliptic involution. Thus for non-hyperelliptic curves `(α, ±, c)` is
  determined by `(β, P, P′)`; for hyperelliptic curves fixing the sign `+` determines `α` and `c`.
  With `C = C′`, `β = id`, `P = P′` this says that an automorphism acting trivially on `J` is the
  identity.
- *Base-point independence.* Replacing `(P, P′)` by `(Q, Q′)` translates both Abel maps, so the
  same `α` satisfies the equation with a new constant; by uniqueness `α` depends only on `β`.
- *Descent* (Milne III Corollary 12.2). For `σ ∈ Gal(k̄/k)`, applying `σ` to the equation for
  `(β, P, P′)` gives the equation for `(σβ, σP, σP′) = (β, σP, σP′)` with `σα`, so `σα = α` by
  base-point independence and uniqueness; since `k` is perfect, `α` is defined over `k`.

A non-hyperelliptic curve has no automorphism inducing `−1` on its Jacobian, so there the sign is
determined by `β` and descends with `α`; for hyperelliptic curves it is fixed to `+` first. Over `k̄` with `g ≤ 1` the conclusion holds because
both curves have points: genus-zero curves are `ℙ¹`, and a genus-one curve is its Jacobian.

*Needs:* the field specialization of the canonical Jacobian polarization above; JacobianChallengePartII §1.2 (relative Jacobian
and its field specialization), §1.3 (base change) and §1.4 (canonical principal polarization);
AbelianSchemesAndArithmeticModuliPartII B4.1 (geometric strong Torelli);
SchemeAndStackFoundations §3.6 `jacobian`, `jacobian_dim` and §1.1 (descent); TauCetiRoadmap
JacobianChallenge Layers D–E (Picard representability and the pointed principal polarization);
AbelianSchemesAndArithmeticModuli A6.18 `polarizedAutomorphisms`, A6.20
`homDescentFullLevel`.

**Checks.**
- The hypothesis `g ≥ 2` is needed over a non-closed field (Milne, IV Exercise 4.4, p. 145): a conic without a
  rational point and `ℙ^1` have the same (zero) Jacobian, and a genus-one curve `C` without a rational point and
  its Jacobian `E` are not isomorphic although `J(C) ≅ J(E) = E`.
- Only injectivity is claimed: whether a principally polarized abelian variety over `k` is a Jacobian over `k`
  (the quadratic-twist question for non-hyperelliptic curves) is not part of the statement.
- For hyperelliptic `C` the automorphism `−1` of `J` comes from the hyperelliptic involution, consistent with
  the sign absorption.
- For non-hyperelliptic `C = C′`, `β = [−1]` and `P = P′`, the unique triple is `(id, −, 0)`: no
  automorphism realises the sign `+`, and the descended isomorphism is the identity. For distinct
  base points evaluating at `Q = P` gives the triple `(id, −, [P − P′])`, and `[P − P′] ≠ 0` because a
  principal divisor `P − P′` would give a degree-one map `C → ℙ¹`.

### R28.5.15 Korollar 1 to Satz 6: curves with good reduction outside `S`

Prove `finite_curves_goodReduction` (Faltings 1983, §6, Korollar 1 to Satz 6 and its proof, p. 365; Milne,
*Abelian varieties*, IV Theorem 4.3, p. 144): for a number field `K`, a finite set `S` and `g ≥ 2`, there are only finitely
many isomorphism classes of smooth projective geometrically connected curves of genus `g` over `K` with good
reduction outside `S`.

The statement `finite_curves_goodReduction` uses native schemes over `K`, with genus
expressed as the rank of `H¹(C, O_C)` and good reduction expressed by
`curveHasGoodReductionAt`: a smooth proper model with geometrically connected fibres
over each local ring outside `S`. Smooth proper curves over a field are projective;
no rational-point hypothesis is imposed. The predicate is defined for schemes over `K`;
relative dimension one and the genus bound are separate hypotheses of the theorem.

The API of `curveHasGoodReductionAt` includes:

- A smooth proper model with geometrically connected fibres and an isomorphism
  of its generic fibre to `C` introduces the predicate.
- An isomorphism of schemes over `K`, `C ≅ D`, transports the predicate in both
  directions by composition on the generic fibre.
- For smooth proper curves, a witnessing model has constant genus on the trait;
  no marked point or lower genus bound belongs to this predicate.

**Checks for `curveHasGoodReductionAt`.**

- `ℙ¹_ℤ_(2)` witnesses good reduction of `ℙ¹_ℚ` at `2`, with `H¹(O) = 0` and
  genus `0`. The condition `g ≥ 2` belongs to the finiteness theorem.
- The smooth proper hyperelliptic model of `y² = x⁵ − x + 1` over `ℤ_(5)` has
  genus `2`: modulo `5` the derivative of the right side is `−1`, so the polynomial
  is squarefree. At infinity use `u = 1/x`, `z = y/x³`, giving
  `z² = u − u⁵ + u⁶`; the derivative in `u` at `(0,0)` is `−1`, also a unit.
- The projective model `y² = x³ + x² + 5` has generic discriminant `−11120 ≠ 0`,
  but reduces to `y² = x²(x+1)` modulo `5`. At `(0,0)` both partial derivatives
  vanish and the tangent cone is `(y−x)(y+x)`, with two distinct lines.
  This nodal special fibre makes that candidate fail smoothness, despite its
  smooth generic fibre; it does not by itself test all other possible models.

*Proof route.* `X ↦ (J(X), θ_X)` sends such curves to principally polarized abelian varieties of dimension `g` with
good reduction outside `S` (good reduction of a curve gives good reduction of its Jacobian: Milne, IV
Proposition 4.1, p. 144). Satz 6 with `d = 1` gives finitely many `(J, θ)`, and R28.5.14 makes the map injective on
`K`-isomorphism classes.

*Needs:* R28.5.11, R28.5.14 the field specialization of the canonical Jacobian polarization and rational Torelli;
SchemeAndStackFoundations §3.6 `jacobian`, `jacobian_dim`; NeronModelsAndSemistableAbelianVarieties
§3.8–§3.9 (`PicardNeronIdentity`: for a smooth model the degree-zero Picard scheme is the abelian scheme).

**Checks.**
- Only injectivity of `X ↦ (J(X), θ_X)` on `K`-isomorphism classes is used.
- Good reduction of `X` implies good reduction of `J(X)`; the converse is not used (and is false: a curve with
  stable bad reduction of compact type has a Jacobian with good reduction).
- `g ≥ 2` is needed for R28.5.14.

### Examples

- `K = ℚ`, `S = {2}`, `g = 1`: the elliptic curves over `ℚ` with good reduction outside `2` are the 24 curves of Ogg's list
  (conductors `32`, `64`, `128`, `256`); R28.5.13 predicts finiteness, not the count.
- `K = ℚ`, `S = ∅`, `g ≥ 1`: no abelian variety over `ℚ` has good reduction everywhere (Fontaine, *Il n'y a pas de
  variété abélienne sur ℤ*, Invent. Math. 81 (1985)); the finiteness of R28.5.13 is consistent with,
  but much weaker than, that emptiness.

### Dependencies

Layers R28.1–R28.4; TauCetiRoadmap ClassFieldTheory (Layer 13), GlobalNumberFields (Layer 10), Chebotarev
(Layer 10), JacobianChallenge (Layers D, E); JacobianChallengePartII §§1.2–1.4;
AbelianSchemesAndArithmeticModuliPartII B4.1; AbelianSchemesAndArithmeticModuli A2, A3, A6;
NeronModelsAndSemistableAbelianVarieties Layers 3, 5; ArithmeticGaloisRepresentations Layers 1, 5, 6, 7;
WeightsInEtaleCohomology R34.2; DeligneWeightsAndPurity DWP.0, DWP.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.1; ClassicalArithmeticCompletion §§7.4, 7.21, 7.56; AdelicAlgebraicGroups AA.3.3;
PadicDifferentialEquationsAndRigidCohomology §RD.5.116; Mathlib (polynomials, induced
representations, transfer, cyclotomic fields, semisimple rings, lattices).

## Layer R28.6: Elliptic curves and the integral commutant

This layer states the results for elliptic curves over number fields in terms of Tau Ceti's Weierstrass curves with their homomorphism groups (the zero map and the isogenies), their
Tate modules and their traces of Frobenius `a_v`. It also proves the
integral commutant at almost all primes (Bemerkung 2).

Throughout, `K` is a number field and an elliptic curve over `K` is a Weierstrass curve with nonzero
discriminant (Mathlib `WeierstrassCurve` with `IsElliptic`); `Hom_K(E, E')` is Tau Ceti's group
`TauCeti.Isogeny.Hom` of homomorphisms of Weierstrass curves over `K`.

### R28.6.1 Elliptic curves as one-dimensional abelian varieties

Prove the elliptic-to-abelian comparison (Milne, *Abelian varieties*, I §1, Corollary 1.2, p. 9, and III §6,
Proposition 6.1, p. 104, applied to a pointed genus-one curve; used tacitly by Faltings 1983, §5): for an
elliptic curve `E/K` let `E_ab` be the one-dimensional abelian variety with
`E_ab(L) = E(L)` for every field `L ⊇ K` (the Weierstrass curve as a group scheme). Then

- (i) `Hom_K(E, E') ≅ Hom_K(E_ab, E'_ab)` as groups, compatibly with composition and with degrees (the degree of a
  Tau Ceti isogeny is the rank of the corresponding finite morphism);
- (ii) `T_l(E) ≅ T_l(E_ab)` as `ℤ_l[π]`-modules, compatibly with (i);
- (iii) `E` has good reduction at `v` (some Weierstrass model over `O_v` with unit discriminant) if and only if `E_ab`
  does;
- (iv) the canonical principal polarization `P ↦ [(O) − (P)]` of `E_ab` is preserved by every `K`-isomorphism of
  Weierstrass curves, so `K`-isomorphism classes of elliptic curves are `K`-isomorphism classes of principally
  polarized abelian varieties of dimension one.

*Proof route.* The group-scheme structure and the point identification are those used by
ArithmeticGaloisRepresentations §6.1 for `E_W`. A homomorphism of abelian varieties of dimension one is a morphism of
smooth projective curves preserving `O`, i.e. a Tau Ceti isogeny or zero, and conversely; composition corresponds,
and the degree of the function-field extension is the rank of the finite morphism. (ii) is the comparison of
Tate modules through the points. (iii) compares the Weierstrass scheme with the Néron model. (iv): a variable
change preserves `O`, hence the polarization.

*Needs:* ArithmeticGaloisRepresentations §6.1 “The elliptic comparison”; AbelianSchemesAndArithmeticModuli
A0.2 `fieldAndEllipticBoundary`, A1.6 `relativeEllipticEquivalence`, A6.1 `Hom.deg` (`deg_functionField`);
NeronModelsAndSemistableAbelianVarieties §6.5 `EquationGoodComparison`; Tau Ceti `TauCeti.Isogeny.Hom`
(`Isogeny.Hom.degree`), `AbelianVariety`; Mathlib `WeierstrassCurve`, `WeierstrassCurve.VariableChange`.

**Checks.**
- `[n]` on `E` corresponds to `[n]` on `E_ab`, of degree `n²` on both sides.
- A Frobenius-type inseparable isogeny does not occur in characteristic `0`; over `K` every nonzero element of
  `Hom_K(E, E')` has finite kernel of order its degree.
- For `E = 11a1` and `E' = 11a2`, the generator of `Hom_ℚ(E, E')` has degree `5` on both sides.

### R28.6.2 Semisimplicity of the Tate module of an elliptic curve

Prove `elliptic_semisimple` (Faltings 1983, §5, Satz 3 for `g = 1`, p. 360; Milne, *Abelian varieties*, IV Theorem
1.2, p. 131): for an elliptic curve `E/K` and a prime `l`, `V_l(E)` is a semisimple `ℚ_l[π]`-module: irreducible, or the
sum of two `π`-stable lines. Use `ellipticRationalRepresentation` for the scalar extension
of `WeierstrassCurve.tateModuleGaloisRepresentation` to
`ℚ_l ⊗_{ℤ_l} TauCeti.TateModule l (E⁄K̄).toAffine.Point`, with `K̄ = AlgebraicClosure K`.

*Proof route.* Transport R28.4.5 along R28.6.1; a semisimple two-dimensional representation is irreducible or a
sum of two lines.

*Needs:* R28.4.5, R28.6.1; TauCetiRoadmap EllipticCurves Layer 2 (the Tate module of a Weierstrass curve);
Mathlib `IsSemisimpleModule`.

**Checks.**
- `ellipticRationalRepresentation W l` has `ℚ_l`-dimension `2`, using
  `WeierstrassCurve.finrank_tateModule` on the geometric points over `K̄`.
  The Weil pairing gives determinant `χ_0`; for `K = ℚ`, complex conjugation has eigenvalues
  `1, −1`, including for `l = 2`, so the determinant character is nontrivial.
  The map `x ↦ 1 ⊗ x` identifies the integral Tate module with a stable lattice, and the
  restricted action is `WeierstrassCurve.tateModuleGaloisRepresentation` on the geometric points.
- For `E/ℚ` without complex multiplication, `V_l(E)` is irreducible for every `l`, even when `E[l]` is reducible (for
  `11a1` and `l = 5`): a stable line in `V_l(E)` would give infinitely many cyclic isogenies of `l`-power degree,
  contradicting the finiteness of the isogeny class (R28.6.5).
- For `y² = x³ − x` over `K = ℚ(i)` and `l ≡ 1 (mod 4)`, `V_l(E)` is a sum of two characters; for `l ≡ 3 (mod 4)` it is
  irreducible over `ℚ_l` (the CM field is inert at `l`) and splits only over `ℚ_{l²}`.
- The statement is about `V_l(E)`, not `E[l]`: `E[l]` may be reducible and non-semisimple.

### R28.6.3 The Tate Hom comparison for elliptic curves

Prove `elliptic_tate_hom_iso` (Faltings 1983, §5, Korollar 1 for `g = 1`, p. 361): for elliptic curves `E, E'` over
`K` and a prime `l`, `Hom_K(E, E') ⊗_ℤ ℤ_l → Hom_π(T_l(E), T_l(E'))` is an isomorphism, and so is its `ℚ_l`-form.

*Proof route.* Transport R28.4.6 along R28.6.1.

*Needs:* R28.4.6, R28.6.1; TauCetiRoadmap EllipticCurves Layer 2.

**Checks.**
- `E = E'` over `ℚ`: `End_ℚ(E) = ℤ`, so `End_π(T_l(E)) = ℤ_l`, curves with complex multiplication included.
- `11a1` and `11a3` over `ℚ` (linked by a 5-isogeny): both sides are free of rank one over `ℤ_l`.
- `37a1` and `37b1` over `ℚ`: both sides vanish.

### R28.6.4 The isogeny criterion for elliptic curves

Prove `elliptic_isogenous_iff_ap` (Faltings 1983, §5, Korollar 2 for `g = 1`, p. 361): elliptic curves `E, E'` over `K`
are `K`-isogenous if and only if `V_l(E) ≅ V_l(E')` as `π`-modules for one (equivalently every) prime `l`, if and only
if `a_v(E) = a_v(E')` for almost all places `v` of good reduction of both.
The equivalence with rational Tate representations at each prime `l` is
`elliptic_isogenous_iff_rationalTateModule`.

The statement `elliptic_isogenous_iff_ap` compares the degree-one coefficients of
Mathlib's `WeierstrassCurve.localPolynomial` outside a finite set of finite places.
At good places this coefficient is `−a_v`, so its equality is exactly equality of
Frobenius traces; the finite bad sets do not change the almost-all-places condition.

*Proof route.* Transport R28.4.7 along R28.6.1; at a place of good reduction `L_v(E, s)^{−1} = 1 − a_v Nv^{−s} + Nv^{1−2s}`, so
equality of local factors is equality of `a_v`.

*Needs:* R28.4.7, R28.6.1; TauCetiRoadmap EllipticCurves Layer 4 (reduction and `a_v`); ArithmeticGaloisRepresentations
§6.1, “The elliptic comparison” (trace and determinant).

**Checks.**
- `11a1`, `11a2`, `11a3` are isogenous over `ℚ` and share `a_2 = −2`, `a_3 = −1`, `a_5 = 1`, `a_7 = −2`.
- `37a1` and `37b1` share `a_7 = −1` but have `a_2 = −2` and `0`: agreement at finitely many primes is not enough.
- Over `K = ℚ`: a quadratic twist `E^D` of `E` without complex multiplication (`D` not a square) is not isogenous to
  `E`, and `a_p(E^D) = −a_p(E)` at the primes `p` of good reduction inert in `ℚ(√D)`.

### R28.6.5 Finiteness of the isogeny class of an elliptic curve

Prove `finite_ellipticIsogenyClass` (Faltings 1983, §6, Satz 6 for `g = 1`, `d = 1`, p. 363; Milne, *Abelian
varieties*, IV Theorem 1.1, p. 131): for an elliptic curve `E/K`, only finitely many elliptic curves over `K` up to
`K`-isomorphism are `K`-isogenous to `E`.

*Proof route.* Let `S` be the places of bad reduction of `E`. A curve `E'` isogenous to `E` has `V_l(E') ≅ V_l(E)` for all
`l`, hence good reduction outside `S` (Néron–Ogg–Shafarevich). By R28.6.1 the `E'` are principally polarized abelian
varieties of dimension one with good reduction outside `S`, and Satz 6 gives finitely many `K`-isomorphism classes.

*Needs:* R28.5.11, R28.6.1; NeronModelsAndSemistableAbelianVarieties §5.1, §5.2; TauCetiRoadmap EllipticCurves
Layer 4.

**Checks.**
- `E = 11a1` over `ℚ`: the `ℚ`-isogeny class consists of exactly three `ℚ`-isomorphism classes, `11a1`, `11a2`, `11a3`.
- The count is of `K`-isomorphism classes; quadratic twists of `E` are in general not isogenous to `E` and are not
  counted.
- Consequence: with R28.6.6 (applicable because `End_ℚ(E') = ℤ` for every elliptic curve over `ℚ`), an elliptic curve
  over `ℚ` has rational cyclic isogenies of only finitely many prime degrees (each prime degree gives a member of the finite class, and a member is reached by
  isogenies of finitely many cyclic degrees).

### R28.6.6 Homomorphisms to an isogenous curve form an infinite cyclic group

Prove the cyclic Hom theorem: for elliptic curves `E, E'` over a field `K` of characteristic `0` with
`Hom_K(E, E') ≠ 0` and `End_K(E') = ℤ` (every endomorphism is multiplication by an integer), `Hom_K(E, E')` is infinite
cyclic: it has a nonzero generator `f_0`, and each `f` has a unique expression `n·f_0` for `n ∈ ℤ`.
Every nonzero `f` has `n ≠ 0`, and `deg f = n²·deg f_0`. No finiteness or
number-field hypothesis is needed (Milne, *Abelian varieties*, I Theorem 10.15, p. 49, for the general finite
generation).

*Proof route.* Fix a nonzero `ψ ∈ Hom_K(E', E)` (the dual of a nonzero element of `Hom_K(E, E')`). Then `f ↦ f ∘ ψ` is an
injective additive map `Hom_K(E, E') → End_K(E') = ℤ`, so its image is a nonzero subgroup of `ℤ`, infinite cyclic;
`deg(n·f_0) = n²·deg f_0`.

*Needs:* TauCetiRoadmap EllipticCurves Layer 1 (the dual isogeny over `K`); Tau Ceti `TauCeti.Isogeny.Hom`
(`Isogeny.Hom.add_comp`, `Isogeny.Hom.comp_eq_zero_iff`, `Isogeny.Hom.degree_zsmul`).

**Checks.**
- `E = E' = 11a1` over `ℚ`: `Hom = ℤ` generated by the identity, and `deg[n] = n²`.
- `11a1` and `11a2` over `ℚ`: the nonzero homomorphisms have degrees `5n²`; a generator is a 5-isogeny.
- The hypothesis `End_K(E') = ℤ` is needed: over `K = ℚ(i)`, `y² = x³ − x` has `End_K = ℤ[i]`, of rank two.

### R28.6.7 Bemerkung 2: the integral commutant at almost all primes

Prove integral commutant generation at almost all primes (Faltings 1983, §6, Bemerkung 2 after Satz 7, p. 365; Deligne, *Preuve des
conjectures de Tate et de Shafarevitch*, Théorème 2.7, p. 39): for an abelian variety `A` over a number field `K`, for
all but finitely many primes `l` the `ℤ_l`-subalgebra of `End_{ℤ_l}(T_l(A))` generated by the image of `π` is the full
commutant of `End_K(A) ⊗ ℤ_l`. Both sources state the result and indicate the method (Zarhin's) without writing it
out; the rational analogue for every `l` follows from R28.4.5 by the double centralizer theorem (Milne, *Abelian
varieties*, IV Corollary 2.7, p. 138).

*Proof route.* Use R28.5.13 and isogeny invariance of good reduction to choose finitely
many representatives `B_j` of the `K`-isogeny class of `A`, with fixed `K`-isogenies
`β_j : A → B_j`. No extension of `K` or polarization of an arbitrary quotient is required.
Construct the quotient torsion-image identity: for a prime `l`, a `π`-stable `W ⊆ A[l]`,
`q : A → A/W` and `f : A/W → A` with `f q = [l]`, the image of
`f : (A/W)[l] → A[l]` is `W`. If `β : A → A/W` has degree prime to `l`, then
`im((f β) mod l) = W`. Indeed `q f = [l]` as well; lifting an element of `(A/W)[l]`
through `q` shows its `f`-image lies in `W`, and divisibility by `l` over `K̄` gives the
reverse inclusion. The prime-to-`l` isogeny `β` is an isomorphism on `l`-torsion.
This auxiliary uses quotient factorization (Milne, I Remark 8.6, p. 36,
and IV Lemma 2.3, p. 136) and the finite torsion sequence of an isogeny.

Exclude primes dividing any `deg β_j`. Identify `A/W` with a `B_j`; the auxiliary
shows that every stable subspace is the image of an element of `E_l = End_K(A) ⊗ 𝔽_l`.
Exclude also the finitely many primes for which this algebra is not semisimple, by
clearing denominators of a separability element in `End_K(A) ⊗ ℚ`.
The torsion-free cokernel in A6.7 makes the action of `E_l` on `A[l]` faithful.
For an element `u` with image `W`, its right ideal `u E_l = e E_l` is generated by an
idempotent and `im(e) = im(u)`. Thus stable subspaces have stable complements.
Apply the same finite-representative argument to `A × A`, excluding its finite exceptional
set too. Stable graphs in `A[l] ⊕ A[l]`, with the matrix identification
`End_K(A × A) ⊗ 𝔽_l = M₂(E_l)`, then give `End_π(A[l]) = E_l`:
if an idempotent matrix has image the graph of a `π`-equivariant `t`, its first-row
entries generate the unit right ideal in the semisimple faithful algebra `E_l`, so a
right linear combination equal to `1` expresses `t` as the same combination of its
second-row entries. The double centralizer theorem now identifies the `𝔽_l`-span
of `π` with the commutant of `E_l`.

The commutant of `End_K(A) ⊗ ℤ_l` in `End(T_l(A))` reduces onto that of `End_K(A) ⊗ 𝔽_l` for
almost all `l` by the following named auxiliary statement, the centralizer base-change identity. For a
finite free separable `ℤ_l`-algebra `O` acting on a finite free module `T`,
`Cent_End(T)(O) ⊗ 𝔽_l ≅ Cent_End(T/lT)(O/lO)`. A separability element
`Σ a_j ⊗ b_j` gives the projector `f ↦ Σ a_j f b_j` onto the centralizer, commuting with base change.
A finite free `ℤ`-order whose rational algebra is semisimple admits such an element after
inverting a fixed integer (clear its denominators), so this applies to `End_K(A)` for almost all
`l`. This auxiliary follows from separability and the displayed projector, not from saturation
of the Tate map alone. Nakayama then lifts the generation from
`𝔽_l` to `ℤ_l`.

*Needs:* R28.4.5, R28.5.13; the quotient torsion-image identity above;
AbelianSchemesAndArithmeticModuli A3.3 `AbelianQuotient`, A6.1 `Hom.deg`,
A6.8 (endomorphisms of products); ArithmeticGaloisRepresentations §6.1
(the torsion maps of isogenies); AbelianSchemesAndArithmeticModuli A6.7
`homFreeFinite`, A6.8 `endQ_isSemisimple`; TauCetiRoadmap RepresentationTheory/SemisimpleAlgebras
Layers 2 and 6 (Wedderburn decomposition and separable splitting fields, giving separability in
characteristic zero); Tau Ceti
`AlgHom.centralizer_centralizer_range`; Mathlib Nakayama
(`Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`).

**Checks.**
- The quotient torsion-image identity with `W = 0` gives `f = [l]` and zero torsion image;
  with `W = A[l]` one may take `q = [l]`, `f = id`, and the image is all `A[l]`.
- For a positive-dimensional principally polarized `A` and `W = A[l]`, the polarization
  `lλ` cannot descend through `[l]`: the degree formula would give `l^{−2g}`. The
  quotient argument uses no such polarization; `l²λ` would have different descent data.
- With a `β_j` of degree divisible by `l`, its torsion map need not be invertible, so
  `im(f β_j)` need not equal `W`; these primes are excluded explicitly.
- The centralizer base-change identity needs separability.
  Let `O = ℤ_l[ε]/(ε²)` act on `ℤ_l²`
  by `ε = lE₁₂`. Its integral centralizer consists of `(a b; 0 a)`, whereas modulo `l`
  the action of `ε` is zero and the centralizer is all `M₂(𝔽_l)`. Saturation of an
  unrelated Tate map cannot give the missing reduction theorem.
- The assertion is integral (over `ℤ_l`) and for almost all `l`; it differs from Satz 4, which identifies the commutant of
  the image of `π` with `End_K(A) ⊗ ℤ_l` for every `l`, by describing the algebra generated by `π`.
- For an elliptic curve `E/ℚ` without complex multiplication it says that the image of `π` generates `M_2(ℤ_l)` for almost
  all `l`, so `E[l]` is an irreducible `𝔽_l[π]`-module for almost all `l`.
- For `E/ℚ : y² = x³ − x` and `l` unramified in `ℚ(i)`, the image of `π` lies in the normalizer of a Cartan
  subgroup and generates `M_2(ℤ_l)` for almost all `l`: for `l` split the diagonal and anti-diagonal matrices span `M_2(ℤ_l)`, for `l`
  inert `ℤ_{l²} ⊕ ℤ_{l²}·j = End_{ℤ_l}(ℤ_{l²})`.

### Examples

- For `E = 11a1`, R28.6.5 and R28.6.6 together: the `ℚ`-isogeny class has three members, `Hom_ℚ(11a1, 11a2) = ℤ·φ` with `φ` of
  degree `5`, and `Hom_ℚ(11a2, 11a3) = ℤ·ψ` with `ψ` of degree `25`.
- For `E = 37a1`, `End_ℚ(E) = ℤ` and `V_l(E)` is irreducible for every `l`; the isogeny class of `37a1` has one member.

### Dependencies

Layers R28.4 and R28.5; TauCetiRoadmap EllipticCurves (Layers 1, 2, 4); Tau Ceti homomorphisms of Weierstrass
curves; AbelianSchemesAndArithmeticModuli A0, A1, A6; ArithmeticGaloisRepresentations Layer 6;
NeronModelsAndSemistableAbelianVarieties Layers 5, 6; Mathlib Weierstrass
curves and semisimple modules.

## Worked example: the Parshin application

Let `X/K` be smooth projective and geometrically connected of genus at least two.
The application of R28.5.15 assumes the following geometric inputs: one finite extension `K_1/K`,
a finite bad set `S_1`, and a genus bound `b`, all independent of `x ∈ X(K)`, with smooth projective
geometrically connected `Y(x)/K_1` of genus between `2` and `b`, good outside `S_1`, and finite maps
`Y(x) → X_{K_1}` whose branch locus is exactly `{x}`; and finiteness of nonconstant maps
`Y → X_{K_1}` for each fixed smooth projective `Y/K_1`. These are the Kodaira–Parshin covering
input and de Franchis input (Milne, IV Theorems 5.1–5.2, pp. 145–146). Under these hypotheses
R28.5.15 makes `X(K)` finite. This is the application in Faltings 1983, §6, Satz 7, p. 365,
rather than an additional unconditional rational-point target.

Parshin's construction attaches to each `x ∈ X(K)`, over a finite extension `K_1` independent of `x`, a
curve `Y(x)` with good reduction outside a finite set independent of `x` and a finite map `Y(x) → X_{K_1}` ramified
exactly over `x`; by R28.5.15 the `Y(x)` lie in finitely many isomorphism classes, and by de Franchis' theorem each
admits finitely many non-constant maps to `X`, so finitely many `x` occur. In Faltings' version: after a field
extension there is an unramified covering `φ : X_1 → X` of degree `k > 2`; Lemma 4 makes the fibres `φ^{−1}(x)` split
over a fixed `K_1`; for `y ∈ φ^{−1}(x)` and `D = φ^{−1}(x) − {y}`, doubling on the generalized Jacobian of `(X_1, D)` gives a
covering `Y(x) → X_1` ramified exactly over `D`, with bad reduction only above `2`, at the bad places of `X_1`, and
where `φ` ramifies modulo `v`. Faltings refers to Parshin for the details and uses tacitly that `Y(x)` has genus at
least `2`, de Franchis' theorem, and a field of definition of `Y(x)` independent of `x`;
these are precisely the geometric inputs specified above.

**Checks.** The covering has degree `k > 2`, so deleting one point of a split fibre leaves at least
two branch points. Degree `2` would leave an unramified cover in this construction. The bad set
and field of definition are independent of the rational point; the stated de Franchis hypothesis
then bounds the fibres of the map to curve isomorphism classes.

## Downstream consumers

- *EllipticCurveModularity* (R29.1) uses the elliptic exports of Layer R28.6 — semisimplicity, the Tate Hom
  comparison, the isogeny criterion by `a_p`, the finiteness of the isogeny class and the rank-one Hom lemma —
  to show that an elliptic curve over `ℚ` has rational cyclic isogenies of only finitely many prime degrees,
  with complex multiplication allowed.
- *EllipticCurveModularityPartIIGL2TypeAbelianVarieties* uses Satz 3 and Satz 4 (R28.4.5), the isogeny criterion
  (R28.4.7), the description of `l`-adic characters of `Gal(ℚ̄/ℚ)` (R28.2.6), the elliptic exports and the
  integral commutant at almost all primes (R28.6.7).
- *HeightsRationalPointsAndObstructions* (RP.4) takes the finiteness of curves with good reduction outside `S`
  (R28.5.15) as the hypothesis of its Parshin implication.
- *SmallRamificationAndAbelianVarietyBaseCases*, *HeegnerPointEulerSystems*, *MotivesAndAlgebraicCycles*,
  *EllipticModularityEffectiveComparisons* and *AbelianVarietiesIsogenousToNoJacobian* use the Tate conjecture and
  its corollaries (Layer R28.4).
- *MordellLawrenceVenkatesh* uses Hermite–Minkowski with prescribed ramification (R28.1.9), and the
  finiteness of Weil polynomials and the Frobenius test set in the generality of R28.5.1 and R28.5.2.

## References

- P. Deligne and D. Mumford, *The irreducibility of the space of curves of given genus*,
  Publications Mathématiques de l’IHÉS 36 (1969), 75–109, Theorem 4.19, p. 103
  (finite-extension valuative existence for proper DM stacks).
  [Numdam archive](https://www.numdam.org/item/PMIHES_1969__36__75_0/).

- Yuri G. Zarhin, *Abelian varieties, quaternion trick and endomorphisms*,
  arXiv:2010.07995v5 (2022), Theorem 1.1(ii), p. 2, and §4, pp. 4–5.
  [Author's preprint](https://arxiv.org/abs/2010.07995).

- G. Faltings, *Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, Invent. Math. 73 (1983),
  349–366. Göttinger Digitalisierungszentrum scan:
  https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0073/LOG_0026.pdf (printed pages 349–366; the
  PDF has a cover sheet, so PDF page = printed page − 347). Cited as Faltings 1983, by section, numbered
  statement and page; the note added in proof is on p. 366.
- G. Faltings, *Erratum: Endlichkeitssätze für abelsche Varietäten über Zahlkörpern*, Invent. Math. 75
  (1984), 381, https://doi.org/10.1007/BF01388572. Cited as Faltings 1984, parts a) and b).
- G. Faltings, *Arakelov's theorem for abelian varieties*, Invent. Math. 73 (1983), 337–347 (same volume of the
  Göttingen scan); §2 holds the full proof of R28.1.7.
- P. Deligne, *Preuve des conjectures de Tate et de Shafarevitch (d'après G. Faltings)*, Séminaire Bourbaki
  exposé 616, Astérisque 121–122 (1985), 25–41, http://www.numdam.org/item/SB_1983-1984__26__25_0/ (printed page
  = PDF page + 23). Théorème 2.7 (p. 39), Corollaire 2.8, Théorème 3.1 (p. 40), Corollaires 3.2–3.3 (p. 41).
- J. S. Milne, *Abelian varieties*, course notes v2.00 (2008), https://www.jmilne.org/math/CourseNotes/AV.pdf
  (printed page = PDF page − 6). Chapter I §§10, 13, 15 (pp. 49, 58–61, 63–65); Chapter III §§12–13 (Torelli,
  pp. 120–127); Chapter IV §§1–5 (pp. 131–146), including an account of Faltings' paper (pp. 159–160).
- J. Tate, *p-divisible groups*, in Proceedings of a Conference on Local Fields (Driebergen 1966), Springer
  1967, 158–183; Proposition 2 ((2.2), pp. 164–165) and Proposition 12 with its proof ((4.2), pp. 181–182).
- M. Raynaud, *Schémas en groupes de type (p, …, p)*, Bull. Soc. Math. France 102 (1974), 241–280,
  https://www.numdam.org/item/BSMF_1974__102__241_0/; §4, Théorème 4.1.1 (p. 272), appendix Définition 8 (p. 279).
- A. Grothendieck, *Modèles de Néron et monodromie*, SGA 7 I, Exposé IX, Lecture Notes in Math. 288 (1972),
  7.3–7.4 (pp. 407–409).
- G. Faltings and C.-L. Chai, *Degeneration of abelian varieties*, Springer (1990),
  Chapter V, Definition 4.2 and Remark 4.3, p. 167; Propositions 4.4–4.5, pp. 168–169.
- S. L. Kleiman, *The Picard scheme*, arXiv:math/0504020v1 (2005); Theorem 5.11 (p. 42, the tangent space of
  `Pic_{X/k}` at `0` is `H^1(O_X)`) and Remark 5.12 (p. 44, the relative form `R^1 f_*O_X`).
- C.-F. Yu, *On the existence of maximal orders*, arXiv:1105.2897; Theorem 1.1 (p. 1) and Theorem 4.8 (pp. 13–14),
  after I. Reiner, *Maximal orders*, Academic Press 1975.
- H. H. Martens, *A new proof of Torelli's theorem*, Ann. of Math. 78 (1963), 107–111 (the proof Milne follows in
  *Abelian varieties*, III §13).
- A. P. Ogg, *Abelian curves of 2-power conductor*, Proc. Cambridge Philos. Soc. 62 (1966), 143–148.
- J.-M. Fontaine, *Il n'y a pas de variété abélienne sur ℤ*, Invent. Math. 81 (1985), 515–538.
- D. Mumford, *Abelian varieties*, Tata Institute / Oxford University Press (1970), §23 (descent of
  polarizations along isotropic subgroups).
