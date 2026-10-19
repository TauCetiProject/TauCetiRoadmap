# Roadmap: modular symbols and analytic p-adic L-functions of modular forms

**Summary.** This roadmap builds the cohomological (Hom-side) theory of modular symbols with
arbitrary coefficients and uses it to construct the analytic p-adic L-function of a modular form.
It starts from the degree-zero divisors on the cusps, the homological symbols and the period map
that Tau Ceti's ModularForms roadmap supplies (Layer 8). It then builds equivariant symbols, boundary
symbols, parabolic cohomology, Hecke, diamond and sign operators, the cohomological
Eichler–Shimura isomorphism, and the rational Drinfeld–Manin splitting. From there it defines signed
period lines and saturated integral periods, and proves the twisted Mellin formula with algebraicity
of critical values. On the p-adic side it builds distribution-valued (overconvergent) symbols with
the weight-`k` action, proves Stevens' control theorem in small slope (Pollack–Stevens), and constructs
the p-adic L-function of a refinement of slope less than `k + 1`, with interpolation and uniqueness.
It also covers the integral ordinary measure, the critical-slope p-adic L-function of a
non-`θ`-critical refinement, Pollack's half-logarithms and signed p-adic L-functions at supersingular
primes with `a_p = 0`, tame twists, Euler depletion, coefficient embeddings and the worked examples of
level 11. We want it because modular symbols are the standard route to the p-adic L-function of a
single eigenform of weight at least two, and to its integral and critical-slope refinements: the
Iwasawa main conjecture for modular forms, p-adic Birch–Swinnerton-Dyer, the comparison with Kato's
Euler system and the families of the PadicFamilies roadmap all take it as input.

The central object is the module `Symb_Γ(V) = Hom_{ℤ[Γ]}(Δ₀, V)` of `Γ`-equivariant maps from the
degree-zero divisors on `P¹(ℚ)` to a coefficient module `V`. It is built integrally, with no
invertibility hypothesis, so it accepts every coefficient module the construction needs:
homogeneous polynomials `V_k(R)` over any ring, Dirichlet-twisted modules, and spaces of p-adic
distributions with the weight-`k` action of the monoid `Σ₀(p)`. The end theorems are:

- the Eichler–Shimura isomorphism `S_{k+2}(Γ) ⊕ S̄_{k+2}(Γ) ≅ H¹_par(Γ, V_k(ℂ))` in its Hecke-, diamond- and
  sign-equivariant form, with one-dimensional signed newform eigenspaces over the coefficient
  field (Layer 0);
- the algebraicity of the twisted critical values `L(f, χ̄, j + 1), 0 ≤ j ≤ k`, divided by the signed
  period selected by the parity `(−1)^{k−j}χ(−1)` (Layer 1);
- Stevens' control theorem in slope below `k + 1`, and the existence, interpolation formula and
  uniqueness of the p-adic L-function `L_p(f, α)` of a refinement of slope `h < k + 1`, with its
  integral ordinary form (Layer 2);
- the critical-slope L-function of a non-`θ`-critical refinement, normalised by its eigenlift, and the
  family comparison principle that replaces interpolation at critical slope (Layer 3);
- Pollack's decomposition `L_p(f, α) = L⁺_p·log⁺_p + L⁻_p·log⁻_p·α` at a supersingular prime with
  `a_p = 0`, into Iwasawa functions `L^±_p`, and the Euler-depletion and coefficient-transport identities
  of normalised p-adic L-functions (Layer 4).

The mathematical assertions below are targets for formalisation; the existing library inputs are
named in the `*Needs:*` annotations. Each definition and construction states its API and its Checks.
The companion [Suggested.lean](Suggested.lean), in the namespace
`TauCetiRoadmap.ModularSymbolsPadicLFunctions`, prototypes the light definitions whose carriers exist
at the pinned libraries and the milestone theorems that can be stated against them. A target that
ends with a `*Lean:*` line is carried by the declarations listed there. Proved `example`s test selected
definitions; the Checks below also specify cases without a Lean counterpart.

## Scope and ownership

This roadmap owns:

- Manin's presentation `Δ₀ ≅ ℤ[PSL₂(ℤ)]/I` and the Hom-side modular symbols `Symb_Γ(V)` for every
  finite-index `Γ ≤ SL₂(ℤ)` and every coefficient module, with their presentations (coset values, the
  fundamental-domain presentation over `ℤ[Γ]` and its generators), flat base change,
  boundary symbols, Eisenstein symbols, the connecting map to `H¹(Γ, V)`, parabolic cohomology, the
  integral boundary exact sequence and descent along normal subgroups;
- the operators on Hom-side symbols: the monoid `Σ₀(N)`, the Hecke operators `T_ℓ` and `U_q` at levels
  `Γ₀(N)` and `Γ₁(N)`, the diamond operators, the involution `ι = diag(−1, 1)` and the sign decomposition,
  symbols with character and the character decomposition;
- the duality between Hom-side symbols and the homological module `𝕄` of ModularForms Layer 8, the
  invariant pairing between `V_k` and `Sym^k`, the period symbol `ψ_f`, the dimension of parabolic
  cohomology for torsion-free `Γ`, Petersson detection of period cocycles, the cohomological
  Eichler–Shimura isomorphism, the separation of cuspidal from Eisenstein good-Hecke eigensystems and
  the one-dimensionality of signed newform eigenspaces;
- the rational spectral separation of parabolic and boundary Hecke supports at full level `Γ(N)` and
  the rational Drinfeld–Manin retraction `H¹(Γ(N), V_k(ℚ)) → H¹_par(Γ(N), V_k(ℚ))`;
- signed period lines, saturated integral period lattices, the twisted Mellin formula, algebraicity
  of critical values, the `p`-stabilised L-function comparison and the dictionary between the
  interpolation normalisations in the literature;
- `p`-stabilisations, refinements and refined eigenlines; the radius-indexed spaces of analytic
  functions and distributions on `ℤ_p` in Pollack–Stevens' normalisation with the weight-`k` action of
  `Σ₀(p)`; specialisation; overconvergent lifting; the slope decomposition of the fibre of
  specialisation; Stevens' control theorem; admissibility of eigensymbol values; the p-adic
  L-function of a small-slope refinement with interpolation and uniqueness; the integral ordinary
  measure;
- the single-form critical-slope theory: the non-`θ`-critical L-function, its interpolation, the
  failure of uniqueness, the `θ`-critical comparison, the family comparison principle and the
  critical-slope examples of Pollack–Stevens;
- tame twists, the identification of the supplied two Euler factors at `p`, both refinements at a
  supersingular prime and their zeros, Pollack's half-logarithms, the `±` decomposition at `a_p = 0`, coefficient embeddings,
  Euler depletion, the exclusion of a zero `U_p`-eigenvalue, and the level-11 examples.

It leaves to other roadmaps, and cites:

- **Tau Ceti's ModularForms roadmap.** Layer 0 (Eisenstein series with character, their
  q-expansions and the cusp–Eisenstein decomposition), Layer 4 (newforms, primitive forms, old and new
  spaces, the bad-prime `U_p`-eigenvalue), Layer 5 (strong multiplicity one and the characterisation of
  normalised eigenforms by their coefficients), Layer 7 (`L(f, s)`, twisted L-series, the Mellin
  transform and the entire extension of L-functions of cusp forms), Layer 8 (`Div⁰(P¹(ℚ))` with its
  `GL₂⁺(ℚ)`-action, its generation by unimodular divisors and the two- and three-term Manin relations,
  the homological symbol module `𝕄 = (Div⁰ ⊗ Sym^{k})_{Γ₁(N)}` with its Hecke operators, the period map
  and its injectivity), Layer 8G (the coefficient field,
  Galois stability and the conjugate newform `f^σ`) and Layer 10C (the dimension formulas, with the
  regular/irregular cusp distinction in odd weight). Layer 8 deliberately builds `𝕄` homologically and
  keeps group cohomology out; this roadmap is where group cohomology, parabolic cohomology and the
  Eichler–Shimura isomorphism enter. Layer 8 presents `𝕄` through Manin symbols but states neither the
  full kernel of Manin's map `ℤ[PSL₂(ℤ)] → Div⁰` nor the fundamental-domain presentation of `Div⁰` over `ℤ[Γ]`
  for general `Γ`, and Layer 5 does not separate cuspidal from Eisenstein eigensystems; these are
  targets of §0.2 and §0.7 here. In the pinned Tau Ceti library (`a91d3aaf`) the following
  Layer-8 material already exists and is imported, never rebuilt here:
  `TauCeti.ModularSymbols.degreeZero`, `divisorRep`, `degreeZeroGLRep`, `degreeZeroRep` and
  `degreeZero_eq_span_unimodular` (the divisor modules, their actions and their generation by
  unimodular divisors), `TauCeti.ModularSymbols` (the homological module, with `symbol`,
  `maninSymbol`, `span_maninSymbol_eq_top` and the Manin relations `maninSymbol_mul_S` and
  `maninSymbol_add_mul_T_mul_S_add_mul_T_mul_S_sq`), `heckeSymbol` and
  `heckeTSymbol` (Hecke operators on `𝕄`), `rawPairing`, `periodMap` and `periodMap_injective`, and
  the binary-form actions `TauCeti.binaryFormRep` `(P ↦ P(aX + bY, cX + dY))`,
  `TauCeti.binaryFormAdjugateRep`, `TauCeti.binaryFormDual` and `TauCeti.linearFormPow`
  (`TauCeti/NumberTheory/ModularForms/{ModularSymbols,BinaryForms}`), together with
  `TauCeti.cuspIntegral` and `Matrix.GeneralLinearGroup.geodesicIntegral` (integrals between cusps).
  The level-one period polynomials `TauCeti.periodPolynomial` with `periodPolynomial_injective`
  are the level-one homological counterpart of the period symbol of §0.7 and are cited as such.
  ModularForms Layer 11 states the level-one isomorphism `M_{k+2} ⊕ S_{k+2} ≅ W_k` onto the space `W_k` of
  period polynomials of degree `k` (Convention 1) by a dimension count (pinned Tau Ceti
  `periodPolynomials` and `finrank_periodPolynomials_eq_finrank_modularForm_add_finrank_cuspForm`); the
  Eichler–Shimura isomorphism of §0.7 differs from it in being cohomological (`S ⊕ S̄ ≅ H¹_par`, with the
  conjugate summand) and in holding for every finite-index `Γ` with its Hecke, diamond and sign actions.
- **LocallyAnalyticDistributions.** Layer 0 (closed-disc analytic functions `discAnalytic`, the
  stages `LA_h(ℤ_p)`, locally analytic functions and distributions `D(ℤ_p)`, inductive and projective
  locally convex limits, compact restriction to a smaller radius), Layer 2 (distributions of order `r`,
  that is `h`-admissible distributions, with the Amice–Vélu–Višik extension and uniqueness theorem and
  its strict threshold), and Layer 4 (complete continuity, Fredholm series, Riesz projectors and
  slope decompositions).
- **PadicMeasuresIwasawaAlgebras.** Bounded measures on `ℤ_p^×` and on `ℤ_{p,M}^×`, the Iwasawa algebra
  `𝒪⟦ℤ_p^×⟧` and its identification with bounded power series on each branch, and the `μ`- and
  `λ`-invariants of an Iwasawa function.
- **ModularCurvesPartII**, §§14.1–14.4a (geometric coefficient systems, parabolic
  images and finite/adic Betti–étale comparison), §14.8 (Hecke operators with relative
  coefficients), §14.11 (the pairing with its coefficient dual and Tate twist) and §14.12
  (the homological modular-symbol/geodesic comparison). Its full symbol module is relative
  homology with the dual coefficient system; the Hom-side compact-support comparison is
  the adapter of §0.6 here.
- **AlgebraicModularFormsAndSerreWeights**, R15.5A.2 (Classical eigenforms of weight at least
  two), for the representation attached to `f` in the decency condition of §3.0;
  **ArithmeticGaloisRepresentations**, §7.2 (Adjoint, trace pairing and Schur's lemma), for its full endomorphism
  representation; **SelmerIwasawaCohomology**, §§2.1–2.2 (Selmer data and kernel), and
  **PadicPeriodRings**, §1.5 (The topological de Rham period rings), for that condition's
  unramified and de Rham local kernels.

AutomorphicLFunctionsAndLocalFactors AL.5 supplies the complex stabilisation coefficients,
their `U_p` recurrence and L-series identity, and the refined `GL₂` interpolation factor and its
ramified and unramified specialisations. ArithmeticLocallySymmetricSpaces §ALS.3.1 supplies
the derived Hecke action used by the cohomological adapter of §0.4.

Global ordinary and Coleman–Mazur families belong to PadicFamilies. The local
finite-slope eigensymbol charts needed for critical specialisation are §3.0 here.
Kato's Euler system and explicit reciprocity law belong to KatoEulerSystems.
P-adic Birch–Swinnerton-Dyer and Sprung's sharp/flat decomposition at supersingular
primes with `a_p ≠ 0` are outside this roadmap's scope.

## Conventions

1. **Weight.** The coefficient degree is `k ≥ 0` and the weight of modular forms is `k + 2`. Pollack's
   supersingular paper writes `k` for the weight; its statements are translated.
2. **Cusps and divisors.** `P¹(ℚ)` is Mathlib's `OnePoint ℚ` with the action of `GL₂(ℚ)` by linear
   fractional transformations. `Δ₀ = Div⁰(P¹(ℚ))` is the kernel of the degree map `ℤ[P¹(ℚ)] → ℤ`, and
   `{b} − {a}` denotes the divisor with `+1` at `b` and `−1` at `a`; it is the path from `a` to `b`.
3. **Actions.** A right action `v ↦ v|γ` is recorded as the left representation `ρ(γ)v = v|γ⁻¹`. A
   modular symbol satisfies `φ(γD) = ρ(γ)φ(D)`, equivalently `φ(γD) = φ(D)|γ⁻¹`. Hecke operators act on
   the right: `(φ|δ)(D) = φ(δD)|δ`.
4. **Polynomial coefficients.** `V_k(R)` is the module of homogeneous polynomials of degree `k` in `X, Y`
   over `R`, with the right action `(P|γ)(X, Y) = P((X, Y)·γ*) = P(dX − cY, −bX + aY)` of integral
   matrices `γ = (a b; c d)` of nonzero determinant, `γ*` the adjugate. Witness: for `γ = T = (1 1; 0 1)`,
   `X|T = X` and `Y|T = −X + Y`. Tau Ceti's `binaryFormRep` uses `P ↦ P(aX + bY, cX + dY)`; the action here
   is `binaryFormRep` applied to (adj `γ`)`ᵀ`, and `binaryFormAdjugateRep` composed with transposition.
5. **Diamond operators.** `Γ₀(N)/Γ₁(N) ≅ (ℤ/N)^×` by the lower-right entry (Mathlib's `Gamma0Map`), as
   for Tau Ceti's `diamondOp` on forms. Identifying by the upper-left entry replaces `⟨d⟩` by `⟨d⁻¹⟩`.
6. **Hecke at level `Γ₁(N)`.** For `ℓ ∤ N` the diagonal term of `T_ℓ` is `σ_ℓ·diag(ℓ, 1)` with `σ_ℓ ∈ Γ₀(N)` of
   lower-right entry `≡ ℓ mod N`; on the `ε`-eigenspace it contributes `ε(ℓ)·φ|diag(ℓ, 1)`.
7. **Involution and signs.** `ι = diag(−1, 1)`; it acts on cusps by `x ↦ −x` and on `V_k` by
   `P(X, Y) ↦ P(X, −Y)`. The signed period symbols are `ψ_f^± = (1 ± ι)ψ_f`, with no factor `1/2`.
   Pollack–Stevens' sign label equals the `ι`-sign times `(−1)^k`, and Bellaïche's involution is
   `diag(1, −1)`. Both dictionaries are applied wherever these sources are used.
8. **Period symbol.** `ψ_f({s} − {r}) = 2πi ∫_r^s f(z)(zX + Y)^k dz` along the geodesic. Witness: for the
   weight-two newform `f` of level 11, `ψ_f({0} − {∞}) = 2πi∫_{i∞}^0 f(z)dz = L(f, 1) = 0.25384186…` .
   Tau Ceti's homological `rawPairing` integrates `{α, β}` from `β` to `α` and carries no `2πi`; the
   comparison of §0.7 fixes the dictionary.
9. **Periods.** A period is a coordinate on a line, never a canonical number: for a nonzero `φ` in a
   signed rational line, `Ω(φ)` is defined by `ψ_f^± = Ω(φ)·φ`, and `Ω(λφ) = λ⁻¹Ω(φ)`.
10. **Twisting.** `τ(χ) = Σ_{a mod m} χ(a)e^{2πia/m}`. Summing symbol values against `χ(a)` produces
    `L(f, χ̄, s)`, not `L(f, χ, s)`; for real `χ` the two agree, so a quadratic test cannot detect a
    misplaced bar.
11. **Refinements.** For `p ∤ N` the refinement level is `Γ₀ = Γ₁(N) ∩ Γ₀(p)`; for `p | N` it is `Γ₁(N)`
    itself. At `p | N` the refinement eigenvalue is the actual nonzero `U_p`-eigenvalue `a_p`, never a root
    of the good-prime Hecke polynomial.
12. **The p-adic L-function.** `L_p(f, α)` is `Φ({∞} − {0})` restricted to `ℤ_p^×`; the divisor `{0} − {∞}`
    gives `−L_p`.
13. **Radii.** The weight-`k` action of `Σ₀(p)` on analytic functions on `B[ℤ_p, r]` is defined for `r < p`;
    for `r ≥ p` the factor `(a + cz)^k` can vanish on the disc.
14. **Slopes.** Small slope means `h < k + 1`, critical slope means `h = k + 1`. Uniqueness from
    interpolation holds only for `h < k + 1`.
15. **Coefficient embeddings.** An embedding of the coefficient field transports algebraic normalised
    coordinates and a chosen p-adic place; no action on transcendental complex periods is asserted.

## Exact supplier contracts

### From Mathlib

At commit `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, each with exactly its stated hypotheses:
`OnePoint` (`P¹(ℚ)` as `OnePoint ℚ`) and the `GL₂`-action of
`Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean`; `Matrix.SpecialLinearGroup`,
`Matrix.SpecialLinearGroup.map`, `Matrix.SpecialLinearGroup.toGL`, `Matrix.SpecialLinearGroup.mapGL`,
`Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.mkOfDetNeZero`,
`Matrix.adjugate`, `Matrix.adjugate_mul`; `CongruenceSubgroup.Gamma0`, `CongruenceSubgroup.Gamma1`,
`CongruenceSubgroup.Gamma`, `CongruenceSubgroup.Gamma0Map`; `Submonoid`, `AddSubgroup`;
`MonoidAlgebra`, `MonoidAlgebra.basis` and `MonoidAlgebra.mapDomainRingHom`; `Module.Free`, `Module.Flat`,
`Module.FinitePresentation`; `MvPolynomial.homogeneousSubmodule` and `MvPolynomial.aeval`;
`Representation`, `Representation.ofMulAction`, `Representation.linHom`,
`Representation.Coinvariants`, `Rep.ofMulAction`, `Rep.coind`, `Rep.coinvariantsAdjunction`,
`Rep.coinvariantsTensor`; `groupCohomology` with `groupCohomology.resNatTrans`,
`groupCohomology.H1InfRes_exact` (exactness of the first three inflation–restriction terms only)
and `groupCohomology.coindIso` (Shapiro); `CuspForm` and `UpperHalfPlane`;
`CuspFormClass.qExpansion_isBigO` (Hecke's bound `O(n^{w/2})` for the coefficients of a cusp form of weight
`w`); `ModularForm.L` (the
L-function of a modular form on an arithmetic subgroup of `GL₂(ℝ)`, entire for cusp forms, with
`CuspForm.Λ_eq_mellin`) and `mellin`; `Algebra.adjoin`,
`IsCoprime`, `LinearMap.aeval_self_charpoly` (Cayley–Hamilton), `Submodule.projectionOnto`,
`LinearMap.isCompl_of_proj`; `Nat.exists_prime_gt_modEq_one` (primes `ℓ ≡ 1 mod N` beyond any bound);
`PowerSeries.binomialSeries`; `PadicInt` and `PadicInt.toZModPow`; `Polynomial.cyclotomic`.

### From Tau Ceti

At the pinned commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:
`TauCeti.augmentationSubrepresentation` with `TauCeti.toSubmodule_augmentationSubrepresentation` and
`TauCeti.single_sub_single_mem_augmentationSubrepresentation` (the degree-zero subrepresentation of a
permutation representation, from which the pinned library builds `degreeZero`);
`HeckeRing.GL2.commSemiringHeckeRingGamma0` (commutativity of the `Γ₀(N)` Hecke ring, `N ≠ 0`);
`HeckeRing.GL2.diamondCosetGamma1` (the `Γ₁(N)` double coset of an element of `Γ₀(N)`);
`HeckeRing.GLn.intEntries` and `HeckeRing.GLn.intMatrix` (the integral-entry submonoid of `GLₙ(ℚ)` and
its underlying integral matrix); `HeckeCoset.heckeSum` with `heckeSum_eq_sum_of_rightCosets` and
`heckeSum_comp_of_mem` (for a `Γ₁`-invariant map, the sum is independent of right-coset representatives
and is `Γ₂`-invariant); `diamondOp`
(lower-right convention), `cuspFormCharSpace` and `isInternal_cuspFormCharSpace` (the nebentypus
decomposition of `S_k(Γ₁(N))`); `CuspForm.peterssonInnerCosets_definite` (positive definiteness of the
Petersson product for finite-index `Γ`); `HeckeRing.GL2.Newform` and
`HeckeRing.GL2.finrank_cuspFormsNewEigenspace_eq_one` (dimension one of a newspace eigenspace
containing a nonzero form of the given character); `TauCeti.CuspForm.levelRaise` (`V_d f(z) = f(dz)`,
no determinant factor) and `TauCeti.CuspForm.qExpansion_levelRaise`;
`HeckeRing.GL2.heckeTCuspNat_eq_smul_iff_forall_qExpansion_coeff_prime_mul` (for `p ∤ N`,
`T_p F = cF` iff `a_{pm} = c·a_m − χ(p)p^{w−1}a_{m/p}`, in weight `w`) and
`HeckeRing.GL2.heckeUCuspNat_eq_smul_iff_forall_qExpansion_coeff_prime_mul` (for `p | N`,
`U_p F = cF` iff `a_{pm} = c·a_m`). The Layer-8 declarations listed under Scope and ownership are supplied at this same pin.

The monoid `Σ₀(N)` is the integral-matrix form of the submonoid of `intEntries 2` with upper-left entry
a unit modulo `N` and lower-left entry divisible by `N`. On nonsingular integral matrices,
`intMatrixToGL` is inverse to `intMatrix 2`; its extension at singular matrices is not such an inverse.
The operators `heckeT` and `heckeU` are Hom-side Hecke sums with coefficient twist `act δ` and fixed
upper-triangular representatives. On dual coefficients, §0.6 identifies them with the transpose of
`heckeSum` on the tensor module, with its specified coefficient action.

### Supplier replacements

The cusps are Mathlib's `OnePoint ℚ`; the integral divisor carrier is
`TauCeti.ModularSymbols.degreeZero ℤ`, with its `degreeZeroGLRep ℤ` action and
`single_sub_single_mem_degreeZero`. The restriction to `SL₂(ℤ)` is the supplied `degreeZeroRep`,
and the embedding into `GL₂(ℚ)` is Mathlib's `Matrix.SpecialLinearGroup.mapGL ℚ`.
The polynomial carrier is Mathlib's `MvPolynomial.homogeneousSubmodule (Fin 2) R k`.
These are used directly, with no local aliases. Bounded moment sequences use
Mathlib's `Bornology.IsBounded (Set.range c)`, with `isBounded_iff_forall_norm_le` supplying
the equivalent uniform norm bound; no second boundedness predicate is introduced. The light `divisor` map fixes the order
`{b} − {a}`, and `slashPoly` fixes the row-adjugate substitution on the ambient polynomial algebra;
neither introduces a second divisor or homogeneous-polynomial carrier. The factors
`Φ_n` are Mathlib's `Polynomial.cyclotomic (p ^ n) ℤ`, with
`Polynomial.cyclotomic_prime_pow_eq_geom_sum` and
`Polynomial.eval_one_cyclotomic_prime_pow`; their geometric-sum and value-at-one
identities are consumed directly.

Finite-index corestriction is `TauCeti.groupCohomology.corestriction`, supplied by
`TauCeti/RepresentationTheory/Homological/GroupCohomology/Corestriction.lean`, with
`map_subtype_id_comp_corestriction` `(cor ∘ res = [Γ : Γ′])` and `corestriction_trans`.
The descent target of §0.4 adds the conjugation-sum identity and its cusp compatibility to this
existing transfer; it does not construct another transfer.

### From TauCetiRoadmap.ModularForms

- Layer 8: `Div⁰(P¹(ℚ))` as a left `ℤ[GL₂⁺(ℚ)]`-module generated by the `{b} − {a}`, with
  `0 → Div⁰ → ℤ[P¹(ℚ)] → ℤ → 0`; its generation by the unimodular divisors `{g0} − {g∞}, g ∈ SL₂(ℤ)`, and
  the two- and three-term Manin relations (pinned Tau Ceti `degreeZero_eq_span_unimodular`,
  `span_maninSymbol_eq_top`, `maninSymbol_mul_S`, `maninSymbol_add_mul_T_mul_S_add_mul_T_mul_S_sq`);
  the homological module `𝕄` with its Hecke and diamond operators; the period map
  `S_{k+2}(Γ₁(N)) → Hom_ℤ(𝕄, ℂ)` with its convergence, invariance, Hecke equivariance and injectivity.
- Layer 8G: the coefficient field `K_f = ℚ(a_n(f))`, the character field inside it, and for a field
  embedding `σ` the conjugate newform `f^σ` with `a_n(f^σ) = σ(a_n(f))`.
- Layer 7: `L(f, s)` and `L(f, χ, s) = Σ χ(n)a_n n^{−s}` for cusp forms of weight `k + 2`, the Mellin
  identity `∫_0^∞ g(iy)y^{s−1}dy = Γ(s)(2π)^{−s}L(g, s)` and the entire extension for cusp forms `g`.
- Layer 4: for a newform `f` of weight `k + 2`, level `N`, character `ε` and a prime `p`: if `p ∤ N`, the
  subspace of `S_{k+2}(Γ₁(N) ∩ Γ₀(p), ε)` on which every `T_ℓ, ℓ ∤ Np`, acts by `a_ℓ(f)` is spanned by `f(z)`
  and `f(pz)`; if `p | N, U_p f = a_p(f)f`; at the primitive level `N`, the fixed-character eigenspace with
  the eigenvalues of `f` away from `N` lies in the newspace; the Hecke eigenvalues are algebraic integers.
- Layers 0 and 5: the Eisenstein series of weight `k + 2` with character, their q-expansions by twisted
  divisor sums and the cusp–Eisenstein decomposition (Layer 0), and the characterisation of normalised
  eigenforms by their coefficients (Layer 5, Diamond–Shurman Proposition 5.8.5), which together give
  the good Hecke eigenvalues `ψ(ℓ) + φ(ℓ)ℓ^{k+1}` of the Eisenstein eigenforms of level `M, ψ` and `φ`
  Dirichlet characters of modulus dividing `M`; strong multiplicity one (Layer 5).
- Layer 10C: for torsion-free finite-index `Γ ≤ SL₂(ℤ)` and `μ = [PSL₂(ℤ) : Γ̄]`,
  `dim S_{k+2}(Γ) = (k + 1)μ/12 − c_k/2 + δ_{k,0}`, where `c_k` counts all cusps for even `k` and the regular
  cusps for odd `k`; and the full-level genera `g(X(3)) = 0, g(X(6)) = 1`.

### From TauCetiRoadmap.LocallyAnalyticDistributions

§0.1 (Discs, locally analytic functions and their distributions): `discAnalytic` (analytic functions on a closed disc `B(a, r)` with Gauss norm and the maximum
principle on `ℂ_p`-points), `LA_h` and `LA(ℤ_p, L) = lim→ LA_h`, the distributions `D(ℤ_p, L)` with their
Fréchet structure; §0.3 (Compact restriction to a smaller radius) supplies the finite-chart
restriction comparison using CompactOperators §0.3. The locally convex limits `naInductiveLimit` and `naProjectiveLimit` are
§0.0 (Nonarchimedean topology, exact categories and completed tensors). §2.1 (Functions of class `C^r` and distributions of order `r`): `DistOrder` (`D_r(ℤ_p, L)`, with `mem_distOrder_iff_growth`, which is
Pollack–Stevens' `h`-admissibility), order zero equals bounded measures, and §2.3 (Uniqueness, the critical case and ray-class adapters), the Amice–Vélu–Višik
theorem: two distributions of order `r` agreeing on locally polynomial functions of degree `≤ N` coincide
when `r < N + 1`, and `d^{N+1}δ₀` shows the threshold is sharp. §4.1 (Banach modules, complete continuity and orthonormalizable modules), §4.2 (Fredholm determinants),
§§4.7–4.8 (root projectors and finite projective root kernels), and §4.16 (Banach complexes and
finite-slope decompositions): complete continuity over a field, Fredholm series, Riesz projectors,
finite projective slope summands and uniqueness of `h`-slope decompositions.
§4.15 (Universal-character coefficient action; Cocycle law and handedness) supplies the generic
analytic stages, multipliers, transposes and compactness comparisons; §2.2 here identifies its
left action of `Σ₀(p)ᵒᵖ` with the right modular-symbol coefficient action.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Layer 0 (§§0.1–0.2): bounded measures `D(X, L) = C⁰(X, L)′` on `X = ℤ_p^×` and on `ℤ_{p,M}^× = lim (ℤ/p^nM)^×`, §1.7 (Comparison with the completed group algebra) and §4.5 (The Iwasawa coordinate and the initial Fitting ideal): the identification of
`𝒪`-valued measures with `𝒪⟦ℤ_p^×⟧` and with bounded power series on each branch of the character space,
§3a.1 (The character space of `ℤ_pˣ` and its functions): the decomposition of characters at odd `p` (torsion `μ_{p−1}`) and at `p = 2` (torsion `μ₂, γ ∈ 1 + 4ℤ₂`),
and §4.2 (Structure of finitely generated `Λ`-modules): the invariants of a nonzero Iwasawa function.

### From ModularCurvesPartII

Sections 14.1–14.4a supply the symmetric-power local systems on a neat fine `GL₂/ℚ` level,
the support map and its parabolic image, the finite-coefficient Betti–étale comparison
and its adic and characteristic-zero scalar extensions, on all geometric components.
Section 14.8 supplies the coefficient pullback/trace along modular isogenies and §14.11
the pairing with the dual local system, its adjoint Hecke action and its Tate twist.
Section 14.12 identifies the homological modular-symbol module with relative homology
of a truncated surface and its boundary, with the stated torsion, saturation and
coefficient-dual hypotheses. Section 0.6 here builds the Hom-side adapter and the exact
adjugate-polynomial dictionary; the parabolic projector of §0.8 uses that adapter.
The higher-weight integral perfectness statements are used only where `k!` is invertible;
the rational comparison in §0.8 is over `ℚ` and `ℚ_p`.

### From the arithmetic and period roadmaps

AlgebraicModularFormsAndSerreWeights R15.5A.2 (Classical eigenforms of weight at least two)
supplies the actual representation attached to `f`, its good-prime characteristic
polynomials, coefficient embedding and stable lattice. ArithmeticGaloisRepresentations
§7.2 (Adjoint, trace pairing and Schur's lemma) supplies `ad ρ_f = End(ρ_f)` with the conjugation action; its trace-zero
subrepresentation is not substituted for this carrier. SelmerIwasawaCohomology §§2.1–2.2
supply a global Selmer kernel for specified local subspaces of continuous `H¹`.
PadicPeriodRings §1.5 supplies `B_dR` with its continuous local Galois action.
Section 3.0 specifies the unramified local conditions away from `p` and the de Rham kernel
at `p` and applies that Selmer kernel to `ad ρ_f`. It does not reconstruct a modular Galois
representation, adjoint or period ring. The good-`p` crystalline comparison, Artinian-family
period theorem and CM adjoint-Selmer vanishing needed in §3.0 are targets there.

### Direct roadmap prerequisites

Each row records a direct supplier; the section numbers specify the input used here.
The local Hom-side adapters and the finite-slope critical constructions remain targets of this roadmap.

| Supplier | Exact input | Location | Used in |
| --- | --- | --- | --- |
| Supplied by ModularForms | Layers 0, 4–5, 7–8, 8G and 10C: eigenforms, homological symbols, periods, L-series and dimensions | main, TauCetiRoadmap/ModularForms | Layers 0–4 |
| Supplied by FuchsianOrbifolds | Layers 2–4: finite fundamental polygons, cusp collars and quotient surfaces | main, TauCetiRoadmap/FuchsianOrbifolds | §0.6 |
| Supplied by AlgebraicTopology | Stages 2, 4 and 6: relative cellular chains, local coefficients and oriented manifold duality | main, TauCetiRoadmap/AlgebraicTopology | §§0.6, 2.3 |
| Supplied by PadicMeasuresIwasawaAlgebras | §§0.1–0.2, 1.7, 3a.1, 4.2 and 4.5: measures, completed group algebras, character branches and Iwasawa invariants | main, TauCetiRoadmap/PadicMeasuresIwasawaAlgebras | §§2.5, 4.1–4.4 |
| Supplied by ClassFieldTheory | Layers 5 and 11: local and global reciprocity | main, TauCetiRoadmap/ClassFieldTheory | §3.0, CM adjoint-Selmer vanishing |
| Supplied by IntegralHeckeAndGaloisDeterminants | §§0.5, 1.3 and 1.5: trace/determinant comparison, henselian reconstruction and coefficient descent | open roadmap pull request of this series | §3.0, Galois adapter |
| Supplied by ArithmeticGaloisRepresentations | §7.2: full endomorphism adjoint, trace pairing and Schur's lemma | open roadmap pull request of this series | §3.0, Galois adapter and decency |
| Supplied by ArithmeticGaloisDuality | §§R02.2.1–R02.2.2: inflation–restriction; D7, Local duality over finite and local coefficient fields: Tate pairings and Euler characteristic | open roadmap pull request of this series | §3.0, refined deformation tangent space and CM vanishing |
| Supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory | §§R07.P2–R07.P5 and R07.P7.1–R07.P7.5: period structures, realization comparisons and labelled Sen theory | open roadmap pull request of this series | §3.0, Galois adapter and CM finite/de Rham comparison |
| Supplied by SelmerIwasawaCohomology | §§2.1–2.2 and 4.9: Selmer data, rational kernel and Bloch–Kato finite conditions | open roadmap pull request of this series | §3.0, decency and CM vanishing |
| Supplied by ArithmeticLocallySymmetricSpaces | §ALS.3.1: Hecke action on derived invariants | open roadmap pull request of this series | §0.4, cohomological Hecke adapter |
| Supplied by LocallyAnalyticDistributions | §§0.0–0.3, Layer 1, §§2.1, 2.3, 3.3 and 4.1–4.2, 4.7–4.8, 4.15–4.16: analytic coefficients, admissibility, Mellin transform and finite-slope families | open roadmap pull request of this series | Layers 2–4 |
| Supplied by ModularCurvesPartII | §§14.1–14.4a, 14.8, 14.11–14.12: geometric coefficients, Betti–étale and symbol comparisons, Hecke and pairings; §§7.1, 9.1–9.3 and 11.1: ordinary modular geometry | open roadmap pull request of this series | §§0.6, 0.8 and 3.0 |
| Supplied by LocalGaloisDeformationRings | §§F.1.1–F.1.10 and 1.15: deformation functors and characteristic-zero Artinian coefficients | open roadmap pull request of this series | §3.0, refined deformation functor |
| Supplied by AutomorphicLFunctionsAndLocalFactors | AL.5, Complex period and stabilization dictionary; The ordinary `GL₂` interpolation factor | open roadmap pull request of this series | §§1.3 and 4.1 |
| Supplied by AlgebraicModularFormsAndSerreWeights | R15.5A.2: classical higher-weight Galois attachment with coefficient field and stable lattice | open roadmap pull request of this series | §3.0, Galois adapter and decency |
| Supplied by PadicPeriodRings | §§1.5, 3 and 4.1–4.3: topological period rings, crystalline structures and invariant functors | open roadmap pull request of this series | §3.0, crystalline periods and de Rham kernel |

## How to read the build

Layer 0 turns the divisor presentation into equivariant `Hom` spaces, defines the Eisenstein subspace by
restriction of boundary symbols and the parabolic quotient by the connecting cocycle, builds every
operator with one coefficient convention, proves Eichler–Shimura and the multiplicity one of signed
newform eigenspaces, and ends with the rational Drinfeld–Manin splitting. Layer 1 chooses bases of
the signed eigenlines, saturates them integrally, and computes the twisted critical values; it also
`p`-stabilises a newform and fixes the dictionary between the interpolation formulas in the literature.
Layer 2 builds the distribution modules and their weight-`k` action, lifts classical symbols, proves
the control theorem below slope `k + 1` and constructs the p-adic L-function with its interpolation
and uniqueness. Layer 3 treats slope exactly `k + 1`, where interpolation no longer determines the
distribution. Layer 4 adds tame twists, the supersingular theory at `a_p = 0`, Euler depletion and
coefficient transport, and the examples of level 11. Each layer opens with its hypotheses; a target
is a bold-titled paragraph with its statement, API, source locator, *Needs:* (earlier targets,
library declarations and supplier layers) and, where present, *Lean:*. The Checks of a definition or
construction are the bullets under it. Each layer ends with examples and its dependencies.

## Layer 0: Hom-side modular symbols, Hecke operators and the Eichler–Shimura isomorphism

This layer works with a finite-index subgroup `Γ ≤ SL₂(ℤ)` (`Γ₀(N), Γ₁(N), Γ(N)` and their
intersections in the applications), a commutative ring `R` and an `R`-module `V` with a right action of `Γ`,
or of a monoid containing `Γ` when Hecke operators are needed. Everything up to §0.6 is algebraic and
holds over `ℤ` unless an invertibility hypothesis is stated; §0.7 is over `ℂ` and its subfields; §0.8 is
over `ℚ`. Proposed home: `TauCeti/NumberTheory/ModularForms/ModularSymbols/Hom`, namespace
`TauCeti.ModularSymbol`, distinct from the homological `TauCeti.ModularSymbols`.

### 0.1 Coefficient modules and the Hecke monoid

**Free group algebras over a finite-index subgroup** (lemma). Let `Γ ≤ G` have finite index (`G = SL₂(ℤ)`
or `PSL₂(ℤ)`) and let `{g_j}` be right coset representatives of `Γ\G`. Then `ℤ[G]` is a free left `ℤ[Γ]`-module
with basis `{g_j}`, of rank `[G : Γ]`, and consequently `F ↦ (F(g_j))_j` is an isomorphism
`Hom_{ℤ[Γ]}(ℤ[G], V) ≅ ∏_j V` for every `Γ`-module `V`. The proof is the bijection `Γ × (Γ\G) → G`,
`(γ, j) ↦ γg_j`. Combined with Manin's presentation (§0.2) this gives the presentation of `Δ₀` over `ℤ[Γ]` by coset
generators used in §0.2 ([PS] §2.2, p. 8). *Needs:* Mathlib `MonoidAlgebra`,
`MonoidAlgebra.mapDomainRingHom`, `Module.Free`.

**The coefficient modules `V_k`** (definition). For a commutative ring `R` and `k ≥ 0, V_k(R)` is the
`R`-module of homogeneous polynomials of degree `k` in `X, Y`, with the right action of integral matrices of
nonzero determinant `(P|γ)(X, Y) = P(dX − cY, −bX + aY)` of Convention 4. Because the adjugate keeps
entries integral, the action is defined on the monoid of integral matrices with nonzero determinant,
not only on `GL₂(ℚ)`; `P|(γδ) = (P|γ)|δ` because `(γδ)* = δ*γ*`. Restricted to `Γ` it gives the left
representation `γ ↦ (P ↦ P|γ⁻¹)`. Pollack–Stevens use `V_k = Sym^k(ℚ_p²)` with the same formula
([PS] §3.4, p. 17). The carrier is `MvPolynomial.homogeneousSubmodule (Fin 2) R k`, and the action is
`TauCeti.binaryFormRep` composed with `M ↦` (adj `M`)`ᵀ`; this target is the Hom-side interface with that
transposition dictionary, not a second polynomial module. API: `slashVk` (the right action on the supplied homogeneous submodule), `slashVk_mul` `(P|(γδ) = (P|γ)|δ)`, `slashVk_one`, `vkRep` (the left representation of
`Γ`), `slashVk_eq_binaryFormRep` (`slashVk γ = binaryFormRep` (`op` (adj `γ`)`ᵀ`)). *Needs:* Mathlib
`MvPolynomial.homogeneousSubmodule`, `MvPolynomial.aeval`, `Matrix.adjugate`, `Representation`;
Tau Ceti `TauCeti.binaryFormRep`. *Lean:* `slashPoly`, `slashPoly_mul`, `slashPoly_mem_Vk`,
`slashPoly_scalar`.

**Checks.**

- For a nontrivial commutative ring `R, V_k(R)` is free of rank `k + 1` (monomial basis `X^iY^{k−i}`); over the
  zero ring the rank statement is not made, so a test that asserted rank `k + 1` for every `R` would be
  false there.
- The scalar matrix `c·1` acts on `V_k` by `c^k` (its adjugate is `c·1`). A definition using the inverse
  instead of the adjugate would give `c^{−k}` and leave the integral monoid.
- `V_0` is the trivial representation: every `γ` fixes the constant 1.
- With `γ = T = (1 1; 0 1)`: `X|T = X` and `Y|T = Y − X`. The unadjugated substitution `P((X, Y)γ)` would give
  `Y|T = X + Y` instead, and the substitution `P(aX + bY, cX + dY)` of `binaryFormRep` would give
  `X|T = X + Y`.

**The Hecke monoid `Σ₀(N)`** (construction). For `N ≥ 1, Σ₀(N)` is the set of integral matrices
`(a b; c d)` with `ad − bc ≠ 0, N | c` and `gcd(a, N) = 1`. It is a monoid: the lower-left entry of a product
is `ca′ + dc′ ≡ 0 mod N`, the upper-left entry `aa′ + bc′ ≡ aa′ mod N` is prime to `N`, and determinants
multiply. It contains `Γ₀(N)`, every `(1 a; 0 ℓ)` with `ℓ ≥ 1`, and `(ℓ 0; 0 1)` exactly when `gcd(ℓ, N) = 1`. For
`N = p` it is Pollack–Stevens' `S₀(p)` ([PS] §2.1, p. 7). API: `Sigma0` (the submonoid of
`Matrix (Fin 2) (Fin 2) ℤ`), `Gamma0_le_Sigma0` `(Γ₀(N) ⊆ Σ₀(N))`, `intMatrixToGL` `(Σ₀(N) → GL₂(ℚ))`.
*Needs:* Mathlib `Submonoid`, `CongruenceSubgroup.Gamma0`. *Lean:* `Sigma0`, `Gamma0_le_Sigma0`,
`intMatrixToGL`, `intMatrixToGL_mul`.

**Checks.**

- For `ℓ ≠ 0` and every `a`, `(1 a; 0 ℓ) ∈ Σ₀(N)`: the lower-left entry is 0 and the upper-left entry is 1.
- For `ℓ ≠ 0, (ℓ 0; 0 1) ∈ Σ₀(N)` iff `gcd(ℓ, N) = 1`; so `(2 0; 0 1) ∈ Σ₀(3)` but `(2 0; 0 1) ∉ Σ₀(4)`. A
  definition requiring `gcd(d, N) = 1` instead of `gcd(a, N) = 1` would accept the second matrix.
- `Γ₀(N) ⊆ Σ₀(N)`: an element of `Γ₀(N)` has `det` 1 and `ad ≡ 1 mod N`, so a is a unit mod `N`.

The ambient helper `intMatrixToGL` sends a nonzero-determinant integral matrix to its
rational general linear matrix using `Matrix.GeneralLinearGroup.mkOfDetNeZero`; on a
singular matrix it is defined to be the identity. Its mathematical use in `slashSymbol`
is restricted to `Σ₀(N)`, where that extension is immaterial. On nonsingular matrices it is inverse
to the pinned `HeckeRing.GLn.intMatrix 2` on `HeckeRing.GLn.intEntries 2`. API: its matrix coercion is
the entrywise rational cast for nonzero determinant, and it respects products on `Σ₀(N)`.
This is the ambient form of the inclusion in the preceding target ([PS] §2.1, p. 7).

**Checks.**

- The zero matrix takes the specified extension value 1.
- `diag(2,1)` has rational `image diag(2,1)`, rather than the identity or its inverse.
- On the identity matrix the rational image is 1, and products of two `Σ₀(N)` matrices
  have the product of their rational images.

- `(1 0; 1 1) ∉ Σ₀(2)`, detecting the lower-left divisibility condition.
- `(1 0; 0 0) ∉ Σ₀(N)` for every `N`, detecting nonsingularity.

### 0.2 Modular symbols and their presentations

**Manin's presentation of `Δ₀`** (theorem). Let `G = PSL₂(ℤ), σ = (0 −1; 1 0)` and `τ = (0 −1; 1 −1)`. The
map `d : ℤ[G] → Δ₀, g ↦ {g0} − {g∞}`, is a surjective map of left `ℤ[G]`-modules whose kernel is the left
ideal `I = ℤ[G](1 + σ) + ℤ[G](1 + τ + τ²)`, so `Δ₀ ≅ ℤ[G]/I`; for the same map out of `ℤ[SL₂(ℤ)]` the kernel
acquires the generator `1 − (−1)`. Surjectivity is the generation of `Δ₀` by unimodular divisors (continued
fractions; pinned Tau Ceti `degreeZero_eq_span_unimodular`), and `I ⊆ ker d` holds because `σ` reverses
the path from `∞` to 0 and `τ` permutes the vertices 0, 1, `∞` of an ideal triangle (`maninSymbol_mul_S`,
`maninSymbol_add_mul_T_mul_S_add_mul_T_mul_S_sq`). For `ker d ⊆ I` use the Farey tessellation: the
`G`-translates of the ideal triangle `R` with vertices 0, 1, `∞` cover `ℍ ∪ P¹(ℚ)` and meet only along
unimodular edges, so they give a two-dimensional cell structure relative to `P¹(ℚ)` whose oriented
1-cells `g·[∞ → 0]` correspond to `g ∈ G`, with `σ` reversing orientation, and whose 2-cells `gR` correspond to
`G/⟨τ⟩`, with boundary `g(1 + τ + τ²)`. As `ℍ ∪ P¹(ℚ)` is contractible, its first homology relative to the
cusps is `Δ₀`, and the cellular chain complex identifies it with `ℤ[G]/I` ([PS] §2.2, pp. 7–8, where the
statement is attributed to Manin). This presentation is the input of every presentation of `Δ₀` over
`ℤ[Γ]` below. *Needs:* Mathlib `MonoidAlgebra`, `Matrix.SpecialLinearGroup`, `OnePoint`; pinned Tau Ceti
`TauCeti.ModularSymbols.degreeZero_eq_span_unimodular`, `maninSymbol_mul_S`,
`maninSymbol_add_mul_T_mul_S_add_mul_T_mul_S_sq`; ModularForms Layer 8 (`Div⁰` with its action).

**Oriented cusp divisors** (light interface). On the supplied carrier `Δ₀` define
`divisor(a,b)` `= {b} − {a}`. Its API is `divisor_self` (value zero), `divisor_swap`
(negation), `divisor_add` (the sum for `a→b` and `b→c` is `a→c`) and equivariance under
`degreeZeroGLRep`. Source: [PS] §2.1, p. 6, with Convention 2's orientation.

**Checks.**

- The path `0→∞` has coefficient `−1` at 0 and `+1` at `∞`.
- The path `a→a` is zero.
- The paths `0→1` and `1→∞` sum to `0→∞`; the coefficient at the intermediate cusp 1 is zero.

*Needs:* Tau Ceti `TauCeti.ModularSymbols.degreeZero`, `degreeZeroGLRep` and
`single_sub_single_mem_degreeZero`. *Lean:* `divisor`, `divisor_self`, `divisor_swap`, `divisor_add`.

**Modular symbols** (definition). For `Γ ≤ SL₂(ℤ)` of finite index and a right `ℤ[Γ]`-module `V`, the
module of `V`-valued modular symbols is `Symb_Γ(V) = Hom_{ℤ[Γ]}(Δ₀, V)`: the additive maps `φ : Δ₀ → V` with
`φ(γD) = φ(D)|γ⁻¹` for all `γ ∈ Γ` and `D ∈ Δ₀`, where `Γ` acts on `Δ₀` through `SL₂(ℤ) → GL₂(ℚ)`. With the left
representation `ρ(γ)v = v|γ⁻¹` the condition reads `φ(γD) = ρ(γ)φ(D)` ([PS] §2.1, pp. 6–7). A symbol is
determined by its values on the unimodular divisors `{g0} − {g∞}, g ∈ SL₂(ℤ)`, which generate `Δ₀` (Manin's
presentation, above). When the orders of the torsion elements of `Γ` act invertibly on `V`,
`Symb_Γ(V) ≅ H¹_c(Y_Γ, Ṽ)`; that comparison is the adapter of §0.6. API: `symbols` (`Symb_Γ(V)` as an
`R`-submodule of the additive maps `Δ₀ → V` when `V` is an `R`-module with `R`-linear `Γ`-action, with its
additive-subgroup view obtained by forgetting scalars),
`mem_symbols_iff`, `ext_unimodular` (two additive maps on `Δ₀` agreeing on unimodular divisors are equal,
by the pinned `span_degreeZeroRep_eq_top`),
`symbols_mono` (`Γ′ ≤ Γ` gives `Symb_Γ(V) ⊆ Symb_{Γ′}(V)`). *Needs:* Mathlib `Representation`,
`Submodule`, `Matrix.SpecialLinearGroup.map`, `Matrix.SpecialLinearGroup.toGL`,
`CongruenceSubgroup.Gamma0`; ModularForms Layer 8 (`Δ₀` with its `GL₂⁺(ℚ)`-action and its generation;
pinned Tau Ceti `TauCeti.ModularSymbols.degreeZero`, `degreeZeroGLRep`; pinned Tau Ceti
`TauCeti.augmentationSubrepresentation`). *Lean:* `divisor`, `symbols`, `mem_symbols_iff`, `ext_unimodular`, `symbols_SL2Z_trivial`.

**Checks.**

- `Symb_{SL₂(ℤ)}(ℤ) = 0` with the trivial action: the value `v = φ({0} − {∞})` satisfies `2v = 0` (from `σ`)
  and `3v = 0` (from `τ`), so `v = 0`, and `v` determines `φ`. A definition using all of `ℤ[P¹(ℚ)]` instead of `Δ₀`
  would give the nonzero module of constant functions here.
- `Symb_{Γ₀(11)}(ℤ)` is free of rank `3 = 2g + (c − 1)`, with `genus g = 1` and `c = 2 cusps`.
- The zero map is a modular symbol for every `Γ` and `V`; and for `Γ′ ≤ Γ` every `Γ`-symbol is a
  `Γ′`-symbol, while the converse fails for `Γ₀(11) ≤ SL₂(ℤ)` by the two previous Checks.
- For an `R`-linear `Γ`-action, `a ∈ R` and `φ ∈ Symb_Γ(V)`, the pointwise multiple `aφ` is a symbol,
  with `(aφ)(D) = aφ(D)`, using `ρ(γ)(av) = aρ(γ)v`; the divisor module remains `Δ₀` over `ℤ`.

**Modular symbols as functions on cosets** (lemma). Let `{g_j}` be right coset representatives of
`Γ\SL₂(ℤ)`, and for `g ∈ SL₂(ℤ)` write `g = γ_g g_{j(g)}` with `γ_g ∈ Γ`. Then `φ ↦ (φ({g_j0} − {g_j∞}))_j` is an
isomorphism from `Symb_Γ(V)` onto the families `(v_j) ∈ ∏_j V` that satisfy, for every `j` and with
`x(g)` :`= v_{j(g)}|γ_g⁻¹`: `x(g_j) + x(g_jσ) = 0, x(g_j) + x(g_jτ) + x(g_jτ²) = 0` and `x(g_j) = x(−g_j)`, with
`σ = (0 −1; 1 0)` and `τ = (0 −1; 1 −1)`. Proof: by Manin's presentation `Symb_Γ(V) = Hom_{ℤ[Γ]}(ℤ[SL₂(ℤ)]/I, V)`
for the left ideal `I` generated by `1 + σ, 1 + τ + τ²` and `1 − (−1)`; a `ℤ[Γ]`-linear map out of `ℤ[SL₂(ℤ)]`
is its values on the coset basis; it kills `I` iff the three relations hold at every `g`, and by
equivariance it suffices to take `g = g_j`. If `g′_j = η_jg_j` with `η_j ∈ Γ`, the coordinate
change `v′_j = ρ(η_j)v_j` identifies the two relation submodules. These can be different submodules of
the fixed product `∏_j V` ([PS] §2.2, p. 8; the homological counterpart is [Wiese] Definition 5.6 and
Theorem 5.7, p. 56). *Needs:* §0.1 (Free group algebras over a finite-index subgroup); §0.2
(Manin's presentation of `Δ₀`; Modular symbols); Mathlib `Matrix.SpecialLinearGroup`, `MonoidAlgebra`.

**Checks.**

- For `Γ = SL₂(ℤ), V = V₂(ℚ)`, the boundary function `F(a/c) = (aX + cY)²` gives
  `P = Y² − X²` at representative 1 and `P′ = Y² + 2XY` at `T`. The latter fails the
  former `S`-relation: `P′ + ρ(S)P′ = X² + Y² ≠ 0`. The coordinate images differ.
- If every `η_j = 1`, the coordinate change is the identity.
- Successive changes `g′_j = η_jg_j` and `g″_j = θ_jg′_j` act by `ρ(θ_jη_j)`;
  reversing the order of these coefficient twists gives the wrong equivariance.

**A modular symbol is determined by its values on the fundamental-domain generators** (theorem).
Let `Γ ⊊ PSL₂(ℤ)` have finite index and contain `T = (1 1; 0 1)`, and let `D₁`, …, `D_t, D_∞, D′₁`, …, `D′_s`,
`D″₁`, …, `D″_r` be the generators of `Δ₀` read off a Farey fundamental domain, with matrices `γ_i ∈ Γ` and
`γ′_i, γ″_i ∈ Γ` of order 2 and 3, as in [PS] §§2.4–2.5. Over `ℤ[Γ]` they generate `Δ₀` subject exactly to the
relations
`Σ_i (γ_i⁻¹ − 1)D_i + Σ_i D′_i + Σ_i D″_i = (1 − T⁻¹)D_∞, (1 + γ′_i)D′_i = 0` and `(1 + γ″_i + γ″_i²)D″_i = 0`.
For a right `Γ`-module `V` and elements `v_i, v_∞, v′_i, v″_i ∈ V` with
`v_∞|Δ = Σ_i v_i|(1 − γ_i) − Σ_i v′_i − Σ_i v″_i (Δ := T − 1), v′_i|(1 + γ′_i) = 0` and
`v″_i|(1 + γ″_i + γ″_i²) = 0`, there is a unique `φ ∈ Symb_Γ(V)` with `φ(D_i) = v_i, φ(D_∞) = v_∞`,
`φ(D′_i) = v′_i` and `φ(D″_i) = v″_i`, and every symbol arises so. For `Γ ≤ SL₂(ℤ)`, apply this to the `image Γ̄`
on `V^Z` for `Z = Γ ∩ {±1}`, with its descended `Γ̄`-action, since `Z` acts trivially on `Δ₀`.
If `−1 ∉ Γ` then `Z = 1` and `V^Z = V`, with `Γ ≃ Γ̄`; if `−1 ∈ Γ` then `V^Z` is the `−1`-invariant
submodule. The hypotheses `Γ̄ ⊊ PSL₂(ℤ)` and `T ∈ Γ̄` are retained. The presentation is derived from
Manin's: a Farey fundamental domain `F = α₁R ∪` … `∪ α_nR` (with one-third triangles `β_iT` when `Γ` has
three-torsion) exists ([PS] Theorems 2.3 and 2.8, pp. 9 and 13); the oriented unimodular paths through the
interior of `F` together with its clockwise boundary edges form a `ℤ[Γ]`-basis of the unimodular chains (Lemma
2.5, p. 10); modulo the triangle relations the boundary edges generate, and the remaining relations are the
orientation pairings, the one-element-orbit relations and the relation `∂F = 0` ([PS] §2.4, p. 11). The
criterion then applies `φ(γD) = φ(D)|γ⁻¹` to the relations. The relation and the criterion are [PS] Theorem 2.6 and
Corollary 2.7 (p. 12) and Theorem 2.9 and Corollary 2.10 (pp. 13–14) with two corrections: the
translation term has the sign written here, which follows from the boundary relation on p. 11 by
applying `∂` with `D′_i = −∂e′_i`, and agrees with the worked `Γ₀(11)` relation in [Pollack AWS] §2.6,
footnote 10, p. 8 (whose `γ` is the `γ_i⁻¹` here); and the uniqueness statement includes `φ(D_∞) = v_∞`, and
in Corollary 2.10 the three-torsion condition is `v″_i|(1 + γ″_i + γ″_i²) = 0`. The relation on the
one-element-orbit edge is `(γ′_i + 1)e′_i ∈ J` ([PS] §2.4, p. 11). *Needs:* §0.2 (Modular symbols; Modular
symbols as functions on cosets; Manin's presentation of `Δ₀`); Mathlib `Matrix.SpecialLinearGroup`,
`CongruenceSubgroup.Gamma0`.

**Checks.**

- For `Γ₁(5), −1 ∉ Γ` and `V₁(ℚ)^Z = V₁(ℚ)`. Its four regular cusps give four
  independent boundary symbols, since `V₁(ℚ)^Γ = 0`. Taking `−1`-invariants would
  wrongly annihilate them.
- For `Γ₀(N), −1 ∈ Γ`; over `ℚ` and odd `k` its invariants in `V_k` are zero, as are
  the symbols. Here the central-invariants step is essential.
- At `Γ₀(2)` the relation is `D′₁ = (1 − T⁻¹)D_∞`, with `D′₁ = {0} − {−1}`;
  the opposite translation sign fails in `Δ₀`. The full projective group is excluded
  by the properness hypothesis.

### 0.3 Hecke operators, the involution at infinity and signs

**Hecke operators on modular symbols** (construction). Let `V` carry a right action of `Σ₀(N)` whose
restriction to `Γ₀(N)` is the given action. For `δ ∈ Σ₀(N)` and `φ : Δ₀ → V` put `(φ|δ)(D) = φ(δD)|δ`. For a
prime `ℓ ∤ N` define `φ|T_ℓ = φ|(ℓ 0; 0 1) + Σ_{a=0}^{ℓ−1} φ|(1 a; 0 ℓ)`, and for `q | N` define
`φ|U_q = Σ_{a=0}^{q−1} φ|(1 a; 0 q)`. The listed matrices are right coset representatives of
`Γ₀(N)\Γ₀(N)(ℓ 0; 0 1)Γ₀(N)` (respectively of the `U_q` double coset); right multiplication by `γ ∈ Γ₀(N)`
permutes the cosets, so these operators preserve `Symb_{Γ₀(N)}(V)`. They come from an action of the
`Γ₀(N)` Hecke ring of double cosets, and commute because that ring is commutative ([PS] §2.1, p. 7).
Preservation and commutation are statements about equivariant symbols, not about arbitrary maps
`Δ₀ → V`. API: `slashSymbol` `((φ|δ)(D) = φ(δD)|δ)`, `heckeT`, `heckeU`, `heckeT_mem_symbols` (`T_ℓ` and `U_q`
preserve `Symb_{Γ₀(N)}(V)`), `heckeT_comm` (`T_ℓT_m = T_mT_ℓ` on symbols), `heckeU_comm_heckeT`.
*Needs:* §0.1 (The Hecke monoid `Σ₀(N)`); §0.2 (Modular symbols); Tau Ceti
`HeckeRing.GL2.commSemiringHeckeRingGamma0`, `HeckeCoset.heckeSum`, `heckeSum_eq_sum_of_rightCosets`,
`heckeSum_comp_of_mem`; ModularForms Layer 8 (`Δ₀` as a `GL₂⁺(ℚ)`-module).
*Lean:* `slashSymbol`, `heckeT`, `heckeU`, `IsSigma0Action`, `heckeT_mem_symbols`,
`heckeU_mem_symbols`, `heckeT_comm`, `heckeU_comm_heckeT`.

**Checks.**

- On `Symb_{Γ₀(11)}(ℤ), T₂` has characteristic polynomial `(x − 3)(x + 2)²`: eigenvalue `1 + 2 = 3` on the
  boundary (Eisenstein) line and `a₂ = −2` of the newform of level 11 on its plus and minus parts.
- On the same module, `T₃` has characteristic polynomial `(x − 4)(x + 1)²`, with `a₃ = −1`.
- `T_ℓ` maps `Γ₀(N)`-symbols to `Γ₀(N)`-symbols. `U_q` has no `(q 0; 0 1)` term: on `Symb_{Γ₀(11)}(ℤ)` the operator
  `U₁₁` acts on the cuspidal part by `a₁₁ = 1`, the split multiplicative sign, whereas the good-prime
  formula with the extra diagonal term is not even defined there, `(11 0; 0 1) ∉ Σ₀(11)`.

The predicate `IsSigma0Action N act ρ` records the action hypothesis above: for
`γ,δ ∈ Σ₀(N), act(γδ) = act(δ) ∘ act(γ), act(1) = id`, and on `Γ₀(N)` one has
`act(γ) = ρ(γ⁻¹)`. Its API is the three projection statements and restriction to a
submonoid. The definition of `slashSymbol` uses exactly this inverse convention
([PS] §2.1, pp. 6–7).

**Checks.**

- With trivial coefficients, `act(δ) = id` and `ρ` trivial satisfy the contract.
- On `ℤ, act(δ) = 0` fails `act(1) = id`; multiplicativity by itself would accept it.
- For polynomial coefficients, using `ρ(γ)` in place of `ρ(γ⁻¹)` fails at `T` on `V₁`:
  the two substitutions send `Y` to `Y − X` and `Y + X` respectively.
- With trivial coefficients and the cusp-coordinate functional at `∞`, the identity slash
  fixes the functional, while `T₂` and `U₂` have values 3 and 2 on the path `0→∞`.

**The involution at infinity** (construction). The matrix `ι = (−1 0; 0 1) ∈ GL₂(ℚ)` acts on `P¹(ℚ)` by
`x ↦ −x` and fixes 0 and `∞`; `ι² = 1` and `det ι = −1`. When `ι` normalises `Γ` (for `Γ₀(N), Γ₁(N)` and `Γ(N)`,
conjugation by `ι` changes the signs of `b` and `c`) and `V` carries an action of the monoid generated by `Γ`
and `ι` extending the `Γ`-action, `φ ↦ φ|ι` is an involution of `Symb_Γ(V)` ([PS] §2.1, p. 7). On `V_k` it acts
by `P(X, Y) ↦ P(X, −Y)`. API: `iotaMatrix`, `iotaMatrix_mul_self` `(ι² = 1)`, `det_iotaMatrix`, `iota_normalizes_Gamma0`,
`iota_smul` `(ι·x = −x)`, `iotaSymbol` (the involution on symbols). *Needs:* §0.2 (Modular symbols);
Mathlib `Matrix.GeneralLinearGroup`, `CongruenceSubgroup.Gamma0`; ModularForms Layer 8.
*Lean:* `iotaMatrix`, `iotaMatrix_mul_self`, `det_iotaMatrix`.

**Checks.**

- `ι` fixes 0 and `∞`, and sends `1/2` to `−1/2`.
- `ι² = 1`, so `φ|ι|ι = φ`.
- `ι ∉ SL₂(ℤ)`: `det ι = −1`. A construction treating `ι` as an element of `Γ` would make every symbol
  `ι`-invariant.
- On `V₁, X|ι = X` and `Y|ι = −Y`. The matrix `diag(1, −1)` acts on the cusps exactly as `ι` does, but sends `X`
  to `−X` and fixes `Y`, so on `V_k` it is `(−1)^k` times `ι`; for odd `k` it exchanges the two signs (Convention 7),
  which the cusp action alone cannot detect.

**The plus/minus decomposition** (lemma). If `ι` normalises `Γ` and 2 acts invertibly on `V`, then
`Symb_Γ(V) = Symb_Γ(V)⁺ ⊕ Symb_Γ(V)⁻`, the `±1`-eigenspaces of `ι`, through `φ = (φ + φ|ι)/2 + (φ − φ|ι)/2`; the
Hecke operators `T_ℓ` and `U_q` commute with `ι` (`ι` normalises their double cosets), so the decomposition is
Hecke-stable under a compatible coefficient action ([PS] §2.1, p. 7). Over `ℤ` the quotient by
the sum of the eigenspaces is killed by 2 and can be nonzero. If the symbol module is finitely
generated over `ℤ`, this sum has finite index a power of 2. *Needs:* §0.3 (The involution at infinity; Hecke operators on modular symbols);
§0.2 (Modular symbols).

**Checks.**

- On `ℤ²` with the swapping involution the two eigenspaces span the pairs with
  coordinates of equal parity, an index-two submodule.
- For `Γ₀(11)` and trivial `Γ`-action on `V = ⊕_ℕ ℤ²`, let `ι` swap each pair. Boundary
  symbols give an equivariant surjection `Symb_Γ(V) → V` by evaluation at `0→∞`.
  The sign quotient surjects onto `⊕_ℕ 𝔽₂`, so its index is infinite.
- After inverting 2, `(1 + ι)/2` and `(1 − ι)/2` are complementary projectors;
  over `𝔽₂` the swapping example has coincident plus and minus eigenspaces.

### 0.4 Boundary symbols, group cohomology and parabolic cohomology

**Boundary symbols** (definition). For `Γ` of finite index and an `R`-module `V` with an `R`-linear right
`Γ`-action, where `R` is a commutative ring,
`BSymb_Γ(V) = Hom_{ℤ[Γ]}(ℤ[P¹(ℚ)], V)` is the module of maps `ψ : P¹(ℚ) → V` with `ψ(γc) = ψ(c)|γ⁻¹`.
It is an `R`-submodule of the integral Hom space, with pointwise scalar multiplication; the divisor
carrier remains `ℤ[P¹(ℚ)]`. Restriction along `Δ₀ ⊆ ℤ[P¹(ℚ)]` gives the `R`-linear map
`res : BSymb_Γ(V) → Symb_Γ(V)`, and its range is the `R`-submodule `Eis_Γ(V)` of
Eisenstein (boundary) symbols inside `Symb_Γ(V)`. Choosing representatives `c₁`, …, `c_ν` of the finitely many
cusps `Γ\P¹(ℚ)` gives `BSymb_Γ(V) ≅ ⊕_j V^{Γ_{c_j}}, ψ ↦ (ψ(c_j))_j`, where `Γ_c` is the stabiliser of `c` and
`V^{Γ_c}` the invariants of the right action: `ℤ[P¹(ℚ)]` is the direct sum of the permutation modules
`ℤ[Γ/Γ_{c_j}]`, and `Hom_{ℤ[Γ]}(ℤ[Γ/H], V) = V^H` (the homological definitions are [Wiese] Definition
`1.5(b)`–`(e)`, pp. 7–8; the orbit description is [Wiese] Lemma 4.13, p. 49). API: `boundarySymbols`,
`restrictBoundary` (the `R`-linear restriction from `boundarySymbols` to `symbols`),
`boundarySymbolsEquivCusps` (the `R`-linear isomorphism
`BSymb_Γ(V) ≃ ⊕_{c ∈ Γ\\P¹(ℚ)} V^{Γ_c}` after choosing representatives),
`eisSymbols` `(Eis_Γ(V) = range res)`, `eisSymbols_hecke` (`Eis_Γ(V)` is
stable under the `Γ₀(N)` operators `T_ℓ, U_q` and `ι` under the compatible coefficient actions of
§0.3). The `Γ₁(N)` and diamond versions are constructed in §0.5 after their operators.
*Needs:* §0.2 (Modular symbols); §0.3 (Hecke operators; The involution at infinity); Mathlib
`Representation.ofMulAction`, `Rep.ofMulAction`, `OnePoint`; ModularForms Layer 8 (the sequence
`0 → Δ₀ → ℤ[P¹(ℚ)] → ℤ → 0`). *Lean:* `boundarySymbols`, `restrictBoundary`, `eisSymbols`,
`restrictBoundary_mem_symbols`.

**Checks.**

- For every `a ∈ R` and `ψ ∈ BSymb_Γ(V)`, the pointwise multiple `aψ` is a boundary symbol,
  `res(aψ) = a·res(ψ)`, and `a·res(ψ) ∈ Eis_Γ(V)`.
- For the trivial group and `V = ℤ`, the cusp-coordinate functional at `∞` restricts to
  an Eisenstein symbol with value 1 on `{∞} − {0}`.
- For `Γ = SL₂(ℤ)` and `V = ℤ` there is one cusp with stabiliser `⟨±T⟩`, so `BSymb ≅ ℤ` consists of the constant
  functions and `res = 0`; in particular `Eis_{SL₂(ℤ)}(ℤ) = 0`.
- For `p` prime, `Γ₀(p)` has the two cusps `∞` and 0, and `BSymb_{Γ₀(p)}(ℤ) ≅ ℤ²`.
- `ker res = V^Γ` via invariant constant functions. If `V^Γ ≠ 0`, for example for
  `Γ = SL₂(ℤ), V = ℤ` trivial, a nonzero such function witnesses failure of injectivity.
- For `V = 0` restriction is injective; it is also injective for `Γ = SL₂(ℤ), V = V₂(ℚ)`,
  whose global invariant submodule is zero.

**Cohomological Hecke adapter** (construction). Let `Γ ≤ SL₂(ℤ)` have finite index,
let `Σ` be a monoid in `GL₂(ℚ)` containing `Γ` with `(Σ,Γ)` a Hecke pair, and let `V` have
a compatible right `Σ`-action. Take `H¹` of the derived-invariants action supplied by
ArithmeticLocallySymmetricSpaces §ALS.3.1, `LocallySymmetric.Hecke.derivedInvariants`.
Use the opposite monoid for the right coefficient action: `Γ → Σᵒᵖ` sends `γ` to `op(γ⁻¹)`, and
`op(δ)` acts on `V` as `v ↦ v|δ`. Thus the operator indexed here by `ΓδΓ` is the supplier's left
operator indexed by the corresponding opposite double coset. Prove that it is restriction
to `H′ = Γ ∩ δΓδ⁻¹`, coefficient conjugation
`c(h) ↦ c(δhδ⁻¹)|δ` from `H′` to `H = Γ ∩ δ⁻¹Γδ`, then corestriction from `H`, and that its explicit
cocycle sum agrees with [Wiese] Definition 7.21 and Proposition 7.22, pp. 75–76,
under the coefficient dictionary `δ^ι·v = v|δ` for his adjugate `δ^ι`. This fixes the convention before proving
`toH1_hecke`. Its API includes independence of representatives, compatibility with level
restriction and the cocycle formula. The same adapter applies to normalisers such as `ι`.

**Checks.**

- The identity double coset acts as the identity on `H¹`.
- For a normaliser `δ` the operator is just coefficient conjugation and pullback on
  cocycles; for `δ` in `Γ` it induces the identity on cohomology.
- For trivial coefficients in degree zero the double coset acts by its number of right
  cosets: `T_ℓ` by `ℓ + 1` and `U_q` by `q`, detecting the direction of the trace.

*Needs:* §0.1 (The Hecke monoid); §0.3 (Hecke operators on modular symbols);
ArithmeticLocallySymmetricSpaces §ALS.3.1 (`LocallySymmetric.Hecke.derivedInvariants`);
Tau Ceti `TauCeti.groupCohomology.corestriction`; Mathlib `groupCohomology`.

**The map from modular symbols to group cohomology** (construction). For `φ ∈ Symb_Γ(V)` and a base
cusp `x ∈ P¹(ℚ), c_φ(γ) = φ({γx} − {x})` is a 1-cocycle of `Γ` with values in `(V, ρ)`:
`c_φ(γη) = φ({γηx} − {γx}) + φ({γx} − {x}) = ρ(γ)c_φ(η) + c_φ(γ)`. Changing `x` to `y` changes `c_φ` by the coboundary
`γ ↦ (ρ(γ) − 1)φ({y} − {x})`, so the class `δ(φ) ∈ H¹(Γ, V)` does not depend on `x`, and `δ` is linear. `Up` to
sign it is the connecting homomorphism of `Hom_Γ(−, V)` on `0 → Δ₀ → ℤ[P¹(ℚ)] → ℤ → 0`; the construction
uses the explicit cocycle and Mathlib's degree-one cohomology, not Mathlib's covariant connecting
map, since `Hom_Γ(−, V)` is contravariant in the first variable ([Wiese] proof of Proposition `6.7(a)`,
pp. 63–64, for the base-point cocycle; Lemma 5.2, p. 55, for the sequence). For `V = ℂ` trivial and
`φ = ψ_f` of a weight-two cusp form (§0.7), `δ(φ)` is `γ ↦ 2πi∫_x^{γx} f(z)dz`. API: `toH1`
`(δ : Symb_Γ(V) → H¹(Γ, V))`, `toH1_cocycle` (`δ(φ)` is represented by `γ ↦ φ({γx} − {x})` for every base
cusp `x`), `toH1_eis` `(δ ∘ res = 0)`, `toH1_hecke` (`δ(φ|T) = δ(φ)|T` for the double-coset Hecke operators
on `H¹`, with the preceding adapter's convention). *Needs:* §0.4 (Cohomological Hecke adapter);
§0.2 (Modular symbols); Mathlib `groupCohomology`,
`groupCohomology.H1`. *Lean:* `symbolCocycle`, `symbolCocycle_mul`, `symbolCocycle_baseCusp`.

**Checks.**

- The classes for the base cusps `∞` and 0 agree; the cocycles differ by the coboundary of
  `φ({0} − {∞})`.
- `δ(res ψ) = 0` for every boundary symbol `ψ`, since `c_{res ψ}(γ) = (ρ(γ) − 1)ψ(x)` is a coboundary.
- For `Γ = SL₂(ℤ)` and `V = ℤ, δ = 0` because both sides vanish (`Symb = 0` and `H¹(SL₂(ℤ), ℤ) = 0`).

**The boundary exact sequence for modular symbols** (theorem). For `Γ` of finite index and every right
`ℤ[Γ]`-module `V`, the sequence `0 → V^Γ → BSymb_Γ(V) → Symb_Γ(V) → H¹(Γ, V) → ⊕_{c ∈ Γ\P¹(ℚ)} H¹(Γ_c, V)` is
exact, where the first map sends `v` to the constant function, the second is `res`, the third is `δ` and
the last is the product of the restrictions to the cusp stabilisers (chosen representatives). No
invertibility hypothesis is needed. Proof: a boundary function restricts to 0 on `Δ₀` iff it is
constant, and then its value is `Γ`-invariant; if `c_φ(g) = (ρ(g) − 1)v` then `F(c) = φ({c} − {x}) + v` is
equivariant and extends `φ`, so `ker δ = Eis_Γ(V)`; at a cusp `r` fixed by `h`, moving the base point to `r`
shows the restriction of `δ(φ)` to `Γ_r` vanishes; conversely, for a cocycle `c` whose restriction to each
`Γ_r` is a coboundary, choose `v_r` with `c(h) = (ρ(h) − 1)v_r` on `Γ_r` for one `r` in each orbit and put
`F(gr) = c(g) − ρ(g)v_r`, which is well defined and satisfies `F(gx) = ρ(g)F(x) + c(g)`, so `φ({b} − {a}) =`
`F(b) − F(a)` is a symbol with `δ(φ) = [c]` ([Wiese] Proposition 4.14, p. 50, for the cusp terms; the
topological comparison of [PS] §2.1, p. 7, is ModularCurvesPartII §§14.1–14.4a, 14.8 and 14.11–14.12). The cusp stabilisers are
`Γ_r = Γ ∩ g⟨±T⟩g⁻¹` for `r = g∞` with `g ∈ SL₂(ℤ)`. *Needs:* §0.4 (Boundary symbols; The map from modular symbols to group
cohomology); Mathlib `groupCohomology.resNatTrans`; ModularForms Layer 8. *Lean:*
`restrictBoundary_eq_zero_iff`, `symbolCocycle_isCoboundary_iff`, `symbolCocycle_isParabolic`,
`exists_symbol_of_isParabolic`
(stated with explicit cocycles and coboundaries).

**Checks.**

- For `Γ₁(4)`, the infinity stabiliser is `⟨T⟩`, whose elements have trace 2; the
  stabiliser at `1/2` contains `(1 −1; 4 −3)`, of trace `−2`. It is the intersection
  with the conjugated ambient stabiliser, not a conjugate of `Γ_∞`.
- For `Γ = SL₂(ℤ), V = ℤ` trivial, the first map identifies `V^Γ` with all boundary
  symbols, and `res = 0`.
- For `Γ = SL₂(ℤ), V = V₂(ℚ), V^Γ = 0` and `res` is injective. Exactness does
  not assert a nonzero restriction kernel for every coefficient module.

**Parabolic cohomology** (definition). `H¹_par(Γ, V)` is the kernel of `H¹(Γ, V) → ⊕_{c ∈ Γ\P¹(ℚ)} H¹(Γ_c, V)`,
the classes whose restriction to every cusp stabiliser vanishes; in the `PSL₂(ℤ)` formulation the
index set is `Γ\PSL₂(ℤ)/⟨T⟩` with groups `Γ ∩ ⟨gTg⁻¹⟩`. It does not depend on the representatives, since
restriction to `Γ_{γc} = γΓ_cγ⁻¹` is restriction to `Γ_c` followed by conjugation
([Wiese] Proposition 4.14, p. 50). On cocycles the condition is that each restriction is a
coboundary. Definition 6.12, p. 66, instead requires zero restrictions as cocycles; these
predicates are different. API: `H1par` (a submodule of
`H¹(Γ, V)`), `mem_H1par_iff` (`c ∈ H¹_par` iff its restriction to `Γ_{c₀}` vanishes for every cusp `c₀`),
`H1par_hecke` (stable under the `Γ₀(N)` Hecke operators and `ι` with compatible coefficient
actions, [Wiese] Proposition 7.22; the `Γ₁(N)` and diamond versions are §0.5), `H1par_baseChange` (for a
finitely presented coefficient module and a flat `R → S, S ⊗_R H¹_par(Γ, V) ≅ H¹_par(Γ, S ⊗_R V)`; the
finite presentation of `Γ` and of its cusp stabilisers is part of the proof). *Needs:* §0.4
(Cohomological Hecke adapter); Mathlib
`groupCohomology`, `groupCohomology.resNatTrans`, `CongruenceSubgroup.Gamma0`. *Lean:*
`cuspStabilizer`, `IsCoboundaryOn`, `IsParabolic` (the cocycle-level condition).

**Checks.**

- `dim_ℚ H¹_par(Γ₀(11), ℚ) = 2 = 2g`.
- `H¹_par(SL₂(ℤ), ℚ) = 0` (indeed `H¹(SL₂(ℤ), ℚ) = 0`, the abelianisation being finite).
- `H¹_par(Γ₀(11), ℚ) ≠ H¹(Γ₀(11), ℚ)`: the dimensions are 2 and 3, the extra class detecting the second
  cusp; a definition forgetting the cusp condition would fail here.

The light cocycle interfaces use `cuspStabilizer Γ r` for the inverse image in `Γ` of
Mathlib's stabiliser of `r` in `GL₂(ℚ)`. `IsCoboundaryOn Γ ρ H c` means that a single `v ∈ V`
satisfies `c(h) = ρ(h)v − v` for every `h ∈ H`; `IsParabolic Γ ρ c` imposes this separately
on every cusp stabiliser. These predicates test a supplied function `c`; the cocycle
identity is a separate hypothesis in the cohomological theorems. API: subgroup
restriction for coboundaries, conjugation of cusp stabilisers, base-cusp independence
of the associated class and invariance after adding a global coboundary. Source:
[Wiese] Proposition 4.14, p. 50, for the restriction class, and Proposition `6.7(a)` for the
base-cusp cocycle. Definition 6.12 uses zero-restriction representatives instead.

**Checks.**

- In `SL₂(ℤ), T` stabilises `∞` and `S` does not, since `S∞ = 0`.
- For trivial `ℤ` coefficients the zero function is a coboundary on every subgroup and
  is parabolic, whereas the constant function 1 fails both tests at the identity.
- For the coefficient-at-0 functional `φ` and base cusp `∞`, `symbolCocycle` evaluated
  at `S` is `+1`, since its divisor is `{0} − {∞}`; reversing that divisor gives `−1`.

- For `V₁(ℚ)`, choose `v = X` and `c(γ) = ρ(γ)v − v`. This is a global coboundary,
  hence parabolic here, but `c(S T S⁻¹) ≠ 0` at the stabiliser of the cusp 0. A nonzero
  coboundary restriction need not be the zero cocycle.

**Modular symbols modulo Eisenstein symbols are parabolic cohomology** (theorem). For `Γ` of finite
index and every `V, δ` induces `Symb_Γ(V)/Eis_Γ(V) ≅ H¹_par(Γ, V)`, with no invertibility
hypothesis. At `Γ₀(N)` it respects `T_ℓ, U_q` and `ι` under the compatible coefficient actions; the
`Γ₁(N)` and diamond equivariance is established in §0.5. This is the exact sequence above together
with the Hecke stability of `Eis_Γ(V)` and the equivariance of `δ` (the homological counterpart is
[Wiese] Theorem 5.9, p. 57). When 2 is invertible it induces `Symb^±/Eis^± ≅ H¹_par^±`. *Needs:* §0.4
(The boundary exact sequence; Parabolic cohomology; Boundary symbols; Cohomological Hecke adapter).

**Checks.**

- For `Γ₀(11), V = ℚ` trivial, the quotient has dimension `3 − 1 = 2`.
- For `Γ = SL₂(ℤ), V = ℚ` trivial, both sides are zero.
- Over `ℤ` the quotient comparison needs no division by 2; passing to the separate
  signed quotient is asserted after 2 is invertible.

**Descent of modular symbols from a normal subgroup** (lemma). Let `Γ′ ⊴ Γ` be finite-index subgroups of
`SL₂(ℤ)` and `V` a right `ℤ[Γ]`-module. Then `Γ/Γ′` acts on `Symb_{Γ′}(V)` by `φ ↦ φ|γ`, and
`Symb_Γ(V) = Symb_{Γ′}(V)^{Γ/Γ′}` integrally. If `[Γ : Γ′]` is invertible on `V`, then restriction gives
`H¹(Γ, V) ≅ H¹(Γ′, V)^{Γ/Γ′}` and `H¹_par(Γ, V) ≅ H¹_par(Γ′, V)^{Γ/Γ′}`, and the averaging idempotent
`e = [Γ : Γ′]⁻¹Σ_{γ ∈ Γ/Γ′}(·)|γ` makes `Symb_Γ(V)` a direct summand of `Symb_{Γ′}(V)`. The cohomological part uses Tau Ceti's finite-index corestriction and
`TauCeti.groupCohomology.map_subtype_id_comp_corestriction` for `cor ∘ res = [Γ : Γ′]`; prove
`res ∘ cor = Σ_{Γ/Γ′}` conjugation on `H¹` with the same transfer. Mathlib's
`groupCohomology.H1InfRes_exact` supplies only the exactness of the first three inflation–restriction
terms. For the parabolic statement, restrict the transfer to each cusp through the double-coset
decomposition, and use that `Γ′ ∩ Γ_c` has index dividing `[Γ : Γ′]` in `Γ_c`. In the applications
`Γ′ = Γ ∩ Γ(M)` with `M ≥ 5`, which is normal, torsion-free and has only regular cusps; `Γ ∩ Γ₁(M)` is in
general not normal in `Γ` ([Wiese] Proposition 3.26 and Theorem 3.27, p. 41, for finite-group
vanishing and inflation–restriction; parabolic compatibility uses the cusp-transfer argument
above). Proposition 6.8, p. 64, is the central-quotient example. *Needs:* §0.2
(Modular symbols); §0.4 (Parabolic cohomology); Mathlib `groupCohomology.H1InfRes_exact`,
`groupCohomology.resNatTrans`, `CongruenceSubgroup.Gamma1`, `CongruenceSubgroup.Gamma`;
Tau Ceti `TauCeti.groupCohomology.corestriction`, `map_subtype_id_comp_corestriction`.

**Checks.**

- For `Γ′ = Γ(4)` normal in `SL₂(ℤ)`, symbol descent is integral and needs no
  averaging denominator.
- With trivial `𝔽₂` coefficients, the nonzero class from `SL₂(ℤ)^{ab} → 𝔽₂`
  restricts to zero on its index-two kernel. Cohomological descent fails without
  the index-invertibility hypothesis.
- If `Γ′ = Γ`, restriction and transfer are identities and the averaging projector is 1.

### 0.5 Level `Γ₁(N)`: diamond operators, Hecke operators and characters

**Diamond operators on modular symbols** (construction). Let `V` be a right `ℤ[Γ₀(N)]`-module. For
`d ∈ (ℤ/N)^×` choose `σ_d ∈ Γ₀(N)` with lower-right entry `≡ d mod N` and put `⟨d⟩φ = φ|σ_d`, that is
`(⟨d⟩φ)(D) = φ(σ_dD)|σ_d`, for `φ ∈ Symb_{Γ₁(N)}(V)`. Two choices differ by an element of `Γ₁(N)`, which fixes
every `Γ₁(N)`-symbol, so `⟨d⟩` is well defined; `σ_dσ_e` has lower-right entry `≡` de, so `d ↦ ⟨d⟩` is a
homomorphism `(ℤ/N)^× → Aut(Symb_{Γ₁(N)}(V))`. It commutes with `T_ℓ (ℓ ∤ N)` and `U_q (q | N)` when the
coefficient action extends to their Hecke monoid, because `Γ₀(N)` normalises the `Γ₁(N)` double cosets,
and with `ι` when the coefficient action extends compatibly to `ι`, because `ισ_dι` has the same lower-right
entry. The construction itself needs only `Γ₀(N)`-coefficients ([Wiese] §1.2, p. 10, homologically;
Definition 7.23, p. 76, on cohomology). Under the period map of §0.7, `⟨d⟩ψ_f = ψ_{⟨d⟩f}` with Tau Ceti's
`diamondOp`. API: `diamond`, `diamondHom` (`(ℤ/N)^× →*` the endomorphisms of `Symb_{Γ₁(N)}(V)`),
`diamond_eq_of_Gamma0Map_eq` (`⟨d⟩` depends only on the lower-right entry mod `N`), `diamond_comm_hecke`
(`⟨d⟩T_ℓ = T_ℓ⟨d⟩, ⟨d⟩U_q = U_q⟨d⟩, ⟨d⟩ι = ι⟨d⟩`, under the compatible coefficient actions),
`fixed_diamond_eq` (the `⟨·⟩`-fixed symbols are the `Γ₀(N)`-symbols). At `Γ₁(N)` construct the
same normaliser action on boundary symbols and `H¹` through the §0.4 adapter. Prove diamond
stability of `Eis`, diamond stability of `H¹_par`, and diamond equivariance of
`Symb/Eis ≃ H¹_par`, retaining the coefficient-action hypotheses. *Needs:* §0.4 (Boundary
symbols; The boundary exact sequence; Parabolic cohomology; Cohomological Hecke adapter);
§0.2 (Modular symbols);
§0.3 (Hecke operators on modular symbols; The involution at infinity); Mathlib
`CongruenceSubgroup.Gamma1`, `CongruenceSubgroup.Gamma0Map`; Tau Ceti `HeckeRing.GL2.diamondCosetGamma1`,
`diamondOp`.

**Checks.**

- `⟨1⟩ = id`.
- `⟨−1⟩` acts on `Symb_{Γ₁(N)}(V_k(ℤ))` by `(−1)^k`: `σ_{−1} = −1` acts trivially on `Δ₀` and by `(−1)^k` on `V_k`.
- On `Symb_{Γ₀(N)}(V)`, viewed inside `Symb_{Γ₁(N)}(V)`, every `⟨d⟩` is the identity.
- For a nonzero symbol of a character `ε` modulo 5 with `ε(2) ≠ ε(2)⁻¹`, identifying `Γ₀(5)/Γ₁(5)` by the
  upper-left entry gives the eigenvalue `ε(2)⁻¹` for `⟨2⟩` instead of `ε(2)`.

**Hecke operators on `Γ₁(N)`-symbols** (construction). Let `V` be a right module over a monoid containing
`Γ₀(N)` and every matrix below. For a prime `ℓ ∤ N` put `φ|T_ℓ = Σ_{a=0}^{ℓ−1} φ|(1 a; 0 ℓ) + φ|σ_ℓ(ℓ 0; 0 1)`,
with `σ_ℓ ∈ Γ₀(N)` of lower-right entry `≡ ℓ mod N`, and for `q | N` put `φ|U_q = Σ_{a=0}^{q−1} φ|(1 a; 0 q)`. The
listed matrices are right coset representatives of `Γ₁(N)(1 0; 0 ℓ)Γ₁(N)` ([Wiese] Proposition `7.9(b)`,
p. 72), so the operators preserve `Symb_{Γ₁(N)}(V)`. They commute with each other and with the diamond
operators, since the `Γ₁(N)` Hecke ring is commutative and `φ ↦ φ|T` is an antihomomorphism from it; on
`Symb_{Γ₀(N)}(V), σ_ℓ` acts trivially and `T_ℓ` is the operator of §0.3 ([Pollack AWS] §2.9, p. 10). The
coefficient action must contain the bad-prime matrices `(1 a; 0 q)`; the monoid generated by `Γ₀(N)` and
the good-prime representatives need not contain them. On the `ε`-eigenspace,
`φ|T_ℓ = Σ_a φ|(1 a; 0 ℓ) + ε(ℓ)φ|(ℓ 0; 0 1)`, and under the period map `ψ_{T_ℓf} = ψ_f|T_ℓ`. API: `heckeTGamma1`,
`heckeUGamma1`, `heckeTGamma1_comm` (good-prime operators commute on equivariant symbols),
`heckeTGamma1_restrict` (on `Symb_{Γ₀(N)}(V)` they are the operators of §0.3), `heckeTGamma1_formula`
(the upper triangular sum plus `σ_ℓ·diag(ℓ, 1)`). Prove also the `Γ₁(N)` Hecke versions of `eisSymbols_hecke`, `toH1_hecke` and
`H1par_hecke`, and Hecke equivariance of `Symb/Eis ≃ H¹_par`, by applying the boundary
sequence and the cohomological adapter to these actual double cosets. *Needs:* §0.3 (Hecke operators on modular symbols);
§0.5 (Diamond operators); §0.1 (The Hecke monoid); §0.4 (The boundary exact sequence;
Cohomological Hecke adapter); Mathlib `CongruenceSubgroup.Gamma1`; Tau Ceti
`HeckeRing.GL2.diamondCosetGamma1`.

**Checks.**

- `T_ℓ` restricted to `Γ₀(N)`-symbols is `Σ_a φ|(1 a; 0 ℓ) + φ|(ℓ 0; 0 1)`.
- On the `Γ₀(11)`-part `Symb_{Γ₁(11)}(ℚ)[1] = Symb_{Γ₀(11)}(ℚ), T₂` has characteristic polynomial
  `(x − 3)(x + 2)²`, as in §0.3.
- At `N = 5, ℓ = 2` and coefficient degree 1, on a symbol whose diagonal contribution is nonzero with
  diamond eigenvalue `c ≠ 1`, omitting `σ_ℓ` removes the factor `c` and changes the operator.

**Modular symbols with character** (definition). For a ring `R`, a right `R[Γ₀(N)]`-module `V` and a character
`ε : (ℤ/N)^× → R^×`, `Symb_{Γ₁(N)}(V)[ε] = {φ : ⟨d⟩φ = ε(d)φ for all d}`. Equivalently it is
`Symb_{Γ₀(N)}(V ⊗ R_ε)`, where `R_ε` is `R` with the right `Γ₀(N)`-action `r·γ = ε(d_γ)⁻¹r, d_γ` the lower-right
entry: unwinding `⟨d_γ⟩φ = ε(d_γ)φ` gives `φ(γD) = ε(d_γ)·φ(D)|γ⁻¹` ([Wiese] §1.2, The modules `V_n(R)` and
`V^χ_n(R)`, pp. 8–9). It is stable under `T_ℓ, U_q` and `ι` when their coefficient actions exist, since
these commute with the diamonds. For polynomial coefficients every `φ` in it satisfies
`(ε(−1) − (−1)^k)φ = 0`, so it vanishes when that scalar is a unit, for instance over a field of
characteristic not two with mismatched parity. Under the period map, `S_{k+2}(N, ε)` (Tau Ceti's
`cuspFormCharSpace`) lands in `Symb_{Γ₁(N)}(V_k(ℂ))[ε]`. API: `symbolsChar`, `symbolsChar_equiv`
`(≃ Symb_{Γ₀(N)}(V ⊗ R_ε))`, `symbolsChar_hecke` (stable under `T_ℓ, U_q` and `ι`), `symbolsChar_one`
(`ε = 1` gives `Symb_{Γ₀(N)}(V)`). *Needs:* §0.5 (Diamond operators); §0.2 (Modular symbols); Tau Ceti
`cuspFormCharSpace`.

**Checks.**

- `ε = 1` recovers `Symb_{Γ₀(N)}(V)`.
- `Symb_{Γ₁(N)}(V_k(ℂ))[ε] = 0` when `ε(−1) ≠ (−1)^k`.
- With the twist `r·γ = ε(d_γ)r` (no inverse) one obtains the `ε⁻¹`-eigenspace instead, which differs for a
  character of order 4 modulo 5.

**The character decomposition of `Γ₁(N)`-symbols** (theorem). Put `G = (ℤ/N)^×` and `m = |G|`. Let
`B = ℤ[1/m, ζ_m]` for a chosen primitive `m`-th root of unity in characteristic zero, and let `R` be a
commutative `B`-algebra. Index by the `m` characters of `G` with values in `B`, transported to `R`. Then
`Symb_{Γ₁(N)}(V) = ⊕_ε Symb_{Γ₁(N)}(V)[ε]` as an internal direct sum, compatibly with the Hecke operators and
`ι` when their coefficient actions exist. The idempotents `e_ε = m⁻¹Σ_d ε(d)⁻¹[d]` of `R[G]` are orthogonal
and sum to 1, and `e_ε` projects onto the `ε`-eigenspace of the diamond action ([Wiese] §1.2, `(1.8)`,
p. 8, for forms). The index set is the `B`-valued character system: a ring with nontrivial idempotents
has further `R`-valued characters, which are not summands. Over `ℂ` this mirrors Tau Ceti's
`isInternal_cuspFormCharSpace`; over `ℤ` the decomposition fails in general, the idempotents not being
integral. *Needs:* §0.5 (Modular symbols with character; Diamond operators); Tau Ceti
`isInternal_cuspFormCharSpace`.

**Modular symbols commute with flat base change** (lemma). For `Γ` of finite index, a ring `R`, a right
`R[Γ]`-module `V` and a flat `R`-algebra `S`, the natural map `Symb_Γ(V) ⊗_R S → Symb_Γ(V ⊗_R S)` is an isomorphism,
compatible with the Hecke, diamond and `ι` actions. By the coset description of §0.2, `Symb_Γ(V)` is the
kernel of finitely many linear equations `V^a → V^b` (this uses that `Δ₀` is finitely presented over
`ℤ[Γ]`, for every finite-index `Γ`, including those not containing `T`), and kernels commute with flat base
change; no finiteness hypothesis on `V` is needed ([Wiese] Exercise `1.30(a)`–`(b)`, p. 17, for
homological base change; the Hom-side result follows from this finite-presentation kernel argument). In
particular `Symb_Γ(V_k(K)) ⊗_K ℂ = Symb_Γ(V_k(ℂ))` for a number field `K ⊆ ℂ`. Flatness is needed: for
`p`-torsion-free `V, Symb_Γ(V) ⊗ 𝔽_p → Symb_Γ(V/p)` is injective with cokernel the `p`-torsion of
`Ext¹_{ℤ[Γ]}(Δ₀, V)`, which need not vanish. *Needs:* §0.2 (Modular symbols as functions on cosets; A
modular symbol is determined by its values on the fundamental-domain generators); §0.1 (Free group
algebras over a finite-index subgroup); Mathlib `Module.Free`, `Module.Flat`,
`Module.FinitePresentation`; §0.2 (Manin's presentation of `Δ₀`).

**Checks.**

- For `V = V_k(K)` and `K ↪ ℂ`, scalar extension gives the complex symbol module.
- For `V = 0` the comparison identifies the two zero modules.
- For `Γ = SL₂(ℤ)` and `V = V₁(ℤ)`, the central element `−1` forces all symbols
  to vanish. Modulo 2 the coefficient module is the standard `𝔽₂²`; the value
  `X + Y` satisfies the `S`-, `τ`- and central Manin relations and gives a nonzero
  symbol. Reduction is not a flat base change.

### 0.6 Duality with the homological symbols

**The invariant pairing between `V_k` and `Sym^k`** (lemma). Let `W_k(R) = R[X, Y]_k` with the left action
`(γ·Q)(X, Y) = Q((X, Y)γ)`, and `V_k(R)` as in §0.1. If `k!` is invertible in `R` there is a unique `R`-bilinear
pairing `⟨ , ⟩ : V_k(R) × W_k(R) → R` with `⟨(uX + vY)^k, (sX + tY)^k⟩ = (ut − vs)^k`; on monomials
`⟨X^iY^{k−i}, X^jY^{k−j}⟩ = (−1)^{k−i}/C(k, i)` if `i + j = k` and 0 otherwise. It is perfect and satisfies
`⟨P|γ, Q⟩ = ⟨P, γ·Q⟩` for every integral `γ` with `det γ ≠ 0` (no determinant twist appears), so
`P ↦ ⟨P, ·⟩` is an isomorphism of right modules `V_k(R) ≅ Hom_R(W_k(R), R)`. Proof: `P|γ` sends the `k`-th power
of the linear form with coefficient vector `a` to that with vector `γ*a, γ·Q` sends `b` to `γb`, and
`det(γ*a | b) = det(a | γb)`; expanding in monomials forces the stated values, and the matrix is
anti-diagonal with unit entries ([Wiese] §1.2, The modules `V_n(R)` and `V^χ_n(R)`, p. 8; [Pollack AWS] §2.7,
p. 9). Over `ℤ` the pairing takes values in `ℤ[1/k!]` and is not integral for `k ≥ 2`; the integral
comparison of `Symb_Γ(V_k(ℤ))` with `Hom(𝕄, ℤ)` goes through the divided-power lattice. The current
`TauCeti.binaryFormDual` (a linear map from the dual of the binary forms into the binary forms,
injective when the binomial coefficients are regular, and intertwining the two actions) is the
integral counterpart and is consumed for that comparison. *Needs:* §0.1 (The coefficient
modules `V_k`); Mathlib `Matrix.adjugate`, `Matrix.adjugate_mul`, `MvPolynomial.homogeneousSubmodule`.

**Hom-side symbols are the dual of homological symbols** (comparison). For finite-index `Γ`, a left
`ℤ[Γ]`-module `W` and an abelian group `M` with trivial action, give `Hom_ℤ(W, M)` the right action
`(f|γ)(w) = f(γw)`. Then `φ ↦ ([D ⊗ w] ↦ φ(D)(w))` is an isomorphism
`Symb_Γ(Hom_ℤ(W, M)) ≅ Hom_ℤ((Δ₀ ⊗ W)_Γ, M)`, natural in `W` and `M`: tensor–hom adjunction, and coinvariants are
left adjoint to the trivial-module functor. If `W` is a module over a monoid `Σ ⊇ Γ`, the Hecke operator
`Σ_iφ|δ_i` corresponds to precomposition with `[D ⊗ w] ↦ Σ_i[δ_iD ⊗ δ_iw]`, and likewise for `⟨d⟩` and `ι`; the
transpose reverses composition, which is harmless because the Hecke algebra is commutative. With
`W = W_k(ℤ)` of the preceding target, first rotate by `JQ(X,Y) = Q(−Y,X)`. For every
integral `γ`, including nonunit determinants,
`J(γ·Q) =` `binaryFormAdjugateRep(γ)(JQ)`. Thus the comparison with ModularForms Layer 8's
module `𝕄` (pinned Tau Ceti `TauCeti.ModularSymbols` over `ℤ`) sends the pinned class `[D ⊗ Q]` to
`φ(D)(J⁻¹Q)`. Prove this identity before transposing `heckeSymbol` and `heckeTSymbol`: the pinned
`symbolIntRep_tmul` uses `γD ⊗` `binaryFormAdjugateRep(γ)Q` ([Wiese] Definition `1.5(a)`, p. 7; [Pollack AWS] §2.9, p. 10). Torsion of `𝕄` is invisible
for `M = ℤ` and visible for `M = ℚ/ℤ`. *Needs:* §0.2 (Modular symbols); §0.3 (Hecke operators on modular
symbols); §0.5 (Hecke operators on `Γ₁(N)`-symbols); Mathlib `Rep.coinvariantsTensor`,
`Rep.coinvariantsAdjunction`, `Representation.linHom`, `Representation.Coinvariants`; ModularForms
Layer 8 (pinned Tau Ceti `TauCeti.ModularSymbols`, `heckeSymbol`, `heckeTSymbol`,
`symbolIntRep_tmul`, `binaryFormAdjugateRep`). *Lean:* `symbols_dual_homology`
(the general tensor–Hom evaluation comparison).

**Checks.**

- At `k = 1` and `γ = T`, the `W_k` action fixes `X`, whereas the pinned adjugate
  action sends `X` to `X − Y`. With `JX = −Y` both sides of `J(T·X) = T·JX` are `−Y`.
- For `γ = diag(2,1)` and `Q = X, J(γ·Q) = −2Y`, equal to the adjugate action
  on `JQ`. The identity holds at this nonunit determinant as well as on `SL₂`.
- At `k = 0, J = 1` and the comparison is ordinary tensor–`Hom` evaluation.
  Torsion classes are invisible to `Hom(−,ℤ)` but detectable in `Hom(−,ℚ/ℤ)`.

**Hom-side symbols and geometric cohomology** (comparison). Let `Γ ≤ SL₂(ℤ)` have finite
index and `V` be an `R`-module with a `Γ`-action. Suppose the orders of the torsion
stabilisers are invertible on `V`. Using the analytic quotient `Y_Γ = Γ\ℍ` of
FuchsianOrbifolds Layers 2–4, identify `Symb_Γ(V)` with `H¹_c(Y_Γ,Ṽ)`. First work on the
torsion-free cover given by `Γ ∩ Γ(M), M ≥ 5`, compare the equivariant relative chain
presentation with `Δ₀`, and apply `Hom_Γ(−,V)`; retain the stabiliser-order hypothesis
in descent. For congruence `Γ` and finite free `V`, identify this with the coefficient-dual
relative homological comparison of ModularCurvesPartII §14.12 using its truncated
surface with boundary and local-coefficient duality.
The boundary-symbol map corresponds to the boundary-to-support map, `δ` to forgetting
support, and `H¹_par(Γ,V)` to `image(H¹_c → H¹)`. Require functoriality for level maps,
normalisers and the actual Hecke pullback/trace, rather than only equality of dimensions.
For `V_k(ℚ)` use §0.6's determinant pairing to identify the adjugate-polynomial coefficients
with the dual symmetric-power system. On every full-level component, transport the
scalar operators `S_ℓ` and establish the formulas
`T′_ℓ = ℓ^k T_ℓ S_ℓ⁻¹` and `S′_ℓ = ℓ^(2k)S_ℓ⁻¹` for `ℓ ∤ N`, with complex conjugation and,
after Betti–étale comparison over `ℚ_p`, the Galois action. API: `symbolsCompactSupportEquiv`,
`symbolsCompactSupportEquiv_boundary`, `parabolicGeometricEquiv`,
`adjugateCoefficientComparison` and `adjointHeckeComparison`.
Sources: [PS] §2.1, p. 7; [Nakamura] Lemma 3.1, p. 34, and §3.2, `(18)`–`(19)`, pp. 45–46.

**Checks.**

- At `Γ₀(11)` with `V = ℚ`, the compact-support rank is three and the parabolic rank two;
  the support-forgetting map kills the one-dimensional boundary image.
- At coefficient degree zero the comparison uses the constant local system and the
  adjoint formulas are `T′_ℓ = T_ℓ S_ℓ⁻¹` and `S′_ℓ = S_ℓ⁻¹`.
- For `Γ = SL₂(ℤ)` over `𝔽₂`, the stabiliser hypothesis fails; descent by division by the
  stabiliser order does not define this comparison.

*Needs:* §0.4 (The boundary exact sequence; Parabolic cohomology); §0.6 (both dualities);
FuchsianOrbifolds Layers 2–4;
ModularCurvesPartII §§14.1–14.4a, 14.8 and 14.11–14.12; AlgebraicTopology Stage 6
(cohomology with local coefficients and manifold duality).

### 0.7 Period symbols and the Eichler–Shimura isomorphism

**The period symbol of a cusp form** (construction). For `k ≥ 0, Γ` of finite index and `f ∈ S_{k+2}(Γ)`,
`ψ_f : Δ₀ → V_k(ℂ)` is the additive map with `ψ_f({s} − {r}) = 2πi∫_r^s f(z)(zX + Y)^k dz` along the geodesic
in `ℍ`, improper at cusps. It is well defined on `Δ₀` by path independence of holomorphic integrals in `ℍ`,
the improper integrals converging because `f` vanishes at every cusp. The substitution `z = γu` gives
`ψ_f(γD) = ψ_f(D)|γ⁻¹`, so `ψ_f ∈ Symb_Γ(V_k(ℂ))`. For `δ ∈ Σ₀(N)` with `det δ > 0`,
the same substitution gives `ψ_{f|δ}(D) = ψ_f(δD)|δ` for the weight-`(k + 2)` slash
`(f|δ)(z) = det(δ)^{k+1}(cz + d)^{−k−2}f(δz)`. Both symbols are compared at
`Γ′ = SL₂(ℤ) ∩ δ⁻¹Γδ`, or any finite-index subgroup of `Γ′`. Positive determinant ensures `δℍ ⊆ ℍ`.
The positive-determinant representatives for `T_ℓ, U_q` and `⟨d⟩` therefore give `ψ_{Tf} = ψ_f|T`.
For the involution use `fᶜ(z) = overline(f(−overline(z)))`, a cusp form for `ιΓι⁻¹`, and prove
`ψ_f|ι = (−1)^k overline(ψ_{fᶜ})`, where the bar conjugates polynomial coefficients.
Every negative-determinant matrix factors as `ι` times a positive-determinant matrix;
its algebraic action on symbols is compared with periods through this conjugation identity.
The coefficient and symbol monoid `Σ₀(N)` still includes both determinant signs. Under
the pairing of §0.6, `⟨(zX + Y)^k, Q⟩ = (w·Q)(z, 1)` with `w = (0 1; −1 0)`, as one checks on `Q = (sX + tY)^k`
where both sides are `(tz − s)^k`; hence `⟨ψ_f(D), Q⟩ = 2πi·rawPairing(f)(D ⊗ w·Q)`, and `ψ_f` is Layer 8's period map
transported to the `Hom` side, with Layer 8's orientation (it integrates `{α, β}` from `β` to `α`) taken into
account ([Pollack AWS] §2.7, p. 9; cuspidality of `δ(ψ_f)` is [Wiese] Proposition 6.9, p. 65). API:
`periodSymbol` (`f ↦ ψ_f, ℂ`-linear into `Symb_Γ(V_k(ℂ))`), `periodSymbol_apply`, `periodSymbol_hecke`
(`ψ_{Tf} = ψ_f|T` for `T_ℓ, U_q, ⟨d⟩`), `periodSymbol_eq_periodMap` (the transport identity above),
`periodSymbol_injective` (from `TauCeti.ModularSymbols.periodMap_injective`). *Needs:* §0.2 (Modular
symbols); §0.1 (The coefficient modules `V_k`); §0.6 (both targets); §0.5 (Diamond operators; Hecke
operators on `Γ₁(N)`-symbols); Mathlib `CuspForm`, `UpperHalfPlane`; Tau Ceti `diamondOp`; ModularForms
Layer 8 (pinned Tau Ceti `rawPairing`, `periodMap`, `periodMap_injective`, `cuspIntegral`).

**Checks.**

- For a weight-two cusp form of level 11 with real `q`-coefficients, `ψ_f({0} − {∞})` is real: the imaginary
  part of `2πi∫_{i∞}^0 f(z)dz = 2π∫_0^∞ f(iy)dy` vanishes.
- The `Y^k`-coefficient of `ψ_f({0} − {∞})` is `L(f, 1)`, and more generally
  `ψ_f({0} − {∞}) = Σ_{j=0}^{k} C(k, j)·j!(−2πi)^{−j}L(f, j + 1)X^jY^{k−j}` ([Pollack AWS] §2.8); the factor `2πi` in `ψ_f`
  and the path from `i∞` to 0 are what make the `j = 0` term exactly `L(f, 1)`.
- `ψ_0 = 0`.
- `δ = diag(−1,1)` belongs to `Σ₀(N)` but its ordinary fractional-linear map takes `i` to `−i`;
  it is excluded from the holomorphic slash formula. At `k = 0` and `f = fᶜ`,
  the conjugation identity instead reads `ψ_f|ι = overline(ψ_f)`.
- `δ = diag(1,ℓ), ℓ > 0`, has positive determinant and maps `i` to `i/ℓ`; its period
  identity holds at the transported level `Γ′`. Diamond representatives have determinant one.
- In odd degree, `ψ_f|ι = −overline(ψ_{fᶜ})`; omitting `(−1)^k` changes this sign.
- With the unadjugated action `P((X, Y)γ)` in place of the adjugate one, `ψ_f` fails the equivariance
  `φ(γD) = φ(D)|γ⁻¹` for `k = 2` and `Γ₀(11)`, so the convention is forced.
- In degree one with `Q = X`, the rotation `Q(−Y, X)` evaluates at `(z, 1)` to `−1`, matching the determinant
  pairing; the unsigned swap `Q(Y, X)` gives `+1` and cannot implement it.

**Dimension of parabolic cohomology** (theorem). Let `K` have characteristic zero and let `Γ ≤ SL₂(ℤ)` have
finite index and be torsion-free (in particular `−1 ∉ Γ`). Write `μ = [PSL₂(ℤ) : Γ̄]` for the index of its
image, and `c_k = Σ_{r ∈ Γ\P¹(ℚ)} dim_K V_k(K)^{Γ_r}`. Then `dim H¹(Γ, V_k) = (k + 1)μ/6 + δ_{k,0}` and
`dim H¹_par(Γ, V_k) = (k + 1)μ/6 − c_k + 2δ_{k,0}`. A regular cusp (stabiliser generated by a positive
unipotent) contributes 1 to `c_k`; an irregular cusp (generated by the negative of a unipotent)
contributes 1 for even `k` and 0 for odd `k`, because `−T^w` acts on degree `k` by `(−1)^k` times a unipotent.
Proof: `H¹(Γ, V_k) = H¹(PSL₂(ℤ), Coind V_k)` by Shapiro; the Mayer–Vietoris sequence of
`PSL₂(ℤ) = ⟨σ⟩ ∗ ⟨τ⟩` with invariant dimensions `μ(k + 1)/2` and `μ(k + 1)/3` computes it; and the exact row
`0 → H¹_par → H¹ → ⊕_cusps H¹(Γ_c, V) → V_Γ → 0`, with `dim V_k^Γ = dim (V_k)_Γ = δ_{k,0}` since `Γ` contains powers
of both unipotent generators, gives the parabolic part ([Wiese] Proposition 4.16, pp. 51–52, where
the cusp term must be `c_k` as defined here and the order-three invariants have dimension `(k + 1)μ/3`).
*Needs:* §0.4 (Parabolic cohomology); §0.1 (The coefficient modules `V_k`); Mathlib `groupCohomology`,
`groupCohomology.coindIso`, `Rep.coind`, `CongruenceSubgroup.Gamma1`; ModularForms Layer 10C.

**Petersson detection of period cocycles** (theorem). For torsion-free finite-index `Γ ≤ SL₂(ℤ)` and
`k ≥ 0`, the map `S_{k+2}(Γ) ⊕ S̄_{k+2}(Γ) → H¹_par(Γ, V_k(ℂ)), (f, ḡ) ↦ δ(ψ_f) + conj(δ(ψ_g))`, is injective;
the second summand carries the conjugate scalar multiplication and conjugation on cohomology is
induced by the real structure of `V_k`. Proof: pair the coinduced polynomial modules by the
determinant pairing of §0.6 summed over `Γ\PSL₂(ℤ)`, which defines a cusp-relative cup pairing on
parabolic classes using only `1/2` and `1/3` ([Wiese] Proposition 6.13); integrating over the standard
fundamental triangle shows that the mixed holomorphic–antiholomorphic value is a nonzero scalar
(`(2i)^{k+1}μ` before the normalisation `2πi` of `ψ` and conjugation) times the Petersson product, while the
holomorphic–holomorphic and antiholomorphic–antiholomorphic values vanish by Stokes ([Wiese]
Proposition 6.14, pp. 69–70); pairing a kernel element against the conjugate class of `f` and then
against the class of `g` forces `f = 0` and `g = 0` by positivity ([Wiese] proof of Theorem 6.15, pp. 70–71).
Injectivity of the two summands separately would not suffice. *Needs:* §0.7 (The period symbol);
§0.4 (The map from modular symbols to group cohomology; Parabolic cohomology); §0.6 (The invariant
pairing); Mathlib `Rep.coind`, `groupCohomology.coindIso`; Tau Ceti
`CuspForm.peterssonInnerCosets_definite`.

**The Eichler–Shimura isomorphism** (theorem). For `Γ ≤ SL₂(ℤ)` of finite index and `k ≥ 0`, the map
`S_{k+2}(Γ) ⊕ S̄_{k+2}(Γ) → H¹_par(Γ, V_k(ℂ)), (f, ḡ) ↦ δ(ψ_f) + conj(δ(ψ_g))`, is an isomorphism, compatible
with the Hecke and diamond operators for every double coset and normaliser action defined for `Γ` and
extended to the coefficients (at `Γ₁(N)`, the operators of §0.5). When `ι` normalises `Γ, f ↦ δ((1 ± ι)ψ_f)` is
an isomorphism `S_{k+2}(Γ) ≅ H¹_par(Γ, V_k(ℂ))^±` for each sign; by §0.4 the same holds for
`Symb_Γ(V_k(ℂ))/Eis_Γ(V_k(ℂ))`. Proof: for torsion-free `Γ`, injectivity is the Petersson detection above,
and the dimension formula gives `(k + 1)μ/6 − c_k + 2δ_{k,0} = 2 dim S_{k+2}(Γ)` by ModularForms Layer 10C;
Hecke compatibility is [Wiese] Proposition 7.24, and the signed statements follow by dimension as in
[Wiese] Corollary 7.33, pp. 79–80; general `Γ` descends from the normal torsion-free `Γ ∩ Γ(M), M ≥ 5`, by §0.4
([Wiese] Theorem 6.15, p. 70, for `Γ₁(N), N ≥ 4`, whose odd-weight `N = 4` case needs the cusp count `c_k`).
*Needs:* §0.7 (The period symbol; Dimension of parabolic cohomology; Petersson detection of period
cocycles); §0.4 (Cohomological Hecke adapter; The map from modular symbols to group cohomology; Parabolic cohomology; Modular symbols
modulo Eisenstein symbols; Descent from a normal subgroup); §0.6 (The invariant pairing); §0.5 (Hecke
operators on `Γ₁(N)`-symbols); §0.3 (The plus/minus decomposition); Mathlib `CuspForm`; Tau Ceti
`CuspForm.peterssonInnerCosets_definite`; ModularForms Layers 8 and 10C.

**Checks.**

- At `Γ₀(11), k = 0`, the two-dimensional parabolic cohomology has one line of each sign.
- At `Γ₁(4), k = 1`, both cusp forms and parabolic cohomology vanish; counting its
  irregular cusp as regular would give the wrong dimension.
- At `SL₂(ℤ), k = 10`, each signed parabolic space is the line of `Δ`; the two
  complex summands together have dimension two.

**Cuspidal and Eisenstein eigensystems are distinct** (theorem). Let `f` be a normalised newform of
weight `k + 2`, level `N` and character `ε`, let `M` be a multiple of `N`, and let `Γ` be a group with
`Γ₁(M) ⊆ Γ ⊆ Γ₀(M)`. Every eigensystem of the good Hecke operators `T_ℓ, ℓ ∤ M`, on the Eisenstein
subspace of weight `k + 2` and level `M`, and on `Eis_Γ(V_k(ℂ))`, has the form `ℓ ↦ ψ(ℓ) + φ(ℓ)ℓ^{k+1}` for
Dirichlet characters `ψ, φ` of modulus dividing `M` (ModularForms Layers 0 and 5; [Wiese] Theorem `1.9(a)`,
p. 12, transported to the `Hom` side by §0.6). None of these equals `ℓ ↦ a_ℓ(f)`: at a prime `ℓ ≡ 1 mod M` the
Eisenstein value is `1 + ℓ^{k+1}`; for `k ≥ 1` Hecke's bound `a_ℓ(f) = O(ℓ^{(k+2)/2})` gives
`|a_ℓ(f)| < 1 + ℓ^{k+1}` for all large such `ℓ`; for `k = 0` every such `ℓ` has `|a_ℓ(f)| < ℓ + 1`, because
`T_ℓf` is a sum of `ℓ + 1` translates `f|β_j` of the same Petersson norm as `f` (`σ_ℓ ∈ Γ₁(M)` as `ℓ ≡ 1 mod M`),
and equality in the triangle inequality would make all of them proportional to `f`, which the
q-expansion of `f|diag(1, ℓ)` excludes ([Elkik] §III, pp. 64–66). Primes `ℓ ≡ 1 mod M` beyond any bound
exist. Consequently, for one such prime `ℓ` and `d = dim Eis_Γ(V_k(ℂ))`, the operator
`G = (T_ℓ − 1 − ℓ^{k+1})^d` kills `Eis_Γ(V_k(ℂ))` and acts on `λ_f`-eigenvectors by the nonzero scalar
`c = (a_ℓ(f) − 1 − ℓ^{k+1})^d`, so every `λ_f`-eigenvector of `Symb_Γ(V_k(ℂ))/Eis_Γ(V_k(ℂ))` has the
`λ_f`-eigenvector `c⁻¹G(φ)` as a lift, independent of the chosen preimage `φ`; vanishing of the intersection alone would not
give the lift. This separation is what makes the boundary spectrally disjoint from `λ_f` at levels `N` and
`Np` in §0.7 and §2.1. *Needs:* §0.4 (Boundary symbols; Modular symbols modulo Eisenstein symbols); §0.5
(Hecke operators on `Γ₁(N)`-symbols); §0.6 (Hom-side symbols are the dual of homological symbols);
Mathlib `CuspFormClass.qExpansion_isBigO` (Hecke's bound), `Nat.exists_prime_gt_modEq_one`;
ModularForms Layers 0 and 5 (Eisenstein series with character, their q-expansions and the
coefficient characterisation of eigenforms).

**Newform eigenspaces of modular symbols are one-dimensional** (theorem). Let `f ∈ S_{k+2}(Γ₁(N))` be a
newform of level `N` with character `ε` and coefficient field `K_f = ℚ(a_n(f), ε)`. For each sign, the
subspace `Symb_{Γ₁(N)}(V_k(K_f))^±[ε][λ_f]` on which every `T_ℓ, ℓ ∤ N`, acts by `a_ℓ(f)` is one-dimensional over
`K_f`, meets `Eis_{Γ₁(N)}` trivially, and after `⊗ℂ` is spanned by `(1 ± ι)ψ_f`. Hypotheses: `f` is new at its
primitive level; 2 is invertible; `K_f` contains the values of `ε`. Proof: by ModularForms Layers 4 and 5
the fixed-character eigenspace with the eigenvalues of `f` away from `N` lies in the newspace, where
Tau Ceti's `finrank_cuspFormsNewEigenspace_eq_one` gives `ℂf`; Eichler–Shimura and §0.4 give a
one-dimensional signed quotient eigenspace. The Eisenstein symbols carry only Eisenstein
eigensystems, none of which is `λ_f`, and quotient eigenvectors lift through the polynomial in one good
`T_ℓ` of the previous target, which commutes with every Hecke operator and with `ι`. Finally
`Symb(V_k(K_f)) ⊗_{K_f} ℂ = Symb(V_k(ℂ))` and taking
`λ_f`-eigenspaces commutes with this flat base change, so the `K_f`-dimension is 1 ([Wiese] Theorem 1.9,
p. 12; the level-11 plus eigensymbol is [Pollack AWS] §2.3, p. 4). For an oldform eigensystem the
eigenspace is at least two-dimensional, so the newform hypothesis is necessary. *Needs:* §0.7 (The
Eichler–Shimura isomorphism); §0.4 (Modular symbols modulo Eisenstein symbols; Boundary symbols);
§0.5 (Modular symbols commute with flat base change; Modular symbols with character; Hecke operators
on `Γ₁(N)`-symbols); §0.3 (The plus/minus decomposition); §0.7 (Cuspidal and Eisenstein eigensystems are
distinct, with `M = N`); Tau Ceti `HeckeRing.GL2.Newform`,
`HeckeRing.GL2.finrank_cuspFormsNewEigenspace_eq_one`; ModularForms Layers 4 and 5.

### 0.8 The rational Drinfeld–Manin splitting

**Rational separation of parabolic and boundary Hecke supports** (theorem). Let `N ≥ 3, k ≥ 0`,
`H = H¹(Γ(N), V_k(ℚ))` and `P = H¹_par(Γ(N), V_k(ℚ))`, and let `T` be the `ℚ`-subalgebra of `End_ℚ(H)` generated by
the good-prime operators `T_ℓ` and the scalar operators `S_ℓ, ℓ ∤ N`, transported to the adjugate
polynomial action. There are `A ∈ T` and coprime `F, G ∈ ℚ[X]` with `F(A) = 0` on `P` and `image(G(A)) ⊆ P`
(equivalently `G(A) = 0` on `H/P`). Take `A = T_ℓ` for a prime `ℓ ≡ 1 mod N` (Mathlib's
`Nat.exists_prime_gt_modEq_one`), `G = X − (1 + ℓ^{k+1})` (the eigenvalue of `T_ℓ` on the boundary quotient
at full level for such `ℓ`) and `F` the characteristic polynomial of `A` on `P`: Cayley–Hamilton gives
`F(A)|_P = 0` and the boundary computation gives `G(A) = 0` on `H/P`, and `F` and `G` are coprime because no
cusp-form eigenvalue equals `1 + ℓ^{k+1}`. In weight two `(k = 0)` this is Elkik's bound `|a_ℓ| < ℓ + 1` by the
Petersson norm and the Fourier expansion, without Deligne's theorem ([Elkik] §III, pp. 64–66); for
`k > 0` it is Shokurov's boundary scalar and Fourier-coefficient bound for sufficiently large such `ℓ`
([Shokurov] §4, Theorem 4.3 and Corollaries 4.4–4.5, pp. 637–641; summarised in [Sharifi] Theorem
3.4.16 and Remark 3.4.17, p. 38), transported from his homological polynomial model to the
cohomological model through §0.6 (Hom-side symbols and geometric cohomology) and the full-level dictionary of ModularCurvesPartII §§14.1–14.4a, 14.8 and 14.11–14.12. The
annihilators control generalised eigenspaces, so a non-semisimple boundary extension is allowed; the
separation is over `ℚ` and gives no coprimality over `ℤ` at a congruence prime. *Needs:* §0.4 (Parabolic
cohomology; The boundary exact sequence); §0.7 (The Eichler–Shimura isomorphism); §0.5 (Hecke
operators on `Γ₁(N)`-symbols); Mathlib `CongruenceSubgroup.Gamma`, `Algebra.adjoin`, `IsCoprime`,
`LinearMap.aeval_self_charpoly`, `Nat.exists_prime_gt_modEq_one`; ModularCurvesPartII §§14.1–14.4a, 14.8 and 14.11–14.12.

**The rational Drinfeld–Manin splitting** (construction). For `N ≥ 3` and `k ≥ 0` there is a unique `ℚ`-linear
retraction `s_N : H¹(Γ(N), V_k(ℚ)) → H¹_par(Γ(N), V_k(ℚ))` equivariant for the good Hecke operators `T_ℓ` and
`S_ℓ, ℓ ∤ N`; its composite with the inclusion is the rational parabolic projector. Construction: with
`A, F, G` from the previous target and Bézout polynomials `aF + bG = 1`, put `e = b(A)G(A)`; its image lies
in `P` and it is the identity on `P` because `F(A)` kills `P`, so restricting the codomain gives `s_N`, whose
kernel is a complement by `LinearMap.isCompl_of_proj`. Every good Hecke operator commutes with `A`,
hence with `e`. If `t` is another equivariant retraction, it commutes with `A`, and `t(1 − e) =`
`a(A)|_P F(A)|_P t = 0` while `te = s_N`, so `t = s_N`. An endomorphism preserving `P` and commuting with the good
Hecke operators commutes with `e`. After the geometric dictionary of ModularCurvesPartII §§14.1–14.4a, 14.8 and 14.11–14.12, the
direct sum over the geometric components of `Y(N)` gives Nakamura's `s_N : H¹(Y(N)(ℂ), 𝒱_{k+2/ℚ}) →`
`H¹(X(N)(ℂ), j_*𝒱_{k+2/ℚ})`, and because it commutes with the usual and the adjoint Hecke operators
(`T′_ℓ = ℓ^kT_ℓS_ℓ⁻¹, S′_ℓ = ℓ^{2k}S_ℓ⁻¹`, [Nakamura] Lemma 3.1, p. 34, whose weight `k` is `k + 2` here), it
commutes with complex conjugation and, after extension of scalars to `ℚ_p` and the Betti–étale comparison, with the Galois
action ([Nakamura] §3.2, opening paragraph and the isomorphisms `(18)`–`(19)`, pp. 45–46). Rationality is
essential: no integral splitting exists in general. API: `drinfeldManin` `(s_N)`, `drinfeldManin_subtype` (`s_N(x) = x` on `P`), `drinfeldManin_hecke` and
`drinfeldManin_scalarHecke` (equivariance for `T_ℓ` and `S_ℓ`), `drinfeldManin_unique`,
`drinfeldManin_idempotent`, `drinfeldManin_natural` (an endomorphism preserving `P` and commuting with the
good `T_ℓ` and `S_ℓ` commutes with the projector). *Needs:* §0.8 (Rational separation); §0.4 (Parabolic
cohomology); Mathlib `Submodule.projectionOnto`, `LinearMap.isCompl_of_proj`; ModularCurvesPartII
§§14.1–14.4a, 14.8 and 14.11–14.12; ModularForms Layer 10C `(g(X(3)) = 0, g(X(6)) = 1)`. *Lean:* `bezoutProjector`,
`bezoutProjector_idempotent`, `bezoutProjector_comm`.

**Checks.**

- At `N = 3` and `k = 0, X(3)` has `genus` zero, `P = 0` and `s₃` is the zero map, while `H¹(Γ(3), ℚ)` has dimension 3:
  the ordinary and parabolic spaces are not identified.
- At `N = 6` and `k = 0, dim_ℚ P = 2` and `s₆` is the identity on `P`, which excludes the zero retraction.
- For `H = ℚ², P = ℚ × {0}` and `T(x, y) = (y, 2y)`, the Bézout projector `e = 1 − T/2` sends `(0, 1)` to `(−1/2, 0)`,
  fixes `(1, 0)`, kills `T(H)`, commutes with `T` and satisfies `e² = e`; the projection onto the first
  coordinate does not commute with `T`.
- In the same model over `ℤ` there is no `ℤ`-linear retraction `s : ℤ² → ℤ` with `s(1, 0) = 1` and `s(Tv) = 0` for all
  `v`: `v = (0, 1)` forces `1 + 2s(0, 1) = 0`.

### Examples

For `Γ₀(11)` and `V = ℚ` the boundary sequence reads `0 → ℚ → ℚ² → ℚ³ → ℚ³ → ℚ²`, with
`H¹(Γ₀(11), ℚ) = Hom(Γ₀(11), ℚ)` of dimension `3 = 2g + (c − 1)` (the image of `Γ₀(11)` in `PSL₂(ℤ)` is free of
rank 3), `Eis` of dimension 1 and the image of `δ` the two-dimensional parabolic part; with `V = ℚ` trivial
the generator criterion of §0.2 has `t = 2` free values, so `dim Symb_{Γ₀(11)}(ℚ) = t + 1 = 3`, and
`Symb_{Γ₀(11)}(ℚ) ⊗ ℂ = Symb_{Γ₀(11)}(ℂ)`. For `Γ₁(11)` (`μ = 60`, ten cusps, all regular), `k = 0` gives
`dim H¹_par = 10 − 10 + 2 = 2 = 2·genus(X₁(11))`; for `Γ₁(5)` (`μ = 12`, four cusps) `k = 0` gives 0 (`genus` zero) and
`k = 2` gives `2 = 2·dim S₄(Γ₁(5))`; for `Γ₁(4)` and `k = 1` (`μ = 6`, three cusps of which two are regular; the
matrix `(1 −1; 4 −3)` fixes `1/2` and has trace `−2`) the dimension is `2 − 2 = 0`, whereas counting all three cusps
would give `−1`. At level one and weight 12 `(k = 10)` the signed spaces `H¹_par(SL₂(ℤ), V₁₀(ℂ))^±` are lines
spanned by the images of `Δ`. For the newform of level 11, `Symb_{Γ₀(11)}(ℚ)^+[λ_f]` is spanned by the plus
symbol of `X₀(11)`. For `Γ′ = Γ(4) ⊴ SL₂(ℤ), Symb_{SL₂(ℤ)}(V_k(ℤ)) = Symb_{Γ(4)}(V_k(ℤ))^{SL₂(ℤ)/Γ(4)}` integrally,
with no division by 2 or 3; the cohomological descent does need the index inverted: for `𝔽₂` trivial
and `Γ′` the kernel of `SL₂(ℤ) → SL₂(ℤ)^{ab} ≅ ℤ/12 → 𝔽₂`, the nonzero class in `H¹(SL₂(ℤ), 𝔽₂)` restricts to 0. For
the `Γ₀(2)` fundamental domain with vertices `−1`, 0, `∞ (t = 0, s = 1, γ′₁ = (1 1; −2 −1))`, the generator
relation reads `D′₁ = (1 − T⁻¹)D_∞ = {0} − {−1}`; with the opposite translation sign it would force `2D′₁ = 0`
in the torsion-free group `Δ₀`.

### Dependencies

This layer is the base of the roadmap. From Mathlib it uses the declarations listed under the
supplier contracts for divisors, matrices, congruence subgroups, monoid algebras, homogeneous
polynomials, representations, coinvariants, group cohomology with restriction, inflation and
Shapiro, flatness and finite presentation, cusp forms, Cayley–Hamilton and projections. From Tau Ceti
it uses the `Γ₀(N)` Hecke ring, the `Γ₁(N)` diamond cosets, `diamondOp`, the character spaces and their
decomposition, newforms and newspace multiplicity one, and Petersson definiteness; from the current
library the Layer-8 divisor modules, homological symbols, binary-form actions and period map. From
the roadmaps it uses ModularForms Layers 0, 4, 5, 8 and 10C;
ArithmeticLocallySymmetricSpaces §ALS.3.1; ModularCurvesPartII §§14.1–14.4a, 14.8 and 14.11–14.12;
FuchsianOrbifolds Layers 2–4 and AlgebraicTopology Stages 2 and 6.

## Layer 1: periods, critical values and `p`-stabilisation

Throughout, `f ∈ S_{k+2}(Γ₁(N))` is a normalised newform with character `ε` (also written `ε_N`), coefficient field
`K_f = ℚ(a_n(f), ε)` with a fixed embedding `K_f ↪ ℂ`, and `χ` is a primitive Dirichlet character of conductor
`m ≥ 1`. L-functions, twisted L-series, the Mellin transform and the entire extension are those of
ModularForms Layer 7. Proposed home: `TauCeti/NumberTheory/ModularForms/ModularSymbols/Periods`.

### 1.1 Period lines and integral periods

**Period lines and periods** (definition). For each sign `±` the period line of `f` is
`L_f^± = Symb_{Γ₁(N)}(V_k(K_f))^±[ε][λ_f]`, a one-dimensional `K_f`-space by §0.7, and `ψ_f^± = (1 ± ι)ψ_f` lies in
`L_f^± ⊗_{K_f} ℂ`, which is the `f`-isotypic signed part of `Symb_{Γ₁(N)}(V_k(ℂ))` by flat base change. A period
exists only after a basis is chosen: for `φ^± ∈ L_f^± ∖ {0}`, the period `Ω_f^±(φ^±) ∈ ℂ^×` is the scalar
with `ψ_f^± = Ω_f^±(φ^±)·φ^±`; it is nonzero because `ψ_f^± ≠ 0` by Eichler–Shimura. Replacing `φ^±` by `λφ^±`,
`λ ∈ K_f^×`, replaces `Ω_f^±` by `λ⁻¹Ω_f^±` and every period-normalised value by `λ` times itself, so only
statements invariant under this rescaling are basis-free; no canonical `K_f`-basis is assumed
([Pollack AWS] §2.12, pp. 12–13). API: `periodLine` `(L_f^±)`, `periodLine_finrank` (dimension one
over `K_f`), `period` (`Ω_f^±(φ)` for nonzero `φ ∈ L_f^±`), `period_smul` `(Ω_f^±(λφ) = λ⁻¹Ω_f^±(φ))`,
`psi_eq_period_smul` `(ψ_f^± = Ω_f^±(φ)·φ in L_f^± ⊗ ℂ)`. *Needs:* §0.7 (Newform eigenspaces are
one-dimensional; The period symbol); §0.3 (The plus/minus decomposition); §0.5 (Modular symbols commute
with flat base change). *Lean:* `periodScalar`, `periodScalar_spec`, `periodScalar_smul`.

**Checks.**

- For the newform of level 11 `(k = 0), ι` fixes 0 and `∞`, so `ψ_f^+({0} − {∞}) = 2ψ_f({0} − {∞}) = 2L(f, 1) ≈ 0.50768`.
- `Ω(λφ) = λ⁻¹Ω(φ)`: rescaling the basis by `λ` multiplies the period by `λ⁻¹`, a field identity that a
  definition through a fixed canonical basis would not see.
- The unsplit `f`-isotypic eigenspace (no sign condition) is two-dimensional, whereas the span of `ψ_f` is
  one-dimensional: `ψ_f` alone is not a basis of it, and a scalar period for the whole eigenspace needs
  two signed coordinates.

**Saturated integral lattices and integral periods** (construction). Let `𝒪` be a discrete valuation ring
(or a principal ideal domain) whose fraction field `K` contains `K_f`, for example the completion of `𝒪_{K_f}`
at a prime, and let `V_k(𝒪) = 𝒪[X, Y]_k` with the action of §0.1. The saturated lattice
`L_f^±(𝒪) = (L_f^± ⊗_{K_f} K) ∩ Symb_{Γ₁(N)}(V_k(𝒪))` is free of rank one over `𝒪`: `Symb_{Γ₁(N)}(V_k(𝒪))` is finitely
generated (by Manin's presentation) and torsion-free and embeds in `Symb_{Γ₁(N)}(V_k(K))` by flat base
change; the intersection with a `K`-line is nonzero (clear denominators) and is a finitely generated torsion-free
module of rank one, hence free; the quotient by it is torsion-free by construction. A generator
`φ_𝒪^±` is unique up to `𝒪^×`, so the integral period `Ω_{f,𝒪}^± = Ω_f^±(φ_𝒪^±)` is defined up to `𝒪^×`. It depends on
the lattice `V_k(𝒪)`: `V_k(𝒪)` and `Hom(Sym^k 𝒪², 𝒪)` can differ integrally; the pairing of §0.6
identifies them after inverting `k!`. A local coefficient field
has no distinguished complex embedding, so a complex scalar period requires a chosen embedding of `K`
into `ℂ` extending the one of `K_f`; without it the integral period is a coordinate on the abstract signed
line. Comparisons with integral Hecke modules (freeness of the `f`-part over a localised Hecke algebra,
congruence modules) need multiplicity-one hypotheses and are not part of this target ([PS] §6.3, p. 28, for
the normalisation by integral values with at least one unit value; [Pollack AWS]
§2.12, footnote 14, p. 13). API: `integralPeriodLattice` (`L_f^±(𝒪)` as an `𝒪`-submodule of `Symb(V_k(𝒪))`),
`integralPeriodLattice_free` (free of rank one), `integralPeriod` (`Ω_{f,𝒪}^±` from a generator),
`integralPeriod_unit` (two generators give periods differing by a unit). *Needs:* §1.1 (Period lines and
periods); §0.5 (Modular symbols commute with flat base change); §0.6 (The invariant pairing); §0.2
(Modular symbols).

**Checks.**

- Over `ℤ_(p)` in weight two `(k = 0)`, a generator of the saturated line takes at least one unit value;
  merely choosing a nonzero bounded symbol in the line does not ensure this.
- Two generators differ by `𝒪^×`, and so do their periods.
- `p·L_f^±(𝒪)` is a lattice in the line but not saturated, and its generator's period is off by `p`, not by a
  unit.
- For `p ≤ k, V_k(𝒪)` and `Hom(Sym^k 𝒪², 𝒪)` can give different saturations, the pairing of §0.6 having the
  denominators `C(k, i)`.
- For `k = 3` over `ℤ₂`, the binomial coefficients `(1, 3, 3, 1)` are all units, so the pairing of §0.6
  is already integral and perfect, and `TauCeti.binaryFormDual` is bijective, although `3! = 6` is not a unit.

### 1.2 The twisted Mellin formula and algebraicity of critical values

**The twisted Mellin formula for modular symbols** (theorem). Let `f = Σa_nq^n ∈ S_{k+2}(Γ₁(N)), χ` primitive
of conductor `m, τ(χ) = Σ_{a mod m} χ(a)e^{2πia/m}`, and `0 ≤ j ≤ k`. Along vertical paths,
`Σ_{a mod m} χ(a)·2πi∫_{i∞}^{a/m} f(z)(z − a/m)^j dz = τ(χ)·j!/(−2πi)^j·L(f, χ̄, j + 1)`. For `m = 1` this is
`2πi∫_{i∞}^0 f(z)z^jdz = j!/(−2πi)^j·L(f, j + 1)`. In symbol form, with
`λ_{j,x}(P) = (j!/k!)(∂_Y^{k−j}P)(1, −x)` (so that `λ_{j,x}((zX + Y)^k) = (z − x)^j`),
`Σ_a χ(a)λ_{j,a/m}(ψ_f({a/m} − {∞})) = τ(χ)·j!/(−2πi)^j·L(f, χ̄, j + 1)`. Proof: Birch's lemma
`Σ_{a mod m} χ̄(a)e^{2πina/m} = χ(n)τ(χ̄)` gives `f_χ = τ(χ̄)⁻¹Σ_aχ̄(a)f(z + a/m)`; for a cusp form `g`,
`2πi∫_{i∞}^0 g(z)z^jdz = −2πi·i^{j+1}∫_0^∞ g(iy)y^jdy = j!/(−2πi)^j·L(g, j + 1)` by the Mellin identity; apply this
to `g = f_χ`, substitute `w = z + a/m`, and exchange `χ` and `χ̄`. Every convention changes the formula: the
sum against `χ(a)` produces `L(f, χ̄)`; reversing the path changes the sign; using `−a/m` multiplies by
`χ(−1)`; the factor `2πi` sits in `ψ_f` and `j!/(−2πi)^j` on the right ([Pollack AWS] §2.8, p. 9, for the
untwisted case; §2.1, formula `(2)`, p. 3, for `k = j = 0` in the `−a/N` form, where the character on the
right is the conjugate). *Needs:* §0.7 (The period symbol); ModularForms Layer 7; Mathlib
`ModularForm.L` and `mellin` (Mathlib's L-function of a modular form on an arithmetic subgroup, with
its entire extension for cusp forms); Tau Ceti `TauCeti.cuspIntegral`.
The Mellin identity itself is supplied by `CuspForm.Λ_eq_mellin` with
`ModularForm.L = Λ·2/Gammaℂ`. *Lean:* `cuspIntegral_monomial_eq_L` (the case `m = 1`, for the actual
cusp integral from `∞` to `0`, in Mathlib's normalisation of `ModularForm.L`).

**Checks.**

- At `j = 0`, `2πi·cuspIntegral(f, ∞, 0) = L(f, 1)`, with no remaining factorial or power of `2πi`.
- For `k ≥ 1, j = 1`, the right side is `−L(f, 2)/(2πi)`; this detects the orientation and the power of `i`.
- Reversing the endpoints to `0, ∞` negates the left side, by `TauCeti.cuspIntegral_symm`, and requires
  negating the L-value expression as well.

**Algebraicity of critical values with the parity sign** (theorem). Let
`T_{j,χ}(ψ) = Σ_{a mod m} χ(a)·λ_{j,a/m}(ψ({a/m} − {∞}))` and `ε_{j,χ} = (−1)^{k−j}χ(−1)`. Then
`T_{j,χ}(ψ|ι) = ε_{j,χ}T_{j,χ}(ψ)`, so `T_{j,χ}` vanishes on the `−ε_{j,χ}` eigenspace and
`T_{j,χ}(ψ_f) = ½T_{j,χ}(ψ_f^{ε_{j,χ}})`. Consequently, for every basis `φ` of `L_f^{ε_{j,χ}}, 0 ≤ j ≤ k` and `χ` primitive,
`τ(χ)·j!/(−2πi)^j·L(f, χ̄, j + 1)/Ω_f^{ε_{j,χ}}(φ) = ½T_{j,χ}(φ) ∈ K_f(χ)`. Proof: `ι* = (1 0; 0 −1)`, so
`(P|ι)(X, Y) = P(X, −Y)` and `λ_{j,x}(P|ι) = (−1)^{k−j}λ_{j,−x}(P)`; `ι({a/m} − {∞}) = {−a/m} − {∞}`; substitute
`a ↦ −a`; then `(1 ± ι)` multiplies `T_{j,χ}` by `1 ± ε_{j,χ}`; `φ` is `K_f`-rational and `λ_{j,a/m}` has rational coefficients,
and the twisted Mellin formula concludes. With other conventions for the action or for `ι` the sign
`ε_{j,χ}` changes and must be tracked ([Pollack AWS] §2.12, pp. 12–13, for `k = j = 0`; the critical
range `0 ≤ j ≤ k` is [RJW] Appendix B.2.1, p. 79). *Needs:* §1.2 (The twisted Mellin formula); §1.1 (Period
lines and periods); §0.3 (The involution at infinity); §0.7 (Newform eigenspaces are one-dimensional).

### 1.3 `p`-stabilisation and the interpolation dictionary

**`p`-stabilisations of a newform** (construction). Let `f° = Σa_nq^n ∈ S_{k+2}(Γ₁(N), ε)` be a newform, `p ∤ N` a
prime, `α` a root of `X² − a_pX + ε(p)p^{k+1}` and `β = a_p − α` the other root; `α ≠ 0` because `αβ = ε(p)p^{k+1}`. Then
`f_α(z) = f°(z) − βf°(pz)` lies in `S_{k+2}(Γ₁(N) ∩ Γ₀(p), ε) ⊆ S_{k+2}(Γ₁(Np))`, has coefficients
`a_n(f_α) = a_n − βa_{n/p}` (`a_{n/p} = 0` for `p ∤ n`), satisfies `U_pf_α = αf_α` and `T_ℓf_α = a_ℓf_α` for `ℓ ∤ Np`. On the
span of `f°(z)` and `f°(pz), U_p` acts by `U_p(f°(pz)) = f°` and `U_pf° = a_pf° − ε(p)p^{k+1}f°(pz)`, the companion
matrix of `X² − a_pX + ε(p)p^{k+1}`; each root has a one-dimensional eigenspace there, and `U_p` is semisimple
on the span iff `α ≠ β`. Proof: `f°(pz) = V_pf°` has coefficients `a_{n/p}` (Tau Ceti `qExpansion_levelRaise`);
the `U_p`-eigenvalue follows from the coefficient criterion at level `Np` and the good-prime recurrence
`a_{pm} = a_pa_m − ε(p)p^{k+1}a_{m/p}` with `α + β = a_p, αβ = ε(p)p^{k+1}`; `T_ℓ` commutes with `V_p` for `ℓ ∤ Np`. At `p | N`
there is no stabilisation: the refinement of §2.1 uses the `U_p`-eigenvalue `a_p` of the newform itself
([PS] §8, the example of `X₀(11)` at `p = 3`, p. 35). The coefficient formula, recurrence
and complex L-series reindexing are supplied by AutomorphicLFunctionsAndLocalFactors AL.5,
Complex period and stabilization dictionary (`AL5.pStabilizedCoeff`,
`AL5.pStabilizedCoeff.up_eigen`, `AL5.pStabilizedCoeff.LSeries`). Use its complex API after
embedding `K_f(α)` in `ℂ`; descend the form's coefficient coordinates to `K_f(α)` by injectivity
of that embedding and the displayed formula. This construction owns the stabilised cusp
form and its Hom-side period symbol, not a second coefficient-sequence API. API: `pStabilisation` (`f_α = f° − β·V_pf°` in
`S_{k+2}(Γ₁(Np))`), `pStabilisation_coeff` `(a_n(f_α) = a_n − βa_{n/p})`, `pStabilisation_Up` `(U_pf_α = αf_α)`,
`pStabilisation_heckeT` (`T_ℓf_α = a_ℓf_α` for `ℓ ∤ Np`). *Needs:* §0.5 (Hecke operators on `Γ₁(N)`-symbols); Tau
Ceti `TauCeti.CuspForm.levelRaise`, `TauCeti.CuspForm.qExpansion_levelRaise`,
`HeckeRing.GL2.heckeUCuspNat_eq_smul_iff_forall_qExpansion_coeff_prime_mul`,
`HeckeRing.GL2.heckeTCuspNat_eq_smul_iff_forall_qExpansion_coeff_prime_mul`;
AutomorphicLFunctionsAndLocalFactors AL.5 (Complex period and stabilization dictionary).

**Checks.**

- `a_n(f_α) = a_n(f°)` for `p ∤ n`.
- `U_pf_α = αf_α` follows from the recurrence: `a_{pm}(f_α) = a_{pm} − βa_m` and `α·a_m(f_α) = αa_m − αβa_{m/p}` agree
  because `a_{pm} = (α + β)a_m − αβa_{m/p}`.
- If `α ≠ β` then `f_α ≠ f_β`, their difference being `(α − β)f°(pz)`: `f°` alone does not determine the stabilised
  form.
- For the newform of level 11 at `p = 3, a₃ = −1` and `X² + X + 3` has roots of 3-adic valuations 0 and 1;
  `f_α` and `f_β` have level 33 with `U₃`-eigenvalues `α` and `β`.

**L-functions of `p`-stabilised forms** (comparison). With `f°` and `α, β` as above, `L(f_α, s) = (1 − βp^{−s})L(f°, s)`, and
`L(f_α, χ, s) = L(f°, χ, s)` for every `χ` of conductor `p^n` with `n ≥ 1`; at `s = j + 1, βp^{−j−1} = ε(p)p^{k−j}/α`.
Apply AutomorphicLFunctionsAndLocalFactors AL.5's `AL5.pStabilizedCoeff.LSeries` to
`pStabilisation_coeff`, then extend the identity of entire cusp-form L-functions from the
absolute-convergence half-plane; `χ(n) = 0` when `p | n`. This target identifies that supplied
identity with the periods and refined Hom-side line used here. Stabilising at `β` exchanges the roles:
`L(f_β, s) = (1 − αp^{−s})L(f°, s)`. This separates the L-function of a `p`-stabilised form (the form of level
divisible by `p` that RJW's statement uses) from that of the newform of level prime to `p`
([RJW] Appendix B.2, p. 79). For `k = 0`, trivial character and `j = 0` the factor is `1 − 1/α`. *Needs:* §1.3
(`p`-stabilisations of a newform); §1.2 (The twisted Mellin formula);
AutomorphicLFunctionsAndLocalFactors AL.5 (Complex period and stabilization dictionary).

**Checks.**

- For `k = j = 0` and trivial character the second Euler factor is `1 − 1/α`.
- A character of conductor `p^n, n ≥ 1`, kills every coefficient contributed by
  `βf(pz)`, so the twisted L-functions are unchanged.
- Interchanging `α` and `β` interchanges `1 − βp^(−s)` with `1 − αp^(−s)`;
  the L-function comparison remembers the chosen refinement.

**The interpolation dictionary** (theorem). RJW's interpolation statement reads, for `f` of weight `k + 2` and
level `Γ₀(N)` with `p | N, U_p`-eigenvalue `α_p` with `v_p(α_p) < k + 1, χ` of conductor `p^n` and `0 ≤ j ≤ k`:
`L_p^{an}(f, χ̄, j + 1) = −α_p^{−n}(1 − χ(p)p^j/α_p)·τ(χ)·j!·p^{nj}/(2πi)^{j+1}·L(f, χ̄, j + 1)/Ω_f^±` ([RJW] Theorem
B.1, pp. 79–80, where the conjugate character appears on both sides). Put `I_j(x) = 2πi∫_{i∞}^x f(z)(z − x)^jdz`.
For `n ≥ 1` the right side equals `(−1)^{j+1}/(2πi·Ω_f^±)·α_p^{−n}p^{nj}Σ_{a mod p^n}χ(a)I_j(a/p^n)`, and equally
`−ε_{j,χ}(−1)^k/(2πi·Ω_f^±)·α_p^{−n}p^{nj}Σ_aχ(a)I_j(−a/p^n)`; only the second prefactor depends on the sign
`ε_{j,χ}` alone. So the formula holds with a `j`-independent period exactly when the distribution is
normalised through the cusps `−a/p^n`, equivalently through `x ↦ −x`: this is the normalisation Layer 2
fixes. For `n = 0` and `f = f_α` the `p`-stabilisation of `f°`, it reads `−(1 − p^j/α)(1 − ε(p)p^{k−j}/α)·`
`j!/(2πi)^{j+1}·L(f°, j + 1)/Ω^±`. Proof: substitute the twisted Mellin formula `(m = p^n)`; `τ(χ)` cancels, leaving
`−(−2πi)^j/(2πi)^{j+1} = (−1)^{j+1}/(2πi)`; then `Σ_aχ(a)I_j(−a/p^n) = χ(−1)Σ_aχ(a)I_j(a/p^n)` and
`(−1)^{j+1}χ(−1) = −ε_{j,χ}(−1)^k`; for `n ≥ 1, χ(p) = 0` and `L(f_α, χ̄, s) = L(f°, χ̄, s)`; for `n = 0` use the previous
lemma. The same statement in Pollack–Stevens' normalisation ([PS] §6, interpolation property `(1)`,
p. 27) is the normalisation through `−a/p^n`, consistent with RJW's for the period `−ε_{j,χ}(−1)^kΩ_PS/(2πi)`, using
`τ(χ)τ(χ⁻¹) = χ(−1)p^n`; Pollack's lecture notes ([Pollack AWS] §2.12, pp. 12–13, and §5.1, `(7)`, p. 24) use
the cusps `+a/p^n`, which for `k = j = 0` differs from RJW's by `−1/(2πi)` and the sign `χ(−1)`. *Needs:* §1.2 (The
twisted Mellin formula; Algebraicity of critical values); §1.3 (L-functions of `p`-stabilised forms);
§1.1 (Period lines and periods).

### Examples

For the newform `f` of level 11 `(k = 0), q∏_{n≥1}(1 − q^n)²(1 − q^{11n})², L(f, 1) = 0.2538418608…` and
`2πi∫_{i∞}^0 f(z)dz = L(f, 1) = Ω_E^+/5`, with `Ω_E^+` the real Néron period of `X₀(11)` ([Pollack AWS] `(1)`, p. 2), so
`L(f, 1)/Ω_E^+ ∈ ℚ`. For a non-real primitive character `χ` of order 3 or 6 modulo 7, the twisted Mellin identity
uses `L(f, χ̄, j + 1)`. Apply it both to the level-11 weight-two form at `j = 0` and to the
level-5 weight-four newform at `j = 0`, 1, 2; replacing `χ̄` by `χ` gives a different value.
These non-real twists distinguish the conjugation convention, whereas quadratic twists cannot. Dividing `T_{0,1}(ψ_f)` by the minus period gives nothing:
`T_{0,1}` vanishes on `L_f^−`. For `k = 0`, trivial character and `j = 0` the `n = 0` dictionary reads
`−(1 − 1/α)²·L(f°, 1)/(2πi·Ω^±)`, the Mazur–Tate–Teitelbaum shape.

### Dependencies

Layer 0 (§0.3, §0.5, §0.6, §0.7) for the symbols, signs and the period symbol; ModularForms Layer 7 for
L-functions and the Mellin transform and Layer 8G for the coefficient field; Tau Ceti `levelRaise`,
`qExpansion_levelRaise` and the two coefficient criteria for Hecke eigenvalues.

## Layer 2: refinements, overconvergent symbols and small-slope p-adic L-functions

Fix a prime `p` and an embedding `ℚ̄ ↪ ℚ̄_p`, so that slopes `v_p(α)` of algebraic numbers are defined, with
`v_p(p) = 1`. Throughout, `f` is a newform of weight `k + 2`, level `N` and character `ε`, and the refinement level
is `Γ₀ = Γ₁(N) ∩ Γ₀(p)` when `p ∤ N` and `Γ₀ = Γ₁(N)` when `p | N`. Pollack–Stevens work with `Γ ∩ Γ₀(p)` for `Γ` of level
prime to `p`; their arguments use only that `Γ₀ ⊆ Σ₀(p)` has finite index and that `U_p = Σ_{a=0}^{p−1}|β(a, p)` with
`β(a, p) = (1 a; 0 p)`, which both hold for `Γ₁(N)` with `p | N`. `K` denotes a finite extension of `ℚ_p` containing the
needed eigenvalues, `𝒪` its ring of integers. Proposed home:
`TauCeti/NumberTheory/ModularForms/ModularSymbols/Overconvergent`.

### 2.1 Refinements and refined eigenlines

**Refinements and their slopes** (definition). A refinement of `f` at `p` is a pair `(f, α)` where: if `p ∤ N, α` is a
root of `X² − a_pX + ε(p)p^{k+1}` and the refined form is `f_α` of §1.3; if `p | N, α = a_p(f) ≠ 0` and the refined form
is `f` itself. Its slope is `h = v_p(α)`. It has small slope if `h < k + 1` and critical slope if `h = k + 1`. A
refinement is the choice of the root together with its eigenline; it is not determined by `f`. Since `α` is
an algebraic integer, `h ≥ 0`, and for `p ∤ N, v_p(α) + v_p(β) = k + 1` gives `0 ≤ h ≤ k + 1` ([PS] §5.3, p. 24, for the
slope range of `U_p`-eigensymbols; §8, `X₀(11)` at `p = 3`, p. 35). When `p ‖ N` with `ε` of conductor prime to `p` and
`a_p ≠ 0, a_p² = ε^{(p)}(p)p^k`, with `ε^{(p)}` the character modulo `N/p` inducing `ε` (`ε(p)` itself is 0 as a
character modulo `N`), and the slope is `k/2` (ModularForms Layer 4, bad-prime eigenvalues). API: `Refinement`
(a newform with a chosen `U_p`-eigenvalue `α`: a root of the Hecke polynomial at `p ∤ N`, or `a_p ≠ 0` at `p | N`),
`Refinement.slope` `(h = v_p(α))`, `Refinement.slope_le` (`0 ≤ h ≤ k + 1` when `p ∤ N`). *Needs:* §1.3
(`p`-stabilisations of a newform); §0.5 (Hecke operators on `Γ₁(N)`-symbols); ModularForms Layer 4.
*Lean:* `IsGoodRefinementRoot`, `goodRoot_mul`, `goodRoot_ne_zero`, `IsBadRefinement`, `not_isBadRefinement_zero`.

**Checks.**

- For `p`-ordinary `f` with `p ∤ N` the two refinements have slopes 0 and `k + 1`, the second one critical.
- `v_p(α) + v_p(β) = k + 1` for `p ∤ N`; for the newform of level 11 at `p = 3` the slopes are 0 and 1.
- At `p | N` with `a_p = 0` (for example `p² | N` with `ε` of conductor prime to `p`) there is no refinement; a
  definition that took a root of the good-prime polynomial would wrongly produce one.
- For the bad-prime scalar helper over `ℚ, a_p = 7` admits `α = 7` and rejects `α = 1`.

- For the field-valued helper over `𝔽₂, p = 2, k = 0, a_p = 0` and `εp = 1`,
  `α = 0` satisfies the good-root equation. Nonvanishing of a root also needs
  `(p : K) ≠ 0`, which holds for the characteristic-zero fields of this layer.

**The refined eigenline** (lemma). Let `(f, α)` be a refinement, `K ⊇ K_f(α)` a field and `λ` the system of
eigenvalues `a_ℓ (ℓ ∤ Np)` and `α` (for `U_p`). For each sign, `L_{f,α}^± = Symb_{Γ₀}(V_k(K))^±[ε][λ]` is one-dimensional
over `K`, and after `⊗ℂ` it is spanned by `(1 ± ι)ψ_{f_α}` (`f_α = f` when `p | N`). For `p ∤ N` it lies in the
two-dimensional subspace on which only the `T_ℓ, ℓ ∤ Np`, act by `a_ℓ`, where `U_p` acts by the companion matrix
of `X² − a_pX + ε(p)p^{k+1}`; for `p | N` it is the line `L_f^±` of §1.1, on which `U_p` acts by `a_p`. Proof: over `ℂ`,
Eichler–Shimura for `Γ₀`, §0.4 and the separation of §0.7 with `M = Np` (its polynomial in one good `T_ℓ`
commutes with `U_p`) identify the subspace cut out by the `T_ℓ`, Hecke-equivariantly
including `U_p`, with `span(f(z), f(pz))` (ModularForms Layer 4); there the `α`-eigenspace is `ℂf_α`; rationality
follows from flat base change; for `p | N, U_p` preserves `L_f^±` and acts by `a_p` ([PS] §6.3, p. 28). If `α = β` the
`U_p`-eigenspace is still a line but the generalised eigenspace is two-dimensional, and slope
decompositions see the generalised eigenspace. *Needs:* §2.1 (Refinements); §1.3 (`p`-stabilisations);
§1.1 (Period lines); §0.7 (The Eichler–Shimura isomorphism; The period symbol); §0.4 (Modular symbols
modulo Eisenstein symbols); §0.5 (Modular symbols commute with flat base change; Modular symbols with
character); §0.3 (The plus/minus decomposition); §0.7 (Cuspidal and Eisenstein eigensystems are distinct,
with `M = Np`); ModularForms Layer 4.

### 2.2 Distribution modules with the weight-`k` action

**Distribution modules with the weight-`k` action** (definition). For a real `r > 0` let `B[ℤ_p, r]` be the set of
`z ∈ ℂ_p` within distance `r` of `ℤ_p`; it is a finite disjoint union of closed discs `a + B(0, r)`, and `A[r]` is the
`ℚ_p`-Banach algebra of functions analytic on each of these discs (a finite product of the
`discAnalytic` spaces of LocallyAnalyticDistributions Layer 0, at valuation `−log_p r`), with the sup norm.
Put `A(ℤ_p) = lim→_{s>0} A[s]` (the locally analytic functions `LA(ℤ_p)` of LocallyAnalyticDistributions
Layer 0) and `A†(ℤ_p, r) = lim→_{s>r} A[s]`, and let `D[r], D(ℤ_p)` and `D†(ℤ_p, r)` be the continuous duals; write
`D = D[1]` and `D† = D†(ℤ_p, 1)`. For `r < p`, the monoid
`Σ₀(p) = {(a b; c d) ∈ M₂(ℤ_p) : p ∤ a, p | c, ad − bc ≠ 0}` acts on `A[r]` by `(γ·_kf)(z) = (a + cz)^kf((b + dz)/(a + cz))`,
and on distributions on the right by `(μ|_kγ)(f) = μ(γ·_kf)`, giving `D_k(ℤ_p), D_k` and `D†_k` ([PS] §§3.1–3.3,
pp. 15–17).

For the coefficient-action comparison with LocallyAnalyticDistributions §4.15, use
`Σ₀(p)ᵒᵖ`. For a locally analytic character `κ : ℤ_p^× → A^×` on stages where its multiplier is
analytic, put `φ_γ(z) = (b + dz)/(a + cz)`, `j_γ(z) = κ(a + cz)` and
`F_γg = j_γ · (g ∘ φ_γ)`. The identities `φ_(γδ) = φ_δ ∘ φ_γ` and
`j_(γδ) = j_γ · (j_δ ∘ φ_γ)` give `F_γ ∘ F_δ = F_(γδ)`.
Instantiate the supplier with `φ_(op γ) = φ_γ` and `j_(op γ) = j_γ`; then
`R_(op γ) = F_γ` and `μ |κ γ = U_(op γ)(μ)`, so
`(μ |κ γ) |κ δ = μ |κ (γδ)`. At `κ(u) = u^k` this is the weight-`k` action above, and
`(μ |κ β(a,p))(g) = μ(z ↦ g(a + pz))`. This target owns these right-action comparisons;
the generic analytic stages, multiplier and transpose maps, coefficient specialisation and
compactness comparisons are supplied by LocallyAnalyticDistributions §4.15.

Moments identify `D†` with the sequences `(μ(z^j))_j` that are `O(r^j)` for every `r > 1`, and `D`,
isometrically, with the bounded sequences ([PS] Proposition 3.1). For `r < p, γ ∈ Σ₀(p)` with `det γ = p^n` and
`μ ∈ D[r], ‖μ|γ‖_{r/p^n} ≤ ‖μ‖_r`: for `z₀ ∈ ℤ_p` and `|w| ≤ r` the factor `a + cz` is a unit and
`|γ(z₀ + w) − γz₀| = p^{−n}|w|`, so `γ` maps `B[ℤ_p, r]` into `B[ℤ_p, r/p^n]` and `f ↦ γ·_kf` maps `A[r/p^n]` into `A[r]` with norm
at most 1 ([PS] proof of Lemma 6.2, p. 27). The restriction `r < p` is needed: for `r ≥ p` the factor `a + cz` can
vanish on `B[ℤ_p, r]`, so the action does not preserve `A[r]` ([PS] §3.3 and Lemma 6.2 state the action for all `r`;
every radius used below is `≤ 1` or slightly above 1). The restriction maps `A[r₁] → A[r₂], r₁ > r₂`, are
completely continuous with dense image (LocallyAnalyticDistributions Layer 0, compact restriction to a
smaller radius). API: `distWeight` (`D_k(ℤ_p), D_k` and `D†_k` with the right weight-`k` action of `Σ₀(p)`),
`distMoments` (`D ≃` bounded sequences, isometrically), `daggerMoments` (`D† ≃` sequences `O(r^j)` for every
`r > 1`), `distWeight_norm_le` (the contraction above). *Needs:* LocallyAnalyticDistributions Layer 0
§§0.0–0.1 (`discAnalytic`, `LA_h`, locally analytic distributions, `naInductiveLimit`,
`naProjectiveLimit`), §0.3 (Compact restriction to a smaller radius) and §4.15
(Universal-character coefficient action; Cocycle law and handedness); §0.1 (The Hecke monoid `Σ₀(N)`). *Lean:* `daggerMoments`,
`mem_daggerMoments_of_isBounded_range`, `daggerMoments_unbounded`, `Sigma0p`. The monoid `Sigma0p` uses the actual
p-adic unit, lower-left divisibility and nonzero-determinant conditions. Its API includes the
entrywise integral inclusion `Σ₀(p) →` `Sigma0p p` and compatibility of the coefficient actions.

**Checks.**

- The Dirac distribution `δ₀` has moments `(1, 0, 0, …)` and lies in `D`.
- An element of `D†` lies in `D` iff its moments are bounded.
- `c_j = 1/(j + 1)` is `O(r^j)` for every `r > 1` but unbounded `(|1/p^m|_p = p^m)`, so it defines an element of `D†` not
  in `D`; such denominators are why the difference equation of §2.3 needs `D†` ([PS] Remark 4.6).
- `c_j = p^{−j}` is not `O(r^j)` for `1 < r < p`, so it is the moment sequence of no element of `D†`.
- At weight zero, `(δ₀ | β(1,p)) | diag(−1,1) = δ_{−1}`, while reversing the two matrices
  gives `δ₁`; this distinguishes the right action from a left action with unchanged labels.
- For `κ(u) = u^k`, the opposite-monoid comparison gives `(μ |_k γ)(g) = μ((a + cz)^k g(φ_γ(z)))`.
- For every `κ`, `β(a,p)` has multiplier `κ(1) = 1`, so its transpose evaluates `g` at `a + pz`.

- `diag(1,p)` belongs to `Sigma0p p`, while `diag(p,1)` does not: the upper-left
  entry must be a p-adic unit.
- `(1 0; 1 1)` does not belong to `Sigma0p p`, because its lower-left entry is a unit.
- `(1 0; 0 0)` does not belong to `Sigma0p p`, because its determinant is zero.

### 2.3 Specialisation and overconvergent lifts

**Specialisation to polynomial coefficients** (construction). For `D_k` one of `D_k(ℤ_p), D_k, D†_k`, the map
`ρ_k : D_k → V_k(ℚ_p), μ ↦ ∫(Y − zX)^kdμ(z)` (coefficientwise) is `Σ₀(p)`-equivariant for the weight-`k` action and the
action of §0.1: `ρ_k(μ|γ) = μ(((aY − bX) − z(dX − cY))^k) = ρ_k(μ)|γ`. It induces `ρ*_k : Symb_{Γ₀}(D_k) → Symb_{Γ₀}(V_k)`,
which commutes with the Hecke operators including `U_p` (they are sums of `|δ` with `δ ∈ Σ₀(p)`) and with `ι`.
Explicitly `ρ_k(μ) = Σ_{j=0}^{k} C(k, j)(−1)^jμ(z^j)X^jY^{k−j}`, so `ker ρ_k = {μ : μ(z^j) = 0 for 0 ≤ j ≤ k}` and the
`Y^k`-coefficient of `ρ_k(μ)` is the total mass `μ(1)` ([PS] §3.4, p. 17; §5, opening, p. 20). API: `specialise`
`(ρ_k)`, `specialise_smul` (`ρ_k(μ|γ) = ρ_k(μ)|γ` for `γ ∈ Σ₀(p)`), `specialiseSymb` (`ρ*_k`, Hecke-equivariant),
`specialise_eq_zero_iff` (`ρ_k(μ) = 0` iff `μ(z^j) = 0` for all `j ≤ k`). *Needs:* §2.2 (Distribution modules); §0.1
(The coefficient modules `V_k`); §0.2 (Modular symbols); §0.5 (Hecke operators on `Γ₁(N)`-symbols); §0.3 (The
involution at infinity). *Lean:* `specialiseMoments`, `specialiseMoments_coeff_Yk`, `specialiseMoments_eq_iff`
(the moment-kernel characterisation over characteristic-zero fields).

**Checks.**

- `k = 0`: `ρ₀(μ) = μ(1)`, the total mass.
- `ρ_k(δ₀) = Y^k`.
- The distribution with moment 1 at `z^{k+1}` and 0 elsewhere is nonzero and lies in `ker ρ_k`: specialisation
  forgets the moments above `k`, so `ρ_k` is not injective.

**Lifting classical symbols to overconvergent ones** (theorem). For `k ≥ 0` and the refinement
subgroup `Γ₀ ⊆ Γ₀(p)` of Convention 11, the specialisation
`ρ*_k : Symb_{Γ₀}(D†_k) → Symb_{Γ₀}(V_k)` is surjective: every prescribed classical symbol `φ`
has a lift `Φ` with `ρ_k(Φ(D)) = φ(D)` for every `D ∈ Δ₀`. Establish the cohomological
obstruction calculation below as part of this theorem, over `ℚ_p` (and after finite coefficient
extension). It applies to all classical symbols, including boundary symbols.

Put `E_k = ker(ρ_k : D†_k → V_k)`. Use §0.6's comparison with compact-support cohomology
for these possibly infinite-dimensional coefficient modules. On a torsion-free finite cover,
finite relative cellular cochains are finite sums of coefficient modules, so a short exact
coefficient sequence gives a long exact sequence; descend by averaging over the finite cover
group in characteristic zero. The oriented relative surface complex also gives
`H²_c(Γ₀,E_k) ≅ (E_k)_{Γ₀}`, the algebraic coinvariants. Thus the coefficient sequence
`0 → E_k → D†_k → V_k → 0` gives the obstruction map
`Symb_{Γ₀}(V_k) → H²_c(Γ₀,E_k)`.

Prove `(E_k)_{Γ₀} = 0` as follows. Write `Δ = T − 1, T = (1 1; 0 1) ∈ Γ₀`.
The difference equation on `D†` has a unique solution for every right-hand side of total
mass zero ([PS] Theorem 4.5, with Lemmas 4.3–4.4, pp. 18–20). Its moment recurrence gives
`E_k/ΔE_k ≅ ℚ_p` by `ν ↦ ν(z^{k+1})`: if `ν ∈ E_k` has this moment zero, its solution
`μ|Δ = ν` has all moments through `k` zero, so `μ ∈ E_k`. Surjectivity of this quotient
coordinate is witnessed by the finite moment sequence supported at `k + 1`.
Choose a nonzero `c ∈ pℤ` with `C_c = (1 0; c 1) ∈ Γ₀`; such `c` exists at these congruence levels.
Let `e_{k+2}` have moment one in degree `k + 2` and zero in every other degree.
It belongs to `E_k`, and
`(e_{k+2}|(C_c − 1))(z^{k+1}) = e_{k+2}(z^{k+1}/(1 + cz)) = −c ≠ 0`.
Consequently the `Γ₀`-relations kill the sole remaining quotient coordinate, so `H²_c(Γ₀,E_k) = 0`.
Exactness now lifts the original `φ` without changing any of its generator values after specialisation.
This is the compact-support argument of [PS critical] §2.1, `(1)`, and §5.1, Lemmas 5.1–5.2,
pp. 11–12, written directly for `E_k`; the moment description is [PS] Proposition 3.1.

For `μ ∈ D†_k, μ|β(a,p) ∈ D_k`, since
`(μ|β(a,p))(z^j) = Σ_r C(j,r)a^{j−r}p^rμ(z^r)` is bounded ([PS] Lemma 5.3).
Thus `U_p` maps `Symb_{Γ₀}(D†_k)` into `Symb_{Γ₀}(D_k)`. On a classical generalised `U_p`-eigenspace
with eigenvalue `λ ≠ 0`, write `φ = φ′|U_p` within that space, lift `φ′` over `D†_k`, and apply `U_p`.
When `U_p` is invertible on `Symb_{Γ₀}(V_k)`, as at level `Γ ∩ Γ₀(p)` with `Γ` of level prime to `p`,
this gives surjectivity with `D_k` coefficients ([PS] Corollary 5.4, p. 22).
At `p | N` the zero generalised eigenspace is excluded from this `D_k` conclusion.
The difference equation need not have a solution in `D_k` ([PS] Remark 4.6).
*Needs:* §2.3 (Specialisation to polynomial coefficients); §2.2 (Distribution modules);
§0.6 (Hom-side symbols and geometric cohomology); §0.2 (the fundamental-domain presentation);
AlgebraicTopology Stages 2, 4 and 6 (relative cellular cochains and oriented local-coefficient duality).

**Checks.**

- At `k = 0`, changing the mass of a generator lift changes its prescribed classical value.
  Corrections in `E₀` have zero mass; the nonzero coordinate killed above is their first moment.
- More generally, changing only `μ(z^k)` by `a` changes `ρ_k(μ)` by `(−1)^k aX^k`.
  For `μ|Δ = ν`, one instead has
  `ν(z^{k+1}) = (k + 1)μ(z^k) + Σ_{r<k} C(k+1,r)μ(z^r)`.
  The obstruction calculation uses relations in `E_k`, preserving every moment through `k`.
- For `Γ₀(2), p = 2`, there are no free `D_i` in §0.2's presentation. Nevertheless `T` and
  `C₂` lie in `Γ₀(2)`, and `(e_{k+2}|(C₂ − 1))(z^{k+1}) = −2 ≠ 0` in `ℚ₂`.
  The same vanishing proves surjectivity while retaining the elliptic relation.
- On a nonzero generalised `U_p`-eigenspace, the preimage `φ′` under `U_p` is taken inside that
  space; lifting `φ` itself and then applying `U_p` would specialise to `φ|U_p` instead of `φ`.
- No eigenvalue-separation hypothesis is used for a boundary symbol. The non-Eisenstein
  Hecke correction of [PS] Remark 5.2 alone does not cover it.

### 2.4 Stevens' control theorem

**Slope decomposition of the fibre of specialisation** (lemma). Let `ϕ ∈ Symb_{Γ₀}(V_k) ⊗ K` be a Hecke eigensymbol
with `U_p`-eigenvalue `λ` of slope `h, 0 ≤ h ≤ k + 1`, and `X_ϕ = (ρ*_k)⁻¹(K·ϕ) ⊆ Symb_{Γ₀}(D_k) ⊗ K`. Then
`X_ϕ = X_ϕ^{(=h)} ⊕ X_ϕ^{(>h)}` uniquely, where `u = λ⁻¹U_p` is topologically nilpotent on `X_ϕ^{(>h)}` and invertible
on `X_ϕ^{(=h)}` with `(u^{−n})` bounded, `X_ϕ^{(=h)}` is finite-dimensional, and the projection onto `X_ϕ^{(=h)}` is
`x ↦ lim_n u^{n!}x`. The decomposition is built here from two ingredients. First, an ordinary–nilpotent
decomposition: for a `K`-Banach space `X` and a completely continuous `u` preserving a closed bounded
spanning `𝒪`-lattice `Y` and acting with finite image on each `Y/π^nY, X = X_ord ⊕ X_nil` uniquely, with `X_ord`
finite-dimensional, `u` invertible on `X_ord` with bounded inverse powers, `u^nx → 0` on `X_nil`, and
`e_ord = lim u^{n!}` (finite-image decompositions on the quotients, then the complete inverse limit;
[PS] Lemma 5.5 and Proposition 5.6, pp. 23–24); it agrees with the slope-zero summand of `u` in the
slope decomposition of LocallyAnalyticDistributions Layer 4, by uniqueness of slope decompositions.
Second, the stable lattice `Y_ϕ = {Φ in the unit ball of X_ϕ : |Φ(D)(z^j)| ≤ p^{−(h−j)} for 0 ≤ j ≤ ⌊h⌋ and all D ∈ Δ₀}`: `u` preserves it because `(Φ|u)(D)(z^r) = λ⁻¹Σ_aΣ_jC(r, j)a^{r−j}p^jΦ(D_a)(z^j)` with `D_a = β(a, p)D` and every
`|p^jΦ(D_a)(z^j)| ≤ p^{−h}` (by the defining bound for `j ≤ ⌊h⌋`, and because `j > h` otherwise); membership
depends only on `ρ*_k(Φ)` in the moments it constrains, and `ρ*_k(Φ|u) = ρ*_k(Φ)`. At `h = k + 1` the bound for
`j = k + 1` is the unit-ball bound. The unit ball itself need not be `u`-stable ([PS] footnote 3), which is
why `Y_ϕ` is used. `Y_ϕ` is closed, bounded and spanning; finitely many Manin generators put the symbol
space inside a finite product of copies of `D_k`; `U_p` is completely continuous because each `|β(a, p)` maps
`D[1]` into `D[1/p]` and `D[1/p] → D[1]` is dual to the completely continuous restriction `A[1] → A[1/p]`
([PS] §§5.2–5.3, Proposition 5.7, pp. 23–25). No affinoid property `(Pr)` is used. *Needs:* §2.3 (Lifting;
Specialisation); LocallyAnalyticDistributions Layer 4 (complete continuity over a field, finite
projective slope summands, uniqueness of `h`-slope decompositions); §2.2 (Distribution modules).

**Stevens' control theorem in small slope** (theorem). Specialisation induces isomorphisms
`Symb_{Γ₀}(D_k(ℤ_p))^{(<k+1)} ≅ Symb_{Γ₀}(D_k)^{(<k+1)} ≅ Symb_{Γ₀}(V_k)^{(<k+1)}` of the subspaces on which `U_p` acts with
slope `< k + 1`, compatible with the Hecke operators and `ι`. In particular, for a refinement `(f, α)` of slope
`h < k + 1` and each basis `φ^±` of the refined eigenline `L_{f,α}^±`, there is a unique
`Φ^± ∈ Symb_{Γ₀}(D_k(ℤ_p))^{±,(<k+1)}` with `ρ*_k(Φ^±) = φ^±`, and `Φ^±` is a Hecke eigensymbol with the eigenvalues of `f_α`. Proof: injectivity on slope
`< k + 1` holds because on `ker ρ*_k` the terms with `j ≤ k` of `(Φ|U_p)(D)(z^r) = Σ_aΣ_jC(r, j)a^{r−j}p^jΦ(D_a)(z^j)` vanish,
so `U_p` is divisible by `p^{k+1}` there; surjectivity: `ρ*_k` maps `X_ϕ^{(=h)}` onto `K·ϕ` and kills `X_ϕ^{(>h)}`, and for
`h < k + 1` it is injective on `X_ϕ^{(=h)}`, so the resulting eigensymbol lifts a nonzero multiple of `ϕ`
([PS] Theorem 5.9, Lemma 5.10 and Theorem 5.12 with its proof, pp. 25–26); an isomorphism after extending
scalars to `ℚ̄_p` is one before; uniqueness and the eigen-property follow from equivariance and the
one-dimensionality of the refined eigenline. For the first isomorphism (independence of the radius on
the finite-slope part, which [PS] cites to the authors' critical-slope preprint), argue with the
contraction of §2.2: on the finite-dimensional finite-slope part, `Φ = (Φ|U_p^{−n})|U_p^n` and
`|U_p^n = Σ_{a mod p^n}|β(a, p^n)` maps `D[1]`-valued symbols to `D[1/p^n]`-valued ones, so `Φ` takes values in every
`D[1/p^n]`, hence in `D(ℤ_p)`. At slope 0 this is Hida's ordinary control theorem for `Γ₀`. The threshold is
strict: at `h = k + 1` specialisation can fail to be an isomorphism on the `f`-part, exactly for `f` in the
image of `θ_k` ([PS] Theorem 5.14, p. 26), which includes the critical-slope stabilisation of a `p`-ordinary CM form
([PS] Remark 5.15, p. 26); that is Layer 3. *Needs:* §2.3 (Lifting classical symbols); §2.4 (Slope decomposition
of the fibre); §2.2 (Distribution modules); §2.1 (Refinements; The refined eigenline).

**Checks.**

- At `p = 3, k = 0` and `Γ₀(33)`, assign the derivative functional `g ↦ g′(0)`
  to the cusp orbit of 0, equivariantly, and zero to the other cusp orbits. Its
  nonzero boundary restriction is a minus symbol in `ker ρ₀`: unrestricted lifts
  are not unique, even with a sign fixed.
- For a small-slope refined basis, the unique lift in slope `< k + 1` is a
  simultaneous eigensymbol; adding the preceding kernel symbol loses that condition.
- At `h = k + 1` a CM critical eigenline can specialise to zero, so the strict
  inequality cannot be weakened to `≤`.

### 2.5 The p-adic L-function of a small-slope refinement

**Values of slope-`h` eigensymbols are `h`-admissible** (lemma). If `Φ ∈ Symb_{Γ₀}(D(ℤ_p))` is a `U_p`-eigensymbol whose
eigenvalue `λ` has slope `h`, then every value `Φ(D)` is `h`-admissible: `‖Φ(D)‖_r = O(r^{−h})` as `r → 0⁺`. Proof: for
`0 < r ≤ 1` and `n ≥ 1, ‖Φ(D)‖_{r/p^n} = |λ|^{−n}‖(Φ|U_p^n)(D)‖_{r/p^n} ≤ |λ|^{−n}max_a‖Φ(β(a, p^n)D)‖_r ≤ |λ|^{−n}‖Φ‖_r` by the
contraction of §2.2, and `|λ|^{−n} = p^{nh} = (r/(r/p^n))^h` ([PS] Definition 6.1 and Lemma 6.2, p. 27). This is
`h`-admissibility in the sense of LocallyAnalyticDistributions Layer 2 (`mem_distOrder_iff_growth`). At `h = 0`
the values are bounded, that is, measures; `λ = 0` (infinite slope) is not covered. *Needs:* §2.2
(Distribution modules); LocallyAnalyticDistributions Layer 2 (`DistOrder`).

**The p-adic L-function of a small-slope refinement** (construction). Let `(f, α)` have slope `h < k + 1, φ^±`
bases of the refined eigenlines, `Φ^±` their eigenlifts from the control theorem and `Φ = Φ⁺ + Φ⁻`. Define
`L_p(f, α; φ^±) = Φ({∞} − {0})|_{ℤ_p^×} ∈ D(ℤ_p^×)`. It is `h`-admissible, and it satisfies the distribution relation
`Φ({∞} − {0})(g·1_{a+p^nℤ_p}) = α^{−n}Φ({∞} − {a/p^n})(g(a + p^nz))` for every locally analytic `g`: indeed
`Φ({∞} − {0}) = α^{−n}(Φ|U_p^n)({∞} − {0}) = α^{−n}Σ_{a mod p^n}Φ({∞} − {a/p^n})|β(a, p^n)`, and `μ|β(a, p^n)` is supported on
`a + p^nℤ_p` with `(μ|β(a, p^n))(g) = μ(g(a + p^nz))` ([PS] Proposition 6.3 and its proof, pp. 28–29). Write the bases
as Pollack–Stevens do, `φ^±({r} − {s}) =` (`∫_r^s f_α(z)(zX + Y)^kdz ± (−1)^k∫_{−r}^{−s} f_α(z)(zX − Y)^kdz`)`·πi/Ω^±`, which
defines `Ω^± ∈ ℂ^×` from `φ^±`; then for `p ∤ a` and `0 ≤ j ≤ k` the `±`-part of `L_p(z^j·1_{a+p^nℤ_p})` is
`α^{−n}(∫_∞^{a/p^n}(−p^nz + a)^jf_α(z)dz ± ∫_∞^{−a/p^n}(p^nz + a)^jf_α(z)dz)·πi/Ω^±` ([PS] §6.2, formula `(2)`, p. 27),
obtained from `ρ*_k(Φ^±) = φ^±` through `ρ_k` for polynomials of degree `≤ k`. In the period
symbol of §0.7 (with `ι` acting on `V_k` by `P(X, Y) ↦ P(X, −Y)`), the displayed `φ^±` is `−(1 ± (−1)^kι)ψ_{f_α}/(2Ω^±)`:
Pollack–Stevens' label `±` is the `ι`-sign times `(−1)^k`, and `Ω^± = −½Ω_{f_α}^{±(−1)^k}(φ^±)` in the notation of §1.1.
The construction depends on `α` and on the bases: rescaling `φ^±` by `c^± ∈ K^×` rescales the `±`-parts by `c^±`.
API: `padicLFunction` `(L_p(f, α; φ^±) ∈ D(ℤ_p^×))`, `padicLFunction_admissible` (`h`-admissible),
`padicLFunction_distrib` (the distribution relation on `a + p^nℤ_p`), `padicLFunction_smul` (rescaling `φ^±`
rescales the `±`-parts). *Needs:* §2.4 (Stevens' control theorem); §2.5 (Values of slope-`h` eigensymbols are
`h`-admissible); §2.1 (The refined eigenline); §2.3 (Specialisation); §0.7 (The period symbol); §0.3 (The
involution at infinity).

**Checks.**

- `k = 0`: for `p ∤ a, L_p(1_{a+p^nℤ_p}) = α^{−n}φ({∞} − {a/p^n})`, the Riemann sums of the modular symbol of `f_α`.
- Replacing `φ⁺` by `cφ⁺` multiplies the `+`-part by `c` and leaves the `−`-part unchanged.
- The divisor `{0} − {∞}` in place of `{∞} − {0}` gives `−L_p`: the orientation is part of the definition.

**Interpolation and uniqueness of the p-adic L-function** (theorem). Let `(f, α)` have slope `h < k + 1`, with `φ^±`
and `Ω^±` as above, `0 ≤ j ≤ k`, and `χ` a character of `ℤ_p^×` of conductor `p^n`. With `± = (−1)^jχ(−1)`,
`L_p(f, α; φ^±)(z^j·χ) = e·α^{−n}p^{nj}·τ(χ)·j!/(2πi)^j·L(f_α, χ⁻¹, j + 1)/Ω^±`, where `e = 1` if `n ≥ 1` and `e = 1 − p^j/α`
if `n = 0`. For `p ∤ N` and `n = 0, L(f_α, j + 1) = (1 − ε(p)p^{k−j}/α)L(f, j + 1)` supplies the second Euler factor. In
the notation `I_j(x) = 2πi∫_{i∞}^x f_α(z)(z − x)^jdz` of §1.3, the right side for `n ≥ 1` is
`±α^{−n}p^{nj}Σ_{a mod p^n}χ(a)I_j(−a/p^n)/Ω^±`, which is RJW's interpolation formula with the period `−Ω^±/(2πi)`,
independent of `j`. Moreover `L_p(f, α; φ^±)` is the unique `h`-admissible distribution on `ℤ_p^×` with these
values. Proof: for `n ≥ 1`, sum formula `(2)` against `χ(a)` over `a mod p^n` with `p ∤ a`; with
`(−p^nz + a)^j = (−p^n)^j(z − a/p^n)^j, (p^nz + a)^j = p^{nj}(z + a/p^n)^j` and `S = Σ_aχ(a)I_j(a/p^n)`, the `±`-part is
`α^{−n}p^{nj}[(−1)^jS ± χ(−1)S]/(2Ω^±)`, which vanishes unless `± = (−1)^jχ(−1)` and then equals `α^{−n}p^{nj}(−1)^jS/Ω^±`;
the twisted Mellin formula evaluates `S`. For `n = 0, L_p(z^j) = Φ({∞} − {0})(z^j) − Φ({∞} − {0})(z^j·1_{pℤ_p})`, and the
distribution relation with `a = 0` gives the second term as `α⁻¹p^jΦ({∞} − {0})(z^j)`. Uniqueness: two `h`-admissible
distributions with `h < k + 1` that agree on locally polynomial functions of degree `≤ k` are equal
(Amice–Vélu–Višik, LocallyAnalyticDistributions Layer 2), and the values on `z^j·1_{a+p^nℤ_p}` determine these.
As printed, [PS] §6.2, `(1)`, p. 27, has `τ(χ⁻¹)` in the denominator and the factor `1/(−2πi)^j`, which agrees with
`(2)` and Proposition 6.3 only up to the sign `±` (equivalently, `(1)` holds for `(2)` after replacing `Ω⁻` by `−Ω⁻`),
and omits the factor `e` at `n = 0`; the statement here is the one `(2)` implies. *Needs:* §2.5 (The p-adic
L-function of a small-slope refinement); §1.2 (The twisted Mellin formula); §1.3 (The interpolation
dictionary; L-functions of `p`-stabilised forms); LocallyAnalyticDistributions Layer 2 (Amice–Vélu–Višik);
Mathlib `PadicInt.toZModPow`; AutomorphicLFunctionsAndLocalFactors AL.5 (Refined `GL₂` Euler factors
and conductor tests, `AL5.OrdinaryGl2EulerFactor`, `.ramified`, `.unramified`). The product of the
distribution factor and the stabilised `L`-value factor is that supplied expression, with the
same coefficient-field transport as for stabilisation in §1.3.

**Checks.**

- At `n = 0` and `j = 0` the distribution contributes `1 − 1/α`; for a good-prime
  weight-two form with `ε = 1` the primitive formula has `(1 − 1/α)²`.
- At `n ≥ 1` the character vanishes at `p` and both primitive good-prime factors are 1;
  the conductor prefactor `α^{−n}` remains.
- At `h = k + 1`, adding a nonzero distribution with Mellin transform `log^{[k]}`
  preserves the interpolation values. The strict bound `h < k + 1` is essential.

**Ordinary p-adic L-functions as integral measures** (theorem). Let `(f, α)` have slope 0, `𝒪` the integers of a
finite extension `K` of `ℚ_p` containing `K_f(α)`, and `φ^±` generators of the saturated lattices
`L_{f,α}^±(𝒪) = L_{f,α}^± ∩ Symb_{Γ₀}(V_k(𝒪))` (constructed as in §1.1, which needs only that the line lies in
`Symb_{Γ₀}(V_k(K))` for a finite-index `Γ₀`). Then `L_p(f, α; φ^±)` is an `𝒪`-valued measure: for `p ∤ a`,
`L_p(1_{a+p^nℤ_p}) = α^{−n}·[Y^k](φ({∞} − {a/p^n})) ∈ 𝒪`, where `φ = φ⁺ + φ⁻` and `[Y^k]` is the `Y^k`-coefficient, with no
binomial denominator; so `L_p ∈ 𝒪⟦ℤ_p^×⟧`. With arbitrary bases at `h = 0` one gets only an element of
`𝒪⟦ℤ_p^×⟧[1/p]`. Proof: the distribution relation with `g = 1` and the total-mass coefficient of `ρ_k`; `α ∈ 𝒪^×` and
`φ(D) ∈ V_k(𝒪)`; by §2.5 `L_p` is 0-admissible, hence a bounded measure (order zero equals bounded measures,
LocallyAnalyticDistributions Layer 2) determined by its values on compact opens; approximating
continuous `𝒪`-valued functions by locally constant ones shows all moments `μ(z^j)` are integral, even for
`p ≤ k`, which the polynomial lattice alone would not give by dividing by `C(k, j)` ([PS] §6.3, p. 28).
*Needs:* §2.5 (The p-adic L-function; Values of slope-`h` eigensymbols are `h`-admissible); §2.3
(Specialisation); §1.1 (Saturated integral lattices); LocallyAnalyticDistributions Layer 2;
PadicMeasuresIwasawaAlgebras `(𝒪⟦ℤ_p^×⟧)`.

### Examples

For the newform of level 11 at `p = 3`, the unit root `α ∈ ℤ₃^×` of `X² + X + 3` (`α ≡ −1` mod 3 by Hensel) gives
`L_p ∈ ℤ₃⟦ℤ₃^×⟧` for the integral generators `φ^±`, while `p⁻¹φ^±` gives a measure in `p⁻¹ℤ₃⟦ℤ₃^×⟧`, in general not
integral. For `k = 0, n = 0, p ∤ N` and trivial `ε, L_p(1) = (1 − 1/α)²·L(f, 1)/Ω⁺`, the Mazur–Tate–Teitelbaum
shape. For quadratic `χ`, and on the `+`-part, the printed formula `(1)` of [PS] and formula `(2)` agree; only the
`−`-part carries the sign; replacing `L(f_α, χ⁻¹, j + 1)` by `L(f_α, χ, j + 1)` is wrong for non-real `χ` (the non-real twist check of §1.2). For `k = 0` and Pollack's generators of level 11 the lift of Theorem 5.1 is explicit on three
divisors.

### Dependencies

Layers 0 and 1; LocallyAnalyticDistributions Layers 0, 2 and 4; PadicMeasuresIwasawaAlgebras for
integral measures; ModularForms Layer 4; Mathlib `PadicInt`, `PadicInt.toZModPow`.

## Layer 3: critical slope

This layer assumes `p` is odd, `p ∤ N` and the Hecke roots are distinct, as in [Bellaïche] §1.2, p. 3.
It treats refinements `(f, α)` of slope exactly `h = k + 1` for a cuspidal newform of tame level `N`.
Section 3.0 builds the critical-eigensymbol input and its local analytic families;
§§3.1–3.4 fix the single-form normalisation by eigenlifts and its secondary-function comparison. Bellaïche's involution
is `diag(1, −1)` and Pollack–Stevens' sign label is the `ι`-sign times `(−1)^k`: a Bellaïche or Pollack–Stevens
sign `s` corresponds to the sign `(−1)^ks` here, and this dictionary is applied before identifying signed
eigenlines. Proposed home: `TauCeti/NumberTheory/ModularForms/ModularSymbols/CriticalSlope`.

### 3.0 Critical eigensymbols and local analytic families

**Projective Banach model for signed symbols** (construction). For a small weight affinoid
`W = Sp(A)`, use the universal character `κ` on analytic stages where `κ(a + cz)` converges.
Construct a bounded complex `C_A^±` of Banach `A`-modules computing the signed distribution
symbols as `H⁰`, from the finite Manin presentation and its relations. Choose coefficient
stages by completed scalar extension from a field-valued distribution model, and prove
`(Pr)` for every term by an explicit continuous retract from `c_A(I)`; the map to the full
`A`-valued continuous dual is a comparison map, not an assumed isomorphism. Prove continuous
differentials, a chain representative of `U_p` that is degreewise completely continuous,
and coefficient-specialisation quasi-isomorphisms with the fixed-weight model. Include
level and Hecke maps and compatible homotopies. Apply LocallyAnalyticDistributions §4.16
to this complex. On an adapted factor `Q` its finite-slope complex is finite perfect.
For a cuspidal refined point, localise away from boundary Hecke support and prove that
the complex and all its geometric fibres have cohomology concentrated in degree zero;
shrink `W` so this holds on the chosen local chart (`Tor`-amplitude zero). Then
`H⁰(C_{A,Q}^±) = M_Q^±` is finite projective and commutes with coefficient specialisation. Elsewhere retain the complex and its cohomology rather than asserting
projectivity of a kernel of Manin equations. API: the model, its `(Pr)` retracts, compact
chain map, specialisation comparison and cuspidal concentration theorem. Sources:
[Bellaïche] §§3.1–3.2, Proposition 3.3 for the desired family interface;
LocallyAnalyticDistributions §4.16 for the complex construction and its cohomology hypotheses.

**Checks.**

- At weight `k, H⁰` specialises to the signed module of §2.2 with its `U_p` action.
- The complex `A —t→ A` over `A = K⟨t⟩` has `H⁰ = 0` but its fibre at `t = 0` has `H⁰ = K`;
  finite projective terms alone do not give base change for `H⁰`. The concentration
  hypothesis excludes this jump before `M_Q` is asserted finite projective.
- Compactness of `U_p` on a closed kernel does not exhibit a `(Pr)` retract. The model
  supplies actual degreewise retracts and commutation `dU_p = U_pd`.

*Needs:* Layers 0–2; LocallyAnalyticDistributions §§4.15–4.16 (affinoid coefficient
stages, degreewise `(Pr)`, compact representatives and finite-slope perfect complexes).

**Local analytic Hecke charts** (construction). Fix `p ∤ N, Γ₀ = Γ₁(N) ∩ Γ₀(p)`, a finite
extension `K/ℚ_p` and a sufficiently small affinoid `W` in the character space of `ℤ_p^×`, with
coordinate algebra `A` and universal character `κ`. Use the weight-`κ` distribution action
`μ |κ γ = U_(op γ)(μ)` from the §2.2 opposite-monoid adapter, whose function operator is
`(γ·_κg)(z) = κ(a + cz)g((b + dz)/(a + cz))`, on analytic stages where `κ(a + cz)` is analytic.
Use the preceding projective Banach model, its compact chain representative and its
coefficient-specialisation comparison. Near a cuspidal refined point impose its proved
cohomological concentration hypotheses. For an adapted Fredholm factor `Q` over `W`, take
`M_Q^± = H⁰(C_{A,Q}^±)`, a finite projective symbol module there, and its finite
`A`-algebra `T_Q^±` generated by the Hecke action, retaining the actual module and its base-change
maps. Define the local Hecke space `X_Q^± = Sp(T_Q^±)`, its weight map and coherent eigensymbol
module. Prove agreement on overlapping adapted factors, the integral-weight specialisation
maps to Layer 2, and the identification of a cuspidal refined newform with its Hecke point.
Take reductions explicitly when a reduced chart is used. This target constructs the local
charts needed below; it asserts no flatness or rank-one property at an arbitrary point.
API: `localHeckeChart`, `localHeckeChart_weight`, `localEigenmodule`,
`localEigenmodule_specialise` and `localHeckeChart_overlap`. Sources: [Bellaïche] §§3.1–3.3
(the analytic distribution modules and their specialisation), §3.4 (finite-slope Hecke spaces)
and §4.2 (the local module at a decent point).

**Checks.**

- At an integral weight `k, κ(u) = u^k` gives exactly the action of §2.2, including
  `β(a,p)g(z) = g(a + pz)`.
- At a small-slope cuspidal refined point each signed specialised eigenline maps
  isomorphically to its classical line by §2.4.
- A fibre with local algebra `K[t]/(t²)` retains length two and its nilpotent action;
  its single geometric point cannot replace that algebra or the generalised eigenspace.

*Needs:* Layers 0–2; §3.0 (Projective Banach model for signed symbols);
LocallyAnalyticDistributions §3.3 (The Mellin transform of distributions)
for analytic character spaces, §4.15 (Affinoid families, coefficient actions and compactness)
and §4.16 (Banach complexes and finite-slope decompositions).

**The theta exact sequence** (construction and theorem). For `k ≥ 0`, define the continuous
transpose derivative `Θ_k(μ)(g) = μ(g^(k+1))` from `D†_{−k−2}` to `D†_k`. Give its source the
right-action twist `det^(k+1)`, so that
`Θ_k(μ)|_kγ = det(γ)^(k+1)Θ_k(μ|_{−k−2}γ)`. The sequence
`0 → D†_{−k−2}(k+1) → D†_k → V_k → 0` is exact, with the last map `ρ_k` of §2.3.
Construct its induced maps on modular symbols and compare finite-slope spaces with those
using `D_k` by radius contraction as in §2.4. Retain connecting terms when applying `Hom_Γ`.
The exact sequence is on `D†`, where division by the falling factorial preserves the
subexponential moment bounds; no exact sequence onto `ker ρ_k` is asserted on the whole
bounded-moment space `D[1]`. API: `thetaDistribution`,
`thetaDistribution_apply`, `thetaDistribution_equivariant`, `thetaDistribution_injective`
and `thetaDistribution_range` `(range = ker ρ_k)`. Sources: [Bellaïche] §3.2.3, the sequence preceding Theorem 3.5, read on
`D†`; the moment description and radius comparison are [PS] Proposition 3.1 and
§§5.2–5.3. The derivative order is `k + 1`.

**Checks.**

- At `k = 0, Θ₀(δ₀)(z) = 1` but `Θ₀(δ₀)(1) = 0`; this is a nonzero element killed by `ρ₀`.
- For `β(a,p)`, differentiating `g(a + pz) k + 1` times multiplies by `p^(k+1)`,
  fixing the determinant twist and its direction.
- Every polynomial of degree `≤ k` has zero `(k + 1)`-st derivative, whereas
  `Θ_k(δ₀)(z^(k+1)) = (k + 1)! ≠ 0` in characteristic zero.
- At `k = 0`, the bounded sequence `ν(1) = 0, ν(z^n) = 1` for `n ≥ 1` lies in `ker ρ₀`
  on `D[1]`. Its derivative preimage has moments `1/(n + 1)`, which are unbounded but
  subexponential. Thus `D†` cannot be replaced by `D[1]` in the exact sequence.

*Needs:* §2.2 (Distribution modules); §2.3 (Specialisation);
LocallyAnalyticDistributions §1.4 (The Amice dictionary for the standard operators).

**Galois and crystalline-period adapter for the local chart** (construction and theorem).
On the reduced cuspidal charts, interpolate the traces and determinants of the classical
attachments to a continuous two-dimensional Galois pseudocharacter, unramified outside `Np`.
At a classical cuspidal point `x` with absolutely irreducible attachment, lift it to a
representation over the completed local Hecke algebra `B`, uniquely up to conjugacy.
Match every classical specialisation with AlgebraicModularFormsAndSerreWeights R15.5A.2.
Supply the good-`p` crystalline comparison as part of this adapter: if `ρ_ar` denotes that
supplier's arithmetic-Frobenius representation, use `ρ = ρ_ar^∨` in the usual covariant
`D_cris` convention, so `φ` has characteristic polynomial `X² − a_pX + ε(p)p^{k+1}`, and the
Hodge–Tate weights are 0 and `k + 1` when `χ_cyc` has weight `−1`. At arithmetic Frobenius `ℓ`,
`tr ρ(Frob_ℓ) = a_ℓ/(ε(ℓ)ℓ^{k+1})`; this specifies the dualisation. Its adjoint is canonically
identified with that of `ρ_ar` by the transpose-dual map.

For distinct roots and the chosen refinement `α`, prove the finite-slope crystalline-period
theorem: for every ideal `I` of finite colength in `B`, zero is a constant Sen weight of `ρ_B/I`
and `D_cris((ρ_B/I)|_{G_ℚ_p})^{φ=α̃}` is free of rank one over `B/I`, where `α̃` is the image
of `U_p`. Construct the refined deformation functor with these conditions, unramified
outside `Np`, its representing complete local ring and its surjection onto `B`. Identify its
tangent space inside `H¹(ℚ,ad ρ)`, with the local maps needed for the dimension-one
smoothness argument under adjoint Selmer vanishing. The finite-slope period theorem,
including Artinian quotients, is a target here. Sources: [Bellaïche] §2.3, Theorem 2.16
and proof, pp. 20–21; its [K1], Kisin, *Overconvergent modular forms and the
Fontaine–Mazur conjecture*, for the period theorem and Proposition 8.7 for the refined
local deformation problem. The good-`p` comparison is [Bellaïche] Lemma 2.11(ii).

**Checks.**

- For `I` the maximal ideal, the period line is the `α`-eigenline of classical `D_cris`;
  for `α ≠ β` the two lines are different.
- For a quotient `B/I = K[η]/(η²)`, freeness means length two over `K`. A crystalline
  period only in the residue fibre is insufficient for this assertion.
- For weight two and trivial `ε`, the dual of the supplier's determinant `χ_cyc` has
  determinant `χ_cyc⁻¹` and crystalline determinant `p`; using `ρ_ar` without dualisation
  gives crystalline determinant `p⁻¹` in these conventions.

*Needs:* §3.0 (Local analytic Hecke charts); §0.6 (Hom-side symbols and geometric cohomology);
AlgebraicModularFormsAndSerreWeights R15.5A.2;
IntegralHeckeAndGaloisDeterminants §§0.5, 1.3 and 1.5 (pseudocharacters, henselian
irreducible reconstruction and coefficient descent); ArithmeticGaloisRepresentations §7.2 (Adjoint);
LocalGaloisDeformationRings §§F.1.1–F.1.10 and 1.15 (deformations and characteristic-zero
Artinian coefficient categories);
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5 (period structures and
finite-extension-field realization comparisons) and §§R07.P7.1–R07.P7.5 (labelled Sen theory);
PadicPeriodRings §§1.5, 3–4; SelmerIwasawaCohomology §§2.1–2.2;
ArithmeticGaloisDuality D7 (Local duality over finite and local coefficient fields:
local Tate duality and the local Euler characteristic, with stable-lattice topology).

**CM adjoint-Selmer vanishing** (theorem). Let `f` be a cuspidal CM newform of weight `k + 2 ≥ 2`
and level `N, p ∤ N`, and `F` its imaginary quadratic CM field. After a finite coefficient
extension write `ρ_f|_{G_F} = χ ⊕ χᶜ`. Prove `H¹_g(ℚ,ad ρ_f) = 0` for the unramified
conditions away from `p` and the de Rham condition at `p`. This includes the infinite-image
Hecke-character vanishing `H¹_f(F,χ/χᶜ) = H¹_f(F,χᶜ/χ) = 0`: these characters are the
p-adic realisations of the quotients of the algebraic CM character of infinity type
`(k + 1,0)` and its conjugate, of types `(k + 1,−k−1)` and `(−k−1,k + 1)`. Establish this
specific elliptic-unit/main-conjecture argument here, including its specialisation and
local-condition comparisons, rather than applying a finite-image adjoint theorem.
For each place above `p` the local finite condition is the kernel after tensoring with
`B_cris`; globally use the unramified conditions away from `p`. The two scalar factors
`H¹_f(F,K)` vanish by class field theory. Restriction and
inflation–restriction over the quadratic extension give the global vanishing.
Prove `H¹_f = H¹_g` for these adjoint coefficients at every place above `p` using the
crystalline comparison and the absence of `φ = 1` in `D_cris((ad ρ_f)^∨(1))`; include
split and inert `p`. This transports the finite Selmer vanishing to the stated de Rham
kernel. Source: [Bellaïche] Proposition `2.15(iv)` and its proof, p. 20, whose hypotheses
are exactly cuspidal CM, weight at least two and `p ∤ N`, and whose conclusion is the
finite adjoint Selmer vanishing; its infinite-image step uses Rubin's imaginary-quadratic
main-conjecture argument. The specific CM-character vanishing and its proof are owned
here; the general imaginary-quadratic main conjecture is not an input from the Selmer supplier.

**Checks.**

- For `X₀(32)` at `p = 5, F = ℚ(i)` and `p` splits; the adjoint de Rham Selmer kernel
  vanishes, supplying decency of the critical-slope refinement.
- Over `F` the adjoint has two scalar summands and both quotient characters; using
  only the trace-zero adjoint would omit one scalar summand.
- The quotient characters have nonzero opposite labelled Hodge–Tate weights;
  they have infinite image and are not covered by finite-image Selmer finiteness.

*Needs:* §3.0 (Galois and crystalline-period adapter for the local chart);
ArithmeticGaloisRepresentations §7.2; SelmerIwasawaCohomology §§2.1–2.2;
ArithmeticGaloisDuality §§R02.2.1–R02.2.2 (inflation–restriction); SelmerIwasawaCohomology §4.9
(Bloch–Kato local finite conditions); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P3
(fundamental period sequences);
ClassFieldTheory Layers 5 and 11 (local and global class field theory).

**Criticality and decency** (definitions and classification). For a cuspidal newform `f` and a
refinement with distinct roots, define criticality by ramification of the local weight map,
and theta-criticality by membership of the refined overconvergent form in the image of
`(q d/dq)^(k+1)` from weight `−k`. This includes construction of that overconvergent form module
and the Hecke-compatible comparison of its local Hecke space with the symbol charts above,
using the ordinary-locus modular-curve neighbourhoods and their isogeny correspondences.
For cuspidal refinements critical and `θ`-critical coincide and imply slope `k + 1`.
A cuspidal refinement is decent if it is noncritical or
`H¹_g(ℚ, ad ρ_f) = 0`, where `ρ_f` is its attached representation and `ad` is the full
endomorphism representation. Here `H¹_g` is the global Selmer kernel with unramified conditions
away from `p` and the kernel of `H¹(ℚ_p,ad ρ_f) → H¹(ℚ_p,B_dR ⊗ ad ρ_f)` at `p`.
In particular noncritical refinements and, by CM adjoint-Selmer vanishing, CM newforms
are decent. API: criticality and theta-criticality of forms, `IsDecentRefinement`, and
invariance under coefficient extension. No symbol eigenline is used in these definitions.
Sources: [Bellaïche] §§2.1–2.2, Proposition 2.12, Definition 1 and Proposition `2.15(iv)`.

**Checks.**

- A small-slope refinement is neither critical nor theta-critical, by §2.4.
- The critical-slope refinement of a CM form at a split ordinary prime is theta-critical
  and decent; slope alone does not give a nonzero specialisation.
- A local weight map `t ↦ t` has ramification index one, while `t ↦ t²` at zero has index two;
  their identical residue field does not identify their criticality.

*Needs:* §3.0 (Local analytic Hecke charts; The theta exact sequence;
Galois and crystalline-period adapter for the local chart; CM adjoint-Selmer vanishing);
ModularCurvesPartII §§7.1, 9.1–9.3 and 11.1 (ordinary modular geometry and isogeny correspondences),
and §§14.1–14.4a and 14.8 (coefficient systems and modular isogeny transport);
AlgebraicModularFormsAndSerreWeights R15.5A.2 (the classical higher-weight attachment);
ArithmeticGaloisRepresentations §7.2 (Adjoint, trace pairing and Schur's lemma);
SelmerIwasawaCohomology §§2.1–2.2 (Selmer data and kernel);
PadicPeriodRings §1.5 (The topological de Rham period rings).

**Critical eigensymbol multiplicity** (theorem). For a decent cuspidal refinement as above,
each full signed eigenspace has dimension one. Let `E^±` be the corresponding generalised
signed eigenspaces. The dimensions of `E⁺` and `E⁻` are the same
integer `e`, equal to the ramification index of the local weight map; the local Hecke curve
is smooth at this point and its eigensymbol module is free of rank one over its local
Hecke algebra. The refinement is critical iff `e > 1` iff specialisation kills the signed
eigenline. At `e = 1` specialisation is an isomorphism of the overconvergent and classical
signed eigenlines. For these decent cuspidal refinements define `IsSymbolCritical`
by `dim E^± > 1` and `IsSymbolThetaCritical` by membership of the signed eigenline in the
image of `Θ_k` on symbols. Prove that these agree with the form-theoretic criticality
and theta-criticality above, with decency retained in both equivalences.
Source: [Bellaïche] Theorem 1, §4.2, Theorem 4.7 and Corollary 4.8.
*Needs:* §3.0 (Local analytic Hecke charts; Criticality and decency; The theta exact sequence;
Galois and crystalline-period adapter for the local chart); §2.1 (The refined eigenline).

**Checks.**

- At `e = 1` the signed eigenline specialises isomorphically to its classical line.
- At `e = 2` the local generalised space has dimension two but its full eigenspace
  has dimension one; the eigenline specialises to zero.
- For `X₀(32)` at the split prime 5, CM adjoint-Selmer vanishing supplies decency
  and the critical signed eigenline lies in the theta image. No equivalence
  involving a unique symbol eigenline is asserted without decency.

**Secondary and family L-functions** (construction). On the signed generalised eigenspace
of a decent critical cuspidal point of `length e`, use the powers of the maximal ideal of
its local Hecke algebra to obtain the unique Hecke-stable full flag. Evaluation on
`{∞} − {0}`, restriction to the units and the Mellin transform define functions
`L₀^±`, …, `L_{e−1}^±`, each of order at most `k + 1`, with `L₀^±` the primary eigenline function.
Their flag is canonical; `L_i^±` is defined up to nonzero scaling and addition of earlier
members. For `i < e − 1` the values at all classical characters vanish. Normalise the top
generalised vector by its nonzero classical specialisation `φ^±`; the top function then has
the classical interpolation formula of §2.5 with that normalisation.
On a sufficiently small reduced affinoid neighbourhood `V` of the point in the local chart,
construct the jointly analytic `L^±(y,σ)`, up to an analytic unit depending only on `y`, whose
specialisation at each refined classical point is its primary function up to a nonzero
scalar independent of `σ`. Prove that noncritical classical points are Zariski dense near
the point. These are the local family and secondary-function targets; no global ordinary
family construction is needed. API: `secondaryPadicL`, `secondaryPadicL_flag`,
`secondaryPadicL_interpolation`, `localFamilyPadicL`, `localFamilyPadicL_specialise` and
`localFamilyPadicL_unit`. Source: [Bellaïche] §1.4.5, Theorems 2–3 and §4.3.

**Checks.**

- At `e = 1` there is only `L₀`, and no secondary function or positive-length flag quotient.
- At `e = 2`, changing a generalised vector by a multiple of its eigenvector changes `L₁`
  by the same multiple of `L₀` and preserves the flag.
- A function on a non-reduced chart can vanish at every point without vanishing as a
  section; the comparison through a dense set of points requires the reduced hypothesis.

*Needs:* §3.0 (Critical eigensymbol multiplicity; Local analytic Hecke charts);
§2.5 (the distribution relation and interpolation); LocallyAnalyticDistributions §3.3.

### 3.1 Non-`θ`-critical refinements

**The critical-slope p-adic L-function of a non-`θ`-critical refinement** (construction). Let `(f, α)` be a
refinement of critical slope that is not `θ`-critical (equivalently, by §3.0, not
critical, hence decent). Then each refined eigenline `φ^±` has a unique overconvergent eigenlift
`Φ^± ∈ Symb_{Γ₀}(D_k)^±` with `ρ*_k(Φ^±) = φ^±`: by §3.0 (Critical eigensymbol multiplicity with ramification
index `e = 1`; [PS] Theorem 5.14), `ρ*_k` restricts to an isomorphism of the `f_α`-eigenspaces. Define
`L_p(f, α; φ^±) = Φ({∞} − {0})|_{ℤ_p^×}` with `Φ = Φ⁺ + Φ⁻`. It is `(k + 1)`-admissible (the `U_p`-eigenvalue has valuation
`k + 1`), satisfies the distribution relation of §2.5, and its Pollack–Stevens-labelled `±`-parts are
Bellaïche's `L^±(f_α, ·)` with the scalars fixed by `ρ*_k(Φ^±) = φ^±`, so the periods `Ω^±` are those of §2.5
([PS] §6.4, Definition 6.4, p. 29, where the space of forms is `S_{k+2}(Γ₀, ℚ̄_p)`; [Bellaïche] §1.4.2, p. 7). The
normalisation is by specialisation, not by values, since at critical slope values do not determine the
distribution. API: `criticalSlopePadicL`, `criticalSlopePadicL_lift_unique` (`Φ^±` is the unique eigenlift
of `φ^±`), `criticalSlopePadicL_admissible` (`(k + 1)`-admissible), `criticalSlopePadicL_eq_bellaiche` (for
each sign, Bellaïche's eigenvector with the same full Hecke eigensystem and the same nonzero
specialisation gives the same normalised distribution; summing the signs gives the combined
function). *Needs:* §2.1 (Refinements); §2.5 (The p-adic L-function); §3.0 (Criticality and decency; Critical eigensymbol multiplicity).

**Checks.**

- For the slope-one refinement of the newform of level 11 at `p = 3`, the unique full
  eigenlift specialises to the chosen nonzero signed classical basis ([PS] Example 8.6, p. 35).
- At `p = 5` the same specialisation identity holds ([PS] Example 8.7, p. 36); a
  vector with zero specialisation cannot be the lift of the nonzero classical basis.
- For a nonzero signed classical basis of the CM form of level 32 at `p = 5` (split in `ℚ(i)`), every full
  eigenvector specialises to zero, so no eigenlift exists and the construction does not apply; the
  definition must take the non-`θ`-critical hypothesis as input.
- For the slope-one refinement of the newform of level 11 at `p = 3 (k = 0)`, adding to `L_p(f, α; φ^±)` the
  distribution whose Mellin transform is `log_p(s)` on each tame component (§3.2) gives a second
  1-admissible distribution with the same value at every finite-order character; a definition as "the
  1-admissible distribution with these values" is therefore not well defined, and only the eigenlift
  normalisation selects `L_p(f, α; φ^±)`.

**Interpolation at critical slope** (theorem). For `(f, α)` as above, `0 ≤ j ≤ k` and `χ` of conductor `p^n`,
`L_p(f, α; φ^±)(z^j·χ)` is given by the formula of §2.5: `± = (−1)^jχ(−1)`, the factor `α^{−n}p^{nj}τ(χ)j!/(2πi)^j`, the
Euler factor `1 − p^j/α` when `n = 0`, and `L(f_α, χ⁻¹, j + 1)/Ω^±`. It is a formal consequence of `Φ` being a
`U_p`-eigensymbol lifting `φ⁺ + φ⁻`: evaluate `Φ({∞} − {0})` on `z^j·1_{a+p^nℤ_p}` with the distribution relation and use
the twisted Mellin formula ([PS] §6.4, Proposition 6.5, p. 29, whose display `(3)` has the `L`-value at `j + 1`,
with the sign and the `n = 0` factor of §2.5). Only the values are proved; uniqueness fails (next target).
*Needs:* §3.1 (The critical-slope p-adic L-function); §2.5 (Interpolation and uniqueness).

### 3.2 The failure of uniqueness and `θ`-critical forms

**Interpolation does not determine critical-slope L-functions** (lemma). At `h = k + 1` there are nonzero
`(k + 1)`-admissible distributions on `ℤ_p^×` vanishing at every `z^j·χ` (`0 ≤ j ≤ k, χ` of finite order): on each
tame component, the distribution whose Mellin transform in the variable `s` is
`log^{[k]}(s) = ∏_{i=0}^{k} log_p(γ^{−i}s)`, with `γ` a topological generator of `1 + pℤ_p` at odd `p` (torsion `μ_{p−1}`) and of
`1 + 4ℤ₂` at `p = 2` (torsion `μ₂`). It has order exactly `k + 1` and vanishes at `s = γ^jζ` for all `p`-power roots of
unity `ζ` and `0 ≤ j ≤ k`, which are the images of the characters `z^jχ`; adding a multiple of it to `L_p` preserves
all interpolation values and the admissibility. So the uniqueness of `L_p(f, α; φ^±)` is the uniqueness of
the eigenlift, not of an admissible distribution, and the strict inequality `h < k + 1` of the
Amice–Vélu–Višik theorem cannot be extended by continuity ([PS] §6.4, p. 29; [Bellaïche] §1.4.3, p. 7).
*Needs:* §2.5 (Interpolation and uniqueness); LocallyAnalyticDistributions Layer 2 (the sharpness of the
threshold); §3.0 (The theta exact sequence).

**`θ`-critical single forms** (comparison). For a decent `θ`-critical cuspidal refinement at a prime not
dividing the tame level (for example the critical-slope refinement of a CM form with `p` split, such as
`X₀(32)` at `p = 5`), the construction of §2.5 does not apply: the eigenline of `Symb_{Γ₀}(D_k)^±` lies in `ker ρ*_k`
(Bellaïche's theorem), Bellaïche's `L^±` vanishes at all classical characters, and the classical
interpolation is carried by the top secondary L-function `L^±_{e−1}`, normalised by the requirement that
`ρ*_k` of the top generalised eigenvector be `φ^±`, where `e = dim Symb_{Γ₀}^±(D_k)(f_β) ≥ 2` ([Bellaïche] Theorems 1–2 and
§1.4.5, p. 11; [PS] Remark 5.15, p. 26). Decency is a hypothesis: CM forms are decent ([Bellaïche]
Proposition `2.15(iv)`, p. 20), and no statement about a non-decent point is made. Interpolation values
are not a uniqueness theorem here, since they vanish for the primary L-function. *Needs:* §3.0
(Criticality and decency; Critical eigensymbol multiplicity; Secondary and family L-functions); §2.3 (Specialisation).

### 3.3 Comparison through families

**Comparing critical and arithmetic L-functions through families** (theorem). Let `V` be a reduced affinoid
neighbourhood of a decent critical-slope point `x` of the eigencurve, with the two-variable `L^±(y, σ)` of §3.0 and
a chosen trivialization of its period line. Let `A^±(y,σ)` be an arithmetic construction supplied
as a jointly rigid analytic function on `V × 𝒲`, where `𝒲` is the character space in the
Mellin variable, and let `u ∈ 𝒪(V)^×` be one fixed analytic unit. If
`A^±(y,σ) = u(y)L^±(y,σ)` for every `σ` and a Zariski-dense set of noncritical classical
`y ∈ V`, then this identity holds on `V × 𝒲`, in particular at `x`. Two analytic functions on the reduced curve `V` that
agree on a Zariski-dense set agree, and non-critical classical points accumulate at `x` (classical
weights `k′ ≫ 0` near `k` have `v_p(β′) = v_p(β) < k′ + 1` on `V`). On a non-reduced `V`, agreement at points sees only
the reduction. Comparisons at `x` by interpolation values alone are not valid ([Bellaïche] §1.4.4,
Theorem 3, p. 10). *Needs:* §3.0 (Local analytic Hecke charts; Secondary and family L-functions); §3.2 (Interpolation does not determine critical-slope L-functions).

**Checks.**

- On a reduced `V` with more than one point, setting `A(y,σ) = L(y,σ)` for `y ≠ x`
  and `A(x,σ) = L(x,σ) + 1` is analytic in `σ` on each fibre and agrees densely,
  but fails the conclusion. Joint analyticity is essential.
- Choosing unrelated scalar multiples at each classical `y` supplies no single
  `u ∈ 𝒪(V)^×`. The hypothesis requires that analytic unit as part of the data.
- On `K[η]/(η²)`, the section `η` vanishes at every geometric point and is nonzero;
  pointwise density cannot replace the reduced hypothesis.

### 3.4 The critical-slope examples of Pollack–Stevens

**Critical-slope examples** (application). For `X₀(11) (k = 0)` at `p = 3` and `p = 5`, prove that the classical
slope-one space `Symb_{Γ₀(11p)}(ℚ_p)^{(=1)}` is three-dimensional, with one dimension for each cuspidal sign and one plus
Eisenstein dimension. Prove non-`θ`-criticality of the cuspidal refinements and existence and uniqueness
of the full Hecke eigenlift of each fixed signed cuspidal symbol. Construct a plus Hecke eigenlift
of the plus Eisenstein symbol; the Eisenstein refinement is `θ`-critical ([Bellaïche] Proposition `2.12(v)`, p. 18).
At `Γ₀(33), p = 3` and `k = 0`, construct a `ℚ₃`-valued distribution symbol
`e ∈ Symb_{Γ₀(33)}(D₀(ℤ₃))⁻` with `e ≠ 0, ρ₀*(e) = 0, T_ℓe = (ℓ + 1)e` for `ℓ ∤ 33`,
`U₁₁e = e` and `U₃e = 3e`. At `p = 5` also prove the positive ordinary `μ`-invariant in the stated
period normalisation ([PS] §8.4, Examples 8.6–8.7, pp. 35–36). Variation of
splitting fields of finite-weight fibres gives no non-freeness conclusion for a Hida algebra;
the monic-quadratic example below supplies a free algebra with different splitting fields.
For the CM form of `X₀(32)` at the split prime `p = 5`, decency and
`θ`-criticality do prove that the primary signed eigenline is one-dimensional and specialises to zero, so
a nonzero classical eigenvector has no eigenlift ([PS] Example 8.8, p. 36; [Bellaïche] §1.4.1, Remark 1,
p. 6, and Proposition `2.15(iv)`, p. 20). *Needs:* §3.1 (The critical-slope p-adic L-function); §3.2 (`θ`-critical
single forms); §3.0 (Critical eigensymbol multiplicity; CM adjoint-Selmer vanishing).

**Checks.**

- The algebra `ℤ₃⟦T⟧[x]/(x² − T − 9)` is free with basis `1,x`. Its rational fibre
  at `T = 0` splits and the fibre at `T = 3` is `ℚ₃(√3)`. Different splitting fields
  do not imply non-freeness.
- At `p = 3`, if `Φ⁺_eis` is the plus lift and `c ∈ ℚ₃`, then `Φ⁺_eis + ce`
  has the same full Hecke eigenvalues and classical specialisation. Distinct `c`
  give distinct lifts; for `c ≠ 0` the lift is not plus.
- The vector `e` is minus, has zero total-mass specialisation and has nonzero
  `U₃`-eigenvalue 3 of slope one; it is not the zero vector or a classical lift.
- For `X₀(32)` at `p = 5` the primary signed line is nonzero with zero classical
  specialisation. It cannot serve as an eigenlift of a nonzero classical basis.

### Examples

Adding the distribution with Mellin transform `log^{[0]}(s) = log_p(s)` to the critical-slope L-function of
the newform of level 11 at `p = 3 (k = 0)` preserves every value at finite-order characters. The CM form of
level 32 at `p = 5` is the standard `θ`-critical example; its primary L-function vanishes at every classical
character and its top secondary L-function interpolates.

### Dependencies

Layer 2; §3.0; LocallyAnalyticDistributions §§2.3, 3.3, 4.15–4.16;
AlgebraicModularFormsAndSerreWeights R15.5A.2; ArithmeticGaloisRepresentations §7.2;
SelmerIwasawaCohomology §§2.1–2.2 and 4.9; PadicPeriodRings §§1.5, 3–4;
IntegralHeckeAndGaloisDeterminants §§0.5, 1.3 and 1.5;
LocalGaloisDeformationRings §§F.1.1–F.1.10 and 1.15;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5 and R07.P7.1–R07.P7.5;
ArithmeticGaloisDuality §§R02.2.1–R02.2.2 and D7;
ModularCurvesPartII §§7.1, 9.1–9.3, 11.1, 14.1–14.4a and 14.8;
ClassFieldTheory Layers 5 and 11.

## Layer 4: tame twists, supersingular primes, comparisons and examples

Throughout, `f` is a newform of weight `k + 2`, level `N` and character `ε, p` a prime and `M ≥ 1` an integer prime to
`p`; `ℤ_{p,M}^× = lim_n (ℤ/p^nM)^×`. Pollack's supersingular paper writes `k` for the weight; its statements are
translated to weight `k + 2` (his product over `0 ≤ j ≤ k − 2` becomes `0 ≤ j ≤ k` here). `γ` is a topological generator of
`1 + qℤ_p` with `q = p` for odd `p` and `q = 4` for `p = 2`, and `Φ_n(T) = Σ_{t=0}^{p−1}T^{p^{n−1}t}` is the `p^n`-th cyclotomic
polynomial. In this layer `K` is the completion of `K_f` at the chosen p-adic place and
`K_ψ = K(ψ)`; individual refined symbols are defined over `K_ψ(α)`. The root `α` is not assumed to lie
in `K_ψ`. Both roots use bases transported from the same period-normalised symbols of `f`.
For branchwise interpolation and its uses in §4.2, `ψ` has primitive conductor exactly `M` on
`(ℤ/M)×`. A character with smaller tame conductor is treated on the group with that minimal conductor.
Proposed home: `TauCeti/NumberTheory/ModularForms/ModularSymbols/{Supersingular,Comparison,Examples}`.

### 4.1 Euler factors and tame twists

**The two Euler factors at `p`** (theorem). AutomorphicLFunctionsAndLocalFactors AL.5, Refined `GL₂` Euler
factors and conductor tests (`AL5.OrdinaryGl2EulerFactor`, `.ramified`, `.unramified`), supplies the
factor polynomial and its specialisations. Identify its two factors with the distribution relation
of §2.5 and the stabilised complex L-function of §1.3, with those sections' conventions. Evaluate the
supplied complex expression through an embedding of the algebraic coefficient and character field,
then transport its algebraic value to the chosen p-adic completion, as in §1.3. For a refinement `(f, α)`
with `p ∤ N` and a character `ϕ` of conductor prime to `p (n = 0)`, the interpolation factor is
`e_p(α, ϕt^j) = (1 − ϕ(p)p^j/α)(1 − ϕ̄(p)ε(p)p^{k−j}/α)`: the first
factor comes from the distribution (§2.5) and the second from `L(f_α, s) = (1 − βp^{−s})L(f, s)` (§1.3) with
`αβ = ε(p)p^{k+1}`. For conductor `p^ν` with `ν ≥ 1` both factors are 1 and the prefactor is `α^{−ν}`. In [Bellaïche] §1.4.3,
`(5)`, p. 8, the factors of the refinement `f_β` are printed with `α` in the denominators; with `β`, its own
`U_p`-eigenvalue, they read `β^{−ν}(1 − ϕ̄(p)ε(p)p^{k−j}/β)(1 − ϕ(p)p^j/β)`. For `X₀(11)` at `p = 3` and `j = 0`,
`e_p = (1 − 1/α)²` with `α` the unit root of `X² + X + 3`. *Needs:* §2.5 (Interpolation and uniqueness); §1.3
(L-functions of `p`-stabilised forms); AutomorphicLFunctionsAndLocalFactors AL.5 (Refined `GL₂` Euler
factors and conductor tests).

**Checks.**

- At `k = j = 0` and `ϕ = ε = 1`, each source contributes `1 − 1/α`, giving `(1 − 1/α)²`.
- For `ν ≥ 1` the zero-extended values `ϕ(p)` and `ϕ⁻¹(p)` vanish; both factors are 1,
  while the conductor prefactor remains `α^{−ν}`.
- At `α = 1` and `j = 0` the distribution factor vanishes; it cannot be cancelled
  when comparing the stabilised and primitive formulas.

**p-adic L-functions with a tame twist** (theorem). Let `p ∤ N` and `(f, α)` a refinement of slope `h < k + 1`. For
`n ≥ 1` and `(a, Mp) = 1` the formula
`μ^±_{f,α}(P, a + p^nMℤ_{p,M}) = α^{−n}λ^±(f, P; a, p^nM) − ε(p)p^kα^{−n−1}λ^±(f, P; a, p^{n−1}M)`, where `λ^±` are the modular
symbols of `f` divided by periods `Ω^±_f` and `P` runs over integral polynomials of degree `≤ k`, defines an
`h`-admissible distribution on `ℤ_{p,M}^×` (the values for `n = 0` follow by finite additivity from `n = 1`).
At slope `h = 0` it is a bounded measure; at positive slope the construction supplies the stated
upper admissibility bound. Additivity is the `T_p`-eigenform relation and the growth is Višik's
([Pollack SS] §2.2, the measures and Proposition 2.8, p. 530). For a tame character `ψ` whose `(ℤ/M)×`
component has primitive conductor exactly `M`, the power series
`L_p(f, α, ψ, T) = ∫ψχ_u dμ^{sgn ψ}_{f,α}` (`u = 1 + T, χ_u` the wild character with `γ ↦ u`) lies in `K(α, ψ)⟦T⟧` and is
`O(log_p(1 + T)^h)`. For `χ = x_p^jϕ` in this `ψ`-branch with `0 ≤ j ≤ k` and `ϕ` of finite order,
the conductor of `ϕ` is `m = p^νM`, and
`L_p(f, α, χ) = e_p(α, χ)·m^{j+1}/(−2πi)^j·j!/τ(ϕ⁻¹)·L(fϕ⁻¹, j + 1)/Ω^±_f` with
`e_p(α, χ) = α^{−ν}(1 − ϕ⁻¹(p)ε(p)p^{k−j}/α)(1 − ϕ(p)p^j/α)`, and it is the unique `O(log_p(1 + T)^h)` function with these
values ([Pollack SS] §2.3, Proposition 2.11, p. 531): a difference vanishes at all `γ^jζ − 1, 0 ≤ j ≤ k`, and is
`O(log^h)` with `h < k + 1`. The interpolation formula is evaluated with the twisted Mellin formula of §1.2
(Pollack cites Mazur–Tate–Teitelbaum §14 for it); for `M = 1` and `ψ` trivial it is `L_p(f, α)` of §2.5 up to the
normalisation of periods, and it agrees with the two Euler factors above. The torsion components are
`μ_{p−1}` at odd `p` and `μ₂` at `p = 2`, and each tame character includes its prime-to-`p M`-component. *Needs:* §2.5
(The p-adic L-function; Interpolation and uniqueness; Values of slope-`h` eigensymbols are `h`-admissible);
§1.2 (The twisted Mellin formula); PadicMeasuresIwasawaAlgebras (measures on `ℤ_{p,M}^×` and the branch
decomposition).

**Checks.**

- The nonzero Dirac measure `δ₁` at 1 is bounded and has `‖δ₁‖_r = 1` for `0 < r ≤ 1`.
  It satisfies every positive upper admissibility bound, since `1 ≤ r^{−h}` for `h > 0`;
  such a bound alone does not imply unboundedness.
- At `p = 3` and `M = 2` the trivial character has tame conductor 1. There are no
  characters of conductor `2·3^ν`; both constant series 0 and 1 satisfy that empty
  interpolation test and an order-zero bound. Use `M = 1` for this branch.
- At `p = 3` and `M = 4` the nontrivial character modulo 4 is primitive. Multiplying it
  by a primitive wild character of conductor `3^ν` gives conductor `4·3^ν`.
- For `M = 1` and `ψ = 1` the branch is the one in §2.5; the trivial character has
  `ν = 0` and retains both good-prime Euler factors.

**A zero `U_p`-eigenvalue is outside finite-slope interpolation** (theorem). If `p | N` and `a_p(f) = 0`, no
refinement of `f` at `p` exists, so the constructions involving `α^{−n}` produce no p-adic L-function by this
roadmap's method; `p² | N` does not justify choosing a root of the good-prime Hecke polynomial. If `a_p ≠ 0`
the unique bad-prime refinement has `α = a_p` and uses the bad-prime interpolation normalisation (no second
Euler factor). Proof: unfold the definition of a refinement at `p | N` with the actual bad-prime
`U_p`-eigenform relation ([PS] §6, opening, pp. 26–27). *Needs:* §2.1 (Refinements); §2.5 (The p-adic
L-function). *Lean:* `IsBadRefinement`, `not_isBadRefinement_zero`.

**Checks.**

- `a_p = 0` admits no nonzero bad-prime refinement.
- For `a_p = 7` the bad-prime scalar helper accepts `α = 7`.
- For `a_p = 7` the same helper rejects `α = 1`, despite its nonvanishing.

### 4.2 Supersingular primes

**Both refinements at a good supersingular prime, and their zeros** (theorem). Let `p ∤ NM` with `v_p(a_p) > 0`
and fix `ψ` with primitive `M`-component as in §4.1.
Both roots `α₁, α₂` of `X² − a_pX + ε(p)p^{k+1}` have slope in `(0, k + 1)`, since `h₁ + h₂ = k + 1`, so both refinements
are small slope and both `L_p(f, α_i, ψ, T)` exist. A nonzero power series convergent on the open unit disc
has finitely many zeros exactly when its coefficients are bounded (Lazard; [Pollack SS] Lemma 3.2,
p. 533), and
`L_p(f, α_i, ψ, ζ_{p^n} − 1) = c_n/α_i^{n+1}` with `c_n` independent of `α_i` (exponent `n + 2` for `p = 2`; Remark 2.12). Hence:
if `h₁ ≠ h₂`, at least one of the two has infinitely many zeros. An identically zero branch already
has this property. Otherwise, if both had finitely many zeros, both would be nonzero bounded
series. Weierstrass preparation then gives bounded valuations at `ζ_{p^n} − 1` for large `n`,
contradicting `α₁^{n+1}L(α₁) = α₂^{n+1}L(α₂)` when `h₁ ≠ h₂`
([Pollack SS] §3, Theorem 3.3, pp. 533–534, Mazur's argument). If `a_p = 0`, then
`h₁ = h₂ = (k + 1)/2` and `α₂ = −α₁`. With the common period bases, coefficient
automorphisms fixing `K_ψ` carry `L_p(f, α₁, ψ, T)` to `L_p(f, α₂, ψ, T)` when they exchange the roots:
this follows from the unique small-slope eigenlifts. Hence
`G⁺_ψ = (L_p(α₁) + L_p(α₂))/2` and `G⁻_ψ = (L_p(α₁) − L_p(α₂))/(2α₁)` descend to `K_ψ⟦T⟧`
(the assertion is immediate if the roots already lie in `K_ψ`). Write `L_p(α₁) = G⁺_ψ + α₁G⁻_ψ`. For odd `p`
`G⁺_ψ` vanishes at `ζ_{p^{2n}} − 1` and `G⁻_ψ` at `ζ_{p^{2n−1}} − 1 (n ≥ 1)`, the parities being reversed for `p = 2`.
If either refined function is identically zero, it already has infinitely many zeros. If both are
nonzero and bounded, the alternating zero sets and the nonzero-series criterion force
`G⁺_ψ = G⁻_ψ = 0`, a contradiction. Thus one refined function has infinitely many zeros in every
case. The stronger assertion that one is unbounded holds under
`L_p(α₁) ≠ 0 ∨ L_p(α₂) ≠ 0`: boundedness of both would again force both G-series, hence both
refined functions, to vanish. If `α₁ ∉ K_ψ`, coefficient conjugation transfers infinitely many zeros
to the other refined function, including when one is identically zero; under the same nonzero
hypothesis both are unbounded ([Pollack SS] Theorem 3.5 and proof, pp. 534–535, Perrin-Riou's argument).
For an elliptic curve `E/ℚ`
with good supersingular reduction at `p`, one of the two has infinitely many zeros: for `p ≥ 5, a_p = 0` because
`p | a_p` and `a_p² < 4p`; for `p = 2` or 3 with `a_p ≠ 0, α₁/α₂` is a primitive fourth or sixth root of unity, which
still forces infinitely many zeros ([Pollack SS] Corollary 3.6 and its proof, p. 535). Ordinary `p` is
excluded: only one root has slope `< k + 1`. *Needs:* §4.1 (p-adic L-functions with a tame twist); §2.1
(Refinements).

**Checks.**

- For the level-11 newform at `p = 19` and `ψ = 1, K_ψ = ℚ₁₉` and
  `α = √−19 ∉ K_ψ`; both refined functions have infinitely many zeros.
- Enlarging the coefficient field to contain `α` makes the non-rationality test
  inapplicable, although the functions and their zeros are unchanged.
- At an ordinary good prime the other slope is `k + 1`, so the pair of small-slope
  L-functions required by this target is unavailable.
- In the analytic two-series model, `L₁ = L₂ = G⁺_ψ = G⁻_ψ = 0` satisfies the decomposition,
  alternating vanishing, coefficient descent and upper growth bounds. Both refined functions
  have infinitely many zeros and bounded coefficients; the nonzero hypothesis of the
  unboundedness strengthening fails.

**Pollack's half-logarithms** (construction). For an integer `j` put
`log⁺_{p,j}(T) = (1/p)·∏_{n≥1}Φ_{2n}(γ^{−j}(1 + T))/p` and `log⁻_{p,j}(T) = (1/p)·∏_{n≥1}Φ_{2n−1}(γ^{−j}(1 + T))/p`, and
`log^±_p = ∏_{j=0}^{k}log^±_{p,j}`. The products converge on the open unit disc, since
`(1/p)Φ_m(γ^{−j}(1 + T)) − 1` is divisible by `(γ^{−j}(1 + T))^{p^{m−1}} − 1`; the zeros of `log⁺_{p,j}` are exactly the
`γ^jζ − 1` with `ζ` of order `p^{2n}`, those of `log⁻_{p,j}` with `ζ` of order `p^{2n−1} (n ≥ 1)`, all simple ([Pollack SS]
§4.1, Lemma 4.1 and its proof, pp. 536–537), because `log_p(u) = (u − 1)·lim_n∏_{m≤n}Φ_m(u)/p` has simple zeros exactly
at the `p`-power roots of unity. With `u = γ^{−j}(1 + T), p²(u − 1)log⁺_{p,j}(T)log⁻_{p,j}(T) = log_p(u)`; at `u = 1` the
quotient `log_p(u)/(u − 1)` has value 1 and each half-logarithm has value `1/p`. The weight-`k` products have
logarithmic growth `(k + 1)/2`: for `r` close to 1 their radial Gauss norms are bounded above and below by
constant multiples of the radial norm of `log_p(1 + T)^{(k+1)/2}` ([Pollack SS] §4.2, Lemma 4.5, p. 538; the bound
uses cyclotomic Gauss norms with degree `p^{n−1}(p − 1)`). For a primitive `p^n`-th root of unity `ζ, log⁺_p(ζ − 1)`
vanishes for even `n` and equals `p^{−(n+1)/2}∏_{j=1}^{(n−1)/2}Φ_{2j}(ζ)` for odd `n`, while `log⁻_p(ζ − 1)` vanishes for
odd `n` and equals `p^{−n/2−1}∏_{j=1}^{n/2}Φ_{2j−1}(ζ)` for even `n` (here for `k = 0`; [Pollack SS] §4.4, Lemma 4.7,
p. 539), because `Φ_m(ζ_{p^n}) = p` for `m > n`. For `k = 0`, inversion `T ↦ (1 + T)⁻¹ − 1` multiplies `log⁺_p` by the unit
`(1 + T)^{p/(p+1)}` and `log⁻_p` by `(1 + T)^{1/(p+1)}`, interpreted as convergent binomial series: use
`Φ_m(u⁻¹) = u^{−p^{m−1}(p−1)}Φ_m(u)`, and the sums of the even and of the odd cyclotomic degrees converge p-adically to
`−p/(p + 1)` and `−1/(p + 1)`. This corrects [Pollack SS] §4.3, Lemma 4.6, p. 538, which asserts invariance; the
correction is [Sprung] §4, Proposition 4.25 and Lemma 4.26, pp. 907–908 (Sprung records an extra first
factor at `p = 2` in his convention; `1/3` is integral in `ℤ₂`). API: `halfLogPlus`, `halfLogMinus` (the
factors and the weight-`k` products), `halfLogPlus_zeros` and `halfLogMinus_zeros` (the zero sets),
`halfLog_zeros_simple` (the derivative is nonzero at every zero), `halfLog_mul` (the product formula
above), `halfLog_growth` (coefficients of order at most `(k + 1)/2`) and `halfLog_growth_exact` (the two-sided
radial comparison used for division), `halfLog_inv` (the inversion formula with its unit factors).
*Needs:* §2.5 (The p-adic L-function); Mathlib `PowerSeries.binomialSeries`, `Polynomial.cyclotomic`;
LocallyAnalyticDistributions Layer 1 (series on the open disc). The cyclotomic factors are supplied directly by Mathlib
`Polynomial.cyclotomic`, `Polynomial.cyclotomic_prime_pow_eq_geom_sum` and
`Polynomial.eval_one_cyclotomic_prime_pow`.

**Checks.**

- `k = 0`: `p²·T·log⁺_p·log⁻_p = log_p(1 + T)`.
- `k = 0` and `n = 1`: `log⁻_p(ζ_p − 1) = 0` and `log⁺_p(ζ_p − 1) = p⁻¹`; the leading factor `1/p` is what produces `p^{−(n+1)/2}`.
- `k = 0`: inversion multiplies `log⁺` by `(1 + T)^{p/(p+1)}` and `log⁻` by `(1 + T)^{1/(p+1)}`, including `p = 2`.
- `k = 0`: both constant coefficients are `1/p`, and the linear coefficients are `−1/(2(p + 1))` for `log⁺` and
  `−1/(2p(p + 1))` for `log⁻` (their sum `−1/(2p)` matches the coefficient `−1/2` of `T²` in `log(1 + T)` after the
  factor `p²T`); invariance under inversion would force these nonzero coefficients to vanish.
- `log^±_p` has infinitely many zeros, so it is not a bounded power series, that is, not in `ℤ_p⟦T⟧ ⊗ ℚ_p`.

**Pollack's `±` decomposition of the supersingular p-adic L-function** (theorem). Let `p ∤ NM` with `a_p = 0, α` a
root of `X² + ε(p)p^{k+1}` and `ψ` with primitive `M`-component as in §4.1. If `p` is odd, `L_p(f, α, ψ, T) = L⁺_p(f, ψ, T)·log⁺_p(T) + L⁻_p(f, ψ, T)·log⁻_p(T)·α` with
`L^±_p(f, ψ, T) ∈ Λ_ψ ⊗ K_ψ, Λ_ψ = 𝒪_ψ⟦T⟧`; they have bounded coefficients, and each nonzero one has finitely many
zeros (a zero component is allowed and has no finite-zero conclusion). If `p = 2`,
`L₂(f, α, ψ, T) = L⁺₂·log⁻₂ + L⁻₂·log⁺₂·α` with `L^±₂ ∈ Λ_ψ ⊗ K_ψ` ([Pollack SS] §5.1, Theorem 5.1, p. 540). For an
elliptic curve `E/ℚ` with `a_p = 0` and the periods `Ω^±_E, L^±_p(E, T) ∈ ℤ_p⟦T⟧` for odd `p`; for `p = 2`,
`L₂(E, α, T) = L⁺₂(E, T)·log⁻₂(T) + L⁻₂(E, T)·(1/2)log⁺₂(T)·α` with `L^±₂(E, T) ∈ ℤ₂⟦T⟧`, the factor `1/2` being needed for
integrality ([Pollack SS] §5.2.2, Theorem 5.6, p. 542, and Remark 5.7, p. 543; the integrality uses that the
Manin constant of `E` is prime to a good supersingular `p`, Remark 5.5, so `2[a/p^n]^± ∈ ℤ_p`). Proof: `G^±_ψ` vanish
at every zero of `log^±_p`, at `γ^jζ − 1` for `0 ≤ j ≤ k`, by the interpolation property, so `log^±_p` divides `G^±_ψ` in the
algebra of functions analytic on the open disc (divisibility in the formal power-series ring would say
nothing, since `log^±_p` has nonzero constant term); `G^±_ψ` is `O(log_p(1 + T)^{(k+1)/2})` and `log^±_p` is of exactly that
growth, so the quotients are `O(1)`, and a bounded analytic function on the open disc has bounded
coefficients ([Pollack SS] Lemma 5.2); for `E`, approximate by the Riemann sums of §2.5 and count the powers of `p`
in the denominators ([Pollack SS] Lemma 5.9). Supersingular `p` with `a_p ≠ 0 (p = 2, 3)` is not covered.
*Needs:* §4.2 (Pollack's half-logarithms; Both refinements at a good supersingular prime); §4.1 (p-adic
L-functions with a tame twist); PadicMeasuresIwasawaAlgebras (Iwasawa functions and their `μ`- and
`λ`-invariants).

**Checks.**

- For `k = 0, M = 1` and odd `p`, half the sum and half the difference of the two refined functions
  divide by `log⁺_p` and `α·log⁻_p`, respectively, to give the bounded signed components.
- At `p = 2` the decomposition pairs `L⁺₂` with `log⁻₂` and `L⁻₂` with `α·log⁺₂`;
  with elliptic-curve integral normalisation the latter factor is `(α/2)·log⁺₂`.
- A zero signed component remains zero and has infinitely many zeros; the finite-zero
  conclusion applies only to a nonzero bounded component.

### 4.3 Coefficient embeddings and Euler depletion

**Coefficient embeddings and conjugate period coordinates** (theorem). For a normalised newform `f` of weight
`k + 2`, let `E` contain its coefficients and character values and `σ : E → E′` a field embedding. The
coefficient transport on polynomial-valued symbols carries each signed `f`-eigenline to the signed
`f^σ`-eigenline (`f^σ` from ModularForms Layer 8G). For each primitive `χ` choose an
extension `σ̃ : E(χ) → E′(χ^σ)`, where `χ^σ(a) = σ̃(χ(a))`. For the transported basis `φ^σ`,
`σ̃(½T_{j,χ}(φ)) = ½T_{j,χ^σ}(φ^σ)`. These are the algebraic normalised critical coordinates of §1.2.
Transporting a Gauss sum as a separate factor also requires an extension on the conductor
roots of unity. For p-adic constructions choose compatible extensions on the character values,
the refinement and those roots of unity, and transported p-adic places: an isometric extension `σ_p`
carries a refinement `α` to `σ_p(α)`, preserves its slope, and transports its normalised eigenlift and its
p-adic L-function coefficientwise. For small slope the equality follows from the control theorem or
interpolation uniqueness; for critical slope, assuming odd `p ∤ N` and distinct Hecke roots as in Layer 3,
from the chosen eigenlift or the family comparison of §3.3,
not from interpolation alone. No transport of transcendental complex periods is asserted: unrelated
choices of complex periods change the result by a nonzero coefficient-field scalar `σ(b)`, and conjugating to
a different p-adic place can change ordinarity ([BMS] §2.1, Theorem 2.2(iii) and the discussion of the period ambiguity,
pp. 5–7, for weight two over totally real coefficient fields; [PS] Theorem 5.12, pp. 25–26, and
Proposition 6.3, pp. 28–29). The identity isomorphism acts trivially on each signed algebraic eigenline.
*Needs:* §0.5 (Modular symbols commute with flat base change); §1.1 (Period lines); §1.2 (Algebraicity of
critical values); §2.4 (Stevens' control theorem); §3.3 (Comparing critical and arithmetic L-functions
through families); ModularForms Layer 8G.

**Checks.**

- For the level-11 form `E = ℚ, σ = id` and a cubic character modulo 7,
  `E(χ) = ℚ(ζ₃)` has two extensions of `σ`; one fixes `χ` and the other exchanges
  `χ` with `χ⁻¹`. The coefficient embedding alone does not choose the twist.
- For `χ = 1` the algebraic coordinate needs no character-field extension, and
  the identity embedding fixes it.
- Composing two compatible extensions transports the algebraic coordinates by
  their composite; transporting a Gauss sum separately also tracks `ζ_m`.
- At `p = 2` for the level-11 form, the roots `−1 ± i` have slope `1/2 < 1`, so their
  coefficient transport uses small-slope control. The critical-slope family comparison
  requires odd `p`.

**Euler depletion and primitive/imprimitive comparison** (construction). Let `f` be a normalised newform of
weight `k + 2` and level `N` with a nonzero refinement at `p, ℓ ≠ p` a prime and `V_ℓf(z) = f(ℓz)`. If `ℓ ∤ N` put
`f^[ℓ] = f − a_ℓV_ℓf + ε(ℓ)ℓ^{k+1}V_{ℓ²}f` at level `Nℓ²`; if `ℓ | N` put `f^[ℓ] = f − a_ℓV_ℓf` at level `Nℓ`. Its coefficients are `a_n(f)`
for `ℓ ∤ n` and 0 for `ℓ | n` (from the coefficient formula of `levelRaise` and the good or bad recurrence,
with `ε(ℓ) = 0` and `a_{ℓn} = a_ℓa_n` at `ℓ | N`). On distributions define `[u]μ(g) = μ(z ↦ g(uz))` for `u ∈ ℤ_p^×`, and the
deletion operator `E_ℓμ = μ − (a_ℓ/ℓ)[ℓ⁻¹]μ + ε(ℓ)ℓ^{k−1}[ℓ⁻²]μ`, omitting the quadratic term at a bad prime. Since
`[u]` acts on `χ(z)z^j` by `χ(u)u^j, E_ℓ` evaluated at `χ(z)z^j` multiplies by `1 − a_ℓχ(ℓ)⁻¹ℓ^{−j−1} + ε(ℓ)χ(ℓ)⁻²ℓ^{k−2j−1}`
(respectively `1 − a_ℓχ(ℓ)⁻¹ℓ^{−j−1}`), exactly the `ℓ`-Euler factor of `L(fχ⁻¹, s)` at `s = j + 1`. For slope `< k + 1` and
compatible signed symbol bases, `L_p(f^[ℓ], α) = E_ℓL_p(f, α)`: `U_p` commutes with `V_ℓ`, the normalised values
match, and small-slope uniqueness concludes. The depleted form is an eigenform for `U_p` and the primes
away from `Npℓ` but need not be a newform; its period coordinate is transported from `f`. At critical slope,
assume odd `p ∤ N` and distinct Hecke roots as in Layer 3; the equality needs compatible eigenlifts or
the family comparison. Depletion at several primes is the
product of the commuting `E_ℓ` ([PS] §6.2–6.3, formula `(2)` and Proposition 6.3, pp. 27–29; the depletion
identity is derived here from the q-expansion recurrences). API: `eulerDepletion` (the depleted cusp
form, at its raised level), `eulerDepletion_coeff` (coefficient `n` is `a_n` if `ℓ ∤ n` and 0 otherwise),
`scaleDistribution` `([u]μ)`, `eulerDeletion` `(E_ℓ)`, `eulerDeletion_eval` (evaluation at `χ(z)z^j` is
multiplication by the Euler factor), `eulerDeletion_comm` (operators for distinct `ℓ ≠ p` commute),
`padicLFunction_depletion` `(L_p(f^[ℓ], α) = E_ℓL_p(f, α))`. *Needs:* §1.2 (The twisted Mellin formula); §2.5
(Interpolation and uniqueness); §3.3 (Comparing critical and arithmetic L-functions through families);
Tau Ceti `TauCeti.CuspForm.levelRaise`, `TauCeti.CuspForm.qExpansion_levelRaise`, the two coefficient
criteria for Hecke eigenvalues; ModularForms Layer 4. *Lean:* `depletedCoeff`, `depletedCoeff_eq`,
`eulerDeletionFactor`.

**Checks.**

- `k = 0, χ = 1, ℓ ∤ N`: `E_ℓ` evaluates as `1 − a_ℓ/ℓ + ε(ℓ)/ℓ`.
- `k = 0, ℓ | N`: the factor is `1 − a_ℓ/ℓ`, with no quadratic term.
- For the scalar helper with `a_ℓ = 3, χℓ = 2` and `ℓ = k = 2, εℓ = 1` and `j = 1`
  give `3/4`, while `j = 2` gives `27/32`; `εℓ = 0` and `j = 0` give `1/4`.
  These values distinguish inverse twisting, the critical exponent and the bad-prime omission.
- The coefficients of `f^[ℓ]` at `ℓ` and at `ℓ²` are 0, while the coefficient at 1 is still 1.
- Depleting twice at the same prime changes nothing:
  `depletedCoeff (depletedCoeff a ℓ) ℓ = depletedCoeff a ℓ`.
- At every `n = ℓm`, the good-prime recurrence gives
  `a_{ℓm} − a_ℓa_m + ε(ℓ)ℓ^{k+1}a_{m/ℓ} = 0`, with `a_{m/ℓ} = 0` when `ℓ ∤ m`, as in
  `depletedCoeff_eq`. For the level-11 form at `ℓ = 3 ≠ p`, `a₃ = −1, a₉ = −2, a₂₇ = 5`, so at `n = ℓ³`
  all three terms are nonzero and cancel: `5 − 2 − 3 = 0`.
- The scaling `[u]` requires `u ∈ ℤ_p^×`, so `ℓ = p` is excluded: `[p⁻¹]` is not defined on distributions on `ℤ_p^×`.

### 4.4 Examples of level 11

**Weight-two examples at level 11** (application). With Pollack's level-11 generators and period
normalisation, verify the modular-symbol values `(1/5, −3/2, 1/2)` of the newform and the Eisenstein values
`(1, 0, 0)`. At `p = 11` the cuspidal `U₁₁`-eigenvalue is `a₁₁ = 1` (split multiplicative reduction), so the `n = 0`
interpolation factor `1 − 1/α` vanishes and `L₁₁(f, 0) = 0`, the trivial zero. Select the
trivial torsion-character branch `ψ = 1`, choose `γ = 12` and put `T = κ(12) − 1`. In the stated
period normalisation its integral power series has constant coefficient zero and a unit
linear coefficient, hence `μ = 0` and `λ = 1`. Other branches have their own invariants. Verify
separately the Dirac value at 0 of the Eisenstein lift and its consequent zero restriction to `ℤ₁₁^×`. The ordinary eigensymbol is the unique `U₁₁`-fixed lift with the stated
classical specialisation ([Pollack AWS] §6, pp. 27–28). *Needs:* §2.5 (The p-adic L-function; Interpolation and uniqueness; Ordinary p-adic
L-functions as integral measures); §0.2 (A modular symbol is determined by its values on the
fundamental-domain generators).

**Checks.**

- On `ψ = 1, γ = 12`, the constant is exactly zero and the linear coefficient
  is a unit. Pollack's opposite-divisor series has linear coefficient
  `1490719231 ≡ 1` mod 11; Convention 12 negates it. Both give `μ = 0` and `λ = 1`.
- In the same normalisation the residue masses modulo 11 are
  `(0,10,4,5,1,1,7,6,10,0)`. The `ω²`-branch constant is
  `Σ_{a=1}^{10} a²μ(a + 11ℤ₁₁) = 5` mod 11, so its `λ` is zero.
- The Eisenstein lift is supported at 0 and restricts to zero on `ℤ₁₁^×`;
  it does not supply the nonzero cuspidal branch.

**Supersingular examples at level 11** (application). Let `f` be the newform of `X₀(11), q∏_{n≥1}(1 − q^n)²(1 − q^{11n})²`
`(k = 0)`. (i) At `p = 2, a₂ = −2`, so 2 is supersingular; the roots `−1 ± i` of `X² + 2X + 2` have 2-adic valuation
`1/2 < 1`, so both refinements are small slope; `α₁/α₂ = −i` is a primitive fourth root of unity, so at least one
of `L₂(f, α_i, T)` has infinitely many zeros, while the `±` decomposition does not apply since `a₂ ≠ 0`.
(ii) At `p = 19` and `p = 29, a₁₉ = a₂₉ = 0`; the roots `±√−19` of `X² + 19` have slope `1/2` and do not lie in `ℚ₁₉`
(`v₁₉(−19) = 1` is odd), so both `L₁₉(f, α_i, T)` have infinitely many zeros, and
`L₁₉(E, α, T) = L⁺₁₉·log⁺₁₉ + L⁻₁₉·log⁻₁₉·α` with `L^±₁₉ ∈ ℤ₁₉⟦T⟧`, with the distribution relation of §2.5 fixing its values on residue classes. (iii) For quadratic twists of `32A` at `p = 3`, where `a₃ = 0`, Pollack's Table 1 records
`λ_Ш^±, λ_MW^±` and the indicated roots. Compare the total analytic invariant
`λ^± = λ_Ш^± + λ_MW^±` with the corresponding signed series; the table has no `μ` column ([Pollack SS] §7, Table 1, pp. 555–556; for (i) and (ii), §3, Corollary 3.6, p. 535, and §5.2.1,
Remark 5.4, p. 542). The coefficients `a₂ = −2, a₁₉ = a₂₉ = 0` are read off the product formula. A sharp/flat decomposition at `a_p ≠ 0` is not part of this
roadmap. *Needs:* §4.2 (all three targets); §4.4 (Weight-two examples at level 11).

**Checks.**

- At `p = 2, a₂ = −2`, so the `a_p = 0` signed decomposition does not apply.
- At `p = 19, √−19` is not in the base field `ℚ₁₉` and the two-root
  non-rationality criterion applies before adjoining the roots.
- For `D = 13` in Table 1 at `p = 3`, the plus entries give total `λ⁺ = 2 + 1 = 3`
  and the minus entries total `λ⁻ = 0 + 1 = 1`. No `μ`-value is a table entry.

### Examples

At `p = 3` for the newform of level 11 and `j = 0`, the two Euler factors give `(1 − 1/α)², α` the unit root of
`X² + X + 3`. At `ν = 0` both Euler factors appear in the tame-twist formula, and at `ν ≥ 1` only the prefactor
`α^{−ν}`. For `k = 0` the half-logarithms satisfy `p²·T·log⁺_p·log⁻_p = log_p(1 + T)` and have constant terms `1/p`.

### Dependencies

Layers 1–3; PadicMeasuresIwasawaAlgebras; LocallyAnalyticDistributions Layer 1; ModularForms Layers 4
and 8G; Mathlib `PowerSeries.binomialSeries`, `Polynomial.cyclotomic`; Tau Ceti `levelRaise` and the
Hecke coefficient criteria.

## Worked examples

The weight-two newform `f` of level 11, `q∏(1 − q^n)²(1 − q^{11n})²`, runs through every layer: `Symb_{Γ₀(11)}(ℤ)` has
rank 3 and `T₂, T₃` have characteristic polynomials `(x − 3)(x + 2)²` and `(x − 4)(x + 1)²` (§0.3); the boundary
sequence for `V = ℚ` is `0 → ℚ → ℚ² → ℚ³ → ℚ³ → ℚ²` (§0.4); `ψ_f({0} − {∞}) = L(f, 1) = 0.25384… = Ω_E^+/5` (§0.7, §1.2); at
`p = 3` its two refinements have slopes 0 and 1 (§2.1), the ordinary one gives an integral measure in
`ℤ₃⟦ℤ₃^×⟧` with `L_p(1) = (1 − 1/α)²L(f, 1)/Ω⁺` (§2.5), and the critical one is non-`θ`-critical
(§3.4); at `p = 11` the trivial branch `ψ = 1, γ = 12` has the trivial zero and `μ = 0, λ = 1` (§4.4); at `p = 2`, 19 and 29 it is supersingular (§4.4). The CM form
of level 32 at `p = 5` is the `θ`-critical example (§3.2, §3.4).

## Source corrections

The formulas use the following sign, radius and cusp-count conventions at the indicated source locators.

- [PS] Theorem 2.6 and Corollary 2.7 (p. 12), Theorem 2.9 and Corollary 2.10 (pp. 13–14): the translation term
  of the boundary relation is `(1 − T⁻¹)D_∞` on the right with `Σ_i(γ_i⁻¹ − 1)D_i + Σ_iD′_i (+ Σ_iD″_i)` on the left, and
  the criterion is `v_∞|Δ = Σ_iv_i|(1 − γ_i) − Σ_iv′_i (− Σ_iv″_i)`; the printed sign contradicts the boundary
  relation on p. 11 (the `Γ₀(2)` example of Layer 0 detects it). The uniqueness statements of Corollaries 2.7
  and 2.10 need `φ(D_∞) = v_∞` among the conditions.
- [PS] §2.4, p. 11: the relation on a one-element-orbit edge is `(γ′_i + 1)e′_i ∈ J`; Corollary 2.10, p. 14: the
  three-torsion condition is `v″_i|(1 + γ″_i + γ″_i²) = 0`, and the values are `φ(D′_i) = v′_i, φ(D″_i) = v″_i`.
- [PS] §6.2, `(1)`, p. 27: with the periods of `(2)`, the interpolation formula carries the sign
  `± = (−1)^jχ(−1)` (equivalently `Ω⁻` is replaced by `−Ω⁻`), and at `n = 0` it needs the factor `1 − p^j/α`; §6.4,
  Proposition 6.5, `(3)`, p. 29: the `L`-value is at `j + 1`, with the same sign and `n = 0` factor; §6.4,
  Definition 6.4, p. 29: the forms are `S_{k+2}(Γ₀, ℚ̄_p)`.
- [PS] §3.3, pp. 16–17, and the proof of Lemma 6.2, p. 27: the weight-`k` action and the contraction hold for
  radii `r < p`.
- [PS] §8.4, footnote (7), p. 36: different splitting fields of specialisations do not imply that a
  Hida algebra is non-free over `Λ`. The algebra `ℤ₃⟦T⟧[x]/(x² − T − 9)` is free with basis `1,x`, while
  its rational fibres at `T = 0` and `T = 3` are `ℚ₃ × ℚ₃` and `ℚ₃(√3)`. This does not decide the
  freeness of the Hida algebra in that example.
- [Bellaïche] §1.4.3, `(5)`, p. 8: the Euler factors of the refinement `f_β` have `β` in the denominators.
- [Pollack SS] §4.3, Lemma 4.6, p. 538: inversion multiplies the half-logarithms by the units
  `(1 + T)^{p/(p+1)}` and `(1 + T)^{1/(p+1)}` rather than fixing them ([Sprung] Lemma 4.26).
- [Wiese] Proposition 4.16 and its proof, pp. 51–52: the cusp term in the dimension of parabolic
  cohomology is `c_k` (all cusps for even `k`, regular cusps only for odd `k`), with the projective index `μ`, and
  the invariants of the order-three element have dimension `(k + 1)μ/3`.

## Downstream consumers

PadicFamilies (signed period lines in families, the weight-`k` distribution modules and the specialisations
of two-variable L-functions; its critical-slope layer uses §2.5 and §§3.0–3.1), KatoEulerSystems (the
critical-slope L-functions, through the family comparison of §3.3), RankZeroOneBSD,
GrossZagierAndArithmeticHeights, EllipticRegulators, EllipticModularityEffectiveComparisons and
AutomorphicCongruences (period-normalised special values and p-adic L-functions of modular forms), and
the Drinfeld–Manin projector of §0.8 for the parabolic zeta morphisms of Nakamura's rank-two universal
deformations.

## References

- [PS] R. Pollack and G. Stevens, *Overconvergent modular symbols and p-adic L-functions*, Ann. Sci. Éc.
  Norm. Supér. (4) 44 (2011), 1–42, doi:10.24033/asens.2139. Open-access PDF:
  https://www.numdam.org/item/10.24033/asens.2139.pdf (printed page = PDF page − 1; locators are printed
  pages).
- [PS critical] R. Pollack and G. Stevens, *Critical slope p-adic L-functions*, J. Lond. Math. Soc.
  87 (2013), 428–452. Author version (locators are to this version):
  https://math.bu.edu/people/ghs/papers/critical_LMS_post_referee_v4.pdf
- [Wiese] G. Wiese, *Computational arithmetic of modular forms*, course notes, arXiv:1809.04645v1 (2018);
  also in I. Inam and E. Büyükaşık (eds.), *Notes from the International Autumn School on Computational
  Number Theory*, Birkhäuser, Cham (2019), pp. 63–170,
  [doi:10.1007/978-3-030-12558-5_2](https://doi.org/10.1007/978-3-030-12558-5_2).
  The theorem and page locators are to arXiv v1.
  https://arxiv.org/pdf/1809.04645v1
- [Pollack AWS] R. Pollack, *Overconvergent modular symbols*, Arizona Winter School 2011 lecture notes.
  https://swc-math.github.io/aws/2011/2011PollackNotes.pdf
- [RJW] J. Rodrigues Jacinto and C. Williams, *An introduction to p-adic L-functions*, arXiv:2309.15692v2
  (2024). https://arxiv.org/pdf/2309.15692v2
- [Bellaïche] J. Bellaïche, *Critical p-adic L-functions*, Invent. Math. 189 (2012), 1–60;
  arXiv:0912.2925v1 (locators are to the arXiv version). https://arxiv.org/pdf/0912.2925v1
- [Pollack SS] R. Pollack, *On the p-adic L-function of a modular form at a supersingular prime*, Duke Math.
  J. 118 (2003), 523–558 (printed pages).
  https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf
- [Sprung] F. Sprung, *On pairs of p-adic L-functions for weight-two modular forms*, Algebra Number Theory 11
  (2017), 885–928. https://msp.org/ant/2017/11-4/ant-v11-n4-p04-s.pdf
- [Nakamura] K. Nakamura, *Zeta morphisms for rank two universal deformations*, Invent. Math. 234 (2023),
  171–290, doi:10.1007/s00222-023-01203-7; arXiv:2006.13647v2 (locators are to the arXiv version).
  https://arxiv.org/pdf/2006.13647v2
- [Elkik] R. Elkik, *Le théorème de Manin–Drinfeld*, Astérisque 183 (1990), 59–67.
  https://www.numdam.org/item/AST_1990__183__59_0.pdf
- [Sharifi] R. Sharifi, *Modular curves and cyclotomic fields*, Arizona Winter School 2018 lecture notes.
  https://swc-math.github.io/aws/2018/2018SharifiNotes.pdf
- [Shokurov] V. V. Shokurov, *Shimura integrals of cusp forms*, Math. USSR Izv. 16 (1981), 603–646.
  https://www.maths.ed.ac.uk/~icheltso/shokurov/pdf/cusp.pdf
- [BMS] J. S. Balakrishnan, J. S. Müller and W. A. Stein, *A p-adic analogue of the conjecture of Birch and
  Swinnerton-Dyer for modular abelian varieties*, Math. Comp. 85 (2016); arXiv:1210.2739 (locators are to
  the arXiv version).
  https://arxiv.org/pdf/1210.2739
