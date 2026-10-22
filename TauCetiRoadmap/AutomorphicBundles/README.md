# Roadmap: automorphic bundles and classical automorphic forms

**Summary.** This roadmap builds the coefficient sheaves of classical automorphic forms on Shimura
varieties and the section spaces they define. From a Shimura datum it uses the shared coefficient
group to construct the associated bundles of its torsors, the canonical principal bundle on the canonical
model, the automorphic vector bundle attached to a representation of the Hodge parabolic, the Betti,
étale and filtered de Rham realizations of full-group representations, the canonical and
subcanonical extensions across a toroidal boundary, and the spaces of classical and cuspidal forms
over their actual fields of definition and over the integral PEL and ramified Hilbert models. It
then equips those spaces with geometric Hecke operators and proves the Fourier–Jacobi expansion
principle with arbitrary coefficient modules. It constructs the ramified splitting-model boundary
and proves the Hilbert q-expansion principle,
including at ramified `p=2`. Logarithmic period comparisons and the dual BGG complex give the
classical Siegel cohomology decompositions; a rational perfectoid Hodge-type tower and its Levi
period torsor give the finite-algebraic classical VB comparison. We want it because every
modularity and Hida/Coleman argument downstream works with these objects: Galois representations are
attached to Hecke eigensystems in coherent cohomology, congruences are proved by reducing
q-expansions modulo primes, and the p-adic comparisons of Boxer–Calegari–Gee–Pilloni start from the
classical coherent sheaves and their Hodge–Tate weights. The modular, Hilbert, Siegel and unitary
examples fix every convention (differentials, determinants, similitude lines, Tate twists and Hecke
normalizations) that those applications depend on.

An automorphic form has a coefficient, a field of definition and a condition at the boundary. This
roadmap constructs these three pieces together. A representation of the entire coefficient group
carries more structure than a representation of the Hodge parabolic: Betti and étale local systems
and a filtered de Rham bundle with an integrable connection. A representation of a Levi or parabolic
alone acquires no flat connection from this construction. Keeping this distinction visible connects the classical coherent
coefficients with their Hodge–Tate comparisons without changing their meaning.

The principal references are Milne for canonical principal bundles and rationality, Deligne for
absolute Hodge tensors, Caraiani–Scholze and Andreatta–Goren–Howard–Madapusi Pera for the Hodge-type
tensor construction, Lan for integral PEL boundary charts, coefficient modules and the expansion
principle, Diamond for ramified Hilbert coefficients and their q-expansions, Scholze,
Pilloni–Stroh and Lan for rational towers, Diao–Lan–Liu–Zhu and Lan–Liu–Zhu for
logarithmic periods and supports, and Faltings–Chai and Boxer–Calegari–Gee–Pilloni
for the classical Siegel comparisons. Source labels refer to the editions
in the references; page numbers follow those editions. `Suggested.lean` states the finite
tensor-stabilizer theorem of B1.1 against the pinned Mathlib and Tau Ceti. The geometric headline
results require the Shimura, boundary and period objects constructed in the layers below; this
README is the specification.

## Scope and ownership

The roadmap owns:

- the representation-factorization adapter for ShimuraData's coefficient group `Gᶜ = G/Z_s`,
  ineffective-stabilizer descent, the comparison of its filtration parabolic with the opposite
  Hodge–Tate coefficient convention, the linear realization of associated coefficients, compact-dual coefficients and their analytic
  and algebraic descents (Layer B0);
- the canonical principal bundle of Hodge and abelian type, through finite tensor stabilizers,
  the defining-tensor specialization of ShimuraVarieties §7.0i, the tensor-preserving de Rham frame torsor, its filtration reduction, the
  special-point normalization and Hecke pullback (Layer B1), and its general-data version through
  connected conjugation and second jets (Layer B1.general);
- the automorphic vector bundle functor, highest-weight conventions, the Betti, étale and filtered
  de Rham realizations of full-group representations and their comparison (Layer B2), with the
  general-data versions (Layer B2.general);
- canonical and subcanonical extensions over toroidal models, their behaviour under fan refinement,
  logarithmic extensions of full-group connections, coherent pushforward to the minimal model,
  rationality, and the integral coefficients on good-prime PEL models (Layer B3), with the
  general-data versions (Layer B3.general);
- the ramified splitting-model compactifications, degeneration coefficient lines, formal cusp
  descent and residue-component detection (Layer B3.Hilbert);
- the smooth-pair specialization of the shared log-adic and Kummer-étale carriers, its additional
  pro-Kummer-étale site and perfectoid basis, canonical coefficient systems, log periods and the ordinary and
  compact-support comparisons (Layer B3.log), and the relative/geometric Siegel dual BGG
  construction with coherent graded pieces and degeneration (Layer B3.BGG);
- the Siegel application of the shared small-Hasse canonical-subgroup package supplied by
  CohomologyComparisons §6.2, the rational Siegel and closed Hodge-type perfectoid toroidal
  towers, their rational Levi period torsor
  and finite-algebraic `VB⁰` descent (Layer B3.HT);
- classical and cuspidal forms, the automorphy-factor adapter to Mathlib's `SlashAction`, the
  analytic comparison, the modular, Hilbert, Siegel and unitary weight conventions, integral forms
  with arbitrary coefficient modules, the ramified Hilbert weight line and the classical VB
  normalization (Layer B4);
- geometric Hecke operators and their convolution law, the expansion principle with arbitrary
  coefficients, vector-valued Fourier–Jacobi expansions, Diamond's ramified Hilbert q-expansions,
  the Hecke action on expansions, and the classical Siegel Hodge–Tate decompositions (Layer B5).

It leaves to other roadmaps:

- **Shimura data and varieties.** The central quotient is ShimuraData §4.9; filtration parabolics,
  their Hodge sign and Levi, compact duals, Borel embeddings, reflex flags and homogeneous
  variations are ShimuraData Layer 3; the analytic tower, minimal compactification, CM reciprocity,
  canonical models, conjugation and canonical towers are ShimuraVarieties Layers 1–8; PEL data and their
  universal families are PELModuli M0, M3, M5; Hilbert data, Deligne–Pappas families, polarization/unit quotients and central kernels are
  HilbertModularVarietiesAndShimuraCurves H0–H4. Its H5.3–H5.4 supply the characteristic-zero
  coefficient lines and their descent; B3.Hilbert constructs the ramified splitting model and cusps.
- **Compactifications (bundle partner).** Fans, cusp labels, toroidal models, refinements, toroidal
  Hecke spans, degeneration families, good-prime PEL models and Hilbert cusp charts are
  ShimuraCompactifications C0–C6, which supplies the finite-level boundary geometry. In particular
  the scalar Fourier–Jacobi expansion of Hodge-line sections — its coefficient modules, independence
  of the cone and of the cone decomposition, invariance under the cusp stabilizer, functoriality in
  the coefficient module and the restriction to a boundary stratum through the constant term — is
  ShimuraCompactifications C5.15 (`HodgeLineFJ`), with coefficients tensored after pushforward.
  B5.1a constructs the coefficient-inside-sheaf expansion used here for arbitrary modules,
  compares the two under coefficient base change, and B5 proves its expansion principle and
  vector extension. The refinement
  invariance of canonical and cuspidal cohomology with arbitrary coefficient modules is
  ShimuraCompactifications C3 (C3.9 `ToroidalRefinement.cohomology_iso`), and Dimitrov's tame Hilbert
  q-expansion principle is ShimuraCompactifications C6 (C6.40 `HilbertModular.qExpansion_injective`); Layer B5
  treats Diamond's prime-to-`p` ramified setting, including `p = 2`, which C6 does not cover. The
  semiample Hodge line, finite generation of its section algebra and the ample positive power on
  the minimal model are C5 (C5.13 `IntegralToroidalModel.hodgeLine_semiample`, C5.14 `IntegralToroidalModel.hodgeSectionAlgebra_fg`,
  C5.17 `IntegralMinimalModel.hodgeLine_ample`); only their coefficient comparisons are used here.
- **Tau Ceti roadmaps.** The analytic theory of elliptic modular forms, including the automorphy
  sheaf on the coarse curve and the dimension formulas, is ModularForms Layer 10C, and its Hecke
  ring and nebentypus action are ModularForms Layer 2; this roadmap compares its `GL₂` coefficients
  with them and does not define a second modular-form carrier or Hecke algebra. Borel–Weil line
  bundles `G_ℂ ×_B ℂ_{−λ}` on full flag manifolds are RepresentationTheory/LieGroups Layer 8; they
  do not replace coefficients for a Hodge parabolic on a reflex compact dual. Schur functors and the
  highest-weight classification of `GLₙ` are RepresentationTheory/ClassicalGroups Layers 2–3. The
  generic finite locally free sheaf, tensor, dual, pullback and determinant APIs are
  AlgebraicVectorBundles Layers L0A–L0C. General affine-group quotients and dynamic parabolic
  representability are ReductiveGroups Layers 3 and 7 (Layer 8 for general bases). The
  Deligne torus and its cocharacter `μ` are ReductiveGroupsPartII RG2.0a.3; level quotients, neat
  levels and Hecke correspondences of adelic groups are AdelicAlgebraicGroups §§4.3–4.5.
- **Other roadmaps.** Geometric modular forms, their q-expansion principle and Katz's integral Hecke
  operators are AlgebraicModularFormsAndSerreWeights R15.1–R15.2, compared here with the uniform
  construction. Coherent analytification and projective GAGA are ComplexComparisonPartII C0 and C2.
  Relative de Rham cohomology of abelian schemes, its Hodge sequence and Gauss–Manin connection are
  AbelianSchemesAndArithmeticModuli A4. Geometric contracted products and twisting are SchemeAndStackFoundations §1.16.
  Torsors, fpqc descent of quasi-coherent sheaves,
  quasi-coherent sheaves on algebraic stacks, coarse moduli spaces and tame stacks are
  SchemeAndStackFoundations Layer 1 and AlgebraicModuliForArithmeticGeometry §§3.1 and 5.3. Formal
  completion along a closed subset is AdicSpacesPartIII F0.
- **Log-adic foundations.** PrismaticCohomologyPartIV §8.60 owns log-adic structures,
  logification, pullback, integral fs charts, the Kummer-étale site and finite-free local systems
  on it. B3.log uses these carriers on smooth pairs and their pulled-back closed strata and
  constructs the additional pro-Kummer-étale site, all-root basis and period comparisons.
- **Later work and neighbouring theories.** Higher integral coherent cohomology and
  Hecke-equivariant perfect complexes belong to AutomorphicBundlesPartII; locally analytic and
  overconvergent weights to OverconvergentAutomorphicForms. The rational Hodge-type tower,
  Levi period torsor and finite-algebraic `VB⁰` used here are B3.HT. Integral Hodge–Tate refinements,
  additional canonical-subgroup regions and general locally analytic VB theory belong to
  HodgeTateAndCanonicalSubgroups and PerfectoidShimuraVarieties. The shared cyclotomic-base
  abelian-family canonical-subgroup package is supplied by CohomologyComparisons §6.2 and
  used in B3.HT.1; PerfectoidShimuraVarieties uses
  the rational tower and algebraic coefficient descent.
  Multiplicativity of Siegel Fourier–Jacobi expansions,
  their comparison with analytic Fourier series beyond rank one, and q-expansions of analytic
  `p`-adic families of Hilbert forms are consumer interfaces, not targets here.

## Conventions

Fix a Shimura datum `(G, X)`, its reflex field `E`, a finite level `K` and a coefficient field
`L ⊇ E` over which the coefficient is defined; `L` need not equal `E`. Choose `L ↪ ℂ` when making an
analytic comparison. The characteristic-zero Hodge/abelian construction and the general-data
construction have separate layers. Every integral assertion names a good-prime PEL base or a
ramified Hilbert model explicitly.

Use ShimuraData §4.9's `Gᶜ = G/Z_s`, where `Z_s` is the largest central `ℚ`-subtorus that is split
over `ℝ` and has no nonzero `ℚ`-split subtorus. When `Z(G)°` splits over a CM field, `Gᶜ` is also
the quotient by Lan's minimal central subtorus giving equal rational and real split ranks;
without that hypothesis these constructions can differ (B0.1). Canonical principal-bundle existence for abelian and general
pure data carries Milne II (2.1), including the CM-split-centre condition; Hodge-type data satisfy
that condition. The associated-coefficient and analytic fibre-descent constructions retain their
stated wider range. Arithmetic
descent checks the action of the ineffective centre and of every finite stabilizer on fibres.
Neatness (AdelicAlgebraicGroups §4.3, `Neat.IsNeatLevel`) does not remove infinite central units. At
a non-neat level use equivariant sheaves on the stack; passage to a coarse space requires its own
fibre-triviality and tameness hypotheses.

Use the cohomological Hodge filtration unless homology is named. With `μ_h(z) = h_ℂ(z, 1)`, the
cocharacter `μ_h` acts on `H^{p,q}` by `z^{−p}`, and `F^a = ⊕_{p ≥ a} H^{p,q}`. The filtration
parabolic is `P_H = P(μ_h⁻¹)` with Levi `M = Z_G(μ_h)`; Boxer–Calegari–Gee–Pilloni use the opposite
`P_HT = P(μ_h)` and left cosets. Here `P(λ)` is the dynamic parabolic of a cocharacter `λ`, the
points `g` for which `λ(t) g λ(t)⁻¹` has a limit as `t → 0` (Tau Ceti
`TauCeti.Cocharacter.parabolic`). The fibre highest weight `λ` and the function character
`−w_{0,M} λ` are different labels. Tate and similitude lines remain explicit throughout.

For a right `P`-torsor `T` use `(t, v) ∼ (tp, ρ(p)⁻¹ v)`, so a section is a function with
`f(tp) = ρ(p)⁻¹ f(t)`. For a left action on `X` use `J(gh, x) = J(g, hx) J(h, x)`. The resulting
slash operator is `(f|g)(x) = J(g, x)⁻¹ f(gx)`, with `f|(gh) = (f|g)|h`. In Lean, `e.trans f`
applies `e` and then `f`. The determinant-negative `GL₂(ℝ)` scalar law is semilinear over `ℂ`; the
linear compatibility test is restricted to `SL₂`.

Write `V(J)` for the automorphic coefficient and `V(J)^can_Σ` for its canonical extension on `S_Σ`.
Put `V(J)^sub_Σ = V(J)^can_Σ ⊗ I_D`, where `D` is the **reduced** boundary. Boundary frames
characterize the canonical extension; its restriction to the open variety alone does not. Minimal
pushforwards are coherent and need not be locally free. A boundary blow-up need not pull back a
subcanonical extension isomorphically.

Over `L` set `M(J, K; L) = H⁰(S_Σ, V(J)^can_Σ)` and `S(J, K; L) = H⁰(S_Σ, V(J)^sub_Σ)`, section
spaces on a proper model. On Lan's good-prime integral model the scalar notation is
`AF(k, M) = Γ(S_Σ, ω_tor^k ⊗_R M)` for `k ≥ 0` and an arbitrary `R`-module `M`. For vector
coefficients use `Ecan(W) = V(W)^can` and `Esub(W) = Ecan(W) ⊗ I_D`.

At a cusp `Φ` retain the character lattice `X_Φ`, its positivity cone, the abelian torsor `C_Φ`, the
invertible character sheaves `Ψ_Φ(ℓ)`, the finite cover of the lower-dimensional moduli stack and
the **full** cusp stabilizer. The boundary determinant line is `L_Φ = det_ℤ(X_Φ) ⊗ ω_A`. The
relative invariant differential on a Tate fibre is `du/u`; `dq/q` lives on the base.

Use `H_g = tr_{p₁} ∘ θ_g ∘ p₂^*` and `T_g = ν(g) H_g`, with `ν` a multiplicative `K`-bi-invariant
character of the admissible monoid into `R^×`. Trace means the finite locally free trace, extended
through the specified toric refinement comparison. For `GL₂` choose `ν(g) = det(g)⁻¹` when comparing
with the analytic normalization. An unramified modular `ℓ`-correspondence has degree `ℓ + 1`, so
`T_ℓ(1) = (ℓ + 1)/ℓ` in weight zero. The numerical specialization requires
`ℓ` prime; hence `ℓ ≠ 0` in `ℚ`, and it defines no correspondence at `ℓ = 0`. Use the transposed correspondence convention of
Boxer–Calegari–Gee–Pilloni, compared with the inverse/right-coset Hecke action of Tau Ceti.

For Hodge–Tate comparisons `ℚ_p(1)` has Hodge–Tate weight `−1` and Sen eigenvalue `+1`.
Boxer–Calegari–Gee–Pilloni §4.5 includes the `μ`-weight twist in the classical `VB⁰` comparison;
§4.8 uses untwisted coherent coefficients and puts the Tate twists into the decomposition. Count
each twist once.

All proposed names lie under `AutomorphicBundles`; names in the text omit that common prefix.
Suggested module homes are `TauCeti/Geometry/Shimura/AutomorphicBundles/`, with `Principal`,
`Coefficients`, `Extensions`, `ClassicalForms`, `FourierJacobi`, `Hecke`, `Hilbert` and
`SiegelComparison` submodules. A functorial map API includes identity and composition laws with the
datum, level, base and coefficient hypotheses held fixed; these laws also test independence of proof
terms.

## Exact supplier contracts

### From Mathlib (pinned)

- Linear coefficients and slash actions: `SlashAction`, `SlashAction.slash_mul`,
  `LinearEquiv.trans`, `LinearEquiv.trans_symm`, `LinearEquiv.symm_apply_eq`,
  `LinearEquiv.automorphismGroup`, `LinearEquiv.applyDistribMulAction`; the scalar `GL₂` conventions
  `UpperHalfPlane.denom_ne_zero`, `UpperHalfPlane.denom_cocycle`, `UpperHalfPlane.denom_cocycle'`,
  `ModularForm.SL_slash_apply`, `ModularForm.slash_action_eq'_iff`, `ModularForm.smul_slash` (the
  last records the determinant-sign semilinearity).
- Analytic modular forms: `ModularForm`, `CuspForm`, `UpperHalfPlane.qExpansion`,
  `ModularForm.qExpansion_injective`, `ModularForm.isCuspForm_iff_coeffZero_eq_zero` (the
  constant-coefficient cusp criterion is the full-level case only), and the unnormalized
  finite-index sums `ModularForm.trace`, `CuspForm.trace`, which are not the geometric trace.
- Scheme modules: `AlgebraicGeometry.Scheme.Modules`, `.presheaf`, `.pushforward`,
  `.pushforward_obj_obj`, `SheafOfModules.sections`, `SheafOfModules.sectionsMap`,
  `AlgebraicGeometry.tilde.isoTop` (evaluation of affine tilde modules).
- Algebra used in the expansion principle: `CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono`
  (no epimorphism hypothesis on the last map),
  `IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`,
  `IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`,
  `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`, `IsHausdorff.of_isLocalRing`,
  `AdicCompletion.of_injective` (finite-stalk separation at a proper ideal),
  `PowerSeries.isUnit_iff_constantCoeff` (the completion obstruction), and for traces
  `Algebra.trace_algebraMap_of_basis`, `Algebra.trace_trace`, `LinearMap.trace_baseChange`.
- Cocharacter inversion: `AddMonoidAlgebra.mapDomainBialgHom` and `LaurentPolynomial.invert`.

### From Tau Ceti (pinned)

- Dynamic subgroups of a cocharacter `l : H →ₐc[R] R[T;T⁻¹]` of an affine group `Spec H`:
  `TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`, `TauCeti.Cocharacter.unipotent`, with
  the Levi decomposition on points (`TauCeti.Cocharacter.limit_mem_levi`,
  `TauCeti.Cocharacter.unipotent_sup_levi`); representability of these subfunctors is not supplied
  at the pins; its general theory belongs to ReductiveGroups Layers 7–8.
- Algebraic-group quotients: `TauCeti.CommHopfAlgCat.centerQuotientFppfSheaf` and the general
  `TauCeti.CommHopfAlgCat.fppfQuotientSheaf` by a normal subgroup, with its torsor square
  `TauCeti.CommHopfAlgCat.isPullback_fppfQuotientTorsor`; representability is supplied by
  ReductiveGroups Layer 3, with ShimuraData §4.9 supplying the particular quotient by `Z_s`.
- Hecke rings: `HeckeCosetModule.instRingHeckeRing`, `HeckeRing.GL2.heckeRingHomCharSpace`,
  `HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime` (analytic nebentypus action at good
  primes), and the sheafified tensor product `AlgebraicGeometry.Scheme.Modules.tensorProduct`.

### From TauCetiRoadmap roadmaps

- **AlgebraicVectorBundles.** L0A (sheaf tensor, internal Hom, pullback and duality), L0B
  (finite locally free sheaves and their finite projective affine models), L0C (exterior,
  symmetric and determinant operations). The new construction in B0.4 is descent of an
  associated coefficient along a group torsor, not a second vector-bundle carrier.
- **ReductiveGroups.** Layer 3 (normal subgroup quotients and their representability), Layer 7
  (parabolics, Levis and the dynamic route). ShimuraData §4.9 supplies the central quotient used
  in B0.1; its §3.7 supplies the filtration parabolic used in B0.3's opposite-coefficient adapter.

- **ModularForms.** Layer 10C (the automorphy sheaf on the coarse curve `X(Γ)`) and Layer 2
  (`heckeRingHomCharSpace` and the arithmetic normalization of `T_n`): the analytic side of B4.10
  and B5.13.
- **RepresentationTheory/ClassicalGroups.** Layer 2 (`schurFunctor`) and Layer 3 (`DominantWeight`,
  the theorem of the highest weight for `GLₙ`): complex Schur coefficients of B4.16 and the
  highest-weight labels of B2.3. The rational, nonsplit and integral forms needed for Levi
  coefficients are additional and are specified in B2.3 and B3.10.
- **ReductiveGroupsPartII.** RG2.0a.3 (*deligne-torus*, the cocharacter `μ : z ↦ (z, 1)`): the
  convention for `μ_h`.
- **AdelicAlgebraicGroups.** §4.3 (`Neat.IsNeatLevel`), §4.5 (*Hecke correspondences*,
  `LevelMaps.hecke`; *Degree of a Hecke correspondence*; *Cartesian squares of level maps*, which
  needs `U′L = U`): the group-theoretic part of the Hecke targets of Layer B5.

### From other roadmaps

| Roadmap and layer | Used for |
|---|---|
| SchemeAndStackFoundations §§1.1, 1.15–1.16, 1.22–1.23, 2.6, 2.18, 4.8–4.9 | torsors and geometric contracted products, fpqc descent, coherent sheaves on stacks, coarse spaces, formal functions and Stein factorization |
| AlgebraicModuliForArithmeticGeometry §3.1 (`fpqcQuasicoherentDescent`), §5.3 (`ArithmeticModuli.tame_finite_flat_descent`, for finite algebras) | fpqc descent of coefficients and tame descent of finite algebras |
| AdicSpacesPartIII F0 (`FormalScheme.completion`, `FormalScheme.completion.map`, completion of coherent sheaves, sections near a closed subset after EGA I (10.8.11)) | formal boundary charts |
| ComplexComparisonPartII C0 (`CoherentAnalytification`, `coherentPullbackOperations`), C2 (`projectiveGeometricDictionaries`) | analytification and projective GAGA |
| AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR`, `AbelianTate`, `exteriorCohomology`) | relative `H¹_dR`, Hodge sequence, Gauss–Manin, Tate modules |
| ShimuraData Layer 3 (*compact-dual*, *filtration-parabolic*, *borel-embedding*, *homogeneous-variation*, *reflex-flag-descent*), §§4.2–4.3, 4.9 | filtration parabolic with its sign and Levi, compact duals, homogeneous variations, additional centre hypotheses and the shared `Z_s`, `Gᶜ` quotient |
| AlgebraicModularFormsAndSerreWeights R15.1 (*Geometric modular forms*, *All-weight analytic comparison*), R15.2 (*The q-expansion principle*, *Integral geometric Hecke operators*, *The equivariant cuspidal sequence*) | the `GL₂` specialization |
| ShimuraVarieties Layers 1–2, 4–8, §8.22 | towers, minimal compactification, CM reciprocity, canonical models, conjugation |
| PELModuli M0, M3, M5 | PEL data, universal families, Siegel and `GU(1,1)` examples |
| HilbertModularVarietiesAndShimuraCurves H0–H4 | Hilbert data, Deligne–Pappas families, polarization/unit quotients and central kernels; H5.3 `hodgeSplittingDescent` and H5.4 `algebraicWeightsUnits` supply characteristic-zero coefficients and descent |

### From the logarithmic, perfectoid and derived suppliers

| Roadmap and section | Exact input |
|---|---|
| PerfectoidSpaces Layers P0–P4, §§P6.8, P7.11–P7.12, P7.16 | Almost modules, perfectoid root algebras, tilting, almost purity (§§P3.11–P3.13), profinite products, represented tilde-limits and their gluing, and the pro-étale site. These supply the local algebras and sites; B3.log constructs their horizontal logarithmic extensions. |
| PerfectoidTowers §§P8.14, P8.21 | Zariski-closed embeddings and the perfectoid closed-limit construction for compatible closed loci in a tower. B3.HT.6 supplies the strictly compatible Hodge-type toroidal embeddings to which this applies. |
| AdicEtaleGeometry §§A1.2–A1.7, A1.12 | Finite étale chart algebras, stability, étale sites, points and descent, and the pro-étale site. B3.log uses these in the pro-Kummer construction over the shared Kummer-étale site. |
| PrismaticCohomologyPartIV §8.60 | `TauCeti.LogAdic.LogStructure`, `logification`, `logPullback`, `IntegralChart`, `KummerEtaleSite`, and `NoetherianFsLogAdicSpace.kummerSite`, `.kummerTopology`, `.LocalSystem`, `.trivialLogSite`; the shared locally noetherian fs carriers specialized in B3.log.1. |
| AdicSpacesPartII Layer R0; AdicSpacesPartIII Layers F0, R2 | Analytic morphisms and charts; formal completions of locally Noetherian schemes, coherent formal modules and sections near a closed subset; admissible blow-ups and generic fibres. Formal completion uses `FormalScheme.completion` and its map API, compatible with SchemeAndStackFoundations §4.8. |
| PadicHodgeTheory §§0.1, 2.1–2.4, 2.7, 7.1–7.3 | Tate–Sen descent from PadicPeriodRings §§1.1–1.5, 2; completed structure and period sheaves on perfectoids and profinite products; filtered Poincaré and Faltings; finite-coefficient primitive comparison and finiteness; filtered connections, relative de Rham pairs and the relative Hodge–Tate filtration. The proper and smooth hypotheses are retained. B3.log constructs the horizontal-boundary and supported variants. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.19, R07.2.21, R07.6.6 | The rational Hodge–Tate sequence, the `BT₁` Hasse invariant, and `illusieObstructionHomomorphisms` with its co-Lie cone, square-zero lifting criterion and functoriality. CohomologyComparisons §6.2 supplies the shared cyclotomic-base abelian-family small-Hasse subgroup and quotient package; B3.HT.1 applies it to Siegel families. |
| DerivedModuleAlgebra §§0.4, 0.8 | The full cotangent complex and transitivity triangle used by the co-Lie obstruction argument. |
| DerivedDeRhamCohomology §§1.14–1.22 | Filtered derived categories, filtered completion, completed tensors, and the stated valid exchanges with derived operations. This is the filtered categorical infrastructure of B3.log and B3.BGG. |
| EnhancedDerivedSheaves §§0.1–0.4, E1.1–E1.4, E1.8, E2:towers.1, E3.1–E3.4 | Enhanced ringed-site operations, extension by zero, quasi-coherent descent, derived inverse limits, coherent diagrams and colimits. Limits are taken in the enhancement. |
| ClassicalAdicEtaleCohomology §8.2 | Proper algebraic/analytic finite-coefficient comparison on the normalized finite covers in B3.log, before derived inverse limits and rationalization. |
| AdicCoefficientsAndComparisons Layer L0 | Integral coefficient systems, rationalization and completed coefficient operations. |
| EtaleCohomologyFoundations §§0.7, F.2.3, F.5; EtaleDualityAndPerverseSheaves §§0.1–0.6, 2.2 | Localization and proper supports, the exceptional adjoint, finite-coefficient traces and duality, and the compatible recollement. B3.log.5 constructs the supported logarithmic period comparison and its compatibility with these maps. |
| CohomologyComparisons §§6.1–6.2 | §6.1 supplies the one-boundary-variable modular-curve logarithmic period calculation, used as the compatibility specialization of B3.log, with no higher-dimensional logarithmic site. §6.2 supplies `smallHasseCanonicalSubgroups` for abelian families of arbitrary dimension, with weak/strong bounds, uniqueness, the point criterion, base change, functoriality, strong quotient identities and polarization compatibility, used by B3.HT.1. |
| RepresentationTheory/LieHighestWeight Layers 2–7 | Highest weights, PBW and universal enveloping algebras, Verma modules and central characters. ArithmeticLocallySymmetricSpaces ALS.F.5 and ALS.4.5 supply the Chevalley–Eilenberg complex and `LocallySymmetric.kostant_splittingField`; B3.BGG specializes its weights and constructs the relative resolution. |

- **ShimuraVarieties §7.0i** (`TauCeti.Shimura.abelian_absolute_hodge`) supplies Deligne's
  theorem and its horizontal abelian-family form, with Betti, de Rham, étale and Tate transport.
  B1.2 applies it to the defining tensor family; B1.3 adds canonical-reflex-field descent.
- **AlgebraicModularFormsAndSerreWeights R15.1**, *Integral elliptic logarithmic de Rham
  extension*, supplies the integral rank-two elliptic bundle, Hodge sequence, connection and
  Tate lattice. B3.7 compares its elliptic specialization with this input.

### From the bundle partner ShimuraCompactifications

The geometric inputs are C0.15 `ArithmeticFan.exists_smoothProjective_refinement` with its
invariant integral piecewise-linear polarization, C0.8 `TauCeti.Toric.Relative.torusEmbedding`, C0.11
`TauCeti.Toric.Relative.stratumQuotientIso`, C0.9 `TauCeti.Toric.Relative.faceOpenImmersion`;
C1.4 `CuspLabel`, C1.5 `CuspLabel.arithmeticStabilizer`; C2.3 `ToroidalSpace`, C2.6
`ToroidalSpace.smooth_normalCrossings`, C2.7 `ToroidalSpace.algebraization`, C2.8
`ToroidalSpace.toMinimal`, C2.general.1 `ToroidalCanonicalModel.general`; C3.1
`ToroidalRefinement`, C3.3 `ToroidalHeckeSpan`, C3.4 `ToroidalRefinement.choice_comparison`,
C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`, C3.9 `ToroidalRefinement.cohomology_iso`,
C3.general.1 `ToroidalCanonicalModel.general_functorial`; C4.1 `SemiAbelianScheme`, C4.7
`UniversalDegeneration`, C4.12 `MumfordDegeneration.tate_compare`; C5.3 `IntegralToroidalModel`,
C5.4 `IntegralToroidalModel.formalCompletion`, C5.10
`IntegralToroidalModel.strata_detect_geometricComponents`, C5.11
`IntegralToroidalModel.nonneat_descent`, C5.12 `IntegralToroidalModel.logKodairaSpencer`,
C5.13 `IntegralToroidalModel.hodgeLine_semiample`, C5.14
`IntegralToroidalModel.hodgeSectionAlgebra_fg`, C5.17 `IntegralMinimalModel.hodgeLine_ample`;
C6.13 `HilbertCusp.Data`, C6.21 `HilbertModular.toroidal_exists`, C6.23
`HilbertModular.boundary_formal`, C6.36 `HilbertModular.minimal_formal`, and C6.40
`HilbertModular.qExpansion_injective`, on C6's stated tame-level range.

C5.21 `IntegralToroidalModel.formallyCanonical` supplies the geometric criterion;
B3.10 proves it for its additional general Levi coefficients. C3.9 applies to every
finite-rank locally free `E` with `E′=f^*E`; over its field or Dedekind good base it
also allows arbitrary coefficient modules. B3.5 identifies the canonical extensions
with this pullback when C3.9 is applied here. Formal canonicity is the separate
C5.21 boundary property verified in B3.10.
C3.general.1 supplies descended geometric maps; B3.general.1a supplies their
mixed-boundary coefficient comparison.

C5.15 `HodgeLineFJ` places `M` after `p_*Ψ_Φ(ℓ)` on the lower boundary base.
B5.1a `ScalarFourierJacobi.expansion` instead constructs the degree module
`Γ(C_Φ, Ψ_Φ(ℓ) ⊗ L_Φ^k ⊗_R M)` directly on the abelian torsor. Its comparison
with C5.15 requires a proved coefficient base-change isomorphism; no such
isomorphism for nonflat `M` is assumed from C5.15.

### Boundary and comparison suppliers used by the end theorems

| End targets | Construction in this roadmap | Lower-tier or bundle input |
|---|---|---|
| B4.15, B5.16–B5.19 (ramified Hilbert) | B3.Hilbert.0–4: open splitting model, cusp classification, ordinary gluing, coefficient lines, completed descent and fibrewise cusp detection | HilbertModularVarietiesAndShimuraCurves H1–H3; ShimuraCompactifications C0–C5's generic toric and degeneration machinery |
| B4.21, B5.20 | B3.HT.1–8: rational tower, period Levi torsor and finite-algebraic function/coefficient descent | CohomologyComparisons §6.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/R07.2/R07.6; PerfectoidSpaces; PadicHodgeTheory §§2.1–2.4, 7.1–7.3; the partner's finite-level models |
| B5.21 | B3.log.1–4 and B3.BGG.1–3: local system, ordinary log comparison, relative and geometric dual BGG, degeneration | lower-tier étale, local period, filtered-derived, LieHighestWeight and log Kodaira–Spencer inputs |
| B5.22 | B3.log.5 and B3.BGG.2–3: supported period kernels, compact comparison, `−D` dual BGG and duality | EtaleDualityAndPerverseSheaves §§0.1–0.6, 2.2 and the preceding local/ordinary constructions |

B3.log extends the smooth pro-étale period theory to horizontal boundary
charts of arbitrary dimension; the modular-curve specialization in
CohomologyComparisons §6.1 supplies the compatible one-variable calculation.
It does not supply the higher-dimensional site or support construction.
B3.BGG specializes ArithmeticLocallySymmetricSpaces ALS.4.5
and adds the relative-resolution calculation beyond LieHighestWeight's Verma/PBW theory. B3.HT uses only the rational
local period theory from lower roadmaps and these horizontal local results.
The finite-level cohomology decompositions use no completed-cohomology or
perfectoid-tower theorem. The construction order within B3.HT reads the
independent `qcqsSectionsColimit` (B4.19) and finite locally free trace
(B5.1) before their uses; neither depends on any comparison target.

## How to read the build

`README.md` is normative; `Suggested.lean` states headline theorems whose objects exist in the
pinned Mathlib and Tau Ceti or admit short definitions on their native carriers. It contains
`finiteTensorStabilizer` (B1.1), with `mixedTensorBaseChange` and `mixedTensorAction` to express its
mixed tensors over coefficient algebras. Its module docstring identifies the missing objects for
the geometric headline statements. Every target ends with a *Lean:* line naming its declarations
in that file, or reading *Lean:* none when it is specified here only. API names and Check labels
specify the intended library and its mathematical tests; they do not require Lean declarations in
that file. In *Needs* clauses `B3.2` is a subsection of this roadmap and a name in backticks names
the supplied or proposed declaration. Compactification inputs name the specified subsection and
declaration of ShimuraCompactifications. The layers are built in order: B0 fixes the coefficient group and associated bundles;
B1 builds the canonical principal bundle of Hodge and abelian type, B1.general that of general data;
B2 and B2.general associate vector bundles and realizations to representations; B3 and B3.general
extend them across the toroidal boundary. B3.Hilbert constructs the ramified cusp coefficients;
B3.log and B3.BGG construct the finite-level log/BGG comparisons; B3.HT constructs the rational
period tower and algebraic descent. B4 defines classical and cuspidal forms and fixes the
explicit weight conventions; B5 equips them with Hecke operators, expansions and the Siegel
Hodge–Tate comparison.

## Layer B0: coefficients, associated bundles and descent

This layer uses the shared coefficient group and filtration parabolic, fixes their coefficient
adapters and constructs algebraic and analytic descent. Associated bundles of torsors are constructed once, by fpqc descent (B0.4),
and every later coefficient is an instance. The compact dual, its reflex flag and Borel embedding
come from ShimuraData Layer 3 and the analytic tower from ShimuraVarieties Layer 1. The central and
coefficient-field checks belong to the construction, before any weight is chosen.

### B0.1 The coefficient quotient Gᶜ

Construct `centralSplitQuotient`, the representation-factorization adapter for the algebraic
quotient `Gᶜ = G/Z_s` supplied by ShimuraData §4.9. Use that same quotient morphism and kernel,
where `Z_s` is the largest central `ℚ`-subtorus that splits over `ℝ` and has no nonzero `ℚ`-split
subtorus. When `Z(G)°` splits over a CM field, prove that this is Lan's minimal central subtorus
whose quotient has equal `ℚ`- and `ℝ`-split ranks. On the rational character module, complex
conjugation is then central in the splitting Galois group. Its positive eigenspace is Galois-stable;
after separating the trivial rational summands, its remaining part gives precisely the real-split,
rational-anisotropic torus. This comparison uses the CM hypothesis. Algebraic representations
factor through the quotient exactly when `Z_s` acts trivially. For `GL₂` this torus is trivial;
for `Res_{F/ℚ}GL₂` with F totally real of degree d its
dimension is `d−1`. The quotient retains central characters that an adjoint quotient would erase.

*Source:* [Milne90], II (2.1.4) and Remark 2.2(d), p.32, III §1, p.52; III §3, p.58;
[LanIntro], §5.3 Theorem 5.3.1, p.63.

The API:

- `centralSplitQuotient_quotient`: The adapter's morphism is ShimuraData §4.9's algebraic
  epimorphism `q:G→Gᶜ`, with its supplied kernel `Z_s`.
- `centralSplitQuotient_factor`: If `ρ|Z_s=1` there is a unique `ρᶜ` with `ρ=ρᶜ∘q`.
- `centralSplitQuotient_factor_iff`: An algebraic representation factors through q iff `Z_s` acts
  trivially.

*Needs:* ShimuraData §§4.2–4.3, 4.9 (type and centre hypotheses, shared central subtorus,
quotient morphism and kernel);
TauCetiRoadmap.ReductiveGroups Layers 1, 3–4, 6 (representations, quotients, character lattices
of tori, centre and central isogenies).
*Lean:* none; specified in the README only.

**Checks.**

- `centralSplitQuotient_test_gl2` (computation): For `G=GL2/Q`, ranks of its centre over Q and R
  agree, so `Z_s=1` and `Gᶜ=G`.
- `centralSplitQuotient_test_hilbert` (non-example): For `G=Res(F/Q)GL2` with `[F:Q]>1` totally real,
  `Z_s` has dimension `[F:Q]−1`; replacing `Gᶜ` by G without a central condition admits forbidden
  coefficients.
- `centralSplitQuotient_test_trivial` (degenerate): The trivial representation factors through `Gᶜ`
  and stays trivial.
- For `F=ℚ(∛2)` and `T=Res¹_{F/ℚ}G_m` with trivial `h`, the rational character module is the
  irreducible two-dimensional standard `S₃`-module. Thus `Z_s(T)=1`, while
  `T_ℝ≃Res_{ℂ/ℝ}G_m` has real split rank one and rational split rank zero. Lan's rank-removal
  torus is all of `T`. The norm-one unit `∛2−1` has infinite order and survives Milne's quotient;
  fibre-triviality in B0.2 remains a separate condition.

### B0.2 Ineffective stabilizers and coefficient descent

Prove `ineffectiveFibreDescent`. Separate the arithmetic group from its effective action on the
Hermitian domain. Check the action of its ineffective central kernel on every coefficient fibre
before descending the analytic bundle. For a finite tame quotient in characteristic zero, descent of
an equivariant locally free coefficient to the coarse space is equivalent to trivial stabilizer
actions on the fibres. An infinite arithmetic central kernel needs the separate effective-quotient
argument; a neat group can still contain nontrivial central units. Retain the stack coefficient
whenever the fibre-triviality or tame assumption fails. The finite-algebra descent theorem of
AlgebraicModuliForArithmeticGeometry §5.3 is used for finite level covers; the coefficient-sheaf
criterion here is proved on the tame local quotient presentations of
SchemeAndStackFoundations §1.23, with characteristic-zero averaging.

*Source:* [Milne90], III §8, pp.63–64.

*Needs:* B0.1 (`centralSplitQuotient`); AlgebraicModuliForArithmeticGeometry §5.3
`ArithmeticModuli.tame_finite_flat_descent` (finite-algebra descent); SchemeAndStackFoundations Layer 1
(§1.23).
*Lean:* none; specified in the README only.

**Checks.**

- For a Hilbert datum a neat arithmetic subgroup can still contain infinitely many central units; no
  implication `neat⇒trivial` coefficient centre is used.

- For the trivial coefficient every ineffective central element acts trivially, so the effective-quotient descent recovers the structure sheaf.

- At a stack point with stabilizer `μ₂` in characteristic zero, its sign line has no locally free coarse descent; its square has trivial stabilizer character and does descend.

### B0.3 Hodge and opposite parabolic conventions

Construct `hodgeParabolicConvention`. Fix `μ_h(z)=h_ℂ(z,1)` acting by `z^(−p)` on `H^{p,q}`, with
`F^a=⊕_{p≥a}H^{p,q}`. Use ShimuraData §3.7's `filtrationParabolic`, its representation independence,
the supplied identity `P_H=P(μ_h⁻¹)` and Levi `Z_G(μ_h)`, on the compact dual of §§3.8–3.9.
The pointwise adapter uses Tau Ceti `TauCeti.Cocharacter.parabolic`; representability and Levi
theory are ReductiveGroups Layers 7–8. Construct the additional opposite-coset coefficient
comparison with `P_HT=P(μ_h)` and BCGP's left-coset flag. The comparison includes inversion of
left/right cosets and the required dual
coefficient. A sign choice for `μ` alone does not identify the two associated bundles. The
pointwise identities use a commutative Hopf algebra over a commutative ring and evaluate
on commutative algebras; they assert inversion and intersection, not representability or a Hodge
structure on an arbitrary Hopf algebra.

*Source:* [CS], §2.3, pp.669–671; [BCGP], §3.2.13–3.2.16, p.44; §4.8 before Remark 4.8.1, p.101;
[ConradLuminy], Theorem 4.1.7 and its proof, pp.112–113 (the dynamic subgroups `P_G(λ)`,
`Z_G(λ) = P_G(λ) ∩ P_G(−λ)` for an affine group over a ring).

*Needs:* ShimuraData Layer 3 (*filtration-parabolic*, *compact-dual*); Tau Ceti
`TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`, `TauCeti.Cocharacter.unipotent`;
Mathlib `AddMonoidAlgebra.mapDomainBialgHom`; TauCetiRoadmap.ReductiveGroups Layers 7–8;
TauCetiRoadmap.ReductiveGroupsPartII RG2.0a.3
(*deligne-torus*).
*Lean:* none; specified in the README only.

**Checks.**

- For GL2 homology type `(−1,0),(0,−1)`, the stabilizer preserves `F⁰`, whereas the opposite stabilizes
  the complementary line.
- `hodgeParabolic_test_levi` (compatibility): the Levi `Z_G(μ)` is contained in `P(μ⁻¹)`, since a
  cocharacter and its inverse centralize the same points.
- `hodgeTateParabolic_test_levi` (compatibility): the same Levi is contained in `P(μ)`; together
  with `hodgeParabolic_inf_hodgeTateParabolic` this pins the two parabolics as opposite.
- `hodgeParabolic_test_gl2` (computation): for `GL₂` with `μ(z) = diag(z, 1)` acting on
  `H^{−1,0} ⊕ H^{0,−1}`, conjugation by `μ(t)` multiplies the lower-left entry by `t⁻¹`; so `P(μ)`
  is the upper-triangular Borel and `P(μ⁻¹)` the lower-triangular one. A convention that takes
  `P(μ)` as the stabilizer of the Hodge filtration picks the wrong Borel. The nonidentity lower
  shear belongs to `hodgeParabolic` and not `hodgeTateParabolic`; the upper shear has the opposite
  memberships, on Hopf-coordinate `GL₂(ℚ)` points.

### B0.4 The linear associated-coefficient functor

Construct `associatedCoefficient`, the quasi-coherent module realization of the geometric
contracted product supplied by SchemeAndStackFoundations §1.16. Let `S₀` be a scheme, `G` a flat affine group scheme over `S₀` with
Hopf algebra `H`, `π : P → S` a right `G`-torsor over an `S₀`-scheme `S` for the fpqc topology, and
`ρ : G → GL(V)` a representation on a finite locally free `O_{S₀}`-module `V` (an `H`-comodule).
Define the associated bundle `P ×^G V` as the quasi-coherent `O_S`-module obtained by descending,
along `π`, the module `O_P ⊗ V` with the descent datum given by `(t, v) ∼ (tg, ρ(g)⁻¹ v)`. It is
finite locally free of the rank of `V`, and `π^*(P ×^G V) ≅ O_P ⊗ V` as `G`-equivariant modules.
The new comparison identifies the geometric contracted product of the total space of `V` with
the total space of this finite locally free module, using AlgebraicVectorBundles Layers L0B–L2.
Use the supplied fpqc descent equivalence along `π` (SchemeAndStackFoundations §1.1 and
AlgebraicModuliForArithmeticGeometry §3.1); the target here is its associated-coefficient
specialization and tensor coherence ([Milne90], III Lemma 3.1, p.58).

*Hypotheses.* `G` is flat and affine over `S₀` and `P` is locally trivial for the fpqc topology; no
smoothness of `G` is required. `V` is finite locally free, which makes `P ×^G V` finite locally
free; for an arbitrary comodule the construction gives a quasi-coherent module and no rank
statement.

*Source:* [Milne90], III Lemma 3.1, p.58, and Proposition 3.5, p.58.

The API:

- `associatedCoefficient_pullback`: `π^*(P ×^G V) ≅ O_P ⊗ V`, `G`-equivariantly.
- `associatedCoefficient_trivial`: for the trivial torsor `G ×_{S₀} S` the associated bundle is
  `O_S ⊗ V`.
- `associatedCoefficient_map`: a `G`-equivariant map `u : V → W` induces `P ×^G u`, with identity and
  composition laws.
- `associatedCoefficient_tensor`: tensor products, duals and the unit are preserved by canonical
  isomorphisms.
- `associatedCoefficient_baseChange`: formation commutes with base change along `S′ → S`.
- `associatedCoefficient_rank`: `P ×^G V` is locally free of rank `rk V`.

*Needs:* SchemeAndStackFoundations Layer 1 (§1.15 (`Groups.IsTorsor`), §1.1);
AlgebraicModuliForArithmeticGeometry §3.1 `fpqcQuasicoherentDescent`; Tau Ceti
`TauCeti.CommHopfAlgCat.isPullback_fppfQuotientTorsor`.
*Lean:* none; specified in the README only.

**Checks.**

- `associatedCoefficient_test_unit` (degenerate): the trivial one-dimensional representation gives
  `O_S`.
- `associatedCoefficient_test_line` (computation): for `G = 𝔾_m`, `P = Isom(O_S, 𝓛)` the frame torsor of
  a line bundle `𝓛` with `η·g = η ∘ g`, and the character `χ(g) = g`, the map `[η, v] ↦ η(v)`
  identifies `P ×^G χ` with `𝓛`, and `χ⁻¹` gives `𝓛^∨`. A construction with `(t, v) ∼ (tg, ρ(g) v)`
  exchanges the two answers.
- `associatedCoefficient_test_point` (compatibility): over `S = Spec k` with the trivial torsor,
  `P ×^G V` is the underlying vector space of `V`; for the nontrivial line bundle `𝓛 = O(1)` on `ℙ¹`
  the weight-one and weight-zero characters, which have the same underlying space, give `O(1)` and
  `O`, so the bundle depends on `ρ` and not only on `V`.

### B0.5 Equivariant coefficients on the compact dual

Construct `compactDualCoefficient`. Over the actual coefficient field L, let V be a
finite-dimensional algebraic representation of `P_Hᶜ`. Define its `Gᶜ`-equivariant bundle on the compact
dual by `Gᶜ×^{P_Hᶜ}V`, using `(g,v)∼(gp,ρ(p)⁻¹v)`. Allow parabolic representations with nontrivial
unipotent action as well as representations factoring through the Levi. Supply morphisms,
tensor/dual/unit identifications and pullback. On the `GL₂` flag the tautological character gives
`O(−1)`; its inverse gives O(1).

*Source:* [Milne90], III §2, Remark 2.3(a), pp.54–56.

The API:

- `compactDualCoefficient_fibre`: At the base flag the P-equivariant fibre is V with action `ρ`.
- `compactDualCoefficient_inflate`: The coefficient for an M representation equals that for its
  inflation to P.
- `compactDualCoefficient_tensor`: Associated coefficients preserve tensor products, duals and the
  tensor unit.
- `compactDualCoefficient_map`: For a Pᶜ-equivariant linear map `u:V→W` over the fixed coefficient
  field, the induced map sends [g,v] to [g,u(v)] on the associated compact-dual bundles.
- `compactDualCoefficient_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `compactDualCoefficient_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the induced
  map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level,
  field and model hypotheses remain fixed.

*Needs:* B0.1 (`centralSplitQuotient`); B0.3 (`hodgeParabolicConvention`); ShimuraData Layer 3
(*reflex-flag-descent*); AlgebraicModuliForArithmeticGeometry §3.1 `fpqcQuasicoherentDescent`; B0.4
(`associatedCoefficient`).
*Lean:* none; specified in the README only.

**Checks.**

- `compactDualCoefficient_test_unit` (degenerate): The trivial one-dimensional representation yields
  `O_X̌`.
- `compactDualCoefficient_test_gl2` (compatibility): For `G=GL2/L` and P the stabilizer of `Le₁`, the
  contracted-product bundle for `χ(p)=a` when `pe₁=ae₁` is `O_(P¹)(−1)`, via `[g,v]↦vge₁`; the inverse
  character `χ⁻¹` gives `O_(P¹)(1)`. The cohomological Hodge convention must declare which of these
  characters is used.
- `compactDualCoefficient_test_unipotent` (non-example): The standard P representation with a
  nontrivial upper-triangular unipotent action is not isomorphic as P-module to its associated
  graded inflation.

### B0.6 The analytic filtration torsor

Construct `homogeneousHodgeTorsor`. Pull the compact-dual `P_Hᶜ`-torsor back along the actual Borel
embedding `X→X̌`. Its quotient by the unipotent radical is the torsor of graded Hodge frames. Give the
compatible action and associated coefficient identification. A connection on the full group torsor
does not automatically give a flat connection on this filtration reduction.

*Source:* [CS], §2.3, p.670.

The API:

- `homogeneousHodgeTorsor_filtered_frames`: A point is a tensor-compatible frame identifying the
  reference and varying filtrations.
- `homogeneousHodgeTorsor_graded`: The U quotient parametrizes individual frames of the graded
  pieces.
- `homogeneousHodgeTorsor_pullback_coefficient`: Associating a P coefficient to this torsor is the
  Borel pullback of its compact-dual bundle.

*Needs:* B0.5 (`compactDualCoefficient`); ShimuraData Layer 3 (*borel-embedding*,
*homogeneous-variation*).
*Lean:* none; specified in the README only.

**Checks.**

- `homogeneousHodgeTorsor_test_point` (computation): At the reference point the torsor has its
  reference frame.
- `homogeneousHodgeTorsor_test_standard` (compatibility): For the symplectic standard representation
  the associated filtration is the Hodge exact sequence.
- `homogeneousHodgeTorsor_test_graded` (non-example): Two filtered frames differing by a nonidentity
  unipotent element have the same graded frame, but remain distinct filtered frames.

### B0.7 Analytic arithmetic-quotient coefficients

Construct `analyticCoefficient`. For the actual arithmetic quotient of X, descend the Borel-pulled
homogeneous coefficient through the effective group. Require a torsion-free effective action and
trivial action of the ineffective kernel on fibres, or retain the equivariant stack formulation.
Obtain its holomorphic bundle structure from the Borel embedding and coefficient, rather than from a
quotient of smooth spaces alone.

On an adelic component write the coefficient as `Γ ∖ (G(ℝ) × V) / K_∞`, with `(g,v)·k=(gk,ρ(k)⁻¹v)`. Its
holomorphic structure is the one induced by the compact-dual coefficient, with the same
ineffective-kernel descent condition.

*Source:* [HarrisBundles], Entire note, pp.1–2.

The API:

- `analyticCoefficient_local_trivial`: A small quotient chart identifies the coefficient with its
  holomorphic product bundle.
- `analyticCoefficient_section_equiv`: Sections correspond to equivariant functions under the
  diagonal fibre relation.
- `analyticCoefficient_change_frame`: Changing the frame conjugates the transition cocycle and
  preserves the descended bundle.
- `analyticCoefficient_map`: An equivariant morphism u between the supplied compact-dual
  coefficients descends on each effective analytic quotient; in a compatible frame it sends the
  class of (x,v) to (x,u(v)).
- `analyticCoefficient_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `analyticCoefficient_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the induced map
  of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field
  and model hypotheses remain fixed.

*Needs:* B0.2 (`ineffectiveFibreDescent`); B0.6 (`homogeneousHodgeTorsor`).
*Lean:* none; specified in the README only.

**Checks.**

- `analyticCoefficient_test_trivial` (degenerate): The trivial representation gives the holomorphic
  structure sheaf on `Γ_eff\X`.
- `analyticCoefficient_test_odd` (non-example): The `−1` stabilizer acts by `−1` on an odd-weight GL2
  coefficient, so that coefficient does not descend to the coarse quotient unless that stabilizer is
  removed.
- `analyticCoefficient_test_rank` (characterisation): The local rank equals dim V, independent of
  the arithmetic component.

### B0.8 Sections as equivariant functions

Prove `sectionsEquivariant`. Identify sections of the associated bundle of a right P-torsor T with
coefficient-valued functions satisfying `f(tp)=ρ(p)⁻¹f(t)`. In a local frame on a left arithmetic
quotient this becomes `f(γx)=J(γ,x)f(x)`, where `J(gh,x)=J(g,hx)J(h,x)`. Establish the identifications
with their regular or holomorphic hypotheses, and their compatibility with coefficient maps and
frame changes.

*Source:* [HarrisBundles], p.1, equation (1) and its consistency check.

*Needs:* B0.5 (`compactDualCoefficient`); B0.7 (`analyticCoefficient`).
*Lean:* none; specified in the README only.

**Checks.**

- Noncommuting fibre maps distinguish this relation from the wrong product order.

- For the trivial representation the equivariant functions are exactly functions on the base.

- On a line-frame torsor the weight-one relation is `f(tu)=u⁻¹f(t)`; changing a frame by `u=2` changes its coordinate by `1/2`, not `2`.

### B0.9 Descent over the coefficient field

Construct `coefficientGaloisDescent`. For a finite Galois splitting extension L/E, descend the
equivariant coefficient using its actual semilinear transport maps and cocycle. Tensor, dual and
base-extension operations commute with this descent. A highest weight descends only with the
representation's Galois datum; use its stabilizer field where necessary. In an embedding-labelled
example a parallel tensor survives permutation of factors, whereas a nonparallel label is not
automatically defined over E.

*Source:* [Milne90], III §5, Theorem 5.1, p.61.

The API:

- `coefficientGaloisDescent_base_change`: The descended coefficient tensored with L is the original
  J with its given descent maps.
- `coefficientGaloisDescent_unique`: Morphisms over E are exactly L-morphisms compatible with all
  `d_σ`.
- `coefficientGaloisDescent_associate`: Descent commutes with association to a descended principal
  torsor.
- `coefficientGaloisDescent_map`: A coefficient morphism commuting with the actual semilinear Galois
  descent isomorphisms descends uniquely; its base change is the supplied split-coefficient
  morphism.
- `coefficientGaloisDescent_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `coefficientGaloisDescent_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* AlgebraicModuliForArithmeticGeometry §3.1 `fpqcQuasicoherentDescent`; B0.5
(`compactDualCoefficient`).
*Lean:* none; specified in the README only.

**Checks.**

- `coefficientGaloisDescent_test_identity` (degenerate): For `L=E` and the identity datum descent
  returns J.
- `coefficientGaloisDescent_test_parallel` (computation): For a real quadratic F split by L/E, the
  split tensor of the two embedding-labelled Hodge lines with equal exponent r admits the
  factor-swap descent isomorphism; applying the nontrivial permutation twice is identity. Retain the
  actual descent datum of the underlying HB family.
- `coefficientGaloisDescent_test_nonparallel` (non-example): For a real quadratic F and weight
  (k1,k2) with `k1≠k2`, the nontrivial embedding permutation does not fix the label; it cannot be
  descended by declaring all `d_σ` identities.

### B0.10 Algebraic and analytic coefficient descent

Prove `geometricAnalyticCoefficients`. Compare the analytification of the actual algebraic
associated coefficient with the holomorphic bundle constructed from the same torsor and
representation. The comparison respects equivariant sections and tensor maps. Prove it by descent on
the named torsor charts; no assertion of coherent GAGA for a nonproper open variety is needed.

*Source:* [Milne90], III §3, Lemma 3.1 and Propositions 3.2–3.5, pp.58–59.

*Needs:* B0.9 (`coefficientGaloisDescent`); B0.7 (`analyticCoefficient`); ComplexComparisonPartII C0
(`CoherentAnalytification`, `coherentPullbackOperations`).
*Lean:* none; specified in the README only.

**Checks.**

- The comparison transports the same frame factor, not merely an isomorphic unfiltered smooth
  bundle.

- The unit coefficient compares with the holomorphic structure sheaf, with identity on the constant section `1`.

- For a line-frame torsor, analytifying the dual character gives the dual holomorphic line, and evaluation against the original line agrees with analytifying evaluation.

### Examples

- For `G = GL₂` over `ℚ` the centres over `ℚ` and `ℝ` have the same split rank, so `Z_s = 1` and
  `Gᶜ = G`; for `Res_{F/ℚ} GL₂` with `[F : ℚ] = d` totally real, `Z_s` has dimension `d − 1` (B0.1).
- On the `GL₂` flag `ℙ¹`, with `P` the stabilizer of `L e₁` and `χ(p) = a` when `p e₁ = a e₁`, the
  contracted product for `χ` is `O(−1)` and for `χ⁻¹` is `O(1)` (B0.5); the cohomological Hodge
  convention declares which character is used.
- The stabilizer `−1` of `SL₂(ℤ)` acts by `(−1)^k` on the weight-`k` coefficient, so odd weights do
  not descend to the coarse quotient (B0.7).

### Dependencies

ShimuraData Layer 3 and §4.9; ShimuraVarieties Layer 1; SchemeAndStackFoundations Layer 1;
AlgebraicModuliForArithmeticGeometry §§3.1, 5.3; ComplexComparisonPartII C0; Tau Ceti dynamic
parabolics and fppf quotients.

## Layer B1: canonical principal bundles of Hodge and abelian type

Begin with the actual Hodge-type universal family and its degree-one comparisons. Finitely many
tensors specify the group, absolute Hodge theory transports those tensors, and their de Rham frames
construct the torsor. The filtration reduction, the special-point normalization and independence of
the symplectic embedding identify its canonical rational model. Connected central-isogeny descent
supplies the abelian-type extension.

### B1.1 Reductive groups as tensor stabilizers

Prove `finiteTensorStabilizer`. For a faithful representation of a reductive group in characteristic
zero, choose finitely many mixed tensors whose scheme-theoretic pointwise stabilizer is exactly the
group. Include duals and the stated Tate-coordinate convention. Stabilizing a line up to scalar is a
weaker condition and does not provide the tensor-preserving frame torsor used here.

*Source:* [Deligne], §3 Proposition 3.1(a–c), pp.22–23; [CS], §2.3, p.667.

*Needs:* Tau Ceti comodule representations (`TauCeti.Algebra.AlgebraicGroup.Representation`) and
linear reductivity (`TauCeti.Algebra.AlgebraicGroup.LinearlyReductive`).
*Lean:* `finiteTensorStabilizer`, using `mixedTensorBaseChange` and `mixedTensorAction`.
The mixed tensors are finite sums of tensor words in a vector space and its dual. One finite
family over the ground field cuts out the represented group over every commutative coefficient
algebra, including nonreduced algebras; this is scheme-theoretic pointwise tensor stabilization.

**Checks.**

- For `GSp(V,ψ)` include the similitude/Tate line; requiring `ψ` to be fixed in `V∨⊗V∨` alone cuts out Sp,
  not GSp.

- For `GL(V)` the empty set of additional defining tensors has stabilizer `GL(V)`; adding an arbitrary chosen vector would shrink it.

- For a nondegenerate form, fixing its line permits similitudes whereas fixing its value excludes a transformation whose multiplier differs from `1`.

### B1.2 Absolute Hodge tensors in abelian families

Construct `absoluteHodgePropagation` by applying ShimuraVarieties §7.0i
`TauCeti.Shimura.abelian_absolute_hodge`, including its family form. Fix a Hodge-type
symplectic embedding and a neat level with its universal abelian family over a smooth connected
complex component. Apply the supplied transport to B1.1's finite
rational defining tensors in the universal abelian family's degree-one realizations, duals
and Tate lines. Identify the transported tensors with the defining family on each conjugate
complex fibre. Retain horizontal algebraic de Rham and compatible Betti and étale sections,
tensor relations, and identity/composition of transport. B1.3 constructs their additional
descent over the canonical reflex field. The abelian absolute-Hodge theorem and its family
propagation are supplied by §7.0i.

*Source:* [Deligne], Main Theorem 2.11, p.19; Principle B, Theorem 2.12, p.20, and Theorem 2.15,
p.21; Proposition 6.1, pp.41–42; [CS], §2.3 Lemma 2.3.2, pp.668–669.

*Needs:* B1.1 (`finiteTensorStabilizer`); ShimuraVarieties §7.0i
(`TauCeti.Shimura.abelian_absolute_hodge`, including its family form), Layer 5
(the chosen Hodge-type universal family); PELModuli M3 (universal Siegel family);
AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge sequence and Gauss–Manin
connection, `AbelianTate`, `exteriorCohomology`).
*Lean:* none; specified in the README only.

**Checks.**

- Algebraic endomorphisms and polarization tensors of a CM elliptic curve satisfy the statement; no
  integral Hodge conjecture is used.

- The tensor unit is absolute Hodge and all its realization maps send `1` to `1`.

- Parallel transport of the identity endomorphism of relative `H¹` remains the identity in all three realizations; a fibrewise Hodge class without horizontal transport is not covered by the propagation assertion.

### B1.3 Descended Hodge-tensor realizations

Construct `hodgeTensorRealizations`. For a Hodge-type datum with a chosen symplectic embedding and
sufficiently small level, let A/S be the universal abelian scheme over the canonical reflex field E.
Realize the finite defining family of rational Hodge tensors in `H=H₁(A)=(R¹π_*)∨` and its Betti,
étale and de Rham tensor constructions, including Tate twists. The de Rham tensors are horizontal,
lie in the required filtration and descend to E using arithmetic Galois invariance and
absolute-Hodge comparison. The standard homology module is the dual of relative `H¹` and carries the
declared Tate lines. The realizations preserve the tensor relations defining `Gᶜ`.

*Source:* [CS], Lemmas 2.3.1–2.3.2, pp.668–669; [AG], §3.3; §3.5, pp.418–422.

The API:

- `hodgeTensorRealizations_horizontal`: The de Rham defining tensors satisfy `∇sα,dR=0`.
- `hodgeTensorRealizations_compare`: The Betti–de Rham and Betti–étale comparisons send each `sα` to
  its named realization, with the same Tate normalization.
- `hodgeTensorRealizations_galois`: After base change to Ebar the named tensor sections are fixed by
  Gal(Ebar/E), hence descend to E.

*Needs:* B1.1 (`finiteTensorStabilizer`); B1.2 (`absoluteHodgePropagation`);
AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge sequence and Gauss–Manin
connection, `AbelianTate`, `exteriorCohomology`); PELModuli M3 (fine-level universal abelian
families); ShimuraVarieties Layer 5 (canonical Siegel and PEL models and their universal families);
ShimuraVarieties Layer 8 (the canonical finite étale tower and Hecke spans over the reflex field).
*Lean:* none; specified in the README only.

**Checks.**

- `hodgeTensorRealizations_test_endomorphism` (compatibility): An algebraic endomorphism of A acts
  compatibly in all three degree-one realizations.
- `hodgeTensorRealizations_test_polarization` (characterisation): The polarization tensor is valued
  in the specified Tate line; ignoring that line changes GSp to Sp.
- `hodgeTensorRealizations_test_zero` (degenerate): Adding a zero tensor does not change the
  simultaneous stabilizer or the descended frame torsor.

### B1.4 The tensor-preserving de Rham frame torsor

Construct `tensorFrameTorsor`. Define the de Rham frame functor by tensor-preserving isomorphisms
`η:V⊗O→H_dR`. The right action is `η·g=η∘g`. Prove representability and local nonemptiness from the
tensor comparison, then identify it as the relevant principal torsor. Being a closed subfunctor of
an isomorphism scheme by itself proves neither local nonemptiness nor the torsor property.

*Source:* [AG], Proposition 3.5.1, pp.421–422; [CS], §2.3, p.670.

The API:

- `tensorFrameTorsor_frame`: A T point is an invertible frame of H carrying every reference tensor
  to its de Rham realization.
- `tensorFrameTorsor_right_action`: `η·g=η∘g`, and `T×G→T×_S T` is an isomorphism.
- `tensorFrameTorsor_coefficient`: T×^G V identifies with `H_dR` for the chosen faithful coefficient.

*Needs:* B1.1 (`finiteTensorStabilizer`); B1.3 (`hodgeTensorRealizations`); B0.1
(`centralSplitQuotient`).
*Lean:* none; specified in the README only.

**Checks.**

- `tensorFrameTorsor_test_identity` (computation): For a constant tensor-equipped bundle `V⊗O_S`,
  identity is a global frame and `T≃G×S`.
- `tensorFrameTorsor_test_sp` (non-example): For a polarization with a separately varying similitude
  line, the correct tensor frame group is GSp; fixing the alternating form with no Tate line
  incorrectly yields Sp.
- `tensorFrameTorsor_test_rank` (characterisation): An isomorphism frame exists only between
  equal-rank modules and must preserve all tensors, not just the polarization.

### B1.5 The filtered frame reduction

Construct `filtrationReduction`. Construct the equivariant filtration map from the tensor frame
torsor to the reflex-field compact dual. Over a field where the reference parabolic is defined,
identify its inverse image with a `P_Hᶜ`-reduction and its unipotent quotient with graded frames. The
reflex flag can have no rational point, so do not choose a reference filtration over E without a
hypothesis; nonsplit flag forms test this distinction.

*Source:* [CS], §2.3, pp.669–671.

The API:

- `filtrationReduction_flag_map`: `γ(ηg)=g⁻¹γ(η)` in the chosen right-torsor convention.
- `filtrationReduction_parabolic_fibre`: After choosing the reference flag over L, its inverse image
  is exactly the tensor-preserving filtered frames.
- `filtrationReduction_levi`: Quotienting the filtered-frame torsor by U identifies frames of `gr_F H`
  individually.

*Needs:* B1.4 (`tensorFrameTorsor`); B0.6 (`homogeneousHodgeTorsor`); ShimuraData Layer 3
(*reflex-flag-descent*).
*Lean:* none; specified in the README only.

**Checks.**

- `filtrationReduction_test_siegel` (compatibility): For the standard Siegel family `γ` records the
  Hodge subbundle, with its actual Lagrangian condition.
- `filtrationReduction_test_zero` (degenerate): For a rank-zero coefficient the induced filtration
  is zero, even though the principal datum remains the same.
- `filtrationReduction_test_no_point` (non-example): For the quaternionic Shimura curve of the
  division algebra `B=(−1,3)/Q`, the compact dual is the Severi–Brauer conic of B and has no Q-point;
  the rational `γ:Π→X̌_Q` does not furnish a section Spec `Q→X̌_Q`. B is split over R, while 3 is not a
  norm from Q(i), so this tests an actual nonsplit flag form.

### B1.6 Canonical principal bundles of Hodge type

Prove `hodgeCanonicalPrincipalBundle`. For a Hodge-type Shimura datum in characteristic zero,
construct the canonical Gᶜ-principal bundle over the reflex canonical model, its filtration map, its
full-group flat connection and its Hecke tower maps. Compare with the analytic torsor and impose the
CM-period normalization at special points. The integral tensor-frame construction at a particular
good prime is additional model-specific work, not an all-prime consequence.

*Source:* [Milne90], III §3, p.58; Theorem 4.3, pp.59–60; Example 4.4(a), p.60; [AG], §3.5,
Proposition 3.5.1 and proof, pp.421–422.

*Needs:* B1.4 (`tensorFrameTorsor`); B1.5 (`filtrationReduction`); ShimuraVarieties Layer 4 (special
points and reciprocity).
*Lean:* none; specified in the README only.

**Checks.**

- In the Siegel case the associated standard homology coefficient is the dual relative `H¹dR` with
  Gauss–Manin connection.

- The filtration reduction for the Siegel family has the rank-`g` Hodge subbundle of its rank-`2g` standard realization.

- At a CM point the comparison is the specified period-torsor comparison; changing it by an arbitrary scalar is not a second normalized canonical model.

### B1.7 Independence of symplectic embedding

Prove `embeddingIndependence`. Compare the canonical principal bundles obtained from two faithful
symplectic embeddings of the same Hodge-type datum. Use a common tensor realization and tensor
projectors to produce the canonical comparison. Check its cocycle for three embeddings and
compatibility with filtration, connection, Hecke maps and CM normalization.

*Source:* [CS], Remark 2.3.3; Lemma 2.3.4, pp.669–670; [AG], §3.5, proof of Proposition 3.5.1,
p.422.

*Needs:* B1.6 (`hodgeCanonicalPrincipalBundle`); B1.3 (`hodgeTensorRealizations`); B1.1
(`finiteTensorStabilizer`).
*Lean:* none; specified in the README only.

**Checks.**

- Adding a second faithful representation gives the same principal torsor, with the expected second
  associated module.

- Comparing an embedding with itself gives the identity tensor-frame map.

- For three embeddings, the comparison from the first to the third is the composite through the second, also on the Hodge filtration and the CM fibre.

### B1.8 The special-point normalization

Prove `cmPrincipalNormalization`. At a special point identify the principal-bundle fibre with the
corresponding CM period torsor. Verify reciprocity compatibility with the actual special-point
transport. This fixes the canonical rational model and comparison isomorphisms; it does not supply a
preferred frame, a numerical period or a trivialization of the period torsor.

*Source:* [Milne90], III Theorem 4.1, p.59; Example 4.2(b), p.59; Remark 4.5, p.60.

*Needs:* B1.6 (`hodgeCanonicalPrincipalBundle`); ShimuraVarieties Layer 4 (special points and
reciprocity).
*Lean:* none; specified in the README only.

**Checks.**

- Changing an Artin convention must invert the reciprocity map in both the variety and the fibre
  normalization.

- For the unit associated coefficient the special-point comparison fixes `1`.

- A nontrivial CM character has a period-torsor line with its reciprocity action; the normalization does not choose a nonzero rational vector in that line.

### B1.9 Canonical principal bundles of abelian type

Prove `abelianCanonicalPrincipalBundle`. For abelian-type data satisfying Milne II (2.1), including
that `Z(G)°` splits over a CM field, pass from Hodge-type data through the
stated connected central-isogeny and finite-quotient constructions. Descend the bundle, filtration,
connection and tower maps, checking that the quotient kernel acts trivially on the coefficient
fibres. Compatibility with connected-component transport is part of the construction.

*Source:* [Milne88], §7, Lemmas 7.1–7.3 and Proposition 7.4, pp.29–31; [Milne90], III §4, Theorems
4.1/4.3 and Remark 4.5(ii), pp.59–60.

*Needs:* B1.6 (`hodgeCanonicalPrincipalBundle`); B1.7 (`embeddingIndependence`); B1.8
(`cmPrincipalNormalization`); B0.2 (`ineffectiveFibreDescent`); ShimuraVarieties Layer 6 (connected and
abelian-type canonical models).
*Lean:* none; specified in the README only.

**Checks.**

- A connected abelian-type cover with a finite central kernel does not descend a coefficient on
  which that kernel acts nontrivially.

- A cover with trivial kernel gives the original Hodge-type canonical torsor and maps.

- For a central kernel of order two the unit and the square of a sign character pass the fibre test, while the sign character itself fails.

### B1.10 Hecke pullback of the canonical torsor

Prove `principalHeckePullback`. Along the supplied finite étale arithmetic level maps and Hecke
translations, construct the canonical isomorphisms between the pulled-back principal bundles. They
preserve the filtration map, full-group connection and special-point normalization, and satisfy
identity and composition laws. Trace on coherent sections is a separate B5 operation.

*Source:* [Milne90], III Proposition 2.1(a), p.55; Proposition 3.2, p.58; Remark 4.5(i–ii), p.60.

*Needs:* B1.9 (`abelianCanonicalPrincipalBundle`); ShimuraVarieties Layer 1 (the analytic tower, level
maps and Hecke translations); ShimuraVarieties Layer 8 (the canonical finite étale tower and Hecke spans
over the reflex field).
*Lean:* none; specified in the README only.

**Checks.**

- A pair of Hecke pullbacks composes to their product after passing to a level where both are
  defined.

- The identity level map induces the identity on every tensor frame.

- On the standard Siegel coefficient the map is the isogeny-induced de Rham pullback, preserving the Hodge subspace; it is not multiplication by the degree of the Hecke span.

### Examples

- For the Siegel datum the polarization tensor takes values in the Tate line; forgetting that line
  replaces `GSp` by `Sp` (B1.4).
- For the quaternionic Shimura curve of the division algebra `(−1, 3)/ℚ` the compact dual is the
  Severi–Brauer conic, which has no rational point; the filtration map exists without a rational
  reference filtration (B1.5).

### Dependencies

Layer B0; AbelianSchemesAndArithmeticModuli A4; PELModuli M3; ShimuraVarieties Layers 1, 4–6, 8;
ShimuraData Layer 3.

## Layer B1.general: canonical principal bundles for general data

The general-data route first algebraizes the complex standard principal bundle and its structures,
then uses conjugation of connected Shimura data and its principal-automorphism argument. The
adjoint second-jet realization and the rank-one rational-point reduction precede continuous
effective descent. For full pure data assume Milne II (2.1), including the CM-split-centre condition;
the connected semisimple construction has no additional centre condition. This is a
characteristic-zero construction without a universal abelian family.

### B1.general.0 Algebraization of the complex standard principal bundle

Construct `generalComplexStandardPrincipalBundle`. For a connected Shimura datum with semisimple
`G`, construct on its sufficiently small arithmetic complex tower an algebraic `G_ℂ`-torsor whose
analytification is `Γ∖(X⁺×G(ℂ))`. Equip it with the algebraic integrable flat connection, connected
Hecke symmetries and an equivariant algebraic map to the compact dual, comparing all structures
with their homogeneous analytic versions. Use the right-torsor convention of B0.4, converting
Milne's left action by inversion. Formation respects level maps, central covers and products.

Supply the algebraization step of Milne's Proposition 3.2 within this target. For a `ℚ`-simple
adjoint factor with Baily–Borel boundary of codimension at least three, prove the bundle
algebraization and full-faithfulness assertions of Lemma 3.3 on that compactification. Apply them
to a faithful coefficient, its finite defining tensors and its first-jet sequence. The holomorphic
connection splitting becomes algebraic, and its integrability and tensor compatibility follow by
faithful analytification. The tensor-frame scheme is the algebraic torsor. Algebraize the adjoint
Hodge filtration and its subbundle maps by the same comparison; Proposition 2.4's flag universal
property then gives Proposition 3.5's algebraic compact-dual map. Hecke maps are algebraic by the
fully faithful comparison on the corresponding level covers.

For boundary codimension two, use Milne's totally real auxiliary restriction of scalars with
boundary codimension at least three, pull its faithful coefficient and filtration back to the
original Shimura variety, and algebraize the defining tensors and maps there by Lemma 3.3(b).
For the remaining codimension-one simple factors, the group is of modular-curve type; use the
universal elliptic curve and its algebraic Gauss–Manin connection and Hodge line, with the central
cover comparison. Products and finite central covers assemble the semisimple result. These
codimension comparisons and the auxiliary embedding are assertions of this target on the named
Shimura compactifications, rather than an invocation of nonproper GAGA for an arbitrary variety.

*Source:* [Milne88], Proposition 2.4, p.12; Propositions 3.1–3.2, Lemma 3.3 and Proposition 3.5,
pp.15–17.

*Needs:* B0.4, B0.6–B0.7, B1.1, B1.4–B1.6 (tensor frames and the elliptic case);
ShimuraVarieties Layers 1–2 (arithmetic towers, algebraic datum maps and Baily–Borel boundary);
ShimuraData Layer 3 (homogeneous variation and compact dual);
ComplexComparisonPartII C0, C2 (coherent analytification and projective GAGA);
AbelianSchemesAndArithmeticModuli A4 (elliptic Gauss–Manin connection).
*Lean:* none; specified in the README only.

**Checks.**

- For a compact arithmetic quotient the boundary is empty and projective GAGA algebraizes the
  coefficient, defining tensors, connection splitting and flag map.
- For a codimension-two boundary, the auxiliary totally real embedding supplies algebraization;
  full faithfulness alone would only algebraize maps between already algebraic bundles.
- For `SL₂` and its modular-curve tower the boundary has codimension one; the construction is the
  elliptic de Rham frame torsor with Gauss–Manin and its actual Hodge line.
- For `σ∈Aut(ℂ)` the resulting torsor, connection and flag map admit algebraic base change by
  `σ`; a merely holomorphic torsor has no such field-automorphism base change.

### B1.general.1 Conjugation of connected principal bundles

Prove `connectedPrincipalConjugation`. Fix a connected datum (G,X) with G semisimple simply
connected, `σ∈Aut(ℂ)`, and a special point x. Construct the algebraic isomorphism from the σ-conjugate
connected standard principal bundle to that of the transported datum, normalized by the period
torsor at x. Preserve the compact-dual map, flat connection and connected Hecke-group action. Under
Layer 7's conjugate-datum identification the comparison is independent of auxiliary choices. Use the
rank-one reduction and faithful adjoint-jet realization below to prove that the normalization
controls principal automorphisms.

*Source:* [Milne88], Theorem 3.10 and Corollary 3.11, pp.18–20.

*Needs:* B1.general.0 (`generalComplexStandardPrincipalBundle`);
B1.9 (`abelianCanonicalPrincipalBundle`); ShimuraVarieties Layer 7 (conjugation of connected
Shimura data); B1.general.3 (`generalConnectedReduction`).
*Lean:* none; specified in the README only.

**Checks.**

- The normalized isomorphism is unique with all the stated equivariance/connection conditions.

- For `σ=id` the normalized transport is the identity on the connected principal bundle.

- Applying an associated adjoint representation intertwines the transported connection and second-jet action; an arbitrary pointwise torsor isomorphism need not do so.

### B1.general.2 The adjoint bundle and second jets

Prove `adjointJetRealization`. Realize the adjoint coefficient faithfully inside the second jets of
the tangent bundle in the connected conjugation argument. Prove equivariance and the induced
restriction on principal automorphisms. Use the corrected order-two injection in Milne's Lemmas
9.3–9.4; an order-one tangent realization and the withdrawn Harris 1984 assertion do not replace it.

*Source:* [Milne88], §9 Lemmas 9.3–9.4, pp.33–34.

*Needs:* B1.general.0 (`generalComplexStandardPrincipalBundle`);
ShimuraData Layer 3 (*compact-dual*); ShimuraVarieties Layer 7 (conjugation of connected Shimura
data).
*Lean:* none; specified in the README only.

**Checks.**

- First-order tangent data alone are not asserted to give this injection.

- For the identity group element the second-jet action is identity on both first and second order parts.

- On the compact dual `ℙ¹`, in the affine coordinate near `0`, the Möbius map `z↦z/(cz+1)` fixes `0` and has derivative `1` there, but quadratic coefficient `−c`. The second jet distinguishes it from identity when `c≠0`.

### B1.general.3 The general connected bundle reduction

Prove `generalConnectedReduction`. Reduce the connected principal-bundle conjugation theorem to
`type-A₁` subdata after the prescribed totally real auxiliary extension. Separate algebraic-group
generation in Lemma 9.5 from generation of rational points in Lemma 9.2. Work with a connected
Shimura datum with `G` semisimple simply connected and `G^ad ℚ`-simple, writing `G = Res_{F/ℚ} H`
for `F` totally real and `H` absolutely almost simple. The transport homomorphism
`r_x : G(ℚ) → G(ℂ)` is the one obtained from the normalized flat principal-bundle transport.
Realize its adjoint representation in the second jets of the compact-dual tangent bundle; the
automorphic-sub-bundle realization makes it continuous in the complex topology (Lemma 9.3).
After a totally real enlargement splitting the special torus over a quadratic extension, the
algebraic adjoint map agrees with the ordinary adjoint action on the `type-A₁` subgroups `H_α`.
Lemma 9.5 gives algebraic-group generation, and hence agreement of the adjoint maps.

The remaining difference `γ(g) = r_x(g)g⁻¹` is a central homomorphism. Use generation of `G(ℚ)`
by the rational points of special tori (the result invoked in Lemma 9.2), not simplicity of
`G(ℚ)/Z(ℚ)` for arbitrary `G`. For an element in a special torus, enlarge the totally real
field again so that the torus lies in a reductive `type-A₁` subgroup `G_α` isotropic at a finite
prime. The auxiliary subgroup has the simple rational central quotient used in Lemma 9.2;
functoriality of the central difference then kills the element. This proves `r_x(g) = g`. The
special-torus generation, auxiliary `type-A₁` embedding and local-isotropy steps are proof
obligations of this target with the hypotheses above, not unnamed hypotheses of its conclusion.
Do not invoke the stronger rational-point assertion in §8.1, which its footnote leaves conjectural.

*Source:* [Milne88], §9 Lemmas 9.1–9.5, pp.33–34.

*Needs:* B1.general.0 (`generalComplexStandardPrincipalBundle`);
B1.general.2 (`adjointJetRealization`); B1.9 (`abelianCanonicalPrincipalBundle`);
ShimuraVarieties Layer 7 (conjugation of connected Shimura data).
*Lean:* none; specified in the README only.

**Checks.**

- For a type-`A₁` datum the normalized transport is already the abelian-type one.
- Equality of adjoint maps alone permits a central discrepancy; the special-torus argument must
  kill it on rational points. Assuming an arbitrary rational central quotient is simple is invalid.
- The proof never invokes a non-abelian-type family of motives.

### B1.general.4 General canonical principal models

Prove `generalPrincipalModel`. For a general pure Shimura datum satisfying Milne II (2.1), including
that `Z(G)°` splits over a CM field, descend
the normalized connected principal bundles on the neat effective canonical tower to a canonical
Gᶜ-torsor over E. Its analytification is the homogeneous standard principal bundle, with its
canonical flat connection. Prove the continuity and effectivity of the Weil descent datum and its
compatibility with components and level maps. A family of motives is not an additional assumed
carrier for this construction.

*Source:* [Milne90], III Theorem 4.3 and Example 4.4, pp.59–60.

*Needs:* B1.general.0 (`generalComplexStandardPrincipalBundle`);
B1.general.1 (`connectedPrincipalConjugation`); B1.general.3 (`generalConnectedReduction`);
B0.1 (`centralSplitQuotient`); ShimuraVarieties
Layer 7 (conjugation of connected Shimura data); ShimuraVarieties §8.22 (canonical towers for
general data).
*Lean:* none; specified in the README only.

**Checks.**

- General models are characteristic-zero models over number fields; no integral or motivic upgrade
  follows.

- On Hodge-type data the descended general construction compares with B1.6, including its flat connection and special-point normalization.

- The tensor unit on every connected component descends to the same structural coefficient; independently rescaling component identifications must still satisfy the Weil cocycle.

### B1.general.5 The rational compact-dual map

Prove `generalCompactDualMap`. Descend the equivariant compact-dual map along the general
principal-bundle descent datum. It is defined over E with its reflex flag target and is compatible
with conjugation. A rational point of that flag variety is not needed for the map and is not
asserted by its existence.

*Source:* [Milne90], III Theorem 4.6, pp.60–61.

*Needs:* B1.general.4 (`generalPrincipalModel`); ShimuraData Layer 3 (*reflex-flag-descent*).
*Lean:* none; specified in the README only.

**Checks.**

- The construction descends the conjugacy class of flags, not a chosen E-rational filtration.

- In the split `GL₂` case the compact dual is the flag line variety, and the standard torsor map records the actual Hodge line.

- Transport under two coefficient-field embeddings agrees with transport of the flag variety and the principal torsor; keeping one unchanged flag fibre would fail equivariance.

### B1.general.6 Normalized conjugation and its cocycle

Prove `generalConjugationCocycle`. Prove the two-step cocycle for the special-point-normalized
conjugation transports of general principal bundles and their compact-dual maps. Keep all
coefficient-field transports. Rational Betti statements retain the `ℚ`-defined weight hypothesis of
Milne III Theorem 6.2.

*Source:* [Milne90], III Theorem 4.1, p.59; Remark 4.5, p.60; Theorem 6.2, p.62.

*Needs:* B1.general.4 (`generalPrincipalModel`); B1.general.5 (`generalCompactDualMap`);
B1.general.3 (`generalConnectedReduction`); ShimuraVarieties Layer 7 (conjugation of connected Shimura
data).
*Lean:* none; specified in the README only.

**Checks.**

- `σ=id` gives identity; successive conjugation uses the transported datum and CM period torsor, not a
  fixed unchanged group.

- Composing transport by `σ` with transport by `σ⁻¹` gives the identity on the original coefficient and its period-normalized fibre.

- A third conjugation gives the same map under either association of the two-step cocycle, after transporting the coefficient field at each step.

### Examples

- For `σ = id` the normalized conjugation is the identity and the cocycle is trivial (B1.general.6).
- An order-one tangent realization of the adjoint coefficient does not suffice; the corrected
  order-two injection of Milne's Lemmas 9.3–9.4 is used (B1.general.2).

### Dependencies

Layers B0–B1; ShimuraData Layer 3; ShimuraVarieties Layer 7, §8.22.

## Layer B2: associated bundles and realizations

Pull the compact-dual coefficient back to the canonical torsor and descend it along the group
action. This gives the coherent automorphic bundle of a parabolic coefficient. Full-group
coefficients additionally receive arithmetic local systems and filtered connections. Every
comparison keeps the representation field, the highest-weight label and the homology/cohomology
switch.

### B2.1 The automorphic coefficient functor

Construct `automorphicVectorBundle`. Use the canonical principal bundle and its equivariant
compact-dual map to descend `γ*J` to an automorphic vector bundle V(J) over the actual coefficient
field L. For a parabolic or Levi representation take J from B0. Give a tensor, dual, unit and
coefficient-map functor with base-field and level compatibility. A full-group representation is
required for the additional flat realization; a `GL₂` parabolic Hodge-line character need not extend
to a rank-one `GL₂` representation.

*Source:* [Milne90], III §5, Theorem 5.1, p.61; [CS], Lemma 2.3.5, pp.670–671.

The API:

- `automorphicVectorBundle_pullback`: `Π*V(J)≃γ*J` with the specified `Gᶜ` descent action.
- `automorphicVectorBundle_levi`: For `ρ:M→GL(V)`, `V(Jρ)≃P_dR×^{P_H}V` after inflation.
- `automorphicVectorBundle_tensor`: V preserves tensor products, duals and the unit through
  canonical descent isomorphisms.
- `automorphicVectorBundle_scalar_extension`: `V(J)⊗_L L′≃V(J⊗_L L′)` for every field extension L′/L.
- `automorphicVectorBundle_map`: A Pᶜ-equivariant linear map `u:V→W` induces the associated
  coefficient map V(u) on the fixed canonical model; after pulling back to the principal torsor it
  is the constant map u.
- `automorphicVectorBundle_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `automorphicVectorBundle_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the induced
  map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level,
  field and model hypotheses remain fixed.

*Needs:* B1.9 (`abelianCanonicalPrincipalBundle`); B1.5 (`filtrationReduction`); B0.5
(`compactDualCoefficient`); B0.9 (`coefficientGaloisDescent`); AlgebraicModuliForArithmeticGeometry
§3.1 `fpqcQuasicoherentDescent`; B0.4 (`associatedCoefficient`).
*Lean:* none; specified in the README only.

**Checks.**

- `automorphicVectorBundle_test_unit` (degenerate): For `J=O_X̌` with trivial fibre action, `V(J)=O_S`.
- `automorphicVectorBundle_test_hodge` (compatibility): In the Siegel cohomology convention, the
  Hodge-line/standard Levi coefficient gives `e*Ω¹_A/S`, not its inverse.
- `automorphicVectorBundle_test_nonflat` (non-example): For the upper-triangular P in GL2,
  `χ(diag(a,d))=a` defines a rank-one associated automorphic coefficient. It is not the restriction of
  a one-dimensional GL2 representation: `det^n` restricts to `a^n d^n` and cannot equal a for any n. The
  full-group flat-connection functor therefore cannot be applied to this coefficient by declaring `χ`
  to extend.

### B2.2 The algebraic automorphic bundle comparison

Prove `automorphicAnalyticComparison`. After `L↪ℂ` identify V(J)^an with B0's holomorphic quotient
coefficient, using the same torsor, inverse fibre action and effective arithmetic descent. Check
coefficient maps, tensors and the section transformation law under this identification.

*Source:* [Milne90], III §3, Proposition 3.5, pp.58–59; III §5, Theorem 5.1, p.61.

*Needs:* B2.1 (`automorphicVectorBundle`); B0.10 (`geometricAnalyticCoefficients`); B0.8
(`sectionsEquivariant`).
*Lean:* none; specified in the README only.

**Checks.**

- For GL2 the chosen Hodge line is the holomorphic invariant-differential coefficient.

- The unit comparison identifies the constant algebraic section `1` with the constant holomorphic section `1`.

- A character and its inverse compare with mutually dual holomorphic lines; replacing the inverse fibre action by the direct action exchanges them.

### B2.3 Highest weights and coefficient conventions

Prove `leviHighestWeightConvention`. For a split Levi over L and a dominant weight `λ`, label the
coefficient fibre by the actual representation `V_λ`. In BCGP's left-coset function realization its
Borel character is `−w₀,Mλ`. The dual representation has highest weight `−w₀,Mλ` as a different
statement. Provide the explicit conversion, including similitude characters, and the Galois descent
datum for nonsplit forms.

*Source:* [BCGP], §3.2.13–3.2.16, p.44; Example 3.2.18, p.45.

*Needs:* B0.3 (`hodgeParabolicConvention`); B0.5 (`compactDualCoefficient`); B0.9
(`coefficientGaloisDescent`); TauCetiRoadmap.RepresentationTheory.ClassicalGroups Layer 3
(`DominantWeight`, the theorem of the highest weight).
*Lean:* none; specified in the README only.

**Checks.**

- BCGP’s tautological Siegel exact sequence is compared with the full standard P representation; it
  is not split into a flat sum by naming the two Levi weights.

- For the `GL₂` Levi weight `(a,b)`, the dual highest weight is `(−b,−a)`, so `(1,0)` and `(0,−1)` are distinct.

- A scalar weight `(r,r)` dualizes to `(−r,−r)` and its central character reverses; retaining the original central label fails this test.

### B2.4 Betti coefficients of a full-group representation

Construct `bettiCoefficientLocalSystem`. For a finite-dimensional rational full-group
Gᶜ-representation W and a neat effective arithmetic component `Γ\X`, form the Betti local system
`Γ ∖ (X × W)`, with its arithmetic monodromy. Its associated holomorphic flat bundle is the full-group
automorphic coefficient. When the projected weight is `ℚ`-defined and W has one pure weight, use the rational variation of Hodge structure of
ShimuraData §§3.1–3.6. Treat mixed weights weight by weight. Preserve the
homology/cohomology dual convention and Tate lines in the Siegel specialization.

*Source:* [AG], §3.3, p.418; [Milne90], III §6, pp.61–62, including Remark 6.1 and Theorem 6.2.

The API:

- `bettiCoefficientLocalSystem_monodromy`: On `Γ\X` the local monodromy is the representation of `Γ` on
  W.
- `bettiCoefficientLocalSystem_tensor`: Betti coefficients preserve tensor products and duals.
- `bettiCoefficientLocalSystem_complex_flat`: `W_B⊗_Q O_an` is the full-group coefficient with its
  flat connection.
- `bettiCoefficientLocalSystem_map`: A `full-Gᶜ` representation intertwiner `u:V→W` induces a map of the
  descended Betti local systems with fibre u and preserves monodromy.
- `bettiCoefficientLocalSystem_map_id`: For a fixed admitted input V, the induced map of the
  identity morphism of V is the identity on its output.
- `bettiCoefficientLocalSystem_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B0.1 (`centralSplitQuotient`); B0.2 (`ineffectiveFibreDescent`); B2.2
(`automorphicAnalyticComparison`); ShimuraData Layer 3 (*homogeneous-variation*).
*Lean:* none; specified in the README only.

**Checks.**

- `bettiCoefficientLocalSystem_test_unit` (degenerate): For `W=Q` with trivial action, `W_B` is the
  constant rational local system.
- `bettiCoefficientLocalSystem_test_standard` (compatibility): For the Siegel homology
  representation, `W_B=H₁` of the actual universal abelian family, not `R¹π_*Q` without a dual.
- `bettiCoefficientLocalSystem_test_levi` (non-example): The GL2 upper-triangular Levi character
  `(a,d)↦a` is not the restriction of any one-dimensional GL2 representation (whose character is
  `det^n`). It cannot be supplied as a full-group rank-one Betti input without an extension.

### B2.5 Étale coefficients from the canonical tower

Construct `etaleCoefficientLocalSystem`. Choose a stable `ℤ_ℓ` lattice in a full-group `ℓ`-adic
coefficient and compatible compact `ℓ`-levels. Descend its finite lattice quotients on the arithmetic
étale tower, take the inverse limit and invert `ℓ` to obtain the local system over the canonical
coefficient field. Prove independence of the lattice after inversion and Hecke compatibility.
Arithmetic `ℚ_ℓ(1)` and the geometrically constant rank-one sheaf have different Galois actions.

*Source:* [AG], §3.3 Proposition 3.3.1, pp.418–419; [Milne90], III §6, Remark 6.1, p.62.

The API:

- `etaleCoefficientLocalSystem_finite_level`: The lattice modulo `ℓⁿ` is the finite étale sheaf
  associated to the chosen level quotient action.
- `etaleCoefficientLocalSystem_lattice_independence`: After tensoring with `Q_ℓ` the result is
  independent of a stable lattice through the common rational representation.
- `etaleCoefficientLocalSystem_hecke`: Level and Hecke pullbacks preserve the descended sheaf and
  its canonical arithmetic Galois structure.
- `etaleCoefficientLocalSystem_map`: A continuous `full-Gᶜ Q_ℓ`-representation intertwiner `u:V→W`
  induces the map of the descended arithmetic `ℓ`-adic local systems; it respects the actual
  finite-level tower and arithmetic Galois action.
- `etaleCoefficientLocalSystem_map_id`: For a fixed admitted input V, the induced map of the
  identity morphism of V is the identity on its output.
- `etaleCoefficientLocalSystem_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B0.1 (`centralSplitQuotient`); B1.10 (`principalHeckePullback`); ShimuraVarieties Layer 8 (the
canonical finite étale tower and Hecke spans over the reflex field); ShimuraVarieties Layer 1 (the
analytic tower, level maps and Hecke translations).
*Lean:* none; specified in the README only.

**Checks.**

- `etaleCoefficientLocalSystem_test_unit` (degenerate): The trivial representation gives the
  constant `Q_ℓ` sheaf over E.
- `etaleCoefficientLocalSystem_test_abelian` (compatibility): The symplectic homology coefficient
  gives `(R¹π_*Q_ℓ)∨` with its arithmetic action.
- `etaleCoefficientLocalSystem_test_arithmetic` (non-example): Over Spec Q the étale coefficients
  `Q_ℓ` and `Q_ℓ(1)` have the same one-dimensional geometric/complex realization but different
  arithmetic Galois actions (trivial versus cyclotomic). Forgetting the arithmetic tower/action
  cannot characterize the descended coefficient.

### B2.6 Filtered de Rham full-group coefficients

Construct `filteredDeRhamCoefficient`. Let W be an algebraic full-group Gᶜ-representation over a
number field L containing E. The canonical principal bundle associates to W a locally free de Rham
coefficient with integrable connection and Hodge filtration from `γ`. Prove Griffiths transversality
and the corresponding analytic horizontal-section description. In Hodge type this agrees with the
matching tensor construction in the universal family's relative `H₁,dR`; its regular-singular boundary
extension is a B3 target. Parabolic or Levi-only coefficients use the associated-bundle functor
without this flat structure.

*Source:* [Milne90], III §5, Theorem 5.1, p.61; III §6, pp.61–62; [AG], §3.5, Proposition 3.5.1,
p.421.

The API:

- `filteredDeRhamCoefficient_connection`: `∇²=0` and the connection descends from `Π`.
- `filteredDeRhamCoefficient_filtration`: `F^aW_dR` is the locally direct-summand filtration encoded
  by `γ`.
- `filteredDeRhamCoefficient_transversality`: `∇F^a⊂F^{a−1}⊗Ω¹_S`; tensors and duals carry the induced
  filtered connections.
- `filteredDeRhamCoefficient_map`: A `full-Gᶜ` representation intertwiner induces a horizontal
  filtration-preserving map between the associated de Rham coefficients; its principal-frame map is
  u.
- `filteredDeRhamCoefficient_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `filteredDeRhamCoefficient_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B2.1 (`automorphicVectorBundle`); B1.6 (`hodgeCanonicalPrincipalBundle`); ShimuraData Layer 3
(*homogeneous-variation*); AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge
sequence and Gauss–Manin connection, `AbelianTate`, `exteriorCohomology`).
*Lean:* none; specified in the README only.

**Checks.**

- `filteredDeRhamCoefficient_test_unit` (degenerate): The tensor unit is `(O_S,d)` with its
  weight-zero filtration.
- `filteredDeRhamCoefficient_test_hodge` (compatibility): For `H¹dR` of an abelian family `F¹=e*Ω¹_A/S`
  and the connection is Gauss–Manin.
- `filteredDeRhamCoefficient_test_levi` (non-example): For the GL2 upper-triangular Levi, `(a,d)↦a`
  does not extend to a one-dimensional GL2 representation, since no `a^n d^n` equals a. Its associated
  line cannot be treated as a rank-one input to the full-group filtered connection functor.

### B2.7 Betti, étale and de Rham comparison

Prove `realizationComparison`. For a rational Gᶜ-representation W and an embedding `L↪ℂ`, identify
`W_B⊗ℚ_ℓ≃W_ℓ|S_ℂ` under the algebraic/analytic étale comparison, and `W_B⊗O^an≃W_dR^an` as flat
holomorphic bundles. When the projected weight is `ℚ`-defined and W is pure, these identifications
respect the Hodge filtration and rational variation. Preserve the defining tensors, duals, Tate
twists and Hecke pullbacks. The comparison does not add crystalline or `B_dR` assertions.

*Source:* [AG], Proposition 3.3.1; Proposition 3.5.1, pp.418–422; [Milne90], III §6, pp.61–62.

*Needs:* B2.4 (`bettiCoefficientLocalSystem`); B2.5 (`etaleCoefficientLocalSystem`); B2.6
(`filteredDeRhamCoefficient`); AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge
sequence and Gauss–Manin connection, `AbelianTate`, `exteriorCohomology`).
*Lean:* none; specified in the README only.

**Checks.**

- The standard representation comparison is the actual degree-one family comparison, and tensor
  projectors agree on both sides.

- For the unit representation all three realizations are the constant unit with identity comparison.

- A Tate character changes the filtration degree and its étale cyclotomic action together; the comparison of underlying unfiltered ranks cannot detect a reversed twist.

### B2.8 Tensor and Hecke coherence of coefficients

Prove `coefficientTensorHecke`. Prove coherent compatibility of the associated-coefficient and
full-group realization functors with tensor products, duals, units, coefficient maps and
finite-level/Hecke pullbacks. Include the associativity, unit and composition diagrams. Exactness
here is characteristic-zero representation exactness; an integral lattice requires its own flatness
or projectivity hypotheses.

*Source:* [Milne90], III §3, Lemma 3.1, p.58; III §5, p.61; III §6, p.62.

*Needs:* B2.1 (`automorphicVectorBundle`); B1.10 (`principalHeckePullback`); B2.7
(`realizationComparison`).
*Lean:* none; specified in the README only.

**Checks.**

- The dual of a Hodge-line coefficient is the inverse line; retaining it as the same line would fail
  this theorem.

- The unit constraints commute with every level pullback, and the two maps from a triple tensor to an associated bundle agree.

- A composite pair of coefficient maps gives the composite realized maps in each of Betti, étale and de Rham realizations, including on a Tate line.

### B2.9 The Siegel tautological coefficient sequence

Prove `siegelTautologicalSequence`. On the split opposite flag `P_HT\G` for `GSp_{2g}`, construct the
sequence `0→L_(0,…,0,−1;1)→O⊗St→L_(1,0,…,0;1)→0`. Both outer terms have rank g. Compare it with the
actual Hodge sequence using the opposite/dual conversion and declared Tate character. Its
realization in the solid analytic category is a separately supplied comparison.

*Source:* [BCGP], Remark 3.2.19, p.45; Remark 4.8.1, p.101.

*Needs:* B0.5 (`compactDualCoefficient`); B0.3 (`hodgeParabolicConvention`); B2.3
(`leviHighestWeightConvention`); PELModuli M0 (PEL data and their compact duals).
*Lean:* none; specified in the README only.

**Checks.**

- For `g=2` this is precisely `L_(0,−1;1)→St→L_(1,0;1)`; pulling it to the Hodge–Tate tower requires its
  separately constructed torsor.

- At `g=1` the ranks are `1,2,1`, and the quotient line is the polarized partner with its indicated multiplier.

- For general `g`, summing the ranks gives `2g`; treating either outside term as a scalar line fails when `g>1`.

### Examples

- For the upper-triangular `P ⊂ GL₂`, the character `diag(a, d) ↦ a` gives a rank-one automorphic
  coefficient that is not the restriction of a one-dimensional `GL₂`-representation (`det^n`
  restricts to `aⁿdⁿ`), so the full-group flat-connection construction does not apply (B2.1).
- Over `Spec ℚ` the étale coefficients `ℚ_ℓ` and `ℚ_ℓ(1)` have the same geometric realization and
  different Galois actions (B2.5).
- On the `GSp_{2g}` flag the tautological sequence
  `0 → L_{(0,…,0,−1;1)} → O ⊗ St → L_{(1,0,…,0;1)} → 0` has two outer terms of rank `g` (B2.9).

### Dependencies

Layers B0–B1; ShimuraData Layer 3; ShimuraVarieties Layers 1, 8; AbelianSchemesAndArithmeticModuli A4;
PELModuli M0; AlgebraicModuliForArithmeticGeometry §3.1; TauCetiRoadmap
RepresentationTheory/ClassicalGroups Layer 3.

## Layer B2.general: associated coefficients for general data

For pure data satisfying Milne II (2.1), including the CM-split-centre condition, use the general
canonical principal bundle of Layer B1.general with the same associated-bundle
functor as Layer B2. The new work is descent and conjugation compatibility of the realizations, not
a new representation category.

### B2.general.1 General automorphic coefficient models

Prove `generalAssociatedModel`. Apply the same associated-coefficient functor to B1.general's
canonical principal bundle and compact-dual map. Obtain general-data V(J) over the actual field of
definition, with tensor, dual, pullback, analytic and normalized conjugation compatibilities. This
uses the associated-bundle construction of B0.4, without a second coefficient construction.

*Source:* [Milne90], III Theorem 5.1, p.61.

*Needs:* B1.general.4 (`generalPrincipalModel`); B1.general.5 (`generalCompactDualMap`); B2.1
(`automorphicVectorBundle`); B0.9 (`coefficientGaloisDescent`); B1.general.6
(`generalConjugationCocycle`); B0.4 (`associatedCoefficient`).
*Lean:* none; specified in the README only.

**Checks.**

- This is valid for non-abelian-type data without assigning an abelian motive to J.

- The unit representation gives `O` over the actual coefficient field, not just after complexification.

- Restricting to a Hodge-type subdatum agrees with B2.1, including duals and inverse fibre action.

### B2.general.2 General full-group realizations

Prove `generalFlatRealizations`. For rational full-group coefficients on a general pure datum
satisfying Milne II (2.1), including the CM-split-centre condition,
construct Betti, arithmetic `ℓ`-adic and filtered de Rham realizations using the general canonical
torsor and tower. Give their comparisons and tensor/Hecke maps. No universal abelian family or
family of motives is assumed for the general datum.

*Source:* [Milne90], III §6, pp.61–62; [LanIntro], §5.3, pp.63–64.

*Needs:* B2.general.1 (`generalAssociatedModel`); B1.general.4 (`generalPrincipalModel`); B2.5
(`etaleCoefficientLocalSystem`); B2.7 (`realizationComparison`); ShimuraVarieties §8.22
(canonical towers for general data).
*Lean:* none; specified in the README only.

**Checks.**

- The tensor unit remains constant; a Levi coefficient is not automatically a full-group local
  system.

- On Hodge-type data the full standard coefficient compares with its relative degree-one family realization.

- For a Tate character, the rational Betti rank is one and the filtered de Rham degree is shifted; giving every rank-one coefficient the unit filtration fails.

### B2.general.3 Conjugation of rational realizations

Prove `generalRealizationConjugation`. Transport the general associated bundles and full-group
realizations through normalized conjugation. Check their comparison cocycles, coefficient-field
changes and filtration maps. The rational Betti comparison requires the weight to be `ℚ`-defined; its
absence cannot be repaired by simply forgetting the field of definition.

*Source:* [Milne90], III Theorem 6.2, p.62.

*Needs:* B2.general.2 (`generalFlatRealizations`); B1.general.6 (`generalConjugationCocycle`); B1.8
(`cmPrincipalNormalization`).
*Lean:* none; specified in the README only.

**Checks.**

- The dR conjugation does not alone determine a rational Betti lattice; the extra hypothesis is
  retained.

- Identity conjugation fixes the Betti, étale and de Rham unit and their comparison maps.

- For two conjugations, transporting a Tate coefficient and its dual commutes with evaluation into the unit, after both coefficient-field transports.

### Examples

- Without a `ℚ`-defined weight the rational Betti comparison under conjugation is not available, and
  forgetting the field of definition does not repair it (B2.general.3).

### Dependencies

Layers B1.general and B2; ShimuraVarieties §8.22.

## Layer B3: canonical and subcanonical boundary extensions

Construct coefficients on the degeneration charts supplied by ShimuraCompactifications and glue them
with their normalized boundary frames. Canonical and reduced-boundary extensions behave differently
under refinement; section comparisons use the direct-image theorems of ShimuraCompactifications C3.
Logarithmic connections belong to full-group coefficients. The minimal pushforward is coherent, with
separate positivity requirements for scalar line descent. The last target gives the integral
coefficients on good-prime PEL models used in Layer B5.

### B3.1 Coefficients on degeneration charts

Construct `boundaryCoefficientChart`. On the supplied neat characteristic-zero Hodge/PEL toroidal
chart, describe the coefficient using the actual semi-abelian degeneration or one-motive and its
graded frames. Extend to the specified good integral PEL base only with C5's finite locally free
representations. Identify the relative invariant differentials and coefficient transports on
overlaps; the torus differential is du/u, not the base differential dq/q.

*Source:* [HLTT], Appendix B.8, pp.270–271; [LanIntro], §4.2.7, pp.49–50.

The API:

- `boundaryCoefficientChart_restrict`: Restriction to the open family is the given filtered/graded
  automorphic coefficient.
- `boundaryCoefficientChart_hodge`: The Hodge coefficient is `e*Ω¹_G/SΣ` of the supplied semi-abelian
  extension.
- `boundaryCoefficientChart_transition`: Degeneration-chart transition maps induce tensor-compatible
  frame/coefficient isomorphisms.
- `boundaryCoefficientChart_map`: A morphism of the prescribed boundary representations induces a
  chart-coefficient morphism compatible with the canonical frame and with every chart transition.
- `boundaryCoefficientChart_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `boundaryCoefficientChart_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B2.1 (`automorphicVectorBundle`); ShimuraCompactifications C4 (C4.1 `SemiAbelianScheme`,
C4.7 `UniversalDegeneration`); ShimuraCompactifications C5 (C5.3 `IntegralToroidalModel`,
C5.4 `IntegralToroidalModel.formalCompletion`).
*Lean:* none; specified in the README only.

**Checks.**

- `boundaryCoefficientChart_test_tate` (compatibility): The dimension-one Hodge frame at a
  multiplicative fibre is generated by du/u.
- `boundaryCoefficientChart_test_unit` (degenerate): The trivial coefficient extends to O of each
  cusp chart.
- `boundaryCoefficientChart_test_base` (non-example): The base logarithmic differential dq/q is not
  identified with the relative invariant differential du/u.

### B3.2 The canonical automorphic extension

Construct `canonicalExtension`. Construct the locally free canonical extension `V^can_Σ` on the
specified smooth toroidal model, characterized by canonical boundary frames and the corresponding
growth normalization. Give its normalized coefficient-map and tensor functor. Use the Hodge/abelian
characteristic-zero construction, and the specific C5 good-integral coefficients where stated.
Equality on the open variety cannot characterize an extension, since boundary twists have the same
restriction.

*Source:* [Milne90], V §6, pp.90–91; [HLTT], Appendix B.8, p.271.

The API:

- `canonicalExtension_restrict`: `j*V(J)^can_Σ≃V(J)` with the given canonical open comparison.
- `canonicalExtension_boundary_frame`: On a canonical cusp chart V(J)^can is the locally free
  coefficient of the specified extended frame torsor.
- `canonicalExtension_tensor`: The canonical extension functor preserves tensor products, duals and
  the unit.
- `canonicalExtension_unique`: A chart-normalized extension with these transition maps has a unique
  isomorphism preserving its normalization.
- `canonicalExtension_map`: For a coefficient map induced by an algebraic Pᶜ-representation
  intertwiner, the prescribed canonical chart maps glue to its canonical extension; it restricts to
  the original coefficient map and respects canonical chart normalization. An arbitrary morphism on
  the open without this chart condition is not an admitted input.
- `canonicalExtension_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `canonicalExtension_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the induced map
  of v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field
  and model hypotheses remain fixed.

*Needs:* B3.1 (`boundaryCoefficientChart`); B2.1 (`automorphicVectorBundle`);
ShimuraCompactifications C2 (C2.3 `ToroidalSpace`, C2.6 `ToroidalSpace.smooth_normalCrossings`,
C2.7 `ToroidalSpace.algebraization`); B3.3 (`canonicalExtensionGluing`).
*Lean:* none; specified in the README only.

**Checks.**

- `canonicalExtension_test_unit` (degenerate): The canonical extension of the unit coefficient is
  `O_SΣ`.
- `canonicalExtension_test_hodge` (compatibility): For an elliptic/PEL Hodge coefficient it is the
  semi-abelian invariant-differential bundle.
- `canonicalExtension_test_twist` (non-example): For the rank-one unit coefficient and a
  nonempty effective boundary divisor D, `O(D)` has the same open restriction as `O`, but no
  isomorphism equal to the identity on the open preserves the canonical boundary-frame
  normalization: at a boundary parameter q the two lattices are `q⁻¹O` and `O`.
  The zero coefficient has zero canonical extension and every boundary twist stays zero.

### B3.3 Gluing the canonical extension

Prove `canonicalExtensionGluing`. Glue the chartwise canonical coefficient by the actual
boundary-frame transition isomorphisms. Prove the overlap cocycle, compatibility with the open
bundle and uniqueness among extensions with these normalized charts. Normality of the
compactification alone does not establish the gluing or uniqueness.

*Source:* [Milne90], V §6 Theorem 6.1, p.90.

*Needs:* B3.1 (`boundaryCoefficientChart`); ShimuraCompactifications C2 (C2.3 `ToroidalSpace`,
C2.6 `ToroidalSpace.smooth_normalCrossings`, C2.7 `ToroidalSpace.algebraization`); ShimuraCompactifications C4
(C4.1 `SemiAbelianScheme`, C4.7 `UniversalDegeneration`); AlgebraicModuliForArithmeticGeometry §3.1
`fpqcQuasicoherentDescent`.
*Lean:* none; specified in the README only.

**Checks.**

- A boundary twist cannot be glued in as an alternative normalization merely because it is trivial
  on the open part.

- For the unit coefficient the normalized chart identifications glue to `O` on the toroidal compactification.

- Three intersecting cusp charts give equal maps under both compositions; pairwise isomorphism without that triple-overlap equality is not descent data.

### B3.4 The subcanonical automorphic extension

Construct `subcanonicalExtension`. For the reduced normal-crossings Cartier boundary `i:D↪S_Σ` set
`V^sub_Σ=V^can_Σ⊗I_D=V^can_Σ(−D)`. Construct `0→V^sub_Σ→V^can_Σ→i_*i*V^can_Σ→0` with the applicable
field or relative tensor hypotheses. At a crossing `q₁q₂=0` the cusp ideal is `(q₁q₂)`; vanishing only
in `(q₁,q₂)`, or twisting by 2D, gives a different condition.

*Source:* [LanIntro], §4.2.7, p.50; [HLTT], Appendix B.8, p.271.

The API:

- `subcanonicalExtension_ideal`: `V^sub≃V^can⊗I_D` with D reduced.
- `subcanonicalExtension_inclusion`: `V^sub→V^can` is the kernel of restriction to D.
- `subcanonicalExtension_restrict`: `j*V^sub≃V`, while boundary restriction of its included sections
  is zero.
- `subcanonicalExtension_map`: A coefficient morphism `u^can` induces `u^sub=u^can⊗id_(I_D)`; the
  boundary inclusions commute with `u^sub` and `u^can`.
- `subcanonicalExtension_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `subcanonicalExtension_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the induced
  map of v∘u is the composite of the induced map of v with the induced map of u; all datum, level,
  field and model hypotheses remain fixed.

*Needs:* B3.2 (`canonicalExtension`); ShimuraCompactifications C2 (C2.3 `ToroidalSpace`,
C2.6 `ToroidalSpace.smooth_normalCrossings`, C2.7 `ToroidalSpace.algebraization`).
*Lean:* none; specified in the README only.

**Checks.**

- `subcanonicalExtension_test_empty` (degenerate): For an empty boundary, `V^sub=V^can`.
- `subcanonicalExtension_test_crossing` (computation): On Spec k[q1,q2] with reduced `D=V(q1q2)`, the
  unit subcanonical ideal is (q1q2), so sections vanish on both components.
- `subcanonicalExtension_test_multiplicity` (non-example): For the unit coefficient and a
  nonempty reduced boundary divisor D, `O(−2D)` differs from the subcanonical ideal `O(−D)`
  under the comparison equal to the identity on the open: locally `(q²)` is strictly smaller
  than `(q)`. For empty D both are `O`; zero coefficients give zero in either case.

### B3.5 Canonical coefficients under fan refinement

Prove `refinementCanonicalExtension`. For a smooth fan refinement `f:S_Σ′→S_Σ` identify `f*V^can_Σ`
with `V^can_Σ′` and construct the natural boundary-ideal map `f*V^sub_Σ→V^sub_Σ′`. In general `f*D≥D′`,
so the latter map need not be an isomorphism. Use C3's `f_*O=O` and `f_*I_D′=I_D` to identify
pushforwards and section spaces, with coherent composition laws.

*Source:* [HarrisLoc], §1.4, Theorem 1.4.2 and (1.4.3), p.10.

*Needs:* B3.2 (`canonicalExtension`); B3.4 (`subcanonicalExtension`); ShimuraCompactifications C3
(C3.1 `ToroidalRefinement`, C3.4 `ToroidalRefinement.choice_comparison`, C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`,
C3.9 `ToroidalRefinement.cohomology_iso`).
*Lean:* none; specified in the README only.

**Checks.**

- Blowing up the crossing of two boundary components gives exceptional multiplicity two in `f*D`, but
  multiplicity one in the reduced new boundary.

- For the identity fan map the canonical and boundary maps are identities.

- A pulled-back canonical unit remains `O`, whereas the pushed-forward reduced boundary ideal recovers the original cusp ideal; these are separate assertions.

### B3.6 Fan independence of canonical and cusp sections

Prove `fanIndependentSections`. Use a common smooth projective refinement to identify `H⁰` of
canonical extensions, and separately of subcanonical extensions, for different fans in
characteristic zero. Prove independence of the common refinement and the three-fan cocycle. The
required assertions concern section spaces and the specified ideal pushforward, without a blanket
theorem about higher direct images.

*Source:* [LanIntro], §4.2.7, p.49; [HarrisLoc], §1.4, (1.4.3), pp.10–11.

*Needs:* B3.5 (`refinementCanonicalExtension`); ShimuraCompactifications C3 (C3.1 `ToroidalRefinement`,
C3.4 `ToroidalRefinement.choice_comparison`, C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`, C3.9 `ToroidalRefinement.cohomology_iso`).
*Lean:* none; specified in the README only.

**Checks.**

- The identity refinement yields identity on sections; no fixed fan is declared Hecke-stable.

- Comparing two fans and then reversing the comparison is identity on canonical and cusp sections.

- On a common refinement of three fans, the direct comparison equals the two successive comparisons, including for a section divisible by all boundary coordinates.

### B3.7 The logarithmic full-group extension

Construct `logarithmicConnectionExtension`. For a full-group coefficient with regular singular
connection and unipotent local monodromy, take Deligne's canonical logarithmic extension with
nilpotent residues and the zero-exponent normalization (ComplexComparisonPartII C5.6
`CanonicalLogExtension`). Identify its underlying bundle with the automorphic canonical extension of
B3.2 and retain logarithmic Griffiths transversality. Nonunipotent monodromy requires a specified
residue interval and is outside this nilpotent-residue identification.

*Source:* [LanIntro], §4.2.7, p.50; [Milne90], V §6, proof of Theorem 6.1, p.91.

The API:

- `logarithmicConnectionExtension_restrict`: Restriction gives the original integrable flat
  connection.
- `logarithmicConnectionExtension_residue`: Each boundary residue is nilpotent in the unipotent
  zero-exponent normalization.
- `logarithmicConnectionExtension_tensor`: In that normalization the logarithmic extension preserves
  tensor products and duals, with induced residue actions.
- `logarithmicConnectionExtension_map`: A horizontal map between the admitted regular-singular
  full-group coefficients extends to a horizontal map between their normalized logarithmic
  extensions and commutes with the residues.
- `logarithmicConnectionExtension_map_id`: For a fixed admitted input V, the induced map of the
  identity morphism of V is the identity on its output.
- `logarithmicConnectionExtension_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* AlgebraicModularFormsAndSerreWeights R15.1 (*Integral elliptic logarithmic de Rham
extension*, for the elliptic specialization comparison); B2.6 (`filteredDeRhamCoefficient`); B3.2 (`canonicalExtension`); B3.1
(`boundaryCoefficientChart`); ComplexComparisonPartII C5.6 (`RegularSingular`,
`CanonicalLogExtension`).
*Lean:* none; specified in the README only.

**Checks.**

- `logarithmicConnectionExtension_test_unit` (degenerate): The unit coefficient extends to `(O_SΣ,d)`
  with zero residues.
- `logarithmicConnectionExtension_test_tate` (computation): For a nodal elliptic degeneration the
  rank-two coefficient has nonzero nilpotent monodromy residue, while its determinant has zero
  residue.
- `logarithmicConnectionExtension_test_nonunipotent` (non-example): A rank-one local system with
  monodromy `−1` cannot be put in a nilpotent-residue normalization without a cover or a different
  exponent choice.

### B3.8 Coherent coefficients on the minimal model

Construct `minimalCoherentPushforward`. For the proper toroidal-to-minimal morphism between the
specified Noetherian characteristic-zero models, form `π_*V^can`. Prove coherence, equality of global
section spaces and fan independence using refinements. Do not assume it is a vector bundle at the
minimal boundary; coherent ideals such as (x,y) on a nodal chart distinguish coherence from local
freeness.

*Source:* [LanIntro], §4.2.7, pp.49–50.

The API:

- `minimalCoherentPushforward_sections`: `H⁰(Smin,π_*V^can)=H⁰(SΣ,V^can)`.
- `minimalCoherentPushforward_coherent`: Proper pushforward of the coherent canonical coefficient is
  coherent.
- `minimalCoherentPushforward_refinement`: Compatible fan refinements induce a canonical isomorphism
  of these degree-zero pushforwards.
- `minimalCoherentPushforward_map`: For a morphism `u:F→G` of the admitted canonical or subcanonical
  coefficients, `π_*u` is its coherent sheaf pushforward on the specified minimal model.
- `minimalCoherentPushforward_map_id`: For a fixed admitted input V, the induced map of the identity
  morphism of V is the identity on its output.
- `minimalCoherentPushforward_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the
  induced map of v∘u is the composite of the induced map of v with the induced map of u; all datum,
  level, field and model hypotheses remain fixed.

*Needs:* B3.2 (`canonicalExtension`); B3.5 (`refinementCanonicalExtension`);
ShimuraCompactifications C2 (C2.3 `ToroidalSpace`, C2.6 `ToroidalSpace.smooth_normalCrossings`,
C2.7 `ToroidalSpace.algebraization`); Mathlib `AlgebraicGeometry.Scheme.Modules`; Mathlib
`AlgebraicGeometry.Scheme.Modules.presheaf`; Mathlib `SheafOfModules.sections`; Mathlib
`AlgebraicGeometry.Scheme.Modules.pushforward`; Mathlib
`AlgebraicGeometry.Scheme.Modules.pushforward_obj_obj`; ShimuraVarieties Layer 2 (the Baily–Borel minimal
compactification); ShimuraVarieties Layer 8 (the canonical finite étale tower and Hecke spans over the
reflex field).
*Lean:* none; specified in the README only.

**Checks.**

- `minimalCoherentPushforward_test_proper_open` (degenerate): When the Shimura variety is proper and
  `π` is identity, the minimal coefficient is V.
- `minimalCoherentPushforward_test_rank` (compatibility): On the open S the pushforward restricts to
  V.
- `minimalCoherentPushforward_test_singular` (non-example): On the noetherian nodal affine scheme
  Spec L[x,y]/(xy), the ideal (x,y) is coherent but is not locally free at the origin: its generic
  rank is one and its fibre modulo (x,y) has dimension two. This non-example tests the inference
  from coherent pushforward to local freeness; it does not identify that ideal with every
  automorphic coefficient.

### B3.9 Rationality of the canonical extension

Prove `canonicalRationalDescent`. Descend the chart-normalized canonical and reduced-boundary
subcanonical extensions to their actual coefficient field L, and prove compatibility with field
extension. Transport the boundary ideal and normalized comparison maps in the descent datum. No
all-prime integral extension follows from this rationality statement.

*Source:* [Milne90], V §6 Theorem 6.2, p.91.

*Needs:* B3.2 (`canonicalExtension`); B3.3 (`canonicalExtensionGluing`); B3.4
(`subcanonicalExtension`); B0.9 (`coefficientGaloisDescent`); ShimuraCompactifications C2
(C2.3 `ToroidalSpace`, C2.6 `ToroidalSpace.smooth_normalCrossings`, C2.7 `ToroidalSpace.algebraization`); B2.1
(`automorphicVectorBundle`).
*Lean:* none; specified in the README only.

**Checks.**

- A coefficient over `L⊃E` has its extension over L; the statement does not force its descent to E.

- For the unit, descent gives the structure sheaf and its actual reduced boundary ideal over the original model field.

- A tower of field extensions `L⊂L′⊂L″` gives the same normalized coefficient after either base-change route, including the `−D` maps.

### B3.10 Integral canonical coefficients on good-prime PEL models

Construct `integralLeviCoefficient`. On Lan's smooth projective toroidal compactification
`M^tor_{H,Σ}` of a good-prime PEL moduli problem over `S₀ = Spec O_{F₀,(□)}`, whose boundary `D` is
a simple normal crossings divisor, let `R` be an algebra over `R₀ = O_{F₀′,(□′)}` (a finite
extension of `F₀` over which the Hodge decomposition of `h₀` is defined) and `W` a representation of
the Levi group scheme `M₀` over `R` that is locally free of finite presentation over `R`. Let
`E^can_{M₀}` be the canonical extension of the principal `M₀`-bundle: the scheme of isomorphisms
from `(Lie^∨_{G^∨/M^tor}, O(1))` to `(L₀^∨(1), R(1)) ⊗ O_{M^tor}`, for the tautological semi-abelian
scheme `G` and its dual. Define `Ecan(W) = E^can_{M₀} ×^{M₀} W` (an associated bundle as in B0.4)
and `Esub(W) = Ecan(W) ⊗ I_D`; both are locally free of finite rank. Along the completion at a point
of a minimal-boundary stratum, the pullback of `Ecan(W)` to the formal chart `X` is the pullback of
a canonically determined locally free sheaf `E₀(W)` on the abelian torsor `C`, and `E₀(W)` has a
filtration whose graded pieces are pulled back from the boundary moduli; this filtration need not
descend to `X/Γ`. Consequently the pullbacks of `Ecan(W)(nD′)` and `Esub(W)(nD′)` to the cone chart
`V_σ` are the completed sums of `Ψ(ℓ) ⊗ E₀(W)` over `ℓ ∈ σ^∨(n)` and over `ℓ ∈ σ^∨(n)₊`
respectively, so that `Ecan(W)` is formally canonical and `Esub(W)` formally subcanonical in the
sense of ShimuraCompactifications C5 (C5.21 `IntegralToroidalModel.formallyCanonical`).

*Hypotheses.* The cone decomposition `Σ` is smooth and projective, the level is neat, and `W` is
locally free of finite presentation over `R`; infinite-dimensional or `p`-adic analytic
representations are not included. The filtration statement holds on `C`, not on `X/Γ`.

*Source:* [LanHigher], §2, p.3, and §3, p.5; Proposition 5.6 and proof, pp.11–13; Corollaries
5.8–5.9, p.13.

The API:

- `integralLeviCoefficient_restrict`: the restriction of `Ecan(W)` to `M_H` is the automorphic
  bundle `E_{M₀,R}(W)`.
- `integralLeviCoefficient_sub`: `Esub(W) = Ecan(W) ⊗ I_D` with `I_D` the ideal of the reduced
  boundary.
- `integralLeviCoefficient_map`: an `M₀`-equivariant `R`-linear map `W → W′` induces maps of `Ecan`
  and `Esub`, with identity and composition laws.
- `integralLeviCoefficient_baseChange`: formation commutes with base change along `R → R′`.
- `integralLeviCoefficient_boundary`: the formal-chart description through `E₀(W)` and the completed
  sums over `σ^∨(n)` and `σ^∨(n)₊`.
- `integralLeviCoefficient_charZero`: over a field of characteristic zero `Ecan(W)` and `Esub(W)`
  are the extensions B3.2 and B3.4 of the automorphic bundle of `W`.

*Needs:* B0.4 (`associatedCoefficient`); B3.2 (`canonicalExtension`); B3.4 (`subcanonicalExtension`);
ShimuraCompactifications C5 (C5.3 `IntegralToroidalModel`, C5.4 `IntegralToroidalModel.formalCompletion`,
C5.21 `IntegralToroidalModel.formallyCanonical`); ShimuraCompactifications C4 (C4.1 `SemiAbelianScheme`,
C4.7 `UniversalDegeneration`); ShimuraCompactifications C3 (C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`).
*Lean:* none; specified in the README only.

**Checks.**

- `integralLeviCoefficient_test_unit` (degenerate): `W = R` with trivial action gives
  `Ecan = O_{M^tor}` and `Esub = I_D`.
- `integralLeviCoefficient_test_standard` (computation): for the defining representation
  `W = L₀^∨(1)` of `M₀`, the map `[η, w] ↦ η⁻¹(w)` identifies `Ecan(W)` with `Lie^∨_{G^∨/M^tor}`,
  the cotangent sheaf of the dual tautological semi-abelian scheme along its unit section; its
  restriction to `M_H` is `Lie^∨_{A^∨/M_H}`, not its dual.
- `integralLeviCoefficient_test_twist` (non-example): For the rank-one unit coefficient `W=R`,
  a nonempty effective boundary divisor D′ and `n ≠ 0`, `O(nD′)` has the same restriction to
  `M_H` as `O`, but the local lattices `q⁻ⁿO` and `O` differ under the identity on the open.
  Thus open restriction alone does not determine the normalized extension. The zero
  coefficient remains zero under every twist.
- `integralLeviCoefficient_test_filtration` (non-example): the filtration of `E₀(W)` lives on the
  torsor `C`; asserting that the pullback of `Ecan(W)` to `X/Γ` is filtered with these graded pieces
  is not part of the statement and fails in general.

### Examples

- On `Spec k[q₁, q₂]` with reduced boundary `D = V(q₁q₂)` the subcanonical ideal is `(q₁q₂)`; the
  ideal `(q₁, q₂)` and the twist by `2D` give different conditions (B3.4).
- On the nodal chart `Spec L[x, y]/(xy)` the ideal `(x, y)` is coherent but not locally free at the
  origin: generic rank one, fibre dimension two (B3.8).
- For a nodal elliptic degeneration the rank-two coefficient has nonzero nilpotent residue while its
  determinant has residue zero (B3.7).

### Dependencies

Layers B0–B2; ShimuraCompactifications C2–C5; ShimuraVarieties Layers 2, 8;
AlgebraicModuliForArithmeticGeometry §3.1; HilbertModularVarietiesAndShimuraCurves H2; Mathlib
scheme modules.

## Layer B3.general: general-data boundary extensions

For the Milne II (2.1) data of B1.general, including their CM-split connected centre, use the
general characteristic-zero boundary charts and transported fans. The canonical
normalization, logarithmic comparison and ideal-pushforward rules have the same meaning as in Layer
B3.

### B3.general.1 General canonical automorphic extensions

Prove `generalCanonicalExtension`. Extend the general-data coefficient to the supplied
characteristic-zero general toroidal model, using the general boundary chart and canonical
normalization. Give gluing, rationality, canonical and subcanonical coefficients and their
functorial maps. The construction uses C2.general's boundary data without asserting a universal
abelian degeneration for general Shimura data.

*Source:* [Milne90], V §6 Theorems 6.1–6.2, pp.90–91; [LanIntro], §4.2.7, pp.49–50.

*Needs:* B2.general.1 (`generalAssociatedModel`); B3.2 (`canonicalExtension`); B3.4
(`subcanonicalExtension`); B3.9 (`canonicalRationalDescent`); ShimuraCompactifications C2.general
(C2.general.1 `ToroidalCanonicalModel.general`).
*Lean:* none; specified in the README only.

**Checks.**

- The unit and full-group coefficients have the same normalization as on Hodge-type subdata.

- The unit canonical extension is `O` and its subcanonical extension is `O(−D)`, also outside Hodge type.

- Restricting the general extension to a Hodge-type boundary chart agrees with B3.2 and its frame normalization, rather than with an arbitrary boundary twist.

### B3.general.1a Mixed-boundary coefficients for general data

Construct `generalBoundaryCoefficientComparison`. In characteristic zero, fix a neat general
Shimura datum satisfying Milne II (2.1), including the CM-split-centre condition,
a finite-dimensional algebraic parabolic coefficient over its field of definition,
and the smooth projective toroidal model and mixed-boundary charts of C2.general.1. On each
boundary abelian torsor `C_Φ`, construct the mixed-boundary coefficient `E₀` and identify the
completed pullback of `generalCanonicalExtension` with the completed homogeneous family
`Ψ_Φ(ℓ) ⊗ E₀`. Construct the full stabilizer and representative-change transports with their
cocycles. The completion uses the fan topology and permits infinite supported series.

Construct the boundary reduction of the canonical principal bundle on these charts and
associate the same representation to obtain `E₀`. In complex boundary coordinates verify the canonical growth normalization and
the homogeneous formula, then descend using B3.general.1's rational canonical extension and
faithful completion on the supplied algebraic charts. Prove compatibility with the descended
refinement, level, datum and Hecke maps of C3.general.1 by comparing their associated-torsor maps.
This coefficient comparison is a construction here; it is not a consequence of geometric maps
alone. The coefficient filtration lies on `C_Φ` and need not descend through its stabilizer.

*Source:* [LanHigher], Proposition 5.6, Remark 5.7 and Corollaries 5.8–5.9, pp.11–13
(the general analytic characterization in Remark 5.7); [Milne90], V §6, Theorem 6.1,
pp.90–91, and VI §1.11, p.96 (boundary mixed datum).

*Needs:* B1.general.4–6; B2.general.1 (`generalAssociatedModel`); B3.general.1
(`generalCanonicalExtension`); B3.1 (`boundaryCoefficientChart`); ShimuraCompactifications
C2.general.1 (`ToroidalCanonicalModel.general`), C3.general.1
(`ToroidalCanonicalModel.general_functorial`); ComplexComparisonPartII C2;
AdicSpacesPartIII F0 (coherent completion and its maps).
*Lean:* none; specified in the README only.

**Checks.**

- The tensor unit gives `E₀=O` and the character-sheaf homogeneous decomposition of the boundary
  structure sheaf; a positive Hodge-line power gives the scalar boundary coefficient.
- On a PEL boundary chart, the comparison agrees with B3.1 and Lan's `E₀`, including determinant
  and Tate lines; an arbitrary boundary twist fails this comparison.
- An identity geometric map induces identity coefficient transport; two successive cusp changes
  compose on both the lattice degrees and the coefficient, before taking stabilizer invariants.

### B3.general.2 General logarithmic realization comparison

Prove `generalLogarithmicComparison`. For a general full-group coefficient satisfying regular
singularity and unipotence, compare the canonical extension with the zero-exponent logarithmic
connection extension. Preserve filtration, residues and the normalized general conjugation map.
Regular singularity and Deligne's canonical logarithmic extension are ComplexComparisonPartII C5.6.

*Source:* [Milne90], V §6, Theorem 6.1(c) and proof, p.91; [LanIntro], §4.2.7, p.50.

*Needs:* B2.general.2 (`generalFlatRealizations`); B3.general.1 (`generalCanonicalExtension`); B3.7
(`logarithmicConnectionExtension`); B1.general.6 (`generalConjugationCocycle`);
ShimuraCompactifications C2.general (C2.general.1 `ToroidalCanonicalModel.general`); ComplexComparisonPartII C5.6
(`RegularSingular`, `CanonicalLogExtension`, `deligneRiemannHilbert`).
*Lean:* none; specified in the README only.

**Checks.**

- No assertion that all general-data full-group coefficients arise from a motivic family is needed.

- For the unit the connection is `d` with zero residue; replacing the extension by `O(D)` changes its residue normalization.

- On a punctured disc with unipotent rank-two monodromy the canonical extension has the normalized nilpotent residue. Replacing it by the invariant rank-one stalk loses rank.

### B3.general.3 General boundary and conjugation compatibility

Prove `generalBoundaryFunctoriality`. Prove that general canonical and subcanonical section spaces
and coefficient maps respect compatible fan refinements, compactified Hecke maps and normalized
conjugation. Use common refinements and the reduced-boundary ideal pushforward for subcanonical
sections. Retain the distinction between their pushforward/section comparison and arbitrary
subcanonical pullback isomorphisms.

*Source:* [HarrisLoc], Theorem 1.4.2 and (1.4.3), pp.10–11; [Milne90], V §6, p.91.

*Needs:* B3.general.1 (`generalCanonicalExtension`); B3.general.1a
(`generalBoundaryCoefficientComparison`); B3.5 (`refinementCanonicalExtension`); B3.6
(`fanIndependentSections`); B1.general.6 (`generalConjugationCocycle`); ShimuraCompactifications
C3.general (C3.general.1 `ToroidalCanonicalModel.general_functorial`).
*Lean:* none; specified in the README only.

**Checks.**

- Conjugation acts on the coefficient field and the fan; it is not an endomorphism of one fixed
  compactification.

- An identity refinement and identity conjugation act identically on both section spaces.

- At a two-boundary crossing a blow-up has different exceptional multiplicities for the pulled-back and reduced divisors; section comparison must still use reduced-ideal pushforward.

### Examples

- The unit and full-group coefficients receive the same normalization as on Hodge-type subdata
  (B3.general.1).

### Dependencies

Layers B1.general–B3; ShimuraCompactifications C2.general, C3.general.

## Layer B3.Hilbert: the ramified splitting-model boundary

This layer constructs the full prime-to-`p` Deligne–Pappas family by level
comparison and descent from H2.2–H2.2b, adjoins the Pappas–Rapoport splitting
filtrations and extends the result across the boundary.
It uses C0–C5's toric degeneration and gluing machinery; C6's Dimitrov-model
comparison is not an identification of these models. Fix a totally real `F ≠ ℚ`,
a prime `p` (including `2`), and the ring of integers `O` of a finite extension of
`ℚ_p` containing all embeddings of `F` and the needed prime-to-`p` roots of unity.
Choose an ordering of the embeddings over each residue embedding. Initially
`U=U(N)` with `N≥3` prime to `p`; sufficiently small prime-to-`p` levels and their
unit quotients are obtained below. Tildes retain the polarization data before the
positive-unit quotient.

### B3.Hilbert.0 The open ramified splitting model

Construct `ramifiedHilbertOpenSplittingModel`. First construct the polarized Deligne–Pappas
family at full prime-to-`p` level `U(N)` for every `N≥3`, including `N=3`. Choose an auxiliary
full level `M≥4` divisible by `N` and prime to `p`, with a common refinement of H2.2's
`μ`-level. Use H2.2b's fine presentation to construct that refined full-level moduli scheme,
matching the polarization ideal and different in Diamond's convention. Prove that the
finite level-forgetting group acts freely: an automorphism preserving the polarization and
full level `N≥3` is trivial. Apply H2.2a's finite étale quotient and ample-line descent,
and effective descent of the polarized abelian family, to obtain the full-`U(N)` scheme,
its universal family and a descended ample power. Identify its functor of points with
Diamond's polarized full-level problem before the positive-unit quotient. Prove independence
of `M` and compatibility with tame level changes by common refinements; no inverse of the
level-group order is used. Adjoin, for each residue embedding `τ`, an ordered filtration
`0=F_τ⁰⊂⋯⊂F_τᵉ=ω_τ` by locally direct summands of ranks `0,…,e`, with
`(ϖ−θ_{τ,j}(ϖ))F_τʲ⊂F_τʲ⁻¹`. Represent this filtration moduli problem as a closed subscheme
of the relative flag scheme and construct its projective forgetful map to the Deligne–Pappas
model. Prove it is smooth over `O` of relative dimension `[F:ℚ]`, including at ramified `p=2`,
by the splitting local deformation charts. The ordinary locus has a unique such filtration,
so the forgetful map restricts to an ordinary-locus isomorphism.

Construct the graded Hodge lines `ω_θ=F_τʲ/F_τʲ⁻¹`. Inside `H¹_dR,τ` put
`G_τʲ=(ϖ−θ_{τ,j}(ϖ))⁻¹F_τʲ⁻¹` (preimage under multiplication), prove that
`P_θ=G_τʲ/F_τʲ⁻¹` is locally free of rank two, and define `δ_θ=det P_θ` using the
polarized pairings. Prove base change, integer tensor/dual operations and compatibility
with prime-to-`p` level and isogeny maps. On the generic fibre these are the embedding factors
of H5.3; the integral construction uses filtration quotients.

*Source:* [Diamond21], §2.2, pp.7–8, §§3.1–3.2, pp.9–12;
[Diamond22], §2.3, pp.3–4, §2.7, p.6;
[Stacks, tag 07S7](https://stacks.math.columbia.edu/tag/07S7) (free finite quotient) and
[tag 0CCJ](https://stacks.math.columbia.edu/tag/0CCJ) (effective polarized-family descent).

*Needs:* HilbertModularVarietiesAndShimuraCurves H2.2 (`DelignePappasHilbertModel`),
H2.2a (`finiteEtaleAmpleDescent`), H2.2b (`dpHilbertModel_isScheme`), H2.6 (ordinary locus),
H5.3 (`hodgeSplittingDescent`);
AbelianSchemesAndArithmeticModuli A4 (polarized de Rham Hodge sequence);
AlgebraicModuliForArithmeticGeometry §§1.3, 3.5 (relative flag schemes and polarized descent);
AlgebraicVectorBundles L0A–L0C.
*Lean:* none; specified in the README only.

**Checks.**

- If `p` is unramified, each ordered filtration has length one and the forgetful map is an
  isomorphism; the lines are the integral embedding factors.
- For `F=ℚ(√2)`, `p=2`, the construction stays smooth and retains two graded lines although the
  two embeddings have the same residue; it uses no inverse of `2√2`.
- At full level `N=3`, `p=2`, descend from a common auxiliary full level such as `M=15`
  with `μ_5` level. The resulting universal polarized family exists even though H2.2's
  `μ_N` contract starts at `N≥4`; H4.6's polarization-class quotient is not this family.
- Over the ordinary locus the flag fibre is one point, whereas the whole ramified
  Deligne–Pappas model need not be smooth; its forgetful map is not declared an isomorphism there.

### B3.Hilbert.0a Cusps and stabilizers at prime-to-p level

Construct `ramifiedHilbertCuspData`. For arbitrary totally real `F` and sufficiently small
prime-to-`p` level `U`, classify the cusps by exact sequences `0→I→H→J→0` of projective
`O_F`-modules, with `I,J` invertible, prime-to-`p` polarization orientation and level orbit.
Identify this classification with `B(F)_+\GL₂(A_{F,f})/U` and its polarized version.
Give the map to determinant component classes, the full stabilizers (translations, diagonal
units and finite level actions), and all change-of-representative maps and cocycle laws.

At `U(N)`, identify the character lattice `Λ=d_F⁻¹I⁻¹J` and its trace-dual `J⁻¹I`, with
series degrees in `N⁻¹Λ` and splitting-change pairing `Tr(βNt) mod N`. Prove integrality,
perfectness and naturality of this pairing and compatibility with level change. Compare with
C6.13 `HilbertCusp.Data` and its trace-pairing API on their stated tame-level range, translating
polarization, dual-lattice and level conventions. Construct these data at the additional
prime-to-`p` levels directly from the lattice description and finite fine-level descent.
H3 supplies the polarization/unit quotients, rather than this cusp classification.

*Source:* [Diamond21], §7.1, equation (17) and cusp classification, pp.31–32;
[Diamond22], §2.2, p.3, §§2.3–2.5, pp.3–5.

*Needs:* HilbertModularVarietiesAndShimuraCurves H0.3–H0.5 (trace-dual lattices),
H1 (level and polarization data), H3 (unit/polarization quotients);
ShimuraCompactifications C6.13 (`HilbertCusp.Data`, `HilbertCusp.tracePairing_natural`);
AdelicAlgebraicGroups §§4.2–4.3; SchemeAndStackFoundations Layer 1 (quotient descent).
*Lean:* none; specified in the README only.

**Checks.**

- At full prime-to-`p` level the polarized cusp retains its orientation; taking its positive-unit
  orbit recovers the unpolarized cusp with the actual residual stabilizer.
- For `F=ℚ(√2)`, `p=2`, full fine level `N=3` is allowed although C6-a excludes
  the tame ideal `(3)`; the character lattice retains the inverse-different factor.
- Changing a splitting by `β` multiplies degree `t` by `ζ_N^{−Tr(βNt)}`. At `t=0` this phase
  is one; diagonal-unit coefficient characters remain and cannot be dropped.

### B3.Hilbert.1 Ordinary gluing of the splitting compactifications

Construct `ramifiedHilbertBoundaryModel`. Choose complete smooth projective admissible cusp fans
with compatible invariant integral piecewise-linear polarization functions, using
ShimuraCompactifications C0.15. Starting with H2's open Deligne–Pappas model `Ỹ₋`, construct its boundary
by C0–C4's polarized torus embeddings and semi-abelian degeneration charts:
the toric degeneration satisfies the Deligne–Pappas polarization condition,
and its ordinary charts glue to `Ỹ₋` by that moduli interpretation. Contract
to the normal minimal model using the parallel Hodge section algebra and
proper Stein factorization. In this instance the Hodge positivity argument
uses the finite polarized Hilbert moduli map to Siegel minimal space: the
parallel product of the embedding lines is its pulled-back determinant
Hodge line. Prove finiteness after the cusp contraction by the finite
endomorphism/polarization data and the cusp lattice maps, so that the ample
Siegel Hodge power supplies finite generation and projectivity. These are
the Deligne–Pappas variants of C5's argument, without inverting the different.
Then glue `Ỹ` to the **ordinary** locus of
`Ỹ₋^tor` along `Ỹ^ord ≃ Ỹ₋^ord`; do the same with `Ỹ₋^min`. Here the ordinary
locus includes the whole boundary. Prove that this produces `Ỹ^tor`, `Ỹ^min`
and a projective map `π:Ỹ^tor→Ỹ^min`, restricting to the identity on `Ỹ`.
For these smooth projective admissible fans, every relevant component of `Ỹ^tor` is smooth and
projective over `O`; `Ỹ^min` is normal, flat and projective componentwise.
Its reduced boundary consists of copies of `Spec O` after the chosen base
extension, and is independent of the fan. The universal abelian scheme extends
to a semi-abelian scheme on `Ỹ^tor`.

The fan polarization supplies projectivity of `Ỹ₋^tor` over `O`; the projective flag map then
supplies projectivity of `Ỹ^tor` over `O` and of its contraction to the separated minimal model.
For unrestricted admissible subdivisions assert properness of the refinement map;
projectivity assertions use compatible projective refinements and their polarization functions.

The construction checks the ordinary identification, rather than postulating
it: the ordinary `O_F`-linear Hodge module has its unique ordered splitting
filtration, also for the toric part of the degeneration. The scheme of admissible
filtrations is closed in a relative flag scheme over `Ỹ₋^tor`, hence projective;
on the ordinary locus it has that unique section. This identifies its open and
boundary charts with the asserted gluing and supplies properness, which gluing
alone would not imply. Smoothness is checked on B3.Hilbert.0's open charts and C0's smooth
toric boundary charts. The minimal contraction is formed using C5's parallel
Hodge section algebra and the ordinary identification; normality and
`π_*O=O` follow from the completed charts and Stein factorization. No inverse
of the different or of `p` is introduced.

*Source:* [Diamond22], §§2.3–2.5, pp.3–5, §§2.7–2.9, pp.6–7;
[Diamond21], §7.1, pp.31–33, §7.2, p.34;
[LanPEL], Definition 7.3.1.3, Proposition 7.3.1.4, pp.566–567, Theorem 7.3.3.4, p.571.

The API:

- `ramifiedHilbertBoundaryModel_open`: the open piece is B3.Hilbert.0's splitting model,
  and its map to the Deligne–Pappas model is the forgetful map.
- `ramifiedHilbertBoundaryModel_ordinary`: the forgetful map is an isomorphism
  on the ordinary loci, including all boundary strata.
- `ramifiedHilbertBoundaryModel_semiabelian`: restriction of the extended
  family is the universal family and its cusp uniformization is the Tate
  semi-abelian degeneration with the given `O_F`-action and polarization.
- `ramifiedHilbertBoundaryModel_refine`: a fan subdivision gives a proper map,
  the same minimal model and the coefficient/refinement comparisons of C3 on
  these actual charts.
- `ramifiedHilbertBoundaryModel_level`: compatible fine level maps and
  prime-to-`p` isogenies extend, after refining fans; identities and compositions
  agree on the dense open and hence on the normal compactification.

*Needs:* B3.Hilbert.0 (`ramifiedHilbertOpenSplittingModel`), B3.Hilbert.0a
(`ramifiedHilbertCuspData`); HilbertModularVarietiesAndShimuraCurves H2.2
(Deligne–Pappas family), H3 (polarization/unit quotients);
ShimuraCompactifications C0–C2 (torus embeddings, gluing and algebraization),
C0.15 (`ArithmeticFan.exists_smoothProjective_refinement`, including polarization functions),
C3 (C3.1 `ToroidalRefinement`, C3.3 `ToroidalHeckeSpan`), C4 (C4.1 `SemiAbelianScheme`,
C4.7 `UniversalDegeneration`), C5 (C5.13 `IntegralToroidalModel.hodgeLine_semiample`,
C5.14 `IntegralToroidalModel.hodgeSectionAlgebra_fg`, C5.17 `IntegralMinimalModel.hodgeLine_ample`);
SchemeAndStackFoundations Layer 4 (§4.9).
*Lean:* none; specified in the README only.

**Checks.**

- Over the ordinary open the added filtration is unique, so the glued model
  has one copy of that open, rather than a flag-variety fibre over each point.
- At a maximal cusp the semi-abelian fibre is the torus with the specified
  character lattice; its Hasse invariant is a unit, also at `p=2`.
- Subdividing a two-dimensional cusp cone changes its toroidal exceptional
  divisors but leaves its minimal cusp `Spec O` fixed. Identifying the toroidal
  and minimal models would fail this check.
- On the quadrant subdivided by `(1,1)`, `pol(x,y)=x+y+min(x,y)` is integral and has the
  prescribed cones as its linearity domains. Its values `1,1,3` on `(1,0),(0,1),(1,1)` have
  C0.15's superadditive sign. Smoothness of the two cones alone supplies no polarization data.

### B3.Hilbert.2 Splitting-filtration lines on degeneration charts

Construct `ramifiedBoundaryCoefficientLines`. For a cusp
`0→I→H→J→0`, with its orientation and level, put `Λ=d_F⁻¹ I⁻¹J`.
On the formal torus-embedding cover `Ŝ_c`, the Tate family is the degeneration
of `(d_F⁻¹ I ⊗ G_m)/q^{d_F⁻¹J}`. Its invariant differentials identify with
`I⁻¹⊗O_{Ŝ_c}`. Extend the ordered B3.Hilbert.0 filtration on these differentials and the
dual family: if `τ` lies below the ordered embeddings `θ_{τ,1},…,θ_{τ,e}`,
its filtration is given by the successive factors of the uniformizer
polynomial, not by integral eigenspace idempotents. Its graded lines and their
determinant partners, denoted `ω_θ^tor, δ_θ^tor`, restrict to B3.Hilbert.0's lines and have
canonical cusp descriptions `(I⁻¹)_θ` and `(d_F(IJ)⁻¹)_θ` respectively.
Here `d_F(IJ)⁻¹` means **the different multiplied by `(IJ)⁻¹`**.
For arbitrary integer vectors `k,m`, the tensor product of these lines and
duals has cusp coefficient line
`D_{k,m,c}=⊗_θ (I⁻¹)_θ^{k_θ} ⊗ (d_F(IJ)⁻¹)_θ^{m_θ}` over `O`.

Define the maps on the torus chart first; on the overlap with the open
abelian family they are the invariant-differential and polarization maps.
Faithful restriction on the normal charts then glues them. In the residue
field, the `θ_{τ,j}` factor of an invertible `O_F`-module `L` is identified
with the corresponding successive `𝔭`-power quotient of `L`, tensored via
`τ`; distinct embeddings may coincide in the residue field without merging
these graded lines. The construction is formally canonical and survives
arbitrary Noetherian `O`-algebra coefficients, since the lines and their chart
identifications are locally free before base change.

*Source:* [Diamond21], §7.1, equations (17)–(20), pp.31–33,
Proposition 7.1.1, p.34, and §7.2, equation (26), p.37;
[Diamond22], §2.9, p.7, §6.2, pp.24–25.

The API:

- `ramifiedBoundaryCoefficientLines_restrict`: the open restriction is the
  B3.Hilbert.0 splitting-filtration coefficient, with its chosen ordering.
- `ramifiedBoundaryCoefficientLines_tate`: the completed coefficient is
  `D_{k,m,c}⊗O_{Ŝ_c}`, including both different and determinant factors.
- `ramifiedBoundaryCoefficientLines_tensor`: integer addition, duals and the
  tensor unit agree with the canonical chart trivializations.
- `ramifiedBoundaryCoefficientLines_baseChange`: base change commutes with
  the coefficient, filtration quotients and chart isomorphisms.
- `ramifiedBoundaryCoefficientLines_transport`: the isogeny/level maps of
  B3.Hilbert.1 act by their actual maps on `I,J` and the polarization;
  these maps compose and preserve the filtration order.

*Needs:* B3.Hilbert.1 (`ramifiedHilbertBoundaryModel`);
B3.Hilbert.0 (ordered splitting lines), B3.Hilbert.0a (cusp lattices and transport);
HilbertModularVarietiesAndShimuraCurves H3 (polarization/unit quotients); B0.4 (`associatedCoefficient`); B3.1
(`boundaryCoefficientChart`); AlgebraicVectorBundles L0A–L0C (tensor, dual,
pullback and determinant of finite locally free sheaves).
*Lean:* none; specified in the README only.

**Checks.**

- At `k=m=0`, the coefficient and all chart maps are the structure sheaf and
  its identity, with no residual different factor.
- For `F=ℚ(√2)` at `p=2`, the two embeddings of `√2` coincide modulo the
  maximal ideal. On `O[u]/(u²−2)` the ordered first line can be generated by
  `u+√2`, and its quotient is another rank-one `O`-module. Reducing the two
  graded lines retains two lines; using the nonintegral eigenspace
  projectors, whose denominators involve `2√2`, fails.
- A determinant exponent `m_θ=1`, with all other exponents zero, gives
  `(d_F(IJ)⁻¹)_θ`, not `(d_F IJ)⁻¹_θ`. These differ at a ramified prime.
- Taking all `k_θ=1`, `m=0`, gives the determinant **over the base ring** of
  the rank-`[F:ℚ]` differential module, consistent with B4.15.

### B3.Hilbert.3 Completed cusps, units and the minimal coefficient

Construct `ramifiedHilbertFormalDescent`. With B3.Hilbert.1–2's model and
lines, choose a splitting of `H` and `ζ_N`. The formal torus-embedding cover
has section ring `O[[q^t]]_{t∈N⁻¹Λ_+∪{0}}`, with the fan topology. Completing
and gluing over the fan gives this completed series ring, rather than its
finite-support monoid algebra. The toroidal cusp is the quotient by the
specified cusp-unit lattice. The completion of the minimal coefficient
`j̃_*Ã_{k,m,R}=π_*Ã^tor_{k,m,R}` is its `D_{k,m,c}`-valued invariant series.
Prove coherence for every Noetherian `O`-algebra `R` by the formal coefficient
calculation and Koecher argument on these charts.

Retain the full cusp stabilizer. In the conventions of [Diamond21], for
`γ=(α β;0 δ)∈Γ_{c,U}`, the coefficient relation is
`r_{α⁻¹δ t}=ζ_N^{−Tr_{F/ℚ}(β α⁻¹ N t)} χ_m(α)χ_{k+m}(δ) r_t`.
Here the exponent means the integer `Tr(β α⁻¹Nt)` modulo `N`; for
a splitting change by `β`, the level pairing is `Tr(βNt) mod N`. In particular the
fine polarized subgroup gives `r_{α²t}=χ_k(α)r_t`; the positive-unit quotient
adds its determinant-character relation. Changing the splitting by `β`
multiplies `q^t` by `ζ_N^{−Tr(βNt)}` in this indexing. Give the cocycle and
representative-change isomorphisms, so these are descriptions of one sheaf,
not coordinate-dependent scalar expansions.

For sufficiently small prime-to-`p U` with
`χ_{k+2m,R}|_{O_F^×∩U}=1`, take the positive-unit quotient and then the finite
normal fine-level quotient. This gives the coefficient on `Y_R`, its coherent
minimal extension, and the same completed chart relation. Descent is an
equalizer of transported sections; no division by a group order is used.
The reduced toroidal boundary ideal consists locally of monomials vanishing
on every boundary ray. On a complete Hilbert cusp fan its global series have
precisely zero constant term: nonzero totally positive degrees pair
positively with every ray. The boundary quotient is `O`-flat on the smooth
toric cover, so the coefficient/boundary sequence remains exact after
arbitrary coefficient base change; taking invariants uses only left exactness.

*Source:* [Diamond21], equations (18), (20)–(23), pp.32–36, and
Proposition 7.2.1, p.37; [Diamond22], §§2.9–2.10, pp.7–8, §6.3, p.26.

The API:

- `ramifiedHilbertFormalDescent_completed`: the minimal completed module
  embeds into the stated line-valued series as exactly the transported
  invariant families; it is not asserted to be an invertible minimal sheaf.
- `ramifiedHilbertFormalDescent_changeSplitting`: the phase formula above
  intertwines the two formal restrictions and fixes the constant coefficient.
- `ramifiedHilbertFormalDescent_units`: the full `Γ_{c,U}` relation, including
  both weight characters, is equivalent to descent.
- `ramifiedHilbertFormalDescent_refine`: formal restriction commutes with
  fan subdivision, fine-level transport and prime-to-`p` isogeny maps.
- `ramifiedHilbertFormalDescent_boundary`: the completed subcanonical
  coefficient is the zero-constant submodule, with the indicated flat
  boundary sequence before taking invariants.
- `ramifiedHilbertFormalDescent_coefficients`: coefficient maps commute
  with restriction and coefficient extraction; no arbitrary-base-change
  isomorphism for invariant modules is asserted.

*Needs:* B3.Hilbert.0a (`ramifiedHilbertCuspData`), B3.Hilbert.1–2; ShimuraCompactifications C0 (completed torus charts),
C3 (C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`), C5 (formal functions and the Koecher argument
for formally canonical coefficients); AdicSpacesPartIII F0 (completion);
SchemeAndStackFoundations §§1.1, 1.23 (quotient descent), §4.9 (proper formal functions);
HilbertModularVarietiesAndShimuraCurves H3 (unit and level quotients).
*Lean:* none; specified in the README only.

**Checks.**

- The series `Σ_{n≥0}q^{nt}` on a fixed cone chart is a valid completed local
  section for a positive `t`; a finite-support definition loses it. This is
  a local test and does not assert invariance under the global cusp units.
- At `t=0` the splitting phase is `1`, but the stabilizer still acts by
  `χ_m(α)χ_{k+m}(δ)`. A scalar constant in a nontrivial coefficient line
  cannot be declared invariant automatically.
- With zero weights, the subgroup relation is
  `r_{α²t}=r_t`; a single nonzero coefficient at a degree moved by `α²` fails
  descent. With nonzero `k`, replacing this by the same unweighted relation
  also fails.
- On a smooth cone with boundary coordinates `x,y`, the reduced boundary
  ideal is `(xy)`, not `(x,y)`. Its quotient is flat over `O`, and a strictly
  positive Hilbert degree lies in that ideal on every such chart.

### B3.Hilbert.4 Cusps detecting the residue components

Prove `ramifiedHilbertCuspDetection`. For fine prime-to-`p` level, a set of
cusps whose determinants cover `F_+^×\A_{F,f}^×/det U` meets every geometric
irreducible component of every fibre needed in the expansion principle,
including fibres over characteristic `2` at a ramified prime. Use the smooth
projective toroidal model of B3.Hilbert.1 with its chosen complete smooth projective fans and
polarization functions; its geometric connected components
are geometrically integral, have constant labels given by those determinant
classes, and each has boundary cusps. Formal restriction of a section of a
locally free coefficient to the selected completed cusp neighbourhoods is
therefore jointly faithful on each geometric fibre. The same assertion over
an integral coefficient base follows by localization and the Krull
intersection argument of B5.4; finite prime filtrations and B5.5 then give the
arbitrary-coefficient assertion of B5.17. The latter two steps are consumers,
not prerequisites of this geometric target.

To prove the geometric claim, compute the generic components by the Hilbert
adelic description and strong approximation for `Res SL₂`. The cusps map onto
the same determinant classes. After the chosen component base extension,
smoothness makes the closures of the generic components open and closed,
flat and proper over the normal DVR `O`. Each has generic global functions
equal to `Frac O`. Stein factorization therefore gives `f_*O=O` and
geometrically connected fibres. Smooth connected fibres are irreducible, since
irreducible components of a regular scheme are disjoint. Each chosen cusp
extends over `O` on the proper model and hence meets the corresponding
residue fibre. The boundary lies in the ordinary locus where the splitting
and Deligne–Pappas charts agree. This uses neither a characteristic-zero-only
completion nor an assumption that every Iwahori component contains a cusp.

*Source:* [Diamond22], §§2.7–2.10, pp.6–8, Proposition 6.2.1 and its proof
and warning, p.25; [Diamond21], Proposition 7.2.2, p.37;
[StacksConnected], Lemma 37.53.6, tag 0AY8. The smooth-proper Stein
argument supplies the fibrewise form used here.

*Needs:* B3.Hilbert.1, B3.Hilbert.3; HilbertModularVarietiesAndShimuraCurves
H1 (adelic components); B3.Hilbert.0a (`ramifiedHilbertCuspData`); AdelicAlgebraicGroups §4.2 (strong
approximation), §4.3 (arithmetic quotients); SchemeAndStackFoundations Layer 4
(§4.9); ShimuraCompactifications C0–C2 (boundary incidence).
*Lean:* none; specified in the README only.

**Checks.**

- On a component with one selected cusp, an identically zero completed
  restriction forces a section to vanish on the integral geometric fibre.
- For two determinant classes, choosing cusps in only one leaves the other
  component undetected; connectedness of the union cannot replace the labels.
- A fine prime-to-`2` level for `ℚ(√2)` retains the same cusp detection in its
  characteristic-`2` fibre. The assertion excludes Iwahori level, whose
  special fibre can have a component disjoint from all cusps.

### Examples

At a ramified quadratic prime the ordered filtration has two rank-one
successive quotients even when both embeddings have the same residue.
At a cusp the coefficient is a tensor of actual fractional-ideal lines;
the different and the cusp-unit characters survive reduction. These two
facts prevent replacing the construction by the split characteristic-zero
Hodge bundle or by scalar series.

### Dependencies

B0.4, B3.1; HilbertModularVarietiesAndShimuraCurves H1–H3;
ShimuraCompactifications C0–C5; SchemeAndStackFoundations Layers 1–2, 4;
AdicSpacesPartIII F0; AdelicAlgebraicGroups §§4.2–4.3; AlgebraicVectorBundles L0A–L0C.

## Layer B3.log: horizontal logarithmic periods and support comparisons

This layer supplies the horizontal boundary theory needed here, beyond the
vertical semistable model-period complexes in PadicHodgeTheory. Let `k/ℚ_p`
be finite, `C=Ĉk̄`, `X/k` smooth and proper and `D=∪D_i` a strict normal
crossings divisor; put `U=X−D`. Use the associated fs log structure on
`X^an`. A toroidal Shimura model is taken at neat level with smooth fans;
passing to such a model and comparing refinements is part of B3.5.
All coefficient representations are finite-dimensional and algebraic.

### B3.log.1 The boundary Kummer sites and their perfectoid basis

Construct `horizontalLogSites` on PrismaticCohomologyPartIV §8.60's shared carriers for a smooth
pair and its closed strata. Use `TauCeti.LogAdic.LogStructure`, `logification`, `logPullback` and
`IntegralChart` for the divisorial structure and its pullback to each stratum. These spaces are
locally noetherian and fs, so their Kummer-étale category, topology and finite-free local systems
are precisely `TauCeti.LogAdic.KummerEtaleSite` and the supplied
`NoetherianFsLogAdicSpace.kummerSite`, `.kummerTopology`, `.LocalSystem` interfaces.
Construct the additional pro-Kummer-étale site as the corresponding locally pro-Kummer-étale
limit site, with its map `ν` to the Kummer-étale site. Locally use charts
`ℕ^r→O_X`, `e_i↦T_i`, for the boundary, and étale smooth coordinates in the
remaining directions. In boundary directions use all positive root orders,
indexed by divisibility, with chart monoids `(1/n)ℕ^r` and colimit `ℚ_≥0^r`.
Adjoin roots of invertible smooth coordinates after localizing them, over
the cyclotomic perfectoid base. These pro-Kummer presentations are log
affinoid perfectoid: their colimit monoids are divisible by every positive
integer. Distinguish the site object `W=lim W_n` from its associated completed
affinoid perfectoid space `Ŵ=Spa(R,R⁺)`. The `p`-power subtower supplies the
perfectoid-ring calculation; pass to all roots by prime-to-`p` Kummer
extensions and completion. Use the all-root presentations for the basis,
Kummer strictification, acyclicity and descent.

Use the supplied fs fibre products; prove the additional pro-site basis, fibre-product and descent
properties from saturated monoid pushouts, ordinary adic étale descent and the toric completed-ring calculation.
The completed structure sheaf on such a basis object `W` has value its
perfectoid ring `R`; `H^{>0}(W,Ô⁺/p)` is almost zero and
`H^{>0}(W,Ô)=0`. Prove `ν_*Ô=O` on the arithmetic Kummer-étale site by the
root-tower continuous-cohomology calculation and étale descent. This is
function descent in the horizontal logarithmic setting, not just the
ordinary pro-étale theorem on `U`.

*Source:* [DLLZ], §§2.2–2.3, pp.7–20, §§3.1–3.3, pp.21–39,
§§5.1–5.4, pp.70–81, especially Definition 5.3.1(4), Lemma 5.3.4 and
Remark 5.3.5, pp.74–75, and Theorems 5.4.3–5.4.4, pp.79–81;
[DLLZRH], §2.3, pp.14–20.

The API:

- `horizontalLogSites_forgetBoundary`: for `D=∅` recover the ordinary étale
  and pro-étale sites, structure sheaves and projection.
- `horizontalLogSites_rootChart`: evaluation on a chart gives the completed
  monoid algebra with the specified roots and cyclotomic Galois action.
- `horizontalLogSites_pullback`: a morphism of smooth pairs gives compatible
  site/structure-sheaf maps; identities and compositions agree.
- `horizontalLogSites_descent`: finite locally free coefficients and their
  morphisms descend on the stated basis; completed functions have the
  acyclicity and `ν_*Ô=O` properties above.

*Needs:* PrismaticCohomologyPartIV §8.60 (shared log-adic structures, logification, pullback,
integral fs charts, Kummer-étale site, topology and finite-free local systems);
ComplexComparisonPartII C5.5 (log differentials and the algebraic/analytic log comparison);
AdicEtaleGeometry §§A1.5–A1.7, A1.12 (étale sites, descent and the pro-étale site); AdicSpacesPartII Layer R0 and AdicSpacesPartIII Layer R2
(analytic charts); PerfectoidSpaces P0–P4 (almost modules, completed root algebras, tilting,
almost purity), P7.11–P7.12 (limits and gluing), P6.8, P7.16
(profinite products and the pro-étale site); PadicHodgeTheory §2.1
(completed pro-étale structure sheaves).
*Lean:* none; specified in the README only.

**Checks.**

- With `D=∅`, the Kummer-étale site is the supplied `NoetherianFsLogAdicSpace.trivialLogSite`,
  and its pro-site is the ordinary pro-étale site; no boundary root coordinates or extra inertia remain.
- On the pair `(disc,{T=0})`, `T↦S^n` is Kummer-étale on the log sites
  although its underlying map is ramified at zero. An ordinary étale-only
  site rejects this required cover.
- With one boundary coordinate, `ℕ[1/p]` is not divisible by a prime `ℓ≠p`;
  the `p`-power presentation alone fails the log affinoid perfectoid condition,
  whereas the all-root colimit `ℚ_≥0` satisfies it.
- On two boundary coordinates the root inertia is the product of two
  cyclotomic root directions. Saturating a monoid pushout is necessary:
  identifying roots without saturation can produce torsion or extra components.
- At a boundary stratum `T=0`, the root extension retains its log direction;
  replacing the stratum's log structure by the trivial one loses it.

### B3.log.2 Canonical Kummer coefficient systems

Construct `canonicalKummerCoefficient`. For an algebraic representation `V`
of the coefficient group over a finite `p`-adic field `L`, choose a stable
lattice at a sufficiently small `K_p` and use B2.5's canonical étale tower on
`U`. Extend every finite quotient of that lattice by `j_{két,*}` to `X_{két}`,
then form the compatible `ℤ_p`-system and its rational pro-Kummer pullback.
Prove the extensions are local systems and `R^{>0}j_{két,*}=0` for the finite
quotients. The normal finite covers trivializing each quotient extend by
the Kummer version of Abhyankar's lemma; after a root cover they are ordinary
étale and the assertion reduces to purity of a constant sheaf. Thus the
rational object is independent of the lattice and restricts to B2.5 on `U`.
Its cohomology agrees with the ordinary étale cohomology of `U` by the site
comparison, with derived inverse limits taken before rationalization.

For the neat toroidal Shimura pair, prove geometric boundary monodromy is
unipotent: on a cusp it is the image in `V` of the unipotent radical of the
rational boundary group. The toric generators have commuting nilpotent
logarithms, matching the residues of B3.7. This assertion concerns geometric
boundary inertia; it does not assert that arithmetic Galois acts unipotently.

*Source:* [DLLZ], Theorem 4.6.1 and Corollary 4.6.7, pp.68–69,
Corollaries 6.3.4–6.3.5 and Lemma 6.3.6, pp.88–89; [DLLZRH], §5.2, pp.52–56;
[RC22], §4.2, pp.21–23.

The API:

- `canonicalKummerCoefficient_restrict`: recover the original étale
  representation, its lattice quotients and transition maps on `U`.
- `canonicalKummerCoefficient_tensor`: the rational construction preserves
  tensor products, duals and the unit; it is exact and faithful.
- `canonicalKummerCoefficient_level`: coefficient maps, level pullback and
  prime-to-`p` Hecke pullback commute with the extension and compose.
- `canonicalKummerCoefficient_monodromy`: the cusp inertia logarithms are
  nilpotent and their images under tensor maps agree with boundary residues.
- `canonicalKummerCoefficient_cohomology`: the finite-quotient comparison
  and its derived inverse-limit form identify cohomology on `U` and `X_{két}`.

*Needs:* B2.5 (`etaleCoefficientLocalSystem`), B2.8 (`coefficientTensorHecke`),
B3.7 (`logarithmicConnectionExtension`); B3.log.1; ShimuraCompactifications
C1 (cusp unipotent groups), C4 (degeneration monodromy);
AdicEtaleGeometry §§A1.2–A1.7 (finite étale charts and descent);
ClassicalAdicEtaleCohomology Layer 8, §8.2 (proper algebraic/analytic
comparison, applied to the normalized finite covers); SchemeAndStackFoundations
Layer 2 (finite constructible algebraic cohomology);
EnhancedDerivedSheaves §E2:towers.1 (derived limits).
*Lean:* none; specified in the README only.

**Checks.**

- The unit representation extends to the constant rational sheaf on the
  Kummer site, including its boundary log points.
- For a Tate elliptic degeneration, geometric inertia is a nontrivial
  unipotent shear on the standard coefficient. Extending by the ordinary
  invariant stalk would lose rank; the Kummer local system retains rank two.
- Changing a lattice to `p` times that lattice changes the integral system
  but gives the same rational coefficient and comparison maps.
- A nontrivial finite boundary character can extend on the Kummer site, but
  does not satisfy the unipotent subcategory used by B3.log.3 below.

### B3.log.3 Logarithmic periods and the unipotent tensor comparison

Construct `unipotentLogPeriodComparison`. On B3.log.1's basis form `A_inf`
from `Ô^{♭+}`, `B_dR⁺` by completion along `ker θ`, and `B_dR=B_dR⁺[1/t]`.
Construct the structural `O B_{dR,log}` by adjoining the logarithmic boundary
ratios and completing for the period filtration. On a root chart it has the
formal-power-series description over `B_dR⁺` in the logarithmic coordinate
differences; its connection differentiates those variables into `dlog T_i`
(and the ordinary smooth coordinate differentials). Prove the **filtered**
logarithmic Poincaré lemma and `gr^a B_dR=Ô(a)`. These are horizontal-log
extensions of the period rings and local Poincaré lemma imported below.

For a de Rham rational local system with unipotent geometric boundary
monodromy define
`D_{dR,log}(L)=μ_*(L̂⊗O B_{dR,log})` on `X^an`.
Prove this is a filtered locally free module of the full rank, with integrable
log connection, Griffiths transversality and nilpotent residues, and that the
natural period comparison is a filtered horizontal isomorphism after tensoring
with `O B_{dR,log}`. Prove exact tensor, dual and pullback compatibility on this
subcategory. On root charts, use the local period Poincaré lemma, the
Tate–Sen decompletion calculation for the cyclotomic direction, and the
nilpotent boundary logarithms; these give coherence and descent of the
filtered module. Nilpotence removes the residue-exponent carries that would
otherwise obstruct tensor compatibility.

For B3.log.2's Hodge-type automorphic coefficients identify this object with
B2.6/B3.7's canonical filtered log extension. Prove the identification first
for relative `H¹` of the universal abelian family using the relative de Rham
comparison on the open and the nilpotent-residue extension on the cusp
uniformization, then for tensors, duals and their algebraic direct summands.
Characteristic zero and a faithful tensor representation of `G` give all
algebraic coefficients. This route requires no general exceptional-type
p-adic Riemann–Hilbert identification.

*Source:* [DLLZRH], §2.3, Proposition 2.3.15, pp.18–19, §2.4, pp.20–22,
Theorems 3.2.7 and 3.2.12, pp.26–27, §§3.3–3.5, pp.27–41,
and Theorem 5.3.1, pp.56–57, with its Hodge-type proof in §5.5, pp.62–64;
[RC22], equation (4.1), p.22.

The API:

- `unipotentLogPeriodComparison_poincare`: the horizontal period sheaf and
  its filtered log de Rham resolution are quasi-isomorphic.
- `unipotentLogPeriodComparison_associated`: the associated filtered
  bundle is the full-rank canonical nilpotent-residue extension above.
- `unipotentLogPeriodComparison_tensor`: the unit, tensors, duals and
  direct-summand projectors commute with comparison, including filtrations.
- `unipotentLogPeriodComparison_graded`: on the pro-Kummer site the
  Hodge–Tate filtration of `L̂⊗Ô` has graded piece
  `gr^j D_{dR,log}(L)⊗Ô(−j)`.
- `unipotentLogPeriodComparison_functorial`: maps of admitted pairs and
  coefficients commute with the construction; for finite étale maps the
  comparison also commutes with trace, checked after local trivialization.

*Needs:* B3.log.1–2; B1.1, B1.4 (faithful tensors and frame torsors);
B2.6–B2.8; B3.7; PadicHodgeTheory §§2.1–2.4
(completed structure sheaves, periods on affinoid perfectoids and profinite products,
structural de Rham sheaves, rational acyclicity, Poincaré and Faltings),
§0.1 (the Tate–Sen input from PadicPeriodRings §§1.1–1.5 and 2),
§§7.1–7.3 (relative `B_dR⁺` local systems, filtered connections and the relative
Hodge–Tate filtration, including its first step); ComplexComparisonPartII C5.6
(nilpotent-residue canonical extensions); EnhancedDerivedSheaves Layers E1, E2:towers
(derived sheaf descent and inverse limits); DerivedDeRhamCohomology §§1.14–1.22
(filtered derived categories, filtered completion and completed tensors).
*Lean:* none; specified in the README only.

**Checks.**

- For the unit local system the bundle is `(O_X,d,Fil⁰=O_X)`, the boundary
  residues vanish, and the associated period map is the unit isomorphism.
- For the Tate shear with inertia logarithm `N²=0`, the log extension has
  nilpotent residue given by that monodromy normalization; discarding `N`
  would give the wrong connection even though the ranks agree.
- `ℚ_p(1)` has Hodge filtration in degree `−1`; the graded comparison
  supplies `Ô(1)`. Using `Ô(−1)` reverses the Tate convention.
- Two rank-one boundary systems with residue exponents `3/4` have tensor
  exponent normalized to `1/2`, whereas tensoring their canonical lattices
  adds to `3/2`. This excludes a tensor assertion for all quasi-unipotent
  systems; the unipotence hypothesis is essential.

### B3.log.4 Ordinary logarithmic cohomology comparison

Prove `ordinaryLogCohomologyComparison`. For the proper smooth pair and a
stable lattice in an admitted de Rham, unipotent local system `L`, construct
canonical filtered isomorphisms
`H^i_et(U_k̄,L)⊗B_dR ≃ H^i(X,DR_log(D_{dR,log}(L)))⊗_k B_dR`
after rationalization. Prove the log Hodge–de Rham spectral sequence
degenerates at `E₁` and its degree-zero period graded comparison is
`H^i_et(U_k̄,L)⊗C ≃ ⊕_a H^i(X,gr^a DR_log(D_{dR,log}(L)))⊗_k C(−a)`.
Here the left side is also the Kummer cohomology of B3.log.2, not the étale
cohomology of the compactification with an ordinary rank-deficient extension.
All maps are `Gal(k̄/k)`-equivariant; automorphic coefficients retain their
finite coefficient field, with scalar extensions along the chosen embedding.

Prove the log primitive comparison first, modulo `p^n`, on the root basis:
use almost purity, the Čech resolution of the Kummer trivializing covers,
and proper primitive comparison on their normal finite extensions over `X`.
The resulting map from finite Kummer cohomology tensored with `O_C/p^n`
to completed-structure-sheaf cohomology is almost an isomorphism. Finiteness
and derived inverse limits give the rational period comparison, using the
filtered resolution in B3.log.3. Strictness and degeneration are proved by
the period-filtration comparison and the cyclotomic graded calculation;
taking `gr⁰` produces the canonical direct sum above. A mere degenerating
algebraic spectral sequence would give only an associated graded vector
space, not this Galois-equivariant splitting.

*Source:* [DLLZ], Theorem 6.2.1, pp.85–87; [DLLZRH], Theorem 3.2.7(3),
p.26, Corollary 3.2.10, p.27, §3.6, pp.41–43, and §4.1, pp.46–48; [LLZ],
Theorem 3.1.10, p.18 (empty support subset), Theorem 5.5, p.49,
Theorem 6.2.3, pp.54–55.

*Needs:* B3.log.1–3; PadicHodgeTheory §2.7
(finite-coefficient primitive comparison and finiteness on proper smooth and
singular spaces, using PerfectoidSpaces §§P3.11–P3.13 for almost purity);
ClassicalAdicEtaleCohomology Layer 8, §8.2 (proper algebraic/analytic comparison);
EnhancedDerivedSheaves Layers E1, E2:towers (derived sheaves and limits);
DerivedDeRhamCohomology §§1.14–1.22
(filtered derived categories, filtered completion and completed tensors);
AdicCoefficientsAndComparisons L0 (integral systems, rationalization and
completed coefficient operations).
*Lean:* none; specified in the README only.

**Checks.**

- For `D=∅`, the statement is the proper smooth de Rham/Hodge–Tate
  comparison with its usual cyclotomic twists.
- For `U=G_m⊂P¹`, the unit coefficient gives
  `H¹_et(G_{m,k̄},ℚ_p)⊗C=C(−1)` and `H⁰(P¹,Ω¹(log{0,∞}))=k` in Hodge degree `1`.
- For the proper point and coefficient `ℚ_p(1)`, the only graded term is
  degree `−1`, giving `C(1)` in cohomological degree zero.

### B3.log.5 Boundary period kernels and compact supports

Construct `boundaryPeriodKernel`. For the full reduced boundary `D`, let
`X^{∂(a)}` be the disjoint union of its `a`-fold intersections (with `a=0`
meaning `X`), each with its induced log structure. Form the alternating
boundary restriction complex of completed structural and period sheaves.
Define the supported `A_inf`, `B_dR⁺`, `B_dR` and structural log-period
sheaves by the kernel from degree zero to degree one, with the induced
period filtrations. Prove that the whole boundary complex resolves that
kernel. On root charts the boundary quotient kills the completed ideal
generated by **all positive fractional roots** of the chosen boundary
coordinates. This is not just the quotient by the unrooted coordinate.
Prove strictness of boundary restriction, the supported log Poincaré lemma,
and that pushing its structural log resolution down gives
`DR_log(D_{dR,log}(L)(−D))`, including the induced connection on `O(−D)`.

This constructs a compact-support comparison distinct from the ordinary
one. Starting with `j_!` of the finite coefficient sheaves, prove the supported
primitive comparison using the exact boundary resolution and the ordinary
primitive calculation on all strata. Pass to the period completions and
rational coefficients using their acyclic root basis and derived inverse
limits. Construct the filtered comparison
`H_c^i(U_k̄,L)⊗B_dR ≃ H^i(X,DR_log(D_{dR,log}(L)(−D)))⊗_k B_dR`.
Prove its `E₁` degeneration and `gr⁰` comparison with
`⊕_a H^i(X,gr^a DR_log(D_{dR,log}(L)(−D)))⊗_k C(−a)`.
The finite coefficient groups are finite; rationalization and limits use
that finiteness rather than interchanging arbitrary products and limits.

Prove compatibility with the support-forgetting map, cup products, trace
and Poincaré duality paired with the dual coefficient; locally this is the
product of the period pairing and the residue/Serre trace on the log
complex. For a dimension-`d` pair, retain the étale trace target
`ℚ_p(−d)[−2d]` and its matching de Rham trace. Only the two support choices
`∅,D` are required here; the same boundary resolution also describes maps
between intermediate support choices without using them as prerequisites.

*Source:* [LLZ], §§2.4–2.5, pp.12–16, Definition 3.1.1 and
Theorem 3.1.10, pp.17–18, §§3.2–3.5, pp.18–30,
§4, pp.30–47, Theorems 5.5 and 5.10, pp.49–50.

The API:

- `boundaryPeriodKernel_empty`: empty boundary gives the ordinary period
  sheaves, comparison and cohomology.
- `boundaryPeriodKernel_resolution`: the alternating boundary complex is
  exact above its degree-zero kernel and is compatible with filtrations.
- `boundaryPeriodKernel_poincare`: the supported horizontal sheaf and its
  structural log de Rham complex are filtered quasi-isomorphic.
- `boundaryPeriodKernel_comparison`: the compact-support filtered
  comparison and its canonical `C(−a)` graded decomposition hold as above.
- `boundaryPeriodKernel_supportMap`: inclusion of the kernel into ordinary
  periods induces `H_c→H` and `DR_log(V(−D))→DR_log(V)` compatibly.
- `boundaryPeriodKernel_duality`: coefficient evaluation and trace commute
  with period comparison, support-forgetting, and finite étale pullback/trace.

*Needs:* B3.log.1–4; PadicHodgeTheory §2.7
(finite-coefficient primitive comparison and finiteness), §§2.2, 7.2
(period completions and lisse integral systems);
EtaleDualityAndPerverseSheaves §§0.1–0.6, 2.2 (traces and finite-coefficient duality);
EnhancedDerivedSheaves §0.4 (extension by zero);
EtaleCohomologyFoundations §§0.7, F.2.3, F.5 (localization and proper supports);
ClassicalAdicEtaleCohomology Layer 8, §8.2 (proper algebraic/analytic comparison);
EnhancedDerivedSheaves Layers E1, E2:towers; DerivedDeRhamCohomology §§1.14–1.22
(filtered derived categories, filtered completion and completed tensors);
SchemeAndStackFoundations Layer 2 (coherent cohomology and Serre trace).
*Lean:* none; specified in the README only.

**Checks.**

- Empty `D` makes the boundary complex have no positive terms, so the
  supported kernel equals the ordinary sheaf.
- On `G_m⊂P¹`, the unit coefficient gives `H_c⁰=0`,
  `H_c¹=ℚ_p` and `H_c²=ℚ_p(−1)`. The compact log complex uses
  `O(−2)→Ω¹(log{0,∞})(−2)=O(−2)`, whose Hodge pieces give these
  dimensions and twists. Untwisted ordinary coefficients fail this test.
- At a two-divisor crossing, the complex includes the intersection term
  with alternating signs. Omitting it counts the intersection twice and
  does not resolve the support kernel.
- The quotient by `(T)` in a root algebra leaves a nonzero nilpotent class
  of `T^{1/p}`; the quotient by the completed root ideal removes it.

### Examples

Ordinary `H¹(G_m)` has twist `−1`, while compact `H_c¹(G_m)` has twist zero.
The supported period kernel and the `−D` log complex distinguish them.
Nilpotent geometric boundary monodromy gives a tensor comparison; allowing
arbitrary normalized residue exponents would break that tensor assertion.

### Dependencies

B1.1, B1.4, B2.5–B2.8, B3.7; the named lower-tier period, étale, duality,
logarithmic, filtered-derived and sheaf-cohomology suppliers above. These
are horizontal-log constructions here; no period tower or BGG resolution
is an input to this layer.

## Layer B3.BGG: the Siegel dual BGG complex

Here `G=GSp₄`, `P_H` is the Hodge parabolic and `M≃GL₂×G_m` its Levi.
Work in characteristic zero over a splitting field, with the coefficient
field and the parabolic conventions of B0/B2. This layer constructs the
representation-theoretic resolution as well as its geometric realization.

### B3.BGG.1 Kostant cohomology and the relative resolution in type C₂

Construct `siegelRelativeBGG`. Choose `P` containing the chosen positive Borel, its Levi positive system,
a dominant integral full-group weight `λ`, the corresponding `V_λ`,
and the positive nilradical `𝔫` of `P`. Import the Chevalley–Eilenberg
complex of ArithmeticLocallySymmetricSpaces ALS.F.5 and ALS.4.5
`LocallySymmetric.kostant_splittingField`. In each degree `j`, specialize its
`M`-equivariant identification of `H^j(𝔫,V_λ)` with the multiplicity-one sum indexed by
`w·λ=w(λ+ρ)−ρ`, for the minimal representatives
`w∈{}^M W`, `ℓ(w)=j`, for the minimal left-coset representatives of `W_M\W_G`.
Construct the additional relative BGG resolution of `V_λ` by the induced
`U(𝔤)⊗_{U(𝔭)}W_{w·λ}` modules, with arrows from length `j` to length
`j−1`, augmentation in degree zero, and exactness in positive degrees.
The four representatives have lengths `0,1,2,3`; their coefficient modules
are not four copies of one Verma module.

Use the relative standard resolution
`U(𝔤)⊗_{U(𝔭)}(V_λ⊗Λ^•(𝔤/𝔭))`. Its summand for the infinitesimal
central character of `V_λ` is the relative BGG resolution. Prove the
multiplicity-one weight calculation and exactness by the Casimir/central
character decomposition and the relative standard resolution, retaining
the filtration and Levi action. For this `C₂` case, construct the three
nontrivial root-vector maps, normalize their scalar ambiguities coherently,
and verify successive compositions vanish. PBW identifies their associated
graded maps; the same central-character calculation contracts the remaining
summands. The imported Kostant summands identify the retained weights; the root-vector maps and
filtered comparison supply the relative resolution, beyond a character identity.

*Source:* [FC90], VI §5, Proposition 5.3 and its construction, pp.230–232;
[LLZ], §6.1, pp.51–53, especially the representation formula in
Theorem 6.1.7(3). The coefficient convention is transported as in [BCGP],
§4.8, p.101.

The API:

- `siegelRelativeBGG_terms`: the degree-`j` term and the nilradical
  cohomology are the stated Levi-weight summands, with central character.
- `siegelRelativeBGG_differential`: the root-vector maps intertwine the
  `𝔤` actions, square to zero and commute with coefficient maps.
- `siegelRelativeBGG_exact`: the augmentation is a resolution of `V_λ`;
  projection from the standard resolution is a filtered homotopy equivalence
  onto its central-character summand.
- `siegelRelativeBGG_filtration`: its associated graded has zero BGG
  differential in the filtration used for geometric Hodge pieces.
- `siegelRelativeBGG_descent`: the normalized resolution and its filtered
  comparison are defined over the stated characteristic-zero coefficient
  field, with compatible scalar extension.

*Needs:* ArithmeticLocallySymmetricSpaces ALS.F.5 (absolute Chevalley–Eilenberg complex),
ALS.4.5 (`LocallySymmetric.kostant_splittingField`, including the full Levi centre);
RepresentationTheory/LieHighestWeight Layers 2–7 (highest weights,
Verma modules, central characters, universal enveloping algebra and PBW),
RepresentationTheory/ClassicalGroups Layers 2–3
(the `GL₂` coefficient representations); ReductiveGroups Layers 7–8
(parabolic and Levi Lie algebras); EnhancedDerivedSheaves Layers E0–E1
(complexes, cones and derived categories); DerivedDeRhamCohomology §§1.14–1.22
(filtered derived categories, filtered completion and completed tensors); B0.3 and B2.3 (opposite/dual conventions).
The relative BGG resolution, its explicit `C₂` weight specialization and filtered comparison
are the constructions here; nilradical cohomology is supplied by ALS.4.5.
*Lean:* none; specified in the README only.

**Checks.**

- `dim(𝔤/𝔭)=3` and the four minimal Weyl representatives have lengths
  `0,1,2,3`; using all eight `C₂` Weyl elements would give the wrong complex.
- For the unit coefficient the `j`-th nilradical cohomology has dimension
  `binomial(3,j)`, since this Siegel nilradical is abelian; this tests the
  Levi representations as well as the four lengths.
- A nontrivial central similitude character changes the centre action on
  every term and not the length set. Discarding it cannot pass coefficient
  descent or B5.21's weight `(0,−2;2)` test.

### B3.BGG.2 The geometric filtered dual BGG complex

Construct `siegelDualBGGComplex` on a neat smooth toroidal Siegel model.
Apply B3.BGG.1's dual resolution to the canonical principal bundle, use the
logarithmic connection and Kodaira–Spencer identification, and construct a
canonical filtered inclusion as a direct summand
`BGG_log(V^can)→DR_log(V^can)`.
The terms are coherent locally free automorphic bundles; the differentials
are differential operators and the complex is a complex of **abelian
sheaves**, not an `O_X`-linear complex. Its graded differential is zero.
For `V=V_λ^∨`, degree `j` and filtration `a` have term
`⊕_{ℓ(w)=j, (w·λ)(H)=−a} (coh W_{w·λ}^∨)^can`,
where `H` is the Hodge coweight in that positive-root convention.

Construct the differential operators using the enveloping-algebra action
on horizontal frames. On a cusp the log Gauss–Manin connection extends
these operators; nilpotent residues and the relative resolution give the
filtered quasi-isomorphism there as well as on the open. Tensor the
construction with `O_X(−D)` **using its induced logarithmic connection**
to obtain the compact-support filtered quasi-isomorphism. Both constructions
are defined over a finite extension of the reflex/coefficient fields and
commute with coefficient maps, level pullback, finite étale trace and
common fan refinements.

*Source:* [FC90], VI §5, Proposition 5.4, p.233;
[LLZ], Theorem 6.1.7 and Remark 6.1.9, pp.52–53;
[BCGP], §4.8, p.101.

The API:

- `siegelDualBGGComplex_terms`: the degree and Hodge grading of every
  coherent term are those above, with zero graded differential.
- `siegelDualBGGComplex_comparison`: the inclusion is a filtered
  quasi-isomorphism; its image is a direct summand with acyclic complement,
  naturally in the coefficient.
- `siegelDualBGGComplex_boundary`: the `−D` version maps to
  `DR_log(V^can(−D))` and commutes with the map to the ordinary complex.
- `siegelDualBGGComplex_hecke`: pullback and trace commute with the
  comparison on the actual Hecke spans, after compatible refinements.
- `siegelDualBGGComplex_field`: comparison and operators descend over the
  stated field; extending scalars and then comparing gives the same maps.

*Needs:* B3.BGG.1; B1.6, B2.6, B3.2, B3.4, B3.7;
ShimuraCompactifications C2 (log smooth toroidal charts), C3
(C3.9 `ToroidalRefinement.cohomology_iso`, C3.3 `ToroidalHeckeSpan`), C5
(C5.12 `IntegralToroidalModel.logKodairaSpencer`, on the higher-dimensional semi-abelian degeneration); AbelianSchemesAndArithmeticModuli
A4 (Gauss–Manin and Kodaira–Spencer); DerivedDeRhamCohomology §§1.14–1.22
(filtered derived categories, filtered completion and completed tensors).
*Lean:* none; specified in the README only.

**Checks.**

- For the trivial representation the graded complex gives
  `O, Ω¹(log D), Ω²(log D), Ω³(log D)` in degrees `0,1,2,3`.
- Even for the trivial coefficient, the ungraded differential on functions
  differentiates them. An `O_X`-linear differential would kill all functions
  once it kills `1`, and gives the wrong complex.
- On a boundary disc, `∇(Tf)=T(df+f dlog T)`. Merely multiplying the
  ordinary differential matrix by `T` misses the induced connection term
  in the compact-support complex.

### B3.BGG.3 Graded coherent pieces and degeneration

Prove `siegelBGGGradedComparison`. The associated graded hypercohomology of
B3.BGG.2 is the direct sum of coherent cohomology of its displayed terms,
with shift `i−ℓ(w)`. Both the ordinary and `−D` Hodge–de Rham spectral
sequences degenerate at `E₁`, using respectively B3.log.4 and B3.log.5 for
the canonical automorphic local system identified in B3.log.3. Hence these
coherent sums identify the Hodge graded pieces of de Rham cohomology; taking
`gr⁰` of the corresponding `B_dR` comparisons gives the canonical
Galois-equivariant `C`-decompositions, with Tate twist `(w·λ)(H)`.
Keep ordinary and compact comparisons separate, and prove compatibility
with the support-forgetting map and duality. Degeneration does not need a
perfectoid Shimura tower or a completed-cohomology comparison.

For BCGP's negative dominant `κ=(k₁,k₂;w)`, change the positive system
before using the dot action. In their coordinates the simple roots are
`e₁−e₂` and `−2e₁`; thus `ρ_G=(−1,−2;0)` and
`ρ_L=(1/2,−1/2;0)`. Write `ρ_U=ρ_G−ρ_L`, the half-sum of the
unipotent roots, so `2ρ_U=(−3,−3;0)`. The coherent label is
`−w_{0,M}(w·κ+2ρ_U)`, where the dot action uses `ρ_G` and
`w_{0,M}` interchanges the first two coordinates. The minimal left-coset
representatives `1,s₂,s₂s₁,s₂s₁s₂` have lengths `0,1,2,3` and give
`λ₃,λ₂,λ₁,λ₀`, respectively, with coherent cohomological degree
`j=3−ℓ(w)` and Hodge degree `a_j` as in B5.21. In particular every central
label is `−w`. Prove this dictionary by the `C₂` root action and the
Levi-dual highest weight. The bundle `ω^{λ_j}` here is untwisted; its Tate
twist is applied once by the cohomology comparison.

*Source:* [LLZ], Theorem 6.1.10 and Remark 6.1.16, pp.53–54,
Theorems 6.2.3 and 6.2.9, pp.54–55; [FC90], VI §5,
Theorem 5.5, pp.233–234, VI §6, Theorem 6.2(i), p.241;
[BCGP], §4.8 and Theorem 4.8.2, pp.101–102.

*Needs:* B3.BGG.1–2; B3.log.2–5; B2.3; B3.5–B3.6;
DerivedDeRhamCohomology §§1.14–1.22
(filtered derived categories, filtered completion and completed tensors);
ComplexComparisonPartII C0/C2 (coherent GAGA and scalar comparison).
*Lean:* none; specified in the README only.

**Checks.**

- At `κ=0`, the four bundles are `O`, `ω^(2,0;0)`,
  `ω^(3,1;0)`, `ω^(3,3;0)`, in cohomological degrees `0,1,2,3`
  and BCGP Weyl lengths `3,2,1,0`; their Hodge degrees are `0,1,2,3`
  and ranks are `1,3,3,1`.
- At `κ=0` the identity Weyl element gives `−w_{0,M}(2ρ_U)=(3,3;0)`,
  the degree-three term. Substituting the Levi half-sum instead would
  give `(1,−1;0)`, and putting the identity in degree zero would give
  the wrong term even with the correct half-sum.
- At `κ=(0,−2;2)` the central label is `−2` throughout and the Hodge
  degrees are `0,1,4,5`. A zero-weight-only calculation cannot detect this.
- For compact support every one of these bundles is tensored with
  `O(−D)`; for empty `D` the ordinary and compact comparisons coincide.

### Examples

The unit coefficient has coherent ranks `1,3,3,1`, while the cohomological
shifts are `0,1,2,3`. These are different data: replacing a term by a scalar
line preserves the length list but destroys the resolution. Nonzero central
weight tests the separate dual-weight and Tate conventions.

### Dependencies

B1–B3; B3.log; the named generic representation-theory, log
Kodaira–Spencer, filtered-derived and coherent-GAGA suppliers above.

## Layer B3.HT: rational Hodge–Tate towers and algebraic coefficient descent

Fix a prime `p`, including `2`, a neat tame level and a complete algebraically
closed extension `C/ℚ_p`. For Siegel space choose a prime-to-`p` full level
`N≥3`. Choose compatible roots of unity when doing cyclotomic ring
calculations; all final statements retain the resulting Galois/Tate action.
The construction starts with Siegel space and passes to Hodge type by closed
toroidal embeddings. Only the rational tower and finite-dimensional algebraic
coefficients are built here.

The shared carriers of B3.HT.1–7 are used with the following downstream identifications.
For the cyclotomic-base abelian-family range, `TauCeti.HodgeTate.canonicalSubgroup` denotes
the `C_m` supplied by CohomologyComparisons §6.2 and used in B3.HT.1; the comparison with
any pointwise construction is equality of finite flat subgroup schemes by Frobenius-congruent
uniqueness, with `S_m=(p^m−1)/(p−1)` and the same
weak/strong bounds. Equality in its point criterion requires `R′` integrally closed in `R′[1/p]`.
Hasse charts, good triples and anticanonical Frobenius charts use B3.HT.2–3's completed rings,
boundary ideals and transition maps. The rational minimal and toroidal towers use
B3.HT.4–6's represented tilde-limits, with identity on the finite-level moduli towers and
compatible period maps. For the cyclotomic fixed-similitude presentation first retain its Weil
pairing component; passage to the full tower restores all similitude components and their
semilinear action. The Levi comparison is B3.HT.7's torsor isomorphism with B0.3's opposite/dual
dictionary and the central-cocharacter Tate twist. These are common objects for the downstream
applications, while their additional integral estimates and wider datum ranges have their own
hypotheses.

### B3.HT.1 Shared small-Hasse canonical subgroups and their Siegel application

Use CohomologyComparisons §6.2's shared `smallHasseCanonicalSubgroups` for the
Siegel family and period-map applications. Write `ℤ_p^cycl` for the completed
ring of integers in the cyclotomic perfectoid extension of `ℚ_p`. For an
abelian scheme `A/R` of relative dimension `g`, where `R` is a `p`-adically
complete flat `ℤ_p^cycl`-algebra, an integer `m≥1`, and rational
`0≤ε<1/2` with the required fractional powers of `p` in the base, suppose
`Ha(A)^((p^m−1)/(p−1))` divides `p^ε` modulo `p`. The supplied finite flat
subgroup `C_m⊂A[p^m]` reduces to `ker F^m` modulo `p^(1−ε)`, is unique
among such lifts, commutes with flat base change and isomorphisms,
and has degree `p^(mg)`. For every `p`-complete `ℤ_p^cycl`-flat `R`-algebra `R′`,
the supplied point criterion gives the inclusion
`{s∈A[p^m](R′) : s=0 mod p^((1−ε)/p^m)} ⊆ C_m(R′)`.
If `R′` is integrally closed in `R′[1/p]`, this is equality. For this converse,
Frobenius congruence gives divisibility of the `p^m`-th powers of the
coordinates; the required coordinate quotients are integral in `R′[1/p]`,
so integral closedness puts them in `R′`. Power divisibility alone does not
give coordinate divisibility over an arbitrary flat test algebra.
In the stronger small-Hasse regions `Ha(A)^(p^m)|p^ε`, use the supplied nesting
and quotient identities in the anticanonical tower. A strong level
`b` gives `C_a⊂C_b` for `a≤b`; given strong level `a`, the quotient
`B=A/C_a` has strong level `b` exactly when `A` has strong level `a+b`,
and then `0→C_a→C_{a+b}→C_b(B)→0` is exact. Morphisms between abelian
schemes admitting strong level `m` preserve `C_m`. Under a principal
polarization these subgroups are isotropic for the Weil pairing.
These are assertions on the specified regions, not on all nonordinary points.

CohomologyComparisons §6.2 supplies the shared abelian-family weak/strong subgroup,
uniqueness, point criterion, functoriality, isotropy and strong quotient package.
B3.HT.1 applies this same subgroup to the universal polarized Siegel family on the
Hasse regions of B3.HT.2. Identify its pullbacks along level maps and its iterated
quotients using the supplied base-change and uniqueness statements, so the family
used by the anticanonical tower and period-map constructions has these same groups.
The additional pointwise Harder–Narasimhan construction, degree formula and integral
Hodge–Tate estimates belong to HodgeTateAndCanonicalSubgroups §§3.6–3.9.

*Source:* [Scholze15], III §2, Theorem III.2.1, Corollary III.2.2 and Lemma III.2.4, pp.31–33,
Corollary III.2.6 and Definition III.2.7 with its following properties,
pp.33–35 (including Proposition III.2.8).

The supplied API, used for the Siegel family:

- `smallHasseCanonicalSubgroups_reduction`: rank and reduction are as above.
- `smallHasseCanonicalSubgroups_points`: for `p`-complete `ℤ_p^cycl`-flat `R`-algebras `R′`, the
  congruent-to-zero sections belong to `C_m(R′)`; equality is asserted when
  `R′` is integrally closed in `R′[1/p]`.
- `smallHasseCanonicalSubgroups_unique`: two subgroup lifts satisfying
  the stated reduction condition agree on the small-Hasse region.
- `smallHasseCanonicalSubgroups_baseChange`: admissible base changes and
  isomorphisms carry the canonical subgroup to the canonical subgroup;
  morphisms of abelian schemes with strong level `m` preserve it.
- `smallHasseCanonicalSubgroups_quotient`: nesting, quotient Hasse estimates
  and canonical-subgroup identities hold on the stated stronger regions.
- `smallHasseCanonicalSubgroups_polarization`: the principal polarization
  gives isotropy, hence the required polarized quotient isogeny.

*Needs:* CohomologyComparisons §6.2 (`smallHasseCanonicalSubgroups` and its
abelian-family API); PELModuli M3 (abelian quotients and polarization moduli);
AbelianSchemesAndArithmeticModuli A0–A4; ShimuraCompactifications C4–C5
(the semi-abelian family and integral Hodge line).
*Lean:* none; specified in the README only.

**Checks.**

- On the ordinary locus, `C_m` is the multiplicative subgroup of `A[p^m]`,
  of degree `p^(mg)`; choosing the étale subgroup gives the wrong reduction.
- At `m=1` the weak hypothesis has Hasse exponent `1`; iteration must
  produce `(p^m−1)/(p−1)`, rather than reusing that exponent at every level.
- At `p=2` and `ε<1/2` the obstruction and uniqueness estimates still apply.
  A proof which divides by `2` on the integral base fails this case.
- For `p=2`, `m=1`, `ε=0`, put
  `R′={(a,b)∈O_C² : a≡b mod 2}` with diagonal base map. It is `2`-complete
  and torsion-free, hence flat over the cyclotomic valuation base. For an
  ordinary elliptic curve base-changed to `R′`, the canonical group is `μ₂`.
  Its point `s=(−1,1)` has `s−1=(−2,0)∉√2 R′`: the prospective quotient
  `(−√2,0)` has coordinate difference not divisible by `2`. Thus point
  inclusion is strict over this nonnormal ring.
- Outside the stated Hasse bound no canonical lift is asserted; an arbitrary
  rank-`p^g` subgroup is insufficient for the quotient compatibility.

### B3.HT.2 Anticanonical affinoids and the Frobenius tower

Construct `siegelAnticanonicalTower`. On the integral minimal Siegel model,
form the Hasse blow-up regions `X^*(p^(−ε))`. Their local rings have the
presentation `R_ε=R^cycl⟨u⟩/(f u−p^ε)`, where `f` lifts the Hasse section
in a Hodge-line trivialization. Prove the finite-level Hartogs assertion
needed here: for the normal special-fibre charts and a closed boundary of
codimension at least two, sections of these blow-up rings extend across
the boundary. Use normality modulo `p`, nonvanishing of `f` on each relevant
component, and the explicit presentation, not normality of a generic fibre
alone. For genus one use the direct cusp charts instead.

B3.HT.1's quotient by `C_1` defines a Frobenius lift
`X^*(p^(−ε/p))→X^*(p^(−ε))`, reducing to Frobenius modulo the indicated
fractional power of `p`. Iterating, identify the source with the
anticanonical region at `Γ₀(p^m)` level: the level subgroup is complementary
to the canonical subgroup on the stated region. Use the ample Hodge power
on the minimal model to show the sufficiently deep regions are affinoid.
On a compatible affinoid sequence, define the completed direct-limit
integral ring. The Frobenius congruence gives surjectivity of Frobenius on
its reduction modulo `p`; prove boundedness of its integral ring from the
finite-level norm estimates. The resulting complete Tate algebra is
uniform and perfectoid, and its adic space is a tilde-limit of these actual
anticanonical regions, including their minimal boundary. Prove the boundary
is strongly Zariski closed on these charts.

*Source:* [Scholze15], Lemma III.2.10, pp.36–37, Theorem III.2.15,
pp.39–41, Lemma III.2.17, pp.41–42, and Corollary III.2.19 with
Corollary III.2.20, pp.42–43.

The API:

- `siegelAnticanonicalTower_finiteLevel`: the quotient/Frobenius map gives
  the stated `Γ₀(p^m)` anticanonical chart with its polarization and level.
- `siegelAnticanonicalTower_ring`: the completed ring represents the
  affinoid tilde-limit and has the asserted Frobenius and boundedness properties.
- `siegelAnticanonicalTower_boundary`: boundary ideals and formal cusp
  restriction agree with their finite-level systems and are strongly closed.
- `siegelAnticanonicalTower_transition`: level, Hasse-region inclusions
  and changes of Hodge trivialization give the same glued tower maps.

*Needs:* B3.HT.1; ShimuraCompactifications C2, C4, C5
(C2.8 `ToroidalSpace.toMinimal`, C4.1 `SemiAbelianScheme`, C5.13 `IntegralToroidalModel.hodgeLine_semiample`,
C5.17 `IntegralMinimalModel.hodgeLine_ample`); PerfectoidSpaces P1–P4, P7.11–P7.12
(completed Huber pairs, rational localizations, tilting and gluing);
AdicSpacesPartII Layer R0 (adic morphisms);
AdicSpacesPartIII Layers F0, R2 (formal blow-ups and generic fibres);
SchemeAndStackFoundations §§0.6, 4.13 (normality and extension of functions).
*Lean:* none; specified in the README only.

**Checks.**

- On the ordinary locus the transition reduces to Frobenius and its
  degree is `p^(g(g+1)/2)`, not `p^g` when `g>1`.
- In the ring presentation the relation is `f u=p^ε`; using the localization
  `R[1/f]` would discard the nonordinary part of the small-Hasse region.
- A finite-level torus ring without all `p`-power roots has nonsurjective
  Frobenius modulo `p` and cannot substitute for the completed tower ring.

### B3.HT.3 Bounded extension and normalized traces at the minimal boundary

Construct `siegelBoundaryHebbarkeit`. For the charts in B3.HT.2 prove
extension of bounded functions across the minimal boundary, and the
corresponding almost assertions modulo every pseudouniformizer. Carry this
property through the normal finite covers used to add `Γ₁` and full level.

Make the needed local invariant explicit. A triple `(Y,Z,V)` consists of an
affinoid perfectoid space, its closed boundary, and a quasi-compact open
`V⊂Y\Z`. Call it good when restriction induces
`H⁰(Y,O⁺/t)^a≅H⁰(Y\Z,O⁺/t)^a↪H⁰(V,O⁺/t)^a`.
Prove independence of the chosen pseudouniformizer, compatibility with
tilting and the same assertion for `t=0`. In characteristic `p`, prove this
for the completed perfection of
`(A₀ ⊗̂ K)⟨u⟩/(f u−t)`, initially for
`K=𝔽_p((t^(1/p^∞)))` and then its completed algebraic extensions,
when `A₀` is normal of finite type over `𝔽_p`
and admits a resolution, `f` is a non-zero-divisor, the boundary ideal
`J⊂A₀` has codimension at least two, and
`V={|g|=1 for some g∈J}`. Use the root ideal `g^(1/p^∞)` and the almost
isomorphism `ring/f→Hom(g^(1/p^∞),ring/f)`; prove this by flat
Frobenius in the smooth case and coherent higher direct images on the
resolution in the normal case. The toroidal resolution from C2 supplies
this hypothesis for the minimal Siegel charts at issue. Prove preservation
under normal finite covers étale away from the boundary, with no
irreducible component mapping entirely into the boundary, by the trace
pairing away from the boundary and finite-level Hartogs, and under filtered
surjective finite limits. This is the specific extension theorem used
here, not an assertion for every perfectoid space and every closed subset.

For the mixed-characteristic Siegel Frobenius maps additionally construct
the normalized traces: if `d=g(g+1)/2`, the integral trace is divisible by
`p^(d−(2d+1)ε)` on the chosen region. Normalize by the generic degree
`p^d`. The normalized maps `tr_m` satisfy
`tr_m(O⁺)⊂p^(−C_m)O⁺` for `C_m→0`, and `tr_m(x)→x`.
Use these bounds and convergence to prove density of finite-level
integral sections and identify the tilted finite-cover construction with
the actual completed level rings. Retain the characteristic-`p` extension
argument and this density argument as separate steps.

*Source:* [Scholze15], II §3, Definition II.3.8, Lemmas II.3.9–II.3.11 and Corollary II.3.12,
pp.23–26 (using Lemma II.3.6, pp.20–23), and
III §2, results III.2.21–III.2.28, pp.44–50.

The API:

- `siegelBoundaryHebbarkeit_good`: the specified Siegel chart triples are
  good, including their tilted versions and admitted finite covers.
- `siegelBoundaryHebbarkeit_extension`: bounded functions extend uniquely;
  modulo `t` restriction is the stated almost isomorphism and injection.
- `siegelBoundaryHebbarkeit_trace`: the trace divisibility and normalized
  norm estimates hold for each actual Frobenius map.
- `siegelBoundaryHebbarkeit_density`: finite-level sections are dense in
  the completed ring and restriction detects equality on the stated open.
- `siegelBoundaryHebbarkeit_limits`: the property survives the normal finite
  covers and filtered limits just specified.

The trace construction is independent of the coefficient comparisons and
uses no period tower.

*Needs:* B3.HT.2; ShimuraCompactifications C2/C5 (toroidal resolution of the
minimal boundary); SchemeAndStackFoundations §§0.6, 2.6, 4.9, 4.13
(normality, coherent proper direct images, formal functions and Hartogs);
PerfectoidSpaces P0–P4, P7.11–P7.12 (almost modules, tilting and limits);
PerfectoidSpaces §§P3.11–P3.13 (almost purity); B5.1 (finite locally free trace).
*Lean:* none; specified in the README only.

**Checks.**

- For `t=0`, two bounded functions agreeing off the boundary agree on the
  chart; a merely almost assertion without passing through all `t` is insufficient.
- A codimension-one removed divisor can support a pole, so the
  codimension-two Hartogs hypothesis cannot be dropped. Genus one uses its
  separate cusp calculation.
- A finite cover ramified on the open need not satisfy the trace-pairing
  argument; étaleness off the boundary is a required hypothesis.
- Adding a disjoint normal component mapping entirely into the boundary
  gives a finite cover which is étale off it, but restriction loses every
  function on the added component. Such a cover is excluded; the actual
  normalizations of the open level covers have no such components.
- At `g=2`, the generic trace divisor is `p³`. Normalizing it by `p²` gives
  the wrong normalized operator already on constants.

### B3.HT.4 Full-level Siegel minimal tower and its period map

Construct `siegelPerfectoidPeriodTower`. Over B3.HT.2's anticanonical regions
add `Γ₁(p^∞)` level by normalizing the tilted rings, then use B3.HT.3 to
identify their untilts with the actual finite-level limits. Add full level
by almost purity for the finite étale map over the `Γ₁` tower. This yields
perfectoid anticanonical charts at full level, including the boundary.

Construct the topological Hodge–Tate map on the inverse limit of geometric
points before asserting global perfectoidness. Use the rational
Hodge–Tate exact sequence of the semi-abelian degeneration, its
compatibility with the toric and good-reduction abelian pieces, and
relative primitive comparison to prove continuity. Prove that a geometric
point has rational Hodge–Tate flag exactly when its abelian part is ordinary
in the required Siegel sense: the kernel on rational Tate vectors is the
Tate module of the multiplicative subgroup. For the converse, a map between
formal dual groups with zero Lie map is zero in characteristic zero; this
identifies that kernel without using a general classification theorem for
`p`-divisible groups over `O_C`. Use quasi-compactness and diagonal
contraction on the flag variety to show finitely many `G(ℚ_p)` translates
of anticanonical charts cover the entire inverse limit. Glue them to the
perfectoid minimal tower, with its finite-level tilde-limit property.

Construct the analytic map `π_HT` to the Lagrangian flag variety on these
charts, using the Hodge–Tate subbundle, and extend it across the minimal
boundary by B3.HT.3. Prove agreement on overlaps and the `G(ℚ_p)` action,
prime-to-`p` Hecke invariance, Galois equivariance and strong closedness of
the boundary. The action is over the reflex field with its cyclotomic
structure; choosing a cyclotomic trivialization during a ring calculation
does not make that action trivial.

*Source:* [Scholze15], III §2, results III.2.29–III.2.36, pp.50–53,
Proposition III.3.1 and Lemma III.3.4, pp.54–56,
III §3, results III.3.6–III.3.11 and Corollary III.3.12, pp.57–59,
Corollary III.3.17 and Theorem III.3.18, pp.61–62.

The API:

- `siegelPerfectoidPeriodTower_limit`: the tower represents the compatible
  finite-level systems on the indicated affinoid basis.
- `siegelPerfectoidPeriodTower_period`: the analytic period map has the
  Hodge–Tate flag on geometric points, including degenerate ones.
- `siegelPerfectoidPeriodTower_cover`: finitely many translates of the
  anticanonical affinoids cover, and their identifications satisfy the cocycle.
- `siegelPerfectoidPeriodTower_actions`: level, group, Galois and Hecke
  maps commute with `π_HT` with their specified flag actions.
- `siegelPerfectoidPeriodTower_boundary`: boundary restriction agrees with
  cusp degeneration and the boundary is strongly Zariski closed.

*Needs:* B3.HT.1–3; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.19
(rational Hodge–Tate sequence for `p`-divisible groups);
PadicHodgeTheory §§2.7, 7.3 (primitive and relative comparison);
PerfectoidSpaces §§P3.11–P3.13 (almost purity);
PerfectoidSpaces P1–P4, P7.11–P7.12; ShimuraCompactifications C4–C5
(semi-abelian degeneration); ShimuraData Layer 3 (flag variety);
B1.1/B2.9 (polarization and tautological Hodge sequence).
*Lean:* none; specified in the README only.

**Checks.**

- At an ordinary geometric point the flag is rational; generic flags are
  not rational. Replacing the period map by a constant rational flag fails.
- The group action moves the flag by its linear action, whereas a
  prime-to-`p` Hecke map leaves the `p`-adic flag unchanged.
- At a rank-one toric degeneration the toric Hodge–Tate contribution and
  the abelian contribution have their respective ranks; retaining only the
  good-reduction abelian quotient loses a direction.
- The full tower's boundary is included in the covering construction;
  an open Shimura tower alone does not prove the compactified assertion.

### B3.HT.5 Perfectoid toroidal Siegel charts

Construct `siegelPerfectoidToroidalTower`. Choose a complete smooth projective admissible fan
at an initial principal `p`-level, with its polarization and trivial effective cone stabilizers.
At every deeper principal level use the induced fan under the cusp-lattice map, with no new
subdivision. The real cones are fixed and the character lattices are rescaled by `p`-powers.
Prove that the induced fans remain smooth and projective and the finite-level toroidal
transition maps are finite flat: induced fans give finiteness, while smooth equidimensional
source and target give flatness. Construct the toroidal inverse limit over the open and at every boundary
chart. On the boundary use the universal degeneration over the lower-rank
abelian base, its inverse `p`-power isogeny tower, and the torus embedding
with character monoids enlarged by all `p`-power denominators. Use the
modified integral toroidal models whose generic fibres are the required
finite-level toroidal spaces; the naive integral tower is not asserted to
have the same Frobenius property. On their affine charts, prove that the
completed integral rings identify with the power-bounded subrings and that
Frobenius modulo `p` is surjective. Thus the generic-fibre limit is
perfectoid. Glue with the open tower from B3.HT.4 using the actual
degeneration identifications. Compose the map to the minimal tower with
its period map; prove agreement with the Hodge–Tate filtration on the open
and with the log Hodge filtration on cusp charts.

*Source:* [PS16], Appendix A, Lemmas A.15–A.17, Proposition A.18 and
Corollary A.19, pp.28–30;
[Scholze15], III §3, Theorem III.3.18, pp.61–62;
[Lan22], Proposition 3.4(4–6), pp.8–9, §6, p.18; [BCGP], §4.2, p.70.

The API:

- `siegelPerfectoidToroidalTower_charts`: the boundary algebra combines
  the perfectoid abelian-base cover and the completed root-monoid algebra.
- `siegelPerfectoidToroidalTower_limit`: its generic fibre is a tilde-limit
  of the stated finite-level toroidal spaces.
- `siegelPerfectoidToroidalTower_period`: the map to the minimal tower and
  its period map agree with the geometric Hodge–Tate flag.
- `siegelPerfectoidToroidalTower_refinement`: choose common smooth projective refinements at
  the initial level and induce them throughout each tower. The resulting maps commute with level
  and prime-to-`p` Hecke maps; the refinement maps are proper and need not be finite.

*Needs:* B3.HT.4; ShimuraCompactifications C0–C4
(torus embeddings, cusp gluing, refinement and semi-abelian uniformization);
AbelianSchemesAndArithmeticModuli A4 (Tate modules and isogenies);
PerfectoidSpaces P1–P4, P7.11–P7.12 (root-monoid rings, limits and gluing).
*Lean:* none; specified in the README only.

**Checks.**

- A rank-one cusp introduces all `q^(1/p^m)`; the ordinary completed
  ring in `q` has nonsurjective Frobenius and is not the claimed limit.
- At a positive-dimensional boundary stratum, perfecting only the torus
  leaves the abelian-base direction unperfected; both factors are required.
- A fan refinement changes a boundary chart but the resulting maps to the
  minimal tower and its flag agree on a common refinement.
- Subdividing `ℝ_≥0²` at `(1,1)` gives `Bl₀(𝔸²)→𝔸²` with exceptional fibre `ℙ¹`, hence a proper
  map that is not finite. Such a subdivision is compared through a separately induced tower;
  inserting it as a level transition does not satisfy this target's induced-fan hypothesis.

### B3.HT.6 Closed Hodge-type toroidal towers

Construct `hodgeTypePerfectoidToroidalTower`. Choose a symplectic embedding
of a Hodge-type datum and sufficiently small tame levels for which the
finite-level open map is a closed immersion. Choose a strictly compatible pair of complete
smooth projective admissible Hodge/Siegel fans at one initial principal `p`-level, with
polarization functions and trivial effective cone stabilizers, refining any prescribed finite
list there. At every deeper level induce both fans from this pair under the cusp-lattice maps.
Prove that their `p`-power lattice rescalings preserve smoothness, projectivity and strict
compatibility. The toroidal embeddings are closed immersions identifying the reduced boundary
ideals; the level transitions on both towers are finite flat by the induced-fan criterion and
smooth equidimensionality. Establish these properties before affinoid gluing. Construct the
perfectoid closed subspaces in the Siegel tower by perfectoidization of
the completed quotient systems, and prove the finite-level tilde-limit
property. In each fixed Siegel perfectoid chart use decreasing closed loci:
their defining ideals increase with the level index, and the limiting locus
is their intersection, cut out by the sum of the ideals followed by
PerfectoidTowers P8.21's perfectoidization. Apply its fixed-target closed-limit
construction, then use the finite transition maps to glue, as in Lan's proof;
a bare quotient of a perfectoid algebra need not itself be perfectoid.
The result is the toroidal Hodge-type tower with the actual finite-level
models, not an abstract space assumed to carry their functions.

Construct its period map by restriction of the Siegel map. B1.1's defining
Hodge tensors are parallel in the relative comparison, hence the flag lies
in the `G` compact dual, with its prescribed Hodge-parabolic type. Prove
this factorization on the open and then on the whole toroidal tower by
its closed equations and the boundary comparison. Tensor-frame descent
makes it independent of the chosen symplectic embedding. For `g∈G(ℚ_p)`
compare `Σ` and `gΣ` after a common refinement; no fixed fan is assumed
invariant under every `g`.

*Source:* [Lan22], Proposition 3.4(4–6), pp.8–9, Propositions 4.9–4.10, p.14, and §6,
pp.18–20, including Proposition 6.1; [RC22], Theorem 4.2.1 and its proof, pp.22–23.

The API:

- `hodgeTypePerfectoidToroidalTower_limit`: the perfectoid charts have
  the asserted finite-level tilde-limit and function systems.
- `hodgeTypePerfectoidToroidalTower_closed`: the chosen embeddings and
  their boundary restrictions agree with the finite-level closed embeddings.
- `hodgeTypePerfectoidToroidalTower_period`: the period map factors
  through the `G` flag variety with the Hodge tensors fixed.
- `hodgeTypePerfectoidToroidalTower_change`: changing embedding, tame
  level or fans gives the canonical compatible maps on common refinements.

*Needs:* B3.HT.5; B1.1, B1.3–B1.7; ShimuraCompactifications C0–C4
(strictly compatible fans, toroidal gluing and maps);
ShimuraData Layer 3; PerfectoidTowers §§P8.14, P8.21
(Zariski-closed embeddings and inverse limits of compatible closed loci).
Use §P8.21 for the perfectoid closed-limit construction.
The strict fan variant is proved here by refining the cusp lattice
embeddings until each source cone maps onto a target cone; arbitrary
compatible fans alone do not give closed toroidal immersions.
*Lean:* none; specified in the README only.

**Checks.**

- For the identity Siegel embedding, the tower and flag map are B3.HT.5's.
- A compatible cone map which is not strictly compatible can fail to be a
  closed immersion, even in characteristic zero; the strict refinement is needed.
- A perfectoid quotient construction must also take its perfectoidization;
  treating every quotient as already perfectoid omits an essential step.
- In a fixed Siegel chart, `I_i⊆I_j` gives `V(I_j)⊆V(I_i)`; a compatible
  point lies in the limit exactly when every `I_i` vanishes on it. Replacing
  this intersection by an increasing union reverses the closed conditions.
- Changing a symplectic embedding preserves the tensor-defined `G` flag,
  rather than merely giving two unrelated Siegel flags.
- A smooth strictly compatible pair at each level may still insert the quadrant blow-up of
  B3.HT.5 between levels. Strict compatibility of the embeddings alone does not give finite
  transitions; both towers must use the fans induced from the initial pair.

### B3.HT.7 The rational Hodge–Tate Levi torsor

Construct `rationalHTLeviTorsor`. On B3.HT.6's tower pull back the principal
Levi bundle on the flag variety by `π_HT`. Construct its comparison with
the canonical de Rham Levi torsor `M_dR` from B1/B3:
`π_HT^*M_Fℓ ≃ π_level^*M_dR ×^{G_m,μ} G_m(−1)`.
Here `G_m(−1)` is the Tate torsor of nonzero sections of `O(−1)` and the
contracted product uses the central Hodge cocharacter of the Levi, with the
Hodge/opposite identification of B0.3. This identity is on the ringed
pro-Kummer site and descends to the perfectoid tower. It is a rational
identity, not an integral splitting of the Hodge filtration.

Construct the map first from B3.log.3's structural period comparison and
its Hodge–Tate graded filtration on the faithful representation. Its
horizontal Hodge tensors identify the two tensor-frame torsors, so it
factors through `M` and is an isomorphism. Apply associated representations
to obtain every finite-dimensional algebraic coefficient comparison.
Record both conventions: a coefficient of Hodge `μ`-degree `a` has period
twist `−a`; after the BCGP opposite/dual identification of `L_κ`, this is
`κ(μ)`. Prove this dictionary on the standard representation, its
polarization and the central character, before using it for general `κ`.

*Source:* [RC22], equation (4.1) and Theorem 4.2.1, pp.22–23;
[BCGP], §4.5, p.78.

The API:

- `rationalHTLeviTorsor_associated`: associated representations give the
  stated Hodge–Tate graded automorphic bundles with their Tate degrees.
- `rationalHTLeviTorsor_tensor`: unit, tensor, dual and projector maps
  commute with the torsor comparison.
- `rationalHTLeviTorsor_actions`: level maps, Galois and prime-to-`p` Hecke
  pullbacks preserve the comparison; `G(ℚ_p)` acts with the flag action.
- `rationalHTLeviTorsor_boundary`: restriction to a cusp and common fan
  refinement commutes with the log-period construction.

*Needs:* B3.HT.6; B3.log.1–3; B0.3–B0.5; B1.1–B1.6;
B2.1, B2.3, B2.6–B2.8; B3.2, B3.7.
*Lean:* none; specified in the README only.

**Checks.**

- The tensor unit has twist zero, and the polarization pairs the standard
  pieces into their specified Tate line.
- For the standard BCGP `GSp₄` coefficient `(1,0;−1)`, the comparison is
  `ω_A(−1)`; forgetting the Tate torsor gives the wrong Galois action.
- Tensoring two coefficients adds the `μ`-degree; dualizing reverses it.
- The torsor identity is rational even at `p=2`; no integral Hodge splitting
  or integral exceptional-prime assertion is inferred from it.

### B3.HT.8 Functions, algebraic VB⁰ and finite-level cohomology

Construct `algebraicVBZero` on the finite-dimensional algebraic subcategory
of `M`-representations. On the tower write
`O^sm=colim_{K_p}π_{K_p}^{−1}O_{X_{K_p}}` and
`I^sm=colim_{K_p}π_{K_p}^{−1}O_{X_{K_p}}(−D_{K_p})`, with the actual level
maps. For a finite algebraic coefficient `W` define
`VB⁰(W)=colim_{K_p}(π_HT^*W⊗O_∞)^{K_p}` as a sheaf on the tower's finite-level
site. Construct its comparison with the smooth colimit of the corresponding
canonical automorphic bundles and the Tate twist from B3.HT.7. The cusp
version uses `I^sm` and the actual subcanonical finite-level system.

Prove functions descend: the pullback of finite-level `O` is the fixed
subsheaf of completed tower functions. Work on the Kummer root basis,
use B3.log.1's arithmetic `ν_*Ô=O`, and descend through the finite-level
torsor Čech complex. Then use B3.HT.7's tensor frames to reduce algebraic
coefficient descent to this function calculation. Prove exactness and
tensor compatibility on this finite algebraic subcategory. General
locally analytic `VB` is only left exact; no extension to all such
coefficients is part of this definition.

Prove that derived cohomology on this finite-level site equals
`colim_{K_p}RΓ(X_{K_p},ω^κ_{K_p})(κ(μ))`, and similarly with `−D_{K_p}`.
Use quasi-compact finite-level covers and coherent descent to commute these
filtered colimits, then finite-dimensional proper coherent cohomology and
finite-level descent to prove smooth admissibility: invariants under a
compact open are the corresponding finite-level finite-dimensional
cohomology. Rational finite-group invariants are exact; the infinite tower
step uses the preceding descent, not an unsupported exactness assertion
for all completed continuous representations. Coherent refinement
invariance compares all maps when a group element changes the fan.

*Source:* [BCGP], Proposition 4.3.1, p.71, §§4.5.1–4.5.2, pp.72–73,
the finite-algebraic comparison on p.78, and §§4.6.1–4.6.2, pp.81–82.

The API:

- `algebraicVBZero_functions`: fixed completed functions recover the
  finite-level structural sheaf, compatibly with level and root charts.
- `algebraicVBZero_classical`: the algebraic coefficient is
  `ω^{κ,sm}(κ(μ))`, with the unit, tensor and dual isomorphisms.
- `algebraicVBZero_cusp`: the cusp coefficient is the smooth colimit of
  the actual subcanonical bundles, using the reduced boundary ideals.
- `algebraicVBZero_cohomology`: the ordinary and cusp derived colimit
  comparisons above are natural and their cohomology is smooth admissible.
- `algebraicVBZero_actions`: group, Galois, prime-to-`p` Hecke and common
  fan-refinement maps commute with these comparisons and traces.

*Needs:* B3.HT.6–7; B3.log.1; B3.2, B3.4–B3.6; B4.19;
ShimuraCompactifications C3 (C3.9 `ToroidalRefinement.cohomology_iso`,
C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`, C3.3 `ToroidalHeckeSpan`);
SchemeAndStackFoundations Layers 1–2 (descent and coherent cohomology);
EnhancedDerivedSheaves Layers E1, E2:towers, E3 (derived sheaves, colimits and coherent descent).
*Lean:* none; specified in the README only.

**Checks.**

- For `W=1`, functions descend to `O^sm`, with twist zero.
- For `(1,0;−1)` the descended coefficient is `ω_A(−1)⊗O^sm`;
  replacing it by untwisted `ω_A` loses the Galois normalization.
- At each finite level a cusp section lies in `ω^κ(−D)`. Ordinary sections
  on the open do not substitute for this system.
- A ramified refinement can change boundary multiplicities. The cusp
  comparison uses ideal pushforward and coherent refinement invariance,
  not a false equality of all pulled-back reduced boundary ideals.

### Examples

The genus-two Frobenius degree is `p³`, whereas the canonical subgroup has
rank `p²` at first level. The trace estimate and the subgroup estimate
therefore measure different maps. The Tate torsor makes the classical
standard coefficient `ω_A(−1)` even though the de Rham coefficient itself
is the untwisted Hodge bundle.

### Dependencies

B0–B3; B3.log.1–3; B4.19; B5.1; the named lower-tier flat-group,
perfectoid, local period, derived and sheaf suppliers and the bundle
partner's finite-level compactification layers above. B3.HT.3 uses only
B5.1's elementary finite locally free trace; it does not use B5.10 or
B5.20. The finite-level B5.21–B5.22 chain uses B3.log and B3.BGG and
is independent of B3.HT.


## Layer B4: classical forms and explicit weights

Take global sections on the proper toroidal model and compare them with holomorphic transformation
laws through the canonical boundary frame and projective GAGA. The functional automorphy-factor
adapter reuses Mathlib's `SlashAction`. The modular, Hilbert, Siegel and `GU(1,1)` examples fix the
differential, determinant and similitude conventions. Field base change, the integral forms with
arbitrary coefficients, the ramified Hilbert weight line and the classical VB normalization complete
the layer.

### B4.1 Classical automorphic forms

Define `classicalForms`. For an automorphic coefficient on a smooth projective toroidal model `S_Σ/L`,
define `M(J,K;L)=H⁰(S_Σ,V(J)^can)`. The definition applies to the Hodge/abelian and general
coefficients through their corresponding B2–B3 layers. Use fan-independent sections for the level
space, proper coherent finiteness for finite dimension, and tensoring of sections for
multiplication. `H⁰` on the nonproper open Shimura variety is not a substitute.

*Source:* [Milne90], III §2, p.55 (including the holomorphy-at-infinity caveat); III §7, Definition
7.1, p.62; [LanIntro], §4.2.7, p.50.

The API:

- `classicalForms_section`: A classical form is a global section of the canonical coefficient.
- `classicalForms_fan`: Common refinements induce a canonical identification of M for different
  smooth projective fans.
- `classicalForms_multiply`: Tensoring sections gives `M(J1)×M(J2)→M(J1⊗J2)`.
- `classicalForms_map`: A map `u:V^can→W^can` on the supplied model induces `H⁰(u):M(V)→M(W)`. In the
  supplied Scheme.Modules section map this is exactly SheafOfModules.sectionsMap u.
- `classicalForms_map_id`: For a fixed admitted input V, the induced map of the identity morphism of
  V is the identity on its output.
- `classicalForms_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the induced map of
  v∘u is the composite of the induced map of v with the induced map of u; all datum, level, field
  and model hypotheses remain fixed.

*Needs:* B3.2 (`canonicalExtension`); B3.6 (`fanIndependentSections`); B3.general.1
(`generalCanonicalExtension`); B3.general.3 (`generalBoundaryFunctoriality`); Mathlib
`AlgebraicGeometry.Scheme.Modules`; Mathlib `AlgebraicGeometry.Scheme.Modules.presheaf`; Mathlib
`SheafOfModules.sections`.
*Lean:* none; specified in the README only.

**Checks.**

- `classicalForms_test_unit` (degenerate): For a proper geometrically connected model and trivial
  coefficient, `M=L`.
- `classicalForms_test_curve` (compatibility): For the modular Hodge coefficient `ω^k` the space
  agrees with proper-curve sections of AlgebraicModularFormsAndSerreWeights R15.1.
- `classicalForms_test_open` (non-example): For Spec L[t] with coefficient O, `H⁰=L[t]` has the
  infinite independent family `1,t,t²,…`; it cannot replace the proper geometrically connected model,
  whose unit coefficient has `H⁰=L`.
- `classicalForms_test_map_id` (compatibility): For any supplied Scheme.Modules coefficient V and
  section s, the supplied-section forgetting sends the identity coefficient map to s.
- `classicalForms_test_map_comp` (compatibility): For supplied Scheme.Modules maps `u:V→W` and `v:W→U`,
  mapping a section by v∘u equals mapping first by u then by v.
- `classicalForms_test_map_zero` (degenerate): For any supplied Scheme.Modules map `u:V→W`, its
  global-section map sends the compatible section whose value on every open is zero to the zero
  compatible section.

### B4.2 Cuspidal automorphic forms

Define `cuspForms`. Define `S(J,K;L)=H⁰(S_Σ,V(J)^sub)`. The boundary sequence identifies its image in
M with the kernel of restriction to the reduced boundary. This means vanishing in every boundary
component's ideal in the canonical frame. Use the subcanonical ideal-pushforward comparison for fan
independence. Left exactness suffices for the kernel statement; neither `H¹`-vanishing nor Koecher's
extension theorem makes boundary vanishing automatic.

*Source:* [LanIntro], §4.2.7, p.50; [BCGP], §4.8.2, Theorem 4.8.2, p.101.

The API:

- `cuspForms_include`: `S(J)↪M(J)` is induced by the boundary-ideal inclusion.
- `cuspForms_kernel`: A form is cuspidal iff its restriction to every reduced boundary component is
  zero.
- `cuspForms_tensor`: The product of a cusp form with a classical form is cuspidal in the tensor
  coefficient.
- `cuspForms_map`: A map between canonical coefficients induces the boundary-compatible map on their
  `I_D` twists and hence `S(u):S(V)→S(W)`; the inclusions into classical forms commute with this map.
- `cuspForms_map_id`: For a fixed admitted input V, the induced map of the identity morphism of V is
  the identity on its output.
- `cuspForms_map_comp`: For admitted composable morphisms `u:V→W` and `v:W→U`, the induced map of v∘u is
  the composite of the induced map of v with the induced map of u; all datum, level, field and model
  hypotheses remain fixed.

*Needs:* B3.4 (`subcanonicalExtension`); B4.1 (`classicalForms`); B3.6 (`fanIndependentSections`);
Mathlib `AlgebraicGeometry.Scheme.Modules`; Mathlib `AlgebraicGeometry.Scheme.Modules.presheaf`;
Mathlib `SheafOfModules.sections`.
*Lean:* none; specified in the README only.

**Checks.**

- `cuspForms_test_empty` (degenerate): If `D=∅`, `S(J)=M(J)`.
- `cuspForms_test_constant` (computation): For nonempty boundary and trivial coefficient on a proper
  geometrically connected model, a nonzero constant is not cuspidal.
- `cuspForms_test_crossing` (characterisation): At a two-component crossing a holomorphic
  coefficient is cuspidal iff it lies in the product ideal (q1q2), not merely (q1,q2).

### B4.3 The normalized automorphy factor

Define `AutomorphyFactor`. For a left group action on a complex domain X and a finite-dimensional
complex coefficient V, define a holomorphic linear factor `J:Γ×X→GL_ℂ(V)` by holomorphy in x, `J(1,x)=1`
and `J(gh,x)=J(g,hx)J(h,x)`. Its sections satisfy `f(gx)=J(g,x)f(x)`. Canonical extension and cusp
growth are additional conditions in the specified boundary frame: holomorphic extension and
membership in the reduced boundary ideal, respectively. Frame change u gives
`J′(g,x)=u(gx)J(g,x)u(x)⁻¹`. The underlying functional factor retains the concrete linear equations;
the holomorphic factor additionally requires holomorphy in the base point. The scalar cocycle
printed in [LanIntro], p.49, omits
the shift of the base point in its first factor; here the shift follows from applying the section
transformation law twice, and agrees with Mathlib `UpperHalfPlane.denom_cocycle`. For
`g = h = ((0,−1),(1,0))` at `z = i`, the correct product is `(−1/z)z = −1`; at `z = 2i` the
unshifted product is `z² = −4`, whereas `J(g²,z) = −1`. Thus the unshifted law is false even
for scalar modular factors of weight one.

*Source:* [LanIntro], §4.2.7, pp.49–50.

The API:

- `AutomorphyFactor.trivial`: The normalized functional factor with every coefficient the identity.
- `AutomorphyFactor.normalized`: `J(1,x)=id`.
- `AutomorphyFactor.cocycle`: `J(gh,x)=J(g,hx)∘J(h,x)`, with the indicated shifted base point.
- `AutomorphyFactor.changeFrame`: A holomorphic frame change u gives `J′(g,x)=u(gx)J(g,x)u(x)⁻¹` and
  an isomorphic coefficient.
- `AutomorphyFactor_forget`: Forgetting holomorphy yields the normalized linear cocycle input for
  the existing SlashAction adapter.
- `AutomorphyFactor.ext`: Two normalized functional factors with identical coefficient maps at every
  (k,g,x) are equal; the law proofs carry no extra data. The holomorphic refinement additionally
  retains its declared analytic hypotheses.
- `AutomorphyFactor.changeFrame_id`: Gauge change by the constant identity frame returns the
  original normalized functional factor.
- `AutomorphyFactor.changeFrame_comp`: Changing first by u and then by v equals changing by
  `x↦v(x)∘u(x)`. This is the displayed order of frame composition, not its reverse.

*Needs:* B0.7 (`analyticCoefficient`); B0.8 (`sectionsEquivariant`); B3.2 (`canonicalExtension`);
B3.4 (`subcanonicalExtension`); Mathlib `LinearEquiv.trans`.
*Lean:* none; specified in the README only.

**Checks.**

- `AutomorphyFactor_test_unit` (degenerate): The constant identity coefficient is normalized and
  satisfies the shifted cocycle.
- `AutomorphyFactor_test_frame` (computation): For any factor J and invertible frame function u,
  `J′(g,x)=u(gx)J(g,x)u(x)⁻¹` satisfies the shifted cocycle; at `J=1` this is `u(gx)u(x)⁻¹`.
- `AutomorphyFactor_test_order` (non-example): For `Q²` let `Sx(a,b)=(a+b,b)`, `Sy(a,b)=(a,a+b)`. The
  constant functional factor `J(g,x)=g` for the evaluation action of `GL(Q²)` has `J(SxSy,x)(1,0)=(2,1)`
  and `J(SySx,x)(1,0)=(1,1)`. Reversing coefficient composition fails this test.
- For the modular inversion matrix `S` at
  `z = 2i`, `denom(S²,z) = −1` whereas `denom(S,z)² = −4`. The unshifted scalar law fails.
- On `C₂` acting on itself by left multiplication, choose
  frames `u(1)=id` and `u(t)=Sx` on `Q²`. Gauge-changing the identity factor gives `J(t²,1)(0,1)=(0,1)`,
  whereas the unshifted square `J(t,1)²(0,1)=(2,1)`. Thus the base-point shift is necessary.

### B4.4 The convention adapter to SlashAction

Construct `slashActionOfAutomorphyFactor`. Let `β` index weights, G be a monoid acting on X on the
left, R a semiring and V an R-module. A family `J(k,g,x):V≃_R V` with the normalized shifted cocycle
defines the existing SlashAction `β G (X→V)` by `(f|_k g)(x)=J(k,g,x)⁻¹(f(gx))`. Prove its additive and
R-linear laws, its dependence only on the coefficient maps and its equality with precomposition when
`J=1`. Its right-action multiplication is `f|_k(gh)=(f|_k g)|_k h`.

*Source:* [LanIntro], §4.2.7, p.49.

The API:

- `slashActionOfAutomorphyFactor_map_apply`: The map evaluates to `J(k,g,x)⁻¹(f(gx))`.
- `slashActionOfAutomorphyFactor_invariant_iff`: `∀g,f|_k g=f` iff `∀g,x,f(gx)=J(k,g,x)f(x)`.
- `slashActionOfAutomorphyFactor_map_smul`: Slash is R-linear on functions.
- `slashActionOfAutomorphyFactor_congr`: Pointwise equal coefficient families give equal SlashAction
  values, independent of proof terms.
- `slashActionOfAutomorphyFactor_map_of_trivial`: If J is identity, map is precomposition by the
  left base action.

*Needs:* Mathlib `SlashAction`; Mathlib `LinearEquiv.trans`; Mathlib `LinearEquiv.trans_symm`;
Mathlib `LinearEquiv.symm_apply_eq`; Mathlib `LinearEquiv.automorphismGroup`; Mathlib
`LinearEquiv.applyDistribMulAction`.
*Lean:* none; specified in the README only.

**Checks.**

- `slashActionOfAutomorphyFactor_test_trivial` (degenerate): For identity J, f|g is `x↦f(gx)`.
- The zero function is fixed for every
  normalized coefficient.
- `slashActionOfAutomorphyFactor_test_frame` (characterisation): The frame change
  `J′(g,x)=u(gx)J(g,x)u(x)⁻¹` yields exactly `u(x)J(g,x)⁻¹u(gx)⁻¹f(gx)`;
  at `J=1` this is `u(x)u(gx)⁻¹f(gx)`.
- For the two rational shears,
  applying the inverse composite in the wrong order changes the value on `(1,0)`.
- The rational shearX applied to the
  constant `(0,1)` has slash value `(−1,1)`, detecting an operator that forgets the inverse.
- For SL2(Z), `V=C` and
  `J(k,g,z)=denom(g,z)^k` as a scalar linear automorphism, the adapter equals Mathlib’s scalar slash
  action.
- The normalized nonzero factor
  on C2 with nonidentity value 2 transforms the zero section but fails `J(gh)=J(g)J(h)`; this is not
  accepted as an adapter input.
- The determinant-negative GL2(R)
  slash law has conjugated scalar multiplication and cannot be represented by this C-linear adapter.

### B4.5 Evaluation of the slash adapter

Prove `slashActionOfAutomorphyFactor_map_apply`. For exactly the family and hypotheses used in
slashActionOfAutomorphyFactor, evaluate the map as `J(k,g,x)⁻¹(f(gx))`. This is the defining-map
formula, without an additional invertibility or nonzero-section assumption.

*Source:* [LanIntro], §4.2.7, p.49.

*Needs:* B4.4 (`slashActionOfAutomorphyFactor`).
*Lean:* none; specified in the README only.

**Checks.**

- No nowhere-zero assumption on f is used.

- At the identity element, normalization gives `f|1=f` pointwise.

- For a constant invertible scalar factor `a` at a fixed group element, the adapter evaluates as `a⁻¹f(gx)`, so `a=2` gives a factor `1/2`.

### B4.6 Invariance and the transformation law

Prove `slashActionOfAutomorphyFactor_invariant_iff`. For the same normalized linear family, prove
that f|_k `g=f` for every g is equivalent to `f(gx)=J(k,g,x)f(x)` for every g,x. Apply the linear
equivalence at each point; no cancellation of a selected nonzero section is involved.

*Source:* [LanIntro], §4.2.7, p.49.

*Needs:* B4.5 (`slashActionOfAutomorphyFactor_map_apply`); Mathlib `LinearEquiv.symm_apply_eq`.
*Lean:* none; specified in the README only.

**Checks.**

- The zero function satisfies both sides.

- With trivial factor and trivial base action every function is invariant and satisfies the transformation law.

- `slashActionOfAutomorphyFactor_sign_invariant_iff` (boundary): If an element of the
  acting monoid has coefficient `v ↦ −v` on a one-dimensional fibre over a point and the
  coefficient field has `2 ≠ 0`, invariance is equivalent to vanishing. This includes the
  sign action of `C₂` in characteristic zero; in characteristic two the sign acts trivially.

### B4.7 The inverse-base right cocycle

Prove `inverse_base_action_cocycle`. If G and H are groups and `J:G×X→H` obeys the left shifted
cocycle, the right base action `x·g=g⁻¹x` has factor `J_right(x,g)=J(g⁻¹,x)`. Its law is
`J((gh)⁻¹,x)=J(h⁻¹,g⁻¹x)J(g⁻¹,x)`. This changes the action on the base; the right slash action on
functions is the separate construction of B4.4.

*Source:* [LanIntro], §4.2.7, p.49.

*Needs:* B4.3 (`AutomorphyFactor`).
*Lean:* none; specified in the README only.

**Checks.**

- Noncommuting coefficient maps distinguish the product order.

- At the identity the inverse-base action and factor are the identity action and `1`.

- For a character `J(g,x)=χ(g)`, the right factor is `χ(g)⁻¹`; a character of order greater than two detects omission of the inverse.

### B4.8 When a section detects a scalar cocycle

Prove `cocycle_at_of_automorphy_of_ne_zero`. For a monoid action, a field K and scalar functions
`J:G×X→K` and `f:X→K` satisfying `f(gx)=J(g,x)f(x)`, prove the shifted cocycle at any x where `f(x)≠0`.
Compare f((gh)x) with its iterated transformation and cancel f(x). There is no such deduction at a
zero of f; the identically zero section imposes no cocycle condition.

*Source:* [LanIntro], §4.2.7, p.49.

*Needs:* Mathlib `MulAction`.
*Lean:* none; specified in the README only.

**Checks.**

- For C2 acting trivially on a point, `J(nonidentity)=2` and `J(identity)=1` transforms zero but
  violates the cocycle because `4≠1`.

- For a trivial action at a point with `f=1`, the transformation law forces `J(g)=1` for every `g`, hence the cocycle.

- On a two-point free orbit a nowhere-zero function gives `J(g,x)=f(gx)/f(x)`; the intermediate values cancel in the shifted product.

### B4.9 Geometric and analytic classical forms

Prove `analyticClassicalComparison`. Under `L↪ℂ`, compare M with holomorphic equivariant sections of
the analytic coefficient whose components extend holomorphically in canonical cusp frames. Compare S
with those components in the reduced boundary ideal. Use the local removable-singularity result for
logarithmic growth and coordinatewise divisibility, then projective coherent GAGA on `S_Σ`. Scalar
boundedness on the Baily–Borel model requires the separately descended scalar line. A degree-zero
kernel comparison in the course notes does not prove a full Dolbeault resolution.

*Source:* [LanIntro], §4.2.7, pp.49–50; [HarrisLog], p.3, degree-zero kernels only.

*Needs:* B4.1 (`classicalForms`); B4.2 (`cuspForms`); B2.2 (`automorphicAnalyticComparison`); B0.8
(`sectionsEquivariant`); B3.2 (`canonicalExtension`); B3.4 (`subcanonicalExtension`); ShimuraCompactifications C5
(C5.17 `IntegralMinimalModel.hodgeLine_ample`, C5.13 `IntegralToroidalModel.hodgeLine_semiample`, C5.14 `IntegralToroidalModel.hodgeSectionAlgebra_fg`); ComplexComparisonPartII C2 (`projectiveGeometricDictionaries`);
ComplexComparisonPartII §C1.9 (proper coherent GAGA).
*Lean:* none; specified in the README only.

**Checks.**

- Changing a frame arbitrarily can change apparent boundedness; the theorem names the canonical
  frame. Negative-determinant full GL2 uses its semilinear extension.

- On the Tate modular cusp in its differential frame, `q^n` with `n>0` is cuspidal and `1` is holomorphic but not cuspidal.

- At a two-divisor crossing, a holomorphic component divisible only by the first coordinate is not in the full reduced boundary ideal.

### B4.10 The GL₂ Hodge-line specialization

Prove `gl2HodgeLineComparison`. At a fine modular level on the actual modular-curve model, identify
`ω=e*Ω¹_{E/S}`, its generalized-elliptic canonical extension and weight-k coefficient `ω^k` for every
integer k; negative powers mean duals. Import R15.1's proper-curve geometric forms and their
all-cusp analytic comparison to Mathlib ModularForm/CuspForm. Match the uniformization, Hodge dual
convention, holomorphy and every cusp condition. Use `SL₂` for the `ℂ`-linear factor adapter and the
separate semilinear law for determinant-negative `GL₂`.

*Source:* [LanIntro], §4.2.7, pp.49–50; [HarrisBundles], pp.1–2.

*Needs:* B2.2 (`automorphicAnalyticComparison`); B4.9 (`analyticClassicalComparison`);
AlgebraicModularFormsAndSerreWeights R15.1 (*Geometric modular forms*, *All-weight analytic
comparison*); Mathlib `ModularForm`; Mathlib `CuspForm`; Mathlib `ModularForm.SL_slash_apply`;
Mathlib `ModularForm.slash_action_eq'_iff`; Mathlib `ModularForm.smul_slash`; Mathlib
`UpperHalfPlane.denom_ne_zero`; Mathlib `UpperHalfPlane.denom_cocycle`; Mathlib
`UpperHalfPlane.denom_cocycle'`; TauCetiRoadmap.ModularForms Layer 10C (the automorphy sheaf on
`X(Γ)`).
*Lean:* none; specified in the README only.

**Checks.**

- For `k=0` the coefficient is O; an odd weight does not descend through a surviving `−1` stabilizer.

- Weight one gives the invariant-differential line; weight minus one gives its dual, not a second copy of the same line.

- At non-full level the cusp condition is tested at every cusp; vanishing of one infinity constant does not replace the all-cusp comparison.

### B4.11 Arithmetic Hilbert weights

Define `HilbertArithmeticWeight` for an index type `I` by integers `k_τ` and a common integer w
with `k_τ≡w` mod 2. For an arithmetic Hilbert coefficient `I` is the finite set of real embeddings
of F; the integer-data definition and its parity identities need no finiteness hypothesis. Put `m_τ=(w−k_τ)/2`
and prove `2m_τ=w−k_τ`. Define addition and extensionality by the actual integer data. This is a
weight label; field and central descent are separate theorems. Allow negative `k_τ` and negative
determinant exponents.

*Source:* [Milne90], III §8, pp.63–64; [LanIntro], §4.2.7, pp.49–50; [Diamond21], §3.2, tensor
coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12.

The API:

- `HilbertArithmeticWeight.k`: The embedding-indexed integer `k_τ`.
- `HilbertArithmeticWeight.w`: The common integer central weight w.
- `HilbertArithmeticWeight.detExponent`: `m_τ=(w−k_τ)/2`.
- `HilbertArithmeticWeight.two_mul_detExponent`: `2m_τ=w−k_τ` for every `τ`.
- `HilbertArithmeticWeight.add`: Pointwise k addition and w addition preserve arithmetic parity.
- `HilbertArithmeticWeight.ext`: Arithmetic weights with the same embedding-indexed k and the same w
  are equal; parity proofs carry no extra data.

*Needs:* Mathlib `Int.emod_two_eq_zero_or_one`.
*Lean:* none; specified in the README only.

**Checks.**

- `k=0,w=0` is an arithmetic weight and every `m_τ=0`.
- `HilbertArithmeticWeight_test_negative` (computation): For one embedding, `k=4,w=2` gives `m=−1`, so
  forbidding negative determinant twists would lose an allowed weight.
- `HilbertArithmeticWeight_test_parity` (non-example): `k=3,w=2` violates parity and is not an
  arithmetic weight.
- At one index, adding `(k,w) = (4,2)` to
  `(2,0)` gives `(6,2)` and determinant exponent `−2`, the sum of the two exponents `−1`.
  For every index type and arithmetic weight `a`, addition with `(0,0)` on either
  side fixes `a`, and addition with `(-k,-w)` gives `(0,0)`; its parity follows
  from that of `a`.


### B4.12 The split Hilbert coefficient

Construct `hilbertCoefficient`, the identification of H5.3 `hodgeSplittingDescent` and
H5.4 `algebraicWeightsUnits` with B2.1's uniform associated-bundle functor. Over a
characteristic-zero splitting field L for F and the actual Hilbert–Blumenthal family, take a
`HilbertArithmeticWeight (k,w)` and use `H¹_dR=⊕_τH_τ` and `ω=⊕_τω_τ`, with ranks two and one.
Set `δ_τ=det H_τ` and identify the supplied line
`ω^{(k,w)}=⊗_τ(ω_τ^{k_τ}⊗δ_τ^{(w−k_τ)/2})` with the associated coefficient.
In cohomological frames `t_τ` acts on `ω_τ` by `t_τ` and on
`δ_τ` by `t_τ²`, giving the central character Norm(t)^w. Homology frames invert it. Tensor products
correspond to addition of arithmetic weights.

*Source:* [Milne90], III §8, pp.63–64; [LanIntro], §4.2.7, pp.49–50; [Diamond21], §3.2, tensor
coefficient formula, Definition 3.2.1 and paritious-weight paragraph, p.12.

The API:

- `hilbertCoefficient_formula`: The line equals the displayed tensor of `ω_τ` powers and determinant
  powers.
- `hilbertCoefficient_central`: Its cohomological-frame central action is Norm(t)^w.
- `hilbertCoefficient_add`: Coefficient tensor products correspond to addition of arithmetic
  weights.

*Needs:* B4.11 (`HilbertArithmeticWeight`); B2.1 (`automorphicVectorBundle`); B0.3
(`hodgeParabolicConvention`); HilbertModularVarietiesAndShimuraCurves H1 (Hilbert–Blumenthal
families and their `O_F ⊗ O`-modules), H5.3 (`hodgeSplittingDescent`),
H5.4 (`algebraicWeightsUnits`).
*Lean:* none; specified in the README only.

**Checks.**

- `hilbertCoefficient_test_rational` (compatibility): For `F=Q`, `(k,w=k)` has `m=0` and gives `ω^k`.
- `hilbertCoefficient_test_determinant` (computation): For every embedding `k_τ=0,w=2`, the
  coefficient is `⊗_τdet H_τ`.
- `hilbertCoefficient_test_negative` (non-example): At `k_τ=4,w=2` the determinant factor is `δ_τ⁻¹`;
  replacing m by its absolute value changes the central character.

### B4.13 The Hilbert central-action check

Prove `hilbertCentralDescent`, identifying H5.4's scalar-stabilizer descent maps with B0.2
and B2.1's uniform coefficient descent. For the actual `Res_{F/ℚ}GL₂` or `G*` quotient and its ineffective
central subgroup C, the split coefficient descends precisely when Norm(t)^w, or its homology
inverse, is trivial on C. Totally positive norm-one units pass this test, but remaining signs and
finite stabilizers need their own check. Use H0/H3/H4's true polarization and unit quotient for `G*`,
retaining the stack coefficient if descent fails.

*Source:* [Milne90], III §8, pp.63–64; [Diamond21], §3.2, tensor coefficient formula, Definition
3.2.1 and paritious-weight paragraph, p.12.

*Needs:* B4.12 (`hilbertCoefficient`); B0.2 (`ineffectiveFibreDescent`);
HilbertModularVarietiesAndShimuraCurves H0 (Hilbert data, centres and effective quotients);
HilbertModularVarietiesAndShimuraCurves H3 (polarization and unit quotients);
HilbertModularVarietiesAndShimuraCurves H5.4 (`algebraicWeightsUnits`);
HilbertModularVarietiesAndShimuraCurves H4 (central level kernels and stabilizers).
*Lean:* none; specified in the README only.

**Checks.**

- Neatness alone never discharges the infinite-unit condition; norm `−1` and a parity-odd w can
  obstruct a quotient that includes such units.

- A totally positive norm-one central unit acts by `1` on every integer arithmetic weight in the stated norm-character convention.

- The weight `w=0` gives trivial central norm character, but passage to a coarse non-neat quotient still requires trivial finite stabilizer action.

### B4.14 Hilbert coefficients without a global splitting

Prove `unsplitHilbertDescent`, comparing H5.3's semilinear embedding-permutation descent
and H5.4's weight line with B0.9 and B2.1. Work in characteristic zero. Before a splitting extension use the `O_F⊗O`-linear Hodge and de Rham
modules with their determinant/norm constructions, rather than global embedding idempotents. After
splitting, descend the labelled tensor coefficient using the actual Galois permutation of embeddings
and representation datum, together with the central descent condition. Its field is the
weight/representation field and can exceed the reflex field. The comparison intertwines the
supplied descent cocycles, tensor maps and central quotient. Ramified integral lines use B3.Hilbert.0
and B4.15.

*Source:* [Milne90], III §5, Theorem 5.1, p.61; III §8, pp.63–64.

*Needs:* B4.12 (`hilbertCoefficient`); B0.9 (`coefficientGaloisDescent`); B4.13
(`hilbertCentralDescent`); HilbertModularVarietiesAndShimuraCurves H1 (Hilbert–Blumenthal families
and their `O_F ⊗ O`-modules), H5.3 (`hodgeSplittingDescent`), H5.4 (`algebraicWeightsUnits`);
B2.1 (`automorphicVectorBundle`).
*Lean:* none; specified in the README only.

**Checks.**

- A nonparallel real-quadratic weight is exchanged by the two embeddings, so it is not automatically
  Q-defined.

- A parallel tensor of two real-quadratic embedding lines has the factor-swap descent datum; applying the swap twice is identity.

- Before splitting, the determinant over the base ring of the Hodge module has rank one; it is not formed using nonexistent global embedding projectors.

### B4.15 The ramified Hilbert weight line

Construct `ramifiedHilbertLine`. Let `F ≠ ℚ` be totally real, `p` a prime that may ramify in `F`
(including `p = 2`), `O` the valuation ring of a sufficiently large `p`-adic field with the set `Θ`
of embeddings of `F`, and `Ỹ` Diamond's Pappas–Rapoport splitting model of the Hilbert modular
variety of prime-to-`p` level `U(N)` over `O`, with its toroidal and minimal compactifications and
the open immersion `j̃ : Ỹ → Ỹ^min`. For `k, m ∈ ℤ^Θ` and a Noetherian `O`-algebra `R`, let
`Ã_{k,m,R} = ⊗_θ ω_θ^{k_θ} ⊗ δ_θ^{m_θ}` be the line bundle on `Ỹ_R` built from the splitting
filtration, with one line `ω_θ` and one determinant line `δ_θ` for each embedding and duals for
negative exponents. The semi-abelian extension of the universal family gives a formally canonical
extension of `Ã_{k,m,R}` to `Ỹ^tor_R`, and `j̃_*Ã_{k,m,R}` is coherent on `Ỹ^min_R`. For a
sufficiently small level `U` prime to `p` such that the character `χ_{k+2m,R}` is trivial on
`O_F^× ∩ U`, `Ã_{k,m,R}` descends to a line bundle `A_{k,m,R}` on `Y_R`, and `i_*A_{k,m,R}` is
coherent on `Y^min_R` for `i : Y_R → Y^min_R`. The descent hypothesis forces either `pⁿR = 0` for
some `n > 0` or `k_θ + 2m_θ` independent of `θ`.

*Hypotheses.* `R` is a Noetherian `O`-algebra and `U` is prime to `p` and sufficiently small; the
trivial-unit-character condition is part of the construction of `A_{k,m,R}` on `Y_R`. The
pushforward to the minimal model is coherent and need not be invertible.

*Source:* [Diamond22], §2.9, p.7, and §2.10, pp.7–8; §6.1, p.24; [Diamond21], §3.2, Definition 3.2.1
and the paritious-weight paragraph, p.12.

The API:

- `ramifiedHilbertLine_tensor`: `A_{k,m} ⊗ A_{k′,m′} ≅ A_{k+k′,m+m′}` and `A_{0,0} = O`.
- `ramifiedHilbertLine_baseChange`: formation commutes with maps `R → R′` of Noetherian
  `O`-algebras.
- `ramifiedHilbertLine_canonical`: the extension to `Ỹ^tor_R` is formally canonical, with completion
  along the boundary as described by Diamond 2021, Proposition 7.2.1.
- `ramifiedHilbertLine_minimal`: `i_*A_{k,m,R}` is coherent on `Y^min_R`.
- `ramifiedHilbertLine_unramified`: where `p` is unramified, `ω_θ` and `δ_θ` are the embedding
  components of B4.12, and for parallel `k + 2m = w` the line is that coefficient for the arithmetic
  weight `(k, w)`.

*Needs:* B3.Hilbert.1–3 (splitting-model compactifications, semi-abelian
coefficient lines and completed descent); B3.Hilbert.0 (open splitting filtration);
HilbertModularVarietiesAndShimuraCurves H3 (unit and polarization quotients); B4.11–B4.12
(Hilbert arithmetic weight and its characteristic-zero coefficient comparison).
*Lean:* none; specified in the README only.

**Checks.**

- `ramifiedHilbertLine_test_zero` (degenerate): `(k, m) = (0, 0)` gives `O_Y`.
- `ramifiedHilbertLine_test_parallel` (compatibility): for `k = (1, …, 1)` and `m = 0` over a
  characteristic-zero `R`, `A_{k,m}` is `⊗_θ ω_θ = det_R(ω)`, the determinant of the
  rank-`[F : ℚ]` Hodge bundle over the base ring, and agrees with B4.12 at `k_τ = 1`, `w = 1`.
- `ramifiedHilbertLine_test_descent` (non-example): for `F` real quadratic, `R` nonzero and flat over `O` and
  `k + 2m = (1, 3)`, a unit `u` of norm one has `χ(u) = θ₁(u) θ₂(u)³ = θ₁(u)⁻²`, which is not `1`
  unless `u = ±1`; so the unit condition fails on every finite-index subgroup of `O_F^×` and
  `Ã_{k,m,R}` does not descend to `Y_R`. A definition that ignores the unit character produces a
  sheaf on the wrong space. For the zero `O`-algebra the model is empty and the line descends.

### B4.16 Siegel Schur and determinant coefficients

Construct `siegelCoefficient`. For a rank-g cohomological Hodge bundle `ω` and dominant integer
`λ₁≥⋯≥λ_g`, set `a_i=λ_i−λ_g` and define `S_a(ω)⊗det(ω)^{λ_g}` in characteristic zero. Declare the
similitude/Tate character independently. For a good integral base require the actual integral Schur
representation. Compare with BCGP's two tautological Levi coefficients using the opposite/dual
switch from B2, without asserting a split Hodge sequence. Scalar `λ=(r,…,r)` gives `det(ω)^r`;
`λ=(1,0,…,0)` gives the rank-g `ω`.

*Source:* [BCGP], §3.2.19, p.45; §4.8.1–4.8.2, pp.101–102; [HLTT], Appendix B.8, pp.270–271.

The API:

- `siegelCoefficient_schur`: The coefficient is `S_(λ−λ_g)(ω)⊗det(ω)^{λ_g}` with its separately
  declared central twist.
- `siegelCoefficient_scalar`: For `λ=(r,…,r)` the coefficient is `det(ω)^r`.
- `siegelCoefficient_standard`: For `λ=(1,0,…,0)` it is `ω`.

*Needs:* B2.1 (`automorphicVectorBundle`); B2.3 (`leviHighestWeightConvention`); PELModuli M3
(fine-level universal abelian families); PELModuli M5 (the Siegel and split `GU(1,1)` examples);
AbelianSchemesAndArithmeticModuli A4 (`AbelianH1dR` with its Hodge sequence and Gauss–Manin
connection, `AbelianTate`, `exteriorCohomology`);
TauCetiRoadmap.RepresentationTheory.ClassicalGroups Layer 2 (`schurFunctor`).
*Lean:* none; specified in the README only.

**Checks.**

- `siegelCoefficient_test_g1` (compatibility): For `g=1` the coefficient is the modular Hodge-line
  power `ω^{λ₁}`.
- `siegelCoefficient_test_det` (computation): For `λ=(−1,…,−1)` it is `det(ω)⁻¹`, not a polynomial-only
  Schur coefficient.
- `siegelCoefficient_test_standard` (non-example): For g>1, `λ=(1,0,…,0)` yields rank g, so replacing
  every Siegel coefficient by a scalar determinant power fails.

### B4.17 A split unitary coefficient test

Construct `unitaryCoefficient`. For the imaginary-quadratic `GU(1,1)` PEL datum over L containing the
two labelled embeddings `τ` and `barτ`, take `H¹_dR=H_τ⊕H_barτ` with rank-two summands and rank-one Hodge
lines. In cohomological graded frames the `GL₁×GL₁×G_m` coefficient (k,l;n) is `ω_τ^k⊗ω_barτ^l⊗ν^n`,
with `ν` the specified similitude/Tate line. Negative exponents use duals. Conjugation swaps k and l
and transports the PEL datum; no universal determinant identification of `ν` is assumed.

*Source:* [HLTT], Appendix B.8, pp.270–271; [CS], §2.3, pp.669–670.

The API:

- `unitaryCoefficient_formula`: The labelled weight coefficient is `ω_τ^k⊗ω_barτ^l⊗ν^n`.
- `unitaryCoefficient_dual`: The dual weight is `(−k,−l;−n)`, with dualized similitude line.
- `unitaryCoefficient_conjugate`: The embedding permutation transports (k,l;n) to (l,k;n) and the
  transported PEL coefficient.

*Needs:* B2.1 (`automorphicVectorBundle`); B0.9 (`coefficientGaloisDescent`); B0.2
(`ineffectiveFibreDescent`); PELModuli M0 (PEL data and their compact duals); PELModuli M3
(fine-level universal abelian families); PELModuli M5 (the Siegel and split `GU(1,1)` examples).
*Lean:* none; specified in the README only.

**Checks.**

- `unitaryCoefficient_test_unit` (degenerate): Weight `(0,0;0)` gives O.
- `unitaryCoefficient_test_line` (computation): Weight `(1,0;0)` gives `ω_τ`, while `(0,1;0)` gives the
  differently labelled `ω_barτ`.
- `unitaryCoefficient_test_twist` (non-example): Weight `(0,0;1)` is `ν`, so erasing the formal
  similitude/Tate line loses a coefficient even when `k=l=0`.

### B4.18 Rational forms and field base change

Prove `numberFieldFormsBaseChange`. For a proper toroidal model over L and a coherent canonical or
subcanonical coefficient F, prove finite dimension of `H⁰` and the field-extension isomorphism
`H⁰(S_Σ,F)⊗_L L′≃H⁰(S_Σ×_L L′,F_L′)`. Under `L↪ℂ` this identifies the rational classical or cusp space
inside its analytic counterpart. Check products and coefficient maps. An integral special-fibre
base-change assertion would require different hypotheses.

*Source:* [Milne90], III §7, Definition 7.1 and Proposition 7.2, p.62; Corollary 7.3, p.63.

*Needs:* B4.1 (`classicalForms`); B4.2 (`cuspForms`); B3.9 (`canonicalRationalDescent`); B4.9
(`analyticClassicalComparison`).
*Lean:* none; specified in the README only.

**Checks.**

- A characteristic-zero field extension is flat; reduction modulo p may have extra forms and is not
  covered.

- For the unit on a proper geometrically connected model, the base-change map is `L⊗_L L′≃L′`.

- On `Spec L[t]` the unit section space has the independent powers of `t` and is not finite-dimensional; properness cannot be omitted from that conclusion.

### B4.19 Sections on quasi-compact quasi-separated stacks and filtered colimits

Prove `qcqsSectionsColimit`. On a quasi-compact and quasi-separated algebraic stack `𝒳`,
homomorphisms out of a finitely presented `O_𝒳`-module `𝓖` commute with filtered colimits: for every
directed system `(𝓕_i)` of `O_𝒳`-modules, a map `𝓖 → colim_i 𝓕_i` factors through some `𝓕_i`,
uniquely up to passing further along the system. Taking `𝓖 = O_𝒳` shows that global sections of
quasi-coherent modules on `𝒳` commute with filtered colimits. Applied to `𝓕_i = 𝓔 ⊗_R M_i`, for a
locally free `𝓔` and the finitely generated submodules `M_i` of an `R`-module `M`, every section of
`𝓔 ⊗_R M` comes from some `𝓔 ⊗_R M_i`.

*Hypotheses.* Quasi-compactness and quasi-separatedness of `𝒳` and finite presentation of `𝓖` are
both needed. The statement concerns filtered colimits; no commutation of sections with infinite
products is asserted.

*Source:* [StacksColimit], 0GQZ, Lemma 103.13.5.

*Needs:* SchemeAndStackFoundations Layer 1 (§1.22).
*Lean:* none; specified in the README only.

**Checks.**

- For an infinite direct sum `M = ⊕_{n∈ℕ} R` the sections of `𝓔 ⊗_R M` are `⊕_n Γ(𝓔)`; for the
  product `∏_n R` no such statement is made, and the expansion principle of Layer B5 never uses one.
- On a non-quasi-compact scheme `⊔_{n∈ℕ} Spec R` the global sections of `O ⊗ M` are `∏_n M`, and
  `colim` over finitely generated submodules of `M` fails to reach them when `M` is not finitely
  generated; the qcqs hypothesis is necessary.

- On `Spec R` with finitely presented source `R^n`, a homomorphism into a filtered colimit is specified by `n` elements, which occur together at a finite stage. An infinitely generated free source need not have this property.

### B4.20 Integral automorphic forms with arbitrary coefficient modules

Define `integralForms`. On Lan's good-prime PEL toroidal model `M^tor_H` over `O_{F₀,(□)}`, the
proper smooth algebraic stack attached to a compatible choice of smooth projective cone
decompositions, let `ω_tor = ∧^top Lie^∨_{G^tor/M^tor}` be the Hodge invertible sheaf of the
tautological semi-abelian scheme. For `k ≥ 0` and an arbitrary `O_{F₀,(□)}`-module `M` define
`AF(k, M) = Γ(M^tor_H, ω_tor^{⊗k} ⊗_{O_{F₀,(□)}} M)`, the automorphic forms of naive parallel weight
`k` with coefficients in `M`. For vector coefficients put `AF(W, M) = Γ(M^tor_H, Ecan(W) ⊗_R M)` and
`AF_cusp(W, M) = Γ(M^tor_H, Esub(W) ⊗_R M)`, with `Ecan` and `Esub` from B3.10. The coefficient
module is tensored inside the sheaf: `Γ(Ecan(W)) ⊗_R M` is a different module in general. As a
functor of `M`, `AF(W, −)` is left exact and commutes with filtered colimits, and it does not depend
on the cone decomposition.

*Hypotheses.* `M` is arbitrary: it need not be flat, finitely generated or an algebra. The weight is
the naive parallel weight of the Hodge line or a representation `W` as in B3.10.

*Source:* [LanPEL], Definition 7.1.1.1 and Remark 7.1.1.3, p.532; Lemma 7.1.1.4, pp.532–533.

The API:

- `integralForms_map`: an `R`-linear map `M → N` induces `AF(W, M) → AF(W, N)`, with identity and
  composition laws.
- `integralForms_colimit`: `AF(W, colim_i M_i) = colim_i AF(W, M_i)` for a filtered system, by
  B4.19.
- `integralForms_fan`: for a refinement `Σ′` of `Σ`, pullback gives `AF_Σ(W, M) ≅ AF_{Σ′}(W, M)` and
  the same for cusp forms (ShimuraCompactifications C3.9 `ToroidalRefinement.cohomology_iso`).
- `integralForms_cusp_include`: `AF_cusp(W, M) → AF(W, M)`, induced by `I_D ⊂ O`, is injective.
- `integralForms_charZero`: for `M = L` a characteristic-zero field over the base, `AF(W, L)` and
  `AF_cusp(W, L)` are B4.1 and B4.2 of the automorphic bundle of `W`.

*Needs:* B3.10 (`integralLeviCoefficient`); B4.1 (`classicalForms`); B4.2 (`cuspForms`); B4.19
(`qcqsSectionsColimit`); ShimuraCompactifications C5 (C5.3 `IntegralToroidalModel`);
ShimuraCompactifications C3 (C3.9 `ToroidalRefinement.cohomology_iso`).
*Lean:* none; specified in the README only.

**Checks.**

- `integralForms_test_zero` (degenerate): `AF(k, 0) = 0`.
- `integralForms_test_field` (compatibility): for `M` a characteristic-zero field the module is the
  classical space `M(J, K; L)` of B4.1 for the determinant-Hodge coefficient of weight `k`.
- `integralForms_test_leftExact` (characterisation): for `0 → R →^p R → R/p → 0` with `p` a
  nonzerodivisor on the flat model, the sequence `0 → AF(k, R) → AF(k, R) → AF(k, R/p)` is exact and
  the last map is onto exactly when `H¹(M^tor_H, ω_tor^k)` has no `p`-torsion. The alternative
  `AF(k, R) ⊗_R M` would make the last map onto in every case, so it fails as soon as that `H¹` has
  `p`-torsion.
- `integralForms_test_fan` (compatibility): the module does not change when `Σ` is replaced by a
  smooth projective refinement.

### B4.21 The classical VB coefficient normalization

Prove `classicalVBTateNormalization`. In BCGP's Hodge-type setting, fix neat tame `K^p`, a p-adic
field large enough for the split group and reflex embeddings, compatible toroidal fans, and the
rational Hodge–Tate `M`-torsor and finite-algebraic `VB⁰` constructed in B3.HT.6–8. For an algebraic Levi
coefficient `L_κ` identify `VB⁰_Σ(L_κ)≃ω^{κ,sm}(κ(μ))`, where `ω^{κ,sm}=colim_{K_p}ω^κ_{K_p}` has the
classical rational structure. Transport the comparison when the group action moves fans, using
compatible refinements. The `μ`-weight twist belongs to this identification; §4.8's coherent
convention is untwisted.

*Source:* [BCGP], §4.5, proof end p.78.

*Needs:* B3.HT.6–8 (actual Hodge-type toroidal tower, rational period torsor
and algebraic descent); B2.1, B2.3; B1.5, B1.10; B3.2, B3.6.
*Lean:* none; specified in the README only.

**Checks.**

- For the tensor unit `κ=0` the twist is zero. In §4.8 the underlying coherent `ω^κ` is used without
  retaining the §4.5 twist twice.

- For `GSp₄` and `κ=(1,0;−1)`, the coefficient is `ω_A(−1)⊗O^sm`.
- Tensoring with a central character of nonzero `μ`-degree changes the Tate
  twist by that degree; the tensor-unit check alone would miss its sign.

### Examples

- For a proper geometrically connected model the unit coefficient has `H⁰ = L`, while on `Spec L[t]`
  the sections `1, t, t², …` are independent; properness is essential (B4.1).
- For an arithmetic Hilbert weight with `k = 4`, `w = 2` at one embedding the determinant exponent
  is `m = −1`; replacing it by its absolute value changes the central character (B4.11, B4.12).
- For the rational shears `S_x(a, b) = (a + b, b)` and `S_y(a, b) = (a, a + b)` and the constant
  factor `J(g, x) = g`, `J(S_xS_y, x)(1, 0) = (2, 1)` while `J(S_yS_x, x)(1, 0) = (1, 1)`; the slash
  adapter sends the constant `(1, 0)` to `(1, −1)` under `S_xS_y` (B4.3, B4.4).
- For `0 → ℤ_(p) → ℤ_(p) → 𝔽_p → 0` the map `AF(k, ℤ_(p)) → AF(k, 𝔽_p)` is onto exactly when
  `H¹(ω_tor^k)` has no `p`-torsion (B4.20).

### Dependencies

Layers B0–B3.general; AlgebraicModularFormsAndSerreWeights R15.1; ComplexComparisonPartII C2;
HilbertModularVarietiesAndShimuraCurves H0–H4; PELModuli M0, M3, M5; ShimuraCompactifications C3,
C5, C6; TauCetiRoadmap RepresentationTheory/ClassicalGroups Layer 2; Mathlib `SlashAction`,
`ModularForm`, `CuspForm`; B3.Hilbert.1–3 and B3.HT.6–8.

## Layer B5: Hecke action and Fourier expansions

This layer works in four distinct geometric settings: determinant-weight good-prime PEL
coefficients, finite projective vector coefficients on the same PEL models, prime-to-`p` ramified
Hilbert coefficients, and the characteristic-zero classical Siegel comparison; each target names its
base and model. B5.1a constructs the scalar expansion with degree modules
`Γ(C_Φ, Ψ_Φ(ℓ) ⊗ L_Φ^k ⊗_R M)` directly on the abelian torsor for arbitrary `M`.
ShimuraCompactifications C5.15 `HodgeLineFJ` instead tensors after pushforward; comparison
requires the coefficient base-change isomorphism specified in B5.1a.
This layer proves the expansion principle for it — injectivity on prime quotients, then finite
modules by a prime filtration, then arbitrary modules by filtered colimits — and the geometric
detection hypotheses are established before that algebraic reduction. It then constructs geometric
Hecke operators, extends expansions to vector coefficients and to Diamond's ramified Hilbert
setting, and states the classical Siegel Hodge–Tate decompositions.

### B5.1 The trace of a finite locally free morphism

For a finite locally free morphism `π : X → Y` of schemes, use AdicSpacesPartIII R3.8's
`AlgebraicGeometry.Scheme.Hom.finiteTrace`, with `finiteLocallyFreeTrace` as a transparent alias:
`finiteLocallyFreeTrace π = AlgebraicGeometry.Scheme.Hom.finiteTrace π`.
The trace `Tr_π : π_*O_X → O_Y` sends a local section `f` to the trace of multiplication
by `f` on the finite locally free `O_Y`-module `π_*O_X`. It is `O_Y`-linear and `Tr_π ∘ π^♯` is
multiplication by the locally constant degree of `π`. Construct the coefficient adapter: for a finite
locally free `O_Y`-module `𝓕`, the projection formula `π_*π^*𝓕 ≅ π_*O_X ⊗ 𝓕` gives
`Tr_{π,𝓕} : π_*π^*𝓕 → 𝓕`. The trace is
transitive along composites of finite locally free morphisms and commutes with base change along any
`Y′ → Y`; on an affine open where `π_*O_X` is free with a basis it is the algebra trace computed in
that basis. For finite locally free morphisms of algebraic stacks the trace is defined by descent
along a flat atlas, by the base-change property.

*Hypotheses.* `π` is finite and locally free; the trace of a finite morphism that is not flat is not
defined by this construction. No averaging by the degree is involved, so the degree need not be
invertible.

*Source:* [StacksTrace], 0BVH, Section 49.3.

The API, with the scheme-level scalar laws inherited from AdicSpacesPartIII R3.8:

- `finiteLocallyFreeTrace_linear`: `Tr_π` is `O_Y`-linear.
- `finiteLocallyFreeTrace_unit`: `Tr_π(π^♯ a) = deg(π)·a`.
- `finiteLocallyFreeTrace_comp`: `Tr_{π∘π′} = Tr_π ∘ π_*Tr_{π′}` for finite locally free
  `π′ : X′ → X`.
- `finiteLocallyFreeTrace_baseChange`: formation commutes with base change along `Y′ → Y`.
- `finiteLocallyFreeTrace_coefficient`: `Tr_{π,𝓕}` is natural in `𝓕` and equals `Tr_π ⊗ id_𝓕` under
  the projection formula.

*Needs:* AdicSpacesPartIII R3.8 (`AlgebraicGeometry.Scheme.Hom.finiteTrace`, its finite-projective
scalar trace, unit, composition and arbitrary-base-change laws);
Mathlib `Algebra.trace_algebraMap_of_basis`, `Algebra.trace_trace`,
`LinearMap.trace_baseChange`; SchemeAndStackFoundations Layer 1 (§1.1,
§1.22).
*Lean:* none; specified in the README only.

**Checks.**

- `finiteLocallyFreeTrace_test_identity` (degenerate): for `π = id`, `Tr_π = id`.
- `finiteLocallyFreeTrace_test_quadratic` (computation): for `X = Spec R[t]/(t² − a) → Y = Spec R`,
  `Tr(1) = 2`, `Tr(t) = 0` and `Tr(t²) = 2a`; the trace is not divided by the degree.
- `finiteLocallyFreeTrace_test_charP` (non-example): for the trivial cover `X = ⊔_{i=1}^{p} Y` over
  an `𝔽_p`-scheme, `Tr(1) = p = 0`; an operator defined by averaging over the fibre does not exist
  there, while the trace does.

### B5.1a Scalar expansion with coefficients inside the sheaf

Construct `ScalarFourierJacobi.expansion`. On Lan's smooth good-prime PEL toroidal model
flat over the allowed Noetherian coefficient algebra `R`, fix `k≥0` and any `R`-module `M`.
For each cusp, restrict `ω_tor^k⊗_R M` to every finite boundary thickening. Use the homogeneous
toric charts and the Hodge-line identification to extract sections of
`Ψ_Φ(ℓ)⊗L_Φ^k⊗_R M` on `C_Φ`, then pass to the inverse limit of thickenings. The resulting
map on `AF(k,M)` takes values in the full-stabilizer invariant family of these degree modules,
with the fan's completion support. It is not defined by tensoring the completed `M=R` map.

Prove agreement of completed restriction with this homogeneous description, independence of
cone and fan through the common boundary completion, full-stabilizer and representative-change
transport, naturality for all module maps, and identity/composition of those maps. The constant
term is exactly restriction to the boundary stratum under the boundary Hodge-line identification.
No tensor product is interchanged with an infinite product or inverse limit.

For `p:C_Φ→M^Z`, compare with C5.15 `HodgeLineFJ` only when the canonical map
`p_*Ψ_Φ(ℓ)⊗_R M → p_*(Ψ_Φ(ℓ)⊗_R M)` is proved to be an isomorphism for every degree and
coefficient used. Apply the projection formula for the invertible lower-base line `L_Φ^k`
and identify the coefficient extraction maps under these isomorphisms. No flatness of `M`
or unrestricted pushforward/base-change theorem is assumed by the direct construction.

*Source:* [LanPEL], Definition 7.1.1.1 and Lemma 7.1.1.5, pp.532–533,
Lemmas 7.1.2.1–7.1.2.13, pp.534–538 (formal restriction and homogeneous charts);
[LanHigher], equation (5.5), Proposition 5.6 and Corollaries 5.8–5.9, pp.11–13.

*Needs:* B4.20 (`integralForms`); ShimuraCompactifications C0.8
(`TauCeti.Toric.Relative.torusEmbedding`), C0.11 (`TauCeti.Toric.Relative.stratumQuotientIso`),
C1.4 (`CuspLabel`), C1.5 (`CuspLabel.arithmeticStabilizer`), C3.9
(`ToroidalRefinement.cohomology_iso`), C4.1 (`SemiAbelianScheme`), C4.7 (`UniversalDegeneration`),
C5.3 (`IntegralToroidalModel`), C5.4 (`IntegralToroidalModel.formalCompletion`),
C5.15 (`HodgeLineFJ`, for the conditional comparison); AdicSpacesPartIII F0;
SchemeAndStackFoundations Layers 1–2 (quasi-coherent descent and module tensor products).
*Lean:* none; specified in the README only.

**Checks.**

- For `M=R/I`, including nonflat residue coefficients, the local section
  `q^n(du/u)^k⊗m` has coefficient `m` at `n` and zero elsewhere.
- On the rank-one formal chart over `R/I`, `(1−q)⁻¹` has coefficient `1` in every degree;
  finite-support extraction or tensoring an infinite coefficient product cannot replace completion.
- For the tensor unit the constant term of `1` is `1`, and changing the cusp representative
  transports it by the actual boundary-line map. At `M=R`, the identity base-change map gives
  C5.15's expansion.

### B5.2 Left exactness of Hodge-section coefficient change

Prove `integralForms_coefficient_leftExact`. For a short exact coefficient sequence `0→N→M→Q→0` on the
supplied R-flat model, prove `0→AF(k,N)→AF(k,M)→AF(k,Q)` is left exact. Local freeness of the Hodge
coefficient and R-flatness on the atlas give exactness after tensoring; descend the quasi-coherent
sequence and take sections. Surjectivity onto `AF(k,Q)` is not asserted.

*Hypotheses.* The toroidal model X is flat over R and `omega_tor^k` is locally free over `O_X`, as
supplied by ShimuraCompactifications C5 and by B3.10 and B4.20. Sections and tensor products are
taken on the actual algebraic stack or an equivalent descent presentation, not its coarse space.

*Source:* [LanPEL], First paragraph of the proof of 7.1.2.14, printed p. 539.

*Needs:* B5.1a (`ScalarFourierJacobi.expansion`); B4.20 (`integralForms`); ShimuraCompactifications C5 (C5.3 `IntegralToroidalModel`,
C5.4 `IntegralToroidalModel.formalCompletion`); SchemeAndStackFoundations Layer 1 (§1.22, §1.1);
Mathlib `Module.Flat` (tensoring with a flat module preserves injections); B3.2
(`canonicalExtension`); B4.1 (`classicalForms`).
*Lean:* none; specified in the README only.

**Checks.**

- `N=M` and `Q=0` recovers the identity inclusion.
- For the flat affine rank-one chart over Z, the coefficient sequence Z --2--> Z to Z/2 remains left
  exact.
- Dropping R-flatness is invalid: on Spec `F_p` over Z the locally free `O_X`-module `O_X` turns Z --p-->
  Z into the zero map. Local freeness over `O_X` alone is insufficient.

### B5.3 Left exactness of invariant coefficient families

Prove `FJCoefficient.invariantFamily_leftExact`. For the same short exact coefficient sequence,
prove left exactness of `0→G(N)→G(M)→G(Q)`, including the products over character degrees and full
stabilizer invariants. On each R-flat abelian-torsor chart use locally free tensoring and section
left exactness. Products have componentwise unique kernel lifts; equivariance and uniqueness make
those lifts invariant. Neither right exactness of invariants nor their commutation with filtered
colimits is used.

*Hypotheses.* Each `C_Phi` is flat over R and each character-Hodge coefficient sheaf `Psi_Phi(ell)`
tensor `L_Phi^k` is invertible on `C_Phi`. These geometric facts come from ShimuraCompactifications C4
and C5. The full stabilizer actions are R-linear, preserve the transported coefficient sequence, and
are the transported actions of B5.1a `ScalarFourierJacobi.expansion`. The stabilizer need not be finite or
have invertible order.

*Source:* [LanPEL], 7.1.2.14, first paragraph and exact-row diagram on printed p. 539.

*Needs:* B5.1a (`ScalarFourierJacobi.expansion`); ShimuraCompactifications C5
(C5.3 `IntegralToroidalModel`, C5.4 `IntegralToroidalModel.formalCompletion`); ShimuraCompactifications C1 (C1.4 `CuspLabel`,
C1.5 `CuspLabel.arithmeticStabilizer`); ShimuraCompactifications C4 (C4.1 `SemiAbelianScheme`,
C4.7 `UniversalDegeneration`); SchemeAndStackFoundations Layer 1 (§1.22,
§1.1); Mathlib `Module.Flat` (tensoring with a flat module preserves injections).
*Lean:* none; specified in the README only.

**Checks.**

- A trivial `C_p`-action on `F_p` has its entire module as invariants, even though averaging by p is
  undefined.
- For the unipotent `C_p`-action on `F_p^2` with generator (a,b) sent to (a+b,b), the equivariant
  sequence 0 to `F_p` to `F_p^2` to `F_p` to 0 is exact, but the map on invariants to the final `F_p` is
  zero. This rejects a false right-exactness claim.
- Infinite degree products are allowed here, but their interchange with a filtered union is not
  inferred.

### B5.4 The prime-quotient coefficient case

Prove `FourierJacobi.injective_primeQuotient`. For a prime ideal p of the field or Dedekind base R,
including `p=0`, put `S=R/p`. Assume the chosen base-changed strata meet every irreducible component of
the reduced model `X_S` and the completed coefficient charts are compatible with this base change.
Then the joint expansion on `AF(k,S)` is injective. At neat level use ShimuraCompactifications C5
(C5.10 `IntegralToroidalModel.strata_detect_geometricComponents`) with its good-prime regular base and
fan/no-self-intersection assumptions; non-neat coverage requires a separate branch or level-descent
comparison. Zero coefficients give zero completed sections, finite-stalk Krull separation gives zero
near the selected strata, and reducedness plus component detection gives global zero.

*Hypotheses.* The good-prime model of ShimuraCompactifications C5 is smooth over the regular base R;
hence X and each residue-field model used here are reduced and locally Noetherian, with locally free
pulled-back Hodge line. ShimuraCompactifications C5 supplies separated homogeneous coefficient extraction and
its identification with completion of the actual Hodge sheaf; SchemeAndStackFoundations
§§1.1, 1.22 supplies the passage through a flat atlas. Local adic separation of a finite stalk at a proper ideal is already a pinned Mathlib
theorem, and ordinary coherent-section detection near a closed subset is AdicSpacesPartIII F0
(sections near a closed subset). Use `AF(k,R/p) = Gamma(X_S,omega_S^k)` through the closed-base-change
sheaf identification. Do not replace this by `AF(k,R) tensor_R S` without a base-change theorem.

The base-change step compares finite thickenings first: `(P/I^(n+1)P)⊗_R S≃P_S/I_S^(n+1)P_S`. These
identifications commute with n and chart transport, so their inverse systems can be compared without
moving tensor past an arbitrary inverse limit. At a selected stratum point, the Noetherian finite
stalk is separated at its proper stratum ideal by Mathlib's existing Krull-intersection theorem. The
corresponding completion-detection theorem gives an open zero locus; reducedness and fibrewise
component coverage make it dense in each component. Carry this zero-locus argument through the
actual flat atlas, without requiring every affine atlas chart to meet a selected stratum.

*Source:* [LanPEL], 7.1.2.14(1), p. 539; 6.4.1.1(2)-(5), p. 520; 6.4.1.2, p. 523; [StacksKrull],
00IP, Lemma 10.51.4; [StacksStein], 0A18, Theorem 76.36.4 and Lemma 76.36.9 (also tag 0E0D); [EGAI],
Chapter I, Proposition 10.8.11 and proof, printed p. 197 (physical PDF 196).

*Needs:* B5.1a (`ScalarFourierJacobi.expansion`); ShimuraCompactifications C5
(C5.3 `IntegralToroidalModel`, C5.4 `IntegralToroidalModel.formalCompletion`, C5.10 `IntegralToroidalModel.strata_detect_geometricComponents`);
AdicSpacesPartIII F0 (`FormalScheme.completion`, completion of coherent sheaves, sections near a
closed subset, after EGA I (10.8.11)); SchemeAndStackFoundations Layer 1 (§1.22,
§1.1); Mathlib `Module.Flat` (tensoring with a flat module preserves injections);
Mathlib `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`; Mathlib `IsHausdorff.of_isLocalRing`; Mathlib
`AdicCompletion.of_injective`.
*Lean:* none; specified in the README only.

**Checks.**

- A nonempty stratum on a smooth connected component over a field detects a line-bundle section.
- Two disjoint smooth curves with all selected strata on only one component violate the detection
  hypothesis and admit an undetected section.
- For a general smooth R-scheme, total-space detection alone need not imply residue-fiber detection:
  Spec R and its open subscheme Spec R[1/p] provide the elementary warning. This example is not
  asserted to be a PEL boundary stratum or a counterexample to Lan's theorem.
- For `X=P1_R` with its two disjoint relative boundary sections, each whole boundary section meets the
  unique component of every geometric fiber. Removing the closed fiber from one section destroys
  fiberwise density although that open still meets the total component. This distinguishes the
  needed relative-stratum hypothesis from mere total-space density.
- At a Tate chart with `A=R[q]`, `I=(q)`, `P=A` and `S=R/p`, every finite-thickening comparison sends the
  class of `q^j` to the same class for `0<=j<=n`. It makes no assertion that tensor commutes with all
  inverse limits.
- For a nonzero module over `F₂`, completion at the unit ideal is zero and its canonical map is not
  injective. This rejects omitting the proper-ideal condition from the local finite-stalk argument.

### B5.5 Propagation through a coefficient extension

Prove `FourierJacobi.injective_of_extension`. For the two actual left-exact coefficient rows of
`0→N→M→Q→0`, injectivity of FJ on `AF(k,N)` and `AF(k,Q)` implies injectivity on `AF(k,M)`. Apply Mathlib's
short-complex monicity theorem to the natural expansion morphism; its first-row monomorphisms and
exactness are B5.2 and B5.3. Nonsplit coefficient extensions and torsion are allowed. Surjectivity
of the last global-section map is unnecessary.

*Hypotheses.* Use the exact section row, the monic first coefficient-family map, and the naturality
squares supplied by B5.2, B5.3 and B5.1a `ScalarFourierJacobi.expansion`. Do not add a surjectivity assumption on `AF(k,M)` to
`AF(k,Q)`, or invert a coefficient characteristic or a stabilizer order.

*Source:* [LanPEL], The left-exact coefficient functors in the proof of 7.1.2.14, pp.539–540.

*Needs:* B5.1a (`ScalarFourierJacobi.expansion`); B5.2
(`integralForms_coefficient_leftExact`); B5.3 (`FJCoefficient.invariantFamily_leftExact`); Mathlib
`CategoryTheory.ShortComplex.mono_τ₂_of_exact_of_mono`.
*Lean:* none; specified in the README only.

**Checks.**

- The nonsplit sequence 0 to Z/2 to Z/4 to Z/2 to 0 tests the nilpotent-torsion step.
- The argument still applies when the last section-row map is not surjective.
- With `N=0` or `Q=0` it agrees with naturality under the induced coefficient isomorphism.

### B5.6 Finite coefficients by a prime filtration

Prove `FourierJacobi.injective_of_finite`. If the prime-quotient geometric hypotheses hold for every
p, deduce FJ injectivity for every finitely generated R-module. Use the existing Noetherian
prime-filtration induction: zero coefficients, transport from a module linearly equivalent to R/p,
and propagation through a short exact coefficient sequence. Repeated prime factors, `R/pⁿ` and finite
nonfree projective coefficients are included. The prime filtration does not assert finite length,
and coefficient surjectivity is not section surjectivity.

*Hypotheses.* R is the indicated field or Dedekind domain, hence Noetherian. No
principal-ideal-domain or semilocal assumption is made. Use the existing Mathlib induction for any
commutative Noetherian R and Module.Finite R M. Its prime case is a finite module N together with a
linear equivalence to R/p, so preserve that form across module universes. No complete local
coefficient category is required.

*Source:* [StacksPrime], 00L0, Lemma 10.62.1; [LanPEL], 7.1.1.4 and the reduction in 7.1.2.14(1),
pp.532–533, 539–540; [MathlibPrime], `IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`,
with its preceding RelSeries existence theorem, at the pinned Mathlib commit.

*Needs:* B5.4 (`FourierJacobi.injective_primeQuotient`); B5.5
(`FourierJacobi.injective_of_extension`); B5.1a (`ScalarFourierJacobi.expansion`); Mathlib
`IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`; Mathlib
`IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`.
*Lean:* none; specified in the README only.

**Checks.**

- The filtration of Z/4 by 0, 2(Z/4), Z/4 has two Z/2 factors and must be accepted although Z/4 is
  nonreduced as a ring.
- A nonprincipal invertible ideal over a Dedekind ring is covered as a finite module without
  asserting that it is free.
- The zero module has the empty filtration and an injective expansion map.

### B5.7 Joint injectivity at a component-detecting collection of cusps

Prove `FourierJacobi.expansionPrinciple`. In Lan's setting choose finitely many nonempty strata
whose union meets every irreducible component of X. Use ShimuraCompactifications C5.10 `IntegralToroidalModel.strata_detect_geometricComponents`
and C5.11 `IntegralToroidalModel.nonneat_descent` to relate this total-space hypothesis to the
prime-quotient detection used above, including non-neat descent. Then `FJ_I` on `AF(k,M)` is injective for every R-module M. A section comes from a finitely
generated submodule `N⊂M` by qcqs section-colimit compatibility. Naturality and injection `G(N)→G(M)`
reduce its vanishing to the finite-coefficient theorem. There is no interchange of an infinite
coefficient product with a filtered colimit.

*Hypotheses.* The source's smooth proper good-prime PEL model, k nonnegative, and M an arbitrary
R-module. The finite collection is component-detecting in the source's sense. No claim is made that
any chosen single cusp detects all components. Use the actual qcqs stack section/filtered-colimit
comparison. No colimit theorem for the infinite Fourier-Jacobi coefficient product is assumed.

For an arbitrary M, lift a section to `AF(k,N)` for a finite submodule N. If its expansion becomes
zero over M, use the injective coefficient-family map `G(N)→G(M)` to make it zero over N and apply
finite-coefficient injectivity. Only the section functor commutes with this colimit; no
colimit/product identity is needed for G.

*Source:* [LanPEL], 7.1.2.14(1), proof, and the module reduction in 7.1.1.4, pp.532–533, 539–540;
[StacksColimit], 0GQZ, Lemma 103.13.5, `G=O_X`.

*Needs:* ShimuraCompactifications C5.10 (`IntegralToroidalModel.strata_detect_geometricComponents`),
C5.11 (`IntegralToroidalModel.nonneat_descent`); B5.6 (`FourierJacobi.injective_of_finite`); B5.1a (`ScalarFourierJacobi.expansion`); ShimuraCompactifications C5
(C5.3 `IntegralToroidalModel`,
C5.4 `IntegralToroidalModel.formalCompletion`); B5.3 (`FJCoefficient.invariantFamily_leftExact`); B4.20 (`integralForms`);
SchemeAndStackFoundations Layer 1 (§1.22, §1.1); Mathlib `Module.Flat`
(tensoring with a flat module preserves injections); B4.1 (`classicalForms`); B4.19
(`qcqsSectionsColimit`).
*Lean:* none; specified in the README only.

**Checks.**

- On the disjoint union of two proper connected curves, expansion at a cusp on only one component
  does not detect a section supported on the other.
- The nonsplit prime-filtration step covers `R/p^2`; geometric pointwise vanishing alone does not.
- For `M=R[1/p]/R`, each finite set of elements lies in a finitely generated torsion submodule, so the
  same argument applies.
- Product/colimit warning: over a field, for M the direct sum of countably many copies of the field,
  the sequence of distinct basis vectors in the product `M^N` does not lie in `N^N` for any
  finite-dimensional submodule N. This rules out the unused interchange of these two operations.

### B5.8 Recognition of a coefficient submodule from expansions

Prove `FourierJacobi.coefficientRecognition`. For `M₁⊂M` and the same detecting cusps, a section in
`AF(k,M)` comes from `AF(k,M₁)` exactly when every chosen expansion lies in the corresponding image of
the invariant coefficient family with `M₁` coefficients. Map the section to `M/M₁`, use naturality and
injectivity for that quotient, then the kernel/image equality of the AF row. The quotient need not
be finite or flat, so the arbitrary-coefficient theorem is essential.

*Hypotheses.* The standing good-prime PEL and component-detection hypotheses. Use the geometric
coefficient functors and the inclusion M1 into M; membership is in their images, not an informal
statement about scalar entries.

*Source:* [LanPEL], 7.1.2.14(2) and its exact-row diagram, pp.539–540.

*Needs:* B5.7 (`FourierJacobi.expansionPrinciple`); B5.1a (`ScalarFourierJacobi.expansion`); B5.2
(`integralForms_coefficient_leftExact`); B5.3 (`FJCoefficient.invariantFamily_leftExact`).
*Lean:* none; specified in the README only.

**Checks.**

- For `M1=M` the conclusion is automatic.
- For `M1=0` it reduces to joint injectivity.
- For `M=R[1/p]` and `M1=R`, the quotient is torsion: injectivity only for torsion-free coefficients is
  inadequate for this application.

### B5.9 Cuspidality from boundary restrictions

Prove `FourierJacobi.cusp_iff_boundaryRestriction`. For a neat smooth toroidal model with reduced
relative normal-crossings boundary D, suppose the boundary coefficient sequence remains exact after
tensoring with the chosen M. The image of `Γ(X,ω_tor^k(−D)⊗_R M)` consists exactly of sections
restricting to zero on D. If the boundary charts detect that restriction, this is equivalent to
vanishing of the required constant terms at all proper boundary labels. Over a nonreduced base
geometric-point vanishing is insufficient, and a single maximal-cusp constant term does not replace
all boundary restrictions.

*Hypotheses.* Neatness, smoothness and the stated relative normal-crossings boundary; use B3's
actual subcanonical extension. For nonflat M, retain the relative flatness/exactness checks of the
boundary sequence. No general-coarse-space vector-bundle claim is included.

*Source:* [LanIntro], 4.2.7, printed p. 50.

*Needs:* B4.20 (`integralForms`); B5.1a (`ScalarFourierJacobi.expansion`); ShimuraCompactifications C5
(C5.3 `IntegralToroidalModel`,
C5.4 `IntegralToroidalModel.formalCompletion`); ShimuraCompactifications C4 (C4.1 `SemiAbelianScheme`,
C4.7 `UniversalDegeneration`); B3.4 (`subcanonicalExtension`); B4.2 (`cuspForms`).
*Lean:* none; specified in the README only.

**Checks.**

- On a one-variable formal chart, divisibility by q is equivalent to zero constant coefficient.
- A higher-dimensional boundary coefficient may be a nonzero form on a lower-dimensional boundary
  even when a scalar constant at a deeper cusp is zero.
- Koecher extension of sections does not force their boundary restriction to vanish.

### B5.10 Geometric Hecke operators on classical sections

Construct `ClassicalHecke.operator`. For an admissible prime-to-characteristic g let `K_g=K∩gKg⁻¹` and
use `X_K←p₁X_Kg→p₂X_K`. On compatible toroidal refinements the actual coefficient realization gives
`θ_g:p₂*E→p₁*E`. Define `H_g=tr_p₁ θ_g p₂*` on `Γ(X_K,E⊗_R M)`, then `T_g=ν(g)H_g` for the specified
K-bi-invariant multiplicative unit-valued character `ν`. Trace is finite locally free trace
transported through the supplied toric-refinement comparison. Prove independence of representatives
and refinement, coefficient-map compatibility and preservation of subcanonical sections using the
reduced-boundary transport.

*Hypotheses.* Use actual bundle sections, including coefficients inside the sheaf; `Γ(E)⊗M` is not
substituted. p1 is finite locally free on a compatible intermediate model; a further fan refinement
can be proper rather than finite. Its coefficient-sensitive pushforward comparison is required. `θ_g`
uses the right-translation and isogeny convention; `ν` is part of the level/weight normalization, not
division by every correspondence degree.

*Source:* [LanPEL], 6.4.3.1–6.4.3.4, pp.527–530; [Diamond22], §6.1, weight/level pullback
convention, p.24; [BCGP], §1.8, pp.17–18.

The API:

- `ClassicalHecke.operator`: The R-linear composite `ν(g)tr_p1 θ_g` `p2*` on the actual section module.
- `ClassicalHecke.operator_one`: The identity correspondence with `ν(1)=1` acts as identity.
- `ClassicalHecke.coefficient_map`: An R-linear coefficient map `M→N` commutes with `T_g`, by
  coefficient-compatible pullback, trace and `θ_g`.
- `ClassicalHecke.refinement`: Transport across the B3 section comparison along a common fan
  refinement intertwines `T_g`, with identity and composition laws.

*Needs:* TauCetiRoadmap.AdelicAlgebraicGroups §4.5 (*Hecke correspondences*, `LevelMaps.hecke`,
*Degree of a Hecke correspondence*); B3.10 (`integralLeviCoefficient`); ShimuraCompactifications C3
(C3.9 `ToroidalRefinement.cohomology_iso`, C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`, C3.1 `ToroidalRefinement`,
C3.4 `ToroidalRefinement.choice_comparison`, C3.3 `ToroidalHeckeSpan`); B4.20 (`integralForms`); SchemeAndStackFoundations Layer 1
(§1.22); Mathlib `Module.Flat` (tensoring with a flat module preserves injections);
Mathlib `Algebra.trace_algebraMap_of_basis`; B2.1 (`automorphicVectorBundle`); B2.8
(`coefficientTensorHecke`); B1.10 (`principalHeckePullback`); B3.2 (`canonicalExtension`); B3.4
(`subcanonicalExtension`); B3.6 (`fanIndependentSections`); B3.general.3
(`generalBoundaryFunctoriality`); B4.1 (`classicalForms`); B4.2 (`cuspForms`); B5.1
(`finiteLocallyFreeTrace`); B4.15 (`ramifiedHilbertLine`).
*Lean:* none; specified in the README only.

**Checks.**

- `ClassicalHecke.identity` (degenerate): The identity correspondence acts as identity on canonical
  and subcanonical sections.
- `ClassicalHecke.weightZeroTrace` (computation): For a finite-free degree-d chart and the trivial
  bundle, the raw operator on 1 is d, not 1; the normalized value is `ν(g)d`.
- `ClassicalHecke.modularNormalization` (compatibility): Over C, after the imported modular
  comparison and correct coset orientation, GL2 `det⁻¹`-scaled isogeny pull-identify-trace agrees with
  the existing HeckeRing.GL2.heckeRingHomCharSpace action; at an unramified prime its coefficients
  have the character-weighted `ℓ^(k−1)` term. At weight zero, `ℓ=2` gives `3/2`.
- For `ClassicalHecke.modularNormalization` at `ℓ=3`, the value is `4/3`; the constant `3/2` fails.
- At `ℓ=5` the same normalization gives `6/5`, retaining the degree `ℓ+1` and its `ℓ⁻¹` factor.

### B5.11 Convolution law for the geometric Hecke action

Prove `ClassicalHecke.convolution`. With these correspondence, coefficient-cocycle,
trace/base-change and multiplicative-normalization hypotheses, extend `[KgK]↦T_g` to a unital ring
homomorphism from the existing integral Hecke ring to `End_R Γ(X_K,E⊗_R M)`. Its action restricts to
cusp sections. Compare the inverse/right-coset orientation with HeckeCosetModule convolution and
retain the integer multiplicities from the correspondence decomposition.

*Hypotheses.* Require the full double-coset fibre-product/Mackey decomposition, not a false
Cartesian square for an arbitrary normal finer level. Coefficient traces satisfy composition and
finite-flat base change; normalization `ν` is multiplicative and bi-K-invariant.

*Source:* [BCGP], §1.8, Hecke conventions, pp.17–18; [Diamond22], §6.1, p.24.

*Needs:* B5.10 (`ClassicalHecke.operator`); TauCetiRoadmap.AdelicAlgebraicGroups §4.5 (*Cartesian
squares of level maps*, with its hypothesis `U′L = U`); Tau Ceti
`HeckeCosetModule.instRingHeckeRing`; Tau Ceti `HeckeRing.GL2.heckeRingHomCharSpace`;
SchemeAndStackFoundations Layer 1 (§1.22); Mathlib `Module.Flat` (tensoring with a
flat module preserves injections); B5.1 (`finiteLocallyFreeTrace`).
*Lean:* none; specified in the README only.

**Checks.**

- The identity coset maps to identity and a sum maps to the sum of operators.
- In the good GL2 prime case the transported formula recovers the existing analytic convolution
  action, including its character term.
- A normalization chosen by dividing each coset by its degree need not be a multiplicative
  character; the construction does not silently permit it.

### B5.12 Hecke action at non-neat level

Prove `ClassicalHecke.nonNeatDescent`. For a normal neat K′⊲K with finite quotient `Γ`, identify
sections of the actual equivariant coefficient on `[X_K′/Γ]` with `Γ(X_K′,E⊗_R M)^Γ`. Construct the
K-Hecke action on this equalizer using the `K_g` correspondence and common neat covers of both legs.
Prove stability, independence of cover and agreement with stack pull-identify-trace. The AdelicAlgebraicGroups §4.5
Cartesian comparison requires its `U′L=U` hypothesis; normality of a chosen cover alone does not
supply that square or its double coset.

*Hypotheses.* The quotient means the stack with its bundle action; no coarse-space vector bundle
descent is assumed. No inversion of `|Γ|` is required for the equalizer. Hecke compatibility uses the
refined correspondence and Mackey sum, not restriction of a single K′-double-coset operator.

*Source:* [Diamond22], §6.1, non-small U and normal fine U′, p.24; §6.2, normal-level invariants
argument immediately before Proposition 6.2.1, p.25; [LanPEL], 7.1.2.6–7.1.2.8, pp.536–537.

*Needs:* B5.10 (`ClassicalHecke.operator`); B5.11 (`ClassicalHecke.convolution`);
TauCetiRoadmap.AdelicAlgebraicGroups §4.5 (*Cartesian squares of level maps*, with its hypothesis
`U′L = U`); SchemeAndStackFoundations Layer 1 (§1.1, §1.22);
ShimuraCompactifications C3 (C3.1 `ToroidalRefinement`, C3.4 `ToroidalRefinement.choice_comparison`, C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`,
C3.9 `ToroidalRefinement.cohomology_iso`).
*Lean:* none; specified in the README only.

**Checks.**

- For the trivial action of `C_p` on `F_p`, invariants are `F_p`, while the group sum is zero.
- For the unipotent `C_p` action on `F_p²`, taking invariants does not preserve the surjection to the
  second-coordinate quotient. The proof uses only the equalizer, not exactness of invariants.
- Do not assume `K′∩K_g=K′∩gK′g⁻¹`; AdelicAlgebraicGroups §4.5’s Cartesian theorem requires its additional product
  condition.

### B5.13 Tate and analytic q-expansion comparison

Prove `FourierJacobi.modular_qExpansion_comparison`. Specialize rank-one FJ to R15.1's Tate
q-expansion and its analytic comparison with UpperHalfPlane.qExpansion h at `q=exp(2πiτ/h)`, using the
same differential frame. At full level `n≥3` the family of AlgebraicModularFormsAndSerreWeights R15.1
is `Tate(qⁿ)` over `ℤ[1/n,ζ_n][[q]]`, with Kodaira–Spencer sending the square of the invariant
differential to n dq/q. Import the all-component integral principle, cusp exact sequence and
geometric modular Hecke operators from R15.2. Compare their normalization with the existing analytic
Hecke action.

*Hypotheses.* Match the selected cusp, width h>0 in the actual subgroup strict periods, roots of
unity and descent data. Levels 1 and 2 use the stack or rigidifying-cover descent of R15.1. One
infinity constant detects cuspidality only in the full modular group case already proved in Mathlib.

*Source:* [LanPEL], 7.1.2.1–7.1.2.4, pp.534–535; [LanIntro], §4.2.7, pp.49–50.

*Needs:* B5.1a (`ScalarFourierJacobi.expansion`); B5.10
(`ClassicalHecke.operator`); AlgebraicModularFormsAndSerreWeights R15.1 (*Geometric modular forms*,
*All-weight analytic comparison*); AlgebraicModularFormsAndSerreWeights R15.2 (*The q-expansion
principle*, *Integral geometric Hecke operators*, *The equivariant cuspidal sequence*); Mathlib
`UpperHalfPlane.qExpansion`; Mathlib `ModularForm.qExpansion_injective`; Mathlib
`ModularForm.isCuspForm_iff_coeffZero_eq_zero`; Tau Ceti `HeckeRing.GL2.heckeRingHomCharSpace`;
TauCetiRoadmap.ModularForms Layer 2 (`heckeRingHomCharSpace`).
*Lean:* none; specified in the README only.

**Checks.**

- Retain n dq/q at `Tate(q^n)`; replacing du/u with a base differential loses the convention.
- The local monomial `q^r(du/u)^k` has coefficient 1 in degree r and 0 elsewhere; this is a local
  chart test, not a global existence claim.
- Import the modular principle for one cusp per component and all-cusp cuspidality; analytic
  injection alone supplies neither statement over torsion coefficients.

### B5.14 Fourier–Jacobi expansion with vector coefficients

Construct `VectorFourierJacobi.expansion`. On Lan's neat good-prime PEL model over a Noetherian
allowed coefficient algebra R, let W be a finite projective representation of the actual Levi.
Import Ecan(W) and its boundary pullback identification with a locally free `E₀(W)` on the abelian
torsor C. For any M define `degree-ℓ` coefficients `Γ(C,Ψ(ℓ)⊗E₀(W)⊗_R M)` and extract them by completed
restriction. Keep the completion support and full stabilizer transports before taking invariants. In
general characteristic zero use B3.general.1a `generalBoundaryCoefficientComparison`;
C3.general.1 supplies its underlying descended geometric maps. The boundary filtration on C need not descend to its
stabilizer quotient.

*Hypotheses.* The PEL bundle W is finite projective and the fan smooth/projective as in Lan Higher
§2; arbitrary infinite-dimensional or p-adic analytic representations are not included. The
degree-zero coefficient module is `Γ(C,Ψ(ell)⊗E0⊗M)`. Definition 5.10 also treats higher cohomology,
which is not replaced here by a degree-zero product. E0’s filtration is on C. Its graded pieces
descend locally over the lower base, but the whole filtration need not descend through the
stabilizer quotient.

*Source:* [LanHigher], Author-hosted preprint, Proposition 5.6 and proof, pp.11–13; Remark 5.7,
p.13; [LanHigher], Author-hosted preprint, Corollaries 5.8–5.9 and Definition 5.10, p.13; [Milne90],
VII.4, Conjecture 4.1, p.102.

The API:

- `VectorFourierJacobi.expansion`: Given the actual finite-projective representation bundle and its
  completed boundary identification, return the R-linear vector expansion into the full-stabilizer
  invariant family of sections of `Ψ(ell)` tensor E0(W) `tensor_R M`.
- `VectorFourierJacobi.coefficient`: Extract the degree-ell section of `Ψ(ell)⊗E0(W)⊗M` from the
  completed boundary restriction.
- `VectorFourierJacobi.coefficient_map`: An equivariant R-linear representation map `W→W′` and a
  coefficient map `M→M′` induce commuting degreewise maps, respecting identities and composition.
- `VectorFourierJacobi.transport`: A cusp transport moves the lattice degree, `Ψ` and E0 together and
  intertwines extraction.
- `VectorFourierJacobi.determinant`: The determinant-Hodge representation specializes to the scalar
  FJ map, under B3’s supplied boundary bundle isomorphism.
- `VectorFourierJacobi.refinement`: The canonical section comparison for a common fan refinement
  intertwines vector expansions and has its cocycle law.

*Needs:* B5.1a (`ScalarFourierJacobi.expansion`); B3.10
(`integralLeviCoefficient`); ShimuraCompactifications C3 (C3.9 `ToroidalRefinement.cohomology_iso`,
C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`); B4.20 (`integralForms`); ShimuraCompactifications C3.general
(C3.general.1 `ToroidalCanonicalModel.general_functorial`); ShimuraCompactifications C4 (C4.1 `SemiAbelianScheme`,
C4.7 `UniversalDegeneration`); B2.1 (`automorphicVectorBundle`); B2.3
(`leviHighestWeightConvention`); B3.2 (`canonicalExtension`); B3.1 (`boundaryCoefficientChart`);
B3.general.1 (`generalCanonicalExtension`); B3.general.1a
(`generalBoundaryCoefficientComparison`, for general data); B4.1 (`classicalForms`).
*Lean:* none; specified in the README only.

**Checks.**

- `VectorFourierJacobi.zeroRepresentation` (degenerate): For `W=0` or `M=0` every coefficient and
  expansion is zero.
- `VectorFourierJacobi.rankTwoMonomial` (computation): On a trivial rank-two local coefficient
  bundle and rank-one chart, `q^n(v1,v2)` has vector coefficient (v1,v2) at n and zero at other
  degrees.
- `VectorFourierJacobi.scalarSpecialization` (compatibility): For the determinant-Hodge
  representation giving `ω^k` the expansion equals the scalar map after the actual boundary-line
  identification.
- `VectorFourierJacobi.notFiniteSupport` (non-example): on the rank-one formal chart `R[[q]]` over a
  nonzero ring, `(1 − q)⁻¹` has coefficient `1` in every degree; a coefficient target with finite
  support loses valid completed sections.
- `VectorFourierJacobi.commonCompletion` (non-example): on an affine toric surface the origin
  completion of `k[x, y]` is `k[[x, y]]` and the completion of the face chart `D(y)` along `x = 0`
  is `k[y, y⁻¹][[x]]`; no ring map between them extends the face immersion, since `1 − y` is a unit
  in `k[[x, y]]` but its constant coefficient is not a unit in `k[y, y⁻¹]`. Cone expansions are
  compared through the common boundary completion and its maps to the stratum completions.
- `VectorFourierJacobi.noAveraging` (non-example): for the trivial action of the cyclic group of
  order `p` on `𝔽_p` the invariants are all of `𝔽_p`; a construction that multiplies by the group
  sum or divides by `p` does not give the invariant coefficient family.

### B5.15 Expansion principle for locally free automorphic coefficients

Prove `VectorFourierJacobi.expansionPrinciple`. Let R be Noetherian and X qcqs smooth over R in the
supplied setup. Require finite-rank locally free Ecan, R-flat abelian-torsor charts with locally
free `E₀`, the actual formal graded comparison/descent, and finitely many strata meeting every
irreducible component of `X_(R/p)` for each prime p. Then joint vector FJ is injective for every
R-module M and recognizes images from `M₁⊂M`. Its boundary-zero criterion identifies Esub sections
when the relative boundary tensor sequence is exact. Use prime filtrations, the two left-exact rows
and qcqs colimits as in the scalar proof.

*Hypotheses.* The component condition is fibrewise after every prime reduction, including the zero
prime when present; total-model density alone is not used as this hypothesis. Use the sheaf colimit
theorem on qcqs stacks via Layer 1, or schemes at neat level. Products of coefficient modules are not
asserted to commute with filtered colimits. This is a derived vector-bundle extension of Lan’s
scalar argument, with the formal identification from Higher Koecher’s principle; it is not claimed
as a literal statement of either paper.

*Source:* [LanPEL], Proposition 7.1.2.14, pp.539–540; [LanHigher], Author-hosted preprint,
Proposition 5.6, p.11.

*Needs:* B5.14 (`VectorFourierJacobi.expansion`); B5.1a (`ScalarFourierJacobi.expansion`); B5.2
(`integralForms_coefficient_leftExact`); B5.3 (`FJCoefficient.invariantFamily_leftExact`); B5.6
(`FourierJacobi.injective_of_finite`); B5.8 (`FourierJacobi.coefficientRecognition`); B5.9
(`FourierJacobi.cusp_iff_boundaryRestriction`); AdicSpacesPartIII F0 (sections near a closed subset,
after EGA I (10.8.11)); SchemeAndStackFoundations Layer 1 (§1.1,
§1.22); ShimuraCompactifications C3 (C3.9 `ToroidalRefinement.cohomology_iso`,
C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`); B3.10 (`integralLeviCoefficient`); B4.20 (`integralForms`); B3.2
(`canonicalExtension`); B3.4 (`subcanonicalExtension`); B4.1 (`classicalForms`); B4.2 (`cuspForms`);
B4.19 (`qcqsSectionsColimit`).
*Lean:* none; specified in the README only.

**Checks.**

- `W=det^k` recovers the scalar principle with the same component and coefficient hypotheses.
- A rank-two direct sum is detected component by component; the theorem does not collapse
  coefficients to a scalar.
- The nonsplit Z/4 extension is included. The Iwahori Hilbert special fibre with a component
  disjoint from all cusps fails the required hypothesis.

### B5.16 Hilbert cusp q-expansions and coefficient lines

Construct `HilbertQExpansion.map`. Let `F≠ℚ` be totally real, p possibly ramified, O the valuation
ring of a sufficiently large p-adic field with embedding set `Θ`, and `U=U^p GL₂(O_F,p)`. For a
Noetherian O-algebra R and integer vectors (k,m), require `χ_(k+2m),R` to be trivial on `O_F×∩U`. Use
the actual ramified splitting-model line `A_(k,m)` and `M_(k,m)(U;R)=Γ(Y,A)=Γ(Ymin,j_*A)`. For cusp
data `0→I→H→J→0` with polarization and level, set `Λ=d_F⁻¹I⁻¹J`. Choose fine prime-to-p `N≥3`, `ζ_N∈O` and a
splitting of H. Its coefficient line is `D_(k,m),c=⊗_θ(I⁻¹)_θ^{kθ}⊗(d_F(IJ)⁻¹)_θ^{mθ}`. Define the
expansion into completed line-valued series indexed by `N⁻¹Λ_+∪{0}`; prove splitting, representative
and fine-level transport with the actual unit action. The minimal pushforward need not be locally
free.

*Hypotheses.* All the weight, level and trivial-unit-character conditions are part of the
definition; `p=2` and ramified p are not discarded. The ramified Pappas–Rapoport splitting model and
its automorphic line are B3.Hilbert.0 and B4.15, and the Hilbert cusp
geometry and semi-abelian coefficient comparison are B3.Hilbert.1–3. The series includes zero and totally positive degrees in
the stated fractional lattice; the coefficient line and unit action cannot be replaced by a naked
scalar monoid algebra.

*Source:* [Diamond22], §6.1 and §6.2, pp.24–25.

The API:

- `HilbertQExpansion.map`: The R-linear formal restriction `q_c` into the coefficient-line series in
  the specified fractional positive lattice.
- `HilbertQExpansion.coeff`: Extract the `D_c⊗R` coefficient of `t∈N⁻¹Λ_+∪{0}`, including zero.
- `HilbertQExpansion.transport`: The canonical lattice/line isomorphism for a cusp representative or
  splitting change intertwines the transformed series; transports compose.
- `HilbertQExpansion.coefficient_map`: A Noetherian O-algebra map `R→R′` commutes with each
  coefficient after base change of the actual form.
- `HilbertQExpansion.fineLevel`: Restriction to a fine U(N) and any cusp above c gives the same
  expansion after the canonical line/lattice identifications.

*Needs:* B3.Hilbert.1–3 (ramified boundary model, line-valued formal charts and
unit descent); B3.Hilbert.0–0a (open filtration and cusp data);
B4.11–B4.15 (weights, fields, unit characters and actual ramified line).
*Lean:* none; specified in the README only.

**Checks.**

- `HilbertQExpansion.zero` (degenerate): The zero form has zero coefficient in every degree; over
  the zero coefficient ring all forms and coefficients vanish.
- `HilbertQExpansion.localMonomial` (computation): On a chosen formal cusp chart and
  coefficient-line trivialization, `q^t d` has coefficient d at t and zero elsewhere; no global form
  or unit invariance of this local monomial is asserted.
- `HilbertQExpansion.unitTransport` (non-example): A family supported at a positive t moved to a
  different degree by a cusp unit, with nonzero coefficient only at t, is not invariant unless its
  full transported orbit satisfies the unit relation. It cannot be declared the expansion of a
  descended form.

### B5.17 Hilbert q-expansion principle

Prove `HilbertQExpansion.expansionPrinciple`. In this prime-to-p Hilbert setting, take cusps S
meeting every connected component of Ymin, equivalently surjecting onto `F_+×\A_F,f×/det(U)`.
Diamond's `q_S` is injective. For a Noetherian O-subalgebra `R′⊂R`, coefficients in `D_c⊗_O` R′ at every
`c∈S` recognize a form over R′. Use B3.Hilbert.3–4 for the actual formal charts and detection on every relevant
geometric residue component, then B5.4–B5.8's finite-module devissage on those charts. For general U descend from a normal fine cover by invariants. General Iwahori special
fibres can have irreducible components without cusps, so this detection principle does not extend to
them.

*Hypotheses.* Retain the weight/unit condition over both rings and the exact prime-to-p level U. The
determinant surjectivity is the source’s component condition, not merely the choice of one
representative in a polarization class. The smooth-proper Stein argument in B3.Hilbert.4 applies on a fine
prime-to-`p` splitting compactification. Descent from the normal fine cover uses
left exactness of invariants and a faithful coefficient extension, not smoothness
of a coarse quotient or exactness of its invariant functor.

*Source:* [Diamond22], Proposition 6.2.1 and following Iwahori warning, p.25.

*Needs:* B5.16; B3.Hilbert.3–4 (completed coefficient descent and fibrewise cusp
detection); B5.4–B5.8 (prime quotients, extensions, finite modules, filtered colimits
and coefficient recognition), B5.3 (left exact invariants);
HilbertModularVarietiesAndShimuraCurves H2–H3; SchemeAndStackFoundations Layer 1
(§1.1, §1.22).
*Lean:* none; specified in the README only.

**Checks.**

- A set of infinity cusps covering the determinant classes gives an injective map.
- Coefficients in `R′=O` inside its fraction field detect the corresponding integral form in the
  stated setup.
- For U0(P) the source explicitly warns that components may contain no cusp, so the same criterion
  is not available.

### B5.18 Hilbert cusp forms and all cusp constants

Prove `HilbertQExpansion.cusp_iff_constantTerms`. Define the Hilbert cusp space as the kernel of the
product of constant-term maps over all cusps, with each constant in its actual line `D_c⊗_O R` and
cusp-unit invariants. Under the canonical/subcanonical comparison and exact boundary tensor sequence
this equals the image of `Γ(Ytor,A_(k,m)(−D)⊗_O R)`. Constants are independent of the splitting. In
§6.3's characteristic-zero or O-flat setting a nonparallel pair `(kθ,mθ)` has zero invariant constants
and every form is cuspidal; no such assertion is made for arbitrary torsion coefficients.

*Hypotheses.* Use every required boundary component and its unit/line action. One infinity
coefficient at arbitrary level is insufficient. B3.Hilbert.3 supplies the precise reduced boundary ideal and
tensor exactness on the ramified toric cover before taking invariants; Koecher extension does not replace the cusp ideal.

*Source:* [Diamond22], §6.3, p.26.

*Needs:* B5.16; B3.Hilbert.1–3 (actual canonical extension, reduced boundary ideal
and flat boundary sequence); B3.4 (subcanonical convention); B4.15;
B5.3 and B5.9 (left exact descent and the all-boundary restriction criterion).
*Lean:* none; specified in the README only.

**Checks.**

- At all cusps a local `q^t d` with t strictly positive has zero constant; a local constant d has its
  actual `D_c` value.
- The source’s nonparallel flat-coefficient case makes the cusp and full section spaces equal;
  torsion coefficients require rechecking the character ideal.
- No automatic cusp assertion follows merely because the Hilbert minimal boundary has codimension
  greater than one.

### B5.19 Hecke action on Fourier–Jacobi coefficients

Prove `ClassicalHecke.expansion_compat`. Complete the actual Hecke correspondence at its cusps and
define the coefficient operator `H_g^FJ` by its lattice transport, coefficient-bundle identification
and finite trace. Prove `FJ∘T_g=ν(g)H_g^FJ∘FJ`, compatible with coefficient change and refinement. At
a good modular `ℓ∤N` this becomes `b_n=a_(ℓn)+χ(ℓ)ℓ^(k−1)a_(n/ℓ)`, including `n=0` and with the second
coefficient zero if `ℓ∤n`. In Diamond's normalized Hilbert coefficients, for `v∤np` use
`r_m^t(T_v f)=r_m^(ϖ_v t)(f)+Nm(v)r_m^(ϖ_v⁻¹t)(S_v f)`; for `U₁(n)` and `v|n` omit the second term. Keep the
coefficient-line/χ_m normalization and actual central correspondence `S_v`.

*Hypotheses.* Require formal trace/base-change and actual degree/cusp maps from C3/C4; ordinary
toric inclusions alone do not give them. The modular geometric normalization requires `ℓ` invertible
and the source’s good-prime hypotheses. Diamond’s displayed formulas use primes outside p; no saving
trace or `U_p` at p is inferred. Retain the different cusp/component t in the Hilbert formula and its
character normalization.

*Source:* [Diamond22], Proposition 6.5.1, equation (6.1) and Remark 6.5.2, pp.27–29; [LanPEL],
5.4.3.8–5.4.3.10 and 6.4.3, pp.438–439 and 527–530.

*Needs:* B5.10 (`ClassicalHecke.operator`); B5.12 (`ClassicalHecke.nonNeatDescent`); B5.13
(`FourierJacobi.modular_qExpansion_comparison`); B5.16 (`HilbertQExpansion.map`); B5.14
(`VectorFourierJacobi.expansion`); ShimuraCompactifications C3 (C3.1 `ToroidalRefinement`,
C3.4 `ToroidalRefinement.choice_comparison`, C3.8 `ToroidalRefinement.pushforward_boundaryIdeal`, C3.9 `ToroidalRefinement.cohomology_iso`);
ShimuraCompactifications C4 (C4.1 `SemiAbelianScheme`, C4.7 `UniversalDegeneration`);
B3.Hilbert.1–3 (the actual ramified level/isogeny maps and completed coefficient transport); AlgebraicModularFormsAndSerreWeights R15.2 (*Integral
geometric Hecke operators*); Tau Ceti `HeckeRing.GL2.twistedHeckeSlashSum_diagCosetGamma0_of_prime`.
*Lean:* none; specified in the README only.

**Checks.**

- For a local modular sequence supported in degree r and n not divisible by `ℓ`, only the `a_(ℓn)` term
  contributes; when `ℓ|n` the second term has `χ(ℓ)ℓ^(k−1)`.
- At `n=0` the good modular operator gives `(1+χ(ℓ)ℓ^(k−1))a_0`; this also tests the normalization on
  constant weight-zero forms.
- Over `R/p²` at `ℓ≠p`, coefficient change and the normalized operator commute; reduction at p does not
  erase a missing integral trace construction.
- Higher-rank coefficients move through abelian-torsor sections, rather than being scalar Fourier
  coefficients.

### B5.20 Classical algebraic bundles in the Hodge–Tate coefficient functor

Prove `SiegelHT.classicalVB_equivariance`. Import B4's `μ`-normalized classical `VB⁰` identification for
finite-dimensional algebraic M-dominant `L_κ`, neat tame `K^p` and a sufficiently large p-adic field E.
Compare coherent level cohomology with `colim_{K_p}RΓ(X_KpK^p,ω^κ_Kp)`, a complex of smooth admissible
`G(ℚ_p)`-representations, with the corresponding normalization. Give the subcanonical version using
the actual boundary ideal, and compatibility with level maps, prime-to-p Hecke maps and fan changes
through common refinements. For `GSp₄` the `(1,0;−1)` check gives `ω_A(−1)⊗O^sm`. B3.HT.8 constructs the functor and proves its finite-dimensional descent by
function descent on the actual tower, and identifies its derived cohomology with this colimit.

*Hypotheses.* The bundle is finite-dimensional and algebraic, not a locally analytic Coleman
coefficient. Retain the `μ` normalization; §4.8 uses untwisted coherent bundles and applies its Tate
twists separately. Use only B3.HT.8's finite-algebraic subcategory and retain its Tate action.

*Source:* [BCGP], §§4.6.1–4.6.2, pp.81–82; §§4.5.17–4.5.22 for refinement context.

*Needs:* B3.HT.6–8 (tower, torsor, function/coefficient descent and cohomology);
B4.21; B3.2, B3.4–B3.6; B3.general.3; B5.10;
ShimuraCompactifications C3 (C3.9 `ToroidalRefinement.cohomology_iso`, C3.3 `ToroidalHeckeSpan`);
SchemeAndStackFoundations Layer 2 (§§2.6, 2.18).
*Lean:* none; specified in the README only.

**Checks.**

- The `(1,0;−1)` coefficient is `ω_A(−1)`, not untwisted `ω_A`.
- At `κ=0` the actual constant coefficient matches the classical structure sheaf with its supplied
  normalization.
- The cusp comparison uses `ω_Kp^κ(−D_Kp)` on every finite model and the actual boundary maps, not
  ordinary `Γ` on the open Shimura variety.

### B5.21 Classical Siegel Hodge–Tate decomposition

Prove `SiegelHT.decomposition`. For BCGP's finite-level `GSp₄` toroidal model, take an integral
dominant `κ=(k₁,k₂;w)` with `0≥k₁≥k₂` and `k₁+k₂+w` even. Let `V_κ∨` be the actual canonical
pro-Kummer-étale coefficient. With the untwisted coherent convention of §4.8 put `λ₀=(k₁,k₂;−w)`,
`λ₁=(2−k₁,k₂;−w)`, `λ₂=(3−k₂,k₁+1;−w)`, `λ₃=(3−k₂,3−k₁;−w)`, and `2a₀=k₁+k₂+w`, `2a₁=2−k₁+k₂+w`,
`2a₂=4−k₂+k₁+w`, `2a₃=6−k₁−k₂+w`. For `i≥0` specify the `G_ℚp×T_KpK^p`-equivariant comparison `Hⁱ(X,V_κ∨)⊗_ℚp C_p≃⊕_{j=0}³H^(i−j)(X,ω^λj)(−a_j)`, with negative coherent degrees zero. Use the
logarithmic/pro-Kummer cohomology in the source, its actual comparison and dual BGG/Kostant inputs;
a spectral sequence alone does not establish the displayed decomposition.

*Hypotheses.* Keep all four weights, central weight `−w`, shifts `i−j` and separate Tate twists `−a_j`.
Parity makes every `a_j` integral. B3.log.2 constructs the canonical
Kummer coefficient, B3.log.3 identifies its de Rham realization, and B3.log.4
constructs the ordinary filtered period comparison and degeneration.
B3.BGG.1–3 supplies the relative resolution, its geometric dual and the
coherent graded pieces. The comparison is over the local reflex field `ℚ_p`
with the rational `GSp₄` representation, so the displayed Galois action is
`G_{ℚ_p}`. If coefficients are extended to a finite extension `L/ℚ_p`, extend both
sides along `ℚ_p→L→C_p`; do not replace the base Galois group without also
changing the field of definition.
For `κ=0` the four `λ_j` are `(0,0;0)`, `(2,0;0)`, `(3,1;0)`, `(3,3;0)` and `a_j=0,1,2,3`. At `i=0` only the `j=0`
term can survive. The parity test excludes `(0,0;1)`, so half-weight division is exact integer
division only under the hypothesis. B3.BGG.3 combines the ordinary log comparison with the
coherent graded calculation to give this canonical decomposition. It is a
finite-level construction, independent of B3.HT and B5.20.

*Source:* [BCGP], §4.8.1 and Theorem 4.8.2, pp.101–102; [FC90], VI §6, Theorem 6.2(i),
p.241 (the classical `p`-adic comparison), and VI §5, Theorem 5.5(i), pp.233–234
(dual BGG degeneration).

*Needs:* B3.log.2–4; B3.BGG.1–3; B2.3, B2.5–B2.6; B3.2, B3.7;
B4.16; B5.11 (Hecke convolution); SchemeAndStackFoundations Layer 2
(§§2.6, 2.18).
*Lean:* none; specified in the README only.

**Checks.**

- For `κ = 0` the coherent weights are `(0,0;0)`, `(2,0;0)`,
  `(3,1;0)`, `(3,3;0)` and the doubled Tate exponents `0, 2, 4, 6`.
- `SiegelHT.parity` (non-example): `(0, 0; 1)` fails the parity condition and its first doubled
  exponent is odd, so halving it is not integer division.
- `SiegelHT.weights_nonzero` (computation): for `κ = (0,−2;2)`, the coherent weights are
  `(0,−2;−2)`, `(2,−2;−2)`, `(5,1;−2)`, `(5,3;−2)` and doubled exponents `0,2,8,10`.
  This tests the sign of the central weight and distinguishes the four Weyl terms away from zero.

- At `κ=(0,0;0)`, `λj=(0,0;0),(2,0;0),(3,1;0),(3,3;0)` and `a_j=0,1,2,3`.
- At `i=0` only the `j=0` summand can survive; negative coherent degree is zero.
- For `κ=(0,0;1)`, parity fails and the integral GSp4 representation in this convention is
  unavailable; a formula using integer truncation of half-weights is rejected.

### B5.22 Compact-support Siegel Hodge–Tate decomposition

Prove `SiegelHT.decomposition_compactSupport`. For exactly the datum, integral weight, coefficient
and Tate convention of B5.21, specify `H_cⁱ(X,V_κ∨)⊗_ℚp C_p≃⊕_{j=0}³H^(i−j)(X,ω^λj(−D))(−a_j)`,
equivariantly for `G_ℚp×T_KpK^p`. Here `X` in the coherent terms is the proper toroidal model, `U=X−D`, and
the left side means `H_c^i(U_{ℚ̄_p},V_κ∨)`, constructed by B3.log.5. The latter
constructs the supported period kernel and duality; B3.BGG.2–3 supplies the
`−D` dual BGG complex and degeneration.

*Hypotheses.* Use the same four `λ_j` and `a_j`, all component boundary ideals and compact-support
functoriality. Use B3.log.5's supported comparison and B3.BGG.3's compact-support graded
comparison, compatibly with the support-forgetting map and the dual-coefficient trace.
Every coherent term carries `−D`, in addition to its Tate twist.

*Source:* [BCGP], Theorem 4.8.2, compact-support display, pp.101–102; [FC90], VI §6,
Theorem 6.2(i), p.241, and VI §5, Proposition 5.4(2) and Theorem 5.5(ii), pp.233–234
(boundary ideal and compact-support dual BGG degeneration).

*Needs:* B3.log.2–3, B3.log.5 (compact-support periods, comparison and duality);
B3.BGG.2–3; B5.21 (the coefficient/weight convention); B5.11;
B3.2, B3.4, B3.7; B4.16; EtaleDualityAndPerverseSheaves §§0.1–0.6, 2.2;
SchemeAndStackFoundations Layer 2 (§§2.6, 2.18).
*Lean:* none; specified in the README only.

**Checks.**

- At `κ=0` the four coherent terms have twists `−D` and Tate shifts `0,−1,−2,−3`, with their degree shifts
  retained.
- When D is empty the boundary twist is identity and the proper compact-support theory agrees with
  the ordinary one under the supplier comparison.
- When D is nonempty, silently using `ω^λ` in place of `ω^λ(−D)` fails the cusp-coefficient convention.

### Examples

- The formal series `(1 − q)⁻¹` has coefficient `1` in every degree over a nonzero ring; a
  finite-support coefficient target loses valid completed sections (B5.14).
- Over `ℤ/4` reduction to `ℤ/2` is not injective and `2` is a nonzero nilpotent; the expansion proof
  uses both terms of an extension rather than testing residue fields only (B5.5).
- For the shear action of `C₂` on `(ℤ/2)²` the second-coordinate quotient is onto before invariants
  and not after; only left exactness of invariants is used (B5.3).
- In the Siegel comparison `κ = 0` gives coherent weights `(0,0;0)`, `(2,0;0)`, `(3,1;0)`,
  `(3,3;0)`, Tate twists `0, −1, −2, −3` and coherent degrees `i, i−1, i−2, i−3`; every compactly
  supported term additionally carries the twist by `−D`, and the weight `(0,0;1)` fails the parity
  condition (B5.21).
- At a good prime `ℓ ∤ N` the modular Hecke operator acts on expansions by
  `b_n = a_{ℓn} + χ(ℓ) ℓ^{k−1} a_{n/ℓ}`, with the second term zero when `ℓ ∤ n` (B5.19).

### Dependencies

Layers B0–B4; ShimuraCompactifications C0–C6; AdelicAlgebraicGroups §4.5; AdicSpacesPartIII F0;
SchemeAndStackFoundations Layers 1–2; AlgebraicModularFormsAndSerreWeights R15.1–R15.2;
HilbertModularVarietiesAndShimuraCurves H2, H3; Tau Ceti Hecke rings;
B3.Hilbert.1–4, B3.log.1–5, B3.BGG.1–3 and B3.HT.6–8.

## Worked examples

- For `GL₂`, the tautological compact-dual line has degree `−1`, while the cohomological modular
  Hodge coefficient of weight `k` is `ω^k`. The coefficient/dual comparison determines the sign;
  identifying both by an unqualified character would reverse a weight (B0.5, B4.10).
- On a proper geometrically connected model the unit coefficient has section space `L`. On
  `Spec L[t]` it has the infinite independent family `1, t, t², …`. Properness is essential to the
  finite-dimensional statement (B4.1).
- At a two-component boundary crossing, cusp membership is divisibility by `q₁q₂`. After a blow-up
  the exceptional boundary can have a different pullback multiplicity; ideal pushforward compares
  cusp sections (B3.4, B3.5).
- For an arithmetic Hilbert weight with `k = 4`, `w = 2` at one embedding, the determinant exponent
  is `−1`. Replacing it by a nonnegative exponent changes the central character (B4.11).
- A formal series `(1 − q)⁻¹` has nonzero coefficients in all degrees over a nonzero ring. A
  finite-support coefficient target loses valid completed sections (B5.14).
- Over `ℤ/4`, reduction to `ℤ/2` is not injective, and the coefficient `2` is a nonzero nilpotent.
  The expansion proof uses both terms of an extension rather than testing only residue fields (B5.5,
  B5.6).
- For the shear action of `C₂` on `(ℤ/2)²`, the second-coordinate quotient is surjective before
  invariants and not after. Only the left-exact invariant functor enters the argument (B5.3).
- In the Siegel comparison `κ = 0` gives coherent weights `(0,0;0)`, `(2,0;0)`, `(3,1;0)`,
  `(3,3;0)`, Tate exponents `0, −1, −2, −3` and coherent degrees `i, i−1, i−2, i−3`. Every
  compact-support term additionally has the twist by `−D`. The putative weight `(0,0;1)` fails
  parity and must not be accepted by integer division of a half-weight (B5.21).
- In weight zero the normalized modular Hecke operator at an unramified prime `ℓ` sends `1` to
  `ν(g)·(ℓ + 1) = (ℓ + 1)/ℓ`, with `ν = det⁻¹`; the raw pull-trace operator gives `ℓ + 1` (B5.10).
  The Checks of `ClassicalHecke.modularNormalization` give `3/2`, `4/3` and `6/5` at primes
  `2`, `3` and `5` respectively.

The roadmap's endpoint is usable classical and cuspidal coefficients over their actual number fields
and over the specified integral PEL and Hilbert bases, with coherent functorial maps, Hecke actions
and coefficient-detecting expansions.

## Downstream consumers

- **HodgeTateAndCanonicalSubgroups** §§1–2, 7.29–7.30 use the Hodge tensors, principal
  bundle, automorphic realizations and nilpotent-residue boundary extensions of B0–B3;
  its Layers 6–7 compare their smooth-pair instance with B3.log.1–3. B3.HT.1 uses
  CohomologyComparisons §6.2's shared package and retains the identification for its
  §§3.4, 3.6–3.8 cyclotomic-base abelian-family weak/strong subgroup assertions: its
  `TauCeti.HodgeTate.canonicalSubgroup` is this finite flat subgroup with the same
  congruence, base-change, nesting and quotient maps. Its additional pointwise Harder–Narasimhan
  construction agrees on the overlap by subgroup uniqueness; its wider ranges, degree formula
  and integral Hodge–Tate estimates remain there.
- **PerfectoidShimuraVarieties** (S6) uses the canonical principal bundle, automorphic
  bundle functor, boundary extensions and classical VB normalization (B0–B4), and the
  rational tower/Levi-torsor and finite-algebraic `VB⁰` constructions of B3.HT.2–8.
  Its §§1.3–1.22 use B3.HT.2–3's Hasse charts, good triples and anticanonical Frobenius tower;
  §§1.23–1.28 use B3.HT.4's minimal Siegel tower and period map; §1.29 uses B3.HT.5's toroidal
  tower; §3.8(c) uses B3.HT.6's closed Hodge-type toroidal tower on the induced fan system.
  The identifications are over the same finite-level spaces, preserve the completed rings and
  boundary ideals, and use the action and fixed/full-similitude dictionary of B3.HT above.
  Its rational Levi comparison is B3.HT.7 with that same Tate twist. Genuine-minimal,
  pre-abelian and general-data extensions and locally analytic coefficients remain there.
- **AutomorphicGaloisRepresentationsPartII** (AG2.1a, AG2.4) uses automorphic bundles and their
  canonical and subcanonical extensions (Layers B2–B3).
- **OverconvergentAutomorphicForms** (O1, O6, O8), **AbelianVarietiesIsogenousToNoJacobian**,
  **TorsionCohomologyInfrastructure** (TC.1), **AutomorphicBundlesPartII**, and the
  Iwasawa-theoretic roadmaps (AutomorphicPadicLFunctions, AutomorphicCongruences,
  IntegralIwasawaTheory, PadicFamilies) use classical forms, Hecke operators and the expansion
  principle (Layers B4–B5).

## References

- **Milne90.** J. S. Milne, *Canonical models of (mixed) Shimura varieties and automorphic vector bundles*. Corrected author revision, 11 March 2018; cited chapter and page numbering. [Milne90]

[Milne90]: https://www.jmilne.org/math/xnotes/AA.pdf

- **Milne88.** J. S. Milne, *Automorphic vector bundles on connected Shimura varieties*. Author TeX copy of Invent. Math. 92 (1988), pp.91–128 [Milne88]

[Milne88]: https://jmilne.org/math/articles/1988aT.pdf

- **LanIntro.** Kai-Wen Lan, *An Example-Based Introduction to Shimura Varieties*. Author-hosted introduction; cited section and printed page numbering. [LanIntro]

[LanIntro]: https://www.kwlan.org/articles/intro-sh-ex.pdf

- **AG.** F. Andreatta, E. Z. Goren, B. Howard, K. Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*. Version of record, Annals of Mathematics 187 (2018), 391–531 [AG]

[AG]: https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf

- **CS.** A. Caraiani, P. Scholze, *On the generic part of the cohomology of compact unitary Shimura varieties*. Version of record, Annals of Mathematics 186 (2017), 649–766 [CS]

[CS]: https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf

- **BCGP.** G. Boxer, F. Calegari, T. Gee, V. Pilloni, *Modularity theorems for abelian surfaces*. arXiv:2502.20645v1, 28 February 2025. [BCGP]

[BCGP]: https://arxiv.org/pdf/2502.20645v1

- **HLTT.** M. Harris, K.-W. Lan, R. Taylor, J. Thorne, *On the rigid cohomology of certain Shimura varieties*. Author-hosted manuscript; cited manuscript page numbering. [HLTT]

[HLTT]: https://www.kwlan.org/articles/rigcoh.pdf

- **HarrisLoc.** M. Harris, *Beilinson–Bernstein localization over Q and periods of automorphic forms*. Author-hosted manuscript; cited manuscript page numbering. [HarrisLoc]

[HarrisLoc]: https://webusers.imj-prg.fr/~michael.harris/BBlocalization_web.pdf

- **HarrisBundles.** M. Harris, *Vector bundles (Cours 2013, 4fibres)*. Author-hosted course notes, 2013. [HarrisBundles]

[HarrisBundles]: https://webusers.imj-prg.fr/~michael.harris/Cours_2013/4fibres.pdf

- **HarrisLog.** M. Harris, *Logarithmic growth (Cours 2013, 8logarithmique)*. Author-hosted course notes, 2013. [HarrisLog]

[HarrisLog]: https://webusers.imj-prg.fr/~michael.harris/Cours_2013/8logarithmique.pdf

- **HarrisToric.** M. Harris, *Torus embeddings (Cours 2013, 7torique)*. Author-hosted course notes, 2013. [HarrisToric]

[HarrisToric]: https://webusers.imj-prg.fr/~michael.harris/Cours_2013/7torique.pdf

- **Deligne.** P. Deligne (notes by J. S. Milne), *Hodge cycles on abelian varieties*. Revised author TeX copy, 1 October 2018, of LNM 900 (1982), pp.9–100 [Deligne]

[Deligne]: https://jmilne.org/math/Documents/Deligne82.pdf

- **Diamond21.** Fred Diamond, *Geometric weight-shifting operators on Hilbert modular forms in characteristic p*. arXiv:2011.14128v2, 18 September 2021. [Diamond21]

[Diamond21]: https://arxiv.org/pdf/2011.14128v2

- **LanPEL.** Kai-Wen Lan, *Arithmetic compactifications of PEL-type Shimura varieties*. Author-hosted thesis revision, 14 March 2021, with book numbering. [LanPEL]

[LanPEL]: https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf

- **LanErrata.** Kai-Wen Lan, *Arithmetic compactifications of PEL-type Shimura varieties - Errata*. 14 March 2021 [LanErrata]

[LanErrata]: https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf

- **StacksPrime.** The Stacks Project Authors, *Lemma 10.62.1: prime filtrations of finite modules*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksPrime]

[StacksPrime]: https://stacks.math.columbia.edu/tag/00L0

- **StacksKrull.** The Stacks Project Authors, *Krull's intersection theorem*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksKrull]

[StacksKrull]: https://stacks.math.columbia.edu/tag/00IP

- **StacksColimit.** The Stacks Project Authors, *Filtered colimits and finitely presented modules on algebraic stacks*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksColimit]

[StacksColimit]: https://stacks.math.columbia.edu/tag/0GQZ

- **ConradLuminy.** Brian Conrad, *Reductive group schemes*, in Autour des schémas en groupes I, Panoramas et Synthèses 42–43 (2014); author-hosted copy; page numbers as printed in that copy. [ConradLuminy]

[ConradLuminy]: https://math.stanford.edu/~conrad/papers/luminysga3.pdf

- **StacksTrace.** The Stacks Project Authors, *Section 49.3: Discriminant of a finite locally free morphism* (the trace `Trace_π` of a finite locally free morphism). Use the cited tag; chapter numbering follows the linked text. [StacksTrace]

[StacksTrace]: https://stacks.math.columbia.edu/tag/0BVH

- **StacksProjective.** The Stacks Project Authors, *Finite projective modules*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksProjective]

[StacksProjective]: https://stacks.math.columbia.edu/tag/00NX

- **StacksStein.** The Stacks Project Authors, *Stein factorization for algebraic spaces*. Use the cited tag and numbered statement; chapter numbering follows the linked text. [StacksStein]

[StacksStein]: https://stacks.math.columbia.edu/tag/0A18

- **StacksConnected.** The Stacks Project Authors, *Stein factorization*,
  Lemma 37.53.6, tag 0AY8 (proper reduced total space over a normal integral
  base, with generic global functions equal to the base field).

[StacksConnected]: https://stacks.math.columbia.edu/tag/0AY8

- **MathlibPrime.** Jinzhao Pan and the Mathlib contributors, *Prime filtrations and exact-sequence induction for finite modules*. Mathlib commit 6b7abb3c7686292736be2955bd3eb9ebf63b456a [MathlibPrime]

[MathlibPrime]: https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean

- **EGAI.** A. Grothendieck, with J. Dieudonné, *Éléments de géométrie algébrique I: Le langage des schémas*. Publications Mathématiques de l’IHÉS 4 (1960), journal scan served by Numdam [EGAI]

[EGAI]: https://www.numdam.org/article/PMIHES_1960__4__5_0.pdf

- **LanHigher.** Kai-Wen Lan, *Higher Koecher’s principle*. Author-hosted preprint; cover directs readers to Mathematical Research Letters 23 (2016), 163–199, DOI 10.4310/MRL.2016.v23.n1.a9 for the official version. Locators below use the preprint pagination, not journal pagination. [LanHigher]

[LanHigher]: https://www.kwlan.org/articles/Koecher.pdf

- **Diamond22.** Fred Diamond, *Compactifications of Iwahori-level Hilbert modular varieties*. arXiv:2211.06922v1, 13 November 2022 (PDF cover date) [Diamond22]

[Diamond22]: https://arxiv.org/pdf/2211.06922v1

- **FC90.** G. Faltings and C.-L. Chai, *Degeneration of Abelian Varieties*, Ergebnisse der
  Mathematik und ihrer Grenzgebiete (3) 22, Springer, 1990. Locators use printed book pages.

[FC90]: https://doi.org/10.1007/978-3-662-02632-8

- **Scholze15.** Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*.
  arXiv:1306.2070v2. Locators use the manuscript's Roman chapter/section numbers and printed pages.

[Scholze15]: https://arxiv.org/abs/1306.2070v2

- **PS16.** Vincent Pilloni and Benoît Stroh, *Cohomologie cohérente et représentations galoisiennes*.
  Author-hosted manuscript, Appendix A; manuscript pagination, accessed 16 October 2026.

[PS16]: https://webusers.imj-prg.fr/~benoit.stroh/coco.pdf

- **Lan22.** Kai-Wen Lan, *Closed immersions of toroidal compactifications of Shimura varieties*.
  Author-hosted manuscript, accessed 16 October 2026; manuscript pagination.

[Lan22]: https://www.kwlan.org/articles/cpt-tor-imm.pdf

- **DLLZ.** Hansheng Diao, Kai-Wen Lan, Ruochuan Liu and Xinwen Zhu,
  *Logarithmic adic spaces: some foundational results*. Author-hosted manuscript,
  accessed 16 October 2026; manuscript pagination.

[DLLZ]: https://www.kwlan.org/articles/log-adic.pdf

- **DLLZRH.** Hansheng Diao, Kai-Wen Lan, Ruochuan Liu and Xinwen Zhu,
  *Logarithmic Riemann–Hilbert correspondences for rigid varieties*.
  arXiv:1803.05786v4, 30 October 2022; manuscript pagination.

[DLLZRH]: https://arxiv.org/pdf/1803.05786v4

- **LLZ.** Kai-Wen Lan, Ruochuan Liu and Xinwen Zhu,
  *De Rham comparison and Poincaré duality for rigid varieties*. Author-hosted
  manuscript, accessed 16 October 2026; manuscript pagination.

[LLZ]: https://www.kwlan.org/articles/comp-dual.pdf

- **RC22.** Juan Esteban Rodríguez Camargo, *Locally analytic completed cohomology*.
  arXiv:2209.01057v4, 9 April 2026; manuscript pagination.

[RC22]: https://arxiv.org/pdf/2209.01057v4
