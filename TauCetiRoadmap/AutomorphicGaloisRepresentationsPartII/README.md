# Roadmap: automorphic Galois representations, part II — regular algebraic `GL_n`

**Summary.** This roadmap constructs the continuous semisimple Galois representations associated with regular algebraic cuspidal representations of `GL_n` over CM and totally real fields. It starts with algebraic weights and the good-place Hecke polynomial, constructs the representations through compact-unitary cohomology or ordinary boundary cohomology, and then proves local compatibility, coefficient-prime admissibility and residual properties. These results provide the arithmetic input for potential automorphy, modularity lifting and the generic parts of Shimura-variety cohomology.

The polarized route includes conjugate-self-dual cuspidal representations over CM fields, algebraic-character twists and essentially self-dual descent to totally real fields. The nonselfdual existence and away-prime route has the CM or totally real scope of HLTT and Varma. The newer nonselfdual coefficient-prime result is the CM theorem of A’Campo–Hevesi–Thorne–Whitmore. Selected unitary discrete transfers produce semisimple sums with specified constituents; a sum of this kind need not be irreducible. Three `GSp₄` specializations at the end use AG2.P’s conditional spin constructions and transfer dictionary, retaining the supplier’s `GSp₄` classification inputs. The coefficient-prime comparisons in rank `n≥2` that go beyond the BLGGT Iwahori case, including the nonselfdual semisimple comparison built on the polarized one, and the exports and `GSp₄` clauses that use them, assume the irreducibility hypothesis `ExtremelyRegularIrreducibility` of AG2.6; rank one, the good-place construction and polarized de Rham admissibility do not.

The base roadmap AutomorphicGaloisRepresentations stops at the classical and Hilbert `GL₂`
constructions: rank-two representations of eigenforms over `ℚ` and totally real fields, their
lattices, Hecke determinants and deformation maps. This part does not cite it. The general-rank
construction here is independent of those `GL₂` constructions; it meets the rank-two members only
through the AG2.P adapters to AlgebraicModularFormsAndSerreWeights R15.5A and
GL2AutomorphicRepresentationsAndTransfer §§R16.6.3–R16.6.4, and their representations are
identified on the regular-weight overlap in AG2.6 and AG2.7.
`Suggested.lean` states `hlttFactorSeparation` in AG2.4 and
`infinitelyManyDecomposedGenericPrimes` in AG2.7. The latter uses
`FiniteModelDecomposedGenericPrime`, a definition on finite Galois realizations of residual
representations. These are the file's compiled declarations. The other Lean names below
specify interfaces to build, and the Checks specify mathematical examples. Automorphic
existence, local period comparisons and compatible-system assembly require the supplier
carriers specified here.

## Scope and ownership

This roadmap owns the specialization of algebraic coordinates to polarized `GL_n` weights, the
corrected Kuga–Sato realization, extraction of actual Galois constituents, the definite-unitary
and ordinary-boundary constructions, their local comparisons and the arithmetic exports.
General representation theory, raw compact-unitary cohomology, determinant interpolation,
period-ring carriers and residual Hecke predicates are supplied by the roadmaps in the contracts
below. AG2.P supplies the finite-coefficient and normalization adapters for arithmetic
p-adic Hodge theory and the normalized-system correspondence-trace comparison.
AG2.6 uses the relative Fargues–Fontaine curves and divisors of VectorBundlesAndIsocrystals
VB−1, the bundle stacks, Newton strata and lisse categories of VStackSheavesAndLisseCategories
VS3–VS4, the Satake equivalence of GeometricSatakeAndFusion GS0–GS4 and the parameter
stacks of LanglandsParameterStacks LP1 and LP4. It owns the extension of the bundle geometry
to `Perf_{𝔽_q}`, the global Hecke modification stacks and Hecke functors, the geometric
spectral action with its excursion operators and integral spectral centre, and the minuscule
local Shimura towers with their compactly supported cohomology and Hecke realization for
arbitrary `(G,b,μ)`. These four AG2.6 sections form a self-contained prefix in the
dependency order: they use only the suppliers just named and no automorphic, Galois or Igusa target of this roadmap, so a
roadmap needing these objects on this domain imports these carriers. The citable sections
are the AG2.6 subsections “Relative Fargues–Fontaine curves and degree-one divisors”,
“Bundle strata, lisse categories and the geometric Hecke action” (the global Hecke stacks
`Hck^I_G` with `p₁`, `p₂`, unit, leg repetition, completion and bounded pieces, and the Hecke
functor `T_V:D_lis(BunG,Λ)→D(BunG×(Div¹_K)^I,Λ)`, its descent to `D_lis(BunG,Λ)^{BW_K^I}`,
the monoidal structure in `V` on the descended functors, its Weil structure and minuscule
shift `d_μ=⟨2ρ,μ⟩`), “The parameter stack and geometric spectral action” (excursions and
the integral centre for `O_L` with `ℓ∤|π₀Z(G)|`) and “Minuscule local Shimura spaces and
their Hecke realization” (points of `Hck_{G,≤μ}` from the trivial source to the target
`E_b`, `b∈B(G,μ⁻¹)`, `RΓ_c` and its Hecke realization). Solid or enhanced coefficient versions and nonminuscule or
non-basic-target towers are refinements stated on these carriers. The algebraic
parameter stacks, finite-wild levels and excursion algebra stay with LanglandsParameterStacks
LP1 and LP4 and SmoothRepresentationsOfLocalGroups SR.6. The AHTW Igusa
compactification, Newton filtration, local–classical comparison and annihilator arguments
follow them. The particular families and
compactifications belong to AG2.3–AG2.4. SmallRamificationAndAbelianVarietyBaseCases owns
the arbitrary-rank raw carrier and operations; AG2.P owns the compatibility predicates
and their preservation under those operations.

The following interfaces retain their supplier's definitions and complete API, including its
Checks. They are used only after the hypotheses of the named specialization are discharged.

## Exact supplier contracts

### Mathlib and roadmaps on main

- Mathlib `NumberField.IsCMField`, `NumberField.IsCMField.complexConj` and
  `NumberField.IsCMField.complexEmbedding_complexConj` in
  `Mathlib.NumberTheory.NumberField.CMField` supply CM conjugation and its effect on embeddings.
  `Multiset.prod_X_sub_C_coeff` in `Mathlib.RingTheory.Polynomial.Vieta` supplies the signed
  elementary-symmetric coefficient identity over a commutative ring.
- Mathlib `Matrix.GeneralLinearGroup`, `Matrix.GeneralLinearGroup.map`,
  `Matrix.GeneralLinearGroup.toLin`, `Matrix.charpoly`, `Matrix.charpoly_map`,
  `Matrix.charpoly_diagonal`, `Matrix.charpoly_units_conj`, `Matrix.rank`,
  `Representation.IsSemisimpleRepresentation` and `Representation.IsIrreducible` supply the
  matrix and representation algebra. `IntermediateField.finiteDimensional_adjoin` supplies
  finite algebraic enlargement by finitely many entries. These are algebraic statements and
  supply no period comparison or automorphic existence.
- GlobalNumberFields Layers 9–10 supply Hecke characters, infinity types and the cyclotomic
  dictionary; ClassFieldTheory Layers 7 and 11 supply local and global reciprocity. Use the
  inverse of their arithmetic Artin maps for geometric Frobenius. AG2.2's S-general extension
  prescriptions and the compatible global character extension are targets here.
- RepresentationTheory/SchurWeyl Layer 2 supplies normalized rational Young idempotents and
  Layer 8 supplies Schur–Weyl duality. RepresentationTheory/SemisimpleAlgebras Layers 1–2 supply
  isotypic components and Artin–Wedderburn. The map to actual geometric correspondences,
  coefficient degree, signs and Tate twist belong to AG2.1a.
- AdicSpacesPartII supplies analytic/formal adic foundations. AdicSpacesPartIV §§F1.9–F1.12
  and F1.16 supply the dagger de Rham complex, finite étale traces and the boundary-ideal log
  complex; no dagger construction is assigned to AdicSpacesPartII.

### Arithmetic and automorphic contracts

- SmallRamificationAndAbelianVarietyBaseCases §5.0d supplies `AutomorphicSystemData`
  and its raw coefficient extension/conjugation, finite restriction, direct sum, tensor,
  dual and Tate-twist operations, including their member, polynomial and Hodge formulas
  and identity/composition laws. It also supplies the geometric/arithmetic Frobenius,
  Weil–Deligne and Hodge-sign adapters and the marked rank-two specialization
  `ArithmeticCompatibleFamily`. Its finite-exception comparison condition does not imply
  the pairwise almost-strict condition. Section 5.1 supplies `GL2TypeAction.isogeny` and
  `GL2TypeAction.baseChange`, using `endZeroIsogeny` and `endZeroBaseChange`, for marked
  abelian-variety realizations with their chosen coefficient action and embedding.
  AG2.P uses the raw carrier without requiring the rank-two specialization's chosen
  models over the coefficient-field completions; compatibility predicates and automorphic
  existence are targets here.
- EtaleCohomologyFoundations §F.4.0 supplies `ContinuousRep`;
  ArithmeticGaloisRepresentations §§1.1–1.6 supply its coefficient operations
  and stable lattices; §§1.7–1.9 supply semisimplification, Brauer–Nesbitt and residual
  reduction with lattice independence. Section 1.11 retains its additional hypotheses for
  stronger lattice statements. Section 1.5 supplies finite local coefficient descent. Sections 2.1–2.4 supply
  decomposition groups and Weil–Deligne representations; Layer 5 supplies recognition from
  Frobenius polynomials and finite-field/trace-field descent. Section 7.4 supplies `PolarizedRep`,
  `CHTGroup`, multipliers, signs, operations and coefficient transport of polarizations. The reduction-and-semisimplification
  extension theorem is the explicit AG2.7 target below. The Galois pairing convention of BLGGT §2.1, p.31,
  is precisely this supplied notion: transport between real places and the orthogonal/symplectic
  alternatives retain the supplier's hypotheses. A deformation problem assuming an extension
  is not its construction.
- IntegralHeckeAndGaloisDeterminants §3a.1 (GLₙ Hecke polynomials and Frobenius conventions)
  supplies the integral `GL_n` Hecke polynomial, its Satake factorization and its
  scalar-twist, reciprocal, geometric/arithmetic and rank-two normalizations. Section 3b.1
  (Galois-type and non-Eisenstein maximal ideals) supplies the Galois-type and non-Eisenstein
  predicates on maximal ideals, their chosen realizations, uniqueness and coefficient
  extension; §3b.2 supplies dual and character-twist comparison.
  Layers 0–1 supply determinant laws and semisimple reconstruction; §4.2 supplies actual
  uniform congruence witnesses, finite quotient data and inverse-limit interpolation, including
  coefficient, level and ramification compatibility. These notions are used without local copies.
- ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7 supply automorphic representations,
  algebraic highest weights, coefficient representations, infinitesimal characters and the
  cohomological/C-algebraic dictionary. AutomorphicSpectralTheory §4.7 supplies compact quotient
  discrete spectral decomposition, and §7.1 supplies solvable `GLₙ` base change, descent of
  Galois-invariant cuspidal representations and the fibre theorem used by AG2.6's descent to
  soluble non-Galois intermediate fields. ArithmeticLocallySymmetricSpaces ALS.5b.5 supplies
  cuspidal cohomology with algebraic coefficients over a number field, the input to
  HLTT Corollary 1.9 for the boundary Levi.
- AutomorphicFormsOnReductiveGroups §5.7 supplies the smooth finite-part scalar twist,
  stabilizer rationality field, twist/conjugation laws and Clozel finiteness for regular
  algebraic cuspidal `GL_n` over any number field in cohomological normalization.
  AG2.0 specializes that field to CM and totally real fields and proves the good Hecke polynomial
  and attached Galois trace comparisons.
- EndoscopicTransferAndUnitaryTraceComparison §9.1 (Raw compact-unitary PEL cohomology)
  supplies, for its Harris–Taylor division-algebra datum, the seven operations of its raw
  interface: the raw PEL model at a neat level, the algebraic coefficient local system, the
  level correspondences acting by pullback and proper trace, the comparison with the
  integral-model nearby-cycle complex, the Weil descent action commuting with every
  correspondence, the multiplicity Hom space of an isolated automorphic type with its induced
  Weil action, and the identity `w(ev)=e(wv)` for a chosen Hecke idempotent `e`.
  Thus `H^k_U(ξ)`, its level colimit, its Hecke/Galois actions and the graded multiplicity Hom
  spaces use that raw object, retaining finite-dimensionality, continuity, finite-coefficient
  descent, admissibility and the discrete decomposition. Its Euler class is never an actual
  representation by definition. AG2.1a constructs the same operations for Shin’s split-algebra odd-rank
  datum through its raw-cohomology adapter, including properness, the ramified Drinfeld
  factor and corrected coefficient realization; §9.1 supplies the API shape, not that instance.
- EndoscopicTransferAndUnitaryTraceComparison §§7.6–7.10 supplies finite-level rational Igusa
  geometry and actions; §§8.3, 8.6 and 8.14 supply the polarized Honda/effectivity input;
  §§8.16–8.22 supply raw counting and stabilization; §§10.18–10.27 supply trace-defined local `GL_n` parameters; §10.30 identifies them with
  the supplied classical correspondence and transports dual, twist, field-isomorphism and
  local-factor normalizations;
  §§6.24, 6.26–6.29 and 13.1–13.4 supply cyclic/solvable transfer and selected cohomological
  unitary transfer. Layer 14 supplies the signed Igusa spectral comparison with all mass
  factors. These are the exact contracts for stable/endoscopic traces and pure transfer here;
  no trace formula is deduced from the existence of a later automorphic Galois representation.
- SmoothRepresentationsOfLocalGroups SR.0 and SR.0d supply the abelian smooth category and
  derived Ext, and SR.3 and SR.5 supply Bernstein components and centre actions.
  LocallyAnalyticDistributions §§4.2, 4.15–4.16 supply Fredholm determinants, analytic Banach
  families and finite-slope decompositions. AG2.3 constructs its definite-unitary eigenvariety
  and classicality/density comparison from these analytic objects.
- AlgebraicModularFormsAndSerreWeights §R15.5A supplies the independent classical rank-two
  cohomological summand and Galois attachment. GL2AutomorphicRepresentationsAndTransfer
  §R16.6.3 supplies Hilbert cohomological weights and §R16.6.4 the classical weight-`k`
  Frobenius conversion. AG2.P’s rank-two contract supplies the Hilbert inverse-uniformizer
  Hecke conversion between `ρ` and `σ_Carayol`.
  WeightsInEtaleCohomology Layer R34.6 supplies fixed-form compatible-family and local
  comparisons only on its specified geometric domain. AG2.6's rank-two comparisons assume
  both independently constructed members and their exact local hypotheses. The cohomological polarized rank-two
  coefficient-prime theorem outside that supplied geometric domain is an AG2.P target.

### Geometry, coefficients and periods

- PELModuli Layers M0–M4 supply PEL data, universal abelian schemes, representability,
  canonical models and level maps. ShimuraVarieties §§8.18–8.23 supply minimal compactification
  descent and functoriality. The HLTT integral toroidal/Kuga models, subcanonical coefficients
  and Hasse sections are constructed in AG2.4 with the exact HLTT hypotheses.
- EtaleCohomologyFoundations §§F.4.1–F.4.6 supply rational coefficient realization, finiteness
  and continuous actions; §§F.5–F.6 supply duality and cycle classes. Its §F.10.3 supplies
  coherent perfect-complex traces. LefschetzPencilsAndVanishingCycles §F.10 supplies its
  Frobenius trace imports, LPV.0–LPV.1 nearby cycles and monodromy, and LPV.6 perversity.
  EtaleDualityAndPerverseSheaves §§3.1–3.2 and 6.1–6.5 supply the finite, integral and
  rational coefficient categories, `TauCeti.EtaleDuality.CohCorr.rgammac`, `.comp`,
  `.pushforward`, `.traceMap`, `.localTerm` and `fujiwaraVarshavskyTraceFormula`, including
  the local-term/stalk-trace comparison for sufficiently large Frobenius twists with
  proper first leg, quasi-finite second leg and finite-field descent.
  EndoscopicTransferAndUnitaryTraceComparison §7.10a supplies their Igusa specialization.
  AG2.P identifies the compatible normalized systems used here with those supplied objects;
  AG2.1a verifies the compact PEL/Hecke specialization and corrected-projector compatibility.
  AG2.5 constructs the two-chart product comparison and filtration.
- PadicPeriodRings §§4.1–4.3 supply `B_cris, B_st, B_dR` and their actual invariant functors
  and admissibility predicates. FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.0–R07.3.3
  supply finite-`K` filtered `(φ,N)`-modules, weak admissibility and the semistable realization
  interface. PhiGammaModulesAndIwasawaCohomology §§1.1–1.2 owns the common coefficient Robba
  category, `D_rig`, étale equivalence and overconvergence; LocalGaloisDeformationRings §0.4
  supplies its finite local coefficient specialization, including finite coefficient fields,
  with the identifications of coefficient rings, tensor products and duals.
  PadicHodgeTheory §§3.3–3.5, 4.3 and 5.1 supply filtered exactness, finite-extension
  comparison, the cyclotomic realization adapters, `N_dR(V)` and arithmetic p-adic
  monodromy. Its proof uses PadicDifferentialEquationsAndRigidCohomology
  §§RD.2.33–RD.2.34 and RD.2.36–RD.2.39 and recovers actual semistable periods from logarithmic solutions.
  NeronModelsAndSemistableAbelianVarieties §5.3 supplies `PadicWeilDeligneRealization`,
  `D_pst`, finite descent, extension independence and both `N_p` and `N_K=e_K N_p`,
  for finite-dimensional finite-coefficient representations that become semistable over
  a finite Galois extension, at every prime. AG2.P obtains this hypothesis for de Rham `V`
  from `arithmeticPadicMonodromy`.
  AG2.P retains these carriers and specializes their commuting coefficient actions,
  labelled embeddings, normalizations and projector comparisons to the PEL/Kuga applications.
- CrystallineCohomology Layer CR.6 supplies Hyodo–Kato complexes and the semistable
  log-crystalline comparison. WeightsInEtaleCohomology Layer R34.3 supplies the
  stratum/period comparison and the general geometric semistable-period comparison on
  its finite-`K` domain, including coefficient extension and projector images with
  `N_HK/e_K=N_p`. AG2.P applies that comparison to the specified PEL/Kuga models. The particular at-`ℓ` two-boundary
  automorphic realization and projected diagonal concentration are AG2.6 targets, not an
  unconditional purity assertion about every semistable variety.
- DeligneWeightsAndPurity Layers DWP.0, DWP.7 and DWP.8 supply Weil weights, proper smooth
  purity, mixed complexes and weight spectral sequences. ArithmeticGaloisRepresentations
  §2.6 supplies monodromy filtrations, pair purity and indecomposable WD blocks. AG2.5 builds
  the dominance relation and pure WD uniqueness comparisons from those objects.
- PadicDifferentialEquationsAndRigidCohomology Layers RD.4–RD.6 supply rigid/dagger comparison,
  supported spectral sequences, finiteness and weight bounds, with their Frobenius conventions.
- VectorBundlesAndIsocrystals VB−1 supplies the relative Fargues–Fontaine charts, analytic
  quotient and marked untilt divisors over `Perf_k`. VStackSheavesAndLisseCategories VS3.2,
  VS4.0 and VS4.4 supply `BunG`, its Newton strata and charts, the lisse category and its
  stratum comparisons. GeometricSatakeAndFusion GS0–GS4 supply the integral geometric Satake
  equivalence, fusion and the bounded local Hecke stacks. LanglandsParameterStacks LP1.7–LP1.8
  and LP4.1–LP4.3 supply the parameter stack, its perfect complexes and integral perfect
  generation. AG2.6 extends these to `Perf_{𝔽_q}` and builds the global Hecke, spectral and
  local Shimura targets on them.

## Conventions

Fix `n≥1`. A dominant weight `a` has integer coordinates `a_{τ,1}≥⋯≥a_{τ,n}`, possibly negative. The infinitesimal character of `π_τ` is that of `Ξ_a∨`, whereas `Ξ_a` itself supplies the coefficient representation. Repetitions in `a` are allowed: the shift by `n−i` produces distinct Hodge–Tate numbers. For CM conjugation `c`, the condition `a∈(ℤⁿ)_w` is `a_{τ,i}+a_{τc,n+1−i}=w` for every `τ` and `i`.

Artin reciprocity sends a uniformizer to geometric Frobenius. Thus `ε_ℓ(Frob_v)=q_v⁻¹` and `HT(ε_ℓ)=−1`. With `t_{v,0}=1` the monic good-place polynomial is

`P_v(X) = Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}`.

Its constant coefficient has sign `(−1)^n`. Its roots in unitary Satake coordinates are `q_v^{(n−1)/2}α_j`; the integral coefficients need no square root. The raw polynomial is defined before local Langlands. AG2.5 compares it with the geometric normalization `rec^T(π_v)=rec(π_v⊗|det|^{(1−n)/2})`; conversion to arithmetic Frobenius takes the normalized reciprocal polynomial. The independent classical comparison must also account for its dual/Frobenius convention.

The labelled Hodge multiset is `H_τ(a)={a_{τ,i}+n−i:1≤i≤n}`. In `Fin n` coordinates it is `{a(i)+n−1−i}`. For `a=(k−2,0)` it is `{k−1,0}`. Its sum determines a determinant weight, but does not recover the multiset. A supplier using `HT(ε)=+1` is translated by negating numerical labels; the period convention fixed here is `HT(ε)=−1`. Filtered modules and monodromy maps still require their explicit comparison; a numerical sign change does not implicitly dualize a representation.

For `a∈(ℤⁿ)_w` the purity weight is `W=w+n−1`. If the algebraic multiplier is `χ`, the Galois multiplier is `μ_λ=ε_ℓ^{1−n}r_{χ,λ}`, and `r_χ` has purity weight `2w`. At a real place,

`μ_λ(c_v) = (−1)^{n−1+w} χ_v(−1)`.

Total oddness therefore requires `χ_v(−1)=(−1)^{n+w}`. The printed BLGGT sign without `w` agrees only for even `w`. Twisting `χ` by the CM quadratic character exchanges the two parity choices.

Three coefficient fields serve different purposes. `M_π` is the rationality field of `π^∞` and the good Frobenius polynomials. A finite local `E_λ/ℚ_ℓ` realizes one member before a lattice is chosen. A possibly larger global `E` is a strong field whose completions realize all members. Rational traces alone need not split the Schur-index obstruction. The common-field argument uses two good distinct-root Frobenius polynomials of different residue characteristics, together with regular de Rham information. Consequently its prerequisite arrows can go from AG2.3 to a particular AG2.6 comparison, then back to a later AG2.6 export; the target-level dependency order is acyclic.

Good-place attachment, equality of semisimplified Weil parameters, dominance of monodromy partitions and full Frobenius-semisimple Weil–Deligne equality are separate conclusions. Full equality includes `N` in the polarized branch. For arbitrary nonselfdual CM forms at `v|ℓ` the conclusions are de Rham admissibility, the full labelled Hodge multiset, semisimplified compatibility and an upper bound for `N`. Spherical places are crystalline and Iwahori places semistable; general ramified monodromy equality is not asserted.

For residual representations, first choose a finite local model and a stable lattice, then reduce and semisimplify. Independence concerns that semisimple isomorphism class, not a canonical lattice. A stable lattice alone does not supply a self-dual integral pairing. ACC+ local genericity includes trivial inertia and excludes `α_i/α_j=q` for every ordered pair `i≠j`, counting multiplicities. Repeated eigenvalues can satisfy it. The stronger CS condition also excludes ratio `1`. A decomposed generic prime `p≠ℓ` must split completely in `F` and satisfy the local condition at every place above `p`. Absolute irreducibility is an additional hypothesis. Scalar twists preserve the local ratio condition only when they remain unramified there.

The imaginary quadratic field in the CS discrete-transfer setup is denoted `𝒦: F=F⁺𝒦`, the norm is `N_{F/𝒦}`, and the rational splitting condition is `q∈Spl_{𝒦/ℚ}`. This resolves the undefined `F₀` in the printed Corollary 5.5.5 and uses one symbol for the same field throughout.

## How to read the build

| Layer | Output |
| --- | --- |
| AG2.0 | Weights, algebraic characters, coefficient fields and good-place attachment |
| AG2.1a | Actual compact PEL/Kuga–Sato objects, coefficients, raw cohomology and traces |
| AG2.1b | Mantovan/Igusa comparison, concentration and actual Galois constituents |
| AG2.2 | Polarization twists, solvable base change and selected discrete sums |
| AG2.3 | Definite families, effective patching, arbitrary regularity and common realization fields |
| AG2.4 | Ordinary boundary rigid cohomology, Hasse approximation and nonselfdual existence |
| AG2.5 | Local normalization, semisimple comparison, monodromy bounds and full polarized compatibility |
| AG2.6 | Coefficient-prime comparison, compatible systems and specialization comparisons |
| AG2.7 | Finite local realization, residual Hecke ideals, genericity and arithmetic exports |

AG2.1 comprises its two mathematical producers AG2.1a and AG2.1b. The order below follows these layers; “Needs” records the finer proof order and names external stages explicitly. Internal links refer to each target’s mathematical layer. API and Check names lie in `TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII` unless another namespace is displayed. The tests are required discriminating examples and counterexamples, including geometrically supplied cases; the matrix statements in `Suggested.lean` are the specified algebraic components of these targets.

The sources are keyed in the bibliography. Locators use the stated edition's printed pages unless marked as author-copy or arXiv pages. AHTW v1 is an unrefereed preprint, cited by arXiv PDF page; its printed folio is one less. The targets are grouped by their mathematical outputs, rather than by the order of any paper.
## Layer AG2.P: finite-coefficient period and comparison interfaces

This layer specializes supplied period functors and geometric objects to the finite local
coefficient fields used in the automorphic construction. The rank-two and `GSp₄` comparisons
state their independent inputs explicitly.

### Arithmetic p-adic monodromy over finite coefficient fields

For every prime `ℓ`, finite extensions `K/ℚ_ℓ` and `E/ℚ_ℓ`, and continuous finite-dimensional
de Rham `E`-representation `V` of `G_K`, prove `arithmeticPadicMonodromy`: there is a finite
Galois extension `L/K` such that `V|G_L` is semistable. The comparison is the actual
`B_st ⊗_{L₀} D_st(V|G_L) ≅ B_st ⊗_{ℚ_ℓ} V`, where `L₀` is the maximal unramified
subfield of `L`, and retains the commuting `E`-action, Frobenius and `N_ℓ`.
There is no geometric-realization hypothesis or restriction on ramification, rank or `ℓ`.

This is the finite-coefficient specialization of PadicHodgeTheory §5.1 on
PhiGammaModulesAndIwasawaCohomology §1.2's `D_rig`, in the finite-coefficient specialization of
LocalGaloisDeformationRings §0.4, identified with `D†_rig` by PadicHodgeTheory
§4.3. Use its full-rank `N_dR(V)⊂D†_rig(V)[1/t]`, connection `t⁻¹∇_V`, invertible
Frobenius linearization, localization and twist-independence comparisons. Its monodromy
proof passes from the supplied differential logarithmic solutions through the field of
norms, kills the finite residual Gamma action and identifies the full space with
`D_st(V|G_L)`; quasi-unipotence alone is not the arithmetic conclusion.

The adapter retains the action of `E` through every comparison: apply the supplied
functorial theorem to the underlying `ℚ_ℓ`-representation and its commuting coefficient
endomorphisms. Over a common finite Galois semistabilizing extension, identify its
period module as free of rank `dim_E V` over `L₀⊗_{ℚ_ℓ}E`, with the supplied descent
action. Morphisms, direct sums, Tate twists and finite coefficient extension preserve
these identifications. Frobenius acts on the period factor and fixes `E`.
(Source: Berger, §1.1–§1.3, Theorem 1.3, pp.8–12;
Theorem 3.6, p.33; Proposition 5.9 and Theorem 5.10, pp.51–52;
Theorems 5.19–5.20 and the proof of 5.19, pp.56–58.)

**Checks.**

- The trivial `E`-line and every Tate line permit `L=K`; the latter has the prescribed
  Hodge label and crystalline Frobenius, with `N=0`.
- A Tate-curve representation has a full logarithmic solution space and nonzero
  semistable monodromy. The arithmetic bridge must retain this `N`.
- A ramified finite-order character at `ℓ=2` is de Rham of weight 0 and becomes trivial
  over a finite extension, but is not semistable over `K`. Both ramified `K/ℚ₂` and
  ramified `E/ℚ₂` are allowed; no PEL realization is an input.
- For `V₁⊕V₂`, a common finite extension works for both summands and every coefficient
  scalar commutes with the comparison. Forgetting `E` during scalar restriction must
  not replace its action by a Frobenius action on `E`.

*Needs:* PhiGammaModulesAndIwasawaCohomology §§1.1–1.2; LocalGaloisDeformationRings §0.4;
PadicHodgeTheory §§3.3–3.5, 4.3 and 5.1;
PadicPeriodRings §§4.1–4.3; ArithmeticGaloisRepresentations §§1.1–1.6 and 1.12;
NeronModelsAndSemistableAbelianVarieties §5.3.

### Finite-coefficient periods, descent and geometric comparison

For a finite extension `K/ℚ_ℓ`, a finite coefficient field `E/ℚ_ℓ` and a continuous finite-dimensional
`E`-representation `V` of `G_K`, use the actual invariant functors and dimension predicates of
PadicPeriodRings §§4.2–4.3, carrying the commuting `E`-action.
The adapter `finiteCoefficientPeriodAPI` expresses PadicHodgeTheory §§3.3–3.5's exact,
strict filtered tensor/dual comparisons on the labelled `K⊗E` factors in this roadmap's
`HT(ε)=−1` convention: the label `h` counts `gr^h D_dR`, so it is the negative of the
supplier's Hodge label, with no implicit dualization of `V`.
Its `periodBaseChange` is the supplied finite-extension comparison
`D_dR(V|G_L) ≅ L ⊗_K D_dR(V)` for de Rham `V`, with the structured unramified-base-field
comparison for semistable or crystalline `V`. Exterior powers and commuting idempotent
images inherit these comparisons, with the coefficient embeddings fixed.

Apply `arithmeticPadicMonodromy` to de Rham `V` to obtain a finite semistabilizing extension.
Here `potentiallySemistableWD` denotes NeronModelsAndSemistableAbelianVarieties §5.3's
`PadicWeilDeligneRealization`, transported to the geometric Frobenius convention and
the factor selected by the specified embeddings. Use its `D_pst`, finite descent,
extension independence, Frobenius semisimplification and coefficient/restriction maps.
Retain the supplied distinction `N_K=e_K N_ℓ`: ramified restriction leaves `N_ℓ`
unchanged and multiplies the uniformizer-normalized operator by the relative ramification
index. On de Rham `V`, the supplied criteria give semistability exactly for trivial WD
inertia and crystallinity exactly for trivial WD inertia with `N=0`.

Consume WeightsInEtaleCohomology R34.3’s geometric semistable-period comparison for a
proper strictly semistable model over a finite `K`, including its good-reduction crystalline
specialization, filtered `(φ,N)` structure, coefficient extension and correspondence API.
Here `geometricPeriodComparison` constructs its application to the stated PEL/Kuga models
and their specified commuting projectors, verifying the model hypotheses and retaining
`N_HK/e_K=N_p`, where `e_K` is the absolute ramification index. The de Rham filtration,
Galois action, twists and coefficient embeddings are carried through these restrictions;
no admissibility is inferred from equality of good Frobenius polynomials alone.
Use the semistable filtered-module carrier of FiniteFlatGroupsAndIntegralPadicHodgeTheory
§§R07.3.0–R07.3.3 and Hyodo–Kato complexes of CrystallineCohomology CR.6.

The required API is `finiteCoefficientPeriodAPI`, `periodBaseChange`, `potentiallySemistableWD`,
`geometricPeriodComparison` and `periodComparison_projector`, with identity and composition
for restriction and scalar extension. For ordinary representations retain an actual stable
flag with graded characters, not a list of valuations: tensor and coefficient change preserve
the flag and its characters. The ordinary `GSp₄` flag theorem is AG2.6's specific target.
(Sources: CH, §1.4–§1.5, Theorem 1.4 and (1.6), pp.5–7, and the period arguments
in Theorem 2.3 and Theorem 3.2.3, pp.8–12; AHTW, §1.2.3–§1.2.5;
Caraiani-p-published, comparison before Corollary 2.3, p.1609.)

**Checks.**

- The trivial `E`-line gives `D_dR = K ⊗ E`, with filtration jump 0 and zero monodromy;
  the zero representation gives zero periods and rank 0.
- The Tate line has Hodge label `−1`, crystalline Frobenius `ℓ⁻¹` and `N=0`. Negating that
  label without changing the chosen convention would break the character dictionary.
- A Tate-curve extension is semistable with `N≠0` and is not crystalline; its semisimplification
  has `N=0`. A criterion using only the semisimple Weil representation fails this example.
- An idempotent projecting `V₁ ⊕ V₂` onto `V₁` restricts every period comparison to that
  summand. An arbitrary noncommuting endomorphism supplies no comparison on its image.

*Needs:* AG2.P: arithmetic p-adic monodromy;
PadicHodgeTheory §§3.2–3.5 and 5.1; NeronModelsAndSemistableAbelianVarieties §5.3;
PadicPeriodRings §§4.1–4.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.0–R07.3.3;
CrystallineCohomology CR.6; ArithmeticGaloisRepresentations §§1.1–1.6 and 2.4;
EtaleCohomologyFoundations §§F.4.1–F.4.6; WeightsInEtaleCohomology R34.3, geometric semistable-period comparison.

### Normalized-system adapter for correspondence traces

Use EtaleDualityAndPerverseSheaves §§3.1–3.2 and 6.1–6.5's finite, integral and rational
coefficient categories and `TauCeti.EtaleDuality.CohCorr`. Its `.rgammac`, `.comp`,
`.pushforward`, `.traceMap`, `.localTerm` and `fujiwaraVarshavskyTraceFormula` are the
generic correspondence and trace constructions at all three coefficient levels.
On the proper domain used here, `X` smooth proper and `C` proper over `𝔽_q`,
`c=(c₁,c₂):C→X×X`, `c₂` quasi-finite and `ℓ≠char 𝔽_q`, its `U=X` specialization
gives a bound `q^r>ram(c₂)` independent of the coefficients.

Prove `correspondenceTraceCoefficientLimit` as an adapter for the normalized systems
of PEL/Kuga coefficients: for finite `E/ℚ_ℓ`, take `Λ_a=O_E/ℓ^a` and a constructible
system `(K_a,u_a)` with coherent derived reductions, uniform cohomological and Tor bounds,
Frobenius descent and compatible lifts `u_a:c₂!c₁* K_a→K_a`. Identify its derived adic
limit and rationalization with the supplied integral and rational correspondence objects.
On perfect compact-support cohomology these identifications carry `.rgammac`, the
Verdier trace class and local terms to their supplied reductions. Thus the supplied
trace identities form one compatible system, with the same Frobenius bound at every
modulus. The trace is a perfect-complex trace even when cohomology has torsion.
The additional assertion is this identification for the chosen normalized systems;
the generic finite/integral/rational theorem remains the supplied one.
(Source: Varshavsky, coefficient conventions §0.2, p.5;
§§1.1–1.2; Theorem 2.1.3, p.17; Corollary 2.2.4, p.19;
Theorem 2.3.2(a)–(c) and Remark 2.3.3(c), p.20, with `U=X`.)

**Checks.**

- On a point with the free constant system of rank `d`, the identity trace is
  `d mod ℓ^a`, compatibly in `a`, and rationalizes to the supplied trace `d∈E`.
- Multiplying a compatible coefficient lift by an integral scalar multiplies all
  finite, integral and rational traces by that scalar.
- The identity correspondence with `r=0` on a positive-dimensional proper `X` has
  fixed locus `X`; the finite stalk sum requires the Frobenius bound. For a finite
  étale `c₂`, `ram(c₂)=1`, so every positive `r` satisfies it.
- Ordinary reduction of cohomology can lose torsion terms; the integral-system
  hypothesis uses derived reduction and perfect-complex traces. Coefficients of
  residue characteristic `char 𝔽_q` are outside this trace theorem.

*Needs:* EtaleDualityAndPerverseSheaves §§3.1–3.2 and 6.1–6.5;
EtaleCohomologyFoundations §§F.1–F.6 and F.10.2b.

### Arbitrary-rank compatible data and operations

Use `AutomorphicSystemData` and its raw operations from
SmallRamificationAndAbelianVarietyBaseCases §5.0d, for any number field `F` and rank `n≥1`.
Retain its coefficient embeddings, finite local realization fields `L_λ/M_λ` and nonzero
constant terms of the good polynomials. No descent to `M_λ` is required. The compatibility
predicates below are conditions on this supplied carrier.

Define `Weak` by unramifiedness and the common polynomial identity at `v∉S, v∤ℓ`,
de Rhamness at every `v|ℓ` with the prescribed full labelled multisets for every coefficient
embedding, and crystallinity at `v∉S` dividing `ℓ`. Define `Strict` by Weak and a common
Frobenius-semisimple WD parameter at every finite `v`, retaining `N` and comparing `D_pst`
at coefficient-prime places. This parameter is defined over an algebraic closure of `M`
with a specified finite field of definition when a model is used. Strict implies Weak.
Purity and polarization are separate predicates, using the supplied WD purity and
polarization carriers with the common weight and multiplier character.

Prove preservation of Weak and Strict under the supplied raw operations, retaining their
member, polynomial and Hodge formulas. Finite restriction enlarges `S` by ramification;
purity of a direct sum requires a common weight. Algebraic-character tensor uses the
supplied tensor operation and the rank-one system from AG2.0's Hecke-character construction.
Use the supplier's convention adapters: arithmetic Frobenius replaces `P_v(X)` by
`X^n P_v(1/X)/P_v(0)`; on WD parameters invert the Frobenius matrix and its conjugation
relation while keeping inertia and `N`. Changing to `HT(ε)=+1` negates numerical labels
without dualizing the representation. AG2.6 populates the supplied carrier and adds its
very-weak and extremely-weak predicates. Rank-two almost-strict predicates require their
pairwise omitted-comparison conditions; a finite exceptional coefficient set alone
does not imply them.

**Checks.**

- The trivial rank-one family is strict, with `P_v=X−1`, Hodge label 0 and `N=0`.
  The cyclotomic family has `P_v=X−q_v⁻¹`, label `−1` and purity weight `−2`.
- Unrelated good polynomials and members inhabit the raw carrier but fail Weak.
- A Steinberg WD parameter has `N≠0`; deleting `N` preserves its Frobenius polynomial
  but fails the strict comparison with that parameter.
- Direct sums and tensor products of two rank-two systems have rank four and remain
  in the same carrier. Tensor with the Tate line subtracts 1 from each Hodge label.
- An omitted comparison at an odd unramified coefficient prime with reducible residual
  representation is not permitted by the pairwise almost-strict condition, even when
  that coefficient place belongs to a finite exceptional set.

*Needs:* SmallRamificationAndAbelianVarietyBaseCases §5.0d;
ArithmeticGaloisRepresentations Layers 1–2 and §7.4; NumberFieldArithmetic §§1.1–1.2,
for the relative splitting criteria and unramified sets used when finite restriction
enlarges `S`, and §2.4, for the Frobenius tower formula `Frob_w=Frob_v^{f(w|v)}` in the
restricted polynomials;
AG2.P: finite-coefficient periods;
AG2.P: arithmetic p-adic monodromy, for coefficient-prime WD parameters;
AG2.0: algebraic Galois characters,
for the character-system operation.

(Sources: ACC+, §7.1, pp.1084–1086;
BLGGT, §5.1, pp.62–65;
for the pairwise almost-strict condition, [Dieulefait–Pacetti](https://arxiv.org/pdf/2108.07577v2),
Definition 1.10 and the following paragraph, pp.6–7.)

### Independent classical and Hilbert members

For the rank-two comparison, take an independently constructed continuous semisimple
cohomological member `M_R19` as a hypothesis: a classical newform of weight `k≥2`, or a
regular cohomological Hilbert eigenform with coefficient `W(Π)` and polarization as in
CH, §4, Hypotheses 4.1 and Theorem 4.2, p.13. Define the arithmetic adapter
`r_R19,arith=M_R19^∨`. In the classical case `M_R19` has geometric good-prime polynomial
`X²−a_vX+ψ(v)q_v^(k−1)`; `r_R19,arith` has this polynomial at arithmetic Frobenius.
AlgebraicModularFormsAndSerreWeights §R15.5A supplies the independent classical
cohomological summand. This convention also identifies the cohomological default member
of a fixed-form family, without consuming that family’s construction.

For Hilbert forms let `ρ` denote the member normalized by geometric polynomial
`X²−t_vX+q_vs_v`, and `χ_{π,λ}` the Galois avatar of its central character. Fix `M_R19=ρ`
and `r_R19,arith=ρ^∨`. The source adapters are
`σ_Carayol=ρ⊗χ_{π,λ}⁻¹=ρ^∨⊗ε⁻¹`, hence
`ρ=σ_Carayol⊗χ_{π,λ}` and `ρ^∨=σ_Carayol⊗ε`.
The Skinner–Wiles arithmetic member is `σ_Carayol^∨=ρ⊗ε`, rather than `ρ^∨`.
Use GL2AutomorphicRepresentationsAndTransfer §§R16.6.3–R16.6.4 to convert the integral
weight coordinates and inverse-uniformizer Hecke operators; retain its parity hypotheses
and the actual coefficient embedding in every adapter.

Where a local comparison is transported, assume its proved local range, or prove
`hilbertCoefficientPrimeComparison` from CH, Theorem 4.2(b)–(d), p.13,
for the cohomological polarized member after this explicit dictionary. Its conclusions
are de Rhamness with the prescribed labels, spherical crystallinity and Iwahori
semistability. AG2.6 identifies `M_R19` with the AG2 member; AG2.7 identifies their
semisimple reductions. Weight one is outside this overlap.

**Checks.**

- For `Δ` at `2, M_R19` has geometric polynomial `X²+24X+2048`; `r_R19,arith` has
  geometric polynomial `X²+(24/2048)X+1/2048`. Dualizing `M_R19` would change the AG2 normalization.
- The classical `M_R19` has labels `{0,k−1}` and determinant `r_ψ ε^(1−k)`.
  Its arithmetic dual has the opposite Hodge labels.
- A Hilbert weight failing the source parity does not define an integral cohomological
  coefficient. For a norm twist, the central-character and `ε` factors above are retained;
  dualizing `σ_Carayol` alone would give `ρ⊗ε` rather than `ρ`.

*Needs:* ArithmeticGaloisRepresentations Layer 5;
AlgebraicModularFormsAndSerreWeights §R15.5A;
GL2AutomorphicRepresentationsAndTransfer §§R16.6.3–R16.6.4;
AG2.P: finite-coefficient periods.

(Sources: CH, §1.5, (1.6), p.7, and Theorem 4.2, p.13;
[Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf), §0.5, p.410,
and Theorem A, pp.410–411.)

### `GSp₄` construction and normalization

The targets `gsp4SpinRealization`, `gsp4Construction`, `pilloniGsp4Construction` and
`gsp4TransferDictionary` assume the exact symplectic classification contract of
EndoscopicTransferAndUnitaryTraceComparison (Classification prerequisite targets,
§§11.0g–11.0h) and its §11.1,
including its independent `Sp₄/SO₅` classification, local intertwining relations, weighted
twisted stabilization, transfer normalizations and similitude character. Section 13.2’s
solvable-descent application takes an already constructed Galois realization as input;
the construction here instead uses the following spin-parameter realization.

Prove `gsp4SpinRealization` for cuspidal `GSp₄` representations over `ℚ` with discrete-series
infinity component in the domains of CG, Proposition 6.8, and
Pilloni, Theorem 5.1.7.1. From the conditional classification, determine
the spin parameter and its isobaric constituents with their central characters and norm
twists. For general type, §11.1 supplies a cuspidal regular algebraic essentially self-dual
`GL₄` transfer after normalization. Apply the supplier with `Π` and its twisting character
unitary, then restore the algebraic norm twists. Construct its Galois member by AG2.3’s totally real polarized existence target,
including its identification with the normalized CM members after base change. For the remaining packet types, prove the explicit spin
parameter decomposition into `GL₁` and regular algebraic `GL₂` constituents with Tate twists
(Pilloni’s six-case discussion following Remark 5.1.7.1); realize them by AG2.0’s characters
and the same general-rank construction, and take the specified semisimple sums. Prove
`GSp₄-valuedness` with the required multiplier: in general type transport the symplectic
sign of the polarized `GL₄` member, computing its totally odd multiplier from the source
central-character parity; for reducible types construct the alternating pairing
on the displayed summands, including pairings between dual constituents. This target
owns the non-general-type decomposition and pairing argument. A self-duality isomorphism
alone does not specify an alternating pairing. Prove the good spin polynomial,
coefficient extension and uniqueness up to linear isomorphism for fixed embeddings.

Apply this realization as `gsp4Construction` to the regular cuspidal coherent eigenform
in CG Proposition 6.8, pp.38–39. Identify its cohomological automorphic representation
by CG Theorem 5.2(1) and Remark 5.10, retaining the source level, central character and
weight `(a,b)`, `a≥b≥3`. The coefficient field is finite over `ℚ_ℓ`; the multiplier is the
source finite character times `ε^(−(a+b−3))`. At each good prime its monic polynomial
is the degree-four spin Hecke polynomial. Prove Proposition 6.8(1)–(2),(5), using the
`GL₄` local comparison on the absolutely irreducible/general-type branch and the constituent
comparisons on the specified reducible domain. Retain absolute irreducibility in the
full all-prime clause; no general-type transfer is asserted for an endoscopic form. In the
general-type clause, full coefficient-prime WD comparison at places where the local component
has no Iwahori-fixed vector assumes `ExtremelyRegularIrreducibility 4`, inherited from AG2.6’s
totally-real polarized local descent; in the reducible types, a full coefficient-prime comparison
for a rank-two constituent assumes `ExtremelyRegularIrreducibility 2`. Absolute
irreducibility of the particular spin member discharges neither, since each quantifies over all
extremely regular conjugate-self-dual cuspidal forms of its rank. The good-place construction,
de Rhamness with its Hodge labels and the spherical and Iwahori comparisons do not use them.
AG2.6 supplies the crystalline and ordinary conclusions with their additional hypotheses.

For Pilloni’s cuspidal discrete-series `π` with parameter `(λ₁,λ₂;−λ₁−λ₂+3)`, apply the
same spin realization as `pilloniGsp4Construction`. Its spherical eigenvalues generate
a number field `E`, enlarged once to a strong realization field by AG2.6’s uniform strong
realization and the character-twist dictionary. Each finite `λ` has a continuous semisimple
`GSp₄(E_λ)` realization, unramified outside `Nℓ`, where `N` is the product of
nonspherical primes, with `det(1−Xρ(Frob_q))=Θ_π(Q_q(X))` for `q∤Nℓ`.
The multiplier retains the finite character and has exponent `ε^(λ₁+λ₂)` in the
`geometric/HT` convention, consistently with the four Hodge labels of AG2.6.
Prove `gsp4TransferDictionary` for the CG and Pilloni members: match Harish–Chandra
parameters and spherical spin polynomials under `λ₁=1−a`, `λ₂=2−b`, using their
coherent/automorphic identification and the conditional spin decomposition just specified.
Retain the level, central-character and coefficient embeddings. This dictionary is owned
here; §13.2 is not its construction theorem.

**Checks.**

- At `(a,b)=(3,3)`, the labels are `{0,1,2,3}`, the multiplier exponent is `−3` and
  the determinant exponent `−6`, agreeing with their sum 6 and `HT(ε)=−1`.
- Substitution `λ₁=1−a`, `λ₂=2−b` gives `{0,b−2,a−1,a+b−3}` entry by entry.
- A Yoshida-type sum of two polarized rank-two constituents with common multiplier is
  symplectic. It does not satisfy the absolute-irreducibility hypothesis of the all-prime clause.
- A non-general-type spin parameter is realized by its constituent sum, not by a
  cuspidal `GL₄` transfer. Without the symplectic classification contract this construction supplies
  no classification-based existence assertion.
- A general-type member with supercuspidal `π_p` at a coefficient prime `p` is absolutely
  irreducible, yet its full WD comparison at `p` still needs `ExtremelyRegularIrreducibility 4`;
  when the `GL₄` transfer has Iwahori-fixed vectors at `p` the BLGGT Iwahori comparison gives it
  without that hypothesis.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Classification prerequisite targets (symplectic classification contract, §§11.0g–11.0h) and §11.1;
AG2.0: algebraic Galois characters;
AG2.2: polarization twists;
AG2.3: totally real polarized existence;
AG2.3: arbitrary regular existence;
AG2.3: polarization sign;
AG2.5: polarized local comparison;
AG2.6: uniform strong realization;
AG2.6: totally-real polarized local descent;
PELModuli Layers M0–M4; ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7;
ArithmeticGaloisRepresentations §§7.4–7.5; IntegralHeckeAndGaloisDeterminants §3a.1;
AG2.P: finite-coefficient periods.

(Sources: CG, Theorem 5.2(1), p.25; Remark 5.10, pp.33–34; Proposition 6.8 with proof,
pp.38–39; Pilloni, §5.1.7, Theorem and Remark 5.1.7.1 and the
following packet-type discussion, pp.22–23.)

### Examples

The Tate line distinguishes the Hodge sign, the Tate curve distinguishes `N` from its
semisimplification, and the regular weight `(3,3)` fixes the `GSp₄` determinant normalization.

### Dependencies

The *Needs* clauses above give the exact suppliers. No automorphic existence theorem of
AG2.3 or AG2.4 is used to construct the period functors or their geometric comparisons.

## Layer AG2.0: Algebraic weights, characters and good-place attachment

Start with the labelled weight, automorphic multiplier and coefficient embedding. The integral polynomial and its twist identities require only spherical Hecke and character theory. Keep the early rationality field separate from the later field of realization.

### Dominant weights `(ℤⁿ)^{Hom(F,Ω),+}`, the subsets `(ℤⁿ)_w` for CM fields, base change of weights and the representations `Ξ_a`

For a number field `F`, rank `n≥1` and algebraically closed characteristic-zero coefficient field `Ω`, use the embedding-wise dominant `GL_n` coordinates of ArithmeticLocallySymmetricSpaces §ALS.F.7: a family `a` has `a_{τ,1}≥⋯≥a_{τ,n}` at each `τ:F→Ω`. The notation `(ℤⁿ)^{Hom(F,Ω),+}` denotes this specialization of the imported algebraic-weight carrier. For totally real or CM `F` with conjugation `c`, membership in `(ℤⁿ)_w` means `a_{τ,i}+a_{τ∘c,n+1−i}=w` for every `τ` and `i`. When `Ω=ℂ`, conjugating the target embedding gives the same condition. Restriction of embeddings defines base change: `(a_{F′})_{τ,i}=a_{τ|_F,i}`. Extreme regularity asks that, at some embedding, equal-sized subsets of the shifted entries `{a_{τ,i}+n−i}` are determined by their sums. For complex coefficients `Ξ_a` is ArithmeticLocallySymmetricSpaces §ALS.F.7’s highest-weight representation, identified with the tensor product of the `GL_n` representations of highest weights `a_τ`. The coordinate notation and `Ξ_a` do not introduce a second highest-weight theory.

Throughout this target, dominance is the ordering `a_{τ,1} ≥ ⋯ ≥ a_{τ,n}`, with repetitions allowed; regularity of the attached Hodge–Tate numbers comes from the shift by `n − i` (the Hodge multiset below), not from strictness of `a`. The arithmetic use of `(ℤⁿ)_w` pairs `τ` with `τ∘c` and `i` with `n + 1 − i` and assumes `F` totally real or CM. The coordinate predicate is defined for any index involution, including rank zero. `Ξ_a` is a representation of the complex group `GL_n^{Hom(F,ℂ)} = (Res_{F/ℚ} GL_n)_ℂ`. Its highest-weight theory is supplied by ArithmeticLocallySymmetricSpaces §ALS.F.7 (algebraic highest weights).

The embedding-indexed weight family uses one `TauCeti.DominantWeight n` per embedding
from `TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight`. Supply coordinate
construction from antitone functions and extensionality, the conjugation condition,
embedding pullback and extreme regularity. These specialize the highest-weight datum of
ArithmeticLocallySymmetricSpaces §ALS.F.7. Pullback preserves the common weight when
restriction commutes with conjugation, preserves coordinates along the identity and
composes along restriction maps. The highest-weight representation is the imported
ArithmeticLocallySymmetricSpaces §ALS.F.7 representation `V_a`, identified with its
embedding-wise tensor product.

**Checks.**

- For `F = ℚ, n = 2`, integer `k≥2` and `a = (k − 2, 0)`: `a` is dominant and lies in `(ℤ²)_{k−2}`

- For `n = 1` every `a ∈ ℤ^{Hom(F,ℂ)}` is dominant, and `a ∈ (ℤ¹)_w` iff `a_τ + a_{cτ} = w` for all `τ`.

- For `F` imaginary quadratic, `n = 2, a_τ = (1, 0)` and `a_{cτ} = (0, 0): a_{τ,1} + a_{cτ,2} = 1` but `a_{τ,2} + a_{cτ,1} = 0`, so `a` lies in no `(ℤ²)_w`

- `(0, 1)` is not dominant: a definition with `a_{τ,1} ≤ ⋯ ≤ a_{τ,n}` would accept it.

*Needs:* Mathlib `NumberField.IsCMField.complexEmbedding_complexConj`; ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7.

(Sources: BLGGT, §2.1, p. 32; BLGGT, §2.1, p. 32.)

### Regular algebraic automorphic representations of `GL_n(𝔸_F)` and their weight

For an automorphic `GL_n(𝔸_F)` representation `π` over a number field `F`, regular algebraicity means that its archimedean infinitesimal character comes from an irreducible algebraic representation of `Res_{F/ℚ} GL_n`. Write its weight as the unique dominant family `a` for which `infChar(π_∞)=infChar(Ξ_a^∨)`. If an algebraic Hecke character `ψ` has identity-component infinity type `∏_τ τ(x)^{−b_τ}`, tensoring `π` with `ψ∘det` changes `a_{τ,i}` to `a_{τ,i}+b_τ`. Thus an integer norm twist `π⊗‖det‖^t` changes every coordinate to `a_{τ,i}−t`.

Throughout this target, the infinitesimal character is compared with that of `Ξ_a^∨`, not `Ξ_a`; this is the convention of both BLGGT and ACC+. Regular algebraic is Clozel's C-algebraic for `GL_n`. It differs from L-algebraic by the twist `‖det‖^{(n−1)/2}` when `n` is even. The C/L distinction is owned by ArithmeticLocallySymmetricSpaces §ALS.F.7 and is imported here. No cuspidality, self-duality or unitarity is part of the definition.

The required API is:

- `IsRegularAlgebraic`: `π.IsRegularAlgebraic :⇔ ∃ a, π.HasWeight a`.
- `HasWeight`: `π.HasWeight a :⇔ infChar π_∞ = infChar (Ξ_a)^∨`.
- `HasWeight.unique`: `π.HasWeight a → π.HasWeight b → a = b`.
- `HasWeight.twist`: `π.HasWeight a → (π ⊗ ψ∘det).HasWeight (a + b)` for `ψ` algebraic of exponents `(b_τ)`.
- `HasWeight.twist_norm`: `(π ⊗ ‖det‖^t).HasWeight (a − t) ↔ π.HasWeight a`.

**Checks.**

- `n = 1: ψ` with `ψ_∞(x) = ∏ τ(x)^{−a_τ}` on `(F_∞^×)⁰` has weight `(a_τ)`

- For a classical newform `f` of integer weight `k≥2, π_f ⊗ ‖det‖^{1−k/2}` has weight `(k − 2, 0)`

- `π_f` with `f` of odd weight `k` is not regular algebraic: its infinitesimal character `(±(k − 1)/2)` is not a shifted integral weight

- The trivial representation of `GL_1(𝔸_F)` has weight 0.

*Needs:* AG2.0: dominant weights; ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7.

(Sources: BLGGT, §2.1, p. 32; ACC+, §1, Notation, p. 908.)

### Conjugate self-dual, essentially conjugate self-dual and polarized automorphic representations, with the multiplier character

Let `F` be totally real or CM with maximal totally real subfield `F⁺` and complex conjugation `c`, and `π` an automorphic representation of `GL_n(𝔸_F)`. `(i) π` is conjugate self-dual if `π^c ≅ π^∨`. (ii) `π` is essentially conjugate self-dual with multiplier `χ` if `χ: 𝔸_{F⁺}^×/(F⁺)^× → ℂ^×` is continuous and `π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘ det)`. (iii) `(π, χ)` is a polarized automorphic representation if moreover `χ_v(−1)` is independent of `v | ∞`. (iv) `π` is polarizable if some `(π, χ)` is polarized. `(v)` A regular algebraic polarized `(π, χ)` of weight `a ∈ (ℤⁿ)_w` with `F` imaginary is totally odd if `χ_v(−1) = (−1)^{n+w}` for all `v | ∞`. Here `π^c = π ∘ c` on `GL_n(𝔸_F)`, and `π^c = π` when `F` is totally real.

Throughout this target, the multiplier `χ` is part of the data. Replacing `χ` by `χδ_{F/F⁺}` preserves the multiplier identity in the CM case, since `δ_{F/F⁺} ∘ N_{F/F⁺} = 1`. For a fixed pullback `χ∘N_{F/F⁺}`, its extensions to `F⁺` differ exactly by 1 or `δ_{F/F⁺}`.
For fixed `π` the ambiguity can be larger: multiplying `χ` by `ν` preserves polarization when
`π⊗(ν∘N_{F/F⁺}∘det)≅π` and the constant-real-sign condition is retained. Thus the
chosen `χ` remains explicit data. BLGGT impose instead `χ_v(−1) = (−1)^n` for `F` imaginary (printed with `µ` in place of `χ`). That is the correct normalisation only when `w` is even; with odd `w` it makes the Galois multiplier even (the multiplier computation below). Condition `(v)` is the corrected form, and like BLGGT's it can always be achieved by replacing `χ` by `χδ_{F/F⁺}`. For regular algebraic `(π, χ)` of weight `a ∈ (ℤⁿ)_w, χ` is algebraic with `|χ| = ‖·‖^{−w}`. Conjugate self-duality is the case `χ = 1`, possible only when `w = 0`. For `F` totally real, polarized means essentially self-dual with `χ_v(−1)` independent of `v`. Patrikis shows the independence is automatic for regular algebraic cuspidal `π`; that result is not needed here.

The required API is:

- `IsConjSelfDual`: `π.IsConjSelfDual :⇔ π^c ≅ π^∨`.
- `IsEssConjSelfDual`: `π.IsEssConjSelfDual χ :⇔ π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det)`.
- `PolarizedAutRep`: A pair `(π, χ)` with IsEssConjSelfDual and `v ↦ χ_v(−1)` constant on the real places.
- `PolarizedAutRep.twistDelta`: `(π, χ) ↦ (π, χ δ_{F/F⁺})`, again polarized.
- `PolarizedAutRep.IsTotallyOdd`: For regular algebraic `(π, χ)` of weight in `(ℤⁿ)_w: χ_v(−1) = (−1)^{n+w}` for `v | ∞`.
- `PolarizedAutRep.exists_totallyOdd`: Exactly one of `(π, χ), (π, χδ_{F/F⁺})` is totally odd when `F` is imaginary.
- `PolarizedAutRep.weight_mem_W`: A regular algebraic polarized pair has weight in `(ℤⁿ)_w` with `|χ| = ‖·‖^{−w}`.

**Checks.**

- `n = 1, ψ` of weight `(1, 0)` over an imaginary quadratic field: `(ψ, ψ|_{𝔸_ℚ}δ)` is totally odd; `(ψ, ψ|_{𝔸_ℚ})` is not

- For `F=ℚ(√−3)`, base change of the newform of `y²=x³−x` has multipliers 1 and
  `η_{ℚ(i)/ℚ}`; their quotient is neither 1 nor `δ_{F/ℚ}`, since its restriction to `G_F`
  is the nontrivial CM self-twist.

- For `F=ℚ(i)`, let `ν` be the quadratic character of `ℚ(√5)/ℚ` and `η=ν∘N_{F/ℚ}`.
  The isobaric sum `π=1⊞η` is self-dual and invariant under `η`, so `χ=1` and `χ=ν` are
  multipliers of `π`. Their ratio is neither 1 nor `δ_{F/ℚ}`.

- `π.IsConjSelfDual ↔ π.IsEssConjSelfDual 1`

- For `F` totally real, `π^c = π` and polarized means essentially self-dual with `χ_v(−1)` independent of `v`

- A pair satisfying BLGGT's printed `χ_v(−1) = (−1)^n` with `w` odd (the CM elliptic curve character) is not totally odd: its Galois multiplier takes `c_v` to `+1`.

*Needs:* AG2.0: regular algebraicity; AG2.0: dominant weights; GlobalNumberFields / layer 9 hecke and ray class characters; GlobalNumberFields / layer 10 archimedean characters infinity types and cyclotomic arithmetic.

(Sources: BLGGT, §2.1, p. 32; BLGGT, §2.1, p. 32; CH, Hypotheses 4.1(ii), p. 13.)

### The `l`-adic character `r_{l,ι}(χ)` of an algebraic Hecke character, its Hodge–Tate numbers and its weight

Let `F` be a number field, `l` a prime and `ι: ℚ̄_l ≅ ℂ`, with `Art_F` normalised to send uniformisers to geometric Frobenius elements. Let `χ: 𝔸_F^×/F^× → ℂ^×` be algebraic: `χ|_{(F_∞^×)⁰}(x) = ∏_{τ ∈ Hom(F,ℂ)} τ(x)^{−a_τ}` with `a_τ ∈ ℤ`. There is a unique continuous character `r_{l,ι}(χ): G_F → ℚ̄_l^×` with `ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v` for all `v ∤ l`; explicitly `ι((r_{l,ι}(χ) ∘ Art_F)(x) ∏_τ (ι^{−1}τ)(x_l)^{a_τ}) = χ(x) ∏_τ (τ x_∞)^{a_τ}`. It is de Rham above `l` with `HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}`. The weight `wt(χ)` is the integer with `|χ| = ‖·‖^{−wt(χ)/2}`. Then `a_τ + a_{τ′} = wt(χ)` whenever `τ|_{F₀} = τ′|_{F₀} ∘ c` (`F₀` the maximal subfield of `F` which is imaginary CM or totally real, with `c=id` in the totally real case), `wt(χ)` is even when `F₀` is totally real, `wt(‖·‖_F) = −2, r_{l,ι}(‖·‖) = ε_l`, and `r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2}` at every real place `v` when `F` is totally real.

Throughout this target, the normalisation of `Art_F` (uniformisers `↦` geometric Frobenius) fixes `r_{l,ι}(‖·‖) = ε_l`. With the arithmetic normalisation it would be `ε_l^{−1}`. `HT_τ(ε_l) = {−1}` in this convention, consistent with `HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}` and `a = −1` for `‖·‖` over `ℚ`. The value at complex conjugation is computed at real places only: at a complex place there is no `c_v` in `G_F`.

The required API is:

- `AlgHeckeChar.galoisChar`: `r_{l,ι}(χ): G_F → ℚ̄_l^×` for an algebraic Hecke character `χ`.
- `AlgHeckeChar.galoisChar_local`: `ι ∘ r_{l,ι}(χ)|_{W_{F_v}} ∘ Art_{F_v} = χ_v` for `v ∤ l`.
- `AlgHeckeChar.hodgeTate_galoisChar`: `HT_τ(r_{l,ι}(χ)) = {a_{ι∘τ}}`.
- `AlgHeckeChar.wt`: `wt(χ) ∈ ℤ` with `|χ| = ‖·‖^{−wt(χ)/2}`.
- `AlgHeckeChar.galoisChar_mul`: `r_{l,ι}(χ₁χ₂) = r_{l,ι}(χ₁) r_{l,ι}(χ₂)`.
- `AlgHeckeChar.galoisChar_norm`: `r_{l,ι}(‖·‖_F) = ε_l`.
- `AlgHeckeChar.galoisChar_complexConj`: For `F` totally real: `r_{l,ι}(χ)(c_v) = χ_v(−1)(−1)^{wt(χ)/2}`.
- `AlgHeckeChar.galoisChar_restrict`: `r_{l,ι}(χ|_{𝔸_{F⁺}^×}) = r_{l,ι}(χ) ∘ V, V: G_{F⁺}^{ab} → G_F^{ab}` the transfer.

**Checks.**

- `F = ℚ` gives `F₀=ℚ`, `c=id` and `r_{l,ι}(‖·‖) = ε_l`, with `HT {−1}` and wt `−2`. No imaginary CM subfield of `ℚ` is required.

- `r_{l,ι}(1) = 1`, with `a = 0` and wt 0

- For `ω` of finite order unramified at `p ∤ l: r_{l,ι}(ω)(Frob_p^{geom}) = ω_p(p)`, and `r_{l,ι}(ω)(Frob_p^{arith}) = ω_p(p)^{−1}`

- For `F` imaginary and `ψ` algebraic on `F, r_{l,ι}(ψ|_{𝔸_{F⁺}})(c_v) = +1` because the transfer sends `c_v` to `c_v² = 1`, whatever `ψ_v(−1)` is: the Galois sign is not `χ_v(−1)` unless wt/2 is even.

*Needs:* ClassFieldTheory / layer 11 the global class formation and global artin reciprocity; GlobalNumberFields / layer 9 hecke and ray class characters; GlobalNumberFields / layer 10 archimedean characters infinity types and cyclotomic arithmetic; ArithmeticGaloisRepresentations Layer 2; AG2.P: finite-coefficient periods and comparison.

(Sources: BLGGT, §A.2, pp. 86–87; BLGGT, §A.2, pp. 86–87; BLGGT, Notation, pp. 9–10.)

### The parity of the Galois multiplier of a polarized pair: `µ(c_v) = (−1)^{n−1+w} χ_v(−1)`

Let `F` be imaginary CM and `(π, χ)` a regular algebraic polarized automorphic representation of `GL_n(𝔸_F)` of weight `a ∈ (ℤⁿ)_w`. Put `µ = ε_l^{1−n} r_{l,ι}(χ): G_{F⁺} → ℚ̄_l^×`. Then `µ(c_v) = (−1)^{n−1+w} χ_v(−1)` for every `v | ∞`. Hence `µ` is totally odd if and only if `χ_v(−1) = (−1)^{n+w}`, i.e. `(π, χ)` is totally odd in the sense of polarized-automorphic-representation `(v)`. Under BLGGT's printed normalisation `χ_v(−1) = (−1)^n, µ(c_v) = (−1)^{w+1}`: it is `−1` exactly when `w` is even.

Throughout this target, the integer `w` is the one with `a ∈ (ℤⁿ)_w`. Theorem 2.1.1 of BLGGT uses a different integer, the purity weight `w + n − 1` of `r_{l,ι}(π)`. Only the multiplier's value at complex conjugation is computed. No Galois representation `r_{l,ι}(π)` is needed for the statement.

*Needs:* AG2.0: polarized pairs; AG2.0: algebraic Galois characters; ArithmeticGaloisRepresentations §7.4.

(Sources: BLGGT, Theorem 2.1.1(1), p. 33; BLGGT, Proof of Theorem 2.1.1, p. 34; Patrikis, §4, proof of Proposition 4.1, p. 8.)

### The Hodge–Tate multiset attached to a weight: `HT_τ = {a_{ιτ,1} + n − 1, …, a_{ιτ,n}}`

For `a ∈ (ℤⁿ)^{Hom(F,ℂ),+}, ι: ℚ̄_l ≅ ℂ` and `τ: F → ℚ̄_l`, put `HT_τ(a) = {a_{ι∘τ,i} + n − i : 1 ≤ i ≤ n}`, a multiset of `n` integers, in BLGGT's convention `HT_τ(ε_l) = {−1}`. The elements are distinct, so a Galois representation with these Hodge–Tate numbers is regular. If `F` is CM and `a ∈ (ℤⁿ)_w`, then `HT_{τ∘c}(a) = {w + n − 1 − h : h ∈ HT_τ(a)}`. Twisting `a` by `−t (π ↦ π ⊗ ‖det‖^t)` subtracts `t` from every element, matching `⊗ ε_l^t`. In the opposite convention `(HT(ε_l) = +1)` every element is negated.

Throughout this target, this is the target that AG2.6 proves for `r_{l,ι}(π)` (BLGGT Theorem 2.1.1(3), ACC+ Theorem 2.3.3(b)); here it is only the dictionary from `a` to a multiset. The integer `w + n − 1` is BLGGT's `w` in Theorem 2.1.1(3). The two integers must not be confused.

The shifted-coordinate function must be strictly antitone for antitone `a`, so its
multiset has cardinality `n` and no repetitions. Prove its conjugation and twist formulas
above and its sum `Σ_i a_i+n(n−1)/2`, retaining the full multiset as well as the determinant sum.

**Checks.**

- For `n = 2, a = (k − 2, 0)`, the multiset is `{k − 1, 0}`; for `k = 12`, it is `{11, 0}`.

- For `n≥1, a = 0`, the multiset is `{n − 1, …, 1, 0}`: parallel weight 0 gives the Hodge–Tate numbers of `Symⁿ⁻¹` of the dual Tate module of an elliptic curve.

- The elements are pairwise distinct, so the multiset is regular in BLGGT's sense `(|HT_τ| = n)`

- The unshifted multiset `{a_{τ,i}}` fails regularity for `a = 0` and `n ≥ 2`, so the shift `n − i` is part of the definition.

*Needs:* AG2.0: dominant weights.

(Sources: BLGGT, Theorem 2.1.1(3), p. 33; BLGGT, Notation, p. 8; ACC+, Corollary 7.2.4, p. 1100.)

### Automorphic specialization of the integral Hecke polynomial

Let `v` be a finite place of `F` with `q_v = #k(v), π_v` an unramified irreducible representation of `GL_n(F_v)`, and `t_{v,i}` the eigenvalue on `π_v^{GL_n(O_{F_v})}` of `T_{v,i} = [GL_n(O_{F_v}) diag(ϖ_v, …, ϖ_v, 1, …, 1) GL_n(O_{F_v})]` (`ϖ_v` repeated `i` times). Use the integral `GL_n` Hecke polynomial of IntegralHeckeAndGaloisDeterminants §3a.1, specialized as `P_v(π_v; X) = Σ_{i=0}^n (−1)^i q_v^{i(i−1)/2} t_{v,i} X^{n−i}`. If `α₁, …, α_n` are the Satake parameters of `π_v`, with `t_{v,i} = q_v^{i(n−i)/2} e_i(α)`, then `P_v(π_v; X) = ∏_j (X − q_v^{(n−1)/2} α_j)`. Conventions: a Galois representation `r` corresponds to `π` at `v` in the geometric convention (BLGGT, ACC+, HLTT: `Frob_v` geometric, `Art` uniformisers `↦` geometric Frobenius) if `ι det(X − r(Frob_v)) = P_v(π_v; X)`. It corresponds in the arithmetic convention (IntegralHeckeAndGaloisDeterminants §3a.1, and the independent rank-two construction) if the arithmetic Frobenius has characteristic polynomial `P_v(π_v; X)`. `r` corresponds in one convention if and only if `r^∨` corresponds in the other. Twists: `P_v(π_v ⊗ ‖det‖^t; X) = q_v^{−tn} P_v(π_v; q_v^t X)`, matching `r ↦ r ⊗ ε_l^t`. The contragredient has roots `q_v^{n−1}/β_j`, where `β_j` are the roots for `π_v`, matching `r ↦ r^∨ ⊗ ε_l^{1−n}`.

Throughout this target, no local Langlands correspondence is used. For unramified `π_v`, 'r corresponds at v' is defined by the polynomial identity, which is what AG2.0 requires. Agreement with `rec(π_v ⊗ |det|^{(1−n)/2})` for unramified `π_v` is an AG2.5 comparison. ACC+ say `P_v` corresponds to Frobenius on `rec^T(π_v)`, their arithmetic normalisation of local Langlands (Clozel–Thorne §2.1), with `Frob_v` geometric in their notation. That is the geometric convention here.

*Needs:* AG2.0: regular algebraicity; IntegralHeckeAndGaloisDeterminants §3a.1; AG2.0: algebraic Galois characters.

(Sources: ACC+, §2.2.5, (2.2.6), p. 922; ACC+, Theorem 2.3.2, p. 935; ACC+, Notation, p. 906.)

### A Galois representation attached to `π` at the good places, and its functoriality under twist, dual, conjugation and base change

For regular algebraic cuspidal `π`, a coefficient isomorphism `ι:ℚ̄_ℓ≅ℂ`, and a continuous semisimple rank-`n` representation `r` of `G_F` unramified outside a finite set, `IsAttached(ι,r,π)` means that outside a finite set of finite places `v∤ℓ, π_v` is spherical, `r` is unramified, and `ι det(X−r(Frob_v^geom))=P_v(π_v;X)`. The exceptional set contains the ramification of `π, F` and `r` and the coefficient prime. Two such `r` are isomorphic by Frobenius density. This is a good-place condition; it asserts neither local Langlands compatibility at ramified places nor de Rham admissibility nor global existence.

Throughout this target, this is the property HLTT prove for every regular algebraic cuspidal `π` over a CM field (ACC+ Theorem 2.3.2). It is the interface that AG2.1–AG2.4 produce and AG2.5 strengthens. Nothing at the places in `S`, or above `l`, is asserted. Uniqueness needs semisimplicity. It uses Čebotarev and Brauer–Nesbitt (ArithmeticGaloisRepresentations ArithmeticGaloisRepresentations Layers 1 and 5). The base-change clause needs the Satake parameters of `BC(π)_w` to be the `q`-power restrictions of those of `π_v` (the unramified base-change identity), required from EndoscopicTransferAndUnitaryTraceComparison EndoscopicTransferAndUnitaryTraceComparison Layer 13, which exports the Arthur–Clozel base-change steps to this roadmap.

The required API is:

- `IsAttached`: `r.IsAttached ι π :⇔ ∃ S` finite, `∀ v ∉ S, r` unramified at `v ∧ ι det(X − r(Frob_v)) = P_v(π_v)`.
- `IsAttached.unique`: `r, r′` semisimple and both attached to `π ⇒ r ≅ r′`.
  Apply dense-set polynomial recognition over an algebraically closed Hausdorff
  topological field of characteristic zero to continuous semisimple representations
  with equal characteristic polynomials on a dense set. For Galois attachment, use the dense union of conjugacy classes of good geometric Frobenius lifts.
- `IsAttached.twist`: `r.IsAttached π → (r ⊗ r_{l,ι}(ψ)).IsAttached (π ⊗ ψ∘det)`.
- `IsAttached.dual`: `r.IsAttached π → (r^∨ ⊗ ε_l^{1−n}).IsAttached π^∨`.
- `IsAttached.conj`: `r.IsAttached π → r^c.IsAttached π^c`.

**Checks.**

- `n = 1: r_{l,ι}(ψ).IsAttached ι ψ`

- `ρ_f^∨` is attached to `π_f ⊗ ‖det‖^{1−k/2}`; for `Δ` the polynomial at 2 is `X² +` 24X `+ 2^{11}`

- `ρ_f` is not attached to `π_f ⊗ ‖det‖^{1−k/2}` (for `Δ` its geometric polynomial at 2 is `X² + 24·2^{−11}X + 2^{−11}`)

- Equal characteristic polynomials alone do not give uniqueness without semisimplicity:
  the trivial rank-two representation of `ℤ` and the unipotent representation
  `m↦[[1,m],[0,1]]` over a characteristic-zero field have polynomial `(X−1)²`
  at every element and are not isomorphic. Give `ℤ` the discrete topology.

- The two rules compose consistently: `(r^∨ε^{1−n})^∨ε^{1−n} = r`, matching `π^∨∨ = π`.

*Needs:* AG2.0: integral Frobenius polynomial; AG2.0: regular algebraicity; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 5.

(Sources: ACC+, Theorem 2.3.2, p. 935; ACC+, §2.3, after Definition 2.3.6, p. 938.)

### Rationality of the good Hecke polynomials

Use `fieldOfRationality(π)` as an abbreviation for AutomorphicFormsOnReductiveGroups §5.7's `rationalityField(π^∞)`, specialized to `GL_n` over a CM or totally real field. Thus `M_π = ℂ^{Aut(ℂ/π^∞)}` uses the common finite-part isomorphism stabilizer. Import that section's scalar twist `galoisTwist`, its identity/composition laws, invariance under isomorphism and conjugation formula `M_{σπ}=σ(M_π)`. Import Clozel finiteness under the regular algebraic cuspidal hypotheses in cohomological normalization. For such `π`, prove that every spherical integral Hecke polynomial `P_v(π_v;X)` has coefficients in `M_π`. At good places the traces of any attached `r` therefore lie in `ι^(−1)(M_π)`. This controls traces, not a model of `r` over `(M_π)_λ`: the Schur-index obstruction is supplied by ArithmeticGaloisRepresentations Layer 5.

Throughout this target, the definition uses `π^∞` only. `σπ^∞` is the supplied `galoisTwist(π^∞,σ)`; scalar conjugation acts on the smooth finite part and the labelled algebraic coefficient. The regular algebraic cuspidal conjugate is supplied by AutomorphicFormsOnReductiveGroups §5.7. `M_π` controls traces, not realizations. The field over which `r` can be written may be strictly larger, by a Schur-index obstruction. AG2.3/finite-number-field-of-realization proves a common realization field using the regular labelled Hodge–Tate input supplied by AG2.6; the early rationality theorem does not depend on that late result. Clozel's theorem is used with its exact hypotheses: `π` regular algebraic (cohomological) and cuspidal. It is not claimed for non-cuspidal or non-algebraic `π`.

*Needs:* AutomorphicFormsOnReductiveGroups §5.7; AG2.0: integral Frobenius polynomial; ArithmeticGaloisRepresentations Layer 5.

(Sources: ACC+, §7.1, p. 1093.)

For this `fieldOfRationality`, the imported Clozel theorem makes `M_π` a number field under
the regular algebraic cuspidal hypotheses. In addition to the supplied isomorphism and
conjugation laws, prove containment of each good Hecke coefficient and equality with the
compositum of the local spherical rationality fields. The last assertion uses the supplied
cuspidal conjugates and strong multiplicity one on the same cuspidal domain. (Source: ACC+, §7.1, p.1093;
Liu, Lemma 3.1.2, pp.138–139.)

**Checks.**

- The trivial rank-one representation has rationality field `ℚ`, since all its good
  Hecke eigenvalues equal 1.
- A finite-order rank-one character of exact order `m` has rationality field `ℚ(ζ_m)`,
  generated by its attained character values; taking only traces at the identity would give `ℚ`.
- Conjugating the finite part by `σ` conjugates its field inside `ℂ`. For a rational trace
  system with a quaternionic Schur obstruction this controls the trace field without
  producing a model over `ℚ`; the strong-field target must still split that obstruction.

### Twists, duals and conjugation preserve good-place attachment

If `IsAttached(ι,r,π)`, then `IsAttached(ι,r⊗r(ψ),π⊗ψ∘det)` for algebraic `ψ`; in particular `norm^t` corresponds to `ε_ℓ^t`. Also `r^∨⊗ε_ℓ^(1−n)` is attached to `π^∨`, and for CM `F` the conjugate `r^c` is attached to `π^c`. All conclusions are up to isomorphism and enlarge the finite excluded set by the character ramification.

Throughout this target, `r` semisimple and continuous; `ψ` algebraic; fixed geometric Artin/Frobenius normalization.

*Needs:* AG2.0: good-place attachment; AG2.0: integral Frobenius polynomial; AG2.0: algebraic Galois characters; ArithmeticGaloisRepresentations Layer 1.

(Sources: ACC+, §2.3 after Definition 2.3.6, p. 938.)

### The similitude character in a compact coefficient system

For Shin’s compact similitude datum, specify an irreducible algebraic coefficient `ξ` by
its integral central exponent `a₀(ξ)` and dominant entries `a(ξ)_{σ,1}≥⋯≥a(ξ)_{σ,n}` for the
chosen CM type. Define its algebraic weight `w(ξ)=−2a₀(ξ)−Σ_{σ,i}a(ξ)_{σ,i}` and the
formal shifted labels `j_κ(k)=k−1−a(ιξ)_{ικ,k}−a₀(ιξ)`. Determine `ξ`’s algebraic central
character and the tensor/Young-idempotent and Tate-twist recipe `(m_ξ,t_ξ,ε_ξ)` realizing `ξ`
in the algebraic tensor representation used by TY §2. Retain a chosen compatible `GL₁` Hecke character `ψ`; its infinity type
satisfies Shin Lemma 7.2(iii), while its finite part is additional data. These algebraic
identities and character data are independent of cohomology. The projector uses this recipe;
the purity and labelled-Hodge interpretation is the geometric comparison in AG2.6.

Throughout this target, use the chosen CM type and positive similitude component,
Shin §3.6 and §6.2 indexing, `n≥1` and integral central exponents.

**Checks.**

- For `ξ=ν^t, a₀=t` and all highest-weight entries vanish, giving `w=−2t` and `j_κ(k)=k−1−t`.
- For `ξ=1` the central exponent and weight are zero, and `j_κ(k)=k−1`.
- Tensoring by `ν^t` lowers `w` by `2t` and each formal label by `t`; omitting `a₀` loses both shifts.

*Needs:* AG2.0: dominant weights;
ArithmeticLocallySymmetricSpaces §ALS.F.7 and the algebraic similitude character of the chosen
PEL datum; RepresentationTheory/SchurWeyl Layers 2 and 8.

(Sources: Shin, §3.6 preceding (3.18), and §6.2 preceding Corollary 6.7,
pp.20, 48, and Lemma 7.2, p.52; TY, §2, p.12.)

### A crystalline character with prescribed `p`-adic unit type

Let `F` be CM, `p` a prime, `E/ℚ_p` sufficiently large, `S` a finite ramification set containing the `p`-adic places, and `ṽ` a `p`-adic place split over `F⁺`. For the compatible algebraic local unit characters used in ACC+ §4.5.1, there is a continuous `ψ:G_F→O_E^×` crystalline at every place above `p`, unramified at `ṽ` and at `S` minus `S_p`, and with `ψ∘Art_{F_{ṽc}}` on units equal to `∏_{τ:F_{ṽ}→E}(τc)^(λ_{τ₀,1}+λ_{τ₀c,1})`, where `τ₀` maximizes that sum. Its labelled `HT` weights are 0 at `ṽ` and `−λ_{τ₀,1}−λ_{τ₀c,1}` at `ṽc`. Additional finite ramification is allowed outside `S`.

Throughout this target, the local prescriptions satisfy the global unit and totally real restriction compatibility of HSBT Lemma 2.2. This is the source’s split-place construction; arbitrary inconsistent local characters are excluded.

*Needs:* AG2.0: algebraic Galois characters; AG2.0: dominant weights; AG2.P: finite-coefficient periods and comparison.

(Sources: ACC+, §4.5.1, proof of Theorem 4.5.1, pp. 985–986; HSBT, Lemma 2.2, pp. 795–796.)

### The coefficient field of a relevant automorphic representation

For relevant `π` in Liu et al. Definition 1.1.3, use the same `fieldOfRationality(π)` as `ℚ(π)`, the fixed field of automorphisms preserving the finite part `π^∞`. Its local coefficient field is generated by coefficients of `∏_i(T−α_i q_v^{(N−1)/2})` at spherical places. Lemma 3.1.2 identifies `ℚ(π)` with the compositum of these local fields, using Clozel rationality and strong multiplicity one. This is an automorphic coefficient-field result; it does not prove Definition 3.2.5 strong Galois realization over each completion.

Throughout this target, relevant regular algebraic CSD cuspidal `π` and normalized spherical parameters; all coefficient embeddings tracked.

*Needs:* AG2.0: Rationality of the good Hecke polynomials; AG2.0: rationality; ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7.

(Sources: Liu, §3.1, Definition 3.1.1 and Lemma 3.1.2, pp. 138–139 (PDF pp. 32–33).)

### Examples

For `Δ, a=(10,0)` has labels `{11,0}`; its good polynomial at 2 is `X²+24X+2¹¹`. The reciprocal polynomial distinguishes the geometric and arithmetic conventions. Its root-sum and root-product Check uses complex roots with sum `−24` and product `2¹¹`; no pair of rational roots has those values.

### Dependencies

ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7; AutomorphicFormsOnReductiveGroups §5.7; GlobalNumberFields Layers 9–10; ClassFieldTheory Layer 11; IntegralHeckeAndGaloisDeterminants §3a.1; AG2.P.

## Layer AG2.1a: Compact-unitary geometry and raw cohomology

Construct the actual compact PEL tower and its Kuga–Sato powers with algebraic coefficients. First produce finite continuous geometric Galois actions and raw traces. Neither a virtual automorphic identity nor a later local correspondence can replace these geometric inputs.

The coefficient construction requires an explicit `ξ↦(m_ξ,t_ξ,ε_ξ)` recipe with parity and central twist, not merely an idempotent identity; TY §2 points to Harris–Taylor pp.97–98 for that recipe. The supplied Igusa counting formula uses polarized `O_F`-linear abelian realizations with
the prescribed `p`-adic isocrystal, positivity and trivial obstruction `α₀`; these are inputs
of its supplier, beyond unpolarized Honda–Tate classification. The raw fixed-point theorem must be available before stabilization; Lefschetz–Verdier trace classes alone do not identify the fixed-point sum.

### The compact unitary PEL instance

Under Shin §5.1, `F=EF⁺` is CM, `E` imaginary quadratic, `n≥3` odd, `[F⁺:ℚ]≥2`, and all rational primes ramified in `F` split in `F/F⁺`. Choose a CM embedding `τ` and the similitude datum of Lemma 5.1: signature `(1,n−1)` at `τ` and `(0,n)` at the other selected embeddings, quasi-split at all finite places and anisotropic modulo centre over `ℚ`. At sufficiently small level `U` the PEL moduli scheme `X_U/F` is smooth proper of dimension `n−1` with universal abelian scheme `A_U` of relative dimension `[F⁺:ℚ]n`. For `p` split in `E` choose `w|p: G(ℚ_p)` has the `GL_n(F_w)` factor used for Drinfeld level, including when `F_w/ℚ_p` is ramified. The other split factors have the étale level structures of §5.2. Form `A_U^m` over `X_U` for `m≥0`.

Throughout this target, the positivity, determinant, polarization and level conditions are those of the chosen PEL datum, not those of the quasi-split signature (n,n) datum. Choose integral orders and sufficiently small levels as in §5.2; Drinfeld models require the distinguished split factor.

The required API is:

- `CompactPEL.dimension`: `dim X_U=n−1`; the universal abelian scheme has relative dimension `[F⁺:ℚ]n`.
- `CompactPEL.levelPullback`: Level inclusions give finite étale maps on generic fibres, with compatible universal abelian schemes.
- `CompactPEL.kugaPower`: `A_U^0=X_U` and `A_U^(m+1)=A_U^m×_{X_U}A_U`.
- `CompactPEL.drinfeldFactor`: At `w` the integral level structure is the Drinfeld structure on the one-dimensional `O_{F_w}-Barsotti–Tate` factor.

**Checks.**

- `m=0` gives `X_U`, not an empty scheme

- `n=3` gives a proper surface of dimension 2 and an abelian scheme of relative dimension `3[F⁺:ℚ]`; the signature (3,3) datum has complex dimension `9[F⁺:ℚ]`

- An unramified-only local datum cannot satisfy the API for ramified `F_w`.

*Needs:* PELModuli M0; PELModuli M4; EndoscopicTransferAndUnitaryTraceComparison §§7.6–7.10.

(Sources: Shin, Lemma 5.1 and §5.2, pp. 30–34.)

### Raw cohomology for the split-algebra Shin datum

For the compact PEL instance above, construct the seven operations of the
§9.1 raw compact-unitary interface: finite-level objects, algebraic local systems, Hecke
correspondences, nearby cycles, commuting actions, graded multiplicity spaces and projector
commutation. EndoscopicTransferAndUnitaryTraceComparison §9.1 specifies their API shape
for a division-algebra datum. Here the PEL algebra is `F`, with `End_F(V)≃M_n(F)` split;
properness follows from the definite real place, which excludes rational isotropic subspaces and hence degeneration
data with a nonzero toric part. Prove properness by the PEL valuative criterion. Construct
the finite Drinfeld-level closures, including ramified `F_w`, and compare their generic-fibre
cohomology with nearby cycles by proper base change. Retain finite coefficient descent,
continuity, finite-dimensionality at finite level and admissibility of the level colimit.
Transport the supplied compact discrete decomposition to this tower. Define multiplicity
Hom spaces degree by degree with their commuting Weil action before taking Euler classes.
(Sources: Shin, Lemma 5.1, §5.2 and Proposition 5.3, pp.30–35.)

**Checks.**

- The `n=3` datum with a second, definite real place is proper even though its algebra is
  split and every finite group is quasi-split; a division invariant is not its properness proof.
- A finite neat level covering has trace after pullback equal to its degree. At `m=0` the
  Kuga power is the base model and retains the same Hecke/Weil commutation.
- At a ramified distinguished `F_w` the Drinfeld closure still gives the proper nearby-cycle
  comparison; it does not imply smooth special fibre. Removing all definite places does
  not supply this compactness argument and requires a separate boundary theory.

*Needs:* AG2.1a: compact PEL instance;
PELModuli M2–M4; EtaleCohomologyFoundations §§F.4.1–F.4.6;
LefschetzPencilsAndVanishingCycles LPV.0–LPV.1;
AutomorphicSpectralTheory §4.7; ArithmeticLocallySymmetricSpaces §ALS.F.7.

### The corrected Kuga–Sato coefficient projector

For an irreducible algebraic `ξ` of the compact similitude group use the algebraic recipe
`(m_ξ,t_ξ,ε_ξ)` of AG2.0. For `N≥2` let
`T=ε(m_ξ,N)=∏_{x=1}^{m_ξ} ∏_{0≤y≤2[F⁺:ℚ]n, y≠1} ([N]_x−N^y)/(N−N^y)`.
The range is twice the relative dimension `[F⁺:ℚ]n` of Shin’s `V=Fⁿ` abelian scheme.
TY’s range `2[F⁺:ℚ]n²` belongs to the division-algebra datum `V=B`.
For a filtration of length at most `D≥1` define the correction polynomial
`P_D(X)=1−(1−X^D)^D` and set `a_ξ=ε_ξ P_D(T)`.
The congruences `P_D(X)≡0 mod X^D` and `P_D(X)≡1 mod (X−1)^D` imply
`P_D(T)²=P_D(T)` whenever `(T−T²)^D=0`. This uses Mathlib’s
`isIdempotentElem_one_sub_one_sub_pow_pow` in `Mathlib.RingTheory.Idempotents`,
which applies also to the noncommutative endomorphism ring. The correction agrees on
such `T` with Caraiani’s `((X−1)^D+1)^D` for odd `D`: their difference is divisible by
`X^D(X−1)^D`.

Prove the filtration statement: if `T` preserves
an increasing filtration `0=F₀⊆⋯⊆F_D=V` and is idempotent on its graded pieces, then
`(T−T²)F_{i+1}⊆F_i`, hence `(T−T²)^D=0`. For a smooth proper base of dimension `d`,
Leray has base degrees 0 through `2d`, so `D=2d+1` suffices on every total degree.
The one-signature base has `d=n−1` and `D=2n−1`; each two-signature base in AG2.5 and
AG2.6 has `d=2n−2` and `D=4n−3`. The polynomial corrects both generalized eigenspaces,
including the possible nilpotent error near eigenvalue one.

The rational Young correspondence `ε_ξ` is idempotent and commutes with `T`. Thus `a_ξ` is
idempotent on global cohomology. On the relative sheaves it has the original coefficient
image in degree `m_ξ` and zero image elsewhere. Applying the commuting projector to Leray
leaves a single row and gives the coefficient-cohomology identity below. All assertions
carry the selected central exponent, CM type and Tate twist, sufficiently small `U` and
rational coefficients.

Prove the correction polynomial's congruences. Its idempotence under `(T−T²)^D=0`
is Mathlib's `isIdempotentElem_one_sub_one_sub_pow_pow T D`
(`Mathlib.RingTheory.Idempotents`), used directly. Multiplying by the commuting Young
idempotent preserves idempotence. Every linear comparison intertwining the selectors
intertwines their corrections; an intertwining equivalence identifies their images.
The geometric coefficient-prime comparison must carry these corrected images to one another.
Prove `a_ξ²=a_ξ` in each global degree with `D=2d+1`, the relative-degree assertion,
the central-character and Tate normalization under `ν^t`, and commutation with level and
Hecke maps. The same polynomial in every realization commutes with the geometric period
comparisons, retaining the coefficient and Tate normalizations on the corrected images.

**Checks.**

- For `N=2, y=0` the denominator is 1; for `y=2` it is `−2`.
- On `H⁰` of one abelian factor the selector is zero;
  on `H¹` it is one, and `P_D` preserves these values.
- For `ξ=1, m_ξ=t_ξ=0` and `ε_ξ=1` the empty selector is
  the identity and `P_D(1)=1`. The condition `m_ξ=0` alone does not force a trivial Tate twist.
- For `T=[[1,1],[0,1]]` over `ℚ` and `D=5`, `(T⁵)²−T⁵=[[0,5],[0,0]]≠0`,
  whereas `P₅(T)=I`. The graded identity does not make `T⁵` idempotent.
- For the nilpotent matrix `J=T−I, P₅(J)=0`. For `D=1` an already idempotent `T` is unchanged;
  `D=0` does not satisfy the filtration hypothesis.

*Needs:* AG2.1a: compact unitary PEL instance;
AG2.0: algebraic similitude dictionary;
ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7;
RepresentationTheory/SchurWeyl Layers 2 and 8; EtaleCohomologyFoundations §§F.4.1–F.4.6.

(Sources: TY, §2, p.12, relative coefficient realization;
Caraiani-away, §2.1, arXiv pp.7–8, polynomial correction and Leray bound.)

### Cohomology of the coefficient projector

For every `j, a_ξ H^j(A_U^{m_ξ}×_F F̄,ℚ̄_ℓ(t_ξ))` is canonically `H^{j−m_ξ}(X_U×_F F̄,L_ξ)` if `j≥m_ξ`, and zero otherwise. The identity is equivariant for `Gal(F̄/F)`, level transitions and prime-to-level Hecke correspondences.

Throughout this target, use the corrected `a_ξ` and the selected algebraic realization; `ℓ` invertible on the generic fibre.

*Needs:* AG2.1a: corrected Kuga–Sato coefficient projector; EtaleCohomologyFoundations §§F.4.1–F.4.6 and F.5–F.6.

(Sources: TY, §2, cohomology identity after `a_ξ`, p. 12.)

### Finite continuous geometric Galois actions

Every `H^k_U(ξ)` is finite-dimensional over a finite extension of `ℚ_ℓ` and has continuous Galois action; after scalar extension it is unramified away from finitely many places. For almost all `y∤ℓ` its Frobenius eigenvalues are algebraic and pure of weight `k+w(ξ)`. These statements apply to actual finite-level summands, independently of local Langlands.

Throughout this target, smooth proper `X_U` and the abelian-power projector; coefficient field of definition fixed.

*Needs:* AG2.1a: Shin raw-cohomology adapter; EtaleCohomologyFoundations §§F.4.1–F.4.6 and F.5–F.6; DeligneWeightsAndPurity DWP.7.

(Sources: Shin, Proposition 5.3(ii)–(iii), pp. 34–35.)

### Contracting Hecke-correspondence trace formula

For the compact PEL model at a good reduction prime `p≠ℓ`, construct the actual
prime-to-`p` Hecke correspondences, their lifts to the Kuga powers and the cohomological
lifts on the chosen algebraic coefficients. Descend the schemes, correspondence maps,
coefficients and lifts to a common `𝔽_q`. Verify smooth properness of the special fibres,
properness of `c₁`, quasi-finiteness of `c₂` and the coefficient finiteness/Tor bounds.
For each correspondence obtain its bound `ram(c₂)` and take `q^r` above it.
Apply EtaleDualityAndPerverseSheaves §6.5's `fujiwaraVarshavskyTraceFormula` on its
`TauCeti.EtaleDuality.CohCorr.rgammac` operator to identify the compact-support trace
with the sum of coefficient stalk traces, at finite, integral and rational coefficients.

For the corrected `a_ξ`, choose the selector integer `N≥2` prime to `p` and express its
polynomial and Young correspondence as a finite rational combination of the geometric
correspondences on the proper Kuga power. Verify the same hypotheses and a common
Frobenius bound for these constituents composed with the Hecke correspondence. Prove
the actual lifts commute with `T`, `ε_ξ` and hence `a_ξ`, and transport the trace identity
through the coefficient-cohomology identification, retaining its degree shift, signs
and Tate twist. Apply AG2.P's normalized-system comparison to the compatible integral
lifts and their derived reductions. Clear a common denominator
of the rational correspondence, prove the integral identity for its numerator and
divide only after rationalization; integrality of `a_ξ` at `ℓ` is not assumed.
(Sources: Shin, §5.2 and Proposition 5.3, pp.32–35;
TY, §2, p.12; Varshavsky,
Theorem 2.3.2(a)–(c) and Remark 2.3.3(c), p.20, with `U=X`.)

**Checks.**

- For the identity correspondence, every positive Frobenius power satisfies the bound;
  the formula is the ordinary Frobenius point-count trace with its coefficient stalks.
- For a finite étale Hecke correspondence `c₂` has ramification bound one; sufficiently
  high Frobenius gives isolated fixed points and stalk local terms.
- For `c=identity` and `r=0` on a positive-dimensional `X` the fixed locus is `X`, so the finite
  stalk-sum assertion cannot be used. For `ℓ=char 𝔽_q` these coefficient hypotheses fail.
- For `N=2, y=2` the selector denominator is `−2`. At `ℓ=2` it cannot be inverted in
  finite coefficients; the integral numerator identity is divided only in `E`.

*Needs:* AG2.1a: Shin raw cohomology;
AG2.1a: corrected coefficient projector;
AG2.1a: coefficient-cohomology identity;
PELModuli M4; EtaleDualityAndPerverseSheaves §§6.1–6.5;
AG2.P: normalized-system correspondence traces;
EtaleCohomologyFoundations §§F.4–F.6.

### The raw geometric fixed-point trace identity

For a good reduction prime `p≠ℓ` and sufficiently large Frobenius power, the alternating trace of a Hecke correspondence times geometric Frobenius on `H^k_U(ξ)` equals the fixed-point sum with the coefficient trace. No local Langlands parameter or automorphic Galois representation occurs in this identity.

Throughout this target, use the descended Hecke and coefficient lifts, common Frobenius
bound and corrected-projector comparison of the preceding PEL specialization. The rational
trace theorem and its finite/integral versions are supplied by
EtaleDualityAndPerverseSheaves §6.5; AG2.P identifies the normalized coefficient systems.

*Needs:* AG2.1a: Shin raw-cohomology adapter; PELModuli M4; AG2.1a: contracting Hecke trace formula; EtaleDualityAndPerverseSheaves §§6.1–6.5; AG2.P: normalized-system correspondence traces.

(Source: Varshavsky, Theorem 2.3.2(a)–(c), pp.19–20, with U=X.)

### Raw nearby-cycle and stratum traces

For the compact Drinfeld model at `w|p≠ℓ`, identify the generic-fibre alternating trace with the trace on the special fibre with `RΨL_ξ`. Decompose by Newton/Drinfeld strata and the compatible Igusa level covers before applying any local Langlands correspondence. Retain the nearby-cycle monodromy operator and its filtration rather than replacing it by zero.

Throughout this target, proper integral model; the actual ramified `O_{F_w}` charts and coefficient projector; `p` split in `E`.

*Needs:* AG2.1a: compact unitary PEL instance; AG2.1a: Shin raw-cohomology adapter; AG2.1a: raw fixed-point traces; EndoscopicTransferAndUnitaryTraceComparison §§7.6–7.10; LefschetzPencilsAndVanishingCycles LPV.0; LefschetzPencilsAndVanishingCycles LPV.1.

(Sources: Shin, Proposition 5.2 and §5.2, pp. 32–34.)

### Examples

The odd-rank compact datum with `n=3` has dimension 2. For the trivial coefficient the empty relative-degree product is the identity, whereas a nonzero central exponent retains its Tate shift.

### Dependencies

PELModuli M0–M4; EndoscopicTransferAndUnitaryTraceComparison §§7.6–7.10; EtaleCohomologyFoundations §§F.4.1–F.4.6; the coefficient dictionary of AG2.0.

## Layer AG2.1b: From trace identities to actual Galois constituents

Combine the raw geometric traces with Igusa stabilization and Mantovan’s formula. Weight separation turns alternating multiplicity spaces into an actual middle-degree space. Dividing the scalar multiplicity requires multiplicity divisibility for each constituent, rather than divisibility of total dimension.

The concentration argument requires the selected-constituent weight bounds used in Shin Corollary 6.5, including its Harris–Taylor p.207 input. Geometric purity and a virtual rank equality alone are insufficient. Removing `C_G` requires divisibility of every irreducible Galois multiplicity, with the adjusted assumptions of Shin Remark 6.9 and the argument of Harris–Taylor Proposition VII.1.8. The labelled geometric de Rham dimensions and independence of `τ` are part of this input.

### The compact global Mantovan formula

For every Newton class `b` of the compact datum, define `Mant_{b,μ}(ρ)` by the colimit over Rapoport–Zink levels of the alternating `Ext^i_{J_b(ℚ_p)}(H^j_c(M_{b,μ}),ρ)`, with the source’s dimension twist `(−D)` and sign `(−1)^{i+j}`. Shin Proposition 5.2 gives `[H(Sh,L_ξ)]=Σ_b Mant_{b,μ}([H_c(Ig_b,L_ξ)])` as a class with commuting prime-to-`p` Hecke and Weil actions. The split local factors tensor as in (5.6).

Throughout this target, mantovan’s cohomology, smooth derived Ext, towers and actions for the chosen compact Drinfeld model; the dimension twist is included.

*Needs:* AG2.1a: Raw nearby-cycle and stratum traces; EndoscopicTransferAndUnitaryTraceComparison §§7.6–7.10; SmoothRepresentationsOfLocalGroups SR.0 / derived-extension.

(Sources: Shin, §2.2, Mantovan functor (2.1), p. 9; Proposition 5.2, p. 34.)

### Shin’s stable and endoscopic Igusa computation

Under Shin §6.1, `n≥3` is odd, `Π=ψ⊗Π₁` is `θ`-stable, generic `Ξ`-cohomological, and `Ram_Q(Π)` lies in `Spl_{F/F⁺,ℚ}`; the finite set `S` also contains the ramification of `F` and the auxiliary odd character `ϖ`. In Case ST, `Π₁` is cuspidal. In Case END, `m₁>m₂>0, m₁+m₂=n, Π` is transferred from `ψ_H⊗Π₁⊗Π₂`, each `Π_i` is conjugate-self-dual cohomological cuspidal and the central-character condition §6.1(ii) holds. Set `C_G=|ker¹(ℚ,G)|τ(G)`. Theorem 6.1 computes `BC(H_c(Ig_b,L_ξ){Π^S})` as `C_G e₀[Π^{∞,p}]Red_n^b(π_p)` in ST and `(C_G/2)[Π^{∞,p}](e₁Red_n^b(π_p)+e₂Red_{m₁,m₂}^b(π_H,p))` in END, with `e_i∈{±1}` independent of `b` and the §3.6 transfer factors.

Consume EndoscopicTransferAndUnitaryTraceComparison §8.16’s raw Igusa counting
formula for acceptable functions on `G(A_f^p)×J_b(ℚ_p)`, with its effective triples and
centralizer masses, before stabilization. Shin-Igusa Definition 4.2 and Theorem 4.4 apply
to `H_c(Ig_b,L_ξ)` here. Retain all displayed §6.1 datum, ramification, central-character
and infinity hypotheses; the END blocks and parity character are fixed.

*Needs:* AG2.1b: compact global Mantovan formula; AG2.0: similitude character in a compact coefficient system; EndoscopicTransferAndUnitaryTraceComparison Layers 7–8, specifically §8.16’s raw Igusa counting formula;
EndoscopicTransferAndUnitaryTraceComparison Layer 14.

(Sources: Shin, §6.1 and Theorem 6.1, pp.41–46;
Shin-Igusa, Definition 4.2, pp.13–14 and Theorem 4.4, p.15.)

### The virtual Weil constituent comparison

Under the `ST/END` hypotheses, Theorem 6.4 identifies the base-changed alternating `Π`-part with `C_G` times the selected local Weil constituent, with the `GL₁` character. In ST it is `e₀ χ₀⊗L_n(Π₁,w)`. In END it is `e₁ χ₀⊗L_{m₁}(Π_{M,1,w})|·|^(−m₂/2)` if `e₁=e₂`, and `e₁ χ₀⊗L_{m₂}(Π_{M,2,w})|·|^(−m₁/2)` if `e₁=−e₂`. This equality is in the Weil Grothendieck group and has not yet removed alternating degrees or divided an actual representation by `C_G`.

Throughout this target, `w` over a rational prime split in `E, w∤ℓ`; exact local transfer and the normalized Mantovan formula.

*Needs:* AG2.1b: stable/endoscopic Igusa traces; AG2.1b: compact global Mantovan formula; EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.27 and §10.30; ArithmeticGaloisRepresentations Layer 2.

(Sources: Shin, Propositions 2.2–2.3, pp. 10–11; Theorem 6.4, pp. 46–47.)

### Weight separation into the middle degree

For `π∞` in the `ST/END Π`-part, `R^k_{ξ,ℓ}(π∞)=0` for `k≠n−1`. Thus the alternating multiplicity is `(−1)^(n−1)[R^{n−1}]`, an actual representation up to the explicit sign. In particular `e₀=(−1)^(n−1)` in ST and `e₁=(−1)^(n−1)` in END.

Throughout this target, the virtual Weil formula, geometric purity of every actual degree `k`, and the selected constituent purity/temperedness argument of Shin Corollary 6.5; no equality of virtual dimensions is used as cancellation.

*Needs:* AG2.1b: virtual Weil constituent comparison; AG2.1a: geometric Galois actions; AG2.1a: Shin raw-cohomology adapter; EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.27 and §10.30; DeligneWeightsAndPurity DWP.0.

(Sources: Shin, Corollary 6.5(i)–(ii) and proof, pp. 47–49.)

### The archimedean packet multiplicity

Under `ST/END`, the sum of discrete multiplicities at the ith relevant cohomological archimedean packet member is `τ(G)` for all `i` in ST; in END it is `τ(G)` for `i≤m₁` if `e₁=e₂`, or `i>m₁` if `e₁=−e₂`, and zero for the other indices. These are the multiplicities of Shin Corollary 6.5(iv), compatible with the `ξ` highest-weight partition `W^1_κ⊔W^2_κ`.

Throughout this target, the exact cohomological packet and signs of §3.6/§6.1, with middle-degree concentration.

*Needs:* AG2.1b: middle-degree concentration; AG2.1b: stable/endoscopic Igusa traces; AG2.1a: Shin raw-cohomology adapter; EndoscopicTransferAndUnitaryTraceComparison Layer 14; ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7.

(Sources: Shin, Corollary 6.5(iv), p. 47.)

### The actual Galois constituent of cohomology

For the selected `ST/END Π`-part, semisimplify the actual middle-degree Galois multiplicity space to `R̃`. The source proves that `R̃` is `C_G` copies of a continuous semisimple representation `R̃₀`, and then removes the `GL₁` character `ψ` by class field theory. The resulting `R′_ℓ(Π)` has rank `n` in ST, `m₁` in END with `e₁=e₂`, or `m₂` with `e₁=−e₂`; it is independent, up to isomorphism, of `τ` and `ψ`. At the source’s split primes its Weil Grothendieck class is exactly (6.31), with the selected half-dimensional norm twist.

Throughout this target, middle-degree concentration, packet multiplicity and the actual multiplicity divisibility argument in Shin Corollary 6.8/Remark 6.9; de Rham comparison for the geometric summand is used to obtain the distinct labelled dimensions.

The required API is:

- `ActualConstituent.rank`: `dim R′` equals the selected `n, m₁` or `m₂`.
- `ActualConstituent.copies`: Before removing `ψ, R̃≅R̃₀^{⊕C_G}` as Galois representations.
- `ActualConstituent.independent`: Changing `τ` or the auxiliary `ψ` produces an isomorphic corrected constituent.
- `ActualConstituent.goodWeil`: At source split primes recover the selected class (6.31), including the norm twist.

**Checks.**

- Case ST `n=3` gives rank 3 after removing `C_G` copies

- For `n=5,m₁=3,m₂=2` the two sign cases give rank 3 and 2 respectively

- A semisimple rank-4 representation with irreducible multiplicities 1 and 3 cannot be divided into two copies merely because 2 divides 4.

*Needs:* AG2.1b: middle-degree concentration; AG2.1b: archimedean multiplicity; AG2.1a: Shin raw-cohomology adapter; AG2.0: algebraic Galois characters; ArithmeticGaloisRepresentations Layer 5; AG2.P: finite-coefficient periods and comparison.

(Sources: Shin, Corollary 6.8 and Remark 6.9, p. 49.)

### Examples

For `n=5` with END ranks 3 and 2, the selected sign gives rank 3 or `2`. A rank-four semisimple multiplicity space with constituent multiplicities 1 and 3 cannot be divided into two copies merely by dividing its dimension.

### Dependencies

AG2.1a; EndoscopicTransferAndUnitaryTraceComparison Layers 10 and 14; ArithmeticGaloisRepresentations Layer 5; DeligneWeightsAndPurity DWP.0 and DWP.7; AG2.P.

## Layer AG2.2: Polarization twists, base change and discrete sums

The geometric theorem initially has Shin’s weight and field restrictions. Algebraic twisting passes from essential polarization to unitary type. Assemble discrete parameters only from supplied constituent representations, retaining every block multiplicity and parity/norm correction. The unrestricted constituents needed here are constructed in AG2.3.

The algebraic-character construction requires the global `ψψ^c` prescription and its infinity/finite parity compatibility (the CHT08 Lemma 4.1.4 input to BLGGT's twisting proof); arbitrary local square roots cannot simply be extended globally. The `GSp₄` construction target in AG2.P supplies, under the symplectic classification contract of EndoscopicTransferAndUnitaryTraceComparison §§11.0g–11.0h, `GSp₄-valuedness` and the Iwahori, Klingen, paraspherical and inertia cases of CG Proposition 6.8(1)–(2),(5), and Pilloni Theorem 5.1.7.1(2),(5), before their comparisons can be imported.

### Geometric existence in the Shin-regular range

For CM `F` and regular algebraic conjugate-self-dual cuspidal `π` of `GL_m(A_F), m≥2`, suppose `m` is odd, or for even `m` the algebraic highest weight has `a_{τ,k}>a_{τ,k+1}` for some embedding `τ` and odd `k`. Under the technical §7.1 conditions `F=EF⁺, [F⁺:ℚ]≥2` and all ramification of `F` and `π` over rational primes split in `F/F⁺`, apply the compact source construction to `σ=π^∨` to obtain a continuous semisimple
rank-`m r` attached to `π`. Choose the `ST/END` packet, its `GL₁` character and algebraic
coefficient `ξ` from `σ`, with dominant coordinates `a_{σ,τ,k}=−a_{π,τ,m+1−k}`, using the
AG2.0 similitude recipe. After removing the source `GL₁` and norm corrections, its labelled
degrees are `k−1−a_{σ,τ,k}=a_{π,τ,m+1−k}+k−1`, giving the required Hodge multiset for `π`.
Thus the coefficient system and packet are those for `σ`, including in the even-rank END
selection. For odd `m` use ST with `n=m`; for even `m` use END with `n=m+1` and an auxiliary character chosen so that `e₁=e₂`, then remove its parity and norm corrections. This existence statement asserts good-place attachment and rank; the comparison and coefficient-prime conclusions are separate comparison targets.

Throughout this target, shin §7.1 technical datum; `m=1` is supplied by the character dictionary; slight regularity for even `m` is retained.

*Needs:* AG2.1b: actual constituents; AG2.0: attachment operations; AG2.0: similitude character in a compact coefficient system; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4; GlobalNumberFields / layer 9 hecke and ray class characters.

(Sources: Shin, §7.1, Lemmas 7.1–7.3 and Proposition 7.4, pp. 50–53.)

### Twisting an essentially self-dual form into unitary type

For a CM regular algebraic cuspidal polarized pair `(π,χ)`, choose an algebraic Hecke character `ψ` with `ψψ^c=χ∘N_{F/F⁺}` in the source’s compatible infinity-type and parity convention. Then `π⊗ψ^−1∘det` is conjugate self-dual. Given a good-place attached representation `r₀` for the twisted form, `r=r₀⊗r(ψ)` is attached to `π`. A change of `ψ` gives an isomorphism, by uniqueness of the semisimple good-place attached isomorphism class. The existence of `ψ` uses the idele-character extension compatibility, not a pointwise square root of `χ`.

Throughout this target, compatible algebraic infinity types and finite-order parity, with the total-oddness parity convention above; the source extension lemma applies.

*Needs:* AG2.0: polarized pairs; AG2.0: algebraic Galois characters; AG2.0: attachment operations; GlobalNumberFields / layer 10 archimedean characters infinity types and cyclotomic arithmetic.

(Sources: BLGGT, Proof of Theorem 2.1.1, p. 34; CT, Lemma 7.4 and proof, accepted copy pp. 47–48.)

**Checks.**

- Even the trivial rank-one member has every nonzero coefficient scalar as an
  automorphism; good-place recognition does not select an intertwiner.
- Replacing `ψ` by a second compatible twisting character gives the same good polynomials
  after untwisting, hence the same continuous semisimple isomorphism class.
- An incompatible infinity type does not meet the character-extension hypothesis and
  supplies no such construction.


### Galois assembly for discrete unitary transfer

For cohomological square-integrable `Π` on HLTT `G_n(A)`, write `2n=Σ_i m_i n_i` and `BC(Π)_v=⊞_i⊞_{j=0}^{n_i−1} π̃_{i,v}|det|^{(n_i−1)/2−j}` at the source’s good places, where `π̃_i` is conjugate-self-dual cuspidal and `π_i=π̃_i||det||^{(m_i+n_i−1)/2}` is cohomological. Given normalized rank-`m_i` attached `r_i` for `π_i`, form `R(Π)=⊕_i⊕_{j=0}^{n_i−1} r_i⊗ε_ℓ^{−n−j}`. Its rank is `2n` and its good-place WD semisimplification is `rec(BC(Π)_v|det|^{(1−2n)/2})`. The input `r_i` are supplied individually; this assembly does not presume they all lie in the Shin-regular geometric range.

Throughout this target, discrete transfer/classification in HLTT Proposition 1.2; actual rank-`m_i` normalized representations supplied; good places `q≠ℓ` with `q` split in `F₀` or `F` and `Π` unramified above `q`.

The required API is:

- `DiscreteAssembly.rank`: rank `R=Σ_i m_i n_i=2n`.
- `DiscreteAssembly.goodPolynomial`: The good Frobenius polynomial is the product of the scalar-twisted polynomials of `r_i`.
- `DiscreteAssembly.continuous`: Finite sums of continuous finite-field representations are continuous and semisimple.
- `DiscreteAssembly.choice`: Replacing each supplied `r_i` by an isomorphic attached representative gives an isomorphic `R`.

**Checks.**

- `n=1,m₁=1,n₁=2` gives `r₁ε^−1⊕r₁ε^−2`

- `n₁=1,m₁=2n` gives `r₁ε^−n`, tracking the cohomological twist on `π₁`

- Taking only one copy of each `r_i` gives the wrong rank when some `n_i>1`.

*Needs:* AG2.0: integral Frobenius polynomial; AG2.0: attachment operations; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4; ArithmeticGaloisRepresentations Layer 1.

(Sources: HLTT, Proposition 1.2 and Corollary 1.3, p. 31.)

### The Caraiani–Scholze discrete normalization

For an irreducible admissible `Π^S` in `BC^S[H_c(I_Mant^b,ℚ̄_ℓ)]_Sur` of CS Corollary 5.5.5, Corollary 5.5.2 chooses the specified transfer from `G_{n₁,n₂}`, with `Π⃗=ψ⊗Π₁⊗Π₂` and `n₁+n₂=N`. Let `r_i` be the representation for the L-algebraic parameter `Π_i|det|^{(1−n_i)/2}`. The character `|det|^{(n_i−N)/2}(ϖ∘N_{F/𝒦})^{ε(N−n_i)}` is L-algebraic, with Galois character `ε_i`. Then `r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i` has rank `N`, is unramified outside the places above `S∪{ℓ}`, and at `v` above `q∈Spl_{𝒦/ℚ}` outside `S∪{ℓ}` has the displayed integral Hecke polynomial. The parity `ε` takes values 0 or 1 and `ϖ` has odd infinity exponent. This is the selected two-block cohomological transfer, not an assertion about every abstract discrete `GL_N` representation. The full local normalization at the specified split places is the separate Remark 5.5.6 comparison contract.

Throughout this target, the exact cohomological surjection and transferred packet of Corollaries 5.5.2/5.5.5; published numbering; specified imaginary quadratic `𝒦`, source splitting set, `n₁+n₂=N` and odd `ϖ`.

*Needs:* AG2.2: Galois assembly for discrete unitary transfer; AG2.0: attachment operations; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4; AG2.3: arbitrary regular existence.

(Sources: CS, Corollary 5.5.5, pp. 745–746.)

### Attachment under cuspidal solvable base change

If `F′/F` is solvable, `π′=BC_{F′/F}(π)` is cuspidal regular algebraic, and `r` is attached to `π`, then `(r|_{G_{F′}})^ss` is attached to `π′`. If another semisimple representation is attached to `π′`, good Frobenius polynomials identify it with this restriction. This is a specialization of automorphic base change and Galois restriction, distinct from the effective descent theorem used to construct `r` over `F`.

Throughout this target, existence and good-place Satake compatibility of the specified solvable base change; cuspidality is assumed or ensured by avoiding finite self-twist fields.

*Needs:* AG2.0: good-place attachment; ArithmeticGaloisRepresentations Layer 1; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: CH, §3.1, proof of Theorem 3.1.2, p. 9.)

### Examples

One rank-one block of multiplicity two gives `rε⁻¹⊕rε⁻²` when `n=1`. Two labelled CS characters have the product of their two twisted linear Frobenius factors and retain a proper invariant summand.

### Dependencies

AG2.0; AG2.1b; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4; the unrestricted constituents constructed in AG2.3.

## Layer AG2.3: Definite families, patching and arbitrary regularity

A definite-unitary family interpolates determinant laws on a strongly regular classical locus. Finite-slope specialization, S-general solvable extensions and effective patching remove the initial restrictions. Polarization and its sign follow for the constructed representation. The common-field target additionally imports the regular Hodge theorem from AG2.6, rather than presuming trace-field descent.

Strongly regular density needs the definite-unitary classicality and density theorem recalled in CH, not only an abstract Fredholm construction. The inertial/monodromy family comparison in CH Theorem 2.3 uses the bounded local-type specialization argument of Bellaïche–Chenevier §6.5. It is an independent family interface and cannot be replaced by the later Varma nonselfdual theorem.

### Arbitrary regular conjugate-self-dual existence

For any CM `F`, regular algebraic conjugate-self-dual cuspidal `π` on `GL_n(A_F)`, prime `ℓ` and coefficient isomorphism `ι`, there is a unique-up-to-isomorphism continuous semisimple rank-`n r` attached at good places. No odd-rank, slight-regularity, finite-place square-integrability, finite-slope, unramified-field or imaginary-quadratic-subfield hypothesis remains. CH Theorem 3.2.3 also proves domination away from `ℓ` and the de Rham/crystalline/semistable assertions, but those exports are assigned to AG2.5 and AG2.6. For an essentially polarized form apply the algebraic-character twist and undo it.

Throughout this target, regular algebraic cuspidal and conjugate self-dual; `n=1` comes from class field theory. The `GSp₄` case uses the AG2.P construction.

*Needs:* AG2.3: solvable-index induction; AG2.2: Twisting an essentially self-dual form into unitary type; AG2.0: algebraic Galois characters; AG2.0: good-place attachment.

(Sources: CH, Theorem 3.2.3 and proof, pp. 11–12.)

### Totally real polarized existence by CM descent

For totally real `F` and a regular algebraic cuspidal polarized pair `(π,χ)`, with
`π^∨≅π⊗χ⁻¹` and `χ_v(−1)` independent of the real place, construct a continuous semisimple
rank-`n` good-place attached member for every `ℓ` and `ι`. In CH Hypotheses 4.1 the character
is `χ_CH=χ⁻¹`. Choose an S-general family of quadratic CM extensions `K/F`, split at any
specified finite testing places, disjoint from a prescribed finite extension and avoiding
the finitely many self-twist fields, so `BC_{K/F}(π)` is cuspidal. Choose the compatible
algebraic character `ψ_K` with `ψ_K ψ_K^c=χ∘N_{K/F}`; apply the unrestricted CM theorem to
`BC(π)⊗ψ_K⁻¹` and untwist its member by `r(ψ_K)`. Good-place recognition supplies Galois
invariance and overlap isomorphisms; effective patching constructs the member over `F`.
Prove that its restriction to each such `K` is the normalized polarized CM member, with
coefficient embeddings and character twists retained, and prove uniqueness up to
isomorphism from the good polynomials. Rank one uses the character dictionary directly.
No finite discrete-series place is assumed: CH Theorem 4.2 uses the descent argument of
CHT Proposition 4.3.1 with CH’s unrestricted CM input.

**Checks.**

- For `n=1`, patching recovers the Galois avatar of the algebraic Hecke character on `F`,
  rather than one of its quadratic twists with different good polynomials.
- Choosing `K` split at a finite `v` identifies `K_w` with `F_v`; restriction then preserves
  the local Frobenius polynomial. Inert base change only tests the square of Frobenius.
- A single CM extension cannot distinguish `r` from `r⊗δ_{K/F}`. Varying an S-general
  family disjoint from every prescribed finite extension removes this ambiguity.

*Needs:* AG2.3: unrestricted CM existence;
AG2.2: algebraic polarization twist;
AG2.3: effective patching;
AG2.0: attachment and uniqueness;
ArithmeticGaloisDuality §R02.4.6 for quadratic character prescriptions including real signs;
EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: CH, Hypotheses 4.1 and Theorem 4.2 with proof, p.13;
[Clozel–Harris–Taylor](https://www.numdam.org/item/PMIHES_2008__108__1_0/),
Proposition 4.3.1 and its proof, pp.125–126, for the CM twisting and descent argument.)

### The definite-unitary eigenvariety instance

Under CH General Hypotheses 1.1 and all Special Hypotheses 1.2, including `Π` spherical at nonsplit places (1.2.2), `K/F` is unramified at finite places and `[F:ℚ]` is even. The hermitian `V₀` gives a unitary `G₀` compact at all real places and quasi-split at finite places. Choose `v₀|ℓ` split in `K` and an Iwahori refinement of `Π` there; fix weights at all other real places, and tame Bernstein components with the prescribed local monodromy bound. Specialize the group-independent finite-slope eigenvariety to overconvergent `G₀` forms varying the weights belonging to `v₀`. The classical `Π` gives a point `x` with its good Hecke eigenvalues.

Throughout this target, general Hypothesis 1.1 and Special Hypotheses 1.2 and 2.2; `n` even in the interpolation step; a genuine finite-slope refinement at `v₀`.

The required API is:

- `DefiniteFamily.classicalPoint`: A refined classical `Π` with the fixed tame/infinity data gives `x`.
- `DefiniteFamily.fixedWeights`: All labelled weights away from `v₀` are fixed in the family.
- `DefiniteFamily.goodEigenvalues`: At `x`, spherical operators specialize to the good Hecke eigenvalues of `Π`.
- `DefiniteFamily.tameType`: At tame split places every classical point lies in the prescribed Bernstein component with the source local bound.

**Checks.**

- Varying a weight at an embedding not attached to `v₀` violates the family contract

- An infinite-slope eigensystem does not give a point of a finite-slope chart

- At a classical point the good Hecke polynomial is the integral polynomial specialized to `Π`.

*Needs:* AG2.0: polarized pairs; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4; LocallyAnalyticDistributions §§4.15–4.16; LocallyAnalyticDistributions §§4.2, 4.15–4.16; ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7.

(Sources: CH, Lemma 2.1, Hypotheses 2.2 and proof of Theorem 2.3, p. 8.)

### Shin-regular existence over arbitrary CM fields

For regular algebraic CSD cuspidal `π` over any CM field, retain odd rank or the even-rank
slight-regularity condition of AG2.2 and construct its continuous semisimple good-place
attached representation without auxiliary field restrictions. Use Shin §7.2's two stages:
first patch the auxiliary CM quadratic extensions over a field containing an imaginary
quadratic `E` with `ℓ` split in `E`, imposing the rational ramification/splitting conditions;
then vary `E` and patch again. Avoid the finitely many self-twist fields to retain cuspidality,
and prove overlap compatibility by good-place recognition. These extension families and
effective patching use only the geometric Shin-regular representations of AG2.2, not
finite-slope interpolation. The rank-one case uses the algebraic character dictionary.
(Sources: Shin, Theorem 7.5, Remark 7.8 and its proof, Steps (I)–(II),
pp.54–55; CH, §3.1's effective patching statement, p.9.)

**Checks.**

- An even-rank strongly regular classical point over a CH field without an imaginary
  quadratic subfield now has an attached representation; varying its weight alone would
  not have supplied that subfield.
- Odd rank needs no slight-regularity condition. In even rank a weight failing slight
  regularity remains outside this geometric target and needs interpolation.
- Each test Frobenius can be arranged split in a patching branch disjoint from a prescribed
  finite extension; a family with one fixed nontrivial subextension does not suffice.

*Needs:* AG2.2: Shin-regular geometric existence;
AG2.3: effective patching;
AG2.3: extension families;
AG2.0: attachment.

### Density of strongly regular classical points

In the CH definite-unitary family, classical points whose varied algebraic weights lie sufficiently far in the dominant chamber and satisfy slight regularity are Zariski dense in the required finite-slope charts. They retain the fixed other archimedean weights and tame local data. These points have geometric attached representations from the Shin-regular field-descent target and are sufficient to determine analytic good-place trace functions.

Throughout this target, the source’s classicality bounds relative to the chosen finite slope and coefficient family; density is asserted on the relevant charts, not on arbitrary eigenvarieties.

*Needs:* AG2.3: definite-unitary eigenvariety instance; AG2.3: Shin-regular field descent; LocallyAnalyticDistributions §§4.15–4.16; LocallyAnalyticDistributions §§4.2, 4.15–4.16; ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7.

(Sources: CH, Theorem 2.3 and proof, p. 8, invoking Chenevier, *Une application des variétés de Hecke des groupes unitaires*, Theorems 3.3 and 3.5 ([Ch] in CH’s bibliography).)

### Determinant interpolation on the definite family

The traces of the rank-`n` geometric attached representations at the dense strongly regular classical points extend to a continuous degree-n determinant on `G_{K,S}` with values in the reduced affinoid Hecke algebra of each relevant chart. Its good Frobenius characteristic polynomial is the analytic integral Hecke polynomial. At `x`, specialization and semisimple reconstruction give a continuous rank-`n` representation `r_x` over `ℚ̄_ℓ`, without an absolute-irreducibility hypothesis on `r_x`.

Throughout this target, one common finite ramification set `S`, reduced affinoid Hecke charts, continuous bounded trace interpolation, characteristic zero so `n!` is invertible, and finite-field continuity of the specialized semisimple representation.

*Needs:* AG2.3: classical density; AG2.3: definite-unitary eigenvariety instance; IntegralHeckeAndGaloisDeterminants §4.2; IntegralHeckeAndGaloisDeterminants §1.2; ArithmeticGaloisRepresentations Layer 1.

(Sources: CH, Theorem 2.3 and proof, p. 8.)

### Existence at the regular finite-slope target

Under CH Hypotheses 1.1, 1.2 and 2.2, a regular CSD cuspidal `Π` has a unique continuous semisimple rank-`n` good-place attached `r`, without Hypothesis 1.3. The assertion includes even rank without slight regularity, because it is obtained by specializing the determinant at `x`, not by identifying `Π` itself with a geometric middle-degree constituent.

Throughout this target, a split coefficient place with Iwahori invariants and the technical unramified CM datum of the definite-unitary family. CH §2 takes `n` even; the odd-rank existence branch comes from the geometric theorem. This is the even-rank finite-slope step of the general construction.

*Needs:* AG2.3: family determinant; AG2.0: good-place attachment.

(Sources: CH, Theorem 2.3, p. 8.)

### The automorphic S-general extension family

For `K/F` CM, a finite forbidden set `S` and auxiliary finite extension `M`, choose cyclic prime-degree totally real `F′/F` disjoint from `M`, splitting the required places outside `S` and meeting the specified local splitting/ramification conditions. Their composita `K′=KF′` give the S-general families used by CH §3.1. Enlarge `M` to exclude the finitely many self-twist extensions so that `BC_{K′/K}(Π)` stays cuspidal. S-general means: for every finite `M/K` and `v∉S` there is `K′` disjoint from `M` with `v` split completely.

Apply ArithmeticGaloisDuality §R02.4.6’s Grunwald–Wang theorem in its prime-degree
nonexceptional case. Prescribe trivial characters at the real places to keep `F′` totally
real. Add separating finite places that split in `F′` but do not split in each cyclic
prime-degree subfield of `M` (one separating place for each subfield), and prescribe the
required local character at the testing
place. Global reciprocity then gives the cyclic fields, disjoint from `M`. Retain avoidance
of the self-twist fields. The special higher 2-power obstruction is outside this use.

The required API is:

- `SGeneralFamily.disjoint`: Given every finite `M`, obtain an extension linearly disjoint from `M`.
- `SGeneralFamily.splitPlace`: Given `v∉S`, choose that extension with `v` split completely.
- `SGeneralFamily.cuspidal`: Avoiding the finite self-twist fields preserves cuspidality of base change.

**Checks.**

- An infinite collection all containing one fixed nontrivial extension is not S-general

- At a prescribed split place the local completion of each branch is the original field

- No splitting assertion is made for `v∈S` unless included in the local prescription.

*Needs:* GlobalNumberFields / layer 9 hecke and ray class characters;
ArithmeticGaloisDuality §R02.4.6, Grunwald–Wang with its exact dyadic obstruction;
EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: CH, §3.1 and Lemma 3.2.1, pp. 9–10.)

### Effective Galois patching for automorphic base changes

For an S-general family `K_i/K` of cyclic extensions of a fixed prime degree, let `r_i` be continuous semisimple rank-`n` representations of `G_{K_i}`, invariant under `Gal(K_i/K)`, with isomorphic restrictions on every compositum `K_iK_j`. Sorensen’s effective patching theorem yields a unique continuous semisimple rank-`n r` of `G_K` restricting to every `r_i`. For attached base-change `r_i`, good Frobenius polynomials establish both invariance and pairwise compatibility and then good-place attachment of `r`.

Throughout this target, all S-general quantifiers and all overlap/invariance conditions; actual representations `r_i`, not only virtual classes or traces.

*Needs:* AG2.3: automorphic S-general extension family; AG2.2: Attachment under cuspidal solvable base change; AG2.0: good-place attachment; ArithmeticGaloisRepresentations Layer 5.

(Sources: CH, §3.1, patching lemma and Theorem 3.1.2, p. 9.)

### Field-hypothesis removal for finite-slope existence

The finite-slope good-place rank-`n` representation descends over an arbitrary CM `K` using
CH Proposition 3.1.1’s S-general quadratic base changes satisfying Hypotheses 1.2, with
the coefficient place split and the prescribed Iwahori refinement retained. Patch the
representations constructed by interpolation over these fields, preserving cuspidality.
The geometric field restrictions have already been removed by Shin-regular field descent;
this separate step removes the unramified-field and even-real-degree restrictions on the
finite-slope target.

Throughout this target, CSD regular cuspidal `Π` in the even-rank finite-slope range; the
local Iwahori hypothesis is retained until solvable-index induction.

*Needs:* AG2.3: effective patching; AG2.3: Existence at the regular finite-slope target; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: CH, Theorem 3.1.2 and proof, p. 9; CH, Proof of Theorem 3.2.3, first paragraph, p. 11.)

### Solvable local reduction to Iwahori level

At a split coefficient place `v`, choose a finite solvable local extension `L/F_v` over which the Weil part of `rec(Π_u)` is unramified; then the automorphic local base change has Iwahori invariants. If `Π` satisfies `P(m+1)`, CH Corollary 3.2.2 supplies an S-general family of prime-degree global extensions preserving a testing place and cuspidality, on which the local solvable index drops to `m`.

Throughout this target, local `GL_n` Langlands and its compatibility with cyclic base change; coefficient place split in `K`; finite solvable index as defined in CH p. 10.

*Needs:* AG2.3: automorphic S-general extension family; EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.27 and §10.30; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: CH, Property P(m) and Corollary 3.2.2, p. 10.)

### Induction removing the finite-slope hypothesis

For a regular CSD cuspidal `Π`, induction on its local solvable index `P(m)` constructs a continuous semisimple good-place attached representation at every coefficient prime. The base `m=0` is finite-slope Iwahori existence, after field hypotheses are removed. The successor step constructs representations after each prime-degree extension lowering `m` and patches them effectively. No finite-slope hypothesis remains on the original `Π`.

Throughout this target, arbitrary coefficient prime; the prime-degree local-global extension family and effective patching.

*Needs:* AG2.3: Solvable local reduction to Iwahori level; AG2.3: field-hypothesis removal; AG2.3: effective patching.

(Sources: CH, Proof of Theorem 3.2.3, pp. 11–12.)

### The polarization sign of the constructed system

For the constructed regular algebraic polarized cuspidal pair `(π,χ), r^c≅r∨⊗ε_ℓ^{1−n}r(χ)|_{G_F}`. With the total-oddness parity convention every conjugate-self-dual irreducible factor has Bellaïche–Chenevier sign `+1`, and the representation admits the ArithmeticGaloisRepresentations §7.4 polarized-extension structure with totally odd multiplier `µ=ε_ℓ^{1−n}r(χ)`. The good-place dual identity alone supplies the self-duality isomorphism; the sign theorem is the independent input needed for the prescribed symmetric polarization.

Throughout this target, the normalized polarized pair and algebraic twisting character; characteristic-zero semisimple `r`; irreducible factors fixed by the dual-conjugation operation as in BC Theorem 1.2.

*Needs:* AG2.3: arbitrary regular existence; AG2.2: Twisting an essentially self-dual form into unitary type; AG2.0: attachment operations; AG2.0: multiplier parity; ArithmeticGaloisRepresentations §7.4.

(Sources: BC, §1.3, Theorem 1.2 and Corollary 1.3, p. 1339 (PDF p. 4).)

### A common finite field of realization in the polarized range

The target `commonFiniteFieldOfRealization` has the following hypotheses and conclusion.

For the CH polarized `π`, there is a number field `E(π)` containing its trace field such that every coefficient-prime representation has a model over `E(π)_λ`. Obtain two auxiliary good Frobenius polynomials with `n` distinct roots and distinct residue characteristics, adjoin their roots to the trace field, and use ArithmeticGaloisRepresentations Layer 5 rational-eigenvalue descent at a place away from each coefficient prime. This is a field of realization, not an assertion that the minimal trace field itself is sufficient.

Throughout this target, cH regular de Rham/Hodge–Tate input used by the Serre Zariski-closure argument; uniform good polynomials and their number field; two auxiliary residue characteristics.

*Needs:* AG2.3: arbitrary regular existence; AG2.0: Rationality of the good Hecke polynomials; ArithmeticGaloisRepresentations Layer 5; AG2.P: finite-coefficient periods and comparison; AG2.6: polarized admissibility.

(Sources: CH, Proposition 3.2.5 and proof, p. 12.)

### Examples

In rank one the character construction gives the finite-slope specialization. In higher rank a rational trace field need not realize the representation; the two distinct-residue-characteristic Frobenius polynomials give a larger simultaneous field.

### Dependencies

AG2.0–AG2.2; LocallyAnalyticDistributions §§4.2 and 4.15–4.16; IntegralHeckeAndGaloisDeterminants §4.2; ArithmeticGaloisRepresentations Layer 5. The final realization-field target also uses the particular AG2.6 Hodge comparison.

## Layer AG2.4: Ordinary boundary cohomology and nonselfdual existence

Use the specific HLTT ordinary boundary instance, its dagger/rigid comparison and Hasse weight changes to construct integral congruences with high-weight classical forms. Spectral sequences identify the boundary Levi term. The determinant limit and two-factor separation construct the nonselfdual representation; coefficient-prime admissibility is a later comparison.

Boundary cohomology below uses the fixed compactification and its transition-map colimit. An intrinsic compactification-independent identification would require a further theorem; HLTT Lemma 6.19's invariants do not imply it. Hasse approximation naturally gives classical comparison quotients. Interpolation therefore requires determinant-law descent through those quotients, with continuity, or a construction of suitable injective witnesses; pointwise Hecke congruences alone do not meet this requirement.

### HLTT existence over arbitrary CM and totally real fields

For `E` totally real or CM and `π` regular algebraic cuspidal on `GL_n(A_E)`, every prime `p` and coefficient isomorphism `ι` yield a continuous semisimple rank-`n r` attached at good places. HLTT Theorem 7.13 constructs it first for `F=F₀F⁺` with `p` split in `F₀` and the stated source good primes; Corollary 7.14 removes the auxiliary field restrictions by effective patching and proves unramifiedness and the normalized polynomial at all `v|q≠p` for rational `q` where `π` is unramified above `q`. No polarization is required; the theorem here asserts neither de Rham admissibility at `p` nor full monodromy at ramified primes.

Throughout this target, regular algebraic cuspidal; geometric Artin and the common integral polynomial convention; `n=1` supplied by the algebraic-character construction.

*Needs:* AG2.4: HLTT factor separation; AG2.3: effective patching; AG2.3: automorphic S-general extension family; AG2.2: Attachment under cuspidal solvable base change; AG2.0: algebraic Galois characters.

(Sources: HLTT, Theorem 7.13 and Corollary 7.14, pp. 227–228.)

### HLTT ordinary boundary geometry

Fix `F=F₀F⁺` with `F₀` imaginary quadratic and `p` split in `F₀`. For the quasi-split similitude `G_n` on `F^{2n}` of signature (n,n), choose HLTT ordinary levels `U^p(N₁,N₂)`, smooth toroidal cone data `Σ` and the Kuga family `A^(m)`. The minimal compactification carries canonical and subcanonical `E_ρ`, the ordinary locus and its Hasse section; the ordinary toroidal Kuga model has SNC boundary `∂`. Its formal ordinary tube has the dagger structure used in §6.2. Keep the right `G_n` action, the left `GL_m(F)` action and their source commutation conventions.

Throughout this target, the exact integral ordinary/mixed models and toroidal charts of HLTT §§3–5; neat levels and admissible smooth cones; `m≥0`.

The required API is:

- `HLTTModel.genericFibre`: Minimal/toroidal/Kuga models identify the stipulated generic fibres and levels.
- `HLTTModel.ordinaryDagger`: The ordinary formal tube defines the smooth dagger pair with SNC boundary.
- `HLTTModel.subcanonical`: `E_ρ^sub` is the boundary-vanishing extension used for cuspidal sections.
- `HLTTModel.refinement`: Admissible cone refinements and level changes give the maps used in the cohomology colimit.

**Checks.**

- `m=0` has dimension `[F⁺:ℚ]n²`

- `n=1,m=1` has dimension `3[F⁺:ℚ]`

- Canonical sections without the boundary ideal include noncuspidal classes and cannot replace the subcanonical module.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§7.6–7.10; PELModuli M4; AdicSpacesPartIV §F1.12.

(Sources: HLTT, §§3–5, pp. 84–190, summarized in Appendix A.1, pp. 229–234.)

### Dagger cohomology with boundary support

For each fixed ordinary toroidal Kuga pair `(A_Σ^†,∂)`, define `H^i_{c−∂}(A_Σ^ord)=H^i(A_Σ^†,I_∂Ω^•(log∂))`, then form the HLTT colimit over levels and admissible `Σ` with its transition maps. The complex restricts to the ordinary de Rham complex away from `∂`. This definition is relative to the selected compactification; no intrinsic compactification-independent identification is asserted.

Throughout this target, smooth dagger SNC pair from the exact HLTT model and compatible level/refinement morphisms.

The required API is:

- `BoundaryCohomology.complex`: Its complex is `I_∂Ω^•(log∂)`, with the de Rham differential.
- `BoundaryCohomology.emptyBoundary`: If `∂` is empty the complex is `Ω^•`.
- `BoundaryCohomology.transition`: Level/refinement morphisms induce compatible maps used by the directed colimit.
- `BoundaryCohomology.groupAction`: The source ordinary adelic group acts through these transition correspondences.

**Checks.**

- For `∂=(t=0)`, the degree-zero term is `tO^†`, not `O^†`

- With `∂=∅` recover ordinary dagger de Rham cohomology

- Dropping `I_∂` gives logarithmic cohomology with different boundary classes.

*Needs:* AG2.4: HLTT ordinary boundary geometry; AdicSpacesPartIV §F1.12.

(Sources: HLTT, §6.5 definition and Lemma 6.19, pp. 218–219.)

### Functorial comparison of HLTT tubes with rigid cohomology

For smooth quasi-projective `Y/O_K` in HLTT Lemma 6.8, `H^i_rig(Y_s/K)≅H^i(Y^†,Ω^•)`. The isomorphism is functorial under the actual morphisms of smooth models used for boundary strata, Hecke maps and Frobenius lifts. In particular the ordinary lift `ς_p` corresponds to rigid Frobenius because its special-fibre map is Frobenius.

Throughout this target, the proper formal embeddings and strict-neighborhood choices in GK Theorem 5.1 and HLTT Lemma 6.8; this is not an arbitrary rigid-space comparison.

*Needs:* AG2.4: HLTT ordinary boundary geometry; PadicDifferentialEquationsAndRigidCohomology RD.4; AdicSpacesPartIV §F1.12.

(Sources: HLTT, Lemma 6.8 and bracketed functoriality proof, pp. 201–202; GK, Theorem 5.1 and proof, §5, pp.23–24.)

### HLTT Frobenius and trace normalization

On `H^i_{c−∂}(A_Σ^ord)`, the pullback `ς_p` and trace trF commute with the ordinary adelic action and satisfy `trF∘ς_p=p^{n(n+2m)[F⁺:ℚ]} id`. On the ordinary minimal cusp-section module the normalized trace is the source controlling operator, with the explicit coefficient factor `p^{mn[F:ℚ]}` of Proposition 6.15: on a graded `E_ρ` term the Kuga trace is `p^{mn[F:ℚ]}` times the cusp-section trace. Thus section slope bound `a` gives Kuga slope bound `a+mn[F:ℚ]` in Corollary 6.17; conversely Kuga bound `a` corresponds to section bound `a−mn[F:ℚ]`. This distinguishes geometric Frobenius pullback from its finite-étale trace.

Throughout this target, hLTT ordinary Frobenius quotient, dagger finite-étale trace and its boundary extension; characteristic zero coefficients.

*Needs:* AG2.4: Dagger cohomology with boundary support; AG2.4: Functorial comparison of HLTT tubes with rigid cohomology; AdicSpacesPartIV §§F1.10 and F1.16.

(Sources: HLTT, Proposition 6.15 and Corollary 6.17; §6.5 before Lemma 6.19, pp. 215–218.)

### Finite slope cusp sections on the ordinary tube

For each algebraic `ρ` and slope bound a, `H⁰(X^ord,min,†,E_ρ^sub)_{≤a}` is an admissible ordinary adelic module; at each fixed small level it is finite-dimensional. The completely continuous normalized trF acts on Banach strict neighborhoods and the finite-slope summand is unchanged upon shrinking through the source compatible neighborhoods. Its tower embeds in the ordinary formal-section space `H⁰(X^ord,min,E_ρ^ord,sub)⊗ℚ_p`.

Throughout this target, hLTT Lemmas 6.6 and 6.10–6.12, compact restriction maps and exact linked neighborhood data; the slope is measured for the normalized source trace.

*Needs:* AG2.4: HLTT ordinary boundary geometry; AG2.4: Frobenius/trace normalization; LocallyAnalyticDistributions §§4.2, 4.15–4.16; LocallyAnalyticDistributions §§4.15–4.16.

(Sources: HLTT, Lemmas 6.10–6.12 and Corollary 6.13, pp. 205–215.)

### Hasse weight-changing congruences

For `M≥1` and any lower bound `r`, multiplication/division by the lifted Hasse section gives the Hecke-equivariant surjection `⊕_{j≥r} H⁰(X^min,E_ρ^sub⊗ω^{j(p−1)p^{M−1}})→H⁰(X^ord,min,E_ρ^sub⊗Z/p^M), f↦f/Hasse_M^j`. Consequently a finite collection of ordinary sections modulo `p^M` admits lifts in finitely many sufficiently high classical weights; one common weight bound and modulus controls that finite collection.

Throughout this target, integral `E_ρ` lattice and HLTT ordinary minimal model; ample `ω` and the lifted Hasse section; all relevant level/action normalizations.

*Needs:* AG2.4: HLTT ordinary boundary geometry.

(Sources: HLTT, Lemma 6.1 and proof, pp. 192–195.)

### Galois type of sufficiently high classical cusp forms

For a fixed algebraic `ρ`, sufficiently large determinant twists satisfying `−2n≥(b_{τ,1}−t)+(b_{τc,1}−t)` put the classical cuspidal `G_n` eigensystems in the discrete cohomological range of HLTT Lemma 6.2. Through constituent existence in AG2.3 and the discrete assembly they have continuous semisimple rank-`2n` representations with the normalized good polynomials and one fixed tame ramification set determined by the fixed level and `p`.

Throughout this target, the high-weight inequality and fixed level; all discrete constituent algebraic twists are retained; no torsion Hecke existence is an input.

*Needs:* AG2.4: Hasse weight-changing congruences; AG2.2: Galois assembly for discrete unitary transfer; AG2.3: arbitrary regular existence; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: HLTT, Lemma 6.2 and Corollaries 6.3–6.4, pp. 195–197.)

### Uniform integral Hecke congruence witnesses

For each finite ordinary Hecke module `W` and each `p`-adic modulus, the Hasse surjection and sufficiently high classical Galois-type modules give a single finite classical comparison controlling all good Hecke operators on `W` modulo that modulus. Choose a common finite ramification set, coefficient ring and compatible refinements of these comparison data as the modulus grows. The resulting quotient determinant/trace data obey the IntegralHeckeAndGaloisDeterminants Layer 4 uniform-congruence contract; at primes dividing (2n)! use a stronger modulus before converting trace pseudocharacters to determinants in characteristic zero.

Throughout this target, integral finite Hecke image of `W`, finite classical comparison module and quotient descent for the continuous determinant identities; denominator control is explicit.

*Needs:* AG2.4: Hasse weight-changing congruences; AG2.4: Galois type of sufficiently high classical cusp forms; IntegralHeckeAndGaloisDeterminants §4.2.

(Sources: HLTT, Corollaries 6.3–6.4 and proof of Proposition 6.5, pp. 196–199.)

### The continuous ordinary Hecke determinant limit

The compatible fixed-S quotient data for the ordinary finite Hecke modules interpolate to a unique continuous degree-2n determinant, with every good Frobenius polynomial equal to the normalized `G_n` Hecke polynomial. At each characteristic-zero irreducible ordinary eigensystem covered by Proposition 6.5/Corollary 6.13, specialization reconstructs a continuous semisimple rank-`2n` Galois representation. Coefficient/level changes transport this determinant; the coefficient limit adds no ramification.

Throughout this target, the uniform congruence witnesses and actual quotient-descent contract, separated complete coefficient topology, compatible level maps and characteristic-zero reconstruction continuity; the source Proposition 6.5 initially concerns an irreducible quotient of an admissible submodule.

*Needs:* AG2.4: uniform Hecke congruences; AG2.4: Finite slope cusp sections on the ordinary tube; IntegralHeckeAndGaloisDeterminants §4.2; IntegralHeckeAndGaloisDeterminants §1.2.

(Sources: HLTT, Proposition 6.5 and Corollary 6.13, pp. 197–199, 214–215.)

### The logarithmic cusp-section spectral sequence

At each fixed Kuga slope bound `b`, the logarithmic de Rham cohomology of the ordinary Kuga model with `I_∂` has the coefficient filtration and spectral sequence of HLTT Proposition 6.15/Corollary 6.17: the `E₁` terms are finite-slope `H⁰(X^ord,min,†,E_{ρ_{m,s}^{i,j}}^sub)`, with section bound `b−mn[F:ℚ]`. Equivalently, section bound `a` gives Kuga bound `a+mn[F:ℚ]`. Combining with Lemma 6.20 gives the log de Rham spectral sequence to `H^*_{c−∂,≤b}`. Hence every irreducible constituent appearing in the abutment has the source rank-`2n` good-place Galois representation.

Throughout this target, actual algebraic representations `ρ_{m,s}^{i,j}`, coefficient trace factor and finite filtrations; the higher coherent cohomology vanishing on the ordinary affine locus.

*Needs:* AG2.4: Dagger cohomology with boundary support; AG2.4: Frobenius/trace normalization; AG2.4: Finite slope cusp sections on the ordinary tube; AG2.4: continuous ordinary Hecke determinant limit; AG2.4: HLTT ordinary boundary geometry.

(Sources: HLTT, Proposition 6.15, Corollary 6.17 and Corollaries 6.18, 6.23, pp. 215–220.)

### The boundary-stratum and weight-zero spectral sequence

For the fixed HLTT ordinary boundary model, `E₁^{i,j}=H^i_rig(∂^(j)A_Σ^ord)⇒H^{i+j}_{c−∂}(A_Σ^ord)`, compatibly with `ς_p`. The abutment is finite-dimensional at fixed level and is exhausted by finite trF slopes. Its Frobenius eigenvalues have nonnegative Weil weights; for `i>0`, the weight-zero part of `H^{i+1}_{c−∂}` is the cohomology `H^i` of the boundary dual simplicial complex, and for `i=0` the source gives a surjection.

Throughout this target, smooth quasi-projective strata, functorial rigid/dagger comparison, rigid finiteness and the weight lower bound `w≥cohomological` degree.

*Needs:* AG2.4: Dagger cohomology with boundary support; AG2.4: Functorial comparison of HLTT tubes with rigid cohomology; AG2.4: Frobenius/trace normalization; PadicDifferentialEquationsAndRigidCohomology RD.5; PadicDifferentialEquationsAndRigidCohomology RD.6.

(Sources: HLTT, Lemmas 6.21 and Corollaries 6.22–6.24, pp. 219–220.)

### The boundary Levi realization

For `i>0`, the induced interior cohomology of the `GL_n` Levi locally symmetric space in HLTT Corollary 6.25 occurs as a subquotient of `W₀H^{i+1}_{c−∂}`. A regular algebraic `GL_n` cuspidal `π`, after all sufficiently large norm twists `N`, occurs in this interior-cohomology input by Corollary 1.9. Here the outer `c` transports the second local parameter from `W_{F_{cv}}` to `W_{F_v}`. Corollary 6.27 gives an actual rank-`2n R(π,N)` whose good-place parameter is `rec(π_v|det|^{(1−n)/2})⊕rec_{F_{cv}}(π_{cv}|det|^{(1−n)/2})^{∨,c}ε_p^{1−2n−2N}`.

Throughout this target, `n>1`; exact Levi arithmetic quotient, coefficient representation `ρ` and `π∞` with the infinitesimal character of `ρ∨; N` sufficiently large; good source places `q≠p` split in `F₀` or unramified in `F` with `π` spherical above `q`.

*Needs:* AG2.4: boundary weight-zero sequence; AG2.4: cusp-section spectral sequence; ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7 and ALS.5b.5; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: HLTT, Corollary 1.9, §1.5, p. 41; Corollaries 6.25–6.27, p. 221.)

**Checks.**

- At distinct conjugate places v,cv with independently prescribed spherical parameters,
  the second summand uses `π_{cv}`; inserting `π^c_{cv}` incorrectly repeats the `v`-data.
- Each local summand has rank `n`, so `R(π,N)` has rank `2n`. Dualizing the second factor
  reciprocates its eigenvalues before applying the displayed cyclotomic power.
- Increasing `N` by one multiplies only the second root multiset by `ε_p⁻²`. For `n=1` the
  boundary realization is excluded by the stated `n>1` hypothesis.


### Separating the two HLTT rank-`n` factors

The representations `R(π,N)` for all sufficiently large `N` satisfy HLTT Proposition 7.12 with `Γ=G_{F,S}`, dense good Frobenius set, `µ=ε_p^−2` and two `n`-element root multisets `E₁,E₂` independent of `N`, the constant `ε_p^{1−2n}` correction absorbed into `E₂`. Each `µ(Frob_v)` has infinite order. The generic factor-separation theorem therefore gives continuous semisimple rank-`n` representations for each multiset. The first is the good-place attached `r(π)`, uniquely determined by Frobenius polynomials.

Throughout this target, one finite `S` for all `N; Γ` topological, algebraically closed characteristic-zero coefficient field; all `R(π,N)` continuous semisimple; infinitely many exponents and infinite-order `µ` on the determining dense set.

The general matrix statement `hlttFactorSeparation` takes a topological group `Γ`, an
algebraically closed Hausdorff topological field `k` of characteristic zero, `n>0`, a dense
set `D⊆Γ`, a continuous character `µ:Γ→kˣ` of infinite order at every point of `D`, and
lists `α_f,β_f:Fin n→kˣ`. For an infinite `M⊆ℤ`, suppose continuous semisimple `R_m`
of rank `2n` have polynomial `∏ᵢ(X−α_{f,i}) ∏ᵢ(X−β_{f,i}µ(f)^m)` at each `f∈D`.
It constructs continuous semisimple `r₁,r₂` of rank `n` with the respective polynomials
`∏ᵢ(X−α_{f,i})` and `∏ᵢ(X−β_{f,i})` on `D`. The automorphic boundary construction
supplies the family and the two lists; no automorphic carrier is part of this matrix statement.

**Checks.**

- For two rank-`n` semisimple representations `r₁,r₂`, the family `r₁⊕(r₂⊗µ^m)`
  has exactly the required product polynomial, including repeated roots.
- In the HLTT application, `µ=ε_p^−2` has value `q_v²` at good geometric Frobenius,
  hence infinite order; the constant `ε_p^{1−2n}` twist belongs in the second root list.
- If `µ=1`, the two lists can be exchanged independently at different points of `D` without
  changing any family polynomial. Arbitrary such lists need not be characters even in rank one,
  so the infinite-order hypothesis cannot be removed. A finite exponent set likewise supplies
  no infinite-family separation theorem.

*Needs:* AG2.4: boundary Levi realization; AG2.0: good-place attachment; IntegralHeckeAndGaloisDeterminants §4.2.

(Sources: HLTT, §7 first two paragraphs, Proposition 7.12 and proof of Theorem 7.13, pp. 222–228.)

### Examples

At `p=3` and `M=1`, two Hasse powers shift the weight by 4. For one Kuga copy over a degree-two CM field, section slope 3 gives Kuga slope 5; the inverse conversion subtracts 2.

### Dependencies

AG2.0–AG2.3; PELModuli M0–M4; ShimuraVarieties §§8.18–8.23; AdicSpacesPartIV F1.9–F1.12 and F1.16; PadicDifferentialEquationsAndRigidCohomology RD.4–RD.6; IntegralHeckeAndGaloisDeterminants §4.2.

## Layer AG2.5: Local comparison, monodromy and purity

Compare the early integral polynomial with the constructed local correspondence. Varma’s congruences give semisimplified compatibility and monodromy dominance in the nonselfdual setting. The polarized tensor-square geometry, double weight spectral sequence and temperedness supply purity; pure WD uniqueness then upgrades the comparison to include `N`.

### Comparison of the early polynomial with normalized local Langlands

For spherical `π_v`, after EndoscopicTransferAndUnitaryTraceComparison Layer 10 fixes geometric Artin and the Harris–Taylor normalization, `rec(π_v|det|^{(1−n)/2})` is unramified with Frobenius polynomial equal to the AG2.0 integral Hecke polynomial. In Shin and Caraiani the source convention is
`L_n(σ)=rec(σ^∨⊗|det|^{(1−n)/2})`, so `L_n(π^∨)=rec^T(π)`, where
`rec^T(π)=rec(π⊗|det|^{(1−n)/2})`. The geometric source member for `π^∨` is the
attached member for `π`: `r_AG2(π)=R_source(π^∨)`. The square-root Satake extension cancels from the integral coefficients. `rec^T` uses this same geometric Artin normalization; geometric-to-arithmetic Frobenius takes the normalized reciprocal polynomial. This is a comparison with the constructed local correspondence, and is not an early prerequisite for raw geometry.

Throughout this target, use the chosen coefficient embedding and geometric Frobenius on both sides. Import the exact local reciprocity/Satake normalization from EndoscopicTransferAndUnitaryTraceComparison Layer 10; do not invert roots in just one side.

*Needs:* AG2.0: integral Frobenius polynomial; AG2.0: algebraic Galois characters; EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.27 and §10.30; IntegralHeckeAndGaloisDeterminants §3a.1.

(Sources: HLTT, Theorem 7.13 and notation §1, pp. 1–3, 227;
CT, §1.1 notation, accepted copy p.3; Shin, §2.3, p.10;
Caraiani-p-published, p.1598.)

**Checks.**

- In rank one, an unramified `χ` with `χ(ϖ)=2` has `L₁(χ)(Frob)=1/2`, whereas
  `L₁(χ^∨)(Frob)=2`. Substituting `χ` itself changes the attached polynomial.
- For `a_π=(3,1), a_{π^∨}=(−1,−3)`; the corrected source labels `k−1−a_{π^∨,k}`
  are (1,4), the multiset `{a_{π,i}+2−i}`, rather than the labels of the dual member.
- If the attached roots are `β_i`, the `ST/END` transfer datum selected for `π^∨` has roots `β_i`;
  its tensor square has roots `β_iβ_j`. Using the packet for `π` instead changes each
  factor to `q^{n−1}/β_i` and requires a dual and Tate correction.

### Varma’s semisimplified comparison and monodromy bound

For `E` totally real or CM and regular algebraic cuspidal `π` on `GL_n(A_E)`, the constructed `r_{p,ι}(π)` satisfies `WD(r|_{G_{E_v}})^ss≅ι^−1rec(π_v|det|^{(1−n)/2})^ss` for every `v∤p`, and `WD(r|_{G_{E_v}})^{F-ss}≺ι^−1rec(π_v|det|^{(1−n)/2})`. This is the final assembly: the split-place Weil trace identity and monodromy bound for the varying-twist `2n` family are the AG2.5 targets Local Weil traces through the HLTT congruences and Monodromy bounds through exterior trace identities; HLTT factor separation passes them to the rank-`n` factor; then remove the split-place and auxiliary-CM restrictions by the source extension/descent argument. The comparison retains no asserted equality of monodromy for arbitrary nonselfdual `π`.

Throughout this target, regular algebraic cuspidal; every `v∤p`; the source parameter convention and the full isotypic dominance relation.

*Needs:* AG2.4: HLTT existence over arbitrary CM and totally real fields; AG2.4: Separating the two HLTT rank-`n` factors; AG2.5: The monodromy dominance interface; AG2.5: Integral Bernstein operators on the ordinary family; AG2.5: Local Weil traces through the HLTT congruences; AG2.5: Monodromy bounds through exterior trace identities; AG2.2: Attachment under cuspidal solvable base change; AG2.3: Effective Galois patching for automorphic base changes; AG2.5: Comparison of the early polynomial with normalized local Langlands.

(Sources: Varma, Theorem (1), p. 1; Proposition 8.1 and proof, pp. 18–19; Proposition 9.1 and proof, pp. 20–26; Theorem 10.2 and Corollary 10.3, §10, pp. 26–27.)

### Caraiani’s full away-prime compatibility

For CM `L` and regular algebraic CSD cuspidal `π` on `GL_n(A_L)`, every prime `ℓ` and every `v∤ℓ` satisfy `WD(r_{ℓ,ι}(π)|_{G_{L_v}})^{F-ss}≅ι^−1rec(π_v|det|^{(1−n)/2})` including `N`. Choose the source solvable extensions and two-signature tensor-square instance for `σ=π^∨` with `ξ_σ`, prove its monodromy purity, descend purity to the rank-`n` representation, and combine with the semisimple local comparison and temperedness. This is full WD compatibility under the polarized source hypotheses, not a conclusion for arbitrary nonselfdual HLTT systems or for `v|ℓ`.

Throughout this target, regular algebraic CSD cuspidal; `v∤ℓ`; source geometric normalization and coefficient embedding.

*Needs:* AG2.3: arbitrary regular existence; AG2.5: polarized family comparison; AG2.5: tensor-square geometry; AG2.5: Purity from the double weight spectral sequence; ArithmeticGaloisRepresentations Layer 2; AG2.5: local normalization comparison.

(Sources: Caraiani-away, Theorem 7.4 and proof, pp. 84–85.)

### Unramifiedness and the good-prime polynomial

For each constructed polarized or nonselfdual rank-`n r`, outside its specified finite excluded set and `v∤ℓ, r` is unramified and `det(X−r(Frob_v^geom))=ι^−1P_v(π_v;X)`. HLTT Corollary 7.14 proves this for `v|q≠ℓ` where `π` is unramified at every place above `q`, including field-ramified `q` after auxiliary descent. The polarized branch has the source’s unramified local-global comparison. The result includes every coefficient prime, while excluding the places above that prime.

Throughout this target, the relevant existence theorem and its actual common ramification set; `π` cuspidal regular algebraic, polarized only in the corresponding branch.

*Needs:* AG2.3: arbitrary regular existence; AG2.4: HLTT existence; AG2.5: local normalization comparison; AG2.0: integral Frobenius polynomial.

(Sources: HLTT, Corollary 7.14, p. 228.)

### The monodromy dominance interface

Use the WD and filtration carriers of ArithmeticGaloisRepresentations §§2.4–2.6 and define `MonodromyDominates`. For equal semisimple Weil representations, Varma’s `≺` compares decreasing Sp-block partitions separately in each irreducible Weil unramified-twist class: every initial sum on the first side is `≤` the second. The inertial relation `≺_I` compares the corresponding N-block partitions in every irreducible inertia isotype. Lemma 9.2 identifies them when the semisimple Weil parts agree. Equivalently all ranks of positive powers of each isotypic `N` on the first side are `≤` the second; one rank is insufficient.

Throughout this target, characteristic zero; finite inertial Weil image; same semisimple Weil part when identifying the two orders.

*Needs:* ArithmeticGaloisRepresentations §§2.4–2.6; Mathlib nilpotent linear algebra.

Source locators: Varma, §9, Definitions 1–2 and Lemma 9.2, pp. 20–21.

The API is `MonodromyDominates.refl`, `MonodromyDominates.trans`,
`monodromyDominates_iff_powerRanks` and `monodromyDominates_inertia`, with invariance under
WD isomorphism, coefficient extension and permutation of equal-type blocks. Only the
semisimple-Weil-equality domain identifies the Weil and inertia versions.

**Checks.**

- `[1,1] ≺ [2]` is strict: every positive-power rank for the zero `N` is at most the
  corresponding rank of one length-two block.
- `[4,2]` and `[3,3]` both give rank 4 for `N`, but their `N³` ranks are 1 and 0. One rank
  cannot define the order or determine the WD equivalence class.
- The empty partition in rank zero dominates itself. Different semisimple Weil types
  do not acquire an equivalence merely because their block partitions coincide.

### Integral Bernstein operators on the ordinary family

At the unitary split places `v∤p`, the Bernstein centres of the finitely many components permitted by the fixed local level supply operators whose value at a classical or ordinary cusp eigensystem `Π` is `tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ)`, for every `σ∈W_{F_v}`. After the source common denominator `d(z)`, these operators preserve the integral cusp-section lattices used in the Hasse congruences. The bound idempotent `e_{Π,B}` selects points whose local parameter is dominated by that of the target `Π`.

Throughout this target, finite union of actual Bernstein components at the split local `G_n` factor; fixed level; source integral denominator and idempotent.

*Needs:* AG2.4: HLTT ordinary boundary geometry; AG2.4: Hasse weight-changing congruences; SmoothRepresentationsOfLocalGroups SR.3; SmoothRepresentationsOfLocalGroups SR.5; EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.27 and §10.30.

(Sources: Varma, §7.2, integral Bernstein operators, pp. 16–17; §9.1, `e_{Π,B}`, pp. 24–25.)

### Local Weil traces through the HLTT congruences

Include the denominator-corrected Bernstein operators in the uniform classical-to-ordinary Hecke congruences. The resulting continuous degree-2n pseudocharacter has `T(σ_v)=tr rec(BC(Π)_v|det|^{(1−2n)/2})(σ_v)` at every split `v∤p` and every Weil element `σ_v`. Semisimple reconstruction therefore identifies the entire semisimple local Weil representation, not just its good unramified Frobenius polynomial.

Throughout this target, the integral operators, arbitrary-modulus congruences, common ramification set and characteristic-zero pseudocharacter continuity.

*Needs:* AG2.5: Integral Bernstein operators on the ordinary family; AG2.4: uniform Hecke congruences; AG2.4: continuous ordinary Hecke determinant limit; IntegralHeckeAndGaloisDeterminants §4.2; ArithmeticGaloisRepresentations Layer 2; AG2.5: full away-prime comparison.

(Sources: Varma, Proposition 8.1 and proof, pp. 18–20.)

### Monodromy bounds through exterior trace identities

For the interpolated `2n` representation at a split place, `WD(r(Π)_v)^{F-ss}≺rec(BC(Π)_v|det|^{(1−2n)/2})`. The source detects inertial nilpotent type by all exterior-power vanishing identities for powers of `b_{η,ζ}=g_η−ζa_η`, and transfers the associated pseudocharacter functions `B_{η,ζ}^{k,j}` across the integral bound idempotent. This proves rank inequalities for every monodromy power in every inertia isotype, then Lemma 9.2 gives the Weil order.

Throughout this target, semisimple global representation; nondegenerate trace pairing on its semisimple image algebra; all `η, p`-power `ζ, j,k>0` of Varma Lemma 9.7; the target Bernstein idempotent.

*Needs:* AG2.5: monodromy dominance; AG2.5: Local Weil traces through the HLTT congruences; AG2.5: Integral Bernstein operators on the ordinary family; IntegralHeckeAndGaloisDeterminants §4.2; RepresentationTheory/SemisimpleAlgebras / layer 2 artin wedderburn assembled with uniqueness.

(Sources: Varma, Lemma 9.7, Lemma 9.8 and proof of Proposition 9.1, pp. 24–26.)

### The tensor-square geometric instance

For the source auxiliary CM extensions `F/F′/L` and `π` with local Iwahori invariants, choose the compact unitary datum with signatures `(1,n−1)` at two distinguished real places and `(0,n)` at the others. Its dimension is `2n−2`. Apply the source construction to the base change of `σ=π^∨`, with its packet, `GL₁`
character and coefficient `ξ_σ` from the AG2.2 adapter. Its coefficient projector with
`D=4n−3` cuts out an actual middle-degree multiplicity space `S`, a continuous representation
of `G_{F′}` that is kept as it stands. After the scalar character correction of Caraiani §7,
Chebotarev at the good places and the good-place polynomials of `r=r_AG2(π)` give
`S^ss ≅ ((r|G_{F′})⊗(r|G_{F′}))^{⊕a}` with `a>0`. Neither Galois semisimplicity of `S` nor a
Weil–Deligne identification of `S` with the tensor square follows from this; semisimplicity of
the Hecke action on cohomology is a different statement. The integral model is locally étale over a product of two semistable charts at the chosen split prime.

Throughout this target, the solvable extensions and two split distinguished `p`-adic places of the proof of Theorem 7.4; cuspidality preserved, relevant local components Iwahori fixed and exact source coefficient twists.

The required API is:

- `TensorSquareInstance.signature`: Exactly two nondefinite signatures give dimension `2n−2`.
- `TensorSquareInstance.charts`: The local model is étale over the product of the two specified semistable charts.
- `TensorSquareInstance.constituent`: After the source scalar correction the selected actual middle cohomology `S` satisfies `S^ss ≅ ((r|G_{F′})⊗(r|G_{F′}))^{⊕a}` for some `a>0`.
- `TensorSquareInstance.actions`: The Hecke algebra acts on `S` through the selected eigensystem; the Weil action and monodromy of `S` at the split place are those of the actual cohomology and reach `r⊗r`, whose monodromy is `N⊗1+1⊗N`, only through **Purity transfer from a semisimplified multiple**.

**Checks.**

- `n=2` gives a two-dimensional Shimura variety and a rank-four tensor-square constituent

- The single-signature Shin variety cannot replace the dimension-`2n−2` model

- For nonzero tensor factors `V₁,V₂` with `N₁=0` and `N₂≠0`, total monodromy is `1⊗N₂≠0`. For the tensor square with `N=0`, total monodromy is zero.

- For `q∈F′^×` with `v(q)≠0` at a place `v∤ℓ`, the Kummer extension `S_q` of `ℚ_ℓ` by `ℚ_ℓ(1)` has `S_q^ss ≅ ℚ_ℓ(1)⊕ℚ_ℓ`, with zero monodromy at `v`, while the monodromy of `S_q` at `v` is nonzero: an isomorphism of semisimplifications transports neither semisimplicity nor local monodromy.

*Needs:* AG2.3: arbitrary regular existence; AG2.1a: corrected Kuga–Sato coefficient projector; PELModuli M4; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4; LefschetzPencilsAndVanishingCycles LPV.6; ArithmeticGaloisRepresentations Layer 2.

(Sources: Caraiani-away, §7 setup and proof of Theorem 7.4, pp. 80–85.)

### Nearby cycles of the two-chart instance

Construct Caraiani Propositions 3.9, 4.6 and 4.10 for the specified two-chart instance, including the derived product comparison, monodromy and filtered stratum maps. Consume LPV.0–LPV.1 for nearby-cycle foundations and LPV.6 only for perversity. On the tensor-square instance `RΨ` of the product is the derived tensor product of the two factors, and `N=N₁⊗1+1⊗N₂`. The kernel and image filtrations of the total monodromy operator `N` yield Corollary 4.29’s double-filtered stratum spectral sequence, compatible with the corrected projector, Hecke and Weil actions.

Throughout this target, the actual étale-local product of semistable charts, all shifts and Tate twists, and coefficient projector equivariance. Characteristic-zero `ℓ`-adic coefficients `Λ=ℚ_ℓ` or `ℚ̄_ℓ` for the product argument of §4.2; the two charts are semistable over the same trait.

*Needs:* AG2.5: tensor-square geometry; LefschetzPencilsAndVanishingCycles LPV.0–LPV.1 and LPV.6; AG2.1a: corrected Kuga–Sato coefficient projector.

(Sources: Caraiani-away, Proposition 3.9 (p. 24), Proposition 4.6 (p. 29), Proposition 4.10 (p. 33) and Corollary 4.29 (p. 51).)

**Checks.**

- With a smooth first factor its nearby cycles have `N₁=0`; the product comparison reduces
  to pullback/tensor with that factor and total monodromy is `1⊗N₂`.
- Two nodal semistable factors with characteristic-zero `ℓ`-adic coefficients give
  `N=N₁⊗1+1⊗N₂`, including the cross term `2N₁⊗N₂` in `N²`. Dropping one factor loses it.
- With one factor the trait itself, the filtration recovers Proposition 4.6’s stratum
  summands with shifts `−(k+l)` and twists `−l`. These rational monodromy filtrations are
  not asserted over arbitrary torsion coefficient rings.


### Signed virtual stratum and Igusa calculation

Under the exact two-signature datum, selected `Π^{1,S}` packet, local Iwahori levels and
`ST/END` transfer hypotheses of Caraiani §5, construct the signed virtual
Igusa/Mantovan calculation in the proof of Theorem 5.8 for `Y_{S,T}`. Compute the Weil classes of the selected
alternating stratum cohomology and their weights and signs, without assuming
temperedness or single-degree concentration. Retain the source `GL₁` factors, Tate
shifts and the packet for `σ=π^∨` when realizing the AG2 member. This is a
characteristic-zero virtual calculation; it asserts no torsion concentration.

**Checks.**

- For `|S|=|T|=1`, the central stratum degree is `2n−2`, the dimension of the base.
- In the non-tempered alternative of Theorem 5.8, the adjacent-weight terms and the
  central-weight terms have the same coefficient sign. Alternating cohomological signs
  would require opposite signs; this contradiction is used in the temperedness target.
- A zero selected Igusa term contributes zero to the virtual sum. Replacing a nonzero
  alternating sum by its dimension alone loses the sign test.

*Needs:* AG2.5: tensor-square geometry;
AG2.1b: stable/endoscopic Igusa traces;
AG2.1b: compact global Mantovan formula;
EndoscopicTransferAndUnitaryTraceComparison §§7.6–7.10 and Layer 14.

(Source: Caraiani-away, Theorem 5.8 and proof, pp.60–64.)

### Temperedness of regular unitary-type cuspidal forms

Every regular algebraic conjugate-self-dual cuspidal `π` on `GL_n` over CM `L` has tempered local components at all finite places. With every coefficient conjugate accounted for, the normalized local parameter is pure of weight `n−1` in geometric normalization. Use Theorem 5.8’s signed virtual calculation and its weight/sign contradiction to
prove Corollary 5.9, then descend temperedness along the chosen solvable extensions.
This is the automorphic purity input to the monodromy comparison; arbitrary nonselfdual `π` is outside this theorem.

Throughout this target, regular algebraic CSD cuspidal, source solvable-base-change descent and all coefficient embeddings. Corollary 5.9 is stated for `n≥2`. For `n=1` the assertion follows separately from the conjugate-self-dual algebraic Hecke-character dictionary and class field theory.

*Needs:* AG2.5: signed virtual stratum calculation; AG2.2: Attachment under cuspidal solvable base change; EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.27 and §10.30; ArithmeticGaloisRepresentations Layer 2; AG2.0: algebraic Galois characters.

(Sources: Caraiani-away, Corollary 5.9, pp. 64–65, and Theorem 1.2, p. 2.)

### Cohomology of the two-chart strata

For the source `Π^{1,S}`-isotypic part, the stratum `Y_{S,T}` of the two-chart integral model
has coefficient cohomology zero outside `j=2n−|S|−|T|`. Prove Caraiani Proposition 5.10 by
repeating the virtual calculation using the tempered local representation; the
selected graded pieces have the resulting explicit Igusa/Mantovan traces. Retain the
exact §5 two-signature datum, selected packet, local Iwahori levels and `ST/END` transfer
hypotheses, with characteristic-zero coefficients.

**Checks.**

- For `|S|=|T|=1`, only degree `2n−2` can survive.
- For `|S|=|T|=n`, only degree zero can survive on the zero-dimensional stratum.
- Before temperedness, the signed virtual calculation does not assert this
  concentration; no such vanishing is inferred for torsion coefficients.

*Needs:* AG2.5: signed virtual stratum calculation;
AG2.5: temperedness.

(Source: Caraiani-away, Proposition 5.10 and proof, pp.65–66.)

### Purity from the double weight spectral sequence

Caraiani Proposition 7.2 supplies the double-filtered nearby-cycle spectral sequence for the `Π^{1,S}` part of the corrected Kuga tower, with `N` taking `Gr_l Gr_k` to `Gr_{l+1} Gr_{k−1}`. Its secondary stratum sequence has `|S|=j+s, |T|=j+k+l−s+1` and coefficient degree `m−2j−k−l+1` with twist `−j−k+1`. Stratum concentration forces `m=2n−2`, gives the source degeneration, and proves WD of the selected `H^{2n−2}` is pure of weight `m_ξ−2t_ξ+2n−2`.

Throughout this target, exact stratum purity and the two-chart nearby-cycle comparison, equivariant projector and coefficient twists; no unproved general weight-monodromy conjecture is assumed.

*Needs:* AG2.5: Nearby cycles of the two-chart instance; AG2.5: Cohomology of the two-chart strata; DeligneWeightsAndPurity DWP.8; ArithmeticGaloisRepresentations Layer 2.

(Sources: Caraiani-away, Proposition 7.2 and Corollary 7.3, pp. 82–84.)

### Purity transfer from a semisimplified multiple

The target `semisimplifiedMultiplePurityTransfer` has the following hypotheses and conclusion.

Let `M/L` be a finite extension of number fields and `R : G_L → GL_n(ℚ̄_ℓ)` a continuous
semisimple representation that is de Rham at every place above `ℓ` and globally pure of weight
`k`: at all but finitely many finite places `x` it is unramified and every eigenvalue of
`R(Frob_x)` is a Weil `q_x^k`-number. Let `S : G_M → GL_{an}(ℚ̄_ℓ)` be continuous with
`S^ss ≅ (R|G_M)^{⊕a}` for some `a>0`, and let `w` be a finite place of `M` over the place `v` of
`L`; when `w|ℓ`, `S|G_{M_w}` is potentially semistable and `WD` is Fontaine's functor. If
`WD(S|G_{M_w})` is pure of weight `k`, then `WD(R|G_{L_v})` is pure of weight `k`. Prove first
TY Lemma 1.4(5)–(6): in a Frobenius-semisimple WD representation pure of weight `k`, a WD
subobject is a direct summand exactly when its top exterior power is pure of weight `k` times
its rank, and a WD filtration whose graded pieces have pure top exterior powers of these
weights splits into pure graded pieces. Then decompose `R|G_M=⊕R_i` into irreducibles; each
`det R_i` is a de Rham character, globally pure of weight `k·dim R_i`, hence by the
algebraic Hecke-character dictionary strictly pure of that weight at every finite place.
A Jordan–Hölder filtration of `WD(S|G_{M_w})^{F-ss}` with graded pieces the `WD(R_i|G_{M_w})`
splits, so `WD(R|G_{M_w})^{F-ss}` is pure; descend through Frobenius semisimplification and
the finite extension `M_w/L_v` by TY Lemma 1.4(1)–(2). This is the step from the actual
geometric cohomology to the attached representation: the semisimplification identity alone
transports no monodromy.

Throughout this target, `R` semisimple, globally pure and de Rham at every place above `ℓ`;
`a>0`; `S` the actual representation, not its semisimplification; potential semistability of
`S` at `w` when `w|ℓ`.

**Checks.**

- For the Kummer extension `S_q` of the tensor-square Checks, at `v` with `v(q)≠0` the
  representation `WD(S_q|G_{F′_v})` is pure of weight `−1`, but `R=ℚ_ℓ(1)⊕ℚ_ℓ` is not globally
  pure and `WD(R|G_{F′_v})` has `N=0`, so it is not pure: global purity of `R` cannot be dropped.
- For rank-one `R` pure of weight `k` and `S` an extension of `R|G_M` by itself, every
  Frobenius eigenvalue on `WD(S|G_{M_w})` has weight `k`, so purity forces `N=0` and, after
  Frobenius semisimplification, a split sum, as Lemma 1.4(6) predicts.
- The conclusion is purity at `v`, which descends along `M_w/L_v`; an isomorphism class does
  not: for `M_w/L_v` quadratic, the trivial character and the nontrivial character of
  `Gal(M_w/L_v)` are both pure of weight zero and agree on `W_{M_w}`.

*Needs:* ArithmeticGaloisRepresentations §2.6, weights and purity and indecomposable
Weil–Deligne representations; AG2.0: algebraic Galois characters; AG2.P: finite-coefficient
periods and comparison.

(Sources: TY, Lemma 1.4(1),(2),(5),(6) and Lemma 1.7 with proof, pp.6–9; Caraiani-away,
Published typeset author copy `lgc1.pdf`, proof of Theorem 7.4, pp.2410–2411.)

### Pure Weil–Deligne comparison up to equivalence

For the semisimple Weil representation shared by the Galois and automorphic sides, TY Lemma 1.4(4) determines at most one pure WD extension up to equivalence. Using ArithmeticGaloisRepresentations §2.6’s purity and filtration, prove `pureWD_unique`, finite-extension equivalence and tensor-square purity detection by the full primitive-string decomposition. Apply it only after purity of the Galois side and tempered purity of the automorphic side are proved. On the Galois side, apply **Purity transfer from a semisimplified multiple** with `L=F′`, `M=F`, `R=(r|G_{F′})⊗(r|G_{F′})` and `S` the actual cohomology of the tensor-square instance twisted by the inverse of the source character `ψ`: `R` is semisimple as a tensor product of semisimple representations in characteristic zero, globally pure of weight `2(n−1)` because the good Frobenius eigenvalues of `r` are tempered Satake parameters by **Temperedness of regular unitary-type cuspidal forms**, and de Rham by `coefficientHodgeComparisonThroughDescent`, which uses only the CH construction and the geometric period comparison and none of the comparisons of this layer. `WD(S)` is pure by the double weight spectral sequence. The transfer gives tensor-square purity of `r`, the primitive-string detection gives purity of `r` at the split place, and finite-extension invariance and uniqueness give the full WD comparison. Do not replace purity with maximal rank of `N`: maximal rank alone does not determine the WD equivalence class.

Throughout this target, characteristic-zero algebraically closed field and semisimple Weil part; equivalence means a Weil-equivariant isomorphism carrying one `N` to the other.

*Needs:* ArithmeticGaloisRepresentations §2.6; AG2.5: purity transfer from a semisimplified multiple; AG2.5: temperedness; AG2.5: purity from the double weight spectral sequence; AG2.6: Hodge comparison through deformation and descent.

Source locators: TY, Lemma 1.4(2)–(4), proof of `(4)`, pp. 6–7, and Lemma 1.7, p. 9; Caraiani-away, Published typeset author copy `lgc1.pdf`, proof of Theorem 7.4, pp. 2410–2411; the preprint gives a shorter argument on p. 85.

### The polarized local comparison from the definite family

For the arbitrary-regular polarized CH representation, at every `v` away from the coefficient prime the Frobenius-semisimplified WD parameter is dominated by the normalized local parameter of `π`. In particular their semisimple Weil parts agree. This is CH Theorem 3.2.3(a′), obtained from the tame Bernstein/monodromy restrictions in Theorem 2.3 and effective patching. It precedes the pure-WD upgrade and supplies that upgrade’s semisimple comparison without using Varma’s general nonselfdual theorem.

Throughout this target, cH General Hypotheses 1.1, the definite-unitary interpolation and source Bernstein restrictions; extend essentially polarized forms by the prescribed character twist.

*Needs:* AG2.3: arbitrary regular existence; AG2.3: definite-unitary eigenvariety instance; AG2.3: family determinant; AG2.3: effective patching; AG2.3: solvable-index induction; ArithmeticGaloisRepresentations Layer 2; SmoothRepresentationsOfLocalGroups SR.3; IntegralHeckeAndGaloisDeterminants §4.2.

(Sources: CH, Theorem 2.3, tame-family paragraph, p. 8; Theorem 3.2.3(a′), pp. 11–12.)

### Published RACSDC comparison specializations

For the RACSDC systems, specialize the normalized away-prime compatibility to the relevant weight-zero representations of Liu et al. Proposition 3.2.4 and to BCGP25 RACSDC paragraph following equation (1.8.21). Published CS Theorem 5.5.4 supplies its polarized rank-`n` system and away-prime comparison; Corollary 5.5.5 treats the discrete sum separately. The `p`-adic WD comparison, de Rham assertions, coefficient conjugation and strong coefficient field are AG2.6 exports. Liu Hypothesis 3.2.10 is a conditional identification of a Shimura isotypic middle degree, not an unconditional realization for every `π`; Proposition 3.2.11’s stated range and its unpublished KSZ input are retained.

Throughout this target, relevant means the CSD cohomological infinity type of Liu Definition 1.1.3; the chosen automorphic coefficient field and embeddings; no universal use of Hypothesis 3.2.10.

*Needs:* AG2.5: full away-prime comparison; AG2.0: Rationality of the good Hecke polynomials; AG2.2: Caraiani–Scholze discrete normalization.

(Sources: Liu, Definition 1.1.3, p. 110; Proposition 3.2.4, Hypothesis 3.2.10 and Proposition 3.2.11, pp. 145–146 (PDF pp. 4, 39–40); BCGP25, Unnumbered RACSDC `GL_n` summary after equation (1.8.21), pp. 14–15; CS, Theorem 5.5.4, pp. 744–745; CS, Remark 5.5.6, p. 746, and §5.6, pp. 748–750.)

### Comparison with the classical `GL₂` constructions

For a classical or Hilbert modular eigenform in the overlap of the source hypotheses, compare the constructed rank-two automorphic `r` with the independently constructed classical or Hilbert representation after the explicit dual/cyclotomic and geometric-versus-arithmetic conversion. Equality of the good polynomials implies semisimple isomorphism. In the local range where the independent geometric construction proves its comparison, transport that comparison through the isomorphism. The independent rank-two construction is a comparison input, not an input to arbitrary-rank existence or raw geometry.

Throughout this target, both independently constructed representations exist; identical weight, nebentype, embedding and Frobenius convention after conversion; only the proved local range of the independent member is used.

*Needs:* AG2.5: Unramifiedness and the good-prime polynomial; IntegralHeckeAndGaloisDeterminants §3a.1; AG2.P: independent classical/Hilbert members; ArithmeticGaloisRepresentations Layer 5.

(Sources: CH, §3.2, pp. 9–12; §4, Hypotheses 4.1 and Theorem 4.2, p. 13.)

### Examples

For `F=diag(1,2)`, both `N=0` and `N=E₁₂` satisfy `FN=(1/2)NF` and have the same semisimple Weil action, but no invertible matrix intertwines zero with nonzero monodromy. The six-dimensional example below separates equal first ranks as well.

### Dependencies

AG2.0–AG2.4; AG2.6: Hodge comparison through deformation and descent, for de Rhamness in the purity transfer; ArithmeticGaloisRepresentations §§2.4–2.6; LefschetzPencilsAndVanishingCycles LPV.6; EndoscopicTransferAndUnitaryTraceComparison Layers 10 and 14; DeligneWeightsAndPurity DWP.7–DWP.8.

## Layer AG2.6: Coefficient-prime comparison and compatible systems

Apply period comparison to the actual projected summand, then extend through bounded families and solvable descent. The polarized and nonselfdual CM conclusions have different strengths. Assemble their members into the supplied `AutomorphicSystemData` carrier, keeping purity and polarization as branch predicates. Finally compare rank-two, tensor and `GSp₄` specializations.

The at-`ℓ` tensor-square realization is a separate geometric input from the away-prime AG2.5 instance. Using CrystallineCohomology CR.6’s log-crystalline complexes, AG2.6 constructs the two-boundary sequence and proves projected stratum concentration. AHTW additionally requires quantitative local Shimura-cohomology annihilators (Theorem 2.5.7), bounded potentially semistable/crystalline pseudodeformation quotients with arbitrary residual multiplicities (Theorem 3.3.6), and the bounded-torsion/non-Siegel boundary argument. Generic-only concentration and fixed-representation deformation rings do not supply these interfaces; no general formal GAGA theorem is assumed. Its generic maximal-orbit argument is additional to Varma's partition order. Liu's minimal-field geometric identification retains Hypothesis 3.2.10; outside the proved low-rank range of Proposition 3.2.11 it remains conditional.

### Weak, very weak and extremely weak automorphic data

On `AutomorphicSystemData` supplied by SmallRamificationAndAbelianVarietyBaseCases §5.0d, define `VeryWeak`
and `ExtremelyWeak` as additional strength predicates. Both retain the good-place
unramifiedness and polynomial identities of `Weak`, and the determinant Hodge sums for
all members. VeryWeak additionally requires, outside a set of rational coefficient primes
of Dirichlet density zero, crystallinity at every `v|ℓ` for every `λ|ℓ` and the full labelled
Hodge multisets for every coefficient embedding. ExtremelyWeak drops this density-one
clause. Prove Weak `⇒` VeryWeak `⇒` ExtremelyWeak on the same data. No higher-rank converse
is asserted. Prove preservation under the supplier’s raw operations with their stated domains;
finite restriction includes the newly ramified places in the exceptional set.

**Checks.**

- Rank-two metadata `{0,3}` and `{1,2}` have the same determinant Hodge sum 3.
  ExtremelyWeak cannot identify these multisets, whereas Weak retains which occurs.
- VeryWeak tests every coefficient place above each rational prime outside its
  density-zero exceptional set; testing only one `λ|ℓ` does not suffice.
- Weak also tests every `λ` over the exceptional rational primes, so the density-one
  clause by itself cannot establish Weak.

*Needs:* SmallRamificationAndAbelianVarietyBaseCases §5.0d;
AG2.P: Arbitrary-rank compatible data and operations;
AG2.P: finite-coefficient periods.

(Sources: ACC+, §7.1, pp.1084–1086.)

### Comparison on the geometric automorphic summand

For the smooth proper PEL/Kuga–Sato realization supplied by AG2.1a, after the stated Schur projector, automorphic isotypic projector and Tate twist, apply `D_cris` and `D_dR` to the actual cohomological summand. The comparison maps are restrictions of geometric comparison and commute with the projectors and cup products. For the member attached to `π` use the `ST/END` transfer datum selected for `σ=π^∨` and `ξ_σ` of AG2.2,
including its `GL₁/norm` corrections. At good reduction the summand is crystalline; its
filtered de Rham realization gives `HT_τ={a_{π,τ,i}+n−i : 1≤i≤n}`. At strictly semistable reduction use the filtered `(φ,N)` comparison, with the same projectors. The passage is through a geometric realization, not an assumption that an arbitrary attached representation has period dimensions `n`.

Throughout this target, aG2.1a first supplies the raw smooth proper PEL or Kuga–Sato realization, algebraic coefficient representation, cohomological degree, commuting Schur/isotypic idempotents, multiplicity and Tate twist. A statement of good-place attachment by itself does not supply these geometric data. The claimed good or strictly semistable reduction belongs to that realization and the specified local model. Comparison is applied to its cohomology before any admissibility conclusion about the attached representation.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.1a; AG2.0: Hodge multiset; AG2.P: finite-coefficient periods and comparison; AG2.1a: Shin raw-cohomology adapter; AG2.1a: projector degree identity.

(Sources: CH, §1.4–1.5, Theorem 1.4 and formula (1.6), pp.5–7.)

### Geometric interpretation of the central-character dictionary

Prove `centralCharacterGeometricComparison` for the smooth proper Shin PEL/Kuga realization
with the corrected projector and the coefficient recipe of AG2.0. Its coefficient sheaf
has weight `w(ξ)`, and `H^r(X_U,L_ξ)` has weight `r+w(ξ)`. On the selected actual cohomological
constituent under Shin §6.2’s hypotheses, the labelled filtered de Rham degrees are
`j_κ(k)=k−1−a(ιξ)_{ικ,k}−a₀(ιξ)`. In Case ST take all `k=1,…,n`; in Case END take
the source’s subset selected by `e₁=e₂` or `e₁=−e₂`. Corollary 6.7’s multiplicities are `C_G`
before extraction and one after dividing the actual `C_G` copies. Retain `ψ` and its
character twist when passing to the normalized rank-`n` or selected endoscopic constituent; removing that twist changes the labels. The geometric
period comparison and the coefficient-cohomology identity identify these with the
algebraic dictionary’s formal labels. For the AG2 member of `π`, substitute `σ=π^∨`
throughout the selected packet and coefficient recipe, as in AG2.2. After the `GL₁` and norm
corrections these degrees become `k−1−a_{σ,κ,k}=a_{π,κ,n+1−k}+k−1`; the final multiset
is the one for `π`, not for `σ`.

**Checks.**

- `ξ=1` has coefficient weight zero; `H^r` has weight `r`, not zero.
- `ξ=ν^t` changes the coefficient weight by `−2t` and the projected labelled degrees by `−t`.
- At `t=1` and `k=1` the label is `−1`. Dropping the central exponent would incorrectly give 0.

*Needs:* AG2.0: algebraic similitude dictionary;
AG2.1a: coefficient-cohomology identity;
AG2.1b: actual constituents;
AG2.P: finite-coefficient periods;
DeligneWeightsAndPurity DWP.7; AG2.6: geometric comparison.

(Sources: Shin, Proposition 5.3(iii), p.35, and §6.2, Corollary 6.7, p.49.)

### Hodge comparison through deformation and descent

The target `coefficientHodgeComparisonThroughDescent` has the following hypotheses and conclusion.

For a conjugate-self-dual cohomological cuspidal `Π` over a CM field, the Chenevier–Harris construction passes de Rham, the prescribed regular Hodge multiset, crystallinity at spherical places and semistability at Iwahori places through their bounded family and cyclic patching. Theorem 2.3 varies weights at one chosen coefficient-prime place `v_0` and establishes admissibility at the other coefficient-prime places. Theorem 3.2.3 removes this exclusion by solvable base change and descent, arranging at least two coefficient-prime places. A convergent sequence of de Rham representations with unbounded Hodge weights is not the statement.

*Needs:* AG2.6: geometric period comparison; AG2.3: definite-unitary eigenvariety instance; AG2.3: family determinant; AG2.3: effective patching; AG2.3: solvable-index induction; LocallyAnalyticDistributions §§4.2, 4.15–4.16; AG2.P: finite-coefficient periods and comparison; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: CH, Theorem 2.3; §3.1; Theorem 3.2.3, pp.8–12.)

### Polarized admissibility at the coefficient prime

The target `polarizedCoefficientPrimeAdmissibility` has the following hypotheses and conclusion.

Let `F` be CM and `(π,χ)` regular algebraic cuspidal polarized of weight a. For every `λ|ℓ` and `v|ℓ, r_{π,λ}|G_{F_v}` is de Rham with `HT_τ={a_{τ,i}+n−i}`. If `π_v` is spherical it is crystalline; if `π_v` has Iwahori-fixed vectors it is semistable. In the Iwahori case BLGGT Theorem 2.1.1(4) gives full Frobenius-semisimple WD comparison with `rec(π_v|det|^{(1−n)/2})`. The full comparison for general `π_v` is the separate Caraiani theorem below.

*Needs:* AG2.6: Hodge comparison by descent; AG2.0: Hodge multiset; ArithmeticGaloisRepresentations §7.4; AG2.P: finite-coefficient periods and comparison.

(Sources: BLGGT, Theorem 2.1.1(3)–(4), pp.33–34.)

### The coefficient-prime two-signature model

For an even-rank `n≥2` CSD cohomological cuspidal `π` over `L` as in Caraiani-p §2, construct its
auxiliary solvable CM extensions `F/F′/L` with `F′=EF₁, ℓ` split in `E, p|ℓ` split as `p₁p₂` in `F`,
local Iwahori invariants, preserved cuspidality and the stated ramification-splitting
conditions. Construct the compact PEL model with signature `(1,n−1)` at the two embeddings
corresponding to `p₁,p₂` and `(0,n)` elsewhere, its Iwahori integral model and universal Kuga
powers. Its generic dimension is `2n−2`. Give the corrected coefficient projector with `D=4n−3` and the
selected packet for the base change of `σ=π^∨` and coefficient `ξ_σ` from the AG2.2
adapter. Its selected actual cohomology `S` is kept as it stands; after the scalar character
and Tate twist of §2, `S^ss ≅ ((r|G_{F′})⊗(r|G_{F′}))^{⊕a}` with `r=r_AG2(π)` and `a>0` the actual
cohomological multiplicity, and no Weil–Deligne identification of `S` itself with the tensor
square is asserted. Prove properness and the étale-local charts with two
independent equations `∏X_i=ϖ` and `∏Y_j=ϖ` for a uniformizer `ϖ`, with additional smooth coordinates for the
Kuga powers. Equip them with the fine saturated vertical log structure over the standard
log DVR; prove log smoothness and Cartier type of the special fibre before forming the
log-crystalline spectral sequence. Construct both families of boundary divisors and their
closed smooth intersections, with dimensions `2n+m−i−j` for `m` additional smooth coordinates.
The model is a product of semistable charts, not asserted to be strictly semistable itself.
Prove the structured log-smooth period comparison for this model and its projector under
these hypotheses, using the comparison preceding Corollary 2.3 in the published source.
Retain Galois, Frobenius, filtration and `N_HK/e_K=N_p`. A strictly semistable alteration
uses R34.3 only after its descent and correspondence identifications are supplied.
(Sources: Caraiani-p, §2, pp.2–6 and §3.1, pp.7–9;
Caraiani-p-published, §2 and §3A, pp.1600–1611.)

**Checks.**

- For `n=2` the base dimension is 2 and the tensor-square constituent has rank 4; the
  single-signature Shimura curve cannot supply the two divisor families.
- In a chart with two nodal factors, the two equations share `ϖ` but their divisors have
  independent indices. Replacing the second family by the first gives the wrong strata.
- Removing the Iwahori condition or the split `p₁,p₂` prescription does not provide these
  integral charts. At a smooth factor its monodromy is zero. Odd rank uses the Shin-regular
  coefficient-prime comparison, rather than this even-rank PEL existence argument.

*Needs:* PELModuli M0–M4; AG2.3: arbitrary regular existence;
AG2.1a: corrected coefficient projector;
AG2.5: two-chart strata;
CrystallineCohomology CR.6; WeightsInEtaleCohomology R34.3;
AG2.P: period interfaces.

### Log-crystalline purity of the automorphic summand

The target `logCrystallineAutomorphicPurity` has the following hypotheses and conclusion.

In Caraiani’s two-boundary semistable PEL model and its Kuga–Sato projector, the actual `Π`-isotypic log-crystalline summand `S`, whose semisimplification is a multiple of the tensor-square representation, is pure as a WD representation (Proposition 5.1). Use the two-index strata `Y^(r,s)` and Theorem 4.6’s generalized log-crystalline weight spectral sequence, with Frobenius, twists and the residue realization of `N`. Purity follows after proving the relevant projected stratum cohomology is concentrated on the required diagonal; neither semistability nor the existence of the spectral sequence alone implies purity.

Throughout this target, the even-rank AG2.6 coefficient-prime two-signature model includes the two distinguished coefficient-prime places, the closed two-index strata, cohomological multiplicity and coefficient-system projector/Tate twist. Its projected stratum concentration is proved before degeneration and purity are inferred. The log model used for comparison is proper, fine and saturated, log smooth and vertical over the standard log DVR, with special fiber of Cartier type. The second boundary uses its own divisors and `s` factors. With `m` smooth local coordinates, a nonempty (i,j)-stratum has dimension `2n+m−i−j`; carry this dimension and the Kuga–Sato/Tate shifts into the spectral sequence.

*Needs:* AG2.6: geometric period comparison; CrystallineCohomology CR.6; WeightsInEtaleCohomology R34.3; AG2.6: coefficient-prime two-signature model.

(Sources: Caraiani-p, §§2–4; Theorem 4.6, Remark 4.7, Proposition 5.1, pp.31–32; Caraiani-p-published, §3A, pp.1609–1611, including Lemma 3.2; comparison hypotheses immediately before Corollary 2.3, p.1609.)

### The extremely regular irreducibility input

For `n≥2`, `ExtremelyRegularIrreducibility n` is the following proposition: for every
imaginary CM field `F₁` and every regular algebraic conjugate-self-dual cuspidal `Π₁` of
`GL_n(𝔸_{F₁})` whose weight is extremely regular in the sense of AG2.0, there are a prime
`ℓ′` and `ι′:ℚ̄_{ℓ′}≅ℂ` with `r_{ℓ′,ι′}(Π₁)` irreducible. It is a hypothesis of the
coefficient-prime targets below, not a target of this roadmap. BLGGT Theorem 5.5.2 proves it,
with a Dirichlet-density-one set of `ℓ′`, by applying potential automorphy and the order of the
Rankin–Selberg pole at `s=1` to the irreducible constituents of `r_{ℓ′,ι′}(Π₁)`; that
potential-automorphy argument uses only the Iwahori comparison of **Polarized admissibility
at the coefficient prime**. A roadmap proving the density-one theorem discharges this
hypothesis and obtains the unconditional forms of the targets that carry it.
(Sources: BLGGT, §2.1, p.32, definition of extreme regularity; Theorem 5.5.2 and proof,
pp.81–82; BLGGT-lp-II, §1, p.5, and §2, pp.6–7, for its use.)

**Checks.**

- The shifted labels `{0,1,2,3}` are not extremely regular, since `0+3=1+2`; the labels
  `{0,1,3,7}` are, since their one-, two- and three-element subsets have pairwise distinct sums.
- For `F₂/F₁` quadratic CM and a character `ψ` with `ψ≠ψ^σ`, the induced
  `Ind_{G_{F₂}}^{G_{F₁}} ψ` is irreducible while its restriction to `G_{F₂}` is `ψ⊕ψ^σ`:
  the proposition concerns `F₁`, and irreducibility after restriction needs the separate
  linear-disjointness argument below.
- In rank one every member is irreducible, which is why the proposition is stated for `n≥2`.

### Descent to soluble non-Galois intermediate fields

The target `solubleIntermediateDescent` has the following hypotheses and conclusion.

Let `F′/F` be a finite soluble Galois extension of imaginary CM fields, `E` a CM field with
`F⊆E⊆F′`, and `Π` regular algebraic, essentially conjugate-self-dual and cuspidal for
`GL_n(𝔸_F)`. If `r_{ℓ′,ι′}(Π)|_{G_{F′}}` is irreducible for one pair `(ℓ′,ι′)`, then there
is a regular algebraic, essentially conjugate-self-dual cuspidal `Π_E` of `GL_n(𝔸_E)` with
`r_{ℓ,ι}(Π_E)≅r_{ℓ,ι}(Π)|_{G_E}` for every `(ℓ,ι)`, whose weight is the restriction of that of
`Π`. At every finite place `u|v` of `E`, `rec(Π_{E,u})` is the restriction of `rec(Π_v)` to
`W_{E_u}`. `E/F` need not be Galois. Route: the base change `BC_{F′/F}(Π)` is cuspidal because
its Galois representation is irreducible. Descend along a composition series of the soluble
Galois group `Gal(F′/E)` by cyclic prime-degree steps `L′/L`, using AutomorphicSpectralTheory
§7.1's descent of Galois-invariant cuspidal representations and its fibre theorem. Invariance
at each step follows from strong multiplicity one, because the conjugate representation has
the same Galois representation `r|_{G_{L′}}`. Two irreducible representations of `G_L` with the
same irreducible restriction to `G_{L′}` differ by a character of `Gal(L′/L)`, so exactly one
twist of the descended representation has Galois representation `r|_{G_L}`. The local
statement follows by Čebotarev at an auxiliary prime `ℓ″` different from the residue
characteristic of `v` and AG2.5's full away-prime comparison over `E` and `F`.

*Needs:* AutomorphicSpectralTheory §7.1, solvable `GLₙ` base change, descent and fibres;
AG2.2: Attachment under cuspidal solvable base change; AG2.0: good-place attachment;
AG2.5: full away-prime comparison; ArithmeticGaloisRepresentations Layers 1 and 5.

(Sources: BLGHT, Lemma 1.4 and proof, pp.41–42; BLGGT-lp-II, proof of Theorem 2.1, pp.6–7.)

**Checks.**

- For `E=F` the descent is `Π` itself; for `E=F′` it is the cuspidal base change.
- A cyclic step `L′/L` of character `η` has two descents `π_L` and `π_L⊗η` with the same base
  change; only comparison with `r|_{G_L}` selects one of them.
- If `Π=AI_{F′/F}(ψ)` for quadratic `F′/F`, then `r|_{G_{F′}}=ψ⊕ψ^σ` is reducible and
  `BC_{F′/F}(Π)=ψ⊞ψ^σ` is not cuspidal, so the irreducibility hypothesis cannot be dropped.
- For an `S₃` extension `F′/F` and `E` the fixed field of a transposition, `E/F` is cubic and
  not Galois; cyclic base change from `F` does not construct `Π_E`.

### The extremely regular Shin-regular coefficient-prime comparison

The target `extremelyRegularCoefficientPrimeComparison` has the following hypotheses and
conclusion.

Let `m≥2`, `F` imaginary CM, `(Π,χ)` regular algebraic essentially conjugate-self-dual cuspidal
for `GL_m(𝔸_F)` of extremely regular and Shin-regular weight, and `ℓ, ι` and `v|ℓ`. If
`r_{ℓ′,ι′}(Π)` is irreducible for one pair `(ℓ′,ι′)`, then
`ι WD(r_{ℓ,ι}(Π)|_{G_{F_v}})^{F-ss} ≅ rec(Π_v|det|^{(1−m)/2})`. Route: reduce to the
conjugate-self-dual case by AG2.2's twist. Shin-regular purity of the WD representation
follows from the Iwahori comparison after a soluble Galois base change and finite-extension
purity, so by **Pure Weil–Deligne comparison up to equivalence** it suffices to compare
traces of every `σ∈W_{F_v}` of nonzero valuation. For such `σ`, let `E_v` be the fixed field of
the subgroup generated by `σ` and the kernel of the action of `I_{F_v}` on `rec(Π_v)`, and
`E′_v` its normal
closure. Let `M/F` be the Galois extension cut out by the component group of the Zariski
closure of `r_{ℓ′,ι′}(Π)(G_F)`. Choose a finite soluble Galois CM extension `F′/F`, linearly
disjoint from `M`, with `F′_w≅E′_v` at every `w|v`, by the Grunwald–Wang theorem applied along
the derived series of `Gal(E′_v/F_v)`. Then `r_{ℓ′,ι′}(Π)(G_{F′})` has the same Zariski
closure, so its restriction remains irreducible. With `E` the fixed field in `F′` of
`Gal(F′_w/E_v)`, apply `solubleIntermediateDescent`; `BC_{E_v/F_v}(Π_v)` has Iwahori-fixed
vectors, and the Iwahori comparison over `E` gives the trace of `σ`.

*Needs:* AG2.6: Descent to soluble non-Galois intermediate fields; AG2.6: polarized admissibility;
AG2.2: Twisting an essentially self-dual form into unitary type; AG2.5: pure WD uniqueness;
AG2.5: full away-prime comparison; ArithmeticGaloisRepresentations Layer 2;
ArithmeticGaloisDuality §R02.4.6, Grunwald–Wang; EndoscopicTransferAndUnitaryTraceComparison
§§6.24–6.29 and 13.1–13.4.

(Sources: BLGGT-lp-II, Theorem 2.1 and proof, pp.6–7; BLGGT-lp-I, Corollary 1.3 and
Proposition 1.1, pp.4–5.)

**Checks.**

- Traces on inertia alone do not suffice: the trivial and the unramified quadratic character
  of `W_{F_v}` agree on `I_{F_v}` and differ at Frobenius, an element of valuation one.
- For `r=Ind_{G_{F₂}}^{G_F} ψ` with `F₂/F` quadratic, `M` contains `F₂`, and any `F′⊇F₂` makes the
  restriction reducible; linear disjointness from `M` is what preserves irreducibility.
- If `Gal(E′_v/F_v)=S₃` and `σ` generates a subgroup of order two modulo inertia, `E_v/F_v` is
  cubic and not Galois, so the descent target, not cyclic base change, produces `Π_E`.

### Polarized coefficient-prime domination

The target `polarizedCoefficientPrimeDomination` has the following hypotheses and conclusion.

Let `m≥2` and assume `ExtremelyRegularIrreducibility m`. For `F` imaginary CM, `(Π,χ)` regular
algebraic essentially conjugate-self-dual cuspidal for `GL_m(𝔸_F)`, `ℓ, ι` and `v|ℓ`,
`ι WD(r_{ℓ,ι}(Π)|_{G_{F_v}})^{F-ss} ≺ rec(Π_v|det|^{(1−m)/2})` in AG2.5's monodromy order; in
particular the two semisimplified Weil representations agree. For Shin-regular weight the two
sides are isomorphic. Route: after a soluble CM base change in which `v` splits, arrange
`[F⁺:ℚ]` even, `F/F⁺` unramified at finite places, every `ℓ`-adic and ramified place split,
and Iwahori level away from `v`. Descend to a definite unitary group quasi-split at all finite
places by the Labesse transfer, and construct the source's Chenevier eigenvariety: weights
vary at the `ℓ`-adic places other than `v`, and a Bernstein idempotent at `v` selects
representations whose parameter is `≺_I`-dominated by that of `Π_v`. The extremely regular
Shin-regular classical points form a Zariski-dense accumulation subset; at them the previous
target applies, its irreducibility input being `ExtremelyRegularIrreducibility m`. On a proper
generically finite cover carrying a locally free family `M` with the interpolated
pseudo-character, prove the family period statement used by the source: Sen weights at `v`
are constant, and over a finite Galois extension of `F_v` the semistable period module of
`M` is locally free of rank `m` and commutes with specialization. Its WD trace then agrees
with the Bernstein-centre pseudo-character on a Zariski-dense set, hence everywhere,
giving the semisimple comparison at `Π`. Pass from `≺_I` to `≺`. The Shin-regular equality
follows from the purity in the previous target and **Pure Weil–Deligne comparison up to
equivalence**.

*Needs:* AG2.6: extremely regular Shin-regular comparison; AG2.6: Descent to soluble
non-Galois intermediate fields; AG2.5: monodromy order; AG2.5: pure WD uniqueness;
AG2.3: definite-unitary eigenvariety instance, for the construction pattern; AG2.3: classical
density; AG2.3: family determinant; AG2.P: finite-coefficient periods and comparison;
LocallyAnalyticDistributions §§4.2, 4.15–4.16; SmoothRepresentationsOfLocalGroups SR.3 and SR.5;
IntegralHeckeAndGaloisDeterminants Layers 0–1 and §4.2;
EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: BLGGT-lp-II, Theorem 3.1, Corollary 3.2 and proof, pp.7–11, invoking Chenevier,
*Une application des variétés de Hecke des groupes unitaires*, Proposition 3.11, Lemme 3.14,
Proposition 3.16 and Corollaire 3.19, and Bellaïche–Chenevier, *Families of Galois
representations and Selmer groups*, Astérisque 324, Lemma 7.8.11 and Proposition 7.8.19.)

**Checks.**

- A rank-two Steinberg parameter dominates the WD representation `1⊕|·|` with `N=0`; the
  order gives equal Weil parts, not equal monodromy.
- The weight with labels `{0,1,2,3}` at every embedding is not extremely regular, but
  translating it far into the dominant chamber, to labels such as `{0,1,3,7}`, is; this is
  why the extremely regular points are dense in the varying-weight family.
- Rank `m=2` with parallel weight `a_τ=(0,0)` is not Shin-regular, so this target gives
  only domination there; equality needs the purity argument of the next target.

### Full polarized local–global compatibility at `ℓ`

The target `fullPolarizedCoefficientPrimeComparison` has the following hypotheses and conclusion.

For `n≥2`, assume `ExtremelyRegularIrreducibility n`. For a conjugate-self-dual cohomological cuspidal `Π` over CM `F`, any `ℓ, ι` and `v|ℓ, WD(r_{Π,ℓ,ι}|G_{F_v})^{F-ss} ≅ ι⁻¹ rec(Π_v|det|^{(1−n)/2})` with monodromy. The algebraic-character twist of AG2.2 extends this to the stated polarized branch. The semisimple Weil comparison is **Polarized coefficient-prime domination**. The theorem has no Shin-regularity condition; it uses purity of the actual geometric summand selected for `Π^∨` with its coefficient `ξ_{Π^∨}`, transported to the tensor square of `r_{Π,ℓ,ι}` at `v|ℓ` by **Purity transfer from a semisimplified multiple**, temperedness and the pure-parameter uniqueness theorem. Odd rank and even rank of Shin-regular weight are the equality case of that domination target. Caraiani-p Theorem 1.1, stated for every `n≥2`, supplies the remaining even-rank case: it takes the semisimple comparison from BLGGT-lp-II Theorem A and proves purity through the two-signature log-crystalline argument. Purity alone, or an isomorphism after restriction to a finite extension, does not replace the semisimple comparison over `F_v`. Rank one is supplied by algebraic local class field theory and needs no irreducibility input.

**Checks.**

- The trivial character of `W_K` and a quadratic character trivial on `W_L` for a quadratic
  `L/K` are both pure of weight zero with `N=0` and agree on `W_L`, but are not isomorphic.
- For a rank-two Steinberg parameter, the semisimple comparison leaves `N=0` and `N≠0`
  possible; purity and temperedness select the Steinberg monodromy.
- Rank two with parallel weight `a_τ=(0,0)` is outside the Shin-regular range and uses the
  two-signature purity branch.

*Needs:* AG2.6: polarized coefficient-prime domination; AG2.6: polarized admissibility; AG2.6: log-crystalline purity; AG2.5: purity transfer from a semisimplified multiple; AG2.5: pure WD uniqueness; AG2.2: Twisting an essentially self-dual form into unitary type; AG2.5: full away-prime comparison; ArithmeticGaloisRepresentations Layer 2; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: BLGGT-lp-II, Theorem A, p.2, and Corollary 3.2, p.7; Caraiani-p, Theorem 1.1, pp.1–2; §§2 and 5.)

### Relative Fargues–Fontaine curves and degree-one divisors

For a nonarchimedean local field `K` with residue field `𝔽_q` of characteristic `p`,
uniformizer `π` and arbitrary `S∈Perf_{𝔽_q}`, the charts, curve and divisors are
VectorBundlesAndIsocrystals VB−1's: its ramified Witt coefficients (`W_{O_K}(R⁺)` in mixed
characteristic, `R⁺[[π]]` in equal characteristic, with the `(π,[ϖ])`-adic topology),
relative annuli, relative period domain with analytic quotient `X_{K,S}=Y_S/φ^ℤ`, marked
untilt Cartier divisors and `Div¹_K=Spd(K)/φ^ℤ`. This roadmap names that common construction
`relativePeriodChart`, `relativeFarguesFontaineCurve` and `relativeDegreeOneDivisor` and uses
no second construction. Prove the comparisons that AG2.6 consumes on the same carriers:
independence of `ϖ`, gluing over arbitrary perfectoid bases, functoriality and finite
local-field extension comparison retaining the induced residue-field map and Frobenius
powers, and the degree-one modification interface. VB−1 compares the charts, quotient and
marked divisor with FarguesFontaineDiamonds F0–F4 on its fixed-field `K=ℚ_p` domain; that
comparison does not supply the relative construction over general `S`, and no adic morphism
`X_{K,S}→S` is assumed.
(Source: Fargues–Scholze, §II.1, Propositions II.1.1–II.1.3,
pp.47–49, Definition II.1.15 and Propositions II.1.16–II.1.18, pp.54–56,
Definition II.1.19, p.56.)

**Checks.**

- For `K=ℚ_p` and field-valued `S`, recover the supplied fixed-field curve and marked divisor.
- For `K=𝔽_q((π))`, use `R⁺[[π]]`; for ramified `K/ℚ_p`, retain ramified Witt
  coefficients and `π`. Ordinary unramified Witt coefficients do not cover both cases.
- A disconnected `S` retains all its open-and-closed components under gluing; testing
  only perfectoid fields does not give this relative functor.
- An untilt over `K` gives degree one, whereas twice its divisor has degree two.

*Needs:* VectorBundlesAndIsocrystals VB−1, relative coefficients, annuli, period domain,
analytic quotient and marked untilt divisors; FarguesFontaineDiamonds F0–F4, fixed-field
comparison; AdicSpaces Layers 0–6; PerfectoidSpaces P1–P2; DiamondsAndVStacks D2–D4.

### Bundle strata, lisse categories and the geometric Hecke action

For the preceding local `K` and any connected reductive `G/K`, the v-stack `BunG` of
`G`-torsors on `X_{K,S}`, its Newton strata `newtonStratum` indexed by `B(G)`, the full
stratum automorphism groups and the filtered contracting charts are
VStackSheavesAndLisseCategories VS4.0's constructions over `Perf_k` for algebraically
closed `k` over `𝔽_q`. `DLisBunG` is VS3.2's lisse category, the localizing category
generated by `f♮Λ` for separated representable cohomologically smooth `f`, with `f♮⊣f*`,
base change and projection formula. VS4.4 supplies HN localization, the comparison of
strata with derived smooth `G_b(K)`-representations, compact generators from open pro-`p`
subgroups and the compactness criterion using finite Newton support. The target here is
the same moduli problem over `Perf_{𝔽_q}`: identify its base change along `Spd k→Spd 𝔽_q`
with the supplied carriers, descend v-descent, the strata and the charts along that map,
and retain the stratum restriction and extension functors, the nonbasic strata and their
unipotent geometry.

For `ℓ≠p`, a chosen `√q`, and coefficients `Λ` over `ℤ_ℓ[√q]`, the bounded-support
coefficient-flat perverse ULA Satake sheaves, their fusion and convolution, the pinned
dual-group fibre functor and the integral geometric Satake equivalence with
parity-corrected symmetry and its Weil normalization are GeometricSatakeAndFusion
GS0–GS4's, including its normalized Satake equivalence and perfect-complex Satake
functor. Construct the finite-leg global `HeckeModification` stacks over
`BunG×(Div¹_K)^I`, with source and target maps, unit, leg-repetition maps and completion
to GS0's local modification spaces, and identify their bounded pieces with GS0's
Schubert-bounded loci. For a finite set `I` and `S∈Perf_{𝔽_q}`, `Hck^I_G(S)` is the groupoid of
`((D_i)_{i∈I},E₁,E₂,α)` with `D_i` degree-one divisors and `α:E₁≅E₂` off `⋃D_i`, meromorphic
along `ΣD_i`. The source map is `p₁:Hck^I_G→BunG`, `p₁=E₁`, and the target map is
`p₂:Hck^I_G→BunG×(Div¹_K)^I`, `p₂=(E₂,(D_i))`. The unit `e:BunG×(Div¹_K)^I→Hck^I_G` inserts
`α=id`, so `p₂∘e=id` and `p₁∘e=pr`. For `a:I→J` the leg-repetition map `ι_a` restricts along
the diagonal `Δ_a`, completion `loc` passes to the local Hecke stack, the bounded pieces are
`Hck^I_{G,≤μ•}`, and `p₁` identifies `Hck^∅_G` with `BunG`. The bound is the relative position
of the target `E₂` with respect to the source `E₁` at each `D_i`: for `G=G_m` and `μ=1` the
bounded piece is `E₂=E₁(D)`, and in general the pushout along `μ` of the modification
`O⇢O(1)` has type exactly `μ`. Inverting `α` is the involution `sw` exchanging source and
target; it carries `Hck^I_{G,≤μ•}` to `Hck^I_{G,≤−w₀μ•}`. With the bundle normalization
`E_{π⁻¹}=O(1)` for `G_m`, a type-`μ` modification of the trivial bundle has target `E_b`
only for `b∈B(G,μ⁻¹)` in Kottwitz's normalization, that is `κ(b)=−μ^♯`.

Construct `HeckeFunctor` on `DLisBunG`, using the normalized ULA Satake kernels and
the supplied six operations. For `V∈Rep_Λ((Ĝ⋊Q)^I)` let `S_V^Sat` be GS's normalized perverse
Satake sheaf, pulled back to `Hck^I_G`, and `S_V^hom=D_rel(S_V^Sat)^∨` its solid kernel, with
Verdier duality relative to `Hck^I_G→[(Div¹_K)^I/L⁺G]`. The conversion `V↦S_V^hom` is an exact
`Rep_Λ(Q^I)`-linear monoidal functor to solid sheaves for convolution, compatible with base
change in `Λ` and functorial in `I`; on a smooth minuscule fibre of dimension `d` it carries
`Λ[d](d/2)` to `Λ[−d](−d/2)`. The transform is
`T_V(A)=p₂♮(p₁*A⊗S_V^hom)`, a functor `D_lis(BunG,Λ)→D(BunG×(Div¹_K)^I,Λ)`.
On this target it is not an endofunctor for nonempty `I`, and composites `T_V∘T_W` are not
defined there. Its values are lisse after pullback to `BunG×Spd C`, which descends `T_V` to
`T_V:D_lis(BunG,Λ)→D_lis(BunG,Λ)^{BW_K^I}`, an endofunctor once the `W_K^I`-action is
forgotten; the first form is recovered by pulling back along `pr`. The monoidal structure
lives on the descended functors: `V↦T_V` is an exact `Rep_Λ(Q^I)`-linear monoidal functor
`Rep_Λ((Ĝ⋊Q)^I)→End_Λ(D_lis(BunG,Λ)^ω)^{BW_K^I}`, with composition as tensor product,
`T_𝟙=id` with trivial `W_K^I`-action as unit, `T_{V⊗W}≅T_V∘T_W` coming from convolution
of the Satake kernels along `Hck^I_G×_{BunG}Hck^I_G`, its associator from convolution
associativity, and `T_{V⊠W}≅T_V∘T_W` for legs `I⊔J`. Functoriality in `I` (as a
coCartesian fibration over finite sets) makes leg repetition `ι_a` correspond to restriction
of `V` along `(Ĝ⋊Q)^J→(Ĝ⋊Q)^I` and to restriction of the `W_K^I`-action along the diagonal.
Here `Λ` is a `ℤ_ℓ[√q]`-algebra and `ℓ≠p`. Prove preservation of compact and ULA objects, duality,
the two adjunctions, fusion, coalescence and coherent Weil actions for every finite
set of legs. Compare solid `♮` with torsion étale `!` on these ULA kernels:
`p₂♮(p₁*A⊗S_V^hom)≅Rp₂!(p₁*A⊗S_V^Sat)` for `ℓ`-power torsion `Λ`. For a
minuscule `μ` and algebraically closed complete `C/K`, identify the underlying
transform `T_{μ,C}` with the modification correspondence, including shift
`d_μ=⟨2ρ,μ⟩`. The global Hecke stacks, `HeckeFunctor` and the minuscule transform
are owned here; the Igusa/Newton comparison below is their automorphic application.
(Source: Fargues–Scholze, Definition III.0.1 and
Theorem III.0.2, pp.87–88; Chapters III–V, especially Proposition V.2.2;
§§VI.9–VI.12, pp.226–244; §§VII.3, VII.6–VII.7, pp.257–274;
Theorem IX.0.1(i)–(iii), pp.317–318, and §IX.2, the kernel `D(S_V)^∨` on pp.321–322,
Proposition IX.2.1, Theorem IX.2.2 and Corollary IX.2.4, pp.321–324.)

**Checks.**

- For `GL₁`, degrees index the strata and the neutral automorphism group is `K×`;
  `T_1` carries sheaves on the degree-`d` stratum to the degree-`d+1` stratum (Kottwitz
  invariant `a` to `a−1`), and `T_{−1}` is its inverse, so `T_1∘T_{−1}≅T_𝟙`.
- The minuscule `PGL₂` fibre `ℙ¹` has cohomology `Λ⊕Λ(−1)`; omitting the Tate twist
  changes the Weil normalization of Satake.
- On a smooth minuscule fibre `f` of dimension `d`, `S^Sat=Λ[d](d/2)` and `S^hom=Λ[−d](−d/2)`,
  and `f♮Λ[−d](−d/2)≅Rf!Λ[d](d/2)` because `f♮=Rf!(−⊗Λ[2d](d))`. Putting the perverse kernel
  into the `♮` formula would shift the transform by `2d` and twist it by `d`.
- For every finite `I`, the unit kernel gives `T_𝟙(A)≅pr*A` for
  `pr:BunG×(Div¹_K)^I→BunG`, with trivial `W_K^I`-action. Only for `I=∅`, where
  `(Div¹_K)^∅` is a point, is this the identity functor. For `G=1` and `I={∗}` the transform
  goes from sheaves on a point to sheaves on `Div¹_K`, so it is no endofunctor; its descent
  is the identity of `D(Λ)` with trivial `W_K`-action, the monoidal unit.
- Three-leg fusion is associative, and exchanging odd components retains the parity sign.
- Infinitely many nonzero Newton restrictions do not give a compact object merely
  because each individual restriction is compact. Nonbasic strata are retained.

*Needs:* relative curves and divisors;
VStackSheavesAndLisseCategories VS3.2, VS4.0 and VS4.4; GeometricSatakeAndFusion GS0–GS4;
DiamondEtaleCohomology C2–C5; DiamondSixOperations S1–S4;
AdicCoefficientsAndComparisons L0; EnhancedDerivedSheaves E0 and E5;
ReductiveGroups Layers 0–3; ReductiveGroupsPartII RG2.5;
SmoothRepresentationsOfLocalGroups SR.0 and SR.0d.

### The parameter stack and geometric spectral action

For the same `K,G`, import SmoothRepresentationsOfLocalGroups SR.6.1–SR.6.3's crossed
Weil cocycles, finite-wild schemes, coefficient change and excursion/invariant-function
comparison. `parameterStack=Z¹(W_K,Ĝ)/Ĝ`, with the pinned Weil action through a finite
quotient `Q`, is LanglandsParameterStacks LP1.7–LP1.8's quotient stack, retaining its
stabilizers, universal torsor and open-and-closed finite-wild levels. Its perfect-complex
categories, universal representation bundles and integral perfect generation by
`Perf(BĜ)`, with the module comparison in `Ind Perf(BĜ)`, are LP4.1–LP4.3's under
`ℓ∤|π₁(Ĝ)_tors|`, which is equivalent to `ℓ∤|π₀Z(G)|`. This is the generation input for
the spectral action; no singular-support or categorical local Langlands equivalence is required.

For `Λ=O_L`, `L/ℚ_ℓ(√q)` finite and `ℓ∤|π₀Z(G)|`, prove the universal equivalence
between compactly supported `Perf(parameterStack_Λ)`-actions on a small idempotent-complete
`Λ`-linear stable category and exact `Rep_Λ(Q^I)`-linear monoidal Weil-equivariant
functors from `Rep_Λ((Ĝ⋊Q)^I)`, coherently in finite `I`. Compact support means a
finite wild level for each object, not a uniform level for the whole category.
Use the universal torsor in one direction and the integral generators/relations
comparison in the other. Over characteristic-zero coefficient fields the integral
prime restriction is unnecessary.

The Satake labels of `HeckeFunctor` are opposite to those of Fargues–Scholze: here
`T_{V_μ}` carries the trivial stratum into `B(G,μ⁻¹)`, there into `B(G,μ)`. Let `θ` be the
Chevalley involution of `Ĝ` fixed by the pinning. It commutes with the pinned `Q`-action, so it
extends to `Ĝ⋊Q`. It sends highest weight `λ` to `−w₀λ`, so `θ*` carries the integral Weyl
and dual Weyl modules of highest weight `λ` to those of highest weight `−w₀λ`. The further
identification `θ*V_λ≅V_{−w₀λ}≅V_λ^∨` holds for characteristic-zero irreducibles and for
minuscule `λ`, whose integral module is irreducible on every fibre; it is not asserted for
arbitrary integral highest-weight lattices. Unlike `V↦V^∨`, `V↦θ*V` is covariant and monoidal,
and the integral construction uses `θ*` itself. Apply this equivalence to the monoidal functor
`V↦T_{θ*V}`, which is Fargues–Scholze's `V↦T_V`, on compact objects and extend by colimits
to construct `geometricSpectralAction`, `excursionOperator` and `semisimpleParameter`.
The raw action reconstructed from `V↦T_V` is the pullback of `geometricSpectralAction`
along `φ↦θ∘φ` on `parameterStack`. Its excursions, centre map and stratum maps are those
below composed with `θ*`, and its semisimple parameters are `θ∘φ`. All centre, parameter
and classical comparisons in this roadmap refer to the normalized action.
Obtain `Z_spec(G,Λ)=O(Z¹(W_K,Ĝ)_Λ)^Ĝ` acting centrally and commuting with Hecke
transforms, and its restriction `Ψ_G^b` to each derived smooth stratum category.
Prove coefficient/restriction naturality, including derived reduction to local Artinian
`O_L`-algebras with `ℓ` nilpotent. Over any algebraically closed coefficient field
over `ℤ_ℓ[√q]`, construct the semisimple parameter of a Schur-irreducible object
directly from excursions and prove its characterization, including without the
integral prime restriction. The algebraic excursion carrier
remains that of SR.6.3; this target supplies its geometric action. Its interface is the
action on `D_lis(BunG,Λ)` for `Λ=O_L` with `ℓ∤|π₀Z(G)|`, or for a characteristic-zero
coefficient field, under which the universal representation bundle of `V` from LP4 acts
by `T_{θ*V}`; the map from `Z_spec(G,Λ)` to the centre; the excursion operators at every finite wild level;
and the restrictions `Ψ_G^b`. Igusa, torsion and local-shtuka applications restrict this
action and this centre; they do not construct another integral spectral centre.
(Source: Fargues–Scholze, Theorems VIII.1.3 and VIII.5.1,
pp.278–281, 293–315; Theorem IX.0.1, Corollary IX.0.3 and Definition IX.0.4,
pp.317–319; the proof of Theorem IX.3.1, p.324, for their labelling; Definition/Proposition
IX.4.1, Proposition IX.5.3 and Proposition IX.6.5, pp.327–333; Theorem I.10.1, pp.37–38, and §§X.1–X.3, pp.340–350.)

**Checks.**

- The tensor unit acts identically, and a scalar excursion acts by that scalar.
- For `GL₁`, a semisimple parameter is the local reciprocity character, as in
  Fargues–Scholze Proposition IX.6.5. The quotient
  still has dual-torus stabilizers; its coarse set of points is not the parameter stack.
- `PGL_ℓ` has `|π₀Z(G)|=1`, whereas `SL_ℓ` has centre `μ_ℓ` and fails the integral
  prime restriction. Rational coefficients remove that restriction.
- Distinct compact objects may require different finite wild levels. A comparison
  only after rationalization does not determine an integral action on torsion objects.
- For `G=G_m`, `K=ℚ₁₁`, `ℓ=5` (`11≡1 mod 5`, so `√11∈ℤ₅`) and the unramified character `χ`
  of `K^×` with `χ(11)=2`, over `𝔽̄₅`, the two-leg excursion for `V=std⊠std^∨`, coevaluation,
  evaluation and Weil elements `(γ,1)` with `γ↦11` under reciprocity acts on `χ` by `2` for
  `geometricSpectralAction`, but by `2⁻¹=3` for the raw action from `V↦T_V`. Here `d_μ=0`,
  so no shift or half-Tate twist reconciles the two.
- For `G=PGL₂`, `Ĝ=SL₂`, `K=ℚ₁₇`, `ℓ=2` and `Λ=ℤ₂` (`17≡1 mod 8`, so `√17∈ℤ₂`), the lattice
  `V=Sym²(Λ²)` has `θ*V≅V` after reduction to `𝔽̄₂`, where `θ` is inner, but `Sym²(𝔽̄₂²)` has
  no nonzero invariant while its dual has one (the span of `x²,y²` is stable with trivial
  quotient). So `θ*V≇V^∨` integrally, and only `θ*` enters the integral action.

*Needs:* bundle and Hecke categories;
LanglandsParameterStacks LP1.7–LP1.8 and LP4.1–LP4.3;
SmoothRepresentationsOfLocalGroups SR.6.1–SR.6.3; SchemeAndStackFoundations, quotient stacks;
EnhancedDerivedSheaves E5; ReductiveGroupsPartII RG2.5; ClassFieldTheory Layer 9.

### Minuscule local Shimura spaces and their Hecke realization

For a finite extension `K/ℚ_p`, a connected reductive `G/K`, a conjugacy class `μ` of
minuscule cocharacters with reflex field `E`, an element `b∈B(G,μ⁻¹)` (Kottwitz's
normalization, with `E_{π⁻¹}=O(1)` for `G_m` as fixed with the Hecke stacks), and a compact open
`U⊆G(K)`, construct `localShimuraTower`: the spaces `M_{(G,b,μ),U}` over `Spd Ĕ` of
points `(E₁,E₂,α)` of the one-leg `Hck_{G,≤μ}` at the divisor of `Spd C` with source `E₁`
trivial, trivialized up to `U`, and target `E₂≅E_b`. Equivalently, inverting `α`, these are
the modifications from `E_b` to the trivial bundle of type `−w₀μ`. A source labelling the same
space by `b∈B(G,μ)`, as Fargues–Scholze §IX.3 does, is compared after inverting `μ`
(equivalently reversing the modification). Construct the actions
of `G_b(K)` and of `G(K)` on the tower, the Weil descent datum and the étale period maps to
the bounded affine Grassmannian. For `Λ` a `ℤ_ℓ`-algebra of the preceding coefficient types
and `ℓ≠p`, define `localShimuraCohomology` as Huber's compactly supported cohomology
`RΓ_c(M_{(G,b,μ),U,C},Λ)`, the colimit over quasicompact opens, and its colimit over `U`.
Prove that it is a complex of smooth `G_b(K)`-representations, compact in the derived
smooth category when `U` is pro-`p`, with continuous `W_E`-action. Prove
`localShimuraHeckeRealization`: up to the shift and twist fixed by `d_μ=⟨2ρ,μ⟩`,
`RΓ_c(M_{(G,b,μ),U,C},Λ) ≅ i_b* T_μ(j₁! c-Ind_U^{G(K)} Λ)` on the shared `BunG`, Newton
strata and `HeckeFunctor` carriers, compatibly with `W_E`; here source and target are those of
`HeckeFunctor`, so `j₁!` places the input on the trivial source stratum and `i_b*` restricts
the output to the target stratum. Prove the adjoint formula
expressing `R Hom_{G_b(K)}(RΓ_c(M_{(G,b,μ),U,C},Λ), ρ)` through `i₁* T_{μ^∨}(R i_{b*}ρ)`, where
`T_{μ^∨}=T_{V_μ^∨}`, of highest weight `−w₀μ`, is right adjoint to `T_μ` and transports the
target stratum `b` back to the trivial stratum; under Verdier duality it becomes
`T_{sw*μ}`, with `sw*` acting on Satake by the Chevalley involution conjugated by `ρ̂(−1)`. Prove its
finite-length consequence for finite-length `ρ` over `ℚ̄_ℓ`. These carriers use no automorphic,
Galois or Igusa input of this roadmap.
(Source: Fargues–Scholze, §IX.3, Theorem IX.3.1 and its proof and Proposition IX.3.2,
pp.324–326, Proposition I.6.4, p.29, and the proof of Corollary IX.7.3, pp.337–338, for the
orientation; Scholze–Weinstein, *Berkeley Lectures on p-adic Geometry*, Lectures 23–24, for
the tower and its period maps.)

**Checks.**

- For `GL_n`, `μ=(1,0,…,0)` and basic `b` with `E_b≅O(1/n)`, that is `κ(b)=−1`, the tower
  is the Lubin–Tate tower: `O^n⊂E₂` with cokernel of length one at the divisor. `G_b(K)` is
  the unit group of the division algebra `End(O(1/n))` of rank `n²`. For the basic class with
  `E_b≅O(−1/n)` the tower is empty. For `n=2` this is the quaternion Lubin–Tate tower with
  `G_b(K)` the units of the quaternion division algebra over `K`.
- For `G=G_m` and `μ=±1` the tower is nonempty exactly for `b=π^{∓1}` (`E_b=O(±1)`); there
  `M_{(G,b,μ),U}=K^×/U`, discrete, `d_μ=0`, and both sides of the realization are
  `c-Ind_U^{K^×}Λ` in degree `0`. For `b=π^{±1}` the tower is empty and
  `i_b* T_μ(j₁!A)=0`, since `T_μ` moves the degree-`0` stratum to degree `±1`.
- For trivial `μ` the only admissible class is `b=1`; the tower is the discrete set
  `G(K)/U`, the cohomology is `c-Ind_U^{G(K)} Λ` and the Hecke transform is the identity.
  A nontrivial central `μ` instead admits only the basic class with Kottwitz invariant determined by `μ`, not `b=1`.
- If `b∉B(G,μ⁻¹)` the tower is empty, and `i_b* T_μ(j₁!A)` vanishes because
  modifications of type `μ` of the trivial bundle land only in admissible strata.

*Needs:* relative curves;
bundle strata and Hecke action;
DiamondsAndVStacks D2–D4; DiamondEtaleCohomology C2–C5; DiamondSixOperations S1–S4;
SmoothRepresentationsOfLocalGroups SR.0 and SR.0d.

### Local Shimura complexes for the AHTW datum

For AHTW §2.2’s `U(n,n)` datum, auxiliary split `p≠ℓ`, algebraically closed complete `C/ℚ_p`,
choose `p^(1/2)` in the coefficient field and a complete DVR `O` finite over
`ℤ_ℓ[p^(1/2)]`. For a local Artinian `O`-algebra `Λ` with `ℓ` nilpotent, specialize
`localShimuraTower` and `localShimuraCohomology` to every `b∈B(G,μ⁻¹)`. Inverting `α`
turns the tower's trivial-to-`E_b` modifications of type `μ` into the modifications
`E_b⇢E₀` of type `μ^∨=−w₀μ` in the convention of the Hecke stacks above; this is the local
Shimura space of AHTW Remark 2.4.3, of meromorphy `μ` in the Scholze–Weinstein
normalization of Schubert cells, and its normalized compactly supported complex is
`RΓ_c(G,b,μ,Λ)`. AHTW's Hecke operator `T^AHTW_{μ,C}=Rh→_* h←*[d_μ]` on the stack of
modifications `E₁⇢E₂` bounded by `μ` in that normalization runs from the `b`-stratum to the
trivial one, whereas `T_{μ,C}` runs from the trivial stratum to `b`. Prove
`ahtwHeckeOrientationAdapter`: on this datum AHTW's bounded Hecke stack, with the same
labels `B(G,μ⁻¹)` and `b_μ`, is the present `Hck_{G,≤μ^∨}`, and `T^AHTW_{μ,C}≅T_{μ^∨,C}`
for `T_{μ^∨}=T_{V_μ^∨}`, the right adjoint of `T_μ`, with the same shift
`d=d_μ=⟨2ρ,μ⟩=⟨2ρ,μ^∨⟩`, the Tate twist of the normalized minuscule Satake kernel fixed by
the chosen `p^(1/2)`, and compatibly with coefficient base change and ULA objects. Then prove
its Weil and spectral lift. AHTW's operator is Fargues–Scholze's `T_{V_μ}`, and on this split
datum `V_μ^∨≅θ*V_μ`, so `T^AHTW_μ≅T_{θ*V_μ}` holds `W_{ℚ_p}`-equivariantly as functors to
`D_lis(BunG,Λ)^{BW_{ℚ_p}}`. AHTW's spectral action, labelled by `V`, is therefore
`geometricSpectralAction`, and AHTW's `Z_spec(G,O)`, excursions and `Ψ_G^b` are the normalized
ones of the spectral target, not those of the raw action from `V↦T_V`. Every AHTW formula
below is read through this adapter. The functor `j₁* T_{μ^∨,C} j_b!` has `j_b!` where the
adjoint formula of `localShimuraHeckeRealization` has `R i_{b*}`, so it is not that formula.
The two are related only through Verdier duality on the input and the output, as in
Fargues–Scholze's proof of Theorem IX.3.1. Its identification with local Shimura convolution
is the Newton graded-piece comparison below. Use the shared `BunG`, Newton strata, `DLisBunG` and
`HeckeFunctor` carriers, their stratum equivalence, `j_b!`, `j₁*`, `T_{μ^∨,C}` and
base-change and ULA properties. Construct the
partial Igusa compactification and `V_b=RΓ_{c−∂}(Ig_b,Λ)`, with cohomology in `[0,d_b]`.
Prove AHTW Theorem 2.4.2’s prime-to-`p` Hecke-equivariant Newton filtration of `RΓ_c` of the
infinite `p`-level Shimura variety, with graded pieces
`RΓ_{Kᵖ,b}=j₁* T_{μ^∨,C}(j_b!(V_b[−d]))`, and identify these with
`RΓ_c(G,b,μ,Λ) ⊗ᴸ_{H(G_b)} V_b[2d_b]` in the source normalization. Retain coefficient and
tame-level transition maps preserving the chosen `p^(1/2)`. All normalized local Shimura,
Satake and spectral-centre constructions use this choice. This constructs every required `b`, including nonbasic classes.
(Sources: AHTW, §§2.3.2 and 2.4, Theorems 2.4.1–2.4.2, footnote 2 on p.19 and
Remark 2.4.3, pp.14–16, 18–21; Fargues–Scholze, proof of Theorem IX.3.1, pp.324–325, for
the adjunction between `T_μ` and `T_{μ^∨}` and the Verdier-duality comparison, and
Proposition IX.6.5, p.333, for the torus normalization.)

**Checks.**

- For `G=G_m`, `μ=1` and `b=π⁻¹`, so `E_b=O(1)`, the functor `j_b* T_1 j₁!` is the
  equivalence between the degree-`0` and degree-`1` strata, both `D(K^×,Λ)`, whereas
  `j₁* T_1 j_b!=0` because `T_1` carries the degree-`1` stratum to degree `2`. The passage
  from `b` back to the trivial stratum is `j₁* T_{−1} j_b!`, again that equivalence; this is
  `T^AHTW_{1,C}` through `ahtwHeckeOrientationAdapter`.
- In the same rank-one case the adapter carries AHTW's labelling `V=std` to `T_{θ*std}=T_{−1}`,
  so AHTW's excursions are those of `geometricSpectralAction`. With the raw action from
  `V↦T_V` instead, the unramified `χ` with `χ(11)=2` over `𝔽̄₅` at `p=11, ℓ=5` would get
  the excursion value `3`, not `2`.
- At the `μ`-ordinary class the local factor is not a basic formal-module tower; its
  comparison must specialize to the parabolic-induction formula below.
- A datum with a nonbasic `b` retains that Newton graded piece. Keeping only basic `b`
  omits part of the filtration and cannot give its length `|B(G,μ⁻¹)|`.
- For a zero Igusa complex its graded piece is zero. Changing the Artinian modulus over `O` or
  tame level carries the filtration and both normalized descriptions to the new coefficients.
  For `p=3` and `ℓ=2, O=ℤ₂` is outside the coefficient domain: a unit square is 1 modulo 8,
  whereas 3 is not, so `√3` is unavailable.

*Needs:* relative curves;
bundle strata and Hecke action;
DiamondsAndVStacks; DiamondEtaleCohomology; DiamondSixOperations Layers S1–S2;
PELModuli M0–M4; SmoothRepresentationsOfLocalGroups SR.0 and SR.0d;
EndoscopicTransferAndUnitaryTraceComparison Layers 7–8 for finite-level rational Igusa inputs.

### Spectral and classical local parameters for the split factors

For every inner Levi `G_b` of the split GL factors in the AHTW datum, and every smooth
irreducible `ℚ̄_ℓ`-representation `σ` of `G_b(ℚ_p)`, use `semisimpleParameter` from the
shared normalized geometric spectral action, read through `ahtwHeckeOrientationAdapter`, and prove AHTW Theorem 2.3.5: it equals `rec(π)^ss` for every
Jordan–Hölder constituent `π` of normalized induction of `JL(σ)` from the corresponding
split Levi. Use the fixed `p^(1/2)` for normalized induction. Prove the required spectral
parameter compatibility with normalized parabolic induction and its inner-form
comparison, reducing to the basic inner GL case as in the source proof. The JL and
classical parameter are the supplied standard-data constructions, not definitions of
the spectral parameter. Deduce that a generic unramified spectral parameter forces
`G_b` to be quasi-split. For `b∈B(G,μ⁻¹), b≠b_μ`, this contradicts the non-quasi-split
inner factor of the source datum, providing the generic-locus exclusion used below.

**Checks.**

- On a split rank-one factor both parameters are geometric local reciprocity, with `N=0`.
- A generic unramified parameter on an inner GL factor forces it to be split;
  an irreducible representation of a nonsplit division-algebra factor cannot supply one.
- Non-generic unramified parameters are not excluded by this implication. The
  comparison retains only the semisimplification and does not identify monodromy.

*Needs:* AG2.6: local Shimura complexes and bundle strata;
geometric spectral action; SmoothRepresentationsOfLocalGroups SR.3 and SR.5;
EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.27, §10.30 and §10.31
for classical LLC and its inner-form standard-data parameter.

(Source: AHTW, §2.3.4 and Theorem 2.3.5 with proof, pp.17–18.)

### Integral spectral centre and Newton annihilation

Fix the preceding complete DVR `O` finite over `ℤ_ℓ[p^(1/2)]`, with `ℓ≠p` and the chosen
square root retained, and local Artinian `O`-algebras `Λ` with `ℓ` nilpotent.
Use the shared `parameterStack`, the normalized `geometricSpectralAction`, integral centre
`Z_spec(G,O)` and maps `Ψ_G^b:Z_spec(G,O)→Z(G_b)_O` on this datum, read through
`ahtwHeckeOrientationAdapter`; `Δ_spec`, its vanishing and its Satake image below refer to
this normalized centre. Retain the
invertibility of `|π₀Z(G)|` in `O` required in AHTW §2.3.3 (it is one
for this split local datum). For each Newton
graded piece prove the two centre actions agree: `t₁ᵇ Ψ_G¹(z)=t_bᵇ Ψ_Gᵇ(z)` for all `z`,
as endomorphisms of `RΓ_{Kᵖ,b}`. Construct `Δ_spec` with `Ψ_G^b(Δ_spec)=0` for `b≠b_μ` and
hyperspecial Satake image `Ψ_G¹(Δ_spec)=MΔ`. Prove the `μ`-ordinary comparison
`j₁* T_{μ^∨,C} j_{b_μ}! ≃ Ind_{P_μ(ℚ_p)}^{G(ℚ_p)}[d]`, AHTW's formula for its `T_μ` read
through `ahtwHeckeOrientationAdapter`, with the exact unnormalized induction of the source; its application to `V_{b_μ}[−d]` has amplitude `[0,d]`. Use local-local compatibility to exclude generic unramified spectral parameters on
every nonordinary `G_b`, then integral reduced flat Bernstein centres and characteristic-zero
evaluations to prove the vanishing integrally, rather than infer it from mod-`ℓ` support. These supply the centre
compatibility and annihilation inputs for the quantitative theorem.
(Sources: AHTW, §2.3.3, Proposition 2.4.5, §2.4.6,
Proposition 2.4.7 and Lemmas 2.5.3–2.5.5, pp.16–17, 22–25.)

**Checks.**

- For nonordinary `b, Ψ_G^b(Δ_spec)=0` forces `MΔ` to act by zero on that graded piece;
  the ordinary piece instead uses its `[0,d]` amplitude.
- The Satake image is `MΔ`, including `M`. If `ℓ` divides `M`, inverting `Δ` alone cannot remove
  `M`-torsion, although the rational generic locus sees no such torsion.
- Changing `Λ` over `O`, with the chosen `p^(1/2)` preserved, preserves the equality of the two centre actions and the integral zero
  operators. Agreement after rationalization alone would not justify a torsion annihilator.
- On a split factor `GL_{2n}` with `μ=(1^n,0^n)`, every `b∈B(GL_{2n},μ⁻¹)` has `κ(b)=−n`,
  and `b_μ` is represented by `diag(p⁻¹,…,p⁻¹,1,…,1)` with `n` entries `p⁻¹`, so
  `E_{b_μ}=O(1)^n⊕O^n` and `G_{b_μ}=GL_n×GL_n=M_μ`. Since `T_μ` changes `κ` by `−n`,
  `j₁* T_μ j_{b_μ}!=0`; `T_{μ^∨}` changes it by `+n` and reaches `κ=0`, and
  `j₁* T_{μ^∨,C} j_{b_μ}!` sends the trivial character of `M_μ(ℚ_p)` to
  `Ind_{P_μ(ℚ_p)}^{GL_{2n}(ℚ_p)} 𝟙[n²]`, nonzero since it contains the constants; here `d_μ=n²`.

*Needs:* AG2.6: spectral/classical local compatibility; AG2.6: local Shimura complexes;
geometric spectral action;
SmoothRepresentationsOfLocalGroups SR.3 and SR.5;
EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.27 and §10.30;
IntegralHeckeAndGaloisDeterminants §3a.1.

### Quantitative Shimura-cohomology annihilators

In the quasi-split unitary Shimura datum of AHTW, §2.2, let `p` be the auxiliary
split rational prime, `ℓ≠p` the coefficient prime, `O` a complete DVR finite over
`ℤ_ℓ[p^(1/2)]` for the fixed square root, `Λ` a local Artinian `O`-algebra with `ℓ` nilpotent,
and `d` the Shimura dimension. Coefficient changes preserve this square root. At the hyperspecial `p`-level
write the Satake variables `X_{v,i}`, with `1≤i≤2n`, for every `v|p`, and put
`Δ = ∏_{v|p} ∏_{i≠j} (X_{v,i}/X_{v,j} − p)` and
`M = (1−p)^([F⁺:ℚ](2n−1)) (∏_{m=1}^{2n}(p^m−1))^(2n[F⁺:ℚ]+1)`.
Prove `quantitativeShimuraAnnihilators`: for every good tame subgroup and every
`0≤q≤d−1`, both `H^q` and `H_c^{2d−q}` are annihilated by
`M^([F⁺:ℚ]n+B) Δ^B`, where `B = |B(G,μ⁻¹)|`. The exponents are uniform in the tame level
and Artinian modulus. Use the preceding local Shimura/Newton comparison for every `b` and the integral
spectral-centre operators as in §§2.3–2.5; nilpotence after localization
at a generic maximal ideal alone is a weaker conclusion.
(Source: AHTW, Theorems 2.2.2 and 2.5.7, pp.11–12 and 25–26.)

**Checks.**

- If `ℓ∤M` and `Δ` is a unit at a maximal ideal, the displayed annihilator is a unit, so the
  indicated nonmiddle cohomology vanishes there.
- If `ℓ` divides `M` the statement retains an `M`-power error; inverting `Δ` alone does not remove
  this coefficient torsion.
- Changing the tame subgroup or the modulus does not change `M` or `B`. The middle degree
  `q=d` is outside the asserted degree range.

*Needs:* PELModuli M0–M4; AG2.6: local Shimura complexes;
AG2.6: integral spectral centre;
EtaleCohomologyFoundations §§F.4.1–F.4.6; ArithmeticLocallySymmetricSpaces ALS.3–ALS.5a.

### Bounded potentially semistable pseudodeformation quotients

For a finite `K/ℚ_p`, a finite Galois extension `L/K`, an interval of integers `[a,b]`, a residual
`n`-dimensional determinant `D` over a finite field `k` and a sufficiently large finite coefficient
field `E`, construct the bounded potentially crystalline and potentially semistable
pseudodeformation quotients `R_D^{?,L,[a,b]}`, with no restriction on residual multiplicities.
The stable condition says that the Cayley–Hamilton representation is a subquotient of a
`ℤ_p`-lattice in a de Rham representation becoming crystalline or semistable over `L` with weights
in `[a,b]`. For a Hodge type `v` bounded by `[a,b]` and an inertia type `τ` factoring through
`I_{L/K}`, construct `R_D^{?,v,τ}`. It is reduced and `p`-torsion-free, its generic fibre is a
union of connected components of the bounded generic fibre, and an `O`-point to `ℚ̄_p` factors
through it exactly when its semisimple realization has the stated period condition and types.
Prove `boundedPseudodeformationQuotients`, including uniqueness of this quotient, coefficient
extension and formal-completion compatibility for the actual representation scheme and
its `GL_n`-quotient. No absolute irreducibility or multiplicity-free residual hypothesis is added.
(Source: AHTW, §§3.3.1–3.3.7, Theorem 3.3.6, pp.32–35.)

The API gives the universal quotient maps, their characteristic-zero point criterion,
change of the bounded interval and finite extension killing the inertia type, and the
comparison of invariant functions before and after completion. The formal comparison
uses the finite invariant algebra proved in §3.3.3, rather than a general formal GAGA claim.

**Checks.**

- A scalar residual determinant with repeated constituents is allowed; a framed
  deformation ring for one chosen absolutely irreducible residual representation cannot replace it.
- Empty characteristic-zero type locus gives the zero reduced flat quotient, not a
  claim that every residual determinant has an admissible lift.
- The crystalline quotient has `N=0`; potentially semistable points with nonzero `N` need
  not factor through that quotient even if their Hodge and inertia types agree.

*Needs:* LocalGaloisDeformationRings §F.2.11; IntegralHeckeAndGaloisDeterminants Layers 0–1;
AG2.P: finite-coefficient periods.

### Global stable period quotients and bounded local–global compatibility

For a number field `F`, a prime `p`, a finite set `S` containing its p-adic places,
`Σ⊆S_p(F)`, finite extensions `L_v/F_v` for `v∈Σ`, integers `h₁≤h₂`, and a continuous
n-dimensional residual determinant `D̄` of `G_{F,S}` over a finite field `k`, construct
`globalStablePeriodQuotients` over a coefficient DVR `O⊂E`, `E/ℚ_p` finite, with residue `k`.
Use the supplied universal determinant ring `R_D̄` and Cayley–Hamilton algebras.
For `?∈{pcr,pst}`, construct its quotient `R_D̄^{Σ,?,L,[h₁,h₂]}` characterized on local
Artinian `O`-algebras `A` with residue `k`: a determinant lift factors through it
exactly when it has a continuous Cayley–Hamilton realization `(B,ρ,D_B)` whose
finite `A`-module `B`, with the left action of `G_{F,S}` through `ρ`, satisfies every
local stable condition. That condition is being a subquotient of an integral lattice
in a de Rham representation of `G_{F_v}` becoming crystalline, respectively semistable,
over `L_v`, with all Hodge–Tate labels in `[h₁,h₂]`. Establish stability under finite
sums and subquotients and construct the universal stable Cayley–Hamilton quotient
which induces this determinant quotient. Arbitrary residual multiplicities are allowed.

Prove the characteristic-zero point criterion: the globally semisimple realization
`r_x` of `x:R_D̄→ℚ̄_p` factors through this quotient exactly when the **actual**
`r_x|G_{L_v}` is crystalline, respectively semistable, with the bounded weights for
every `v∈Σ`. The statement does not replace these restrictions by their semisimplifications.
Prove naturality under coefficient extension, extending `D̄` with the residue field,
and under enlargement of the bounded interval or the local extensions, with identity
and composition of quotient maps.

After coefficient enlargement sufficient to define highest weights `λ_v`, Bernstein
blocks `Ω_v` and their types, with their Hodge labels in the chosen interval and
inertial types killed by `L_v`, construct the maximal reduced p-torsion-free quotient
of the tensor product of this global quotient with the local type quotients over the
completed tensor product of the unrestricted local determinant rings.
Its characteristic-zero points have exactly the specified Hodge and inertial types on the
actual restrictions. Use exactness of periods on de Rham objects to compare their
labelled weights and semisimple WD parameters with local semisimplification, after
the global criterion has established admissibility. Construct the maps from each
Bernstein centre to the generic fibre which interpolate `WD(r_x|G_{F_v})^{F-ss}`.
Equality with the central character of a smooth irreducible `π_v∈Ω_v` implies
`WD(r_x|G_{F_v})^{ss}≅rec^T(π_v)^{ss}`; it does not recover `N`.

For the integral locally algebraic types `σ⁰_{Ω,λ}` and an `O`-integral Ω-system `L`,
construct the bounded integral Hecke/centre models of AHTW §4.3 on the supplied
Bernstein carriers. Intersect with the inverse image of the integral local type
quotient to obtain `Z⁰_D̄_v` and `η⁰:Z⁰_D̄_v→R_D̄_v^{λ_v,Ω_v}`.
Define `BoundedLGC` on an Artinian Hecke `T_v`-algebra `A` of Galois type, whose
spherical image is local, by both of the following factorizations, with residual
determinant `D̄` and determinant lift `D_A`:

- The global map `R_D̄→A` factors through `R_D̄^{{v},pst,L_v,[h₁,h₂]}`, with `L_v`
  and `[h₁,h₂]` depending only on `v,λ,Ω`.
- The local map `R_D̄_v→A` factors through `R_D̄_v^{λ_v,Ω_v}`, and the resulting
  composite with `η⁰` equals the given Hecke map `Z⁰_D̄_v→T_v→A`.

Prove compatibility of these two conditions with coefficient maps and the quotients
used in degree shifting. Their characteristic-zero criterion combines actual local
de Rhamness with the full labelled Hodge type and semisimplified local compatibility.
(Source: AHTW, Remark 3.3.14 and Theorem 3.3.17, pp.39–40;
§§3.3.18–3.3.22, pp.41–42; §4.3, pp.55–61; Definition 5.2.4,
equations (5.2.1)–(5.2.2), p.74.)

**Checks.**

- The weight `−8` specialization of the 11-adic Hida family through `Δ` in
  Remark 3.3.14 has absolutely irreducible global residual representation and de Rham
  local semisimplification, but its actual local extension is not de Rham. It passes
  the naive local-type condition and fails the global stable condition.
- Repeated scalar residual constituents are allowed. Neither a chosen residual
  representation nor multiplicity-free or absolutely irreducible residual data is required.
- Once the actual local representation is de Rham, its labelled weights and semisimple
  WD parameter agree with those of its semisimplification; without admissibility this
  reasoning does not establish de Rhamness.
- With `Σ=∅` the global quotient is unrestricted. The crystalline condition excludes
  a Tate-curve representation with nonzero monodromy, while the semistable condition
  with a suitable interval admits it.

*Needs:* local bounded pseudodeformations;
LocalGaloisDeformationRings §§F.2.2 and F.2.11;
IntegralHeckeAndGaloisDeterminants Layers 0–1;
SmoothRepresentationsOfLocalGroups SR.3 and SR.5;
AG2.P: finite-coefficient periods.

### P-ordinary arithmetic block comparison

The target `pOrdinaryArithmeticBlockComparison` has the following hypotheses and conclusion.

(a) General parabolic. Let `F` be CM, `N≥1`, `v|p` a place of `F`, `Q⊆GL_N` a standard
parabolic with block sizes `n₁,…,n_t`, and `Π` a regular algebraic conjugate-self-dual cuspidal
representation of `GL_N(𝔸_F)` of weight `λ`, or an isobaric sum of such representations,
pre-unitary at `v`, each of whose constituents has full Frobenius-semisimple WD comparison at
`v`. Assume that `ι⁻¹Π_v⊗V_λ^∨` is `Q`-ordinary, with ordinary part `π₁⊗…⊗π_t` on the Levi.
Then `r_ι(Π)|G_{F_v}` has a `G_{F_v}`-stable flag with potentially semistable graded pieces
`ρ_j` of rank `n_j`, the labelled Hodge–Tate weights of Hevesi Theorem 4.27, and
`WD(ρ_j)^{F-ss} ≅ rec^T(π_j⊗|·|^{−(n₁+…+n_{j−1})})`. Prove Hevesi Corollary 4.25: the
Frobenius-semisimple parameter of a `Q`-ordinary representation carries a monodromy-stable WD
flag with these graded pieces. Transport the flag to the filtered `(φ,N,G)`-module of
`r_ι(Π)|G_{F_v}`, compute the slope of each step from central characters (Hevesi Lemma 4.28),
and use weak admissibility to realize each step as a subrepresentation; regularity of `λ`
then fixes the Hodge–Tate labels of each `ρ_j`.

(b) Siegel ordinary cohomology. Let `[F⁺:ℚ]>1`, let `G̃` be the quasi-split unitary group of
rank `2n` over `F⁺` with Siegel parabolic, and take `S`, the place `a`, the cohomologically
cuspidal weight `λ̃` matching `λ_a`, the Bernstein block `Ω_a`, the `O`-integral `Ω_a`-system
`L_a`, the `S`-good level `K̃` and the condition at places outside `S` as in
**Bounded boundary comparison and degree shifting**. Assume `ExtremelyRegularIrreducibility m`
for every `m` with `2≤m≤2n`. With `d=n²[F⁺:ℚ]`, the module
`H^d(X̃_{K̃(0,u)}, W_{λ̃,L_a})^{a-ord}[1/p]` is semisimple over `T̃_a[1/p]`, and each
`ℚ̄_p`-point `f` of its Hecke algebra has a continuous `ρ̃_f : G_{F,S} → GL_{2n}(ℚ̄_p)` with
determinant `f(P̃_v)` at `v∉S`, potentially semistable at `a` with the labelled weights of AHTW
Theorem 5.4.13(2), and an actual `G_{F_a}`-stable rank-`n` subrepresentation `ρ₁` with labelled
weights `{λ_{τ,1}+n−1>…>λ_{τ,n}}` whose `rec⁻¹(WD(ρ₁))|det|^{(n−1)/2}` has supercuspidal support
given by the Bernstein centre of `Ω_a` through `T̃_a` and `f`. Identify the `a`-ordinary
middle-degree cohomology with automorphic forms by AHTW Lemma 5.4.12 and its corollary, with
semisimplicity by the argument of ArithmeticLocallySymmetricSpaces ALS.5b.9. Shin base change
gives conjugate-self-dual regular algebraic cuspidal constituents of rank at most `2n`, ACC+
Theorem 2.3.3 attaches `ρ̃_f`, and **Full polarized local–global compatibility at `ℓ`** (rank
one by local class field theory) supplies the full comparison required by (a), which is then
applied to the Siegel parabolic.

The common bridge is owned here; it uses the full Frobenius-semisimple comparison, and a
semisimple Weil parameter of the ambient representation supplies neither the flag nor `ρ₁`.

Throughout this target, regular weight; `Q`-ordinarity at the given place; full WD comparison
of every constituent at that place; in (b) the stated level, block, integral system and
auxiliary-place conditions and `ExtremelyRegularIrreducibility m` for `2≤m≤2n`.

**Checks.**

- For `t=1`, `Q=GL_N`, the flag is trivial and (a) is the full comparison of its input.
- For `GL₂`, `Q` the Borel and an ordinary unramified principal series, the restriction is
  triangular with sub-character of labelled weight `λ_{τ,2}`; the semisimple parameter
  `χ₁⊕χ₂` does not decide which character is the subobject, and the slope equality of
  Lemma 4.28 does.
- For a Borel-ordinary twist of Steinberg the flag of Corollary 4.25 is the monodromy-stable
  line `ker N`. A semisimple comparison leaves `N` on the filtered module undetermined, so it
  does not show that the line selected by slopes is `N`-stable, as a sub-`(φ,N)`-module must be.

*Needs:* AG2.6: full polarized local–global compatibility at `ℓ`; AG2.6: polarized
admissibility at the coefficient prime; ArithmeticLocallySymmetricSpaces ALS.5b.4 and ALS.5b.9;
EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4;
SmoothRepresentationsOfLocalGroups SR.3 and SR.5; ArithmeticGaloisRepresentations Layer 2;
PadicHodgeTheory §§3.4–3.5; AG2.P: finite-coefficient periods and comparison.

(Sources: Hevesi, Corollary 4.25, p.67; Theorem 4.27, p.69, with proof, p.71; Lemma 4.28,
pp.69–70; Remark 4.29, p.72. AHTW, Lemma 5.4.12 and the following paragraph, p.97; Theorem
5.4.13(1)–(4), pp.97–98; proof of Lemma 5.4.18, pp.104–107. ACC+, Theorem 2.3.3, pp.935–937.)

### Bounded boundary comparison and degree shifting

Let `F` be a CM field containing an imaginary quadratic field in which `p` splits (AHTW,
Assumption 5.2.6), so every `p`-adic place of `F⁺` splits in `F`, and take the S-good levels of
AHTW, Proposition 5.2.8, for a finite set `S` of finite places of `F` that is stable under
complex conjugation and contains the `p`-adic places. Fix the coefficient place `a|p` of `F`,
put `a⁺=a|F⁺`, and fix `b⁺∈S_p(F⁺)` with `b⁺≠a⁺` such that
`Σ_{v⁺∈S_p(F⁺)−{a⁺,b⁺}} [F⁺_{v⁺}:ℚ_p] > [F⁺:ℚ]/2`; the sum runs over places of `F⁺`.
For every finite place `v∉S` with residue characteristic `l`, require that either `l` is
unramified in `F` and `S` contains no `l`-adic place of `F`, or `l` splits in an imaginary
quadratic subfield of `F`. The printed AHTW v1 condition asks instead for an `l`-adic place in
`S`; no finite `S` satisfies that version, by the Chebotarev Check below, and the condition used
here is that of ACC+, Theorems 2.3.5 and 2.3.7, through which the Galois-type quotients of
Scholze's construction enter. Prove the enlargement lemma: for every finite `S₀`
containing the `p`-adic places, the set `S` of all places of `F` above the rational primes below
`S₀` or ramified in `F` is finite, stable under complex conjugation, contains `S₀`, and
satisfies the first alternative at every finite place outside it. Construct the auxiliary
Hecke element `T_n` of that proposition.
Assume `ExtremelyRegularIrreducibility m` for every `m` with `2≤m≤2n`.
For every dominant weight `λ` and integral Bernstein coefficient system `L`, prove
`boundedBoundaryDegreeShifting`: there are `N₁≥1`, depending only on `n` and `F`, and `N₂≥0`,
depending additionally on a, `λ` and `L`, such that for all degrees, levels, moduli `m` and supported
maximal ideals there are Hecke ideals `J_m` with `(T_n² p^N₂ J_m)^N₁ = 0`, and the quotient
determinant satisfies `BoundedLGC` at a: retain both the global stable Cayley–Hamilton
factorization and the local type/Bernstein factorization, with their fixed bounds.
Carry both through the boundary comparison, degree shift, quotient maps and passage
through all moduli. Use ordinary/compact-support
and Borel–Serre boundary cohomology with their specified coefficient modules; the interior
part alone does not establish the boundary assertion. The local factorization at a comes from
**P-ordinary arithmetic block comparison** (b): after a character twist separating the two
residual factors, lift the central idempotent onto the factors of the residual determinant to
the projection onto the actual subrepresentation `ρ₁`, and read the type and period
conditions from `ρ₁`. For a spherical cuspidal eigensystem,
a finite-order character twist makes `T_n` nonzero, so the characteristic-zero point satisfies
the comparison after all moduli are combined. Prove the source extension/descent step removing
the auxiliary place hypotheses: after a cyclic CM base change arranging Assumption 5.2.6 and the
inequality for some `b⁺`, choose `S` by the enlargement lemma from the ramification of
`π` and the `p`-adic places. This yields the following all-CM theorem.
(Source: AHTW, Assumption 5.2.6, Lemma 5.2.7, Proposition 5.2.8, Theorem 5.2.9 and
Remark 5.2.10, pp.74–78; Lemma 5.4.18 and proof, pp.104–107; ACC+, Theorems 2.3.5 and 2.3.7 and the remark after 2.3.5,
pp.937–938.)

**Checks.**

- A generic localization with `T_n` invertible recovers the earlier unit-localized argument.
- Requiring an `l`-adic place in `S` is never satisfiable: Chebotarev in a normal closure
  `M/ℚ` of `F` gives infinitely many `l` unramified in `M` with Frobenius conjugate to complex
  conjugation. Such an `l` outside the primes below `S` has no place in `S` and is inert in
  every imaginary quadratic subfield, whereas the enlargement lemma puts every place
  above it outside `S` in the first alternative.
- For `F⁺=ℚ(√5)`, `F=ℚ(√5,i)` and `p=29`, which splits completely since `11²≡5` and
  `12²≡−1 mod 29`, `a` and `b⁺` above the two distinct places of `F⁺` leave an empty sum,
  so `0>1` fails; counting the four places of `F` instead would wrongly give `2>1`.
- `T_n` nonzero at a characteristic-zero point is enough to remove the annihilated error
  there, although `T_n` need not be a unit in the integral Hecke algebra.
- The `p^N₂-torsion` error depends on the coefficient system; treating `N₂` as independent of
  `L` would assert a stronger uniformity than this theorem. Reducible residual systems retain
  boundary terms instead of using non-Eisenstein vanishing.

*Needs:* quantitative annihilators;
bounded pseudodeformations;
global stable period quotients and both LGC factorizations;
AG2.6: P-ordinary arithmetic block comparison;
ArithmeticLocallySymmetricSpaces ALS.4–ALS.5b;
IntegralHeckeAndGaloisDeterminants §4.2; the base-change and patching targets of AG2.3.

### Nonselfdual de Rham comparison at `ℓ`

The target `allCMCoefficientPrimeComparison` has the following hypotheses and conclusion.

A’Campo–Hevesi–Thorne–Whitmore v1, Theorem 1.2.1: for every CM `F, n≥1`, regular algebraic cuspidal `π` of highest weight a, `ℓ, ι` and `v|ℓ, r_{π,ℓ,ι}|G_{F_v}` is de Rham, has `HT_τ={a_{ιτ,i}+n−i}`, and `WD(r_{π,ℓ,ι}|G_{F_v})^{ss} ≅ ι⁻¹ rec^T(π_v)^{ss}`. Here `rec^T(π_v)=rec(π_v|det|^{(1−n)/2})`. No conjugate self-duality, residual irreducibility or decomposed genericity hypothesis is imposed on `π`. This is the July 2026 preprint theorem, with its precise input chain recorded below. That chain includes AHTW Theorem 5.4.13, used in Lemma 5.4.18, which applies ACC+ Theorem 2.3.3; part (c) of that theorem at `p`-adic places is the polarized coefficient-prime comparison for conjugate-self-dual constituents of rank at most `2n`, used in its full Frobenius-semisimple form through **P-ordinary arithmetic block comparison**, which produces the actual local subrepresentation that Lemma 5.4.18 projects onto. For `n≥2` the target therefore assumes `ExtremelyRegularIrreducibility m` for every `m` with `2≤m≤2n`, and every target below that uses this branch carries the same hypothesis.

For `n=1` the target is unconditional and does not use this chain. A regular algebraic cuspidal `π` of `GL₁(𝔸_F)` is an algebraic Hecke character `χ`, and `r_{π,ℓ,ι}=r_{ℓ,ι}(χ)` is AG2.0's character. Its restriction to `G_{F_v}` is Hodge–Tate, hence locally algebraic; after dividing by the crystalline character extending the algebraic part on `O_{F_v}^×` it has finite image on inertia, so it is de Rham with `N=0` and `HT_τ={a_{ιτ}}`. The explicit adelic formula of AG2.0, evaluated at `F_v^×`, cancels the algebraic factor `∏_τ(ι⁻¹τ)(x_v)^{a_τ}` against that crystalline character, giving `ι WD(r_{ℓ,ι}(χ)|G_{F_v}) ∘ Art_{F_v} = χ_v = rec^T(π_v)`. Downstream exports dispatch on the rank: rank one uses this branch, rank `n≥2` the conditional one.

*Needs:* AG2.0: good-place attachment; AG2.0: Hodge multiset; AG2.0: the `l`-adic character of an algebraic Hecke character; AG2.P: finite-coefficient periods and comparison; AutomorphicGaloisRepresentationsPartII AG2.4; AG2.4: HLTT existence; AG2.6: global stable period quotients; AG2.6: P-ordinary arithmetic block comparison; AG2.6: bounded boundary comparison and degree shifting; AG2.6: full polarized local–global compatibility at `ℓ`; AG2.6: polarized coefficient-prime domination.

(Sources: AHTW, Theorem 1.2.1, p.5; §1.2.3–1.2.5; Theorem 5.2.9; Theorem 5.4.13, pp.97–98, and Lemma 5.4.18 with its proof, pp.104–107; ACC+, Theorem 2.3.3(c), pp.935–937; for `n=1`, BLGGT §A.2, pp.86–87, and Conrad-lift, Lemma 4.1, pp.11–12, and Proposition B.4, p.35.)

**Checks.**

- Rank one recovers the algebraic Hecke-character Hodge labels and local reciprocity
  without any irreducibility hypothesis: for `F` imaginary quadratic and `χ` with
  `a_τ=1, a_{τc}=0`, the conclusion holds at `v|ℓ` although
  `ExtremelyRegularIrreducibility 2` is not assumed.
- In rank one, `χ=‖·‖_F` gives `r=ε_ℓ`, crystalline at `v|ℓ` with `HT_τ={−1}`, and its
  WD character is `|·|_v` composed with `Art_{F_v}⁻¹`, unramified with `N=0`.
- A nonselfdual cuspidal input retains actual local de Rhamness; no residual
  irreducibility or decomposed genericity is used to discard its local extensions.
- Equality of semisimple WD parameters permits different monodromy operators. Full
  ramified monodromy equality is not a conclusion of this theorem.

### Generic monodromy orbits and local genericity

For a finite extension `K/ℚ_ℓ` and continuous semisimple complex Weil representation `r` on `V`,
construct `P(r)=Hom_{W_K}(V,V(−1))` with the action of the connected reductive centralizer
`G(r)`. Prove finiteness of its orbits and existence of a unique open orbit, identified by
`Hom_WD((r,N),(r(1),N))=0`. Show every orbit lies in its closure and deduce the dominance
inequalities of AG2.5 against any generic parameter with this semisimple Weil part.
For the local components of a global cuspidal `GL_n` representation, use
AutomorphicFormsOnReductiveGroups §4.3’s Whittaker models from the cuspidal Fourier
expansion; these local components need not be locally cuspidal. Prove the LLC translation: an irreducible admissible local representation
is generic exactly when its WD parameter satisfies the displayed Hom vanishing. Deduce
AHTW Corollary 6.0.6 for every WD representation with the same semisimplification as that
local parameter. Transfer along `ι` to the coefficient field before applying the result.
(Sources: AHTW, §6, Lemma 6.0.3, Definition 6.0.4, Proposition 6.0.5 and
Corollary 6.0.6, pp.112–113; its proof invokes the generic LLC criterion.)

**Checks.**

- For `r=1` in rank one, `P(r)=0`, its single orbit is open and the Hom condition holds;
  all monodromy operators are zero.
- For Weil characters 1 and `|·|` the allowed nonzero rank-one `N` form the open orbit;
  `N=0` is in its closure and is dominated by that generic parameter.
- For a repeated trivial character, `P(r)=0` and the zero orbit is generic as a WD
  parameter. This characteristic-zero WD condition is distinct from the residual
  strong-genericity test, which excludes repeated Frobenius eigenvalues.

*Needs:* ArithmeticGaloisRepresentations §§2.4–2.6;
AG2.5: monodromy order;
EndoscopicTransferAndUnitaryTraceComparison §§10.18–10.27 and §10.30;
ArithmeticLocallySymmetricSpaces §ALS.F.6 for cusp forms;
AutomorphicFormsOnReductiveGroups §4.3 for the cuspidal Fourier expansion and Whittaker models.

### Nonselfdual monodromy bound at `ℓ`

The target `nonselfdualCoefficientPrimeMonodromyBound` has the following hypotheses and conclusion.

Under the preceding theorem, `WD(r_{π,ℓ,ι}|G_{F_v})^{F-ss} ≺ ι⁻¹rec^T(π_v)`. Equality of the semisimplified Weil representations comes from the preceding comparison theorem, not from the definition of the order. The order compares, for each irreducible Weil representation up to unramified twist, the sums of the largest Jordan-block sizes: every first-`i` sum on the left is `≤` the corresponding sum on the right. It is Varma’s order of §9, Definition 1, used in AHTW Definition 6.0.2. Full equality of `N` is not asserted for a general nonselfdual ramified `π_v`.

*Needs:* AG2.6: nonselfdual de Rham comparison; AG2.6: generic WD orbits and local genericity; ArithmeticGaloisRepresentations Layer 2.

(Sources: AHTW, Corollary 1.2.2, p.6; Definitions 6.0.1–4, Corollary 6.0.6, pp.112–113.)

### Nonselfdual spherical and Iwahori admissibility

The target `allCMCrystallineIwahoriAdmissibility` has the following hypotheses and conclusion.

For arbitrary regular algebraic cuspidal `π` over a CM field, `r_{π,λ}|G_{F_v}` is crystalline when `v|ℓ` and `π_v` is spherical, and is semistable when `π_v` has Iwahori-fixed vectors. In the spherical case its crystalline Frobenius polynomial is the `rec^T` Satake polynomial. Apply AG2.P's `arithmeticPadicMonodromy` to the de Rham local member, then its `potentiallySemistableWD` and inertia/crystallinity criteria. Semisimplified compatibility gives trivial WD inertia for Iwahori `π_v`, and the monodromy bound against `N=0` forces `N=0` in the spherical case. Iwahori semistability does not establish full monodromy equality.

*Needs:* AG2.6: nonselfdual de Rham comparison; AG2.6: nonselfdual monodromy bound; AG2.P: arithmetic p-adic monodromy; AG2.P: finite-coefficient periods and comparison.

(Sources: AHTW, Theorem 1.2.1 and Corollary 1.2.2, pp.5–6.)

### Totally real polarized coefficient-prime descent

The target `totallyRealPolarizedCoefficientPrimeComparison` has the following hypotheses and conclusion.

For a regular algebraic essentially self-dual cuspidal `π` over a totally real `F`, the attached BLGGT representation has the stated labelled Hodge weights, is de Rham, is crystalline at spherical coefficient-prime places and semistable at Iwahori places. Full coefficient-prime WD comparison is obtained from the polarized CM theorem by choosing a quadratic CM extension split at the target finite place, retaining cuspidality, matching the base-changed Galois representation, and comparing that unchanged local completion; for `n≥2` it therefore assumes `ExtremelyRegularIrreducibility n`. This also covers the totally-real members used by Newton–Thorne; no unrestricted nonpolarized totally-real assertion is added.

*Needs:* AG2.3: totally real polarized existence; AG2.0: good-place attachment; AG2.0: Hodge multiset; AG2.6: full polarized comparison; AG2.6: Hodge comparison by descent; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4.

(Sources: BLGGT, Theorem 2.1.1, pp.33–34; §2.1 terminology.)

### Embedding independence and semisimple uniqueness

The target `coefficientEmbeddingIndependence` has the following hypotheses and conclusion.

Fix `π`, its coefficient field `M_π`, a place `λ` and an actual embedding `e:M_π→ℚ̄_ℓ` inducing `λ`. Any two continuous semisimple `n`-dimensional representations of `G_F` with the common good geometric Frobenius polynomials `P_v` for `v` outside a finite set are isomorphic over `ℚ̄_ℓ`. Thus `r_{π,ℓ,ι}`, with `ι:ℚ̄_ℓ≅ℂ`, depends only on `e=ι⁻¹|M_π`, up to linear isomorphism. This determines an isomorphism class, not a preferred basis or unique intertwiner. Different `λ` are compared by the common `M_π-polynomials`, not by identifying their topological coefficient fields.

*Needs:* AG2.0: good-place attachment; AG2.0: integral Frobenius polynomial; ArithmeticGaloisRepresentations Layer 5; Mathlib `Matrix.charpoly_units_conj`.

(Sources: ACC+, §7.1, pp.1093–1094.)

### Compatible system attached to `π`

For a regular algebraic cuspidal `π` of `GL_n(A_F)`, with `F` CM, or `F` totally real and `π` polarized, assemble `R_π` on the supplied `AutomorphicSystemData`: `M_π` is the field fixed by `σ∈Aut(ℂ)` preserving `π^∞; S_π` is the finite ramification set of `π; P_v(X)` is the common monic `rec^T` geometric Frobenius polynomial; `r_λ` is the attached continuous semisimple representation; `H_τ={a_{τ,i}+n−i}`. Populate weak compatibility using all-CM de Rham admissibility, or the totally-real polarized theorem, and crystallinity for `v` outside `S_π` above `ℓ`. Purity, polarization and all-place strict compatibility are separate branch predicates, not fields asserted for every `π`.

The required API is:

- `compatibleSystem`: Map `π` to `R_π` in the supplied `AutomorphicSystemData` carrier.
- `compatibleSystem_member`: The `λ`-member after scalar extension along a chosen map inducing `e=ι⁻¹|M_π` is `r_{π,ℓ,ι}`, up to linear isomorphism.
- `compatibleSystem_goodPolynomial`: At `v` outside `S_π`, the common polynomial is `P_v(X)`.
- `compatibleSystem_hodgeTate`: The labelled multiset is `{a_{τ,i}+n−i}`, including multiplicities.
- `compatibleSystem_weak`: `R_π` satisfies the AG2.P `Weak` predicate, with explicit normalization conversion.
- `compatibleSystem_embedding`: If `ι₁⁻¹|M_π=ι₂⁻¹|M_π`, the members are linearly isomorphic.
  If `e₁` and `e₂` merely induce the same `λ`, choose `σ∈Gal(ℚ̄_ℓ/ℚ_ℓ)` with `e₂=σe₁`;
  the second member is linearly isomorphic to `σ` applied to the first, giving a `σ-semilinear`
  comparison of the original members, with Hodge embedding labels transported by `σ`.

**Checks.**

- For an algebraic Hecke character `ψ`, this is its class-field-theoretic compatible system

- At `n=2, a=(k−2,0)`, the Hodge multiset is `{k−1,0}` and its sum is `k−1`

- On the exact classical/Hilbert overlap, each `λ`-member is `M_R19`, equivalently the dual of `r_R19,arith`, after the stated Hilbert adapters

- Over `F=ℚ(i)`, pull an order-three Dirichlet character modulo 7 back along the norm.
  Its coefficient field is `M_π=ℚ(ζ₃)`. At `ℓ=2` the two embeddings induce the same inert
  place, but conjugate primitive cube-root Frobenius values give nonisomorphic lines.
  Their reductions over `𝔽̄₂` are conjugate by `x↦x²` and remain distinct.

- A weak instance with only good-place polynomials cannot supply an equality of monodromy at an unspecified bad place.

*Needs:* AG2.0: good-place attachment; AG2.0: integral Frobenius polynomial; AG2.0: Hodge multiset; AG2.0: Rationality of the good Hecke polynomials; AG2.6: embedding independence; AG2.6: Nonselfdual spherical and Iwahori admissibility; AG2.6: Totally real polarized coefficient-prime descent; SmallRamificationAndAbelianVarietyBaseCases §5.0d; AG2.P: Arbitrary-rank compatible data and operations.

(Sources: ACC+, §7.1, pp.1093–1094; AHTW, Theorem 1.2.1, pp.5–6.)

### Complex and local coefficient conjugation

The target `coefficientConjugation` has the following hypotheses and conclusion.

For RAESDC `π` over totally real `F` or RAECSDC `π` over CM `F, σ∈Aut(ℂ), r_{σπ,ι}≅r_{π,σ⁻¹ι}`. If `σ_ℓ∈Gal(ℚ̄_ℓ/ℚ_ℓ)` and `σ=ισ_ℓι⁻¹`, then `σ_ℓ(r_{π,ι})≅r_{π,ισ_ℓ⁻¹}≅r_{π,σ⁻¹ι}≅r_{σπ,ι}`. Coefficient conjugation acts on matrix entries; the absolute Galois group `G_F` is unchanged. Twisted tensor products use the semilinear convention of NT footnote 4.

*Needs:* AG2.6: embedding independence; AG2.0: Rationality of the good Hecke polynomials; ArithmeticLocallySymmetricSpaces §§ALS.F.6–ALS.F.7.

(Sources: NT, Theorem 5.1 and Lemma 5.2, p.38, footnote 4.)

### Strong coefficient field

For `Π` regular cohomological cuspidal conjugate-self-dual (including Liu’s relevant specialization with archimedean principal series `arg^{1−n},arg^{3−n},…,arg^{n−1}`) and a number field `E⊂ℂ` containing `ℚ(Π), E` is a strong coefficient field if for each finite `λ` of `E` there exists a continuous `E_λ`-linear `ρ_{Π,λ}` such that, for every embedding `e:E→ℚ̄_ℓ` inducing `λ` and every `ι:ℚ̄_ℓ≅ℂ` with `ι⁻¹|E=e`, scalar extension along the corresponding completed map `e_λ` identifies `ℚ̄_ℓ⊗_{E_λ,e_λ}ρ_{Π,λ}` with `ρ_{Π,ι}`. Different `e` use different scalar-extension maps and give semilinear conjugates; they need not be linearly isomorphic. Members are unique up to `E_λ`-conjugacy when descended by the semisimple realization theorem. This is a field of definition of the representations, stronger than the field of rationality of good polynomials. It includes a family of descended realizations, not canonical bases or canonical intertwiners. This generalizes Liu’s named definition beyond its relevant specialization, using the simultaneous realization condition justified by Chenevier–Harris Proposition 3.2.5; Liu’s conditional minimal-field assertion remains confined to his specialization and Hypothesis 3.2.10.

The required API is:

- `IsStrongCoefficientField`: The preceding `all-λ` realization property.
- `strongCoefficientField_member`: Choose an `E_λ-realization` with its scalar-extension isomorphism.
- `strongCoefficientField_baseChange`: For `E′/E` finite, each `λ′`-member is `E′_λ′⊗_{E_λ}ρ_{Π,λ}`, with the identity and composition laws.
- `strongCoefficientField_unique`: Descended semisimple members are unique up to conjugacy, not as based homomorphisms.

**Checks.**

- A rank-one character whose values lie in `E` has the expected `E_λ-realizations`

- Changing `E` to a finite extension gives exactly the coefficient base-change operation of SmallRamificationAndAbelianVarietyBaseCases §5.0d at every `λ′`

- The definition does not identify rational Frobenius traces with a canonical `E_λ-model`; a nontrivial Schur obstruction must be split

- Nonzero scalar multiples of an intertwiner remain intertwiners, so uniqueness is of the isomorphism class.

*Needs:* AG2.6: embedding independence; AG2.0: Rationality of the good Hecke polynomials; ArithmeticGaloisRepresentations Layer 5; SmallRamificationAndAbelianVarietyBaseCases §5.0d.

(Sources: Liu, Definition 3.2.5 and Remark 3.2.6, printed p.145; CH, Proposition 3.2.5, author-copy p.12.)

### Uniform strong realization of polarized systems

The target `existsUniformStrongCoefficientField` has the following hypotheses and conclusion.

For a conjugate-self-dual cohomological cuspidal `Π` over CM `F`, there is one finite number field `E⊂ℂ` which is a strong coefficient field for all `λ`. Chenevier–Harris Proposition 3.2.5 enlarges the coefficient field `E_0` of good polynomials by roots of regular semisimple good Frobenius elements at two places of different residue characteristics. Each `λ` can use one place away from `ℓ`; a split regular Frobenius and `E_0`-valued traces split the semisimple descent obstruction. No assertion that the minimal rationality field itself is strong is included.

*Needs:* AG2.6: polarized admissibility; AG2.6: Strong coefficient field; ArithmeticGaloisRepresentations Layer 5; AG2.3: common realization field.

(Sources: CH, Proposition 3.2.5, p.12; Liu, Remark 3.2.6, printed p.145.)

### Purity and polarization of the polarized system

The target `polarizedSystemPurity` has the following hypotheses and conclusion.

For a regular algebraic polarized cuspidal `(π,χ)` with `a_{τ,i}+a_{τc,n+1−i}=w, R_π` is pure and BLGGT-strictly pure of weight `W=w+n−1`. Its polarization is `r_λ^c≅r_λ^∨⊗μ_λ, μ_λ=ε_ℓ^{1−n}r_{χ,λ}`; the `χ`-system has purity weight `2w`. Total oddness uses `μ_λ(c_v)=(−1)^{n−1+w}χ_v(−1)`, so the required sign is `χ_v(−1)=(−1)^{n+w}`. BLGGT strict purity describes pure common WD parameters away from the coefficient prime; all-place strict compatibility needs the separately proved coefficient-prime theorem, not a change of definition, and for `n≥2` carries its hypothesis `ExtremelyRegularIrreducibility n`.

*Needs:* AG2.6: automorphic compatible system; AG2.6: full polarized comparison; ArithmeticGaloisRepresentations §7.4; AG2.0: multiplier parity; AG2.5: full away-prime comparison; SmallRamificationAndAbelianVarietyBaseCases §5.0d; AG2.P: Arbitrary-rank compatible data and operations.

(Sources: BLGGT, Theorem 2.1.1(1)–(2), pp.33–34; §5.1 pp.62–65.)

### Very weak compatibility and the density-one DGI route

The target `veryWeakCompatibilityUnderDGI` has the following hypotheses and conclusion.

The weak compatibility proved for the constructed `R_π` implies very weak compatibility by the implication Weak `⇒` VeryWeak of AG2.6, Weak, very weak and extremely weak automorphic data, on the same data. This gives, in particular, the conclusions of ACC+ Lemmas 7.1.9–7.1.10. Lemma 7.1.9 originally assumes a density-one set of rational `ℓ` for which every residual member is absolutely irreducible and decomposed generic; Lemma 7.1.10 proves very weak compatibility in rank two through its constituent/image arguments. That Fontaine–Laffaille/degree-shifting proof is an arithmetic consumer in PA.1; it is not an input to the all-CM construction here. None of these statements gives residual irreducibility at every coefficient place.

*Needs:* AG2.6: automorphic compatible system; SmallRamificationAndAbelianVarietyBaseCases §5.0d; AG2.P: Arbitrary-rank compatible data and operations; AG2.6: Weak, very weak and extremely weak automorphic data.

(Sources: ACC+, Lemmas 7.1.9–7.1.10, pp.1093–1094.)

### Comparison strength at the coefficient prime

The target `coefficientPrimeComparisonStrength` has the following hypotheses and conclusion.

The polarized branch has de Rham admissibility and, under `ExtremelyRegularIrreducibility n` for `n≥2`, full pure WD comparison at every coefficient-prime place. The all-CM nonselfdual branch has de Rham admissibility, full labelled Hodge weights, ss compatibility and the monodromy upper bound of AHTW v1, unconditionally in rank one and, in rank `n≥2`, under `ExtremelyRegularIrreducibility m` for every `2≤m≤2n`, inherited from `allCMCoefficientPrimeComparison`; spherical crystallinity and Iwahori semistability follow from WD criteria. Full `N` equality for general nonselfdual ramified places is not supplied by these statements. Fontaine–Laffaille, ordinary lifting and residual-image conclusions retain their separate consumer hypotheses.

*Needs:* AG2.6: full polarized comparison; AG2.6: Nonselfdual spherical and Iwahori admissibility; AG2.6: nonselfdual monodromy bound.

(Sources: AHTW, Theorem 1.2.1 and Corollary 1.2.2, pp.5–6; Caraiani-p, Theorem 1.1, pp.1–2.)

### Rank-two comparison with the independent rank-two member

For a fixed classical newform of weight `k≥2` or regular cohomological Hilbert eigenform in the exact independent classical/Hilbert overlap, identify the AG2 `λ`-member with the independent member after converting geometric/arithmetic Frobenius and the stated Tate twist. With AG2.P’s named adapters this is `r_AG2≅M_R19≅(r_R19,arith)^∨`; for classical weight `k` this gives geometric polynomial `X²−a_qX+ψ(q)q^{k−1}, HT_AG2={0,k−1}`, and `det=r_ψ ε^{1−k}` where `r_ψ(Frob_q^geom)=ψ(q)`. For Hilbert `(k_τ,w)` use AG2.P’s central-character/cyclotomic adapters and the
R16.6.3–R16.6.4 cohomological weight/Frobenius conversion with its integral parity
hypotheses. In particular `M_R19=ρ`, not `σ_Carayol^∨`. Use AG2.P’s cohomological polarized rank-two comparison from CH Theorem 4.2(b)–(d); comparisons outside that theorem’s spherical/Iwahori conclusions retain their independently proved local hypotheses.

*Needs:* AG2.6: embedding independence; AG2.P: independent classical/Hilbert members; AG2.0: integral Frobenius polynomial.

(Sources: CH, §1.5 formula (1.6), p.7; Theorem 3.2.3, pp.11–12.)

### Coefficient independence of tensor automorphy

Prove `tensorAutomorphyIndependentOfIota` with the following hypotheses.

Let `π_1` and `σ` be RAESDC over a totally real `F`. Suppose `r_{π_1,ι}⊗r_{σ,ι}` is irreducible and automorphic for one `(ℓ,ι)`, in the RAESDC sense used by Newton–Thorne. Then `r_{π_1,j}⊗r_{σ,j}` is automorphic for every prime `q` and `j:ℚ̄_q≅ℂ`. Match the automorphic realization’s good polynomial to the tensor-product polynomial using coefficient conjugation, then use semisimple uniqueness. This does not establish automorphy of an arbitrary tensor product; its initial automorphy and irreducibility are hypotheses.

*Needs:* AG2.6: coefficient conjugation; AG2.6: embedding independence; SmallRamificationAndAbelianVarietyBaseCases §5.0d; AG2.P: Arbitrary-rank compatible data and operations.

(Sources: NT, Proof of Lemma 5.8, pp.42–44, cf. proof of Lemma 2.1.)

### `GSp₄` crystalline Hodge comparison

The target `gsp4CrystallineHodgeComparison` has the following hypotheses and conclusion.

Assume the symplectic classification contract of EndoscopicTransferAndUnitaryTraceComparison §§11.0g–11.0h and AG2.P’s spin realization. In Calegari–Geraghty Proposition 6.8, for a cuspidal GSp4 eigenform `f` of good `p`-level and weight `(a,b)`, `a≥b≥3`, the `r_f` supplied by the `GSp₄` construction and AG2.P’s `gsp4TransferDictionary` is crystalline at `p` with `HT={0,b−2,a−1,W}, W=a+b−3`. If `f` is also an eigenform for the Hecke operators at `p, det(X−φ)=λ_f(Q_p(X))` in their monic convention. The eigenform-at-`p` condition specifies this polynomial; crystallinity in the proposition’s good-level setting does not depend on that additional condition.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.2; AG2.P: GSp₄ construction and transfer; AG2.6: polarized admissibility.

(Sources: CG, Proposition 6.8(3), author-copy pp.38–39.)

### Ordinary `GSp₄` triangular shape

The target `ordinaryGsp4CoefficientPrimeShape` has the following hypotheses and conclusion.

Retain the symplectic classification contract of EndoscopicTransferAndUnitaryTraceComparison §§11.0g–11.0h and AG2.P’s spin realization. Under CG Proposition 6.8(4), assume `f` is a `p`-Hecke eigenform and ordinary: its `T_{p,1}` and `Q_{p,2}` eigenvalues are units. The roots `α,β,γ,δ` of `λ_f(Q_p(X))` have valuations `0,b−2,a−1,W` and are distinct. `r_f|G_Qp` has the upper-triangular diagonal `unram(α), ε^{−(b−2)}unram(p^{−(b−2)}β), ε^{−(a−1)}unram(p^{−(a−1)}γ), ε^{−W}unram(p^{−W}δ)`. The parameters of the unramified characters are units. Distinctness follows from the four different valuations, not from ordinarity in an unspecified singular weight.

*Needs:* AG2.6: GSp₄ crystalline Hodge comparison; AG2.P: finite-coefficient periods and comparison; AG2.P: GSp₄ construction and transfer.

(Sources: CG, Proposition 6.8(4), author-copy p.39.)

### Pilloni `GSp₄` normalization comparison

Under the symplectic classification contract of EndoscopicTransferAndUnitaryTraceComparison §§11.0g–11.0h and AG2.P’s spin realization, Pilloni Theorem 5.1.7.1 for cuspidal `π` with discrete-series `π_∞` and parameter `(λ_1,λ_2;−λ_1−λ_2+3)` gives a de Rham representation with `HT={0,−λ_2,−λ_1,−λ_1−λ_2}`. At `p` outside the nonspherical set it is crystalline and `det(1−Xφ)=Θ_π(Q_p(X))`. Its geometric Frobenius and `HT(ε)=−1` conventions require reciprocal conversion `X^4Q_p(1/X)` to the monic polynomial. The similitude exponent is `ε^{λ_1+λ_2}`. Pilloni’s item (5) prints `χ_p^{−λ_1−λ_2}`, whereas item (3) pairs the Hodge weights to `−λ_1−λ_2`. Since `HT(χ_p)=−1`, the multiplier has exponent `λ_1+λ_2`; its finite-order factor has Hodge weight zero. For `(λ_1,λ_2)=(1−a,2−b)` this is CG’s `ε^{−(a+b−3)}`. Substitution `λ_1=1−a, λ_2=2−b` gives CG’s four Hodge numbers; identifying the automorphic representations also requires AG2.P’s `gsp4TransferDictionary` on its stated level and coefficient domain.

*Needs:* AG2.6: GSp₄ crystalline Hodge comparison; AutomorphicGaloisRepresentationsPartII AG2.2; AG2.P: GSp₄ construction and transfer.

(Sources: Pilloni, Theorem 5.1.7.1(3)–(5), Remark 5.1.7.1, author-copy pp.22–23.)

### Examples

For `k=12` the rank-two Hodge multiset is `{0,11}`, with sum 11. The `GSp₄` regular weight `(3,3)` has labels `{0,1,2,3}`; neither determinant sum alone recovers its full labelled data nor ss WD comparison determines `N`.

### Dependencies

AG2.P; AG2.0–AG2.5; CrystallineCohomology CR.6; WeightsInEtaleCohomology R34.3; the quantitative and bounded targets stated in this layer; LocalGaloisDeformationRings §F.2.11.

## Layer AG2.7: Residual representations, Hecke ideals and arithmetic exports

Choose finite local models and stable lattices before defining residual semisimplifications. Relate their Frobenius polynomials to maximal Hecke ideals. Distinguish local genericity, genericity at every place above a split prime, absolute irreducibility and the stronger ratio condition. The final exports retain exactly the branch-specific characteristic-zero and residual hypotheses.

Residual polarization needs the reduction-and-semisimplification target below for the CM conjugation extension with its coefficient-characteristic hypotheses. A deformation problem that already assumes that extension cannot prove it. The selected two-block CS export requires the separate local-normalization input of Remark 5.5.6; a cuspidal RACSDC theorem does not by itself establish the comparison for that sum.

### Finite `p`-adic realization before lattices

The target `existsFinitePadicRealization` has the following hypotheses and conclusion.

For each continuous `r_{π,ℓ,ι}:G_F→GL_n(ℚ̄_ℓ)`, specialize ArithmeticGaloisRepresentations
§1.5’s `baire_descent` to the compact Hausdorff absolute Galois group to obtain
`existsFinitePadicRealization`: its matrices lie in a finite extension `E/ℚ_ℓ`. Apply this
before the stable-lattice theorem. The coefficient-descent theorem and its Baire argument
are supplied by §1.5. A uniform strong number field on the polarized branch is not needed
for this local specialization.

*Needs:* AG2.6: automorphic compatible system; ArithmeticGaloisRepresentations §1.5 (`baire_descent`).

(Sources: BLGGT, §2.1, after Theorem 2.1.1, p.34; CG, Proof of Proposition 6.8, author-copy p.39.)

### Residual representation of `π`

Choose a finite `E/ℚ_ℓ` realizing `r_{π,λ}`, an `O_E`-stable lattice `L`, and a basis of `L`. Define `r̄_{π,λ}` as the semisimplification of `L/m_EL`. Its isomorphism class over `k̄_ℓ` is independent of `L`, the basis and enlargement of `E`, for a fixed actual coefficient embedding into `ℚ̄_ℓ` and its induced residue embedding into `k̄_ℓ`. It descends to the finite field generated by the reductions of the common good polynomial coefficients. At good `v` away from `ℓ` it is unramified and has characteristic polynomial `P_v` reduced
through that residue embedding. Changing the embedding while keeping the place fixed
transports the reduction semilinearly by the induced residue-field automorphism; linear
isomorphism is asserted only after fixing the actual residue embedding. For `F/F^+` CM in the totally odd polarized branch, for odd `ℓ` prove `residualPolarizedExtension`: the semisimple residual polarized representation admits a `𝒢_n`-valued extension with multiplier `ε̄^{1−n}r̄_χ`. Use the supplied characteristic-zero extension, reduce its invariant lattice data and prove that semisimplification retains the polarization; the reduction is not inferred from an arbitrary self-dual lattice. At `ℓ=2` an extension, when used, is retained as explicit input with its pairing and multiplier equations. An arbitrary lattice is not declared self-dual.

The required API is:

- `residualRep`: The continuous semisimple residual member over its finite field of realization.
- `residualRep_indep_lattice`: Two lattice reductions have isomorphic semisimplifications over `k̄_ℓ`.
- `residualRep_coeffExtension`: Enlargement of `E` gives scalar extension of the same semisimple residual representation.
- `residualRep_goodPolynomial`: At good `v` away from `ℓ` the polynomial is the coefficient reduction of `P_v`.
- `residualRep_extendGn`: For `F/F^+` CM, totally odd polarized residual members extend to `𝒢_n` with the specified multiplier; the totally-real orthogonal/symplectic specialization is separate.

**Checks.**

- For an integral character `ψ, r̄` is its reduction and no semisimplification changes it

- Reduction of `diag(1,2)` modulo 3 has polynomial `(X−1)(X−2)`, the reduction of the characteristic-zero polynomial

- For the classical weight-`k` overlap at fixed `λ, r̄_AG2≅M̄_R19≅(r̄_R19,arith)^∨` under the same actual residue embedding

- For the `ℤ_5`-action `r(t)=[[1,5t],[0,1]]`, lattices with bases `(e1,e2)` and `(5e1,e2)` give identity and nontrivial unipotent reductions; both semisimplify to `1⊕1`.

*Needs:* AG2.7: finite local realization; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 5; ArithmeticGaloisRepresentations §7.4; Mathlib `Matrix.GeneralLinearGroup.map`; Mathlib `Representation.IsSemisimpleRepresentation`.

(Sources: BLGGT, §2.1, p.34; ACC+, §7.1, p.1085.)

### Independence of the residual Hecke ideal

Fix `π, λ` and an integral eigencharacter `θ_π:T^S→O_E` at that coefficient place. Then `m_{π,λ}=ker(T^S→O_E→k_E)` is of Galois type with realization `r̄_{π,λ}`. Its kernel is independent of stable lattice, basis and finite extension of `E` inducing the same `λ`: the eigencharacter is defined by the same integral Hecke eigenvalues and the residue-field extension is injective. It is non-Eisenstein exactly when `r̄_{π,λ}` is absolutely irreducible. Independence across distinct `λ` is not asserted.

*Needs:* AG2.7: residual representation; Mathlib `Matrix.charpoly_map`; IntegralHeckeAndGaloisDeterminants §3b.1; IntegralHeckeAndGaloisDeterminants §3a.1.

(Sources: ACC+, Definition 2.3.6, p.938; §7.1, p.1085.)

### Dual and character-twist Hecke comparison

For a Galois-type maximal ideal `m` of rank `n`, the contragredient Hecke ideal `m^∨` is of Galois type with `r_{m^∨}≅r_m^∨⊗ε̄^{1−n}`. At good geometric Frobenius its eigenvalues are `q_v^{n−1}/α_i`. An integral unramified-at-`v` character `ψ` multiplies the eigenvalues by `ψ(Frob_v)`, and its Hecke twist realizes `r_m⊗ψ̄`. In the rank-`2n` unitary Hecke algebra the reciprocal factor is `q_v^{2n−1}`. Residual nonratio conditions are transported only with their unramifiedness hypotheses.

*Needs:* IntegralHeckeAndGaloisDeterminants §3b.1; IntegralHeckeAndGaloisDeterminants §3a.1; AG2.0: algebraic Galois characters; SmallRamificationAndAbelianVarietyBaseCases §5.0d; AG2.P: Arbitrary-rank compatible data and operations.

(Sources: ACC+, After Definition 2.3.6, p.938.)

### Local residual genericity

Let `L/ℚ_p` be any finite extension with residue cardinality `q, ℓ≠p, k` a finite field of characteristic `ℓ`, and `r:G_L→GL_n(k)` continuous. It is ACC+-generic at `L` if inertia acts trivially and, over `k̄`, the eigenvalues `α_i∈k̄×` of `r(Frob_L^geom)`, listed with multiplicity, satisfy `α_i/α_j≠q` for every `i≠j`. Arithmetic instead of geometric Frobenius gives the same predicate because inversion reverses the ordered pair. Repeated eigenvalues are permitted when `q≠1` in `k`; pairwise distinctness alone is insufficient. The local condition has no global irreducibility, adequacy or enormousness clause.

Supply the ordered eigenvalue nonratio predicate with multiplicities and the local
representation predicate including trivial inertia. Prove independence of the Frobenius
lift when inertia acts trivially, and invariance under a common nonzero scalar,
permutation and inversion of the eigenvalues.

**Checks.**

- Over `𝔽_3` with `q=2`, the list `(1,1)` is generic.

- Over `𝔽_5` with `q=2`, the distinct list `(2,1)` is not generic.

- Every one-term nonzero list is generic.

- Over `𝔽_3` with `q=1`, `(1,1)` is not generic

- For a diagonal Frobenius `r(Frob)=diag(α)`, genericity of the representation is equivalent to trivial inertia together with the eigenvalue nonratio condition on the list `α` at `q`; a definition that dropped the inertia clause would accept a ramified representation with acceptable eigenvalues.
- Under the same diagonal hypothesis, strong genericity is equivalent to trivial inertia together with the strong eigenvalue condition on `α` at `q` (pairwise distinct entries and no ratio equal to `q`).

*Needs:* AG2.7: residual representation; ArithmeticGaloisRepresentations Layer 1; Mathlib `Matrix.charpoly`; Mathlib `Matrix.GeneralLinearGroup.map`.

(Sources: ACC+, Definition 4.3.1(1), p.972.)

### Completely split generic prime

For a continuous residual `r:G_F→GL_n(k)`, a rational prime `p` is a decomposed-generic prime if `p≠ℓ, p` is completely split in `F`, and `r` is unramified and ACC+-generic at every `v|p`. Complete splitting means `e_v=f_v=1` at every `v`, so `q_v=p`. This is a property of the pair `(r,p)`, distinct from local genericity at one arbitrary place and from existence of such a `p`.

The required API is:

- `IsDecomposedGenericPrime`: The complete-splitting and all-`v` condition.
- `decomposedGenericPrime_local`: For every `v|p`, obtain unramifiedness and the local predicate with `q=p`.
- `decomposedGenericPrime_coeffExtension`: Any extension of the finite coefficient field preserves and reflects the condition.

**Checks.**

- For `F=ℚ` there is exactly one place over `p`; the splitting clause is automatic

- An inert prime in a quadratic `F` is not decomposed generic even when the local ratio condition holds

- `p=ℓ` is excluded independently of eigenvalues.

*Needs:* AG2.7: Local residual genericity; ArithmeticGaloisRepresentations Layer 1.

(Sources: ACC+, Definition 4.3.1(2), p.972.)

### Decomposed generic residual representation

A continuous residual representation `r:G_F→GL_n(k)` is decomposed generic if there exists a rational prime `p` which is decomposed generic for `r`. This existential condition is the ACC+ hypothesis used by the torsion-concentration and potential-automorphy consumers. It does not mean every split prime is generic, nor is it equivalent to global absolute irreducibility or enormousness.

The required API is:

- `IsDecomposedGeneric`: There exists `p` satisfying `IsDecomposedGenericPrime(r,p)`.
- `decomposedGeneric_witness`: Extract the prime witness and all-`v` local conditions.
- `decomposedGeneric_coeffExtension`: The existential condition is preserved and reflected by finite residue-field extension.

**Checks.**

- For `F=ℚ, k=𝔽_3, r=1⊕1`, the prime `p=2` is a witness

- The preceding decomposed-generic representation is reducible

- For the same `r, p=7` has `q=1 mod 3` and is not a witness, although `p=2` is.

*Needs:* AG2.7: split generic prime.

(Sources: ACC+, Definition 4.3.1(3), p.972.)

### Strong local decomposed genericity

For any finite extension `L/ℚ_p, ℓ≠p`, define the Caraiani–Scholze Definition 1.9 specialization: `r` is unramified and `α_i/α_j∉{1,q}` for all `i≠j` over `k̄`. Equivalently its eigenvalues are pairwise distinct and ACC+-generic. The local field need not be `ℚ_p`. This stronger predicate has its own name and implies the ACC+ local predicate. Liu Appendix D’s displayed distinctness is unnecessary for its later noncompact concentration input, as its footnote 37 explicitly records; the stronger definition is not silently substituted for ACC+.

Supply the strong eigenvalue and local representation predicates, prove equivalence
with exclusion of the two ordered ratios `1` and `q`, and the implications to pairwise
distinctness and ACC+ genericity. Use `q=|k_L|=p^f` for every finite `L/ℚ_p`.

**Checks.**

- Over `𝔽_3, q=2`, `(1,1)` is ACC+-generic but not strong-generic

- Over `𝔽_7, q=2`, `(1,3)` is strong-generic: the two ordered ratios are 3 and 5.

- Every single nonzero eigenvalue is strong-generic

- For an unramified quadratic `L/ℚ_2` and `ℓ=3`, use `q=4≡1`; the ratio-1 clause remains explicit.

*Needs:* AG2.7: Local residual genericity.

(Sources: CS, Definition 1.9, printed p.652; Liu, Definition D.1.2, footnote 37, printed p.365.)

### Infinitely many decomposed generic primes

If `r:G_F→GL_n(k)` is continuous and decomposed generic, there are infinitely many such rational primes, and witnesses can avoid any specified finite set.
The compiled statement `infinitelyManyDecomposedGenericPrimes` uses a finite Galois
realization `r:Gal(L/F)→GL_n(k)`, where `F` is any number field and `k` any finite field.
Every continuous finite-coefficient representation of `G_F` factors through such a realization;
faithfulness, semisimplicity and absolute irreducibility are not required.
`FiniteModelDecomposedGenericPrime` requires `p≠char(k)`, complete splitting in `F`,
trivial image of inertia at every prime of `L` above `p`, and the ordered eigenvalue
nonratio condition for its Frobenius matrices. Complete splitting is expressed by the
number of primes of `O_F` above `p` being `[F:ℚ]`. The definition tests arithmetic
Frobenius; inversion exchanges ordered pairs, giving the geometric condition above.

Let `K` be a normal closure of `F`, the field cut out by `r` and `ℚ(ζ_ℓ)`. A witness determines a conjugacy class in `Gal(K/ℚ)` whose restriction fixes `F`, fixes the all-place eigenvalue ratios and fixes `p mod ℓ`. Chebotarev gives a positive Dirichlet-density set of primes with this class. Every such unramified prime is again a witness.

*Needs:* AG2.7: decomposed genericity; ArithmeticGaloisRepresentations Layer 5.

(Sources: ACC+, Lemma 4.3.2, pp.972–973.)

### Genericity transfer and projective qualification

The eigenvalue nonratio predicate is invariant under permutation, nonzero scalar multiplication, inversion and coefficient-field extension. Local representation genericity is invariant under conjugacy, semisimplification of an already unramified representation, and unramified scalar twists. An arbitrary ramified scalar twist preserves the projective representation but can destroy local unramifiedness. The global existential decomposed-generic condition is invariant under finite residual-character twists: use infinitely many witnesses and avoid the finite ramification set of the character. Strong local genericity obeys the same rules with distinctness retained.

Prove preservation and reflection of the tuple predicates along every field embedding
`k→K`. The matrix comparisons use `Matrix.GeneralLinearGroup.map` and the image of `q`.
Conjugating a representation by an invertible matrix preserves and reflects both local
predicates. Scalar-twist comparisons retain triviality of the twisting character on inertia.

*Needs:* AG2.7: Local residual genericity; AG2.7: Strong local decomposed genericity; AG2.7: infinitely many generic primes; Mathlib `Matrix.charpoly_units_conj`; Mathlib `Matrix.charpoly_map`.

(Sources: ACC+, After Definition 4.3.1, p.972; Lemma 4.3.2.)

### Residual genericity outside finitely many `λ`

For a relevant `Π` with a strong coefficient field `E` in Liu et al., choose the regular unramified place used in Chenevier–Harris’s argument, with distinct algebraic Satake roots `α_i` and `α_i≠qα_j`. After a finite extension of `E` containing these roots, exclude the finitely many coefficient places dividing denominators, roots, `α_i−α_j` or `α_i−qα_j`. Their reductions are distinct and nonratio. Liu Appendix D, Corollary D.1.4 then uses Chebotarev to obtain a place `w` split in `F/F⁺` that is locally generic for the reduced Hecke eigencharacter outside this finite set. The cohomological concentration conclusion has its own `F^+≠ℚ` and level hypotheses and belongs to the Igusa/torsion consumer. This conclusion does not itself provide the completely split rational prime, generic at every `v` above it, required by the ACC+ global predicate; that stronger witness needs its separate Chebotarev hypotheses.

*Needs:* AG2.6: uniform strong realization; AG2.7: Hecke ideal independence; AG2.7: Strong local decomposed genericity; ArithmeticGaloisRepresentations Layer 5.

(Sources: Liu, Corollary D.1.4, printed p.368; Remark 3.2.6.)

### Good-prime characteristic-zero export

`GoodPrimeExport(π)` consists of `R_π` on the supplied `AutomorphicSystemData` carrier, its finite coefficient field and common `S_π/P_v` data, the chosen `λ`-member interfaces, and the proved good-Frobenius comparison maps. It forgets branch-specific admissibility/purity and contains no assertion of a full bad-place WD parameter. It is an interface wrapping that supplied carrier, not a new compatible-system definition.

The required API is:

- `GoodPrimeExport`: Wrap `R_π` with its good comparison maps.
- `goodPrimeExport_member`: Retrieve the `λ`-member and good Frobenius theorem.
- `goodPrimeExport_coeffChange`: Use the supplied raw coefficient change on `R_π`, with identity and composition laws.

**Checks.**

- At `n=1` it is the algebraic-character good-prime package

- For a weight-`k` classical overlap its polynomial is `X²−a_qX+ψ(q)q^{k−1}`

- The package cannot supply `N` at a ramified place without branch evidence.

*Needs:* AG2.6: automorphic compatible system;
SmallRamificationAndAbelianVarietyBaseCases §5.0d.

(Sources: ACC+, §7.1, pp.1093–1094.)

### Nonselfdual Hodge and monodromy-bound export

The target `NonselfdualComparisonExport` has the following hypotheses and conclusion.

`NonselfdualComparisonExport(π)` for an arbitrary regular algebraic cuspidal `π` over CM `F` wraps GoodPrimeExport with the AHTW de Rham comparison, full labelled Hodge multiset, ss WD comparison and `F-ss` monodromy upper bound at every `v|ℓ`. It also exposes spherical crystallinity and Iwahori semistability with the stated local hypotheses. It does not contain a polarization, purity theorem or full ramified `N` equality. It dispatches on rank: for `n≥2` it carries `ExtremelyRegularIrreducibility m` for `2≤m≤2n`, and for `n=1` it is unconditional. The output is the strongest nonselfdual coefficient-prime interface supplied by AHTW v1, rather than the good-prime interface alone.

The required API is:

- `NonselfdualComparisonExport`: Combine the AHTW coefficient-prime maps with the common carrier.
- `nonselfdualExport_goodPrime`: Forget to GoodPrimeExport with the same members.
- `nonselfdualExport_hodge`: Retrieve de Rham comparison and the labelled multiset at every `v|ℓ`.
- `nonselfdualExport_wdBound`: Retrieve ss comparison and the `F-ss` monodromy upper bound, retaining their distinct strengths.

**Checks.**

- For an algebraic character the Hodge multiset has one element and `N=0`

- At a spherical coefficient-prime place the upper bound `N=0` and trivial inertia recover the crystalline supplier criterion

- The export supplies neither a polarized pairing nor full ramified WD equality from an ss comparison alone.

*Needs:* AG2.7: Good-prime characteristic-zero export; AG2.6: nonselfdual de Rham comparison; AG2.6: nonselfdual monodromy bound; AG2.6: Nonselfdual spherical and Iwahori admissibility.

(Sources: AHTW, Theorem 1.2.1 and Corollary 1.2.2, pp.5–6.)

### Polarized Hodge and Weil–Deligne export

The target `PolarizedComparisonExport` has the following hypotheses and conclusion.

`PolarizedComparisonExport(π,χ)` wraps GoodPrimeExport with the actual polarization isomorphisms and multiplier, the corrected total-odd sign, the labelled Hodge comparison maps, and full `F-ss` WD comparison at all finite places, including coefficient-prime places; for `n≥2` it carries the hypothesis `ExtremelyRegularIrreducibility n` of the AG2.6 coefficient-prime comparison. It supplies the proved pure/strict branch predicates. Forgetful maps return the good-prime package, AG2.6’s polarized system and each local comparison; they do not insert residual enormousness or an ordinary refinement.

The required API is:

- `PolarizedComparisonExport`: Combine the established polarized branch comparisons.
- `polarizedExport_goodPrime`: Forget to GoodPrimeExport, preserving all good polynomials.
- `polarizedExport_local`: Retrieve labelled Hodge and full WD comparison maps at a chosen finite place.
- `polarizedExport_supplier`: Return precisely the AG2.6 pure/polarized predicates with normalization conversion.

**Checks.**

- For a weight-`k` base-change form it returns `H={0,k−1}, W=k−1` and determinant `ε^{1−k}r_ψ`

- The forgotten good package has exactly the same `λ`-members and `P_v`

- AHTW ss comparison plus an `N` bound does not fulfill a full-WD comparison field.

*Needs:* AG2.7: Good-prime characteristic-zero export; AG2.6: full polarized comparison; AG2.6: Totally real polarized coefficient-prime descent; AG2.6: system purity/polarization.

(Sources: BLGGT, Theorem 2.1.1, pp.33–34; §5.1, pp.63–65; BLGGT-lp-II, Theorem A, p.2; Caraiani-p, Theorem 1.1, pp.1–2.)

### Unitary discrete-parameter export

In the compact unitary setting of CS Corollary 5.5.5, export the semisimple representation `r_{Π^S,ℓ}=⊕_{i=1}^2 r_i⊗ε_i` attached to an endoscopic discrete parameter of ranks `n_1+n_2=n`, with each `ε_i` the algebraic character of `|det|^{(n_i−n)/2 }ϖ(N_{F/𝒦}∘det)^{ε(n−n_i)}`, and `ε(m)≡m mod 2`. The polynomial at every `v` over `q∈Spl_{𝒦/ℚ}` outside `S∪{ℓ}` is the explicit degree-n Hecke polynomial. Keep the constituent labels, algebraic twist maps, and the away-`ℓ` local comparison from Remark 5.5.6. This representation need not be globally irreducible and carries no coefficient-prime comparison beyond what its constituents separately prove. Here `F=F⁺·𝒦` with `𝒦` the imaginary quadratic field of CS §5.1; the printed `F₀` in Corollary 5.5.5 denotes this same imaginary quadratic field.

Throughout this target, for the literal CS Corollary 5.5.5 application, retain the §5.1 unitary datum and the given irreducible admissible `Π^S` in the indicated BCS supercuspidal alternating Igusa summand. Its identification with the labelled pure automorphic transfer parameter is supplied as input; this export does not prove an Igusa trace or concentration theorem. The constituent `Π_i` are regular C-algebraic, `θ`-stable isobaric representations supplied by that parameter, and `r_i` has rank `n_i` , not `n`. The source setup has `F⁺≠ℚ`, quasi-split finite unitary group, and the ramified rational primes of `F` contained in `Spl_{F/F⁺}`; these source restrictions are retained for that literal application.

The required API is:

- `UnitaryDiscreteExport`: Build the labelled direct sum with explicit algebraic character twists.
- Given two matrix representations over any field and two unit-valued characters, construct a block sum with the prescribed twisted diagonal blocks.
- `unitaryDiscreteExport_constituent`: Retrieve `r_i, ε_i` and its inclusion into the direct sum.
- `unitaryDiscreteExport_goodPolynomial`: Its good polynomial is the product of the twisted constituent polynomials and the specialized degree-n Hecke polynomial.

**Checks.**

- For `n_1=n_2=1`, at good `v` with twisted values `β_1,β_2` the polynomial is `(X−β_1)(X−β_2)`.

- The direct-sum dimension is `n_1+n_2`, with neither twist changing dimension.

- For positive `n_1,n_2`, the first block is a nonzero proper invariant subspace, so the block sum is not irreducible. In particular a two-character endoscopic sum cannot certify global irreducibility.

*Needs:* AG2.2: Caraiani–Scholze discrete normalization; AutomorphicGaloisRepresentationsPartII AG2.5; AG2.0: algebraic Galois characters; EndoscopicTransferAndUnitaryTraceComparison §§6.24–6.29 and 13.1–13.4; SmallRamificationAndAbelianVarietyBaseCases §5.0d; AG2.P: Arbitrary-rank compatible data and operations.

(Sources: CS, Corollary 5.5.5 and Remark 5.5.6, printed pp.745–746.)

### Lattice and residual polynomial export

`ResidualPolynomialExport(π,λ)` contains a finite `p`-adic realization `E`, an explicitly chosen stable `O_E`-lattice, its continuous integral realization, the semisimple residual member, the coefficient-reduction maps on every good `P_v` and the comparison isomorphisms under another lattice or coefficient extension. It exports `m_{π,λ}` and its Galois-type evidence; non-Eisensteinness and decomposed genericity are additional hypotheses or projections only when proved. The chosen lattice is retained as data and never named canonical.

The required API is:

- `ResidualPolynomialExport`: Assemble finite realization, chosen lattice and reduction maps.
- `residualExport_compareLattice`: Different chosen lattices give isomorphic semisimple residual members, not necessarily isomorphic reductions.
- `residualExport_maxIdeal`: Retrieve `m_{π,λ}` with Galois-type evidence.
- The integral/residual Frobenius square is Mathlib’s `Matrix.charpoly_map (r g).val red` composed with `Matrix.GeneralLinearGroup.map_apply`, used directly.
  On an integral matrix realization `r`, the characteristic polynomial of
  `Matrix.GeneralLinearGroup.map(red)(r(g))` is the coefficientwise reduction of the
  characteristic polynomial of `r(g)`. This matrix identity holds for every ring map `red`;
  the stable lattice and residual semisimplification belong to the preceding targets.

**Checks.**

- Reduction of an integral character is its residual character

- The diagonal integral test reduces `X²−3X+2` to `X²+2` modulo 3

- The two `ℤ_5`-unipotent lattices have unequal reductions but equal semisimplifications; the package cannot identify the raw reductions.

*Needs:* AG2.7: residual representation; Mathlib `Matrix.charpoly_map`; AG2.7: Hecke ideal independence; Mathlib `Representation.IsSemisimpleRepresentation`.

(Sources: ACC+, Definition 2.3.6, p.938; §7.1, p.1085.)

### Rank-two residual comparison with the independent rank-two member

For the regular classical/Hilbert exact overlap, fixed `λ` and the characteristic-zero dual/twist normalization of AG2.6, semisimple reduction commutes with the identification of the AG2 and independently constructed `λ`-members. In the classical normalization `r̄_AG2≅M̄_R19≅(r̄_R19,arith)^∨`; the geometric good polynomial is `X²−ā_qX+ψ̄(q)q^{k−1}`. The associated maximal Hecke ideals agree under the normalized Hecke algebra identification. The independent member retains its geometry and chosen lattice calculations; only the semisimple isomorphism class, not a preferred lattice, is compared.

*Needs:* AG2.6: Rank-two comparison with the independent rank-two member; AG2.7: residual representation; AG2.7: Hecke ideal independence.

(Sources: ACC+, Definition 2.3.6 and following duality statement, p.938.)

### Examples

The trivial rank-two residual representation over `𝔽₃` is decomposed generic over `ℚ` with witness 2, but 7 is not a witness. The two integral unipotent lattices reduce differently and have the same semisimplification.

### Dependencies

AG2.0–AG2.6; ArithmeticGaloisRepresentations Layers 1 and 5 and §7.4; IntegralHeckeAndGaloisDeterminants §§3b.1–3b.2; Mathlib characteristic-polynomial coefficient change.

## Worked examples and algebraic interfaces

### Dominant coordinates, extreme regularity and coefficient exponents

The coordinate specialization of ArithmeticLocallySymmetricSpaces §ALS.F.7 has the
arithmetic conjugation condition and embedding pullback described in AG2.0. Construction
from antitone coordinates and extensionality include rank two. Extreme regularity uses sums
of equal-sized subsets after the Hodge shift, rather than distinctness of individual entries.
(Source: BLGGT, §2.1, p.32.)

**Checks.**

- For rank one and a nonempty embedding index every weight is extremely regular; for an
  empty embedding index the existential embedding condition is false, even in rank zero.
- For rank four, weight `(5,2,1,1)` shifts to `(8,4,2,1)`. Binary uniqueness makes all subset
  sums distinct, so it is extremely regular.
- The dominant weight `(0,0,0,0)` shifts to `(3,2,1,0)`. Its two-element subsets `(3,0)` and
  `(2,1)` both sum to 3, so dominance and regular Hodge weights do not imply extreme regularity.
- Pullback along the identity preserves every coordinate; composing two restriction maps
  gives the same weight as their composite. For an involution-compatible restriction, the
  conjugation condition `a_{τc,i}=w−a_{τ,n+1−i}` is preserved. A map that exchanges conjugate embeddings incorrectly fails this condition.

The coefficient weight `−2c−s` and formal labelled integer `k−1−a−c` retain
translation of the central exponent and compatibility with the compact coefficient
dictionary of AG2.0.
(Source: Shin, §3.6, (3.18), p.20; §6.2 preceding Corollary 6.7, p.48.)

**Checks.**

- Central exponent 1, highest-weight sum 0 gives coefficient weight `−2` and labelled value `−1`
  at `k=1`. Omitting the central exponent gives the wrong values.
- At `c=s=a=0` and `k=1` both quantities are `0; k=2` gives labelled value 1.
- Increasing `c` by `t` decreases the labelled value by `t` and the coefficient weight by `2t`.
  Adding `t` to one highest-weight entry decreases its labelled value by `t`, not by `2t`.

### Relative-degree selector

The rational scalar `(z−N^y)/(N−N^y)` uses an integer `N≥2` and `y≠1` in the
geometric construction, so its denominator is nonzero. It has value 0 at `z=N^y` and
value 1 at `z=N`, and the product over `y≠1` selects degree one.
This scalar recipe is distinct from the corrected global correspondence in AG2.1a.
(Source: TY, §2, p.12.)

**Checks.**

- At `N=2, y=0` the denominator is 1, and `z=1` and `z=2` give values 0 and 1.
- At `N=2, y=2` the denominator is `−2` and `z=2` gives 1. Reversing its sign fails this value.
- The empty product for `m=0` is 1. At `y=1` the scalar denominator vanishes, so that index is
  excluded from the geometric product; total rational division does not justify using it.

### Discrete ranks and exponent conversion

The rank attached to a finite list of pairs `(m_i,n_i)` is `Σ_i m_i n_i`.
It vanishes on the empty list, adds under concatenation and is additive in multiplicities.
The corresponding representation is the actual direct sum of AG2.2, with every character
and twist retained. (Source: HLTT, Proposition 1.2 and Corollary 1.3, p.31.)

**Checks.**

- Both lists `[(1,2)]` and `[(2,1)]` have rank 2, although their block multiplicities differ.
- The empty list has rank 0; concatenating lists of ranks 2 and 3 gives rank 5.
- A rank-one block with multiplicity two cannot be replaced by a single copy. For `n=1` its
  two character exponents are `−1` and `−2`. More generally the difference of the normalized
  parameter and constituent exponents is `−n−j`.

### Hasse increments and Kuga slopes

The Hasse increment is `(p−1)p^(M−1)j` for the modulus-`M` comparison with `M≥1`.
It is zero at `j=0`, additive in `j` and multiplied by `p` when `M` increases by one.
The Kuga slope is `s+mnd`, with inverse subtraction formula, zero-copy identity and
additivity of the shift. (Source: HLTT, Lemma 6.1,
pp.192–195, and Proposition 6.15/Corollary 6.17, pp.215–218.)

**Checks.**

- At `p=3, M=1, j=2` the Hasse increment is 4; at `M=2` it is 12.
- At `j=0` it is 0, and at `p=2` it is `2^(M−1)j`. The source modulus hypothesis excludes `M=0`.
- Doubling `j` doubles the increment. Replacing `p^(M−1)` by `p^M` fails the `M=1` example.
- Section slope 3, one Kuga copy, `n=1` and `d=2` gives Kuga slope 5; conversely `5−2=3`.
- Zero Kuga copies give the original slope for every `n` and `d`, including `n=0` or `d=0`.
- Two copies in the same degree-two example give slope 7. Subtracting the factor in the
  section-to-Kuga direction would instead give `−1` and violates the trace normalization.

### Equal first ranks with different nilpotent strings

For nilpotent block lengths `d`, the rank of the `k`th power is `Σ_d max(d−k,0)`.
It vanishes on the empty list, adds under concatenation, gives dimension at `k=0`
and eventually vanishes. Consider `F=diag(8,2,2,1/2,1/2,1/8)`, with one nilpotent
matrix having arrows `0→1→3→5` and `2→4`, and the other having arrows `0→1→3` and
`2→4→5`. Verify their entries, the common relation `FN = (1/4)NF`, nilpotence and the
ranks of all powers, including equal first ranks and different third ranks. (Source: TY, Lemma 1.4(4) and its proof, pp.6–7;
Varma, §9, pp.20–21.)

**Checks.**

- Blocks `[4,2]` and `[3,3]` both have dimension 6 and first-power rank 4. Their third-power
  ranks are 1 and 0, respectively.
- The empty list has rank 0 for every `k`; a length-one block has rank 1 at `k=0` and 0 at `k=1`.
  Any `k` at least the largest block length gives rank 0.
- For the pure matrix, `(N³)_{5,0}=1`, and `N⁴=0`. For the impure matrix `N³=0` but `N²≠0`.
- Both matrices satisfy the same geometric Weil relation for `q=4` with the displayed `F`.
  Assigning the reciprocal diagonal to `F` reverses the relation and fails at the entry `(1,0)`.
- The first string has weights `3,1,−1,−3` and the second has `1,−1`, centred at 0; the impure
  strings have centres 1 and `−1`. Thus maximal rank of `N` alone cannot replace pure WD uniqueness.

### Matrix and scalar genericity

The matrix forms of local genericity use an actual subgroup `I` of `G`, a matrix
representation, an element `Frob` and `q`. Specialization to a local Galois group
requires the specified inertia, geometric Frobenius and residue cardinality in AG2.7,
with the eigenvalue and representation invariance properties stated there.
`TauCeti.diagGL` (`TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Basic`)
is the pinned matrix homomorphism of tuples of units for the diagonal Checks.
(Source: ACC+, Definition 4.3.1, p.972; CS, Definition 1.9, p.652.)

**Checks.**

- The rank-two identity over `𝔽₃, I=1` and `q=2` is generic and not strong generic. For `q=1`
  it is not generic, so changing the residue cardinality can change the answer.
- Over `𝔽₅, Frob=diag(2,1)` and `q=2` is not generic, although it has distinct eigenvalues.
  Over `𝔽₇, diag(1,3)` and `q=2` is strong generic.
- A nontrivial inertia image makes both representation predicates false, even if the
  displayed Frobenius has acceptable eigenvalues. An unramified rank-one character is
  strong generic for every `q`.

Let `O` be a commutative ring, `k` a field and `red:O→k`
an actual ring map. If each reduced difference `α_i−α_j` and `α_i−qα_j` is nonzero for `i≠j`,
with `α_i` units, the reduced list is strong generic. The automorphic finiteness theorem in
AG2.7 additionally proves that only finitely many coefficient places need be excluded.
The local algebraic statement asserts no rational-prime Chebotarev conclusion.

The block representation with its specified matrix identity supplies the algebraic
constituent inclusions and polynomial identities for the full labelled CS export in AG2.7.
Rank-two character sums have the two linear factors, zero-dimensional summands contribute
polynomial 1, and two nonzero character summands retain a proper invariant line.
These are discriminating Checks for the labelled direct sum.
(Source: CS, Corollary 5.5.5 and Remark 5.5.6, pp.745–746.)

## Downstream consumers

Potential automorphy and modularity lifting use the characteristic-zero and residual exports
of AG2.7, with residual irreducibility, enormousness, levels and auxiliary primes as their own
hypotheses. Shimura-cohomology applications use the chosen unitary discrete parameter and its
local normalization. Neither use turns a nonselfdual monodromy bound into equality of `N`.
The coefficient-prime comparisons for `n≥2` carry `ExtremelyRegularIrreducibility`; a
consumer that proves the density-one irreducibility theorem from potential automorphy, using
only the Iwahori comparison of AG2.6, discharges it and obtains the unconditional comparisons.

## Bibliography

### BLGGT

Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4). arXiv:1010.2561v4 (2013), published Annals 179 (2014), 501–609; locators here use arXiv/article pages.

### BLGGT-lp-II

Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, [Local-global compatibility for l = p, II](https://virtualmath1.stanford.edu/~rltaylor/lg2.pdf). Ann. Sci. ÉNS 47 (2014), 165–179; locators use the author copy, with Theorem A on p.2.

### BLGGT-lp-I

Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, [Local-global compatibility for l = p, I](https://www.ma.imperial.ac.uk/~tsg/Index_files/localglobalI.pdf). Ann. Fac. Sci. Toulouse Math. (6) 21 (2012), 57–92; locators use the author copy.

### BLGHT

Tom Barnet-Lamb, David Geraghty, Michael Harris and Richard Taylor, [A family of Calabi–Yau varieties and potential automorphy II](https://doi.org/10.2977/PRIMS/31). Publ. RIMS Kyoto Univ. 47 (2011), 29–98; journal pages.

### ACC+

Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne, [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals 197 (2023), 897–1113, author copy with journal pagination; printed page = PDF page + 896.

### Patrikis

Stefan Patrikis, [On the sign of regular algebraic polarizable automorphic representations](https://arxiv.org/pdf/1306.1242v2). arXiv:1306.1242v2 (2014), published Math. Ann. 362 (2015), 147–171; arXiv pages.

### HLTT

Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne, [On the rigid cohomology of certain Shimura varieties](https://www.kwlan.org/articles/rigcoh.pdf). author copy rigcoh.pdf, published Res. Math. Sci. 3 (2016); article pages 1–234.

### CH

Gaetan Chenevier and Michael Harris, [Construction of automorphic Galois representations, II](https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf). author copy ConstructionII.pdf, published Camb. J. Math. 1 (2013), 53–73; author-copy pages 1–15.

### Varma

Ila Varma, [Local-global compatibility for regular algebraic cuspidal automorphic representations when l is different from p](https://arxiv.org/pdf/1411.2520v1). arXiv:1411.2520v1 (2014); arXiv pages.

### Caraiani-away

Ana Caraiani, [Local-global compatibility and the action of monodromy on nearby cycles](https://arxiv.org/pdf/1010.2188v1). arXiv:1010.2188v1 (2010), published Duke Math. J. 161 (2012), 2311–2413. The full tensor-square purity argument uses the [published author copy](https://www.ma.imperial.ac.uk/~acaraian/papers/lgc1.pdf), pp.2410–2411; other locators specify arXiv pages.

### Caraiani-p

Ana Caraiani, [Monodromy and local-global compatibility for l = p](https://arxiv.org/pdf/1202.4683v1). arXiv:1202.4683v1 (2012), published Algebra Number Theory 8 (2014), 1597–1646; arXiv pages unless explicitly marked published.

### Shin

Sug Woo Shin, [Galois representations arising from some compact Shimura varieties](https://math.berkeley.edu/~swshin/StableGal.pdf). author copy StableGal.pdf, 61 pages, published Annals 173 (2011), 1645–1741; author-copy pages.

### Shin-Igusa

Sug Woo Shin, [Stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf). author copy StableIgusa.pdf, 30 pages; locators use author-copy pages.

### Berger

Laurent Berger, [Représentations p-adiques et équations différentielles](https://arxiv.org/pdf/math/0102179v3).
arXiv:math/0102179v3 (2001); arXiv pages. The de Rham differential equation is
Theorem 0.5 / Theorem 5.10, and arithmetic p-adic monodromy is Theorem 0.6 / Theorem 5.19.

### Varshavsky

Yakov Varshavsky, [Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara](https://arxiv.org/pdf/math/0505564v2).
arXiv:math/0505564v2 (2005); arXiv pages.

### TY

Richard Taylor and Teruyoshi Yoshida, [Compatibility of local and global Langlands correspondences](https://arxiv.org/pdf/math/0412357v2). arXiv:math/0412357v2 (2005); arXiv pages.

### GK

Elmar Grosse-Klönne, [Rigid analytic spaces with overconvergent structure](https://arxiv.org/pdf/1408.3329). arXiv:1408.3329; author-version pages.

### CS

Ana Caraiani and Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf). Annals 186 (2017), 649–766; journal pages.

### NT

James Newton and Jack A. Thorne, [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2). arXiv:2212.03595v2 (2025); arXiv pages.

### Liu

Yifeng Liu, Yichao Tian, Liang Xiao, Wei Zhang and Xinwen Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Invent. Math. 228 (2022), 107–375; journal pages.

### BCGP21

George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Abelian surfaces over totally real fields are potentially modular](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf). Publ. Math. IHÉS 134 (2021), 153–501; journal pages. The general maximal-rank uniqueness claim is not used in place of pure WD uniqueness.

### BCGP25

George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645). arXiv:2502.20645v1 (2025); arXiv pages.

### BC

Joël Bellaïche and Gaëtan Chenevier, [The sign of Galois representations attached to automorphic forms for unitary groups](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D778DCD413972E114657F69ACC7BB6BC/S0010437X11005264a.pdf/the-sign-of-galois-representations-attached-to-automorphic-forms-for-unitary-groups.pdf). Compositio Math. 147 (2011), 1337–1352; journal pages.

### HSBT

Michael Harris, Nicholas Shepherd-Barron and Richard Taylor, [A family of Calabi–Yau varieties and potential automorphy](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf). Annals 171 (2010), 779–813; journal pages.

### CT

Laurent Clozel and Jack A. Thorne, [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download). accepted Cambridge repository copy (2017); author-copy pages.

### Fargues–Scholze

Laurent Fargues and Peter Scholze, [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4).
arXiv:2102.13459v4 (27 November 2024); locators use printed chapter pages.

### Conrad-lift

Brian Conrad, [Lifting global representations with local properties](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf). Author-posted preprint; author-copy pages, with Lemma 4.1 on pp.11–12 and Appendix B on pp.32–36.

### AHTW

A’Campo, Hevesi, Thorne and Whitmore, [Local-global compatibility of automorphic Galois representations over CM fields at p](https://arxiv.org/pdf/2607.11763v1). arXiv:2607.11763v1 (13 July 2026), unrefereed preprint; arXiv pages.

### Hevesi

Bence Hevesi, [Ordinary parts and local-global compatibility at ℓ = p](https://arxiv.org/pdf/2311.13514v2). arXiv:2311.13514v2; arXiv pages.

### CG

Calegari and Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke Math. J. 169 (2020), 801–896; locators use the author copy Siegel.pdf.

### Pilloni

Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Duke Math. J. 169 (2020), 1647–1807; locators use the author copy complexhidatheorygsp4.pdf.

### Caraiani-p-published

Caraiani, [Monodromy and local-global compatibility for l = p (published version)](https://msp.org/ant/2014/8-7/ant-v8-n7-p02-s.pdf). Algebra Number Theory 8 (2014), no.7, 1597–1646; journal pages. The linked PDF includes two cover pages (printed page = PDF page + 1595).
