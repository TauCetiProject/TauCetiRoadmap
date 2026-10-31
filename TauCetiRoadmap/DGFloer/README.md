# Roadmap: Morse and Floer homology with DG local coefficients

Classical Morse and Floer homology count only the zero- and one-dimensional spaces of connecting
trajectories. Barraud and Cornea observed that the compactified trajectory spaces of *every*
dimension, evaluated into a space of paths, assemble into a Maurer--Cartan element over the
cubical chains on a loop space. Twisting by that element gives Morse and Floer complexes with
coefficients in any differential graded module over `C_*(ΩB)`: a *DG local system*. The basic
source of such systems is Hurewicz fibrations over `B`, and in that case the twisted Morse complex
computes the homology of the total space. Barraud--Damian--Humilière--Oancea turned this into a
full homological package, first for Morse theory on manifolds and on the free loop space, then for
Hamiltonian Floer theory and symplectic homology. They proved a Viterbo isomorphism with DG
coefficients for cotangent bundles. They used it to prove almost existence of contractible closed
characteristics in `T*Q` whenever `Q` is not aspherical in a suitable sense, and finiteness of the
`π₁`-sensitive Hofer--Zehnder capacity of `D*Q` for a large class of manifolds `Q`.

This roadmap builds that package. Its first layers are reusable well beyond symplectic geometry:
- cubical singular chains;
- a few general facts of algebraic topology that no other roadmap builds;
- path and mapping spaces;
- DG local systems and the algebra of twisting cocycles.

The Floer layers sit on the analytic tower of the [Heegaard Floer roadmap](../HeegaardFloer/README.md)
and add the one Floer theory that roadmap does not build, Hamiltonian Floer homology of periodic
orbits.

Suggested homes:

| Layers | Home |
| --- | --- |
| 0 | `TauCeti/AlgebraicTopology/Cubical/` |
| 1 | `TauCeti/AlgebraicTopology/` and `TauCeti/Geometry/Manifold/`, beside the material they extend |
| 2 | `TauCeti/Topology/PathSpace/` and `TauCeti/Topology/MappingSpace/` |
| 3--4 | `TauCeti/AlgebraicTopology/DGLocalSystem/` |
| 5 | `TauCeti/Geometry/Manifold/Morse/DG/` |
| 6--11 | `TauCeti/Geometry/Symplectic/Hamiltonian/` and `TauCeti/Geometry/Symplectic/Floer/` |

## Scope boundary

In scope: every numbered statement of the source paper
([arXiv:2404.07953](https://arxiv.org/abs/2404.07953)), subject to the named exclusions and supplier-coordination applications below. The
[source coverage](#source-coverage) section assigns each of them to a layer.

Out of scope, so nobody mistakes them for later stages:

- **Conjecture 1.2** (every closed hypersurface in `T*Q` has the contractible almost existence
  property when `Q` is not a `K(π,1)`). It is open.
- **Corollary F.** It consumes the Ginzburg--Niche theorem on uniquely ergodic Hamiltonian
  structures, which nothing here builds.
- **The finite-rank and compact-Lie applications of §§6.4.3–6.4.4 are in scope.** Layer 11.3
  constructs Lemma 6.35's complete odd-rank `π_(n−1)(SO(n))` torsion proof and both proofs of
  Proposition 6.34, and constructs the finite-cover and higher-homotopy comparison that makes
  Proposition 6.31 unconditional for every compact connected Lie group other than a torus.
  HomotopySpheres Stage 4A–4B supplies stable real Bott periodicity only; the finite-rank
  Stiefel and low-rank calculations, and their use in the sphere-evaluation fibration, remain
  explicit targets here. The LieGroups dependency supplies its stated compact structure and
  maximal-torus interfaces; the DGFloer-specific finite-cover/`K(π,1)` comparison is assigned
  here. These targets preserve the source's full statements rather than reclassifying them as
  coverage-only contracts.

Also out of scope:
- chain-level higher structures, meaning `A∞` refinements of the DG Floer maps, products, and the
  BV and loop-product structures on either side of the Viterbo isomorphism;
- Floer homotopy theory;
- Lagrangian Floer theory with DG coefficients.
- General Lagrangian/polygon operations, which have their separate Fukaya-category construction. The specific graph/diagonal strip folding, relative-spin and count comparison of G0–G7 is the bounded application constructed here.
- All-dimensional monotone DG-coefficient compactifications, which require representing-chain boundary constructions beyond the count-dimensional classical branch.

The source-owner table distinguishes the positive product, surface-suspension and polar suppliers from the precise general-suspension and global-seam coordination contracts. An exclusion is not used as a source-coverage assignment.

The capped classical branch in Layer7.C additionally treats closed positive spherical-monotone
and spherical-c₁-zero targets in the contractible sector, with ordinary finite Laurent and
completed Novikov coefficients as specified there. Its low-dimensional count compactifications
do not extend Layer8's all-dimensional DG coefficient theory beyond that layer's separate
aspherical/atoroidal hypotheses. The classical branch retains the scope exclusions above. Section7.T separately constructs the bounded closed w⁺ Floer–Novikov torsion application, with its own cylinder, periodic-flow and degenerate-family theorems; it does not broaden Layer8’s all-dimensional DG outputs.

### Named source applications and coordination contracts

This table specifies mathematical owner boundaries. A **coordination contract** names a construction to allocate and prove; an infinitesimal, local or stable floor is not its global conclusion. It is distinct from a supplied theorem or an implementation claim.

| Source subject | Owner and application boundary |
| --- | --- |
| Product curves, general closed source Σ | [HeegaardFloer](../HeegaardFloer/README.md) F2.6c1 owns the product J and native holomorphic projection, integral degree-one/area comparison and slice-image classification in [Σ]×[z₀]. Its moving-domain kernel/cokernel test consumes AnalyticStableMaps M2.0/M2.0a only at id_Σ:Σ→Σ, with direct unanchored sphere/torus models. A noncompact second factor is allowed for each individual closed source image; no uniform no-escape/moduli compactness is inferred. |
| Surface suspension, horizontal orbit tori, SW/Gr/zeta remark | TaubesGromov owns the surface/four-dimensional suspension, vertical form, primitive images/covers and its stated point-count/product/zeta applications, including their chamber, orientation, SpinC and convergence hypotheses. The zero pairing uses the vertical form ω_v; the full symplectic form Ω integrates to the winding, not zero. This is not three-dimensional gauge Floer theory. |
| General symplectic suspension | Coordination with [SymplecticGeometry](../SymplecticGeometry/README.md): contracts S0–S2 below build the smooth quotient, block tensors and compact horizontal-image theorem in arbitrary finite dimension; HF's J-space and HS flow floors are inputs. The actual TG four-dimensional target remains its own specialization. |
| Global flux and Hamiltonian kernel | [HamiltonianReduction](../SymplecticGeometry/HamiltonianReduction/README.md) R1a.0–R1a.4 supply the flux of symplectic paths and its homotopy invariance, the Hamiltonian path kernel, the endpoint quotient `1→Ham(M,ω)→Symp₀(M,ω)→H¹_dR(M)/Γ_ω→0`, the torus lattice `Γ_ω=A·H¹(T²;ℤ)` and the compactly supported version through `H¹_c(M)`. Section 7.T and the contract G0–G7 below consume them and construct no flux theory of their own. |
| Arbitrary ψ periodic Floer setup | DGF's intended global-seam application is the G0–G7 contract below on closed spherical-aspherical targets. The existing linear seam and Hamiltonian untwisting remain positive floors. The nonaspherical and noncompact problems retain their specified additional bubble/virtual/no-escape obligations; no arbitrary-ψ Arnold or PSS-to-H(X) endpoint is asserted. |
| Sp(2,ℝ) polar deformation | [CotangentLagrangian](../SymplecticGeometry/CotangentLagrangian/README.md) C2.0 and C2.1's symplectic polar factors/powers supply A=PU↦P^(1−t)U, fixing U(1). DGF's bounded n=1 application identifies U(1) with S¹, the positive symplectic factor with its chosen open-disc coordinate, and transports source winding/crossings to the single HF index with its stated sign. The full C2.0/C2.1 package is the supplier, not a shorter clause merely naming polar geometry. |
| Floer analogue of Reidemeister torsion (Hutchings physical p106) | Section7.T owns the w⁺ seamed Floer–Novikov parity complex, periodic-flow zeta correction and actual degenerate bifurcation application, with rational total-quotient coefficients and separate monotone strengthening. MN N1/N4 retain the generic completion/torsion/localization algebra; MN N6 is its different finite-dimensional dynamical theorem. Layer8’s Serre/family theory alone does not construct Floer torsion. |
| Qualified autonomous virtual cancellation | DGF7.C.5c owns the energy-cutoff/isolating relative virtual comparison below. The regular R×S¹ dimension argument and PSS homology comparison are separate results, not raw coefficient cancellation. |
| Multiple realization | [GeneralizedCohomology](../GeneralizedCohomology/README.md) G5 and TangentialBordism B5/B6.3 supply Thom/PT/rational bordism inputs. DGF10.5 owns their smooth-target multiple-realization application and the resulting TheoremB/5.14 endpoint. |
| Finite-rank odd-sphere and compact-Lie applications | HomotopySpheres Stage4A–4B supplies stable real Bott and its stable orthogonal-group calculation, not the unstable diagonal groups. DGF Layer11.3 owns the low-rank values, the stable-plus-Stiefel decomposition for `π_(n−1)(SO(n))`, its use in the exact sequence of `SO(n)→SO(n+1)→Sⁿ`, and the resulting first proof of Proposition6.34; the geometric second proof remains a separate complete proof. The pinned public [LieGroups](../RepresentationTheory/LieGroups/README.md) source supplies the universal-cover/central-kernel construction, compact Lie-algebra structure, simply-connected integration, maximal-torus and root `SU(2)` interfaces at their stated hypotheses. The pinned public [CompactGroups](../RepresentationTheory/CompactGroups/README.md) source supplies Haar/Peter–Weyl and its `SU(2)`/torus engine, not the finite-cover decomposition or `K(π,1)` conclusion. Neither source states the specific decomposition/`K(π,1)` bridge, so DGF Layer11.3 owns the bounded proof of the finite cover `T×K→G` from these Lie-group inputs, the `π_j` comparison for `j≥2`, the proof that a nontrivial compact simply connected semisimple factor has nonzero `π₃`, and the conclusion `G is K(π,1) iff G is a torus`; it then applies Proposition6.29 to prove Proposition6.31. This application does not rebuild general Lie theory, compact representation theory, or stable Bott theory. |

**The n=1 polar/index adapter.** In the supplied A=PU factor order, write the positive symplectic factor as P=exp([[a,b],[b,−a]]), (a,b)∈ℝ². Construct its disc coordinate (a,b)/sqrt(1+a²+b²), inverse v/sqrt(1−‖v‖²), and prove the actual smooth inverse and factor-order maps. Identify U(1) with the real rotation circle and transport its winding and crossing conventions to the single HF Maslov/CZ construction, including the factor2 loop/frame-change law and the existing μ=−CZ_HF calibration. This specializes the full C2.0/C2.1 polar theorem and does not introduce a second index.

**S0–S2. General suspension coordination.** For a Hausdorff second-countable finite-dimensional symplectic M and global symplectomorphism φ, construct Y_φ=(ℝ×M)/((t,x)∼(t+1,φ⁻¹x)) with its actual short-interval quotient charts, tangent/seam laws and complete descended ∂t flow, whose return map is φ. Descend the fibre form ω_v and construct Ω=ds∧dt+ω_v on S¹×Y_φ, both circles period1. Consume HF's relative J-family floor to assemble the seam-compatible vertical J and block J∂s=∂t, proving its smoothness and tameness. A primitive orbit of time d gives one embedded image S¹×γ with Ω-area d and ω_v-area0; distinguish its d marked starting points from iterations and parametrized covers. For an embedded closed connected complex curve in the integral cross summand [S¹]⊗H₁(Y_φ), prove nonnegative vertical density and zero pairing force tangent distribution span(∂s,∂t). Completeness on the compact image and the two commuting flows then make that image S¹×γ for a single primitive closed orbit. Compactness is the individual source/image assumption, not a family no-escape theorem.

**G0–G7. Closed-aspherical global-seam application.** DGF constructs this application on closed connected X with ω and c₁ zero on spherical classes and an arbitrary symplectomorphism ψ. Define the actual ψ⁻¹-seamed path/configuration space, retain generator components and a reference section/frame per such component, and construct the area/Chern reference-cylinder cover by the joint kernel of the two transgressions on loops of sections. A loop is a torus in the mapping torus Y_ψ, not automatically a sphere or torus inside X. Construct Γ_a=im(I_ω,I_c), cap/reference transport and the actual covering/path lifting; asphericity excludes sphere energy but need not kill these transgressions. Choose seam-compatible J with all seam jets. Nondegenerate fixed points are finite; degenerate ψ uses actual seam-compatible Hamiltonian K_t and the fixed-point dictionary ψ∘φ_K¹, not an unperturbed count.

Use reference-to-orbit cylinders and A_ψ=∫ω_v+∫K_tdt, positive-end input, the actual end/reference energy and recapping laws and the supplied single HF relative index/determinant, with the extending-frame proof of the +2I_c shift. Apply MN N1 with ν=−I_ω, without injectivity or a field assumption. Use complete filtered residue grading modulo the nonzero positive generator of2I_c(Γ_a), and integer grading when I_c=0; no integer direct-sum grading of arbitrary completed series is asserted. Prove the nonlinear seamed Sobolev/universal section, seam unfolding and FHS separation/adjoint range for the actual split/seam data, including the stationary inverse separately. Construct raw energy-cutoff compactness, class splitting and conditional linear gluing before smooth-stratum openness/selection; then nonlinear gluing, orientations, finite-cutoff counts/d² and the stated continuation homotopies. Prove geometric finite-below support before completion. Folding gives the graph/diagonal strip with the conformal rescaling of both s and t; doubling boundary discs proves weak exactness from spherical asphericity. Construct relative-spin/orientation-line and count comparisons on the actual split-data carriers. No whole Fukaya or PSS theorem is used as an undefined replacement for this seamed analysis.

Construct J/K continuation with fixed nondegenerate ends, actual energy/support bounds and coherent reference/cover/local-system transports, including specified Hamiltonian deformations of ψ. For the Hamiltonian overlap consume the actual 7.C contractible spherical-aspherical Γ=0 cylinder complex and supported compatible continuation, together with the untwisting of 7.C.2. Identify the selected reference cylinders/caps and their zero-period normalization, transport the single index, end orientation and spin data, and prove the equation/count/continuation diagrams. Reflection changes ψ to ψ⁻¹ and uses its actual reference/period-sign transport. This comparison has no arbitrary-ψ PSS or Arnold conclusion. An unrestricted nonaspherical closed-target extension of G0–G7 requires its seamed sphere-incidence/multicover and coherent punctured virtual-boundary construction. The separate bounded w⁺ torsion/count-dimensional application7.T constructs its own classical sphere-incidence/exclusion and bifurcation theorems; it is not this all-scope extension. A noncompact extension requires seam-invariant asymptotic/support data, finite generators in declared windows and an actual uniform no-escape/compact-image theorem for solutions and continuation.

## Ownership and dependencies

This roadmap consumes, and does not rebuild:

- **[Heegaard Floer](../HeegaardFloer/README.md).**
  - Lane M: Morse–Smale pairs, compactified trajectory spaces with their corner structure and
    gluing, and the Morse complex over `𝔽₂` and `ℤ`.
  - Lane F0: Fredholm theory and Sard–Smale.
  - Lane F1: the Cauchy–Riemann package, including totally real boundary conditions, Riemann–Roch
    and the Robbin–Salamon index.
  - Lane F2: symplectic manifolds, almost complex structures, `J`-holomorphic maps, energy,
    compactness, transversality and gluing.
- **[Differential geometry](../DifferentialGeometry/README.md), Layers 2 and 10.**
  The manifold orientation and smooth degree API, also consumed by Heegaard Floer.
  Algebraic topology Stage 6.3 owns the homological fundamental classes; Stage 6.5
  owns the homological characterization `f_*[S] = deg(f) · [Q]` and its comparison
  with DG10's smooth degree, under their stated manifold hypotheses. Here the
  required degree interface is that homological characterization.
- **[Algebraic topology](../AlgebraicTopology/README.md).**
  - Stage 2: relative singular homology and local coefficient systems.
  - Stage 4: CW pairs, cellular approximation and cofibrations.
  - Stage 5.1–5.4: Eilenberg--Zilber, the Künneth theorems and transfer.
    Layer 1 item 2 consumes native `TauCeti.TopCat.serreFibrations` and owns
    the fibration homotopy exact sequence and ordinary homology
    Serre spectral sequence consumed by AT5.5; it uses AT1–4 and item 3,
    with no AT5.5 or GeneralizedCohomology input. Its multiplicative cohomology
    counterpart additionally consumes AT6.0–6.2's foundational tower/cochains/cup
    portion, which precedes duality and EM constructions.
  - Stage 6: fundamental classes, the orientation local system, cap products, Poincaré and
    Poincaré--Lefschetz duality.
  - Stage 8.1–8.7: absolute and relative Hurewicz in degrees `≥ 2`, and Whitehead.
    Layer 1 item 4 additionally consumes AT8.8's generic degree-one bar model;
    the EM constructor consumes no AT8.9–8.12 results.
- **[DG and A-infinity](../DGAInfinity/README.md).**
  - Layer 1: DG algebras, right DG modules, restriction of scalars, tensor products.
  - Layer 4: Maurer--Cartan elements in the strictly upper-triangular regime.
  - Layer 5: one-sided twisted complexes and derived tensor products.
- **[Generalized cohomology](../GeneralizedCohomology/README.md).**
   - Early G2.1 supplies its actual compact-generation, product/Kelley and realizationProductKelleyComparison interfaces. G2.10 constructs IsHurewiczFibration, arbitrary-parameter continuous lifting, compact-open interval path/loop and mapping-path carriers, and comparison with native TauCeti.TopCat.serreFibrations using these EARLY exports and the compact-open exponential law. Those raw constructions do not consume the later Quillen/CW-approximation comparison.
   - Layer1.2's direct weak-equivalence/CW and native Serre LES/ordinary spectral-sequence outputs then feed G2.1's designated model comparison and G2.10's derived fibration-LES application. Layer1.4 applies that LES to the supplied path carriers before G5's rational Hurewicz input. G2.10 raw lifting precedes G2.7 representability and uses no EM/mod2 theorem. Consume each exact export, not a whole-roadmap dependency.
   - For Layer10.5 distinguish GC's designated ordinary/spectral Thom-carrier and collapse/finite-duality comparisons from its later G5 rational spectral Hurewicz theorem. TB B5 consumes the actual G2.10 mapping-path replacement, designated Thom carriers and the stabilization/duality comparisons; TB B6.3 additionally consumes its stated rational oriented-bordism comparison. Lower Layer1.2/1.4 inputs precede those GC/TB outputs and their Layer10 application.
- **[Geometric topology](../GeometricTopology/README.md).**
  - Layer 1: manifolds with boundary, collars, tubular neighbourhoods, connected sum.
  - Layer 3: `Diff(M)` as a topological group with the `C^∞` topology, the smooth-families map,
    and the inclusion `O(n+1) → Diff(Sⁿ)`.
  - Layer 7: Riemannian structures.
- **[Universal covers](../../Completed/UniversalCovers/README.md).** Covering spaces, and induced
  maps on homotopy groups.
- **Lie groups, Layer2.** The generic closed-subgroup theorem and real/complex matrix groups. GeneralizedCohomology G4.0b supplies the designated quaternionic Sp(n) carrier, topology, real model and smooth ambient-map criterion, using that generic theorem.
- **SmoothBundlesConnections B1.4.** Proper free-action smooth homogeneous quotients, principal projections and tangent quotients. Layer1 item7 consumes this single generic quotient owner for its geometric applications.
- **[ComplexKahlerGeometry K7.1–K7.2](../ComplexKahlerGeometry/README.md).** K7.1 supplies the single complex projective carrier, complex/real atlases and orientation; GeneralizedCohomology G4.0b supplies its fixed real model/Grassmannian comparison and the designated HP carrier. K7.2's normalized Fubini–Study form and SBC B6.2–B6.3 inputs are used only in the later form comparison of Layer1 item7, after the independent metric and Morse–Bott applications have been constructed.
- **[Morse–Novikov](../MorseNovikov/README.md).** N1: the generic period-controlled completed group
  ring/module, support condition, convolution, geometric-series inverse, and finite-below algebra.
  DGF consumes this generic owner and proves only the geometric support and graded-chain
specializations required by Layer 7.C.
- **Hamiltonian systems.** Layers 1--2: Hamiltonian vector fields, the Poisson bracket,
  conservation of energy, symplectomorphisms and their action on Hamiltonian vector fields and
  integral curves.
- **Implicit atlases, V0–V6.** Consume the specified finite-group implicit-atlas, virtual cochain/dual-Čech trace, actual boundary/refinement/cobordism and cell-like-stratum interfaces only in the qualified application of 7.C.5c. Its compact-Hausdorff base, atlas, finite-dimensional real representations, coefficient/orientation and regular-product/coverage witnesses are inputs supplied by that application. This engine is not a construction of punctured analytic moduli or a canonical singular chain on a wild source. The classical count and PSS branches are independent of this virtual application.
- **[Differential geometry](../DifferentialGeometry/README.md).**
  - Layers 0--1: smooth differential forms on manifolds, pullback, the exterior derivative
    `mextDeriv`, the Cartan calculus (interior product, Lie derivative, Cartan's formula).
  - Layer 3: flows of vector fields.
  - Tau Ceti's `SmoothTwoForm` migrates onto its generic form carrier (its item 0.4), and this
    roadmap uses the migrated carrier.
- **Tangential bordism.** B5/B6.3 supplies structured PT and the rational oriented-bordism orientation-map surjection with geometric preimages and singular-CW comparison. Layer10.5 consumes these with GeneralizedCohomology G5; lower Layer1 inputs precede their construction. No whole-roadmap reverse dependency is imposed.
- **Homotopy spheres.**
  - Stage 3A: pointed compactly generated spaces, based loop spaces, and the suspension--loop
    adjunction, with the comparison homeomorphisms to ordinary spaces.
  - Stage 3B item 3: the James map and the tensor-algebra computation of `H_*(ΩΣX)`, used for the
    ring `H_*(ΩSⁿ)` in Layer 11 item 2. For this application consume AlgebraicTopology Stage4.4's `reducedSuspensionSphereHomeomorph` and `compactReducedSuspensionCarrierComparison` on the same based sphere, with interval-last coordinate order and its reference generator. Construct this sphere's based comparison to HomotopySpheres §§3A.1–2's categorical reduced suspension: the raw interval-product quotient is compact Hausdorff and hence already compactly generated. Apply §3A.1's inclusion-preserves-colimits theorem to §3A.2's actual pointed quotient/pushout cocone, then use the quotient universal properties and fully faithful inclusion to construct the isomorphism with the kified raw quotient. Prove its quotient-map and basepoint diagrams. Compose it with AlgebraicTopology Stage4.4's raw-to-kification counit comparison and verify the interval-last/reference-generator diagrams; use the supplied sphere homeomorphism and normalized class.
  - Stage 4B items 2–5 supply the invariant/Jacobi and finite-dimensional Morse–Bott constructions used in the Bott chain of compact classical groups and symmetric spaces. Their Bott-chain applications remain there.
  - Stage5 supplies the framed Pontryagin–Thom collapse from a chosen normal tube and framing; Layer1 extends it to a closed ambient manifold.
- **[Riemannian geometry](../RiemannianGeometry/README.md).** R1 supplies the specified round-Hopf projective metrics. R2 supplies Jacobi initial-value/endpoint-exponential comparisons; R3 supplies the index form, finite node-value reduction, and general complete-manifold finite broken-geodesic carriers and path-energy comparisons. Layer5 constructs the cyclic/free-loop and projective applications on those carriers.
- **[Morse theory](../MorseTheory/README.md).** M5 supplies the abstract compact-band Morse–Bott parameter lemma, negative normal bundles, disc attachment and orientation-local-system Thom comparison. It consumes only Layer1.3's early filtered-complex algebra. Riem R3's based-loop sphere calculation consumes only Layer1.2's early weak-equivalence/homology comparison. Neither generic foundation uses Layer5's projective/free-loop conclusion.

This roadmap owns everything else it states. The generic Novikov support/completion algebra is
consumed from MorseNovikov N1 under its captured written contract; DGF owns only the Floer-specific
support, grading, and comparison applications stated in Layer 7.C. In particular this roadmap owns:
- cubical singular chains and their comparison with simplicial singular chains;
- `H₁ ≅ π₁ᵃᵇ`, CW approximation, and homology invariance under weak equivalences;
- the homological/cohomological adapters and convergence/filtration theory
  extending the native filtered-cochain spectral-object and spectral-sequence API;
- the fibration homotopy exact sequence and ordinary homological and
  multiplicative cohomological Serre sequences on native `serreFibrations` over arbitrary CW and arbitrary-space bases;
- Serre classes;
- the Pontryagin--Thom collapse for framed submanifolds of an arbitrary closed ambient manifold,
  extending the Euclidean-ambient construction of the homotopy spheres roadmap;
- local triviality of evaluation `Diff(M) → O` onto the chosen point's orbit,
  with `O = M` under the connectedness/transitivity hypotheses of Layer 1 item 6;
- the real and complex orthonormal-two-frame quotient comparisons, with the real Stiefel-map degree application, consuming native frame carriers, SBC proper quotients and LieGroups' actual orthogonal/unitary subgroups;
- cyclic/free-loop broken-geodesic extensions and the projective energy, Jacobi index, integral perfectness and explicit-generator applications, consuming the designated CKG/GC carriers, Riem R1–R3 and MorseTheory M5;
- Moore path and loop spaces, transitive lifting-function data, the Moore-path
  replacement with its strict holonomy, and mapping spaces out of spheres;
  G2.10 owns the Hurewicz-fibration predicate and its Serre comparison;
- DG local systems;
- the Barraud--Cornea construction;
- DG Morse and DG Floer homology;
- time-dependent Hamiltonian flows and their 1-periodic orbits, Liouville domains, and the cotangent
  bundle of a manifold with its canonical Liouville form;
- Hamiltonian Floer and symplectic homology;
- the rooted/attached and inhomogeneous fixed-asymptotic sphere-tree applications and conditional shared-structure multi-map evaluation modules of Layer7.C.2b–3; generic marked unforced stable-map compactness is consumed from AnalyticStableMaps M3;
- the Viterbo isomorphism;
- symplectic capacities;
- the almost existence property.

The following constructions touch other roadmaps and are coordination points:

- **The filtered-complex and ordinary Serre spectral sequences.** Layer 1
  item 3 extends native filtered-cochain spectral objects with homological
  and cohomological adapters,
  Classical/Complete Convergence Theorems and actual induced filtrations.
  Item 2 applies them to the skeletal filtration for native `serreFibrations`, owns the
  multiplicative/local-pairing construction and extends along CW approximation;
  AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets.
  Layer 0 item 3 builds a second, cubical Serre spectral sequence directly, for Serre
  fibrations over arbitrary path-connected bases, and requires its natural comparison with
  these.
- **The cotangent bundle of a manifold.** Lane F3 of the Heegaard Floer roadmap takes its cotangent
  examples from here.
- **The Pontryagin--Thom collapse.** Layer 1 builds it with the same data as the homotopy spheres
  roadmap: a chosen tubular neighbourhood and normal framing, with independence as a theorem. It
  agrees with that roadmap's collapse when the ambient manifold is a sphere.
- **Broken geodesics and Morse–Bott theory.** Consume Riem R2/R3's general Jacobi/index-form and complete-manifold finite-vertex path construction and MorseTheory M5's abstract compact-band Morse–Bott attachment/Thom theorem. For an energy cutoff and admissible partition R3 gives the actual finite node carrier and its short-segment/path-sublevel comparison. Layer5 constructs its cyclic seam, free-loop subdivisions, cut comparisons and colimit. The HS4B Bott-chain instantiations use the same generic foundations in their specified compact homogeneous examples; they are not a general complete-manifold replacement.

- **Closed-sphere trees and attachments.** Consume AnalyticStableMaps M3 at genus0 for full marked, multiply covered unforced stable-map compactness, integral splitting and topology over the stated compact smooth tame-J families. Layer7.C.3 constructs the actual rooted attachment, equal-parameter/shared-structure evaluation, inhomogeneous/fixed-asymptotic convergence and conditional gluing application. Different root attachments may carry different frozen structures; retain the corresponding finite product/matching data. The unstable two-marked constant raw PSS core has its own normalization/contraction construction. HF F2.6c's minimal-area single-positive-component compactness retains its additional area hypothesis and does not replace the marked all-tree supplier.
- **Conditional shared-structure evaluation.** Layer7.C.2b owns the reusable finite-tuple distinct-simple-image separation and conditional joint evaluation theorem, with actual allowed variation spaces, collision/attachment partitions and supplied incidence strata. HF owns the two-map local-germ and single-map sphere floors. The pure sphere version has no auxiliary Morse datum; Morse-chain and critical-point versions separately apply it to HF Lane M strata. These modules retain their own prerequisite interfaces when used by another curve-count construction.

## Standing conventions

- **Cubical chains and the ordinary supplier.** The DG/Morse/Floer chains in this roadmap
  are normalized cubical singular chains, following the source and BDHO. Layer 1 item 2's
  general ordinary-topology supplier uses AT's native simplicial singular and twisted chains;
  Layer 0 item 3 transports its homology to cubical chains and builds the Serre spectral sequence
  directly on them, for the DG consumers.
  - A singular `n`-cube is a continuous map `Iⁿ → X`. It is degenerate when it does not depend on
    at least one coordinate (Massey's convention, which is BDHO §5.2's). The chain group is free on
    all cubes modulo the degenerate ones.
  - Serre's convention, which only asks independence of the last coordinate, is not used: it is
    not closed under the cross product.
  - The cross product `Iᵖ × I^q = I^{p+q}` is strictly associative and strictly unital. So
    `C_*(ΩB)` is a DG algebra under Moore concatenation with no Eilenberg--Zilber correction, and
    fundamental chains of products of trajectory spaces are cross products.
  - Every homological input from the algebraic topology roadmap is transported through the
    comparison of Layer 0, which is proved once and then used through named maps.
- **Grading bridge.** The source uses homological grading. The DG roadmap is cohomological, with
  right modules primary.
  - Every DG object here is a cochain object through `C^{-n} = C_n`. A homological differential of
    degree `−1` is a cohomological differential of degree `+1` with the same sign, and parity is
    unchanged.
  - The source's formulas are stated in homological notation through one named equivalence.
  - The sign comparison of the twisting equation with the DG roadmap's `(MC)` is proved once
    (acceptance criterion 2).
- **Moore loops.** `ΩB` is the space of Moore loops `γ : [0, L] → B` with `L ≥ 0`, which is the
  carrier of the strict concatenation used throughout. It is **not** homeomorphic to the
  fixed-interval loop space `Ω^{[0,1]}B = Map_*(S¹, B)`: for `B` a point, `ΩB ≅ [0, ∞)`. The
  comparison is a homotopy equivalence of `H`-spaces `Ω^{[0,1]}B → ΩB`, proved once, together with
  its versions for path spaces, compatible with the endpoint maps (a fibre homotopy equivalence
  over them), with constant sections, and with the actions used downstream. Every homeomorphism
  with a mapping space in this roadmap is stated for the fixed-interval model and then composed
  with this comparison.
  - The duration `L` is a continuous function on the Moore space. On a Riemannian manifold, the
    geometric length of a Moore loop is only lower semicontinuous in the compact-open topology, and
    the loops parametrized at unit speed are **not** a closed subspace: in a flat torus, the
    unit-speed loops `γ_n(t) = (sin 2πnt, 1 − cos 2πnt)/(2πn)` of duration `1` converge to the
    constant loop of duration `1`, whose unit-speed representative has duration `0`. So no statement
    of this roadmap filters a Moore space by geometric length, and no subspace of unit-speed loops
    appears anywhere. The source's Lemma 4.5 is replaced by the compact-family approximation of
    Layer 9 item 3.
- **Mapping-space topology.** Path, loop and mapping spaces carry Mathlib's compact-open topology on
  `C(X, Y)`. Two kinds of source occur.
  - Sphere and interval models have a compact Hausdorff source.
  - A Moore path is a pair `(L, γ)` with `γ ∈ C([0, ∞), X)` stopped at `L`, topologized as a
    subspace of `[0, ∞) × C([0, ∞), X)`. The source `[0, ∞)` is locally compact Hausdorff but not
    compact.

  In both cases local compactness of the source supplies the ordinary Top compact-open
  evaluation/currying law. Retain these raw topologies for arbitrary target spaces. The
  HomotopySpheres Stage3A convenient internal hom is compact-open followed by compact
  generation k. Construct the comparison using the actual counit kZ→Z and the compact-Hausdorff
  test/currying maps; prove its based homotopy-group and singular/cubical-chain comparisons,
  and its compatibility with endpoints, cap/reference maps, constant sections and path
  composition. Convenient multiplication uses k-products; an ordinary product of k-spaces is
  not silently already k. Parameter-family transport retains the actual compact-generation
  hypotheses on its parameter/domain. These weak comparisons do not create Hurewicz lifts or
  fibre homotopy equivalences: consume G2.10's raw lifting maps and the explicit Layer2 Moore
  replacement maps/homotopies for those stronger results.

  Prove a comparison homeomorphism when the raw mapping and stopped-path carriers are themselves
  compactly generated. In particular, for metrizable Y and compact metric sphere/interval source,
  use the uniform compact-open metric. For [0,∞) use the countable exhaustion [0,m] and the
  corresponding compact-open metric; the stopped Moore and fixed-end carriers are metrizable
  subspaces of the resulting products. This gives the homeomorphism lane needed for the
  geometric manifold targets without narrowing the earlier arbitrary-space constructions.
- **Coefficients.** The algebraic Layers 0, 3 and 4 work over an arbitrary commutative ring. The
  geometric Layers 5 and 7--9 are built over `𝔽₂` first. Integer coefficients, with the source's
  orientation conventions of §3.1, form a separate milestone inside each of those layers. Every
  `𝔽₂` theorem is stated so the ring can be generalized without restating the geometry.
- **Floer grading.** The standing degree of a nondegenerate 1-periodic orbit is its Conley--Zehnder
  index. It is normalized so that for a `C²`-small autonomous Morse Hamiltonian on a closed
  `2n`-manifold, `FH_*(H) ≅ H_{*+n}(X)`. The grading needs, besides the area condition, a Chern
  condition and chosen trivializations, as in the source's §3.2. The scoped Layer 7.C exception
  uses `μ=−CZ_HF` on the same symplectic path and states its conversion explicitly there:
  - **First Chern number of a surface map.** For a closed oriented surface Σ
    and smooth f:Σ→X, consume [HeegaardFloer F1.5](../HeegaardFloer/README.md)'s independently constructed
    clutching number `wind(det g)` and its equality with
    CharacteristicClasses C3.2's `c₁(f*TX)[Σ]`. Its graph-loop Maslov
    number is twice this winding, and `c₁(TS²)[S²]=2`. F1.5 owns the
    disc/complement trivializations, choice/homotopy independence and
    topological comparison; this convention does not supply an input back to it.
  - **Symplectically aspherical** means `∫ f^*ω = 0` and `c₁(f^*TX)[S²] = 0` for every smooth
    `f : S² → X`. **Symplectically atoroidal** means the same for every smooth `f : T² → X`. (The
    source writes `f^*[ω] = f^*(2c₁) = 0` for continuous `f`. Since `H²(S²; ℤ)` and `H²(T²; ℤ)`
    are torsion-free, `f^*(2c₁) = 0` is the vanishing of the Chern number. This roadmap uses the
    smooth formulation throughout, which is what the Floer layers consume; for cotangent bundles it
    is verified directly in Layer 9 item 1.)
  - **Trivializations.** In each free homotopy class of loops one reference loop is fixed, with a
    unitary trivialization of `TX` along it. Trivializations along 1-periodic orbits are induced
    through cylinders to the reference loop; the Chern condition on tori makes the induced
    Conley--Zehnder index independent of the cylinder. For contractible orbits the reference loop
    is constant and the condition on spheres suffices. Layer 7.C is a separate contractible capped
    branch: it constructs cap trivializations and the spherical quotient `Γ` and does not assume
    the global atoroidal hypothesis of the standing noncontractible theory.
  - These conditions are separate named hypotheses on every statement of the standing Layers 7--9
    and on the general Liouville-domain results. Layer 7.C instead states its own positive
    spherical-monotone or spherical-`c₁`-zero hypothesis in the contractible capped sector; it does
    not silently inherit asphericity or atoroidality. Exactness of a Liouville domain gives the area
    condition only; the Chern condition stays a hypothesis there. For cotangent bundles,
    `2c₁(T(T*Q)) = 0` holds globally, and the canonical grading of Layer 9 item 1 is compared with
    this one separately; it is not assumed for arbitrary domains.
- **Sign dictionary.** Two conventions differ between the source and Tau Ceti, and they are fixed
  together here.
  - *Hamiltonian vector fields* are those of the Hamiltonian systems roadmap, `ι_{X_H} ω = dH`.
    The source's §3.2 uses `ω(X_H, ·) = −dH`. At a **fixed** form `ω`, the bridge is
    `X^{source}_{ω,H} = X_{ω,−H}`, proved once.
  - *The symplectic form of a cotangent bundle* is Tau Ceti's: `cotangentSymplecticForm` gives
    `ω_can((v, α), (w, β)) = β(v) − α(w)`, so `ω_can = −dλ_can` for the tautological form
    `λ_can = p dq`, and `ω_can(∂_q, ∂_p) = 1` on `T*ℝ`. No second canonical form is introduced.
    The source works with `ω_src = dλ_can = −ω_can`.
  - *Liouville domains* use `ω = dλ` and `ι_Z ω = λ`. On a cotangent bundle the Liouville primitive
    of `ω_can` is therefore `λ = −λ_can = −p dq`, and its Liouville field is the fibrewise radial
    field `Z = p ∂_p`, outward along `S*Q`.
  - *Cotangent transport.* The fibrewise negation `ν(q, p) = (q, −p)` satisfies
    `ν^*λ_can = −λ_can` and `π ∘ ν = π`, and preserves the zero section, `D*Q`, `S*Q` and `p ∂_p`.
    So `ν : (T*Q, ω_src, λ_can) → (T*Q, ω_can, −λ_can)` is an exact symplectomorphism of Liouville
    manifolds. All of the source's cotangent data is transported along `ν`: Hamiltonians
    `H ↦ H ∘ ν⁻¹`, almost complex structures `J ↦ ν_*J` (compatibility is preserved), Floer
    cylinders `u ↦ ν ∘ u`, actions, and trivializations. Since `ν` is symplectic, the Floer
    equation, the energy identity and Conley--Zehnder indices carry over unchanged; no
    anti-symplectic identification is used anywhere.
  - *The two changes combined.* After transport along `ν`, the source's cotangent data live on
    `(T*Q, ω_can)` in the source's Hamiltonian convention, and the fixed-form bridge
    `X^{source}_{ω,H} = X_{ω,−H}` finishes the translation, exactly as on a closed `(X, ω)`. So
    there is one Hamiltonian bridge in the whole roadmap, and on cotangent bundles it is preceded by
    `ν`.
  - *Downstream quantities.* The standing action functional is the source's
    `𝒜_H(γ) = ∫ γ̄^*ω − ∫ H(t, γ(t)) dt` (§3.2), with `γ̄` oriented from `γ` to the reference loop,
    in the source normalization after the substitutions above. Layer 7.C instead writes
    `A_H(γ,D)=∫Hdt+∫_Dω`; on its actual aspherical overlap the standing comparison uses the
    reflected Hamiltonian `H∨`, not a same-`H` identity. Conley--Zehnder indices in the standing
    convention retain `FH_*(H) ≅ H_{*+n}(X)`. The magnetic fibre translation is fixed in Layer 6
    item 3.
  - Acceptance criterion 9 checks the model evaluations.
- **Hypotheses stay unbundled**, as in the Heegaard Floer roadmap: nondegeneracy, regularity of
  `J`, admissibility at infinity, asphericity and atoroidality are separate named hypotheses.
- **Maps are specified, not merely existent.** Continuation maps, direct and shriek maps, the
  Viterbo transfer and the Viterbo map are constructed from explicit data. Their independence of
  choices is a theorem about specified chain homotopies, never a quotient taken silently.

## Inventory

Use the native Serre-fibration and filtered-cochain carriers named in Layer1. Construct the specified LES, local-coefficient, arbitrary-base, product and convergence extensions over those carriers. Layer 1 item 2 consumes the Serre-fibration carrier of the AlgebraicTopology roadmap, `TauCeti.TopCat.serreFibrations`, when it exists at the pin.

Mathlib provides:
- singular homology and its homotopy invariance;
- cubical homotopy groups (`HomotopyGroup`);
- the compact-open topology on `C(X, Y)`;
- homological complexes, homotopies, `SpectralObject`;
- manifolds with corners, integral curves and flows;
- `LieGroup`, `Matrix.orthogonalGroup`, quaternions;
- `Monotone.ae_differentiableAt`.

Tau Ceti provides:
- `IsDGAlgebra`, `IsDGRightModule`, `DGRightModuleCat`, restriction of scalars along `DGAlgHom`;
- the loop-space shift `pathLoopSpaceMulEquiv : π_m(Ω X) ≃* π_{m+1}(X)`;
- `IsAspherical` and `IsEilenbergMacLaneSpaceOne`;
- twisted singular homology and `LocalCoefficientSystem`;
- `cotangentSymplecticForm` and `cotangentLiouvilleForm` on the model space;
- `SmoothAlmostComplexStructure` and `IsPseudoholomorphic`;
- the Morse lemma, the Morse index, negative-gradient flows;
- finite-dimensional Sard and Sard–Smale.

The following targets are built here, consuming the native APIs cited in their layers:
- cubical chains;
- `H₁ ≅ π₁ᵃᵇ`;
- CW approximation;
- the homotopy exact sequence and arbitrary-CW/arbitrary-base homological
  and multiplicative cohomological spectral sequences for native `serreFibrations`;
- the homological adapter and convergence theory for native filtered-complex
  spectral objects and spectral sequences;
- Serre classes, Eilenberg--MacLane spaces `K(A, n)` for arbitrary abelian `A` with their
  uniqueness up to weak equivalence, and the one-step connected covers of Layer 1 item 4;
- the Pontryagin--Thom collapse in a non-Euclidean ambient manifold;
- the real and complex orthonormal-two-frame homogeneous identifications from native frames and SBC quotients, with their separate dimension and stabilizer cases;
- projective loop-energy/index/perfectness/generator applications on the supplied CKG/GC carriers and RiemannianGeometry metrics.

---

## Layer 0: cubical singular chains

1. Singular cubes, faces and degeneracies, and the normalized cubical chain complex
   `C^□_*(X; A)` over a commutative ring `A`. Functoriality, relative chains of pairs, and the
   augmentation.
2. The cross product `C^□_p(X) ⊗ C^□_q(Y) → C^□_{p+q}(X × Y)`: strictly associative, strictly
   unital, satisfying the Leibniz rule with the Koszul sign. For a topological monoid `G` with
   strict unit, `C^□_*(G)` is a DG algebra under the product induced by multiplication.
3. The comparison with simplicial singular chains is a natural chain homotopy equivalence, built by
   acyclic models on cubes and simplices. It is compatible with cross products up to a specified
   natural chain homotopy, through Eilenberg--Zilber, and with relative chains. Consequences, each
   derived through the comparison and not re-proved:
   - homotopy invariance;
   - the long exact sequence of a pair;
   - excision;
   - the Künneth theorems;
   - cubical local coefficients.

   The Serre spectral sequence is the exception: it is built directly on cubical chains, as in
   Serre's original (*Homologie singulière des espaces fibrés*, Chapter II), from Serre's
   filtration and the filtered-complex spectral sequence of Layer 1 item 3.
   - For a continuous map `p : E → B`, `F_s C^□_n(E; A)` is the image in the normalized chains of
     the span of the cubes `u : Iⁿ → E` with `p ∘ u = v ∘ pr_s` for some cube `v : Iˢ → B`, where
     `pr_s : Iⁿ → Iˢ` is the projection onto the first `s` coordinates. Equivalently, `p ∘ u` does
     not depend on the last `n − s` coordinates. It is not enough that `p ∘ u` factor through some
     cube of dimension `≤ s`: for `p = id : I → I` every cube would then lie in `F_1`.
   - `F_s C^□_n = 0` for `s < 0` and `F_s C^□_n = C^□_n` for `s ≥ n`.
   - For a Serre fibration, which is Serre's own hypothesis (homotopy lifting for cubes), the
     lifting property enters in identifying `E¹` with the chains of the base with coefficients in
     the homology of the fibre, and nowhere else.
   - **Two constructions, with named scopes.** This *cubical* Serre spectral sequence, over an
     arbitrary path-connected base and without a CW structure, is the one that the cubical
     consumers use: Layer 5 item 4 (the index spectral sequence is isomorphic to it from `E²` on)
     and Layer 8 item 6 (Theorem J). The *CW-approximation* Serre spectral sequence of Layer 1
     item 2, with its skeletal filtration, is the ordinary Serre spectral sequence and the
     supplier of the algebraic topology roadmap (Stage 5.5: `arbitraryCWSerreSpectralSequence`
     and `arbitraryBaseSerreSpectralSequence`). Its domain is every Serre fibration; the cubical
     sequence does not replace it or narrow it.
   - **Comparison.** For a Serre fibration over a path-connected base, the two are naturally
     isomorphic as spectral sequences from `E²` on:
     - the isomorphism is compatible with the identification `E²_{p,q} = H_p(B; H_q(F))`, where
       `H_q(F)` is the local system of the fibre homology (the monodromy local system on the
       CW side, the local system `b ↦ H_q(p⁻¹ b)` on the cubical side);
     - it is compatible with the abutment filtration of `H_*(E)`;
     - it is natural in maps of fibrations.
     It is stated for a Serre fibration, a morphism of the algebraic topology roadmap's carrier
     `TauCeti.TopCat.serreFibrations`, so it covers every Hurewicz fibration (Layer 2 item 2) and
     every locally trivial bundle over a base that need not be paracompact.
4. Fundamental chains: a compact oriented topological manifold with corners whose boundary is a
   union of products of lower-dimensional ones has a fundamental chain rel boundary in
   `C^□_*`. Its boundary is the signed sum of the cross products of the fundamental chains of the
   faces. This is the chain-level input of every representing chain system in Layers 5 and 8.
   - The only homological fact used is that the connecting map `H_n(M, ∂M) → H_{n−1}(∂M)` sends
     the fundamental class rel boundary to the fundamental class of the boundary.
    - Topological manifolds with corners suffice for these representing-chain systems in Layers5 and8. Regular analytic moduli loci still require their actual differentiable charts, tangent-kernel identifications, smooth group actions and oriented Fredholm gluing. A smooth atlas on every coarse compactification stratum is not a hypothesis of the fundamental-chain theorem; the virtual application retains its specified topological regular-model axioms.
5. Source: Massey, *Singular Homology Theory*, Chapters II and VII; Serre, *Homologie singulière
   des espaces fibrés*, Chapter II; BDHO, Chapter 5 and Appendix; Barraud--Cornea, Appendix A.

## Layer 1: topological prerequisites

These are general facts that the later layers use, which no other roadmap builds.

Reuse the native Serre interfaces in
`SerreFibration/Basic.lean`
and `SerreFibration/FiberBundle.lean`.
They supply the morphism-property/disc/cube vocabulary and bundle lifting;
the remaining LES, coefficient, arbitrary-base, multiplicativity and
convergence targets below extend those interfaces.

1. **Hurewicz in degree one.** For a path-connected space, `π₁(X)ᵃᵇ ≅ H₁(X; ℤ)` naturally. This
   proves the isomorphism theorem for AT8.3's actual normalized absolute
   Hurewicz map with target AT's native simplicial singular H₁(X;ℤ):
   a loop is sent to its induced positively oriented singular
   circle class, through Layer 0's cubical/simplicial chain comparison. The
   induced map on abelianization is the displayed isomorphism, with no
   independent sign or map. AT8.3's higher-degree isomorphism theorem starts
   in degree two. The source uses it for `H₁(Ω²Q) ≅ π₃(Q)` in Proposition 5.11.
2. **Weak equivalences and CW approximation.**
   - Every space has a CW approximation, natural up to homotopy. This is the
     abstract approximation theorem; CharacteristicClasses (CC) C1.2 owns the weak-equivalence
     theorem for its specific actual singular-realization counit.
   - Own `connectedMapHomologyComparison` and its weak-equivalence
     specialization on native simplicial singular and twisted chains. Use the
     direct Eilenberg-subcomplex route of tom Dieck 9.5.1: formulate connectivity
     by relative disc/sphere compression and homotopy lifting, without AT8.1's
     relative homotopy-group construction or AT8.3's Hurewicz theorem. For a
     k-connected mapping-cylinder pair generate the subcomplex by simplices
     carrying their k-skeleton into the subspace. Construct face-compatible
     homotopies P(σ), fixing compressed simplices and relative faces, and the
     actual prism chain equivalence. Transport local coefficients along P at
     vertices, with face/prism compatibility. The complexes agree through
     degree k, giving homology isomorphisms below k and surjectivity in k.
     For a weak equivalence compress compatibly in every degree to obtain the
     coefficient-chain homotopy equivalence and its Hom/cohomology comparison,
     for maps of pairs and their exact sequences. This also proves that a weak
     equivalence induces local-coefficient homology isomorphisms on arbitrary
     spaces; CC C1.2 consumes these exact maps, not a second proof.
   - Use `TauCeti.TopCat.serreFibrations` on native TopCat morphisms,
     with `mem_serreFibrations_iff`/`mem_serreFibrations_iff_cube`
     for disc/cube lifting, its pullbacks and maps of fibrations.
     Reuse `TauCeti.TopCat.mem_serreFibrations_proj` and
     `FiberBundle.hasHomotopyLiftingProperty_proj_cube` for locally
     trivial bundles, with no paracompactness hypothesis. Own the
     remaining fibration homotopy exact sequence including components.
     Construct the sequence and boundary directly by disc lifting and endpoint
     restrictions, retaining group laws and pointed-set exactness at π1/π0;
     do not consume AT8.1's relative-pair sequence. These constructions use
     AT1–4's homotopy, disc and CW-pair APIs. Paracompactness is retained where
     Layer 2 asks for the stronger Hurewicz-fibration property.

     **All-CW testing and based fibration sequence.**
     Own the actual comparison between native disk/cube Serre testing and
     homotopy lifting for every Hausdorff CW parameter, in the displayed
     universe. Prove the finite disk-cylinder pair homeomorphism from bottom
     to bottom∪boundary-cylinder, use it for prescribed boundary and bottom
     lifts, and extend cellwise over a native relative CW pair. Keep arbitrary
     dimensions and cell sets; glue via attaching quotient diagrams and prove
     the product weak-topology lemma for the compact Hausdorff interval.
     Empty pairs and 0-cells are included. This actual relative-CW lifting
     consequence, not disk testing alone, fixes basepoint tracks for the
     finite sphere/cube representatives and their homotopies.

     Construct the fibration boundary by the actual relative lift and endpoint
     restriction, prove representative/lift independence by a further relative
     cube lift, and prove naturality for commuting based squares. Pin all
     concatenation comparisons to native mul_spec's reversed transAt order.
     At the low end retain pointed sets, component actions and image=kernel
     exactness, with no module carrier for π₁ or components. For arbitrary
     well-pointed parameters the Hurewicz lane consumes GC G2.10's fixed-data
     closed-NDR relative lifting, not a presumed regular lift. AT8 owns the
     different based-pair carrier and sequence; neither LES depends on the
     other's construction. Every-fibre weak contractibility, including
     nonemptiness, gives a weak equivalence by this LES and component lifting.
     Homotopy equivalence additionally uses actual CW-type witnesses and
     AT8.5 ordinary Whitehead. A chosen fibre alone gives no conclusion on
     unrelated base components. No unrestricted contractible-fibre
     homotopy-equivalence conclusion is asserted without these additional
     CW-type or separately stated precise local-to-global hypotheses.
   - Own `arbitraryCWSerreSpectralSequence` for every path-connected CW base,
     using AT1–4 and the actual filtration
     `E_p = p⁻¹(B^(p))`, with `E_(−1)` empty. Prove that singular chains are
     exhausted by this filtration using compact simplex images and cellular
     filtration comparison. Apply item 3's filtered-complex construction;
     identify `E²_(p,q)=H_p(B;H_q(F;R))` with actual path-transport monodromy,
     and prove convergence to `H_(p+q)(E;R)`. In each total degree the
     first-quadrant filtration is finite, exhaustive and separated; identify
     its graded pieces with `E∞`, including the extension data. No finite-type
     or dimension bound is imposed on B or F. Prove naturality under maps
     of fibrations and coefficient maps, and the componentwise version.
   - Own `arbitraryBaseSerreSpectralSequence`: for a Serre fibration over
     an arbitrary path-connected space B, pull back along a CW approximation
     `B'→B`. Prove the induced total-space map is a weak equivalence by the
     fibration homotopy sequence, including components, and identify its
     local-coefficient homology maps and the base local-coefficient homology
     comparison. Transport the preceding spectral sequence, its E² page,
     convergence and abutment filtration to the original fibration. Prove
     independence of CW approximation via comparison refinements and
     naturality from E² onward; also give the disconnected-base version.
     These targets use AT1–4 and item 3, with no AT5.5 or GeneralizedCohomology input,
     and precede item 4. The source applies them over `Ω₀Q`, `Ω²B` and `Y`.
   - Own `arbitraryCWSerreCohomologySpectralSequence` and
     `arbitraryBaseSerreCohomologySpectralSequence` on native
     `TauCeti.TopCat.serreFibrations` and the same skeletal filtration. Use the actual dual filtered cochain
     complex and its relative quotients, including the cellular/singular
     filtration comparison; do not identify cohomology pages by naive duality
     of homology pages. The cohomological sequence has
     `E₂^(p,q)=H^p(B;H^q(F;M))`, with path-transport local coefficients,
     and converges to H^(p+q)(E;M). Prove first-quadrant strong convergence:
     the induced abutment filtration in each total degree is finite,
     exhaustive and separated, with E∞ its actual graded module. Prove
     completeness of the cochain inverse filtration and vanishing of the
     relevant inverse-limit obstruction; retain the same no finite-type or
     dimension restriction. Construct coefficient and fibration naturality,
     arbitrary-base pullback comparison/independence and componentwise forms.
     For a commutative ring R and local-system pairing M⊗_R N→P, own the
     multiplicative comparison through the following actual construction.
     Consume AT4.5's CW structure on k(B×B), its product-cell filtration
     (B×B)_m=⋃_(i+j≤m)B^i×B^j, and cellular approximation D of Δ_B.
     Own a compatible filtered CW approximation q:E′→E with CW
     subcomplexes E′_p and q_p:E′_p→E_p weak equivalences, including
     relative pair comparisons and actual filtered local-cochain maps that
     are quasi-isomorphisms on the relative filtration quotients. First
     pull back p×p along k(B×B)→B×B, and then along D; no map from an
     arbitrary non-CW E×E into k(B×B) is assumed. Lift the diagonal-to-D
     homotopy only on the CW source E′, cell by cell with the fixed faces.
     Construct its product-filtered cup map, then transport through those
     filtered comparisons; do not lift on a general non-CW total space or
     assert the ordinary Alexander–Whitney product is filtered on E_p.
     Own `serrePreimageSubcomplexExcision`: preimages of CW subcomplexes
     A,B under a Serre fibration over a CW base form an excisive couple for
     native singular/twisted chains and relative-cochain products. Consume
     AT4.5's compatible open neighborhoods of A,B and their intersection/union.
     Prove each preimage inclusion over the deformation retraction is a weak
     equivalence by the fibration sequence and component path lifting. Apply
     the weak-equivalence coefficient-chain/Hom comparison and AT3 open
     excision to the intersection/union diagram. Construct the actual small-
     chain quasi-isomorphism C(E_A)+C(E_B)→C(E_(A∪B)) and the relative
     cochain map, with chosen inverses/homotopies only up to specified natural
     homotopy. Use it, iterated for the finite product-skeletal union in each
     m, to define the product-filtered cup on a small-chain/relative model;
     do not evaluate the ordinary cross cochain unconditionally on arbitrary
     simplices in that closed union. Consume native
     `IsStableUnderProductsOfShape` and `IsStableUnderBaseChange`
     instances for `serreFibrations`. Transport categorical products
     to the concrete E×E carrier through native `RespectsIso` and
     TopCat's product isomorphism. Use `mem_serreFibrations_pullbackFst`
     for pullbacks. Identify g^*(M⊠N) with
     q^*(M⊗N) by inverse transport along the actual lifted diagonal-to-g
     homotopy, using AT2.6's path-natural local-system comparison; retain
     that identification in cups.
     Own comparison prisms raising the base filtration by at most one,
     giving independence/naturality of the resulting pairings from E₂
     onward and preserving the actual abutment cup product. For fixed
     choices construct all E_r pairings; the E₂ pairing is (−1)^(q p′)
     times the local coefficient cup pairing in every bidegree.
     In trivial-monodromy tensor coordinates the product has Koszul sign
     (a⊗x)(b⊗y)=(−1)^(q p′)(ab⊗xy), with x in fibre degree q and b in
     base degree p′. State d_r:E_r^(p,q)→E_r^(p+r,q−r+1) and
     d_r(uv)=d_r(u)v+(−1)^(p+q)u d_r(v), and prove multiplicative
     abutment/extension compatibility. For a field k, a simply connected
     base and degreewise finite-dimensional H^q(F;k), own the natural E₂
     graded-algebra identification H^*(B;k)⊗_k H^*(F;k); prove the local
     tensor/cohomology comparison giving this algebra, not just its vector space.
     For the ring sequence take constant R and its multiplication. Use AT6.0–6.2's
     earlier foundational tower/cochain/cup API and item 3's cohomological filtered
     construction, independently of AT duality/EM and G5. GeneralizedCohomology G5 consumes this
     multiplicative supplier for rational K(ℤ,n); no second Serre construction
     or assumption that additive page calculations determine the cup ring.
3. **The spectral sequence of a filtered complex.** Reuse the native
   `CochainComplex.spectralObject`, `filtrationFunctor`,
   `spectralSequence` and mapping-cone/cokernel first-page comparisons in
   `Filtered/SpectralObject.lean`,
   with the reindexing and convergence comparisons specified here.
   For an increasing filtration of a module chain complex over a ring,
   assume degreewise filtration lower
   bounds `∀ n, ∃ s(n), F_(s(n)) C_n=0` and exhaustion `⋃_p F_p C_n=C_n`.
   Construct the sequence `E¹_(p,q)=H_(p+q)(F_p C/F_(p−1) C)` as an instance
   of Mathlib's `SpectralObject`. Prove natural strong convergence in the
   following sense: the actual induced filtration
   `F_p H_n=im(H_n(F_p C)→H_n(C))` is exhaustive and bounded below (hence
   separated and complete in its lower-filtration direction), and
   `E∞_(p,q)≃F_p H_(p+q)/F_(p−1) H_(p+q)` naturally. No finite upper
   filtration bound is required. This is Weibel's Classical Convergence
   Theorem 5.5.1(2); the lower bound concerns the filtration in each chain
   degree, not merely the degrees in which the complex is nonzero.
   Regrade C^(−n)=C_n with the same differential, and pull native
   `HomotopyCategory.spectralObjectMappingCone` back along the EInt-indexed
   increasing filtration functor, with 0 and C at its infinite endpoints;
   compose with the degreewise cohomology homological functor. Use native
   `coreE₂Cohomological`. The stated homological E_r^(p,q) is its page
   r+1 at native bidegree (a,b)=(1−2p−q,p−1), so deg=a+b=−(p+q),
   i₁=p−1 and i₂=p. For a decreasing cochain filtration F^p, use the
   increasing functor G_t=F^(−t); its cohomological E_r^(p,q) is native
   page r+1 at (a,b)=(2p+q+1,−p−1), so deg=p+q, i₁=−p−1 and i₂=−p.
   Prove the quotient-page identifications and representative-boundary
   differential formula, retaining the mapping-cone/reindexing signs.
   Own the cohomological form of Weibel's Complete Convergence
   Theorem 5.5.10 for complete exhaustive decreasing cochain filtrations
   with regular spectral sequence. Prove weak convergence and its actual
   induced cohomology filtration/E∞ graded identification. Prove strong
   convergence under the theorem's additional degreewise spectral boundedness
   after cohomological reindexing, using the Milnor/lim¹ sequence; the
   first-quadrant case is regular and degreewise bounded. In the Serre instance
   prove completeness of the inverse cochain filtration and the degreewise
   finite abutment filtration. Cup pairings come from actual filtered
   cochain maps, independently of convergence.
   - Layer 0 item 3 builds a second, cubical Serre spectral sequence directly, for Serre
     fibrations over arbitrary path-connected bases, and requires its natural comparison with
     the Serre spectral sequence of this item from `E²` on.
4. **Serre classes and Hurewicz modulo a class.**
   - A Serre class is a class of abelian groups closed under subgroups, quotients and extensions,
     and satisfying Serre's axioms for `⊗`, `Tor` and the homology of `K(A, 1)`. Hurewicz modulo a
     Serre class for simply connected spaces (Serre 1953, Theorem 1; the source's Theorem 5.12).
   - Instances: the torsion groups (equivalently `G ⊗ ℚ = 0`), and, for a fixed integer `d ≥ 1`,
     the groups annihilated by **some** power of `d`, `∃ m, dᵐ · G = 0`. The groups annihilated by
     one fixed `dᵐ`, for `d ≥ 2` and `m ≥ 1`, do not form a class: they are not closed under extensions.
   - The class `{G | G ⊗ ℤ/2 = 0}` used in the source's proof of Theorem 5.15 is **not** a Serre
     class: `ℚ` belongs to it and its subgroup `ℤ` does not. It is replaced by the following
     theorem, which is what that proof needs.
   - **Mod-2 vanishing.** For a simply connected space `Y` with `H̃_*(Y; 𝔽₂) = 0`, every `π_i(Y)`
     is uniquely 2-divisible (a `ℤ[1/2]`-module). Only this direction is used. No finite generation
     is assumed. A uniquely 2-divisible group has `G ⊗ ℤ/2 = 0`, which is how Layer 10 item 5
     applies it. Its prerequisites are owned here, since no roadmap supplies them:
     - **Eilenberg--MacLane spaces.** Pin one functorial abelian model in each degree.
       For n=1 set `K(A,1)=B(Multiplicative A)`, an alias of
       [AlgebraicTopology 8.8](../AlgebraicTopology/README.md)'s native
       `|nerve (SingleObj (Multiplicative A))|`. That item owns the generic
       contractible Eπ, covering, CW structure and fundamental-group edge normalization;
       it has no dependency on this item. For n≥2 use the realization of the
       simplicial abelian group Γ(A[n]) from Mathlib's Dold–Kan equivalence,
       with A[n] the nonnegative chain complex concentrated in degree n.
       Consume AT4's single generic simplicial-realization CW structure.
       Construct the coefficient-natural identification π_n≃A through AT8.2's
       simplicial-group Kan/Moore theorem and actual Kan realization-unit
       comparison, followed by the cubical comparison and the degree-n
       homology map of the native Dold–Kan counit NΓ(A[n])≅A[n]. Thus the
       distinguished class from a normalized simplex labelled a maps to a. Pin the positive sphere orientation by
       AT8.6. In degree one compare Γ(A[1]) with the abelian nerve as simplicial
       abelian groups, with the edge labelled a corresponding to a; use the bar
       carrier above throughout. Prove all other positive homotopy groups vanish.
       Thus AT8.10 consumes a fixed constructor and normalized identification,
       without constructing another abelian model. The construction uses only
       AT8.1–8.8, not AT8.9–8.12's obstruction/representability results.
       For a **directed union** A=⋃A_i of subgroups, prove the corresponding
       simplicial inclusions are subcomplexes with union the chosen model, so
       H_*(K(A,n))=colim H_*(K(A_i,n)) by compact supports. No statement about
       arbitrary topological filtered colimits is made: the topological colimit
       of S¹→S¹→⋯ under degree-2 maps is indiscrete and is not K(ℤ[1/2],1).
       (Its mapping telescope is one, but is not used.) Native
       `IsEilenbergMacLaneSpaceOne` supplies the degree-one EM property interface.
     - **Presentation model and skeletal extension.** Own a second, comparison
       CW construction of K(A,n) from a presentation of A: for n≥2 start
       with a wedge of positively oriented n-spheres for its generators,
       attach (n+1)-cells along its relations, and kill successive higher
       homotopy groups by cells in dimensions≥n+2. For n=1 use the
       group-presentation 2-complex of A and kill higher homotopy in
       dimensions≥3. Prove each stage preserves π_n and the lower
       groups, and prove the limit's homotopy groups by compact-family
       factorization through the CW tower. Give the coefficient-normalized
       comparison to the chosen bar/Dold–Kan model, using the skeletal
       extension below and Whitehead; the chosen functorial carrier stays
       that single model. Own Hatcher's Lemma4.31 skeletal extension:
       realize a supplied homomorphism on π_n by maps of the generator
       spheres, extend over the presentation cells using their null
       relations, and over every higher cell using the target's vanishing
       higher homotopy. Construct the based maps and homotopies and prove
       their coefficient normalization. Likewise own the general higher-cell
       killing construction used below, with its connectivity and preserved
       lower-group claims. All these constructions use AT4's cell attachments
       and AT8.1–8.7's relative homotopy/Hurewicz/Whitehead machinery,
       without AT8.9–8.12 obstruction or representability results.
     - **Uniqueness.** For the CW complex `K(A, n)` above and any space `Z` with `π_n Z ≅ A` and
       all other homotopy groups zero, a map `K(A, n) → Z` realizing a given isomorphism on `π_n`
       exists by the presentation/skeletal extension just constructed and is
       a weak equivalence (Hatcher, Proposition4.30). Construct it first on
       the presentation model, and precompose with a based homotopy inverse
       of the coefficient-normalized presentation-to-bar/Dold–Kan comparison
       to obtain the map on the chosen functorial carrier. Use Whitehead's theorem
       from AT8.1–8.7 and CW approximation from item2 for the CW comparison.
       The normalized
       identification uses AT8.2's ordered-simplex/cube orientation comparison:
       a spherical n-simplex labelled a has cubical Hurewicz image the
       relative class σ_*[Δ^n,∂Δ^n], transported to absolute homology by
       the point-pair sequence for n≥1. Separately its normalized Moore
       class maps to a under the native Dold–Kan counit. The counit does
       not act directly on the topological singular homology class.
       This fixes the constructor's sign. AT8.10 proves the downstream
       universal-class evaluation e_a↦a; this item consumes no such class. Through
       item 2, every K(A,n) has the homology of the chosen degree-one bar
       or higher-degree Dold–Kan model. The chosen models and the targets
       Z in this uniqueness comparison are path connected; include π₀
       explicitly, rather than imposing only positive-degree homotopy conditions.
     - **Path and homotopy-fibre carriers.** Consume
       [GeneralizedCohomology G2.10](../GeneralizedCohomology/README.md#g2-a-concrete-spectral-model-and-represented-theories)
       for the based path-loop fibration and mapping-path homotopy fibre,
       including its endpoint-evaluation Hurewicz fibration, comparison with
       the native Serre carrier consumed in item 2 and contractibility of the based path space.
       Apply **item 2's** long exact fibration homotopy sequence, including
       its component terms, to these supplied Hurewicz/Serre fibrations.
       G2.10's predicate/path/native-comparison constructions use early
       G2.1 and native `TauCeti.TopCat.serreFibrations`; its
       applications of the fibration LES consume item 2.
       Thus item 2 → G2.10's LES applications → this item;
       G2.10's constructions need only early G2.1. This item consumes no Eilenberg--MacLane
       representability or mod-2 vanishing. Identify the loop fibre
       ΩK(A,n) with K(A,n−1) for n≥2 through the **Uniqueness** target above,
       after CW approximation, using the coefficient-natural connecting
       isomorphism on π_(n−1). This comparison consumes no AT8.11 result.
     - **Integral/mod-2 chain comparison.** Own the homology Bockstein
       sequence needed here. For AT2's native simplicial integral singular
       chain complex C_Z, prove degreewise freeness
       and the natural degreewise short exact sequence
       `0→C_Z --×2→ C_Z→C_Z⊗ℤ𝔽₂→0`, identify the quotient complex
       with AT2's native simplicial 𝔽₂ singular chains, used by item2's
       Serre sequence, restricted from 𝔽₂-modules
       to ℤ-modules. Prove the restriction-of-scalars homology comparison
       and instantiate the native homology long exact sequence over ℤ.
       Export its maps, exactness and
       naturality. In particular, vanishing of H_(i+1)(Z;𝔽₂) and
       H_i(Z;𝔽₂) makes multiplication by2 on H_i(Z;ℤ) bijective.
       This comparison precedes the one-step lemma and uses no homology
       universal-coefficient theorem. Export also the natural surjection
       H₁(Z;ℤ)→H₁(Z;𝔽₂) from the torsion-free H₀(Z;ℤ) term,
       and its identification with the quotient by2.
     - `H̃_*(K(A, n); 𝔽₂) = 0` for every `ℤ[1/2]`-module `A`. For `n = 1`: `A` is the directed
       union of its finitely generated `ℤ[1/2]`-submodules, which are finite sums of copies of
       `ℤ[1/2]` and of finite cyclic groups of odd order, so by the directed-union property and
       Künneth it suffices to treat these two. Construct the canonical map
       `|N(A×B)| → |N(A)|×|N(B)|` induced by the two group projections.
       AT8.8 identifies its π₁ map with the identity on A×B and all higher
       groups with zero, so it is a weak equivalence; item 2's homology
       invariance and AT Stage 5 item 1's field Künneth theorem give the
       required natural homology product formula. This argument uses no
       obstruction or representability theorem. For `ℤ[1/2] = ⋃_r 2^{−r}ℤ`: each `2^{−r}ℤ ≅ ℤ`, and
       under these identifications the inclusion `2^{−r}ℤ ⊂ 2^{−r−1}ℤ` is multiplication by `2`.
       By uniqueness, `K(ℤ, 1)` has the homology of `S¹`, and `H_1(K(G, 1)) ≅ G^{ab}` naturally in
       `G` (item 1). The preceding reduction/quotient comparison
       identifies the induced mod-2 H₁ map as multiplication by2,
       hence zero. Therefore `H̃_*(K(ℤ[1/2], 1); 𝔽₂) =
       colim(𝔽₂ →×2 𝔽₂ →×2 ⋯) = 0`. For a finite cyclic group of odd order, consume AT8.8's
       bar-space/group-cohomology comparison. Construct the finite-group
       averaging contraction on its positive-degree bar cochain complex:
       its order is invertible in 𝔽₂, so its positive group cohomology
       with trivial 𝔽₂ coefficients vanishes. AT6's field universal
       coefficient comparison identifies this cohomology with the dual
       of homology; a vector space with zero dual is zero. Thus its
       reduced mod-2 homology vanishes. For
       `n ≥ 2`: induction through the path-loop fibration `K(A, n−1) → P → K(A, n)` over the simply
       connected base `K(A, n)`; the mod-2 Serre spectral sequence has `E²` concentrated in the
       bottom row, which is `H_*(K(A, n); 𝔽₂)`, so `E² = E^∞`, and the total space is
       contractible.
     - **The one-step lemma.** Let `n ≥ 2` and let `Z` be an `(n−1)`-connected space with
       `H̃_*(Z; 𝔽₂) = 0`. Then:
       - `π_n Z ≅ H_n(Z; ℤ)` (AT8.3 Hurewicz, on the native
         simplicial integral singular homology carrier) is uniquely 2-divisible:
         the preceding chain comparison and vanishing of mod-2 homology
         in degrees n and n+1 make ×2 on H_n(Z;ℤ) bijective.
       - After CW approximation (item 2), attaching cells of dimension `≥ n + 2` to `Z` kills `π_k`
         for `k > n` and produces a `K(π_n Z, n)` containing `Z`, with `Z → K(π_n Z, n)` an
         isomorphism on `π_n` (Hatcher §4.1). Let `Z' → Z` be its homotopy fibre. Then `Z'` is
         `n`-connected, `π_k Z' ≅ π_k Z` for `k > n`, and the fibre of `Z' → Z` is `ΩK(π_n Z, n)`,
         a `K(π_n Z, n − 1)`.
       - `H̃_*(Z'; 𝔽₂) = 0`. The mod-2 Serre spectral sequence of `K(π_n Z, n−1) → Z' → Z` has a
         simply connected base, `H̃_*(Z; 𝔽₂) = 0`, and `H̃_*(K(π_n Z, n−1); 𝔽₂) = 0` by the previous
         two items, so `E²` is concentrated at `(0, 0)`.

       The Eilenberg--MacLane fibre sits over the `(n−1)`-connected stage `Z`, never over the
       original space: for `Y = S²` and `n = 3`, a 3-connected `E` in a fibre sequence
       `K(π₃S², 2) → E → S²` would give `0 = π₂(E) → π₂(S²) = ℤ → π₁(K(π₃S², 2)) = 0` in the long
       exact sequence, which is impossible. Iterating the lemma produces the Whitehead tower
       `⋯ → Y⟨n+1⟩ → Y⟨n⟩ → ⋯ → Y⟨2⟩ = Y` with `K(π_n Y, n−1) → Y⟨n+1⟩ → Y⟨n⟩` between
       **successive** stages; the tower as a whole is not needed.
     - **The induction.** Start with `Z = Y`, which is 1-connected, and `n = 2`. The lemma shows
       that `π_2 Y` is uniquely 2-divisible and gives a 2-connected `Z'` with `H̃_*(Z'; 𝔽₂) = 0`
       and `π_k Z' ≅ π_k Y` for `k ≥ 3`. Applying it to `Z'` with `n = 3`, and so on, shows that
       every `π_i(Y)`, `i ≥ 2`, is uniquely 2-divisible; `π_1 Y = 0`.
5. **Pontryagin--Thom collapse.** For a closed codimension-`k` submanifold of a closed manifold
   with a framed normal bundle, the collapse map onto `S^k`, determined by a chosen tubular
   neighbourhood (from geometric topology) and the framing. The construction is the one of the
   homotopy spheres roadmap's Stage 5, with an arbitrary closed ambient manifold in place of
   `ℝ^{n+k}`, and agrees with it for spherical ambient manifolds. Independence of the choices, its
   effect on fundamental classes, and its compatibility with shriek maps.
6. **Diffeomorphism groups and evaluation orbits.** For a closed smooth manifold M with a chosen point x₀ consume GT Layer3's C-infinity topological group Diff(M), its composition/inverse continuity, smooth-families map, orthogonal sphere action and compact-embedding restriction bundle onto the actual Diff orbit. Specialize that restriction construction to a point, identify its C-infinity embedding space with M through the actual evaluation/inverse maps, and let O be the orbit of x₀ and H={g | g(x₀)=x₀}. Compare the resulting supported local sections with coordinate-ball motions from compactly supported smooth vector fields. If g(x₀)=y, compose a local motion taking y to z with g to obtain a continuous local section s:U→Diff(M) over an open neighbourhood U of y in O. Export evaluation Diff(M)→O as a locally trivial principal right-H bundle, with the actual mutually inverse maps g↦(g(x₀),s(g(x₀))⁻¹g) and (z,h)↦s(z)h.
   For connected M, join x₀ to y by a path covered by finitely many coordinate balls and compose the supported motions to prove O=M; this gives the claimed bundle over M without an orientation hypothesis. For disconnected M retain the orbit formulation: identify O with the union of precisely those components reachable by an actual global diffeomorphism (for a closed manifold, the components diffeomorphic to the component of x₀, with the component-swap extensions constructed). It is an open-and-closed submanifold. State a bundle over all M only with explicit transitivity data; otherwise fibres outside O are empty. Retain the zero-dimensional and finite-component cases. A merely continuous family into Diff is not identified with a jointly smooth family.
7. **Homogeneous examples on designated carriers.** Consume SBC B1.4 for proper free-action smooth quotients, principal projections and tangent quotients, and LieGroups Layer2 for the real/complex closed matrix subgroups. Consume CKG K7.1 for its complex projectivization atlas and real restriction, [GC G4.0b](../GeneralizedCohomology/README.md#g4-generalized-lerayhirsch-thom-and-euler-theory) for the designated Sp, quaternionic frame/Grassmannian/HP carriers and smooth Hopf comparisons, and Riem R1 for the normalized quotient metrics. Retain the supplied topologies, smooth structures and explicit quotient comparisons.
   - For n≥3 construct the ordered orthonormal-two-frame identification SO(n)/SO(n−2), with stabilizer diag(I₂,SO(n−2)), actual orbit/inverse maps, tangent quotient and sphere-bundle projection. For n=2 the carrier is O(2)=SO(2)⊔rSO(2), r=diag(1,−1), with determinant distinguishing the two SO(2) orbits; for n<2 it is empty. Compare with O(n)/O(n−2) for every n≥2, so both descriptions use this same frame carrier.
   - On the native complex ordered orthonormal-two-frame carrier in ℂⁿ, for n≥2 construct the U(n)/U(n−2) comparison with stabilizer diag(I₂,U(n−2)), actual orbit/inverse maps, tangent quotient, principal local sections and the first-vector sphere-bundle projection. For n=2 this is U(2), while n<2 gives the empty frame carrier. This is the complex analogue on its own carrier, not an identification with the real SO quotient; retain the quaternionic frame comparisons on GC's designated carriers.
   - On the designated CPᵈ carrier pin the supplied quotient comparison U(d+1)/(U(1)×U(d))→CPᵈ to [g]↦[g e₀], including subgroup blocks, basepoint, principal local sections and agreement with K7.1's complex orientation. On GC's designated HPᵈ carrier pin its Sp(d+1)/(Sp(1)×Sp(d)) comparison to [g]↦[g e₀]_ℍ. Its native Projectivization uses right lines through ℍᵐᵒᵖ, with v∼vλ; compare the supplied charts on v_i≠0 with right ratios v_j v_i⁻¹ and representative with i-coordinate1, and verify right-scaling invariance. These are comparisons on the supplied carriers and smooth structures.
   - Transport the supplied unit-round Hopf metrics. Prove Hermitian compatibility of the CP metric with its designated complex structure, and the orientation/metric/quotient-chart comparisons. For d≥1 the primitive unit-speed period is π; d=0 is a point. For d≥2 the sectional curvature bounds1 and4 are both attained; CP¹ and HP¹ have curvature4 and radius1/2. Prove projective lines totally geodesic with this metric scale. Layer5 constructs the energy/index/perfectness/generator applications with that scale, or explicitly transports a different one.
   - Construct the three pointwise orthonormal quaternionic vector fields on S^(4k−1).
   - After K7.2 and its SBC B6.2–B6.3 inputs, construct the separate CP form comparison. For the earlier Hermitian metric g and complex structure J put ω_g(X,Y)=g(JX,Y). Prove closedness and ω_g=π·ω_FS for the unit-round Hopf normalization above, with ∫_(CP¹)ω_FS=1. For d≥1 calculate the scale from the oriented radius1/2 complex line, whose area is π; for d=0 both forms vanish. Prove compatibility with the same quotient/charts. Under a positive metric rescaling prove the corresponding positive form scale. This later comparison is not a premise of the earlier metric, totally-geodesic, index, perfectness or generator applications.
8. **Degrees of explicit maps.** Construct and orient the actual Stiefel-domain map T¹S^(n−1)×S¹→S^(n−1)×S^(n−1) of Proposition6.17 using item7's frame/sphere-bundle comparison, and count its regular preimages with the stated product orientations. Separately, for fixed p∈Sⁿ, identify T¹_pSⁿ≅S^(n−1) and construct the rotation family S^(n−1)×S¹→Sⁿ of the second proof of Proposition6.34. Compute its degree2 for odd n by regular preimages and local signs. This fixed-p construction has no Stiefel-quotient, unstable Bott or Pontryagin–Thom premise. Keep the actual Diff-family/evaluation and covered-by-diffeomorphisms comparisons for Layer11.
9. Source: Hatcher, *Algebraic Topology*, §§2.A, 4.1, 4.J; McCleary, *A User's Guide to Spectral
   Sequences*, Chapter 2; Serre, *Groupes d'homotopie et classes de groupes abéliens*; Palais,
   *Local triviality of the restriction map for embeddings*; Milnor--Stasheff, Chapter 5.

## Layer 2: path spaces, mapping spaces, and their fibrations

1. Moore paths `P_{A→B} X` from `A` to `B`, with length and the compact-open topology on the
   stopped path.
   - Concatenation is continuous and strictly associative with strict units, so `ΩX` is a
     topological monoid.
   - The free loop space `𝓛X` and its component `𝓛₀X` of contractible loops.
   - Constant loops `X ↪ 𝓛₀X`.
2. Consume GeneralizedCohomology G2.10's `IsHurewiczFibration`, its
   explicit continuous homotopy lifts for every parameter space, and its
   comparison with the native Serre carrier consumed in Layer 1 item 2. Define transitive
   lifting functions `E ×_B P B → P E` as additional continuous data
   preserving concatenation, and construct these data for the replacement below.
   Require Φ(e,γ) to start at e, have γ's Moore length, project to γ,
   and satisfy `Φ(e,length-zero path at p(e))=length-zero path at e` and
   `Φ(e,γ*λ)=Φ(e,γ)*Φ(end Φ(e,γ),λ)`.
   A homotopy lifting property alone does not supply a transitive lifting function.
   - **Moore-path replacement** (BDHO §7.1, after Dold--Kamps, Proposition 5.5). For any map
     `p : E → B`, put `E' = {(e, γ) | γ a Moore path in B starting at p(e)}` and
     `p'(e, γ) = γ(end)`. Then `p'` is a Hurewicz fibration with the transitive lifting function
     given by concatenation, and its fibre `F'` over the basepoint carries the strict right action
     `(e, γ) · λ = (e, γ · λ)` of `ΩB`. When `p` is a Hurewicz fibration, the inclusion
     `E → E'`, sending e to (e, the length-zero path at p(e)), is a fibre homotopy equivalence over `B`, and `F → F'` is a
     homotopy equivalence.
     Prove the fixed-interval/Moore continuity adapters explicitly. For the
     replacement prove the all-parameter lifting property directly by
     appending the initial segment of the base homotopy at time t, of Moore
     length t; at t=0 this is the strict length-zero unit. For a general
     Hurewicz p and a Moore path γ of length r, use its continuously normalized
     interval path `s↦γ(rs)` and G2.10's interval lift Λ, including r=0.
     The return map sends `(e,γ)` to `Λ(e,s↦γ(rs))(1)`. Its composite with
     the constant-path inclusion is homotopic to the identity through
     `t↦Λ(e,const)(t)`. The opposite composite is homotopic to the identity
     through the lifted point at time t paired with γ's remaining segment
     of length `r(1−t)` starting at rt. Prove these maps and homotopies
     continuous in all parameters and over B. An arbitrary Λ need not fix
     constant paths, so this argument does not assert a strict length-r
     regular lift by rescaling Λ's output at r=0.
   - When `p` itself has a transitive lifting function `Φ`, transport `F' → F`,
     `(e, γ) ↦ Φ(e, γ)(end)`, is strictly `ΩB`-equivariant and a homotopy equivalence.
   - The endpoint evaluation `P_{A→X} X → X` is a Hurewicz fibration. So is evaluation
     `C(K, X) → C(L, X)` along a closed cofibration `L ⊆ K` of compact Hausdorff spaces.
   - Applying `Ω` or `Ω²` to a Hurewicz fibration gives a Hurewicz fibration.
   - A locally trivial bundle over a paracompact Hausdorff base, or with an
     explicit numerable trivializing cover, is a Hurewicz fibration.
3. The canonical homeomorphisms, stated for the **fixed-interval** path and loop models
   (`P^{[0,1]}`, `Ω^{[0,1]}`), never for the Moore carriers:
   Identify every fixed-start interval path carrier P^[0,1] with
   G2.10's `MappingPathSpace (const b)`. Consume its general endpoint-fibre
   homeomorphism `mappingPathFiberConstHomeomorphPath b k` with native
   `Path b k` and its forward/inverse evaluation laws. At k=b its
   `mappingPathFiberConstHomeomorphLoopSpace` specialization has target
   native `LoopSpace X b`. For arbitrary start and endpoint subsets
   A,B⊆X, identify the free-start carrier P^[0,1]_(A→B)X with
   G2.10's `MappingPathSpace (Subtype.val : A→X)` restricted over B,
   with its inherited topology and endpoint maps.
   This item owns the homeomorphism from
   that native loop carrier to `Map_*(S¹,X)` through I/∂I and AT4.4's
   based circle model, as well as the iterated sphere-model comparisons
   below. Prove continuity and inverse laws with the declared compact-open
   topologies. The displayed sphere/interval identifications are on the raw compact-open
   carriers. Compose with the preceding counit/compact-test adapters for convenient spaces;
   claim a homeomorphism there only in the proved compactly generated lane. The two notations
   designate these compared carriers, not an additional loop construction.
   - `P^{[0,1]}_{⋆→Q} 𝓛₀Q ≅ Map_*(S², Q)`;
   - `P^{[0,1]}_{Q→Q} 𝓛₀Q ≅ Map(S², Q)`;
   - `Map_*(S^k, X) ≅ (Ω^{[0,1]})^k X`.

   Each is then composed with the Moore comparison of the standing conventions, which is a
   homotopy equivalence compatible with the endpoint maps, the constant sections and the actions.
   The Moore carrier is kept for strict concatenation.

   Also:
   - `π_j(Ω^k X) ≅ π_{j+k}(X)`, by iterating `pathLoopSpaceMulEquiv`;
   - the adjunction `Ω²X → Map(S¹, ΩX)` and the induced degree-raising map
     `β_* : H_*(Ω²X) → H_{*+1}(ΩX)`;
   - the section of `Map_*(S², Q) → Map(S², Q) → Q` by constant spheres;
   - the homeomorphism `G × Map_*(S², G) ≅ Map(S², G)` for a topological group `G`, and through it
     the homotopy equivalence with `G × Ω²G` for the Moore model.
4. Source: the source paper §§5.2, 6.3, 6.4; Whitehead, *Elements of Homotopy Theory*,
   Chapter I.

## Layer 3: DG local systems

1. The augmented DG algebra `C_*(Ω_b B)` (Moore loops at `b`, cubical chains, cross product), and
   its functoriality along based maps.
   - **Connected case first.** For a pointed path-connected space `(B, b)`, a **DG local system**
     is a right DG module over `C_*(Ω_b B)`, in the DG roadmap's sense through the grading bridge
     (the source's Definition 1.8). Pullback along a based map `f` is restriction of scalars along
     `C_*(Ωf)`.
   - **Basepoint change.** For `b, b'` in one component, Moore paths from `b` to `b'` form a
     `(C_*(Ω_b B), C_*(Ω_{b'} B))`-bimodule `C_*(P_{b→b'} B)`: loops at `b` act on the left by
     concatenation in front, loops at `b'` on the right. Basepoint change is the **derived** tensor
     product of the DG roadmap's Layer 5, `𝓕 ↦ 𝓕 ⊗^𝐋_{C_*(Ω_b B)} C_*(P_{b→b'} B)`, to right
     modules over `C_*(Ω_{b'} B)`. Concatenation `P_{b→b'} × P_{b'→b} → Ω_b B` and its reverse
     give the quasi-isomorphisms showing that `C_*(P_{b'→b} B)` induces the inverse, so it is an
     equivalence of derived categories. The composite of two changes is the change along the
     composite, through a specified quasi-isomorphism. (Conjugation by a Moore path is not a strict
     monoid map, so it is not used.)
   - **Disconnected spaces.** A space with chosen basepoints `b_c`, one per path component `c`,
     carries the DG local systems given by families `(𝓕_c)` of modules over `C_*(Ω_{b_c} B)`.
     Twisted complexes are direct sums over components. Pullback along `f : B' → B` sends the
     component `c'` to `f(c')`, restricts scalars at `f(b_{c'})`, and changes basepoint to
     `b_{f(c')}`. Independence of the chosen basepoints is a theorem, through basepoint change.
     Layers 5 and 7--9 use this for `𝓛Q`, whose components are the free homotopy classes; for
     `Q = S¹` they are indexed by winding number (acceptance criterion 7).
2. **The DG local system of a map** `p : E → B` (on a path-connected base; on each component
   otherwise) is `C_*(F')`, for the strict action on the fibre of the Moore-path replacement
   (Layer 2 item 2). The inclusion `F → F'` of the fibre is a weak equivalence when `p` is a Serre
   fibration and a homotopy equivalence when `p` is a Hurewicz fibration. It needs no choice of
   lifting function.
   - When a transitive lifting function `Φ` is given, transport `F' → F` induces a **strict**
     quasi-isomorphism of DG modules `C_*(F') → C_*(F)_Φ`.
   - So two transitive lifting functions `Φ₀, Φ₁` are compared by the specified zigzag of strict
     quasi-isomorphisms `C_*(F)_{Φ₀} ← C_*(F') → C_*(F)_{Φ₁}`, an isomorphism in the derived
     category of the DG roadmap's Layer 5. A homotopy between lifting functions is not used.
3. Classical local systems are DG local systems concentrated in degree zero. They correspond,
   naturally, to Tau Ceti's `LocalCoefficientSystem`, through `H₀(ΩB) ≅ ℤ[π₁(B)]`.
4. **Twisting by a rank-one local system `L`.** The DG algebra map `Φ^L` (the source's
   Lemma 2.1), the twisted cocycle `m^L_{x,y}`, and the isomorphism of twisted complexes
   `𝓕 ⊗ L`-coefficients with `m^L`-twisted `𝓕`-coefficients (Proposition 2.2). Also
   `H_q(𝓕 ⊗ L) ≅ H_q(𝓕) ⊗ L`.
5. Source: BDHO Chapters 2 and 7; the source paper §§1.4 and 2.3.

## Layer 4: twisting cocycles and the twisted complex

This layer is pure algebra over a DG algebra `R`. It consumes the DG roadmap's Layers 1, 4 and 5.

1. **Twisting cocycles** (the source's Definition 1.9). A twisting cocycle on a finite set `P`
   graded by `ind : P → ℤ` is a family `m_{x,y} ∈ R_{ind x − ind y − 1}` satisfying
   `∂m_{x,y} = Σ_z (−1)^{ind x − ind z} m_{x,z} m_{z,y}`, and the **one-sidedness condition**
   `m_{x,y} = 0` whenever `ind x ≤ ind y`.
   - One-sidedness does not follow from the degree and the twisting equation over an arbitrary DG
     algebra: over `ℚ[ε]/(ε²)` with `|ε| = −1`, one generator and `m_{x,x} = ε` satisfy both. It is
     automatic when `R` is homologically nonnegative, since then `R_{ind x − ind y − 1} = 0` for
     `ind x ≤ ind y`. Every `C_*(ΩB)` is, so for all geometric cocycles here the condition is a
     lemma, not an extra hypothesis.
   - `D² = 0` below needs only finiteness of `P`. The index filtration and its spectral sequence
     (item 4) use one-sidedness.
   - **Variance.** The matrix `m` is a one-sided twisted complex of shifted free rank-one **left**
     `R`-modules: `K_m = ⊕_x R·x`, with `x` in homological degree `ind x` and
     `d(x) = Σ_y m_{x,y} y`, coefficients on the left. With the Koszul rule
     `d(r·w) = ∂r·w + (−1)^{|r|} r·dw`, `d² = 0` is exactly the twisting equation. Through the DG
     roadmap's Layer 1 opposite-algebra bridge (`a ·_op b = (−1)^{|a||b|} b·a`), `K_m` is a twisted
     complex of shifted free right `R^op`-modules, with the transposed matrix and the shift signs of
     its Layer 5. This comparison, including matrix indices and Koszul signs, is proved once.
     Reading the same entries as a right-free differential `d(e_x) = Σ_y e_y m_{x,y}` reverses the
     order of multiplication and is not a complex in general (acceptance criterion 2).
2. For a DG local system `𝓕` (a right module), the twisted complex is the tensor product
   `𝓕 ⊗⟨P⟩ := 𝓕 ⊗_R K_m` of the DG roadmap's Layer 1, with
   `D(α ⊗ x) = ∂α ⊗ x + (−1)^{|α|} Σ_y α·m_{x,y} ⊗ y`, and `D² = 0`. Its total degree is
   `|α| + ind x`, and `D` lowers it by one (raises it by one cohomologically).
3. **Continuation cocycles** (Definition 1.10) and the chain maps they induce. **Parametrized
   cocycles** (Definition 1.11) and the chain homotopy `Ψ¹ − Ψ⁰ = D⁻h + hD⁺`. Composition of
   continuation cocycles. Homologous twisting cocycles give chain homotopy equivalent twisted
   complexes, through a specified equivalence.
4. **The index filtration** `F_p = ⊕_{ind x ≤ p} 𝓕 ⊗ ⟨x⟩` (the source's Definition 3.38) and its
   spectral sequence, from Layer 1 item 3.
   - The `E²` page is the homology of the classical complex with local coefficients `H_q(𝓕)`.
   - Continuation maps induce morphisms of spectral sequences.
5. **Arbitrary-CW Brown resolution before derived coefficients.** Let A be a commutative coefficient ring and B a pointed connected CW complex with an arbitrary small cell set. Put R=C_*(Ω_b B;A) on the designated normalized cubical Moore-loop carrier, with its augmentation ε:R→A; retain π₁(B), all components of Ω_b B and their action, rather than assuming B simply connected. Construct the following objects before Layer5's fibration-chain or derived-coefficient comparisons.
   - Extend items1–4 from finite P to an arbitrary small graded basis using the direct sum K_m=`⊕_{x∈P} R[ind x]` (degreewise Finsupp with the shift signs), not the unrestricted product P→R. Specify each row m_x as a finitely supported family of coefficients, its degree and MC identity. The differential of a finite-support vector is a finite sum of finite-support rows; prove D²=0 on generators and extend by the DG Leibniz rule. State exactly the extra one-sided/well-founded attaching filtration used for a semi-free model; row finiteness alone constructs a complex, not a resolution. Recover the finite prototype by the actual finite direct-sum/function equivalence, with all tensor and opposite-algebra signs. Carry arbitrary scalar/module/basis universes through upward transport.
   - Construct a cell-filtered augmented semi-free left R-module P_B and a compatible R-linear chain comparison to C_*(P_b B;A), where P_b B is the space of paths starting at b and Ω_b B acts by concatenation in front. For a characteristic disk χ:Dⁿ→B choose a path to its centre and follow the radial paths χ(tv) to construct a continuous family τ_v from b to χ(v). Concatenation (γ,v)↦γ⋆τ_v identifies its pulled-back path fibration with Ω_b B×Dⁿ up to actual left-loop-equivariant homotopy; the inverse appends τ_v reversed, and the cancellation homotopies use the earlier Moore-path constructions. With relative disk/prism chains, EZ and excision, construct the resulting R-linear relative-cell quasi-isomorphism with R[n]. If P_prev→C_prev is the previously constructed quasi-isomorphism, the connecting class of that relative generator has a finite cycle representative a∈P_prev. Choose a correcting target chain c with ∂c=f(a), attach the free R-generator e in degree n by de=a and map e↦c. Prove d²e=0 and the relative comparison, and record the finite coefficients of a as the Brown row m_x. Carry out this induction with actual attaching and basepoint-change homotopies. An arbitrary choice of a matrix satisfying MC is not this constructor.
   - Build the comparison first on finite subcomplexes and relative cell attachments, with compatible maps/homotopies under inclusions; prove independence of the paths, characteristic data and representatives. Extend to arbitrary cell sets by the actual filtered-colimit/direct-sum comparison. Each chain and differential row has finite support; no completion or product over all cells is introduced. Since R is homologically nonnegative and cell degrees are nonnegative, the base-skeleton filtration in each total degree has the bounded range needed for the relative-cell comparison. Keep the separate arbitrary-cell-set colimit proof, not an unstated finite-type assumption.
   - Prove P_B→C_*(P_b B;A) is a quasi-isomorphism from that relative-cell construction. Contract P_b B to its constant path by rescaling/truncating Moore paths, construct the induced chain homotopy, and conclude that its augmentation and P_B→A are quasi-isomorphisms. This contraction need not be R-linear; the augmentation and comparison maps must be R-linear for the trivial action on A. Establish the semi-free/K-flat lifting and tensor-invariance property with the actual DG derived-module supplier. If using a bar replacement, construct its split normalized free resolution and its augmentation contraction, then the actual topological/cellular comparison; do not infer a topological Brown theorem from a bar/cobar name or impose simply-connected cobar hypotheses on arbitrary π₁.
   - Define the Brown twisting object by this constructor and prove its singular/cellular and basepoint-change comparisons. Then, for every right DG R-module 𝓕, prove 𝓕⊗_R P_B represents 𝓕⊗^L_R A and hence the stated Tor groups, with natural maps and the actual comparison to the designated twisted complex. For disconnected CW spaces use the chosen basepoint in each path component, the corresponding loop DG algebras and the direct sum of the component constructions. Preserve all general coefficient modules, infinite cell sets and relative versions; finite P remains only the earlier illustrative special case.
   Calibrate B=S¹ with the nontrivial loop-minus-unit boundary and the actual π₁ action. Reject the zero-cocycle two-generator complex as a proposed resolution when its augmentation has unwanted positive homology. Filtered comparisons needed in5.7 are constructed there with a specified base filtration; an unfiltered derived equivalence alone grants none.
6. Source: the source paper §1.4; BDHO Chapters 3--4.

## Layer 5: Morse homology with DG coefficients

This layer consumes Lane M of the Heegaard Floer roadmap for moduli spaces, compactness, gluing and
corner structures.

1. **Representing chain systems.** Fundamental chains rel boundary (Layer 0, item 4) of the
   compactified trajectory spaces of every dimension, coherent with the boundary product
   decomposition. They exist, and any two are homologous through a specified family. This holds
   over `𝔽₂`, and over `ℤ` with the orientation conventions.
2. **The Barraud--Cornea cocycle.**
   - Choose an embedded tree joining the critical points to the basepoint, and a homotopy inverse
     of the collapse map.
   - Evaluate the representing chains into Moore paths, then into `C_*(ΩB)`. The result is a
     twisting cocycle (Layer 4).
   - Its twisted homology is independent of all choices up to specified continuation isomorphisms.
3. **DG Morse homology** H_*(B;𝓕) on closed manifolds and the absolute/relative complexes for compact manifolds with boundary. Direct maps f_* retain their specified coefficient morphism. For f:X^m→Y^n and a DG local system 𝓕 on Y, construct the integral Umkehr
   `f_!:H_k(Y;𝓕)→H_(k+m−n)(X;f*𝓕⊗or_X⊗f*or_Y)`,
   with all orientation local systems concentrated in degree zero. Use AT's actual orientation-system transport and canonical square normalization. Construct the DG-coefficient Poincare–Lefschetz/cap comparison, its cochain pullback and the resulting f_!, rather than applying ordinary local-coefficient duality to a DG system without an adapter. Build this from the finite Morse/skeletal filtration and the actual chain-level diagonal/cap comparison; its graded-classical comparison and bounded base filtration give the homology equivalence. These constructions use the earlier chain/filtered and AT interfaces, not the later fibration conclusion. Chosen orientations trivialize the two factors and recover f_!:H_k(Y;𝓕)→H_(k+m−n)(X;f*𝓕); over 𝔽₂ the factors canonically disappear. Prove identity/composition, coefficient/basepoint/continuation naturality and the actual degree/sign diagrams. For maps of manifold pairs construct the absolute and relative Poincare–Lefschetz versions with their boundary/collar hypotheses, maps and boundary naturality. All nonorientable targets remain in scope with the displayed twists.
4. **Fibration theorem.** For a Hurewicz fibration `F → E → B` over a closed connected manifold,
   with the DG local system `C_*(F')` of Layer 3 item 2:
   - first for fibrations with a transitive lifting function (BDHO Theorem 7.2), then for all
     Hurewicz fibrations by transport along the Moore-path replacement `E → E'`, which is a fibre
     homotopy equivalence and has a transitive lifting function;
   - `H_*(B; C_*(F')) ≅ H_*(E') ≅ H_*(E)`;
   - the index spectral sequence is isomorphic, from `E²` on, to the cubical Serre spectral
     sequence of Layer 0 item 3 (and so, by its comparison, to the one of Layer 1 item 2);
   - direct maps correspond to maps of total spaces. For pullbacks along f:X^m→B^n between the declared manifold bases, construct the base-induced fibration Umkehr comparison with degree m−n and the pulled-back degree-zero or_X⊗f*or_B factors from item3. A total space or fibre need not itself be a manifold; the map is constructed through the base Morse/fibration-chain model, with its absolute/relative and coefficient diagrams.
5. **Classes living over the fundamental class.** Construct the source's Definition2.3 and chain characterization Proposition2.5 with the actual coefficient and orientation data. For an oriented closed connected B^n (or over 𝔽₂), recover its ordinary top class and E^∞_(n,*) characterization (Proposition2.6). For arbitrary B use [B]_or∈H_n(B;or_B), the corresponding twisted top column and the pulled-back orientation system on E; do not assert an untwisted integral fundamental class on a nonorientable base.
   - For the inclusion i:{b}→B, its shriek map has degree−n. With untwisted total-space coefficients it takes values in H_(*−n)(F_b)⊗(or_B)_b; a chosen local orientation identifies the last line with the ground ring. With π*or_B coefficients on E its two point-orientation factors contract canonically, giving H_*(E;π*or_B)→H_(*−n)(F_b). Construct a compatible Morse/CW model with one top n-cell containing b, using the supplied Morse/handle comparison, and denote its actual lower skeleton by B_(n−1). Construct the relative skeletal quotient and orientation-twisted Thom/cell comparison underlying Lemma2.9 for this chosen model; an arbitrary skeleton with several top cells is not identified with a single fibre. Under the oriented or mod2 trivialization this is H_*(E)→H_*(E,E|_(B_(n−1)))≃H_(*−n)(F_b).
   - Prove shriek naturality for maps of fibrations (Proposition2.12/Lemma2.14), and the source's Corollary2.13 criterion σ_*[F]≠0⇒σ_*[E] lives over the fundamental class, using actual oriented classes or their stated orientation-twisted replacements and the corresponding coefficient morphisms. No untwisted integral nonorientable version is inferred.
6. **Free loop space.** DG Morse homology of `𝓛₀Q` and `𝓛Q` for a closed manifold `Q`, through
   the finite-dimensional approximations by broken geodesics and the colimit over them.
   - Consume Riem R3's finite-vertex short-segment path construction. For closed Q construct the cyclic vertex carrier, its seam charts and energy, its comparison/deformation to the free-loop energy sublevel, and subdivision maps. The based and cyclic versions share the designated short-segment maps and topology; prove the cyclic comparison rather than identify a based-path theorem with a free-loop theorem.
   - A closed broken geodesic with `r` breaks is determined by its vertices, an `r`-tuple of
     points of Q for R3's same chosen smooth metric. Choose ρ>0 below its uniform normal-radius and strong-convexity bounds on compact Q, supplied by SBC B6.0 for that metric. Exponential coordinates are injective there, and the required short segment is the unique smoothly varying minimizing segment. Consecutive distances are below ρ; the carrier above cuts these tuples by an energy bound. These compact-set bounds precede the later global injectivity-radius function. The Viterbo proof (Layer9 item3) uses the same tuples with
     Abouzaid's cut, `𝓛ʳQ = {q ∈ Qʳ | d(q_i, q_{i−1}) ≤ δᵢʳ}`, a compact manifold with corners for
     generic `δᵢʳ ∈ (δ/2, δ)` and `0<δ<ρ`, with the embeddings `ιʳ : 𝓛ʳQ → 𝓛ʳ⁺¹Q` that repeat `q_0` and the
     maps `geoʳ : 𝓛ʳQ → 𝓛Q` sending a tuple to the broken geodesic through it, parametrized at unit
     speed as a Moore loop. Both systems have the colimit property of BDHO §13 for `𝓛Q`, by the
     weak equivalence of Layer 9 item 3, so the DG Morse homology of `𝓛Q` is the same through
     either; the cut is a choice of cutoff, not a third model.
7. **Based-loop Morse–Bott energy on CPᵈ, HPᵈ and the Cayley plane.** Use the actual Riem R1 metrics, R2 Jacobi ODE/endpoint data and R3 index form/finite-node comparison, and MorseTheory M5's compact-band normal attachment theorem. On the finite approximations to Ω_p construct the critical manifolds of constant and iterated geodesics, calculate their negative bundles, indices and nullities on that same metric, and identify their Thom orientation systems and attachment maps. HS4B's Bott-chain computations are comparisons on their stated examples, not the generic owner of these constructions.

   For d≥1 prove the integral perfectness and calibrate the explicit generators H_(2d)(ΩCPᵈ)=ℤ and H_(4d+2)(ΩHPᵈ)=ℤ. In the CP calculation the cells have degrees a_k=2d(k−1)+1 and b_k=2dk, k≥1, with the constant cell in degree0. Since a_(k+1)−b_k=1 for every d≥1, zero boundary is proved by the following homology/attachment comparison, not a lacunarity inference.

   Construct j:S¹→ΩCPᵈ adjoint to the normalized projective-line generator, and the based Hopf product j⋆Ωq:S¹×ΩS^(2d+1)→ΩCPᵈ. The Hopf fibration LES proves its π₁ and higher homotopy isomorphisms. Use Layer1.2's early weak-equivalence homology comparison, integral Künneth and the supplied odd-sphere based-loop calculation to obtain ℤ in degrees2dk and2dk+1 and zero elsewhere. For CP¹ consume Riem R3's actual ΩS² calculation at radius1/2 with the explicit time/metric normalization. Construct the oriented Morse–Bott Thom/CW model with one ℤ cell in the displayed degrees; prove orientability of the negative bundles and identify these cells on the finite approximations. Finite-type energy-filtration convergence and the final homology ranks force each integer cellular boundary to vanish. Construct the actual generator representatives/completing cycles and their energy and Thom-cell comparison. This proves perfectness and the generator assertions on the chosen based carrier.

   For HPᵈ the analogous cell degrees have within-level gap3 and successive-level gap4d−1; prove the actual negative-bundle/Thom model before using these gaps to infer vanishing boundaries and identify its calibrated generator. The case d=0 is the constant point space. The free-loop extension in item6 is a separate construction; the based Hopf calculation alone does not give it.

   **The Cayley plane `𝕆P²`.** No roadmap owns the octonions, the Albert algebra or `F₄`, so build
   the bounded carrier here. Construct the octonions by Cayley--Dickson doubling of `ℍ`, prove the
   norm is multiplicative and that the algebra is alternative, and form the real vector space `J`
   of Hermitian `3×3` octonionic matrices with `x∘y=(xy+yx)/2` and the trace form. Define
   `𝕆P²={x∈J : x∘x=x, tr x=1}`, the rank-one idempotents. Prove it is a closed smooth
   `16`-manifold, homogeneous under the automorphism group `F₄` of `J` with stabilizer `Spin(9)`,
   and give it the `F₄`-invariant metric of diameter `π/2` and maximal sectional curvature `4`
   (the same normalization as `ℍPᵈ`). Prove the rank-one facts used below: for `p∈𝕆P²` and a unit
   `u∈T_p𝕆P²` there is a unique totally geodesic octonionic line `L_(p,u)≅S⁸` through `p` tangent
   to `u`; the geodesics from `p` are the great circles of these lines, all closed of length `π`
   (the cut locus of `p` is a line). On `Ω_p𝕆P²` the critical set of the energy is the constant
   loop and, for every `k≥1`, the manifold `C_k≅T¹_p𝕆P²≅S¹⁵` of `k`-fold great circles. Compute on
   this same metric, by R2/R3 as for `ℍPᵈ`, the index `ind C_k=7k+15(k−1)=22k−15` of `C_k`
   (conjugate points of multiplicity `7` at `π/2+jπ` and `15` at `jπ`), so `ind C_1=7`, with
   nullity `15`; identify the negative-bundle orientation systems and the attachment maps of the
   oriented Morse–Bott Thom/CW model, and prove perfectness by the completing-manifold argument of
   Ziller (a completing manifold for each `C_k`, exhibited and not asserted). Conclude
   `H_*(Ω𝕆P²;ℤ)` is `ℤ` in degrees `22k` and `22k+7`, `k≥0`, and zero elsewhere, matching
   `Ω𝕆P²≃S⁷×ΩS²³`, with the generator of `H₂₂` represented by the fundamental class of `C_1` with
   its index-`7` cell. Test: `H_7=ℤ`, `H_14=0`, `H_22=ℤ`. For the sphere-family application of
   Proposition 6.39, take `Σ_p={(u,v)∈S¹⁵×S⁶ : v⊥u, v∈T_pL_(p,u)}`, the map `σ_p:Σ_p→Ω²_p𝕆P²` onto
   the unit round `2`-spheres of the lines, and `φ:Σ_p×S¹→Σ′_p`; prove `φ` has fibrewise degree
   `±2` as in the sphere case, so `β_*(σ_p)_*[Σ_p]=±2g` in `H₂₂(Ω𝕆P²)`, `g` the generator, and
   `(σ_p)_*[Σ_p]≠0`. The free-loop extension of item 6 is a separate construction, as for the
   other projective spaces.

   **Fibre representatives and the distinct path-loop total-space comparison.** For B=CPᵈ or HPᵈ construct a chain comparison from the oriented Morse–Bott energy/Thom model E_B to C_*(Ω_p B;ℤ), carrying the chosen completing cycles and calibrated generators to designated singular/cubical representatives. Prove it by the actual finite-energy attachment maps, compact-band comparison and filtered colimit; retain its energy-filtration statement only on this fibre model. It computes H_*(Ω_p B), not H_*(P_p B). Its perfectness and generator proof above remains independent of the following comparison.

   Use Layer4.5's genuine augmented semi-free P_B and item4's fibration-chain theorem for Ω_p B→P_p B→B. Here the total complex C_*(Ω_p B)`⊗_{C_*(Ω_p B)}`P_B is compared with C_*(P_p B), with base-cell filtration. If replacing the fibre chains by E_B, construct the compatible homotopy-coherent loop action and its DG-module rectification first, with actual integral split/free chain data and the DG supplier's bar/module comparisons. Justify the chosen chain contractions from the free integral fibre homology and the calibrated chain comparison, keep the higher module coherence, and prove the required degreewise finiteness of the bar/perturbation formulas before base change. Construct the coefficient maps, relative attaching comparisons and filtration-preserving homotopies that compare the resulting two total-space models. Their total-space spectral sequences agree from the proved page onward and abut to H_*(P_p B), which is trivial in positive degrees. Do not identify that sequence or its abutment with the energy-filtered fibre sequence. A plain derived-module equivalence, without these action and filtered maps, is insufficient. Name the actual page comparison and the edge/fibre inclusion squares used on representatives.

   On the designated projective carriers, normalize the base cell/cup/Thom classes using GC G4.0/G4.3–5 and AT. Calculate the primary d₂ for CPᵈ and d₄ for HPᵈ and construct the subsequent mixed-bidegree relative-boundary maps: d_(2d):E_(2d,1)→E_(0,2d) for CPᵈ and d_(4d):E_(4d,3)→E_(0,4d+2) for HPᵈ. Identify the surviving source/target representatives, their unit integer coefficient and sign by the actual total-space/fibre comparison and chosen orientations. For d=1 these maps occur on the same page as the primary differential and must be computed together, not assumed to survive an earlier distinct page. For d=0 retain the separate point case. Ordinary base-to-fibre transgression from a nonexistent H_(2d+1)(CPᵈ) or H_(4d+3)(HPᵈ) is not the higher-generator construction.

   For Propositions6.38/6.39 construct the actual map from the geometric sphere family to the completing manifold, its fibrewise degree±2 and its compatibility with β under sphere-loop adjunction. With g the calibrated generator, prove β_*(σ_p)_*[Σ_p]=±2g in degree2d for CPᵈ and4d+2 for HPᵈ, fixing the sign by the stated orientations; do not relabel this nonprimitive class as g. Keep the projective-line geometric construction, the independent based Hopf/perfectness proof, and the separate free-loop application with its own hypotheses. Equality of abstract copies of ℤ does not supply any of these representative, action or filtration maps.
8. Source: BDHO Chapters 5--13; the source paper §§2.1--2.4 and 4.3--4.4; Bott, *The stable
   homotopy of the classical groups*, §§1--3; Ziller, *The free loop space of globally symmetric
   spaces*.

## Layer 6: Hamiltonian dynamics, Liouville domains, and capacities

This layer consumes symplectic manifolds and almost complex structures from Lane F2.1 of the
Heegaard Floer roadmap, and Hamiltonian vector fields, the Poisson bracket and symplectomorphisms
from Layers 1--2 of the Hamiltonian systems roadmap. It adds the time-dependent and
dynamical material that roadmap leaves out: periodic orbits, action functionals, Liouville
domains, capacities, and almost existence.

1. Time-dependent Hamiltonian flows, built on the Hamiltonian vector fields of the Hamiltonian
   systems roadmap; 1-periodic orbits and nondegeneracy. Symplectically aspherical and atoroidal manifolds. The action functional on
   `𝓛₀X` (aspherical) and on `𝓛X` (atoroidal).
2. Liouville domains, their completions, Hamiltonians linear at infinity, and exact codimension-zero
   embeddings.
3. **Cotangent bundles.**
   - The cotangent bundle `T*Q` of a smooth manifold, with the tautological form `λ_can = p dq` as
     a smooth 1-form of the differential geometry roadmap, and `ω_can = −mextDeriv λ_can`. On the
     model space these are Tau Ceti's `cotangentLiouvilleForm` and `cotangentSymplecticForm`, by
     the latter's `cotangentSymplecticForm_apply`.
   - The unit disc and sphere bundles `D*Q` and `S*Q` of a Riemannian metric. `(D*Q, −λ_can)` is a
     Liouville domain, with Liouville field `p ∂_p` (standing conventions, sign dictionary).
   - Exact magnetic forms. The source's magnetic form `ω_src + π^*dσ` is carried by `ν` to
     `ω_can + π^*dσ`, since `π ∘ ν = π`. The fibre translation `Ψ'_σ(q, p) = (q, p − σ_q)` by a
     1-form `σ` satisfies `Ψ'^*_σ λ_can = λ_can − π^*σ`, hence is a symplectomorphism
     `(T*Q, ω_can + π^*dσ) ≅ (T*Q, ω_can)`; it is `ν ∘ Ψ_σ ∘ ν⁻¹` for the source's
     `Ψ_σ(q, p) = (q, p + σ_q)`. It proves Corollary D once Theorems A--C land.
4. **Hypersurfaces.**
   - Characteristic foliations of regular hypersurfaces. Closed characteristics correspond to
     periodic orbits of any defining Hamiltonian, up to reparametrization.
   - Liouville vector fields. For a fixed primitive `λ`, `ι_Z ω = λ` implies `L_Z ω = ω` by
     Cartan's formula. The converse fails for a fixed `λ`: with `λ = p dq`, `ω = dλ` and
     `Z = p ∂_p + ∂_q`, `L_Z ω = ω` but `ι_Z ω = λ − dp`. What holds is that `L_Z ω = ω` makes
     `ι_Z ω` a primitive of `ω`, whose Liouville field is `Z`. Contact type and restricted contact
     type are defined with the primitive explicit.
   - The Liouville-flow argument that proves Corollary E from Theorems A--C, using the flows of the
     differential geometry roadmap's Layer 3.
5. **Almost existence and capacities.**
   - The contractible almost existence property (the source's Definition 1.1).
   - The relative capacity `c°_HZ(V, Z)` (Definition 5.3) and the `π₁`-sensitive Hofer--Zehnder
     capacity (Definition 6.1).
   - Proposition 6.3 (Hofer--Zehnder, Struwe): finite `c°_HZ(W)` implies contractible almost
     existence in `W`. The proof is the monotonicity argument through
     `Monotone.ae_differentiableAt`, including its relative version near a hypersurface.
6. Source: Hofer--Zehnder, *Symplectic Invariants and Hamiltonian Dynamics*, Chapters 1 and 4;
   McDuff--Salamon, *Introduction to Symplectic Topology*, Chapters 3 and 12; the source paper §1.2.

## Layer 7: classical Hamiltonian Floer homology and symplectic homology

This layer consumes Lanes F0--F2 of the Heegaard Floer roadmap. Floer cylinders have domain
`ℝ × S¹` and no boundary. Half-cylinders with boundary on the zero section use Lane F1's totally
real boundary conditions.

1. Floer cylinders, the energy identity, and [F1.4](../HeegaardFloer/README.md)'s Conley--Zehnder index
   `CZ=−μ_RS`, in the trivializations fixed by the standing conventions. The Maslov index of symplectic
   paths and loops is derived from Lane F1.4's Maslov index of Lagrangian paths through graphs
   (`Ψ ↦ graph Ψ ⊂ (ℝ²ⁿ × ℝ²ⁿ, −ω ⊕ ω)`, relative to the diagonal, after Robbin--Salamon); it is
   not a second construction. Consume F1.5's identification of the clutching-loop
   first Chern number with CharacteristicClasses' topological c₁, with the same
   trivializations and factor2 convention.
   With `ι_(X_H)ω=dH`, use the standing PDE `u_s+J_t(u_t−X_H)=0`, negative-end input and positive-end output. For its reference-cylinder action `𝒜_H=∫γ̄*ω−∫Hdt`, this PDE decreases `𝒜_H` along s. The contractible complex is defined under asphericity alone; an all-free-loop construction uses its separate atoroidality hypotheses.
   Asphericity rules out sphere bubbling in `𝓛₀X`, and atoroidality does the same in all of
   `𝓛X`.
2. Compactness, transversality for generic J and gluing for Floer cylinders, with topological manifolds-with-corners compactifications in every dimension under this standing branch's hypotheses. Layer0 consumes their oriented product-face fundamental-chain systems. The regular analytic loci additionally carry the differentiable charts, tangent-kernel identifications, evaluation/action maps and determinant comparisons used in constructing those spaces; topological corners alone do not supply that analysis.
3. **Orientations over `ℤ`.**
   - Coherent orientations through determinant lines of stabilized Cauchy--Riemann operators.
   - The gluing sign `(−1)^{dim V₂ · ind D₁}` (the source's Lemma 3.1).
   - The boundary-orientation comparison on `𝓜(x,z) × 𝓜(z,y)` (Proposition 3.3).
4. **The Floer complex.**
   - The complex itself, continuation maps and homotopies.
   - The action filtration: monotone homotopies preserve it, and general homotopies shift it by at
     most the Hofer-norm bound.
   - For closed aspherical X in the contractible sector, construct FH_*(X)≅H_(*+n)(X) by the common module-comparison construction specified in 7.C.5b on Γ=0. Its inputs are the actual independent Morse complex, raw capped/reflected cylinder and PSS carriers, conditional estimates, selected data, orientations, support and both inverse boundaries; neither module-comparison readout is an input to those constructions. Construct the reflection/cap/coefficient chain transport before reading this standing convention. The all-dimensional corner-chain package in item2 is a separate output and remains available to Layer8; this module comparison does not replace it.
5. **Symplectic homology** `SH_*(W)` of a Liouville domain, as a direct limit over slopes, with
   classical local coefficients.
   - The zero-energy and positive-energy parts and the long exact sequence between them.
   - The Viterbo transfer `ι_!` for exact codimension-zero embeddings.
6. Source: Salamon, *Lectures on Floer homology*; Audin--Damian, Chapters 6--11; Seidel, *A biased
   view of symplectic cohomology*; Abouzaid, *Symplectic cohomology and Viterbo's theorem*,
   Sections 1--4.

### 7.C. Capped classical Floer theory on closed spherical-monotone and spherical-c₁-zero targets

This branch constructs classical Hamiltonian Floer complexes, continuation and PSS comparison for a closed connected symplectic manifold `(X²ⁿ,ω)` in the contractible orbit sector. Its target hypotheses are either **positive spherical monotonicity**, `ω(A)=κ c₁(A)` for every spherical integral class, with a specified `κ>0`, or **spherical c₁-zero**, `c₁(A)=0` for every spherical integral class, with no assumption that sphere areas vanish. Its compactifications have the dimensions required by the counts, chain identities, homotopies and PSS comparisons below. Layer7 items1–5 and Layer8 retain their stated aspherical/atoroidal and Liouville hypotheses and their separate all-dimensional corner-space requirements. The monotone outputs here are ordinary/Novikov classical counts in these stated dimensions; the standing DG and symplectic-homology outputs retain their own hypotheses.

**Convention and application checks.** Verify the capped action, index and recapping laws in the conventions below; construct the two distinct signed inverse homotopies with their actual identity endpoints; prove the separate positive-monotone and spherical-c₁-zero count-dimensional compactifications; construct integer determinant-line counts after the 𝔽₂ version; prove finite-Laurent identities before completion and the stated coefficient-correct PSS equivalences. For ℂPⁿ with positive spherical monotonicity and Chern generator n+1, verify the cyclic module formula gives one copy of R in precisely the degrees i for which i+n is one of 0,2,…,2n modulo2(n+1), and zero in the other degrees. This check concerns the module grading and the PSS module equivalence. On Γ=0 verify the integer formula and the reflected standing contractible complex.

**7.C.0. Suppliers and literal convention transport.** Consume [HeegaardFloer F0 and F1.1–5](../HeegaardFloer/README.md#lane-f1-the-cauchyriemann-elliptic-package-shared-with-the-pde-roadmap) for Sobolev sections, finite-order Sard–Smale budgets, elliptic/adjoint regularity, spectral flow, the single Maslov/CZ index, relative c₁, determinant lines and signed puncture Riemann–Roch; F2.1–5 and F2.6a–d supply their stated local curve/sphere/factorization/simple marked-regularity floors. Consume AnalyticStableMaps M3 for full marked unforced genus-zero stable-map compactness over compact tame-J families. DGF constructs the rooted attachment/matching, varying frozen-structure and inhomogeneous fixed-asymptotic applications, every Morse-incidence application and the unstable two-marked constant raw-core normalization. HF's minimal-area zero/one-marked compactness keeps its extra area hypothesis. Consume [MorseNovikov N1](../MorseNovikov/README.md#n1-period-controlled-completed-group-rings-and-modules) as the generic support/completion owner; DGF proves its geometric finite-below and graded-chain adapters. Consume HamiltonianSystems Layers1–2 and Layer6 here for the actual Hamiltonian fields and time-dependent flows.

Layer 7.C uses the following capped contractible convention. It is the contractible capped theory on the two hypotheses stated in its heading; it uses `μ=−CZ_HF` on the same path, spherical cap changes, and the action `A_H=∫Hdt+∫_Dω`. Its positive-end input and negative-end output satisfy `u_s+J_t(u_t−X_H)=0` and are upward for `A_H`. The standing convention uses `CZ`, a reference-loop cylinder oriented from the orbit to the reference, and `𝒜_H=∫γ̄^*ω−∫Hdt`. On the contractible aspherical overlap with constant reference and zero reference cap, the same-H actions satisfy `𝒜_H(γ̄)=−A_C(H,γ,D)` when `γ̄` is oriented from the orbit to the reference. A standing trajectory has negative-end input `x₋`, positive-end output `x₊`, and `E=𝒜_H(γ̄₋)−𝒜_H(γ̄₊)`; for the fixed PDE `u_s+J_t(u_t−X_H)=0`, `𝒜_H` decreases along s. The t-independent equation is the negative-gradient equation for `−H` and has the same Morse degree as the source branch after reflection. Under the reflected Hamiltonian and cap reflection, `A_C(H∨,reflected x)=−A_C(H,x)`, so the two energy conventions agree. These identities use the stated zero-reference normalization; other reference choices may add constants. The convention identification is only with the standing complex on 𝓛₀X under asphericity alone, on the `Γ=0` overlap and at the reflected Hamiltonian `H∨`. Its overlap comparison uses the reflected Hamiltonian and contractible aspherical sector specified here.

Use `ι_(X_H)ω=dH`, `g_t(v,w)=ω(v,J_t w)` for compatible `J_t`,
`A_H(γ,D)=∫₀¹H_t(γ(t))dt+∫_Dω`, and
`u_s+J_t(u_t−X_H)=0`. On smooth loops prove `dA_H(ξ)=∫ω(ξ,γ̇−X_H)` and the weak-L² identity `grad A_H=−J_t(γ̇−X_H)`: these are upward gradient cylinders. For any Hˢ realization, construct this differential expression with its derivative loss into H^(s−1); the differential expression has precisely this weak-metric and derivative-loss meaning. Both asymptotic limits are part of the carrier. The homological input is the positive end `x₊`, and the output is the negative end `x₋`. Write `μ(x,D)=−CZ_HF(x,D)` on the **same** symplectic path. Consequently a small positive plane rotation has μ=1, `μ(x,const)=ind_Morse(H,x)−n`, and a cap change `D′−D=A` gives `μ(x,D′)=μ(x,D)+2c₁(A)`. Prove this identity from the actual extending-frame clutching loop, whose winding in the old frame is `−c₁(A)`.

On the actual aspherical overlap, where Γ=0, retain the path-level dictionary given by `v(s,t)=u(−s,−t)`, `H∨_t=−H_(−t)`, `J∨_t=J_(−t)` and reflected cap boundary parametrizations. The index identity is `CZ_HF(H∨,reflected cap)=−CZ_HF(H,cap)=μ_H`; the physical negative end of v is the positive-end input of u. These are the reflected equation, capped path and index identities. The chain-level comparison is a downstream submilestone of 7.C.4. After both complexes, counts, continuation maps and orientation lines exist, construct the quotient-then-negative-flow orientation reversal and the degree-dependent chain sign, if any, from the actual determinant and boundary exact sequences, then prove that the map intertwines reflected continuation. The standing comparison is on 𝓛₀X under asphericity alone. The resulting chain comparison is at H∨. The coefficient comparison is on Γ=0. μ remains a notation for the single supplied index. For the cylindrical linear model `D=∂s+B_s`, `B_s=J₀∂t+S_s`, apply F1.3 to `−B_s`: `ind D=SF(B)=−SF(−B)`. Check the scalar `B=tanh s` kernel `sech s`, cokernel0, and index1. Use the L² common-domain self-adjoint realization and the actual Lᵖ elliptic transport for `1<p<∞`; coefficient norm convergence, end invertibility and graph estimates are hypotheses of that application. The puncture formula in μ notation is `nχ(Σ)+2c₁^τ+Σ_positive μ−Σ_negative μ`. Use complex-oriented end reversal, stabilized matching exact sequences and determinant gluing; use the determinant exact sequences for kernels and cokernels. The constant-sphere adjoint comparison uses `deg K_(S²)=−2` and `c₁(TS²)=2` as different bundles.

**7.C.1. Capped loop cover, periods and the time-dependent variational equation.** Let `S_sph⊂H₂(X;ℤ)` be the image of the spherical Hurewicz map and put `Γ=S_sph/(ker ω∩ker c₁)`. Define caps equivalent when their glued difference pairs to zero with both ω and c₁. Construct the cap cover of the contractible loop component by local cap transport, prove its topology and path lifting, and identify each fibre with a Γ-torsor. Construct the forgetful, recapping, gluing, smooth/Sobolev and reference-cap comparison maps. Prove evaluation of contractible loops has a constant-loop section and that its based-loop fibre retains the π₂ term; retain the π₁(X) contribution in the evaluation sequence instead of identifying π₁(L₀X) with π₂(X). Show the period/Chern transgression factors through the stated Γ-cover. The generator sector of this construction consists of contractible loops.

Assume every contractible one-periodic orbit of H is nondegenerate. Prove the corresponding subset of the time-one fixed set compact: x↦(t↦φ_H^t(x)) is continuous into the smooth loop space, loop free-homotopy classes are locally constant by short-geodesic homotopies, and hence its contractible preimage is open and closed in the compact fixed set. End nondegeneracy makes this subset discrete, so it is finite. Choose one cap per such orbit; all breaking and cap transport remain in this contractible sector. Other standing orbit sectors retain their own stated nondegeneracy hypotheses. Construct the action, its recapping law `A_H(A·x̃)=A_H(x̃)+ω(A)`, critical-point/fixed-point bijection and index independence modulo `2c₁(S_sph)`. Put `c₁(S_sph)=N_Cℤ` with `N_C>0` when nonzero; otherwise use an integer grading, without a minimum of an empty positive set.

**7.C.1(i). Coefficient-torsor datum.** From this cap cover construct the typed datum `(Γ,ω,c₁,ν=−ω)` and its Γ-torsor of caps over each orbit, with reference-cap coordinates and diagonal monomial changes over R[Γ]. This datum is available before either branch-specific coefficient classification. Its monotone injective-Chern and spherical-c₁-zero injective-period specializations are proved separately in 7.C.6a and 7.C.6e; each concrete matrix construction consumes its own specialization.

For the actual time-dependent flow `φ_t` prove, with a torsion-free connection,
`∇_t(dφ_t v)=∇_(dφ_t v)X_(H_t)` by differentiating a two-parameter variation. Compare the actual symplectic-frame ODE, including connection and frame derivatives, with the asymptotic operator of the cylinder linearization. This is the time-dependent connection/frame application of HamiltonianSystems' variational equation.

**7.C.1a. Auxiliary Morse comparison complex.** Fix an auxiliary Morse–Smale pair (f,g) independently of Hamiltonian H. Consume [HF Lane M](../HeegaardFloer/README.md#lane-m-morse-homology-stage-0) and its explicit MorseTheory M1–M6/DG-flow prerequisites for the Morse-function, normal-form, sublevel, attachment and dynamics foundations. Consume that same Lane M1–M5 for the oriented homological Morse complex MC_j(f,g;R), its signed Morse/singular comparison and ordinary Morse continuation. Define M_i=MC_(i+n)(f,g;R), d_M=d_MC; a generator of Morse index j has degree j−n and its coefficient differential is zero. In the positive-monotone coefficient model give e^A degree 2c₁(A), so x⊗e^A has total degree j−n+2c₁(A). Build this comparison complex independently of autonomous Floer trajectories; PSS sections and equivalences use it. The small autonomous Hamiltonian construction in 7.C.5 is a later specialization: for H=εf with ε>0 sufficiently small and a realized compatible Morse–Smale metric, prove the positive-rescaling normalization and the ordinary Morse-continuation comparison between the realized metric and the auxiliary metric, using HF Lane M1–M5. DGF owns this Floer specialization and all PSS constructions. The auxiliary Morse complex precedes both PSS and the autonomous trajectory comparison; this metric-comparison target consumes ordinary Morse continuation.

**7.C.2. Cylinder and seam analysis.** Construct the Banach configuration spaces with specified capped ends, exponential decay charts, regularity bootstrap and the Floer section. Its covariant derivative is

`∇sξ+J_t∇tξ−J_t∇ξX_H+(∇ξJ_t)(u_t−X_H)`.

Prove its end comparison, Fredholm index `μ(x̃₊)−μ(x̃₋)` for cap-matched ends, and, for fixed reference caps and cylinder class `A_cyl=D₋+u−D₊`, index `μ(x̃₊)−μ(x̃₋)+2c₁(A_cyl)`. Prove the fixed-H energy formula `E=A_H(x̃₊)−A_H(x̃₋)` for matched caps, where `E=∫ω(u_s,J_tu_s)`; choose compatible J throughout this closed capped branch, so this is its actual metric energy. The tame-data application and comparison are constructed in 7.C.2c.

For nonstationary cylinders prove the FHS injective-point/separation theorem for `(s,t)↦(u(s,t),t)`, including separation from asymptotic orbits, and the localized universal perturbation/adjoint argument for generic periodic J. State and prove the regularity budget on every parameter window. Treat `u(s,t)=γ(t)` separately: the identical nondegenerate end operator makes its constant-cylinder linearization invertible; the translation action is not free there. Any use of the symmetric-matrix lemma in the transversality proof must establish its orthogonality condition. With orthogonal J, symmetric S_mat, `C_J=S_matJ−JS_mat`, `L=C_J−aI−bJ`, `Lz=0`, prove `LJz=2bz−2aJz`; the adjustment `(α,β,ξ)↦(α−2tb,β+2ta,ξ−tJz)` preserves `Lξ−(α+βJ)z`. Choose t to make `ξ⊥Jz`, and construct the symmetric complex-linear matrix taking z to ξ. Use this algebra in the localized analytic proof with its actual range and regularity estimates.

For an arbitrary symplectomorphism ψ, construct the **linear seam application** with `u(s,t+1)=ψ⁻¹u(s,t)`, compatible `J_(t+1)=dψ⁻¹ J_t dψ`, bundle gluing, nondegenerate asymptotics, reference trivializations and the signed F1 index/determinant comparison. A cylinder joining constant fixed points lies in a specified seam component; an action is used only with a supplied period homomorphism/reference cap or cylinder and a proved energy identity. For `ψ=φ_H¹`, additionally construct the global equation identification in the contractible untwisted sector: `w(s,t)=φ_H^t(v(s,t))` takes the ψ⁻¹ seam to periodic w and transforms `v_s+J'_t v_t=0` to `w_s+J_t(w_t−X_H)=0`, with `J'_t=(dφ_H^t)⁻¹J_t dφ_H^t`. Prove the cap, action, class, asymptotic and determinant transport. The arbitrary-ψ output is this linear seam theorem; the global equation/cap transport here uses ψ=φ_H¹.

**7.C.2a. Ordered determinant kernels, count functionals and family conventions.** Construct abstract Fredholm determinant bundles and stabilized kernel/cokernel, direct-sum, duality, evaluation and recapping isomorphisms for fixed topological domain, puncture, cap and end types. Factor the unselected domain, cap, marker and matching templates from the choice of compatible or tame J. Pull the abstract determinant interfaces back to each lane's actual raw endpoint, cylinder, plane, nodal, smoothing and cutoff-zero operators, including both pole constraints, before the constant-reference calculation. The downstream regular-gluing theorem compares these raw references with actual analytic gluing. Pure-cylinder determinant and quotient-followed-by-negative-flow interfaces use arbitrary supplied oriented end lines, HF F0/F1 and the raw cylinder/end carrier, without Morse or PSS data. Formal tensor/dual/evaluation identities are universal identities of complexes before either lane's actual differential exists; independent Morse and raw plane data are supplied only for their PSS instantiation.

Use the standard homological tensor category, with differential of degree −1, Koszul symmetry and dual differential `d(f)=(-1)^(|f|+1)f d`. Let `U` be the oriented Morse complex before its degree shift, `o_x` the Floer end line of degree μ(x̃), `λ` a fixed oriented zero-differential line of degree n, and `V` the complex-oriented line of degree 2n. Fix positive degree-zero maps `b_λ:λ→λ∨∨` and `φ_p:λ⊗λ∨∨→det(T_pX)`. Set `m=U⊗λ∨`, with `d_m=d_U⊗id`, and the formal stable complex `S_st=U∨⊗V`. Construct the comparison of the actual stable Morse boundary orientations with this complex and its basis-positive stable solving map. In particular its basis differential is `d s_k=(-1)^(k+1)Σ a_(k+1,k)s_(k+1)` when `d_U u_(k+1)=Σ a_(k+1,k)u_k`.

The orientation specification precedes the actual Floer differential. Its tensor/dual calculations are universal formal identities; the later oriented-boundary and count construction establishes the actual differential, its square-zero and chain equations, and instantiates these identities.

Fix cap lines `C_x^+=o_x⊗λ` and `C_x^−=λ∨∨⊗o_x∨`, of degrees n+μ and n−μ. Define their degree-zero cap pairing `γ_min:C^+⊗C^−→V` to have coefficient `(-1)^(μ+n)` on the specified positive bases. This is positive in the complex quadratic-minimum reference, where μ=−n. Its sewing map is the right-dual **coevaluation** `q_min:V→C^−⊗C^+`, with the same coefficient `(-1)^(μ+n)`; prove its snake identities and differential compatibility. The swapped negative-first evaluation has coefficient +1 and is a different map. Use the coevaluation in composing count functionals. Prove these laws from the actual end/cap determinant isomorphisms, including frame and recapping cocycles. Recapping changes μ by an even integer.

For each operation from A to B use the input-first external orientation kernel `𝒦(A,B)=A⊗B∨`. Its count is a functional on 𝒦(A,B). The chain-compatible identification `𝒦(A,B)∨=B∨∨⊗A∨→B⊗A∨=Hom(A,B)` uses `j_ch,B^−1`, where `j_ch(x)=(-1)^|x|j₀(x)` for the positive-basis bidual map j₀. Thus a degree-zero count functional has ordinary operator coefficient `(-1)^|B|` times its coefficient in the positive kernel bases. The identity functional is right evaluation, with coefficient `(-1)^|A|`; the identity vector is left coevaluation. Construct both APIs with their actual variances.

Write `F:M→CF` for the negative-plane map and `G:CF→M` for the positive-plane map. Their raw kernels are `E_F=U_p⊗C_x^−⊗V_p∨` and `E_G=C_x^+⊗S_st,q⊗V_q∨`. Fix the positive vector readouts `E_F→m_p⊗o_x∨` and `E_G→o_x⊗m_q∨`: the first contracts `λ∨∨⊗λ∨` by left evaluation of λ∨, and the second uses the stable solving map, even V evaluation and b_λ. Prove the readouts are chain isomorphisms on adjacent generators. On count functionals their ordinary operator coefficients are respectively `(-1)^μ` and `(-1)^(ind(q)−n)`. These fix the conversion from plane count functionals to ordinary operators before counting. The degree-zero external readouts of the Morse inverse family, the finite-Morse-length family and the smoothing/identity family each have the further fixed factor `(-1)^n`; retain that factor on every face of each family. The normalized nodal map 𝒩 uses that same family readout.

For a nodal pair order the matching sequence as

`0→ker D_N→ker D₊⊕ker D₋→TX→coker D_N→coker D₊⊕coker D₋→0`,

with `ev₊−ev₋`, positive-plane factor first, and complex-oriented TX. Its external kernel is `C_x^+⊗C_y^−⊗V∨`. Use this identical sequence at the L=0 and positive-ray τ=0 faces. On the stationary fibre the unscaled functional is γ_min; its ordinary readout is `(-1)^n Id`, so the specified family factor gives Id. Construct the stationary Fredholm comparison with these maps.

At the Morse inverse zero face retain both ordered pole targets. In domain order `U_p⊕V⊕S_st,q` and target order `V_p⊕V_q`, the constant-core matching map is `(u,v,s)↦(u−v,v−s)`. Compute its determinant `(-1)^k` for every k=ind(p)=ind(q), using both constraint duals. The count-functional readout into Hom(M,M) contributes `(-1)^(k−n)` and the fixed family factor contributes `(-1)^n`, giving the positive identity. Calibrate the complex minimum by its actual cap operators of indices0 and2n, and prove the comparison for every k by its own stabilized exact-sequence diagram. The constant two-marked core is contracted as in 7.C.3a.

At the broken Morse inverse face insert q_min for the intermediate Floer end. At the Floer inverse long face orient the negative-gradient graph by its first projection. For the stable/unstable splitting its canonical map is `χ_M:V→S_st⊗U`, with coefficient `(-1)^k` on `s_k⊗u_k`. Prove its adjacent-generator differential identity and the actual Morse gluing comparison; the two pole-normal factors retain their order and have even degree. Together with the functional readouts and fixed family factors above these give positive GF and FG composition faces. Construct these simultaneous raw determinant diagrams before counts, then prove their agreement with actual regular gluing at the corresponding endpoint theorem. The reference computation and the per-index finite-block computations fix the convention; its full geometric realization is a construction target.

Construct the pure-cylinder quotient/negative-flow orientation comparison on HF F1 determinant lines, with quotient orientation followed by the negative-flow tangent. In the actual Morse applications compare this convention with HF M.3, using the auxiliary Morse datum there. Along the positive-end-input arrow this tangent is −u_s; the translation generator is +u_s. A translation-first convention changes by `(-1)^d` when its line moves past a d-dimensional quotient. Use outward normal first at parameter boundaries. For an oriented j-dimensional parameter chain P and input of degree i, the raw count kernel is `A⊗det(P)⊗B∨` with output degree i+j. The Hom degree is +j. Its parameter-first operator readout has coefficient `(-1)^(i+j+ij)` on positive bases; the three inverse families also retain their fixed factor `(-1)^n`. Once an input-first operator readout has already been taken, the further parameter-first conversion is `(-1)^(ij)`. Prove the actual ordered boundary comparison giving `D T_P=dT_P−(-1)^jT_Pd=T_(∂P)`. A degree-one inverse homotopy therefore has raw functional readout `(-1)^(n+1)` and differential d𝓗+𝓗d.

Prove the simultaneous Morse/Fredholm realization of this complete system, including the actual stable Morse differential, cap pairing and sewing coevaluation, both pole constraints, graph χ_M, identical nodal sequences, raw endpoint data, parameter/flow order, frame changes, recapping and stabilization. Orient the Morse comparison from its zero-cutoff identity face toward its broken GF face, L increasingly and τ decreasingly. At each fixed total cap/class and finite energy window the oriented boundary readouts have the formal shapes `D𝓗_M=GF−Id_M`, `D𝓗_L=FG−𝒩` and `D𝓗_τ=𝒩−Id_CF`, where D is the specified graded Hom boundary readout. First these are finite geometric boundary identities of the actual cutdown spaces, with end counts and matching multiplicities. After support and the corresponding matrices exist, 7.C.6 interprets them as the displayed chain-homotopy equations in the finite-Laurent or completed module. Use the same determinant realization in both branches, with their own actual compactness and endpoint theorems.

**7.C.2b. Raw individual continuation sections.** Construct fixed-end data `(H_(s,t),J_(s,t))` with compatible J, nondegenerate Floer ends and finite `∫sup_X|∂sH|`. Raw configuration/section bundles, vertical linearizations, Fredholm/evaluation maps and cap classes may retain those ends as unselected parameters. Their selected instantiation consumes the regular cylinder/end data and shared t-parametrized sphere-evaluation families constructed in 7.C.3. Fix those selected ends before selecting the individual continuation section. Vary H_s by genuine compactly supported smooth interior variations, together with J, preserving the selected tails.

**7.C.2b(0). Raw cylinder homotopy and composition templates.** Before selecting interiors construct the parameterized cylinder domains for interpolation homotopies and composition: fixed capped asymptotic ends, end markers and cylindrical coordinates; finite neck length, neck/cutoff profiles and their compactified parameter coordinates; smooth one-forms H_(p,s,t)dt or the declared more general K, compatible J_(p,s,t), fixed-tail jets and matching cap/reference maps. At this raw stage face sections are unselected variables satisfying the stated restriction/corner equations. A zero-length identity uses the raw stationary cylinder, not a two-marked PSS sphere. Construct the raw Sobolev sections, compact-parameter K-curvature allowances, evaluation maps and determinant pullbacks. Establish raw energy-cutoff compactness and conditional gluing for these cylinder templates independently of any Morse/PSS data. After the cylinder ends and individual continuation sections are selected, insert those selected pieces as actual regular true faces, then perform the face-flat relative interior selection. The PSS comparison-domain templates below are separate carriers.

**7.C.2b(i). Smooth perturbation synthesis and the continuation face-free carrier.** Fix the domain/end metrics, target connections, parameter coordinate windows, bundle charts, end weights and configuration windows. At each finite F0 section/evaluation/projection differentiability budget record the finite mixed derivative list I_m, the finite list P_m⊂[1,∞) of integrability exponents, and the positive domain weights w_(m,α,β,γ,q). Include every derivative needed by the actual Sobolev multiplication and trace theorems for that budget. A perturbation direction is e=(A,δK), where A is a compatible-J bundle-chart direction and δK is a smooth domain Hamiltonian one-form (δH_sdt in the individual continuation instance). For each B=A,δK and each (α,β,γ)∈I_m include the linear coefficient seminorms

`sup_(p,z,x) w_(m,α,β,γ,∞)(p,z)|∂p^α∇z^β∇X^γ B(p,z,x)|`,

`sup_p (∫_Σ [sup_(x∈X) w_(m,α,β,γ,q)(p,z)|∂p^α∇z^β∇X^γ B(p,z,x)|]^q dvol_Σ)^(1/q)` for q∈P_m.

The lists include all mixed parameter/domain/target derivatives, for both A and δK, through the specified finite budgets; the weights and norms are fixed independently of the perturbation. Include C^m seminorms on the first m compact exhaustion charts. The global A₀ controls also include the unweighted compatible-J and δK C⁰ norms, `sup_(p,z,x)|∇_XδK|`, and `sup_p∫_Σ sup_X(|d_ΣδK|+|∇_XδK|)dvol_Σ`. The target supremum is inside every domain integral. Derive the corresponding linear multiplication/weighted-Sobolev operator bounds, using dense compactly supported test sections for their operator norms. Define A_m by the finite sum of these controls and all earlier A_j. Prove each compact testing-library element finite for these fixed norms, including its transported cutoffs and weights. Prove lower semicontinuity under C^∞_loc: coefficient suprema use suprema, coefficient integral norms use Fatou followed by sup_p, and linear operator norms use dense compact tests with the actual source/target norm comparisons.

For a countable dense local testing library e_ν set `w_ν=2^ν max(1,A₀(e_ν),…,A_ν(e_ν))`. Prove the ℓ¹(w_ν) series converges in C^∞_loc and in every controlled global seminorm, by applying the lower-semicontinuity bounds to its tails. Its closed-kernel quotient is a complete separable Banach space injected into smooth fields. Instantiate it first on the individual continuation cylinder with free compact interior δH_s and A directions. Using `J(A)=exp(A)J_base exp(−A)`, prove the finite-order chain-rule and Sobolev–Moser estimates for composition with every controlled configuration map, including evaluation, trace and parameter derivatives. These estimates establish the universal section and projection maps C^ℓ on each declared configuration window from the stated linear coefficient controls. The synthesis seminorms are the stated linear coefficient and linear operator controls. Require A to lie in the symplectic Lie algebra and satisfy AJ_base=−J_base A. Then exp(A) is symplectic and J(A)=exp(A)J_base exp(−A) is compatible; prove the compatible-J local chart and the uniform metric bounds on the specified small chart balls. Expanding the Hamiltonian curvature gives `sup_p∫_Σ sup_X|R_(K+δK)−R_K|≤C₁‖e‖+C₂‖e‖²`: the quadratic bracket is bounded by the global first-target-derivative supremum times its L¹ domain integral, and background brackets and d_ΣδK by the stated linear controls. This proves the global bound on tails and necks with the fixed metrics. The face-free construction uses only these coefficient/global norms.

Build the individual continuation universal section and its simple-sphere/marked-incidence families at the actual attachment structures J_(s,t), together with their shared core and matching evaluations. On each fixed end J_(s,t)=J_t, use the previously selected t-parametrized sphere/evaluation families: attachments with equal t share that same J_t even if their s coordinates differ. Vary the continuation core only in its allowed interior directions and make its evaluations transverse to these fixed end families. In free regions apply the conditional grouped theorem below with its actual domain-localized variations. Sphere tuples allow repeated classes and have pairwise-distinct simple images in the reduced incidence problem. Prove the combined adjoint range, finite F0 budgets, matching transversality and simple-image reductions; constant core solutions are detected by δH_s, while spheres receive no δH_s variation. Select simultaneously on countable class/energy/index/attachment windows. The s-independent identity has its separate invertible stationary operator with identical nondegenerate ends. These selected individual constructions precede homotopy/composition faces and retain the end incidence data in all subsequent restrictions.

For a domain-dependent Hamiltonian one-form `K=K_s ds+K_t dt`, define `X_K` componentwise with `ι_Xω=dH`. Set `{F,G}=ω(X_F,X_G)` and `R_K=∂sK_t−∂tK_s−{K_s,K_t}`. Derive `E_K=∫ω(u_s−X_(K_s),u_t−X_(K_t))=∫u*ω+∫∂ K(u)−∫R_K(u)dsdt` for `(du−X_K)^(0,1)=0`. With capped ends it gives the corresponding action/class identity; for K=H_sdt it is the displayed continuation formula. Prove uniform `∫sup_X|R_K|` bounds on each declared compact parameter window, including neck/stretching/cutoff ranges and the admissible perturbations, with actual end actions/periods and compact target giving the necessary energy cutoffs. Include domain-dependent K variations in this curvature budget.

**7.C.2b(ii). Raw PSS sections with common poles.** Use two fixed globally parametrized planes with Morse pole z=0 and Floer puncture at infinity. Fix their complex coordinates, tangent frames and cylindrical end coordinates once. In the positive-end chart write z=exp(2π(s+it)), and in the negative-end chart z=exp(−2π(s+it)); use the corresponding fixed inversion coordinates at infinity. On the positive plane take β₊H_tdt, zero near0 and equal to H_tdt on its Floer end; use the corresponding negative-end cutoff on the negative plane. Prescribe K=0 and a common domain-independent compatible J_pole=J₀ on fixed discs at both poles, treating J₀ as unselected data at this raw stage. Pair compatible domain-dependent J outside these discs with genuine interior/core/neck Hamiltonian one-form variations δK, zero on the pole discs and fixed Floer tails. Each nonsphere plane of every matching configuration has its own nonempty free δK region. Construct the raw Banach fibre-product sections with the outgoing negative-gradient Morse ray to q on `[0,∞)` and incoming ray from p on `(−∞,0]`, capped ends and evaluation maps. For a single fixed basic datum, the pre-incidence Fredholm indices are n+μ(x̃₊) and n−μ(x̃₋), giving μ(x̃₊)−(ind q−n) and (ind p−n)−μ(x̃₋) after incidence, with all class and parameter corrections. The selected instantiation of these raw planes uses the earlier regular Floer ends and their full t-parametrized sphere-incidence/evaluation data from 7.C.3, together with the independently selected pole datum J₀. This selection occurs before regular plane data or inverse-family true faces are chosen.

**7.C.2b(iii). Unselected comparison-domain templates.** Construct the finite Morse-segment, finite Floer-neck, middle-cutoff and cutoff-zero domains, positive nodal smoothing ray, compactified parameter faces, cap/evaluation carriers and cutoff formulas with J₀ and broken-face sections as unselected parameters. The domains, end labels, constraints and matching maps precede any lane's regularity/count theorem. Instantiate their jets and actual sections separately with compatible or uniformly tame J. For each raw finite-neck compact-sphere domain fix smooth K_*∈Ω¹(Σ;C^∞(X)), zero on fixed pole discs with prescribed cutoff/end matching. Near cutoff-zero use K_R^base=R K_* and J_R^base=J₀. The actual R=0 section is the full two-marked unforced J₀-sphere section with its explicit unstable-constant normalization; the other templates retain their fixed nondegenerate Floer asymptotics. Substitute selected continuation/PSS/Morse pieces only in later true-face constructions with their actual regularity and matching corner jets. True-face flatness is all-order vanishing at the face.

**7.C.2b(iv). Distinct-image separation and conditional joint evaluation.** Consume HF F2.2a and F2.2c for the two-map unique-continuation and accumulation-to-factorization floors, and F2.6a–d for sphere domains, single-map factorization and marked quotient/evaluation carriers. Construct the application theorem that two simple maps with distinct images share no open image germ. For a finite tuple for one common J, either ω-compatible or ω-tame, prove that each map has a dense set of injective regular points avoiding all other full simple images and the prescribed finite marked test values. Remove the finite union of the closed other-image preimages with empty interior and the noninjective/critical locus. Specify the actual allowed variation space: a J-tangent Y satisfies YJ+JY=0; in the compatible lane ω(v,Yw) is additionally symmetric, while the tame lane has no such symmetry constraint and is restricted by the chosen open uniformly tame chart. Prove the localized range theorem separately in these two spaces. With disjoint allowed target/domain-localized tests, the combined adjoint equation first kills sphere cokernels; unique continuation and actual matching equations then kill the remaining finite evaluation dual variables. State the finite-F0 theorem for the supplied sphere quotient/evaluation carriers, smooth incidence maps, matching rank conditions, orientations and relative parameter restrictions. Class tuples may repeat while reduced simple images are distinct. This conditional theorem does not select data or construct a Morse datum. Its pure cylinder application uses core/orbit evaluations; Morse-chain, critical-point and broken-Morse applications separately supply HF Lane M and 7.C.1a strata with their actual dimensions.

For a supplied domain-parametrized problem with specified variation space, fixed regions, collision strata and face restrictions, group sphere attachments by their actual common structure in the chosen tame or compatible lane. Wherever the structure depends only on t, every equal-t attachment belongs to the same group, including distinct s or domain points. Fixed pole groups use J₀. Free domain attachment points admit independent localized directions only when those directions belong to the supplied variation space. Apply the common-J theorem within a group and prove the resulting conditional combined range and restriction laws. Actual continuation/PSS applications instantiate this theorem after their carriers and strata exist: fixed end/tail groups consume the selected t-families, free groups consume their actual interior directions, and relative true faces consume their previously selected face data. Their collision, matching, smooth-selection and corner laws are construction outputs of those applications. The grouped theorem uses the selected lane’s actual tangent space and coefficient/coercivity bounds; a compatible-only range theorem is not an input to the arbitrary-tame conclusion.

**7.C.2b(v). Compact exhaustion within each actual stratum.** For every finite component/class tuple, normalized domain type, incidence stratum and equality partition of attachment structures, construct countably many closed quantitative windows indexed by positive integers. Class tuples may repeat. Distinct reduced simple images define that stratum; equal-image vertices are retained in their separate simple-image/cover reduction strata. The equality partition records exactly which times, domain points, marks or target values coincide. Preserve its diagonal equations, and impose a positive lower bound only on distinctions required in that stratum. Equal-t groups are allowed. Marks that collide in the compactification are retained in the corresponding marked/nodal collision stratum.

For each distinct-image simple component choose an injective regular source anchor z_* in a normalized source disc whose image avoids every other reduced image, the required marked test values and fixed forbidden regions. On its normalized closed domain fix the reference source metric g_Σ independently of the map, using the fixed round metric for spheres and the declared slice identifications for varying domain representatives. For a quantitative window with K≥1 require the GLOBAL self-point floor `inf_(ζ∈Σ, ζ≠z_*) d_X(u(z_*),u(ζ))/d_(g_Σ)(z_*,ζ)≥1/K`, together with `‖du‖∞≤K` in these fixed source/target metrics. The infimum ranges over the ENTIRE source, including points outside the anchor disc. Retain separately the regular derivative lower bound, inverse-chart radius and controlled derivative bounds, distance from u(z_*) to every OTHER FULL reduced component image, required marked test value and spatially fixed region, and the slice/automorphism normalization bounds. Impose only the fixed-region separations required for the actual relative variation problem. Nonsphere inhomogeneous section components retain their separately stated FHS graph/core-evaluation window conditions; the closed simple-component floor does not replace those conditions. Record slice/automorphism normalization bounds. Bound domain/parameter coordinates and derivatives and impose distances from the boundary of the domain, mark, incidence and equality-partition chart only where that boundary is excluded from this stratum. For Morse strata use compact subsets of each actual smooth unbroken or broken trajectory stratum, with ranks and separation bounds for the already supplied incidence charts/maps, not regularity of the moduli equation being selected; shared or equal critical values are retained in the stratum allowing them. These are quantitative window inputs, not consequences of single-map bounds.

Prove exhaustion using distinct-image injective-point separation, local slices and the actual allowed diagonal/incidence relations. At an injective regular anchor, the local immersion/inverse estimate gives the ratio floor near z_*, while compactness of the complement of that source neighborhood and uniqueness of its anchor preimage give a positive ratio lower bound there; hence some finite K contains every relevant simple component. Prove relative compactness inside that stratum for convergent smooth structures and data with fixed window bounds: elliptic compactness and normalization preserve the GLOBAL self-point floor, regular derivative, full-other-image/fixed-region and slice bounds. Thus the limiting anchor remains globally injective and regular, preventing degeneration of that simple component to a multiple cover as well as image merger or a forbidden collision. Allowed boundaries have their own strata/windows, with compatible restriction and refinement maps. Derive openness of regularity/evaluation transversality on each proper window, density by the conditional finite-F0 range theorem and relative smooth approximation, then Taubes countable-intersection selection. The abstract smooth-selection theorem takes the declared section/variation spaces, stratum windows, fixed regions and already regular face restrictions as hypotheses. Instantiate it separately for J₀, J_t, J_(s,t), J_(p,s,t) and J_(p,z) only after each actual carrier, conditional range theorem, shared group and matching/incidence problem is constructed, retaining fixed ends/poles and parameter dimensions. Relative exhaustion/refinements commute with prescribed face restrictions; regular true faces remain inputs. No distinctness condition is imposed beyond its defining stratum.

**7.C.2b(vi). Select the common sphere datum first.** Choose one domain-independent compatible smooth J₀ for the simple-sphere finite class tuples (with repetitions allowed and pairwise-distinct simple images), two-marked Morse-chain incidences and one-marked incidences at all critical points of the auxiliary Morse pair. Prove the joint universal section and finite F0 budgets using the actual compatible-J tangent linear algebra and localized simple injective points. Consume HF F2.6d's smooth-J route: use the actual-stratum compact exhaustion of 7.C.2b(v), including the fixed-metric GLOBAL self-point floor, regular derivative and full-other-image/fixed-region anchor bounds, slices and incidence/equality-partition bounds; prove openness on each proper window, density from finite-C^ℓ Sard–Smale and relative smooth approximation, and apply the Taubes countable-intersection argument in the smooth compatible-J topology. Apply the same method to these marked/evaluation fibre products with their actual Morse constraints. Obtain a residual subset of smooth J₀ simultaneously for all declared windows. In spherical c₁-zero the one-marked critical-point strata have the avoidance consequence used below. Fix this J₀ and its regular strata before selecting the planes.

**7.C.2b(vii). PSS face-free Banach carrier and basic selection.** Instantiate the testing-series/closed-kernel synthesis separately on the raw planes, using the space of smooth Hamiltonian one-forms Ω¹(Σ;C^∞(X)) with the specified pole/end restrictions, compatible-J chart directions and the actual finite F0 budgets. Use each plane's independent free δK directions and compatible-J chart directions zero on the fixed pole discs and Floer tails. Use the plane metrics and end weights in every mixed coefficient supremum and weighted L^q norm specified above, for both A and δK, with the actual plane finite F0 section/evaluation/projection lists. Retain the global curvature controls and derive the plane allowance `sup_p∫_Σ sup_X|R_(K+δK)−R_K|≤C₁‖e‖+C₂‖e‖²`. This is an independent face-free plane instance. Prove local detection, lower semicontinuity, complete separable synthesis and the section/evaluation differentiability budgets in this named plane instance. With the independent J₀ strata and the earlier selected regular Floer ends/t-parametrized sphere-evaluation families fixed, prove universal plane evaluation submersivity using free interior δK, the adjoint matching equations and unique continuation; this includes constant planes where J variation vanishes. Select positive/negative plane data and their two pole/matching evaluations transverse to the fixed J₀ sphere/Morse strata. At fixed Floer-tail attachments use the selected J_t families, grouping all equal-t attachments even at different s values; use the free core directions to obtain the required transversality to those fixed families. At free nonpole attachments construct the actual grouped J_z sphere/evaluation problems with only their allowed variations. Prove the matching and collision laws with the prescribed pole/end restrictions. Thus plane selection, its node matching and its sphere-incidence outputs are actual theorems before inverse-family faces are formed.

**7.C.2c. Periodic tame data and the compatible-model comparison.** For a smooth periodic ω-tame J_t on closed X, construct the same capped raw equation and section with the same nondegenerate contractible Hamiltonian ends. Put g_J^sym(v,w)=(ω(v,Jw)+ω(w,Jv))/2 and prove it is a positive symmetric metric. On each specified compact tame-data parameter family prove uniform positive coercivity and coefficient bounds. The equation gives u_t−X_H=J_tu_s, hence E=∫ω(u_s,J_tu_s)=A_H(x̃₊)−A_H(x̃₋), with its continuation/K-curvature versions. The action variation is dA_H(ξ)=∫ω(ξ,γ̇−X_H); construct its actual weak-gradient expression using g_J^sym, distinguishing it from −J_t(γ̇−X_H) for merely tame J_t.

Build the tame Sobolev section/evaluation charts, local/removal estimates and elliptic/end Fredholm theory from HF F0/F1/F2 on actual compact uniformly tame coefficient windows. In the asymptotic linear theory identify the action Hessian and the actual positive-symmetric-part mobility; prove the spectral-gap/exponential-end estimate and its uniform compact-family version from nondegenerate Hamiltonian ends. Do not assert self-adjointness for a nonsymmetric pairing. Transport the Fredholm index and determinant line by the fixed-end tame-to-compatible operator homotopy, and apply the supplied self-adjoint spectral-flow comparison only at the compatible realization. Prove cap, puncture-index and orientation transport on that actual homotopy.

**Tame synthesis and staged selection.** Use general anti-J directions A, AJ_base+J_baseA=0, and J(A)=exp(A)J_base exp(−A) on a quantified small C⁰ ball. Prove that these give local tame charts and uniform positive tameness bounds; A is not required to be symplectic. In the actual mixed coefficient/linear-operator norms of 7.C.2b(i), use D exp_A(B)=∫₀¹exp((1−t)A)B exp(tA)dt, its iterated derivatives and Sobolev multiplication/trace/composition to prove every finite mixed parameter/domain/target chain-rule and Moser bound. Record the actual lists, constants and section/evaluation/projection C^ℓ budget before applying F0. The testing-series and global curvature estimates are instantiated in these tame norms, independently of compatible selection/counts.

Construct tame raw cylinder/continuation/plane/comparison sections, ASM-based unforced tree convergence and the attached inhomogeneous compactifications and conditional gluing with uniform tame coefficients. Prove grouped conditional evaluation in the actual tame tangent space and actual-stratum proper-window openness/density/smoothing before each selection. First select regular ends with all shared t-parametrized sphere/evaluation data, including equal-t groups and stationary incidences. Independently select J₀ with its actual Morse/critical-point sphere incidences. With selected ends fixed select individual continuations; with ends and J₀ fixed select basic planes and node/sphere incidences. For homotopies and inverse/composition families insert the previously selected geometric pieces as actual regular true faces, construct their corner restrictions and select relative interiors with all parameter dimensions included. The independent pole choice is not a premise of pure cylinders or individual continuation. Conditional gluing supplies face-flat weights and per-energy collars before branch exclusion and fixed-class boundaries. Geometric support precedes each matrix and its equations. Full tame-to-compatible module comparison occurs only after both lanes' supported complexes exist.

**Tame raw sign realization.** Before tame counts, instantiate the complete formal system of 7.C.2a on the actual tame operators, with the same ordered input kernels, both pole targets, stable Morse complex, γ_min and q_min, matching exact sequences, cap/frame/recapping and parameter/flow order. Transport the complex-minimum and each finite-index reference by the fixed-end tame-to-compatible Fredholm OPERATOR homotopy of 7.C.2c; this construction has no chain-comparison or compatible-count premise. Prove its determinant homotopy, stabilization and gluing-reference diagrams. Pure tame cylinder parameter boundaries consume the universal readout (−1)^(i+j+ij) and quotient/negative-flow order without Morse/PSS data. Tame PSS parameter and endpoint boundaries additionally consume the actual raw cap/Morse calibration: j=1 gives −1, the inverse-family readout is (−1)^(n+1), the stationary cap and functional readout give (−1)^n before the fixed family factor, and the Morse zero-face exponent k+(k−n)+n is even. Prove agreement of these raw references with the actual tame regular-gluing boundaries before support/matrix equations.

Consume HF F2.1’s tame/compatible contraction fixing a compatible structure and relative smooth-family extension, and F2.6d’s corresponding localized single-sphere range and smooth selection floors. Apply them to the actual periodic/continuation/PSS end/pole/true-face data with the declared uniform tame budgets. Arbitrary periodic tame data retain their raw equation, energy, conditional local compactness and Fredholm interfaces; counts require selected regular data in the preceding tame construction. After both tame and compatible supported module complexes and continuation maps exist, select regular tame-to-compatible continuation and relative homotopy/composition data with their prescribed tails, true faces and K-curvature allowances. Prove the comparison’s own energy-cutoff compactness, exclusion, gluing, coefficient support and determinant diagrams; use its supported matrices and oriented boundaries to obtain the filtered chain-homotopy equivalence and cap-change naturality in each coefficient lane. This is a module comparison, with no quantum-operation construction or generic index/flow duplication.

**7.C.3. Raw compactness, conditional gluing and analytic branch exclusion.** Consume ASM M3's full marked unforced stable-map compactness at genus0, with its compact smooth tame-J family and integral splitting hypotheses. Construct the rooted attachment/equal-parameter matching application for the declared raw inhomogeneous cylinder, continuation and PSS sections with uniform K-curvature/end bounds: finite-cutoff convergence to broken cores and sphere trees, removal, no-neck/end convergence, integral class splitting, topology and Hausdorffness. Each bubble subtree has its attachment's frozen J; separate roots retain their actual shared-structure partition and matching evaluations. Normalize/contract unstable constant raw components, in particular the two-marked zero-cutoff core, rather than identify them with a stable two-marked moduli space. At supplied regular broken configurations construct the actual conditional gluing, surjective matching, determinant and onto-neighborhood theorem, with inverse/derivative/cutoff/error bounds on each finite-energy window. These estimates supply weights/collars before relative-family selection. Contractible-sector persistence and the finite nondegenerate end theorem of 7.C.1 are explicit inputs in both coefficient lanes. HF local removal/factorization/index estimates are consumed with their actual scope; its minimal-area single-component compactness is not a replacement for ASM's full marked supplier.

Keep the branch hypothesis records separate from their analytic consequences: positive spherical monotonicity is the equality ω=κc₁ with κ>0 on S_sph; spherical-c₁-zero is c₁|S_sph=0 with no sphere-area vanishing. Actual bubble exclusion additionally consumes the raw sections/compactness, common universal parameter spaces, compatible-J curve floors and marked/core incidence, as well as the cap quotient.

**Separate finite counting budgets.** For pure cylinders, individual continuation, cylinder homotopy and composition, use the finite contractible Hamiltonian ends of 7.C.1, their reference cap actions/degrees, the declared finite parameter/count dimensions and actual global K-curvature allowance. In positive monotonicity the cap/index equation bounds the relevant spherical Chern numbers and hence energy at that fixed counting budget. Prove the resulting cylinder/continuation energy ceiling and per-budget collar bounds without a Morse datum. For PSS, the nodal correspondence and the two inverse families, additionally supply the independent finite Morse critical set, its indices/actions and the actual finite Morse-segment/end data; derive their own cap/index/energy ceiling and endpoint collar bounds. Morse finiteness is a premise only of this second budget. In spherical c₁-zero, neither index equation bounds sphere energy; use a declared finite energy cutoff in each lane and retain the resulting cutoff-dependent collars.

For cylinders construct and select one shared countable universal parameter problem for regular cylinders, sphere tuples, their marks, attachment times and matching evaluations, using the cylinder FHS range and the conditional two-/multi-map sphere theorem of 7.C.2b. Keep the actual t-parametrized evaluation families, not only regularity at a single t. At each common t use one shared-J tuple problem; repeated classes and distinct reduced images are included. Include the stationary cylinder through its invertible end operator and the required joint sphere incidence. Complete the finite-C^ℓ budgets, bounded-piece openness, smoothing and countable smooth selection for these strata. Fix the resulting regular end/tail data before selecting actual individual continuation or plane data. Their frozen end/tail restrictions reuse this same selected sphere/evaluation theorem; this step has no premise from the independent J₀ pole selection.

In the positive-monotone branch, prove the stationary Chern-one attachment exclusion at total index2 by its joint orbit/sphere evaluation theorem and actual parameter dimension. Combine this with the positive-area Chern lower bound for nonstationary cores.

In the c₁-zero branch the simple-sphere evaluation with its mark/time has codimension4 in X×S¹, and an index-k nonstationary quotient with attachment has dimension k+1, giving k−3; the stationary incidence has dimension−3. Prove the joint transversality, simple-image/cover reductions and absence of these strata at k≤2.

For individual continuation and relative parameter families construct their own simple-sphere and marked-incidence section problems frozen at the actual attachment structures J_(s,t) and J_(p,s,t). Include core, marked sphere and matching equations with shared variations, class tuples with repetition and pairwise-distinct simple-image chains, constant-core cases, simple-image/cover reductions and the actual total parameter dimensions. The selected individual continuation problem supplies its J_(s,t) output; relative families supply their J_(p,s,t) theorem through their own face-flat carrier and already-selected true-face incidence data. Joint selection and those face compatibility laws precede the corresponding branch exclusions and signed boundaries. PSS uses its already-constructed J₀ pole strata and actual frozen J_z problems. These are the distinct parameter/PSS incidence and exclusion constructions. On every fixed end/tail restriction the earlier selected J_t sphere/evaluation families supply regularity, with equal-t attachments grouped regardless of s. Only free core structures vary in these later problems. Actual relative selection uses this fixed end output and previously regular true-face incidence data before proving its branch exclusion.

**7.C.3a. Zero-cutoff fibre and all-tree exclusion.** Define the endpoint of both coefficient branches' Morse-side PSS inverse identity as the complete two-marked sphere with its two ordered Morse attachments, or equivalently the same two removable cylindrical poles. Require finite energy and prove removal at them. Match the two evaluations to the outgoing and incoming Morse rays, without adding further incidence marks.

Use the single J₀ and its sphere/Morse/one-marked strata already selected independently in 7.C.2b. The basic plane data have subsequently been chosen transverse to those fixed strata, using their own face-free Hamiltonian carrier. Substitute these selected pieces into the true zero-cutoff and broken-face templates here and in 7.C.3c. Keep the class-tuples with repetition, pairwise-distinct simple images, fixed auxiliary Morse pair and closed broken stable/unstable loci. The one-marked regularity theorem is common to both branches; only its spherical-c₁-zero critical-point avoidance consequence is used below. This keeps the common sphere selection before the basic plane selection.

Write `A_end` for the total spherical class at this endpoint, `B_rec=−A_end` for the output recap, and `A_simple` for the class of a simple image through which a nonconstant component factors with degree `d≥1`; thus `A_end=d A_simple` for a single covered component. The rigid degree-zero equation is `ind_f(q)−ind_f(p)=2c₁(A_end)`. These are sphere classes; the cylinder class `A_cyl` and its matched-cap case `A_cyl=0` are treated in 7.C.2. Prove finite stabilizers and the two-marked incidence theorem on the nonconstant locus; the residual `ℂ*` quotient is used only there. A constant two-marked sphere is unstable and has infinite `ℂ*` automorphisms. Treat its constant core by contracting the unstable component and using the two Morse constraints at `p=q`: on the sphere, `∂̄` has kernel `TX` and zero cokernel, while transverse `Wᵘ(p)∩Wˢ(p)` cuts the value to the isolated index-zero diagonal term. Derive the determinant-line gluing and Morse orientation identification that makes this term exactly the identity on `M`; use the cap/stationary calibration of 7.C.2a.

Treat all sphere-tree strata: ghosts, critical values, multiple covers and repeated/shared simple images. For distinct external marked values, reduce the finite image-incidence graph to a chain of pairwise-distinct simple images joining them. Contract repeated-image vertices only in that graph, remove excursions and shorten a retained image with identical entry and exit values until every retained image has two distinct incident values. Prove preservation of the connecting incidence. For coincident external values use the common-value incidence on the closed broken Morse loci. A critical-point incidence reaching a nonconstant component through ghosts is a one-marked simple-image incidence; apply avoidance to it only in the spherical-c₁-zero branch. The single J₀ theorem above covers the entire reduced-image problem.

Index every nonconstant component of the full tree by v, with simple-image class A_v and covering multiplicity d_v≥1; include off-chain components and repeated images in A_end=Σ_v d_v A_v. Ghosts have class zero. Separately let B_j, 1≤j≤r, be the classes of the distinct simple images retained on the reduced chain. Then Σ_j c₁(B_j)≤c₁(A_end) in the positive-monotone case because each retained image is represented among the full-tree components and all nonconstant components have positive Chern number; in the spherical-c₁-zero branch both sides vanish. The joint unparametrized dimension is

Σ_j(2n+2c₁(B_j)−6)+4r−2n(r−1)−(2n−ind_f(p)+ind_f(q))

=2(Σ_j c₁(B_j)−c₁(A_end))−2r≤−2r.

Prove emptiness using the shared-J incidence theorem, the full-tree class accounting and compactness. For coincident external values use `cl Wᵘ(p)∩cl Wˢ(q)`: it is empty when ind p<ind q, since a broken negative-gradient trajectory decreases Morse index. Positive monotonicity with nonzero total sphere class gives this strict inequality by the degree equation. In the spherical-c₁-zero branch equal indices force p=q; a nonconstant tree through the common value then contains a simple image through that critical point, whose one-marked incidence has dimension −4. Prove its absence with covers, ghosts and repeated images included, and with the additional dimensions of the finite parameter problems under consideration. Monotone spheres may pass through critical points; their excluded endpoint configurations are ruled out by the compactified Morse incidence and index argument instead.

**Regular true endpoint and energy-dependent neighborhood.** Prove regularity and identity orientation of the actual R=0 fibre from the constant-core model and branch-specific all-tree exclusion. At each finite energy/index/parameter budget use raw compactness and quantitative conditional gluing to find ε(E)>0 so the actual face-flat family near R=0 has precisely the glued identity-end configurations, with its error/inverse/derivative estimates. This PSS endpoint uses the PSS budget above, including the finite Morse critical set from 7.C.1a and finite contractible ends. Positive monotonicity gives a bounded-energy collar for its fixed counting budget; c₁-zero retains ε(E) separately. Pure cylinder/continuation collars use their own Morse-free budget instead.

**7.C.3b. Floer inverse through one nodal correspondence.** With the selected basic PSS data construct the degree-zero geometric correspondence 𝒩 from the pair of planes with equal pole evaluations at L=0. Construct its matching fibre product, compactification, coherent determinant orientation and rigid coefficients at fixed cap/class. The oriented one-dimensional boundary is the finite geometric end-breaking formula, using the actual cylinder breaking/gluing/bubble-exclusion theorem and plane matching. Prove geometric finite-below support before assembling its matrix. In each branch the resulting supported matrix is a chain map by that boundary formula after the cylinder differential exists. Retain the same cap classes and normalized 𝒩 readout in both families below.

First join the two pole evaluations by a negative-gradient segment of length L≥0. Its L→∞ boundary is the broken PSS/Morse composition and its L=0 boundary is 𝒩. Second, use the common J₀/K=0 pole discs and frames to smooth the nodal pair by `z₊z₋=τ≥0`. On the two punctured local discs put `z₊=exp(2π(s₊+it₊))` and `z₋=exp(−2π(s₋+it₋))`; positive τ implies t₊=t₋ modulo1. Construct the positive-ray smoothing family and its deformation to the s-independent continuation identity. All ends use Hdt and the fixed markers; coordinate changes have specified comparison, face/cocycle and determinant laws. At each finite energy prove the actual gluing neighborhoods for both sides using their own analytic bubble exclusion, cylinder breaking/gluing, Morse gluing and stationary inverse.

Orient the Morse-length interval by increasing L and the smoothing/identity interval by decreasing τ, with the nodal end as its positive boundary. Use the full standard kernel/functionals/coevaluations and fixed family readouts of 7.C.2a. At L→∞ use the actual first-projection Morse graph χ_M and its stable-complex comparison, retaining both pole normal factors. At L=0 and τ=0 use the identical positive-first matching `ev₊−ev₋`; both yield the same normalized 𝒩, including cap classes. The stationary reference comparison consumes the separately proved inverse for the identical nondegenerate stationary cylinder of 7.C.2; the Morse-side two-marked sphere endpoint is a different input. At the stationary end use γ_min and the specified family factor, giving Id_CF. Prove these simultaneous raw determinant identifications from their stabilized exact sequences, then their agreement with actual regular gluing. At fixed total cap/class and finite energy the resulting geometric Hom boundary readouts have the forms `d𝓗_L+𝓗_Ld=F∘G−𝒩` and `d𝓗_τ+𝓗_τd=𝒩−Id_CF`, with degree-one raw count-functional readout `(-1)^(n+1)`. Their geometric nodal terms cancel. After support and matrices exist, these are the corresponding module equations and their sum is the Floer inverse homotopy. Resolve every matrix product by the finite-below convolution before making that algebraic interpretation. The Morse inverse separately uses its two-pole zero core and q_min broken-face insertion. Every family uses the fixed convention before counting.

The true endpoint data and finite-energy gluing estimates are inputs to relative-family regularity and each branch’s PSS geometric inverse boundaries. Cylinder fixed-class boundaries, ordinary continuation data and the Γ=0 reflection bridge use only their own cylinder/continuation constructions. The geometric inverse boundaries feed PSS support, then its matrices, and then the R[Γ] or completed inverse equations in 7.C.6; they are not already equations between undefined matrix series.

**7.C.3c. Face-flat relative perturbations.** For each branch construct the selected regular individual continuation sections, their rigid geometric count coefficients, zero-/one-dimensional oriented compactifications and finite-below support from their own Morse-free cylinder/continuation data. Assemble their actual maps and chain-map equations only in the matrix stage. Construct homotopy/composition true faces from these selected geometric pieces, raw cylinder comparison templates, cylinder breaking/gluing, stationary identity and that branch’s analytic exclusion; no algebraic composition equation is needed to specify a broken face. PSS relative faces separately insert their selected plane/Morse pieces and endpoint theorems. Prove each prescribed true-face operator and matching problem regular. Compatible raw jets extend to a base family in the actual product-collar and compatible-J charts before generic face-flat interior selection.

Construct the relative separable complete real Banach carrier using smooth local Hamiltonian one-form/δH_s and compatible-J chart directions in free domain/target/interior parameter charts. Each testing element vanishes on its own neighborhood of the true faces and the fixed pole/end regions; their supports together meet every free interior parameter arbitrarily close to the faces. Retain all face-free mixed coefficient derivative suprema, weighted L^q norms, linear operator controls, exhaustion seminorms and global integrated curvature controls above. Conditional gluing gives positive locally bounded functions G_(E,j)≥1 on specified larger collars `0<x<2x₀(E)`, and on larger product collars `0<x_i<2x₀,i(E)` at corners. Take their weighted suprema on the closed outer subcollars `0<x≤x₀(E)` and `0<x_i≤x₀,i(E)`: `sup G_(E,j)(x)(∏_i x_i^(−m))|∇^j e|`, with the declared domain/target/parameter charts and derivatives. Specify a smooth cutoff ϑ valued in [0,1], equal to1 on this closed outer subcollar and supported in the larger collar with x_i<3x₀,i/2. Define the global extension Ĝ=1+ϑ(G−1) there and Ĝ=1 off that support. Include the corresponding global weighted norms using the declared chart cutoffs and the ordinary face-distance weights; use a locally finite fixed chart system and its stated norm comparison constants. Thus the global norm is defined everywhere, and its weights are positive and locally bounded away from true faces. A compact-library support away from true faces meets each closed outer subcollar in a compact subset of its larger open collar, so all these weighted norms are finite. Use coefficient suprema/Fatou and dense tests for linear operators to prove their lower semicontinuity. The same ℓ¹ synthesis and closed-kernel quotient give the complete separable smooth carrier, convergence in every controlled norm, all-order face flatness and compatible corner jets. Derive its finite-C^ℓ nonlinear section/evaluation estimates by the stated chain-rule/Sobolev–Moser theorem. Small balls preserve the global curvature and energy allowances. Its G weights come from the earlier conditional gluing estimates.

At every interior parameter the localized δK or δH_s directions detect adjoint cokernels, including constant maps and matching constraints. Form the actual J_(p,s,t) simple-sphere/marked-incidence families frozen at each attachment, and the PSS J_(p,z) versions, with shared core/sphere/evaluation variations and prescribed true-face strata. Prove their combined universal transversality, simple-image reductions, finite differentiability budgets and countable simultaneous selection; with their own shared-J theorem. At true faces use their previously selected regular operators and sphere-incidence data. Perturbations have all-order flat jets on true faces. From these weighted errors and conditional gluing construct a cutoff width ε(E)>0 at R=0, a Floer-neck threshold T(E), and a Morse-length threshold L(E), in their respective declared charts, below every inverse/contraction/onto-neighborhood error tolerance and within every required derivative budget. Counts/boundaries are coefficientwise at finite energy. Positive monotonicity supplies the separately proved cylinder/continuation or PSS finite counting-budget ceiling, with Morse data used only by the latter; spherical-c₁-zero keeps cutoff dependence.

Now prove the branch-specific regular compact zero-dimensional and oriented one-dimensional boundary theorems. The cylinder theorem has index1 rigid quotients and index2 broken boundaries, removing trivial levels by their actual equivalence.

Per branch, continuation/homotopy, PSS and inverse-endpoint geometric boundaries consume cylinder breaking/gluing, their own analytic exclusion, actual regular true faces and finite-energy neighborhoods, shared orientations, Morse factors and stationary identity exactly where used. Prove the cylinder fixed-class boundary theorem before parameter/PSS boundaries and geometric rigid support. After the relevant support theorem constructs the matrices, these same oriented boundaries give their chain-map, square-zero, composition and inverse equations. The two branches share earlier floors but retain independent analytic consequences and concrete exports. Compactifications here have precisely the dimensions needed for these classical counts and identities.

**7.C.4. Coherent counts and continuation.** Work first over 𝔽₂, then use the shared cap/determinant/Morse orientation lines of 7.C.2a for integer counts and outward-first broken boundaries. Use its quotient-then-negative-flow ordering and explicit parameter/end-reversal laws; convert a translation-first auxiliary formula by the specified (−1)^(dim quotient) factor. Extend counts by actual scalar maps to each commutative ground ring R. Orientation generators give matrices and their changes give explicit diagonal sign maps.

For each fixed generator pair and recapping class define the rigid index-one quotient count coefficient with the ordered orientation lines. First prove its geometric finite-below support in 7.C.6 and assemble the degree−1 matrix d over that branch’s ring. The signed index-two fixed-class boundary then gives d²=0, with sums interpreted through the proved support/convolution theorem. For previously selected individual continuation data retain the energy formula
`E=A_(H₊)(x̃₊)−A_(H₋)(x̃₋)−∫∂sH(s,t,u)`,
count the compact rigid index-zero sections on their parametrized domain at each cap/class, prove their own support and assemble the degree-zero continuation matrix after the differential’s coefficient module exists. Constant data give the stationary identity through its actual inverse/orientation comparison. Homotopy/composition true-face selection uses those earlier geometric sections; its fixed-class boundary theorem and support construct the degree-one homotopy matrices. Only after all participating matrices exist prove chain-map, composition, independence and inverse equations in the branch ring. Derive actual Hofer cutoff shifts, cap equivariance and support bounds from the raw energy and count geometry; no completed identity is a support premise.

**7.C.5. Small autonomous trajectories and the later Morse specialization.** For sufficiently C²-small autonomous Morse H construct compatible J with `(H,g_J)` Morse–Smale by a localized positive-gradient realization. Prove all one-periodic orbits are constant and compute μ=`ind(H)−n` using the cap frame. For an actual t-independent Morse trajectory prove its Floer linearization is surjective: in a t-independent trivialization the zero Fourier mode is the Morse operator, while nonzero modes have the `2π` gap and the proved small-coefficient perturbation estimate. Include its right inverse and determinant orientation comparison. This proves regularity of the t-independent trajectory locus.
Use the independent auxiliary pair `(f,g)` and comparison complex M of 7.C.1a. For H=εf with ε>0 sufficiently small prove the positive-rescaling normalization and compatible Morse–Smale realization. Construct the bijection between t-independent Floer cylinders and upward trajectories of the realized Morse metric, using τ=εs, with the induced cap classes, quotient translations and the determinant orientations fixed in 7.C.2a; prove the ordinary Morse-continuation comparison between the realized metric and the auxiliary metric, using HF Lane M1–M5, with its signs. The comparison concerns this t-independent trajectory locus. The PSS homology comparison is a separate construction with its own branch prerequisites.

**7.C.5a. Autonomous translation and time-rotation dimensions.** On smooth finite-energy cylinders for these autonomous data with the fixed constant asymptotic ends and fixed capped relative class, define commuting actions `T_a u(s,t)=u(s+a,t)` for `a∈R` and `R_θu(s,t)=u(s,t+θ)` for `θ∈R/Z`. They preserve the equation; their isotopies preserve the capped class relative to the constant end caps. Prove smoothness on the actual finite-dimensional regular moduli spaces after elliptic bootstrapping. The fixed locus of the whole `S¹` time-rotation action is exactly `u_t=0`; its Floer equation is the specified positive-gradient Morse equation, so its elements are the upward Morse trajectories already treated above.

For a non-time-invariant cylinder, `u_s` and `u_t` are linearly independent as global tangent vectors. If `a u_s+b u_t=0` with constants `(a,b)≠(0,0)`, `a=0` gives time invariance, while `b=0` makes the map independent of `s` and hence constant by its asymptotic ends. If both are nonzero, `u` is constant along the domain flow in direction `(a,b)`; iterating toward a constant asymptotic end and using uniform convergence in `t` forces the whole cylinder to be constant. If a stabilizer element has nonzero `s`-translation, iterate it in the direction of one constant asymptotic end. The end convergence is uniform in `t`, so the stabilizer equation forces the entire cylinder to equal that constant end; this excludes every such element without assuming an `s`-period. Thus on the non-time-invariant locus the `R×S¹` orbit has dimension two and its remaining time-rotation stabilizer is finite. Conditional on surjectivity of the actual autonomous linearization, a non-time-invariant cylinder has Fredholm index at least two; regular index-one cylinders are time-independent. The dimension conclusion is conditional on that actual regularity. The homology comparison is the separate PSS theorem.

**7.C.5b. PSS maps and equivalence.** Construct the PSS/inverse matrices from the regular basic punctured sections and their branch-specific energy/support bounds. The Morse-side inverse uses its broken PSS composition and the true zero-cutoff Morse identity end, with the full ordered Morse/cap calibration of 7.C.2a and its explicitly constructed equation d𝓗_M+𝓗_Md=PSS⁻¹∘PSS−Id_M. The Floer-side inverse uses the same nodal chain map 𝒩 in the finite-Morse-length and positive-smoothing-ray homotopies; their signed nodal boundaries cancel, leaving the stationary Floer identity. Face-flat relative regularity, the finite-energy neighborhoods and signed boundary theorems give both coefficientwise homotopy equations. Obtain the branch-specific chain-homotopy equivalence: integer-graded at the finite Laurent stage, complete ν-filtered and ℤ/(2N_C)-graded after nonzero-monotone completion, and integer-graded in the c₁-zero and Γ=0 lanes. The specified output is the module chain-homotopy equivalence.

In the spherical-c₁-zero completed lane, the integer-graded homology comparison is HF_i≅H_(i+n)(X;Λ_R). Over a field 𝕜 it identifies with H_(i+n)(X;𝕜)⊗_𝕜Λ_𝕜; over other R such a tensor description requires a proved homology base-change hypothesis. Use the actual base-changed chain homotopies for their equations.

In the nonzero positive-monotone Laurent lane, write HF_i^cyc for homology after t↦1 and prove HF_i^cyc≅⊕_(j≡i+n mod2N_C)H_j(X;R). On Γ=0 choose the spherical-c₁-zero PSS construction of this item as the single common MODULE-comparison construction for HF_i≅H_(i+n)(X;R). Its phase inputs are the independent auxiliary Morse comparison, actual raw cylinder/plane/nodal/inverse operators, finite end/Morse data, selected regular true faces/interiors, branch compactness, simultaneous determinant realization, geometric support and both inverse boundaries. None is obtained from standing Layer7.4's comparison readout. First construct that equivalence and common continuation/PSS data, then compare the Γ=0 finite-Laurent readout and the standing reflected complex through the actual equation/cap/reference/degree/determinant dictionary of 7.C.0, quotient-then-negative-flow orientation reversal and coefficient identity Γ=0. Prove the chain and continuation diagrams, including their actual degree sign, before the two displayed homology readouts. The integer formula has no premise from two separately assumed equivalences. Standing all-dimensional corner-chain, all-free-loop atoroidal and Liouville outputs retain their distinct construction hypotheses and scope.

**7.C.5c. Relative autonomous virtual comparison.** On an actual finite energy/class/index window with prescribed isolating compactified interfaces, construct the compact Hausdorff pair (Z,∂Z), cap/end/reference labels and full allowed-bubble topology. Consume ASM M3 only for its unforced marked components; construct the actual punctured/inhomogeneous attachment application.

For every nonconstant holomorphic sphere bubble choose codimension-two target discs transverse at all their preimages, away from nodes/marks/critical values with compact buffers. Retain the FULL finite unordered preimage sets, actual automorphism/permutation extensions, incidence motion, forgetting and coordinate-change compatibility; stabilize constant ghosts by actual special flags or their specified normalization/contraction. Such target cuts are used only at genuine rank-two transverse points. For rank≤1 inhomogeneous/autonomous cylinder cores use the fixed cylinder/end-marker carrier instead: at a nonstationary reference construct an R-translation slice from a compactly supported configuration-chart functional whose translation derivative is ∫χ|u_s|²>0, with IFT, parameter/scale differentiability, slice transitions and broken/glued compatibility. Stationary cores use their separate invertible block, not a free R slice.

Construct finite-dimensional obstruction maps and compatible finite-group thickenings on these carriers. Prove conditional gluing for the ACTUAL extended operator, including obstruction parameters, incidence and normalization constraints, matching/extra factors and regular product/projection maps, with the requisite derivative-loss budgets, determinant/normal exact sequences and orientations. This is a thickened application of the analytic gluing estimates, not a consequence of unthickened regularity alone. Construct zero-fibre quotient identifications, open regular loci, extra-factor freeness, footprint coverage and every V1 relative/product axiom. Supply V6's actual finite cell-like closure/normal-incidence data for fixed, broken, allowed-bubble and nonfixed interface pieces.

Construct transport of these atlas, obstruction, orientation, coordinate-change, forgetful, neck/end-marker and relative data under the global S¹ time rotation. The identity (u∘ρ)⁻¹(D)=ρ⁻¹u⁻¹(D) proves only the auxiliary-set part. Nonfixed slices retain their actual finite stabilizer representations; at S¹-fixed autonomous cores construct an equivariant cokernel/obstruction lift and all transition diagrams. Positive-dimensional global S¹ isotropy is distinct from the finite reparametrization groups in V1. The analytic construction and its actual oriented thickened gluing precede the generic virtual engine and do not assume classical counts or closed GW atlases.

Apply ImplicitAtlases V0–V6 on these actual inputs. Its principal output is a rational functional on the specified degree-d relative Čech cohomology with orientation coefficients, obtained from the virtual cochain comparison and normalized trace. Construct the application maps of trace complexes and coefficient/pair diagrams whose evaluations on the finite Floer generator kernels give relative boundary count functionals. On regular pieces prove normalization with the actual ordered determinant count; for comparison perturbations construct actual refinement/concordance/cobordism witnesses and their continuation extension. Use V5’s boundary/cobordism laws only after those witnesses exist. A singular-homology realization uses the stated finite-CW target/Čech-singular/UCT hypotheses and is not asserted on an arbitrary wild source. Any chosen chain representative or splitting has its explicit maps, degree/sign and homotopy independence; no canonical source singular chain is inferred from the dual-Čech VFC.

On an isolated compact non-time-invariant sector with locally free circle action, prove properness and construct transverse finite-isotropy quotient charts using the actual slice theorem, descended obstruction representations, orientation/local-system lines and all coordinate/gluing/refinement compatibility. Construct the quotient implicit atlas with virtual dimension one less, retaining each finite stabilizer. Positive-dimensional stabilizers at the fixed locus lie in separate relative interface data, not in these finite-group charts. Construct the equivariant circle-transfer/Gysin-to-trace comparison, with rational 1/|Γ| normalization, or specified coefficients in which all relevant stabilizer orders are units. Prove that the original expected-zero sector functional factors through the negative-degree quotient functional; its vanishing then follows from V’s ordinary negative-Čech-degree theorem. The free-action integral specialization requires its own integral comparison and orientation data. Interfaces with fixed, broken or other isolating boundaries remain in the relative equation. Compare to the supported regular time-dependent continuation/count matrices via the constructed regular-normalization and concordance trace diagrams; prove compatibility across energy cutoffs and reference caps. This is a qualified relative comparison/isolated-sector cancellation theorem. It is not an unqualified identity for raw nonfixed coefficients, nor a consequence of PSS or the conditional regular orbit-dimension lemma alone.

**7.C.6. Geometric support, finite Laurent and completed matrices.** Apply MorseNovikov N1 with ν=−ω:Γ→ℝ only after the geometric support hypotheses are proved. For output recapping B the matched-cap energy is `E=A_H(x̃₊)−A_H(x̃₋)+ν(B)`; continuation, PSS, nodal and homotopy versions retain their actual global error bounds. At a fixed ν cutoff use their own energy-cutoff compactness and rigid-dimensional exclusion of nontrivial breaking/bubbling/parameter-boundary limits to prove finitely many rigid coefficients below that cutoff, including dense period image. These inputs are the geometric sections, fixed-class oriented boundaries where needed and cap/index data, not completed chain equations. First prove cylinder/individual-continuation/relative-cylinder support; separately prove PSS/nodal/both-inverse-homotopy support with their own endpoint/Morse/parameter data. Construct the actual finite-orbit modules, reference-cap coordinates and diagonal monomial changes. Build the differential and all participating maps/homotopies as supported matrices in their concrete ring, then read the finite geometric boundary identities as matrix equations using N1’s finite-below convolution. Aggregate support is an export of the independent concrete support results.

**7.C.6a. Positive-monotone bare coefficient model.** Before matrices specialize the early datum: ω=κc₁ implies kerω∩kerc₁=kerc₁, so c₁ identifies Γ with N_Cℤ, or Γ=0. Give e^B degree2c₁(B). This algebra uses cap/branch data alone and is available to fixed-class geometry without any completed count package.

**Positive-monotone finite Laurent matrices.** Use the respective geometric support to construct cylinder/continuation matrices and, separately, PSS/inverse matrices over R[Γ]. A homogeneous entry has at most one exponent by the degree equation. For Γ≠0 choose the positive-Chern generator t, deg t=2N_C and ν(t)=−κN_C<0, so t⁻¹ has positive valuation. The coefficient differential is zero and a Morse tensor generator has degree j−n+2c₁(B). Construct each finite homogeneous matrix before reading its own boundary identities or extending coefficients.

**7.C.6b. Finite-Laurent chain identities.** Prove `d²`, continuation chain-map/composition/homotopy equations and their orientation-line signs over `R[Γ]`, using the monotone cylinder/count and parameter-boundary targets. This proof is the finite-Laurent monotone construction.

**7.C.6c. Finite-Laurent PSS equivalence.** With the actual injective-Chern Γ model and monotone matrices/support, prove PSS and inverse matrices are chain maps. Prove the Morse-side inverse from its broken composition and zero-cutoff Morse identity end; prove the Floer-side inverse from its broken composition and its separately constructed nodal/positive-ray/stationary identity end. Each consumes its own monotone endpoint/parameter boundaries together with monotone cylinder identities. Use the two constructed finite-Laurent homotopies for the inverse equations. This gives the chain-homotopy equivalence to M⊗_R R[Γ] before completion.

**7.C.6d. Complete filtered cyclic grading after monotone completion.** After 7.C.6b–c, extend the finite matrices and specified homotopies along R[Γ]→Λ_R=Nov(R,Γ,ν), ν=−ω, using N1. For Γ≠0 set d_C=2N_C. Give Λ_R degree zero modulo d_C and each finite reference orbit/Morse generator its μ or j−n residue. The completed module is finite free over Λ_R with these residues. Define F^aΛ_R by support in ν≥a, give the finite generator module its product filtration and prove it complete and separated. A map T has its proved finite shift δ_T, meaning T(F^a)⊂F^(a−δ_T); the differential and specified homotopies carry their own such shifts. Cap changes give diagonal monomial maps with their actual finite shifts. A series may have infinitely many integer degrees; this completed theory is ℤ/d_C-graded. Differential, maps and specified homotopies are continuous with the proved filtration shifts and residue degrees −1,0,+1. Prove completeness, cap-change compatibility and continuity from the finite matrices/support bounds. Extend the finite-Laurent equivalence and both actual homotopies to a complete ν-filtered ℤ/d_C-graded Λ_R-module chain-homotopy equivalence with correspondingly regraded M⊗_RΛ_R. Γ=0 retains integer grading and R coefficients. The integer finite-Laurent theory and its cyclic t↦1 specialization remain separate outputs; no t↦1 map on Λ_R is asserted.

**7.C.6e. Spherical-c₁-zero bare model and completion.** Before counts, c₁|S_sph=0 gives kerω∩kerc₁=kerω, so ν=−ω identifies Γ with its real period subgroup; all coefficient degrees are zero. This is an early datum, not a matrix theorem. Use cylinder/continuation support to construct their completed matrices and only then read their own finite-cutoff boundaries as d²/continuation equations. Independently construct the PSS/inverse matrices from their support and derive their equations from the c₁-zero PSS boundaries and BOTH endpoints. Finitely many orbit generators give the usual integer grading with a finite underlying degree set. This separate completed lane includes positive sphere areas; index alone supplies no energy bound.

**7.C.6f. Laurent cyclic specialization and the completed-unit obstruction.** On the finite ring `R[t,t⁻¹]`, the ungraded map `t↦1` gives the finite cyclic complex and PSS comparison graded modulo `2N_C`; retain the integer grading when `Γ=0`. For any nonzero unital `R` and `ν(B)>0`, N1 makes `1−e^B` a unit, so a unital map from the entire completion to `R` sending every monomial to1 cannot exist. The cyclic specialization is consequently defined on the finite Laurent ring.

**7.C.6g. Field adapter and Arnold bound.** Assume every contractible one-periodic orbit of H is nondegenerate. For a field 𝕜 and injective ν, factor a nonzero series at its unique least-period element B₀ as `c e^(B₀)(1+b)` and invert the strictly-positive-support `1+b` by N1, including dense period image. This field adapter applies only where ν:Γ→ℝ is proved injective; Γ=0 gives 𝕜. For the positive-monotone Arnold bound use the finite-Laurent PSS equivalence, followed by the permitted `t↦1` specialization: the resulting cyclic 𝕜-chain complex has rank equal to the number of contractible periodic orbits, and its homology is the cyclic direct sum of H_j(X;𝕜), with total dimension the total 𝕜-Betti rank. The finite-dimensional chain-rank inequality gives `#{contractible 1-periodic orbits}≥Σ_j dim_𝕜 H_j(X;𝕜)`. For spherical-c₁-zero use the actual Novikov field adapter and completed PSS equivalence, which has that finite homology rank; Γ=0 is the ordinary 𝕜 case. The monotone comparison uses its Laurent-only specialization and the c₁-zero comparison uses its field adapter. Over arbitrary rings retain `H_(i+n)(X;Λ_R)` separately and require a proved base-change hypothesis for any tensor-product homology description.

**7.C.6h. Arbitrary critical number and the degenerate comparison statement.** Consume [MorseTheory M4](../MorseTheory/README.md)'s single `c(M)` construction: the attained minimum of the finite critical-point counts of all smooth real functions on a compact boundaryless manifold, with infinite critical sets counted in ℕ∞. It is not the minimum restricted to Morse functions. That owner also constructs the arbitrary-function LS lower bound from the [AT categorical-cover/cup-length supplier](../AlgebraicTopology/README.md), without a Morse approximation of the function being bounded.

For any closed finite-dimensional symplectic M, define `degenerateArnoldCriticalNumberStatement` to assert that every smooth Hamiltonian isotopy from the identity to φ satisfies `((c(M):ℕ):ℕ∞)≤(Fix(φ)).encard`, where fixed points count once. Retain this as the precise source conjecture/comparison statement, separate from the nondegenerate theorem of7.C.6g; no general theorem or present research-status conclusion is asserted here. Any theorem realization requires its actual additional scope and proof, not nondegenerate perturbation followed by a fixed-point count limit.

Construct the autonomous case independently of Floer counts. For smooth time-independent H on closed M, `dH=ι_(X_H)ω` and nondegeneracy give `dH(p)=0 iff X_H(p)=0`. ODE uniqueness makes the orbit through such p constant, so `Crit(H)⊆Fix(φ_H^1)`. If Crit(H) is finite, M4's minimum gives `c(M)≤#Crit(H)≤#Fix(φ_H^1)`; if it is infinite, the inclusion makes the fixed-point count∞. This proves the stated autonomous lower bound, including empty, disconnected and zero-dimensional cases through M4's own conventions. Conversely, time-one fixed points need not be equilibrium points. The general time-dependent comparison retains all source scope but is not inferred from this autonomous argument, LS alone, or the earlier Betti-rank estimate.

**7.C.7. Scope and application interfaces.** Export the cap/seam/index dictionaries, rigid counts, specified continuation maps/homotopies, cutoff estimates, finite Laurent specialization, completed PSS equivalence and Arnold inequality. Keep target hypotheses, nondegeneracy, compatible data, actual regular true faces, face-flat interiors, per-energy gluing neighborhoods and coherent orientations as separate inputs/conclusions. The scope exclusions are those stated at the beginning of this roadmap. Export the early cap/coefficient-torsor datum independently of the later injective-Chern and injective-period branch models; Laurent or completed matrix consumers use the model proved in their own branch.

### 7.T. Floer–Novikov torsion and its periodic-flow correction

Construct the abelian Floer–Novikov torsion application for a nonempty closed connected boundaryless smooth symplectic manifold `(M^(2n),ω)`, n≥1, and a smooth symplectomorphism f, with a chosen component C of its twisted loop space. Require the actual finite-dimensional Hausdorff second-countable structures. The main geometric range is **w⁺-monotonicity**: `ω(A)>0` for each spherical integral class A with `0<c₁(TM)(A)≤n−2`, in the source's specified symplectic/Chern convention. Construct the convention comparison below before using this hypothesis in a native index or bubble calculation. The zero-dimensional point model is separate. Construct the regular-data and Hamiltonian-connected invariance theorem in7.T.8; the stronger monotone symplectic-isotopy theorem is a separate7.T.9 target.

This is a classical count-dimensional application, not an extension of Layer8's all-dimensional DG-coefficient theory. G0–G7 supplies its reusable seamed carrier and local analytic comparisons, not a w⁺ compactness/exclusion theorem; 7.C supplies reusable raw operators and orientation templates, not its contractible cap quotient, branch exclusions, PSS equivalence or a torsion invariant. No noncompact/no-escape, general virtual, unrestricted Lagrangian, nonabelian Whitehead, arbitrary integral-zeta or higher-parametric torsion theorem is inferred.

**7.T.0. Exact suppliers and construction direction.** Consume [MorseNovikov N1,N4](../MorseNovikov/README.md) for period-controlled Novikov rings, finite convolution, completed finite-orbit modules, rational exp/log, total quotients and their field components, ordered determinant/torsion comparisons, finite-cyclic norms and cutoff topology. N6 owns the finite-dimensional closed-one-form bifurcation application. Reuse its algebraic identities where their hypotheses are established, not its finite-dimensional moduli argument as a Floer theorem. Construct the finite-parity application of the determinant comparisons in7.T.4; do not call a two-periodic complex a bounded integer complex. Consume [HF F0,F1,F2](../HeegaardFloer/README.md)'s actual Banach/Sobolev, unique-continuation, local CR, index and determinant interfaces. HF's invertible-end exponential theorem does not supply the degenerate polynomial-end theory constructed in7.T.6. Use the existing DG/bundle/AT compact smooth-manifold and covering interfaces for mapping tori, section bundles, finite CW homology and characteristic classes. This application owns the seamed nonlinear, sphere-incidence, periodic-flow and bifurcation constructions at the range below. Construct them before invariance; an invariant value or later torsion computation is never a regularity, compactness or gluing premise.

**7.T.1. Actual section cover, finitely generated deck group and index.** Instantiate S0’s same mapping-torus carrier at native monodromy `ψ_native=f⁻¹`, construct its displayed closed-interval comparison `T_f=(M×[0,1])/((x,0)~(f(x),1))`, and construct the W^(1,2) component C of its sections containing a specified smooth γ₀, with smooth/Sobolev and seam comparisons. This has source seam `γ(1)=fγ(0)`: the equivalence is `(x,0)~(f(x),1)`. The native S0/G0 carrier has seam `γ(1)=ψ_native⁻¹γ(0)`, so it is instantiated at `ψ_native=f⁻¹`, not at f. Construct the actual quotient/seam identification `[γ(t),t]↦[t,γ(t)]`, its inverse and local smooth charts. Its vertical bundle transition is df, matching `dψ_native⁻¹`; pull back the fibre form, seam-matched X/J, reference section/frame, sweep/period maps and covering/deck/Chern data through this identification. A loop of sections s↦γ_s sweeps `F(t,s)=[γ_s(t),t]` in T_f. Orient its source by **dt∧ds**, the circle coordinate t before the loop-of-sections coordinate s, and define `im:π₁(C,γ₀)→H₂(T_f;Z)` by this oriented torus and `H=im(im)`. Construct the mapping-torus boundary map ∂f with `∂f(im[γ_s])=[s↦γ_s(0)]`. Let V=ker(dπ:T(T_f)→TS¹) with its fibre symplectic form ω^f. Choose a native positive compatible I on V, with metric ω^f(·,I·), and define the canonical symplectic Chern class `c₁^f=c₁(V,I)` and `ψ_c(A)=⟨c₁^f,A⟩`. Prove independence of I by the compatible-structure homotopy. This pins the source canonical c₁(K) comparison: the metric variable J_L used below is −I, so `c₁(V,J_L)=−c₁^f` and is not silently substituted for c₁^f. Pin `c₁(TM)` in w⁺ by the same positive-compatible fibre restriction. Prove H finitely generated as a subgroup of the finitely generated abelian H₂ of this compact finite-CW-type mapping torus; do not assume π₁(C) itself is finitely generated or replace H by its torsion-free quotient. Construct the actual H-cover by the kernel of im, path lifting, local reference transport and the deck action.

Let X_t be a smooth seam-matched symplectic vector field. Put `θ_(X,t)=ι_(X_t)ω`, retain its flux and define the closed action one-form

`Y_X(γ)(ξ)=−∫₀¹ω(γdot,ξ)dt+∫₀¹θ_(X,t)(ξ)dt`.

Construct its period character `P_X:H→R` from the actual swept integral, prove it factors through H, and construct a primitive A_X on the H-cover with `dA_X=Y_X`. Pin the deck convention by `A_X(A·x̃)=A_X(x̃)+P_X(A)`; then `N_X=−P_X` is the Novikov character. For `θ_X=∫₀¹θ_(X,t)dt`, derive the exact source area/flux formula `P_X(A)=−⟨[ω^f],A⟩+⟨[θ_X],∂f A⟩` from this dt∧ds sweep. Changing its orientation changes the character and its explicit exponent isomorphism, not the same completion by fiat. The reference section/frame determines the relative index. Define the deck spectral-flow character `ψ:H→2Z` on the actual self-adjoint end family; prove the source identity `ψ=2ψ_c` with the above canonical complex-bundle and dt∧ds conventions, its evenness and relative-index recapping formula. Construct its comparison with HF's single frame/Chern/CZ construction, retaining every actual change of source, end and frame convention. Set `K=ker ψ`. Retain torsion in H and K and all finite ties or dense images of N. Neither K nor this cover is the spherical cap quotient Γ of7.C.

**7.T.2. Metric, flow, end and determinant dictionary.** Construct the source-compatible complex directly. Its compatible structure J_L defines the positive-definite symmetric metric `g_L(v,w)=ω(J_L v,w)`. Use the actual metric dual `V_X=Y_X^sharp`, the elliptic formal-gradient equation `u_s+V_X(u)=0`, and the energy `E=∫|u_s|²`. Construct the loop-space weak differential and derivative-loss statement, not an ODE flow on an infinite-dimensional Banach manifold. In these conventions prove `θ_X^sharp=−J_L X` and

`u_s+J_L(u_t−X_t)=0`,  `E=A_X(x̃_−)−A_X(x̃_+)`.

The source-compatible input is the negative end, output the positive end. For `J_D=−J_L`, prove `g_L(v,w)=ω(v,J_Dw)` and that `v(s,t)=u(−s,t)` solves the displayed DGF PDE with J_D and the same X. In a Hamiltonian chart, Y_X agrees with the differential expression of7.C's A_H; reference constants remain explicit. Write the source arrow as `x_−→x_+`, with u(−∞)=x_− and u(+∞)=x_+. Then v(+∞)=x_− and v(−∞)=x_+: the native capped7.C positive-input arrow is `v_+→v_−=x_−→x_+`, the same generator arrow. In contrast the standing negative-input arrow is `v_−→v_+=x_+→x_−`, so that comparison requires the actual transpose/dualization. Do not force dualization in the capped branch merely from s reversal. For a closed source sweep write `F(t,s)=[u(s,t),t]` on the ordered domain `(t,s)` with orientation dt∧ds. After reflection define `G(s,t)=[v(s,t),t]=F(t,−s)` on the native ordered domain `(s,t)` with orientation ds∧dt. The coordinate map `(s,t)↦(t,−s)` has determinant +1, so these two oriented swept classes agree under the actual quotient identification; their ω-densities agree because `ω(v_s,v_t)=ω(u_t,u_s)`. In contrast the fixed-order sweep `F_v(t,s)=[v(s,t),t]=F(t,−s)` on `(t,s)` reverses orientation and negates the source class. These are different ordered carriers, not a blanket negative native class. For an open cylinder define the relative swept class with its actual end boundaries and attach the chosen source reference caps; transport those caps, their boundary orientations and extending frames through the displayed quotient map and the positive-determinant `(s,t)↦(t,−s)` identification to define the corresponding native capped carrier. Prove its equality to the transported source capped class in that declared reference system, recording separately any deck/reference-cap changes. A standing negative-input dual-complex readout still reverses the generator arrow and requires its own basis/deck/determinant comparison; it does not negate a native ds∧dt swept class merely by naming the opposite input. Construct the resulting actual maps of section/cap covers, deck characters, coefficient rings/localizations, reference bases and determinant lines. Compute the induced dual-complex, parity-shift and torsion inversion/sign formula using N4's ordered determinants, including the sign/deck ambiguity and the nonacyclic-zero components. Do not assert unchanged torsion or I_F from identical orbit sets, parity, or an ordinary continuation equivalence.

Construct the Chern comparison for the positive-compatible vertical bundle (V,I) on source T_f and native `Y_(f⁻¹)`, its conjugate symbol bundle (V,J_L), and the actual extending-frame loop; it must verify the pinned source c₁^f/ψ formula and fix the signed native-index equality, not introduce a second CZ invariant or leave a free ± convention. Use a fixed end trivialization, the native small-rotation and scalar-crossing references, and the quotient-followed-by-negative-flow and outward-first parameter conventions of7.C.2a to fix the comparison. Derive closed-orbit determinant orientations and the finite-cyclic action sign from these actual reference diagrams. Source s-parametrizations and classes may be used throughout the torsion construction until this uniquely specified native comparison is proved. No convention adapter is a hypothesis that grants the final invariant.

**7.T.3. w⁺ raw cylinders and regular-data theorem.** Construct seam-compatible J/X coefficient spaces and their localized Hamiltonian variations, all finite-order Sobolev section/evaluation charts and Fredholm/adjoint estimates, with the actual common-domain end realizations and explicit parameter/Sobolev differentiability budgets from F0/F1. Raw fixed-class energy-cutoff compactness, conditional gluing and the sphere-incidence problems precede regular selection. Construct the w⁺ semipositive sphere reductions and the joint t-parametrized sphere/orbit/core evaluation theorem, retaining equal-t shared structures, simple-image/cover reduction and the limiting bubble trees. For end orbits construct the low-Chern sphere avoidance needed by the count-dimensional theorem; do not assume it from nondegeneracy. Pin the finite count range explicitly. Write r for the source capped relative Fredholm index, p∈{0,1} for the finite external parameter dimension counted once, and reserve q>2 for the Sobolev exponent. A nonconstant translation-invariant cylinder has unreduced dimension r+p and reduced dimension r−1+p. Fixed differential/broken-boundary windows are (r,p)=(1,0),(2,0); slide/adjacent-family-boundary windows are (0,1),(1,1). An s-dependent continuation equation has no translation quotient: use dimension r+p, with (0,0),(1,0) for map/boundary and (−1,1),(0,1) for chain-homotopy/boundary. Prove negative-dimensional emptiness only for the actual regular realizations. Degenerate endpoints use the upper/lower end indices and polynomial realization of7.T.6, not the nondegenerate formula by declaration. The periodic-flow windows are specified in7.T.5. No all-index or higher-parameter simultaneous regularity is asserted by this lane.

Construct the joint sphere matching in these actual windows, not a blanket parametric avoidance assertion. A simple one-marked sphere of Chern number c in the common t and P fibre has dimension 2n+2c−3+p before matching to the end-orbit graph; its incidence with that graph has expected dimension **2c−3+p**. For fixed data c≤1 gives a negative dimension; for p=1,c=1 it is zero. Retain those possible zero-dimensional family end incidences in the admissible stratification and prove their actual exclusion from, or contribution/description in, the required compactified count/event boundaries. Do not infer their absence from the fixed-data inequality. Distinguish avoidance of the Chern-zero sphere-image set M₀(J_t) by the selected cores and ends from fixed-data Chern-one end avoidance. For an interior sphere bubble on a regular nonconstant cylinder, the remaining core has index r−2c; adding its free attachment point and the marked sphere and matching gives r−3+p, two below the main reduced dimension. Prove the analogous two-dimension drop for a regular nonstationary periodic core. These expectations do not settle covers, stationary/collapsed cores, trees or degenerate-end matching: construct their reductions, positivity/energy and index comparisons separately. Include stationary and constant-core configurations through their actual invertible or degenerate models. The positive-monotone energy ceiling, c₁-zero index argument and spherical-aspherical exclusion from other lanes are not this proof.

On each fixed class/energy window within the preceding finite index/parameter range prove the actual conditional range theorem, proper-window openness, density/smoothing and countable simultaneous selection in its stated constrained coefficient spaces, preserving seam/end/relative germs. Closed orbits require7.T.5's extra multiple-cover theorem. Prove existence of the regular pairs and endpoint-relative admissible homotopies used below from these constructions. “Regular” records specified operator transversality and nondegenerate finite asymptotics; it must not be defined to mean that compactness, all bifurcation conclusions or invariance already hold. Prove the finite critical-section theorem by identifying the generator component as a clopen subset of the compact fixed-point set of `f⁻¹∘Φ_X¹`, where Φ_X is the actual time-dependent symplectic flow; nondegeneracy then gives finiteness.

For regular fixed data construct the cylinder zero-dimensional translation quotient, compactified one-dimensional quotient with its broken boundary and coherent orientation lines. Prove finite rigid counts at every energy cutoff, integral class addition, reference changes, support and the signed square-zero equation after the matrices exist. Construct the actual supported w⁺ continuation and homotopy maps needed for comparisons of regular data and for endpoint/event limits, with finite integrated Hamiltonian derivative/curvature budgets. This does not import PSS or a module comparison into a non-Hamiltonian component. No all-dimensional corner or higher-DG export is asserted by these count-dimensional outputs.

**7.T.4. Finite based parity complex and total quotients.** Apply N1 to the actual finite-orbit cover and N_X|K. Construct the source-compatible finite free parity complex `CF_even↔CF_odd` over `Λ_F=Nov(Z,K,N_X|K)`, using integer lifts in a fundamental index interval and a generator for ψ(H) when that subgroup is nonzero; treat ψ=0 without choosing a nonexistent positive generator. Construct its differential by the actual deck/reference index selection, not by infinite summation of all integer shifts into one parity generator. Prove every reference/lift/order change and the relation to the relative integer complex. This is a finite parity object, not the infinite repeated Z-graded complex viewed as finite.

For each field component of `Q(Λ_F)`, apply N4's short-exact-sequence determinant comparisons to the two cycle/boundary sequences, in the fixed even-then-odd order. Construct the resulting parity determinant readout and its basis-change and dualization formulas. On an acyclic component take its scalar torsion, normalized by `τ(0→F --a→ F→0)=a⁻¹` for the odd-to-even differential. On a nonacyclic component set the scalar0 and retain the determinant-line refinement separately. The zero chain complex is acyclic and has τ=1. Define τ_F in the WHOLE total quotient with its sign/deck-monomial orbit action, not in its units; mixed zero/nonzero components are allowed. Construct its ambiguity under reference frames, index shifts, orientations and chosen lifts.

Use N4's actual `Localization(nonZeroDivisors)` and finite characteristic-zero field decomposition. Construct the maps from the integral completion to its rational-coefficient completion and their total quotients, proving preservation of nonzerodivisors and component compatibility from the finite-torsion/kernel splitting and actual support. Do not identify rationalized completed series with an unrestricted algebraic tensor product. For cutoff limits use N4's embedding into the larger Novikov rings over kernel-field coefficients, with the specified splitting-independence; no unsupported valuation on the raw total quotient is assumed. Generic Novikov/localization/determinant theorems stay with MN; this lane owns their parity and Floer reference/basis application.

**7.T.5. Periodic formal flow and rational zeta.** Construct solutions on `S¹_T×S¹`, T>0, with seam f in t, in the specified C sector. Include T as an actual parameter by rescaling s/T and computing the period derivative of the section. Remove stationary solutions before the circle quotient. The s-translation circle may have a finite stabilizer of order mult(u); construct local slices and distinguish a simple closed formal flow from its parametrized covers. These objects are not merely fixed points of f or geometric unparametrized tori with their multiplicities forgotten. The torus map to T_f defines A∈H. With the actual period T variable the unreduced Fredholm dimension is ψ(A)+1+p and the locally-free translation-circle quotient has dimension ψ(A)+p; no additional period dimension is added afterward. Fixed rigid counts use ψ(A)=0,p=0 and their family cobordisms ψ(A)=0,p=1. Because ψ is even, negative ψ gives negative reduced dimension in these p≤1 regular windows. Prove the rigid closed-flow classes therefore lie in K, with energy `E=N_X(A)>0`, using the signed comparison of7.T.2. Higher periodic indices remain in the raw carrier but are not assigned an all-index regularity theorem here.

Own the Taubes-type simultaneous multiple-cover regularity application: decompose the linearized operators on all finite cyclic covers of a simple periodic flow into actual representation spaces, construct the allowed localized variations and their coupled annihilator/range theorem, and achieve simultaneous regularity for the required class/period/cutoff windows. Ordinary simple-cylinder injective-point regularity is not this theorem. Prove the determinant orientation is grading-compatible, compute the stabilizer action, and define the signed rational weight `sign(u)/mult(u)` only on the resulting isolated reduced solutions.

Construct energy-cutoff compactness with period and derivative bounds, exclusion/description of T→0 and T→∞ limits, sphere attachment/breaking and the w⁺ low-dimensional incidence exclusions of7.T.3. For T→∞ retain cyclically broken trajectories and their class/period matching; no compact fixed-domain torus theorem supplies this end. Prove finitely many rigid reduced solutions below each energy cutoff and that the coefficient sum has strictly positive finite-below N-support. Use N1 to define

`η_F=Σ_(A∈K,A≠0)(Σ_[u]∈Mhat_O(A) sign(u)/mult(u)) e^A`,

`ζ_F=exp(η_F)∈1+Nov^{>0}(Q,K,N_X|K)`.

Construct ζ_F's actual reference/gauge laws and rational coefficient map. Integral cylinder counts do not make ζ_F integral: no integral product formula or integral virtual/stabilizer cancellation is asserted. Compare the geometric torus in `S¹×T_f` with its formal-flow class and orientations, without identifying this count with an arbitrary genus-one GW or TG zeta invariant.

**7.T.6. Relative bifurcation and degenerate-end analysis.** For arbitrary regular endpoints with fixed f,C and Hamiltonian-connected X, construct the existence of a specially admissible one-parameter J/X path relative to whole endpoint collars. First construct a semipositive path and regular critical-section family, isolate its kernel-one birth/death points and impose the required local normalizations; then prove genericity only in the successive declared constrained perturbation spaces preserving the already fixed endpoint, critical-set and finite-jet data. No genericity theorem for every unconstrained path or automatic normal form of such a path is asserted. Retain the actual fixed-cohomology action character, finite derivative budgets and simultaneous cylinder, closed-flow and sphere-incidence equations. At each energy/period cutoff prove event isolation and control; do not assume the full parameter interval has only finitely many events. Construct the regular homotopy of Floer systems with simple birth/death points, TypeI slides between distinct generators and TypeII self-slides to deck translates, and its broken-trajectory/closed-orbit strata.

At a birth/death prove the actual kernel-one crossing and nonzero quadratic fold normal form of the nonlinear section, including parameter transversality. In a fixed end chart write the formal gradient as A_y μ+n_y(μ). Choose a unit e_y∈ker A_y with positive projected quadratic coefficient κ, and construct the center graph tangent to e_y and its exponentially controlled transverse complement. Construct the permitted endpoint-relative changes giving J integrable and parameter-independent near the finite degenerate critical graphs, positive quadratic coefficient, the required vanishing mixed/cubic center jets and a nonzero parameter derivative along e_y supported away from other critical points. These are finite-jet normalization/application targets with actual section and error estimates, not assumptions hidden in “admissible”. If using substitute local charts instead, prove the same derivative-loss and nonlinear estimates rather than inferring them from a formal normal form.

For a nonzero center-amplitude positive-end trajectory, prove in the declared end chart, for s sufficiently large and k=0,1,2, the two-sided bounds `c_k(1+s)^(−k−1)≤||∂_s^k μ(s)||_(H^(2−k)_t)≤C_k(1+s)^(−k−1)`. The scalar center equation β′=−κβ²+O(β³) and the transverse decay estimates supply this route. A nonconstant trajectory approaching in a transverse stable direction can instead decay exponentially: do not claim the polynomial lower bound from kernel-one degeneracy alone. Construct the separate exponentially weighted realization for this branch. Derive the source endpoint grading ν_L from the single HF index, rather than introducing a second CZ invariant. In the chosen frame use `A=−I∂t−S`, source operator `E_L=∂s+A` and, after s reflection with exchanged ends, the HF operator `D_HF=∂s−A`. Construct their actual seam/frame/reflection and extending-reference comparison and define `ν_L(A)=c_ref−CZ_HF(A)` in that transported reference system. Fix c_ref before counts from one chosen nondegenerate reference and the scalar-crossing/frame calibration, and prove its compatibility with deck, cap and frame changes; it is not an independently adjustable constant at each end. For ε>0 smaller than the nonzero spectral gap put `ind_+(y)=ν_L(A_y−ε)` and `ind_−(y)=ν_L(A_y+ε)`. The HF normalization is `CZ_HF=−μ_RS`: shifting A to A−ε shifts S to S+ε, so the one-dimensional zero crossing gives `CZ_HF(A−ε)−CZ_HF(A+ε)=−1`, and therefore `ind_+−ind_−=+1`. Prove this scalar-crossing/sign comparison with the same HF index and actual reflected end order; do not assert the positive jump for CZ_HF itself. The upper relative index is `r=ind_+(x)−ind_−(y)`; for nondegenerate ends this agrees with the earlier r. Strong exponential decay uses `e^(ε|s|)` on each selected degenerate tail and therefore changes the negative-end index from ind_+ to ind_− or the positive-end index from ind_− to ind_+, one unit per such end. Construct these conjugation/index comparisons on the actual domains. In the selected fixed-degenerate windows with upper relative index r≤1 and no external parameter, prove the actual spectral-shift, range and regularity comparison: imposing strong exponential decay at k_d≥1 degenerate ends lowers the unreduced index by k_d, so its free-translation quotient has dimension r−k_d−1<0. Establish this emptiness only where the actual end realization and constrained perturbations give that formula. Outside such a proved exclusion retain and analyze the exponential branch. This is not a higher-parameter exclusion theorem.

On the polynomial branch set `Π_L(s)ξ=||u_s(s)||_(L²_t)^(−2)⟨u_s(s),ξ(s)⟩_(L²_t)u_s(s)`, and Π_T=1−Π_L. Choose a positive locally Lipschitz weight σ_u, constant on the nondegenerate far end and equal to `||u_s(s)||_(L²_t)^(−1)` on the degenerate tail, with a positive compact interpolation. Prove `σ_u(s)≍(1+s)²` and the required derivative/projection bounds from the fold estimates; pin connection/chart changes and any smoothing of the weight. For q>2 define W_u and L_u by completing compactly supported smooth sections in the actual distinct norms

`||ξ||_(W_u)=||σ_u^(1/2)ξ||_(W^(1,q))+||σ_u ∇_s(Π_L ξ)||_(L^q)`,

`||η||_(L_u)=||σ_u^(1/2)η||_(L^q)+||σ_u Π_Lη||_(L^q)`.

These W_u norms are norms for differences and tangent sections relative to a polynomial reference germ, not for displacement from the zero-end constant y: μ(s)≍s⁻¹ has σ_u^(1/2)μ≍1 and does not belong to that L^q space on an infinite tail. Construct actual affine local configuration charts `u(s)=exp_(u_ref(λ;s))(ξ(s))` on the tail, with an explicitly constructed polynomial reference germ u_ref, its residual in the declared target and ξ in the weighted difference space. Translation variations u_s≍s⁻² fit the model. Leading asymptotic coefficients or moving ends not represented by W_u are separate finite-dimensional reference-germ parameters, with their actual derivative, matching and index contribution; include each existing external parameter only once. Prove the residual/parameter maps, transition differences and nonlinear section derivative are bounded into the claimed target, including cancellations required for a varying leading1/s term. Do not assert that exp_y⁻¹(u) lies in a growing-weight zero-end space, or infer this affine realization from a printed fixed-reference commensurability claim. Prove that the linearized operator W_u→L_u is bounded/Fredholm with the declared upper/lower end index, and construct its kernel/cokernel splitting, adjoint estimates, these parameter-dependent affine charts and nonlinear remainder bounds. A reference-end realization or another equivalent weight requires an actual norm-equivalence proof with the projection derivatives, not substitution of a reciprocal power. At a negative degenerate end use the reversed coordinate; when both ends degenerate construct compatible tail weights and longitudinal projections independently. Pin finite differentiability orders and constants uniformly only on the chosen quantitative finite-cutoff chart families, allowing the explicit pregluing rescalings. HF's zero-end exponential obstruction is not repaired by merely adjoining an exponentially weighted kernel variable. Construct these degenerate-end spaces and their actual nonlinear chart comparisons before pregluing.

Construct pregluing, approximate cokernel/Kuranishi projections where needed, scaled right inverses, nonlinear correction, uniqueness and onto-neighborhood theorems at birth/death and handle-slide configurations. Include the long-period closed-orbit limits through the degenerate point, all multiply broken return words and their cutoff estimates. Prove determinant orientation/gluing with the actual parameter, translation, end and cyclic-stabilizer factors. Use the source-compatible degree order fixed in7.T.2–4 before deriving event signs, not an unspecified post-count sign. These are new nonlinear application constructions, not an assumed theorem package attached to the name RHFS.

For each TypeII slide in A with N_X(A)>0, let T be the finite torsion subgroup of H and define div(A)>0 as the divisibility of its nonzero image in H/T. Construct the **nonequivariant perturbation property NEP**. For every prescribed finite cutoff and sufficiently small isolating parameter window, and every H-adapted slide-breaking finite cyclic cover of C with monodromy `π_m∘ν∘im`, a primitive integral homomorphism `ν:H→Z`, `ν(A)=div(A)` and `m>1` with `m∤div(A)`, construct an endpoint-relative cutoff-regular perturbation of the lifted formal flow. Derive its actual section/compactness/error controls, including any nonlocal loop-chart Hamiltonian variation needed to separate the lifted branches; an arbitrary configuration-space vector field is not an admissible elliptic perturbation by declaration. It need not descend to a local Hamiltonian on M. Prove its agreement with the unperturbed lift outside the chosen inner parameter window and its compatibility with the finite-cutoff deck/reference comparisons. Construct such connected degree-m covers using a primitive ν on the nonzero free part of A; N_X(A)>0 excludes torsion A. Retain the source-adapted cover comparison for a nonprimitive integral ν as well: use its actual image in Z/m, actual connected-component degrees and relabeled deck actions, and assemble the componentwise perturbations and orientation/norm comparisons. Do not call a non-surjective monodromy cover connected of degree m. Prove the reduction rather than discarding the additional adapted covers. For norm/cancellation arguments select the covers killing the finite torsion subgroup, as required by N4. Reuse N6's finite-cyclic algebra only after these Floer-specific perturbation and gluing hypotheses are established.

**7.T.7. Event formulas, zero branches and completion limits.** Derive the actual oriented boundary identities for the regular homotopy before claiming invariance. A TypeI slide gives the specified elementary based change and no zeta jump. Fix increasing parameter λ and first an actual **death** at λ₀, with regular λ_−<λ₀<λ_+. On the minus side choose the disappearing lifted generators z⁺,z⁻ of source integer indices i,i−1, respectively, with local differential z⁺→z⁻ and reference sign normalized so its coefficient is 1+b. Define b, of strictly positive N-order, by the actual oriented return words in that entry. The plus complex has the pair removed. In the ordered block differential `[[1+b,v],[w,N]]` construct its Schur complement `N−w(1+b)⁻¹v` using N1. Prove the componentwise multiplication identities

`τ_+=(1+b)^((-1)^(i+1)) τ_−`,  `ζ_+=(1+b)^((-1)^i) ζ_−`.

Ratios are permitted only in a nonzero acyclic field component. For an increasing-parameter **birth**, use the same pair/reference data on the plus side and prove the inverse factors, equivalently the preceding identities with plus and minus interchanged. For an odd upper index i, the elementary disappearing odd-to-even map a=1+b has τ_−=a⁻¹ and τ_+=1, so the death torsion factor is a. These two factors cancel in I_F, but are not separate torsion invariances.

At a TypeII slide construct the full positive-order self-slide series and the changed based differential, retaining all higher coefficients. Prove its zeta factor cancels its determinant/torsion factor by NEP on the finite cyclic covers and the N4 norm/trace/log identities, using the geometric leading coefficient and cutoff stability. A first-order coefficient calculation is not an all-order cancellation proof. Where a component torsion is nonzero, cancel only in that field component with N4's proved nonvanishing norm comparison. For a nonacyclic component use the actual event chain equivalence to retain nonacyclicity and prove `0·ζ_+=0·ζ_-=0`, with no quotient by τ=0. Retain partially acyclic components rather than replacing the whole value by0. Use the same multiplication identities in reference/lift transports.

Construct cutoff-compatible endpoint/event-limit matrices and their supported chain homotopies to neighboring regular complexes to establish that the acyclic component set remains fixed at those limits. Prove total-quotient cutoff continuity and convergence of the successive event products in N4's larger componentwise Novikov embeddings. Derive invariance on the whole compact parameter interval from the finite-cutoff identities; do not apply a finite-event induction globally or assume completeness of the total quotient from completeness of Λ_F. Finally quotient the result by its actual simultaneous sign/deck ambiguity.

**7.T.8. Corrected Hamiltonian-connected invariant.** After the preceding constructions define

`I_F=τ_F ζ_F ∈ Q(Nov(Q,K,N_X|K))/(±e^K)`.

Prove that for fixed w⁺ M,f,C and any two constructed regular pairs `(J₁,X+χ_H₁)` and `(J₂,X+χ_H₂)`, the two I_F values agree after the explicit reference/coefficient identification. The actual endpoint-relative admissible-path existence theorem, with genericity only inside its constructed constrained perturbation classes, produces the comparison; no theorem hypothesis is an arbitrary record containing all desired compactifications or the final equality. Derive independence from the auxiliary regular J and Hamiltonian perturbation and the corresponding Hamiltonian-isotopy transport of f,C, with the actual loop-component action and deck/flux diagrams. An ordinary continuation chain homotopy equivalence alone is not an invariance proof for τ_F; the correction and event calculations are essential. This is the bounded Floer analogue of the source's torsion remark, independent of Layer8's Serre/family endpoints.

**7.T.9. Separate monotone strengthening and checks.** When M is positively monotone in the source's actual spherical sense, construct the additional period/flux comparison and co-directional-family argument giving a rational group-ring value

`I_F^{f,C}(M)∈Q(Z[K])/(±e^K)`

whose image under `i_(−P_X)` is the constructed completed I_F for every regular pair. Include the zero-character to nonzero-character comparison through N1/N4's actual group-ring/total-quotient embeddings; arbitrary changing flux does not give identical completions. Prove invariance under symplectic isotopies with transport of f and of C by the actual π₁(Symp₀) action. Keep this stronger statement distinct from7.T.8's fixed-period Hamiltonian-connected equality. Construct the source's identity-isotopic, basepoint-orbit specialization to the included classical abelian torsion of M only after its actual reference/period and finite-dimensional MN comparison; it is not a definition of I_F or a generic PSS consequence.

Retain the separate connected zero-dimensional model: M is a point, f=id, C has one section, H=K=0, and N_X=ψ=0. With the fixed zero-index reference its parity complex is `CF_even=Z, CF_odd=0`; after localization its even homology is Q, so τ_F=0. There are no nonstationary periodic formal flows, hence ζ_F=1 and I_F=0; a field ground change gives the same calculation with that field as the even module. This is not the zero chain complex. Check N_X|K=0 (the positive-energy identity excludes nonconstant closed formal flows, so ζ_F=1), the zero complex (τ=1), nonacyclic field factors (τ=0), the acyclic elementary odd-to-even map (τ=a⁻¹), mixed field components, finite torsion in the deck group, a birth/death with nonzero return series, and a TypeII event whose all-order correction is visible. Check reference/lift changes and s-reversal on the actual based determinant formulas. These algebra/geometry checks do not assert an integral zeta formula, quantitative fixed-point bound, a nonabelian s-cobordism theorem or equality with a general genus-one curve count. Follow [Lee I](https://arxiv.org/html/math/0111313v3), especially2.1–2.3,3.3,4–6, and [Lee II](https://arxiv.org/abs/math/0505013) for the degenerate gluing/orientation construction targets. The representative Suggested interfaces remain nonexhaustive; this section requires the actual section/moduli/coefficient carriers before any additional native invariant signature is introduced.

## Layer 8: the DG Floer toolset

1. **Representing chain systems for Floer moduli spaces.** Consume standing Layer7.2's ALL-dimensional aspherical/atoroidal topological corner compactifications, ordered orientations and product faces, then Layer0's relative fundamental-chain theorem. Construct existence (Proposition3.4/Definition3.5) and uniqueness up to homology (Proposition3.6). The count-dimensional module equivalence of 7.C.5b is not this all-dimensional carrier input.
2. **The Barraud--Cornea twisting cocycle** in `C_*(Ω𝓛X)`: Definition 3.7, the twisting equation
   of Proposition 3.8, uniqueness up to homology of Proposition 3.9.
3. **The DG Floer complex** (Definition 3.12) and its independence of `(J, Ξ)` up to chain homotopy
   equivalence (Proposition 3.13).
4. **Continuation.**
   - Representing chain systems for continuation moduli spaces (Proposition 3.14,
     Definition 3.15) and their uniqueness (Proposition 3.16).
   - Continuation cocycles: Definition 3.17, Propositions 3.18 and 3.19.
   - The continuation map (Definition 3.21) and its filtration estimate (Proposition 3.22),
     including the functions that correct the action along continuation cylinders.
   - The monotone and Hofer-norm corollaries (Corollaries 3.24 and 3.25).
   - Uniqueness up to homotopy (Proposition 3.26).
   - The identity (Proposition 3.27, Corollary 3.28) and composition (Proposition 3.29).
5. **Homotopies.**
   - Representing chain systems for parametrized moduli spaces (Proposition 3.30).
   - Parametrized cocycles (Definition 3.31, Proposition 3.32).
   - The chain homotopy between continuation maps (Definition 3.35).
6. **Closed manifolds.**
   - Continuation maps are homotopy equivalences (Proposition 3.36).
   - `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` in the contractible component (Theorem 3.37).
   - The canonical filtration (Definition 3.38) and the spectral sequence with
     `E² = FH_*(H; H_q(𝓕))` (Theorem 3.39).
   - Theorem J: for a Serre fibration `F → E → 𝓛₀X`, `FH_*(H; C_*(F)) ≅ H_{*+n}(E|_X)`,
     compatibly with the cubical Serre spectral sequence of Layer 0 item 3.
7. **Symplectic homology** `SH_*(W; 𝓕)` with DG coefficients for a Liouville domain.
   - The zero-energy identification `SH^{=0}_*(W; 𝓕) ≅ H_{*+n}(W, ∂W; i_W^*𝓕)`
     (Proposition 3.44), which defines `i_{W*}`.
   - The long exact sequence (Proposition 3.45).
   - The Viterbo transfer (Proposition 3.46).
   - The spectral sequence (Theorem 3.49). For a Liouville domain `W` and a DG local system `𝓕`
     on `𝓛W`:
     - (i) *existence*: a canonical spectral sequence `E^r_{p,q}`, `r ≥ 2`, with
       `E²_{p,q} = SH_p(W; H_q(𝓕))`, where `H_q(𝓕)` is the classical local system on `𝓛W`;
     - (ii) *convergence to `SH_*(W; 𝓕)`* under either (A) `H_*(𝓕)` is bounded below and
       `SH_*(W; H_q(𝓕))` is bounded below uniformly in `q`, or (B) both are bounded above
       (uniformly in `q` for `SH`). Existence does not need the bounds.
     - Check: `H_q(𝓕)` supported in `q ≥ 0` with `SH_p(W; H_q(𝓕))` supported in `p ≥ 0` satisfies
       (A). Support on the line `p = −q` has no uniform lower bound in `q`, so it satisfies
       neither (A) nor (B) and convergence is not claimed.
8. Source: the source paper §§3.3--3.7.

## Layer 9: the Viterbo isomorphism

1. Construct the degree-zero Viterbo twist η₀ on 𝓛Q, equal to the source's underlined η in §§1.5/4.1, and the canonical grading of Floer homology of T*Q (§4.2). Let o_Q be AT's orientation local system in degree zero. Define σ by monodromy (−1)^⟨w₂(TQ),Γ_*[T²]⟩ along a loop of loops with adjoint Γ:T²→Q. Put w(γ)=0 when γ*TQ is orientable and −1 otherwise, and
   `η₀=σ⊗ev₀*(o_Q^−1)⊗ev₀*(o_Q^(−w))`.
   Prove component/local-system, monodromy, tensor and coefficient-extension laws using actual w₁/w₂ and orientation-line transport, including nonorientable Q. Keep the source's graded twist η_gr=η₀[n], supported in degree−n, separate from η₀. Fix homological shifts C[n]_j=C_(j+n), d_[n]=(−1)^n d and construct the tensor/shift comparison: on a homogeneous fibre element α of degree p its map 𝓕⊗η_gr→(𝓕⊗η₀)[n] has the Koszul factor (−1)^(np). Compare the DG action, differentials and raw determinant equations through this same map. All unshifted Viterbo formulas below use η₀, with the index/determinant normalization proved accordingly. `T*Q` with `ω_can` is exact, and `T(T*Q)` restricted to the zero section is
   `TQ ⊗ ℂ`, so the Chern numbers of all surface maps vanish; this verifies the smooth asphericity
   and atoroidality conditions. The canonical grading is compared with the grading of the standing
   conventions.
2. **Classical Viterbo with local coefficients.** For every classical local system `L` on `𝓛Q`,
   `SH_*(T*Q; Π*L) ≅ H_*(𝓛Q; L ⊗ η₀)`. The proof is by hybrid Floer-to-Morse moduli spaces in the
   finite-dimensional approximation (Abbondandolo--Schwarz, as organized in Abouzaid).
3. **Theorem K.** For a DG local system `𝓕` on `𝓛Q` with `H_*(𝓕)` bounded below,
   `SH_*(T*Q; Π*𝓕) ≅ H_*(𝓛Q; 𝓕 ⊗ η₀)`. The steps, in the source's numbering:
   - the half-cylinder moduli spaces `𝓜(x)` and their dimension and orientation lines
     (Proposition 4.6);
   - their representing chains `s_x` (Proposition 4.7) and the equation `∂m_x = Σ m^(η₀^−1)_{x,y} m_y`, where `m^(η₀^−1)_{x,y}=Φ^(η₀^−1)(m_{x,y})` uses the degree-zero inverse-monodromy local system. The source abbreviates this Φ^(η₀^−1) by Φ^η; the graded η_gr and item1’s tensor/shift comparison enter only the actual graded determinant readouts
     (Proposition 4.9);
   - the hybrid moduli spaces `𝓑(x; y)` (Proposition 4.10), their representing chains
     (Proposition 4.11), evaluation maps (Proposition 4.13) and the equation for `b_{x,y}`
     (Proposition 4.14);
   - the finite-dimensional approximation of the source's §4.3 (Abouzaid §11.2): the manifolds
     `𝓛ʳQ` and the maps `ιʳ`, `geoʳ` of Layer 5 item 6, and the sampling maps
     `evᵣ : 𝓛Q → Qʳ`, `γ ↦ (γ(0), γ(L_γ/r), …, γ((r−1)L_γ/r))`, which are continuous on the Moore
     space because the duration `L_γ` is. The source's Lemma 4.5 is replaced by the
     **compact-family approximation lemma**: for a compact `K ⊆ 𝓛Q`, durations are bounded on `K`
     and `K` is equicontinuous (Arzelà--Ascoli), so there is `r(K)` with `evᵣ(K) ⊆ 𝓛ʳQ` for
     `r ≥ r(K)`, and `geoʳ ∘ evᵣ|_K` is homotopic to the inclusion of `K` through the canonical
     homotopy that moves each arc `γ|_{[(i−1)L_γ/r, iL_γ/r]}` to the minimizing geodesic between
     its endpoints inside a convex ball and interpolates the durations linearly. It is natural in
     `K`. It shows that `colim geoʳ : colim 𝓛ʳQ → 𝓛Q` is a weak homotopy equivalence (Abouzaid,
     Proposition 11.2.4), which suffices by Layer 1 item 2: surjectivity on `π_k` by applying it
     to the image of a sphere; injectivity by applying it to the image of a nullhomotopy in `𝓛Q`
     of `geoʳ ∘ σ`, for `σ : S^k → 𝓛ʳQ`, together with a homotopy inside `𝓛^{r'}Q`, for
     `r' ≥ r` large, between `ev_{r'} ∘ geoʳ` and the iterated `ι`, which slides the sample
     vertices along the broken geodesic while the consecutive distances stay below the cut (this
     is where the monotonicity `δᵢʳ ≤ δⱼʳ⁺¹` of the cutoffs is used). Part 1 of the source's
     Lemma 4.5, the retraction of the Moore loops of length `≤ L` onto the unit-speed ones, is
     false on the Moore carrier (standing conventions) and is not consumed by the source: its only
     use, in the proof of Lemma 4.15, is `geoʳ ∘ evᵣ ≃ id` on the compact set
     `⋃_x π ∘ Im ∘ q̄_x(𝓜̄(x))`, which the compact-family lemma supplies;
   - the finite-dimensional reduction (Lemma 4.15);
   - the chain map `Ψ̃^r` (Proposition 4.16).

   The map is an isomorphism by comparison of index spectral sequences, whose `E²` map is item 2.
4. Construct the zero-energy part of TheoremK (Proposition4.1), including i_Q*η₀≃o_Q for the constant-loop inclusion and its actual Thom/shriek diagram:
   `SH_k^(=0)(T*Q;Π*𝓕)≃H_k(Q;i_Q*𝓕⊗o_Q)` and
   `SH_k^(=0)≃H_(k+n)(D*Q,S*Q;π*i_Q*𝓕)`.
   Identify the first map with the orientation-twisted zero-section Thom map of Layer5.3, and prove its inverse and compatibility with the tautological map to full SH. Construct the transfer of DG local systems 𝓛Q→𝓛T*Q (Corollary4.17) with the same η₀ normalization.
5. Source: the source paper §4; Abbondandolo--Schwarz, *On the Floer homology of cotangent bundles*
   and its corrigendum; Abouzaid, op. cit., Sections 5--8.

## Layer 10: the criteria and their applications to cotangent bundles

1. **Theorem L (= Theorem 5.1)**: let `Σ ⊂ W` be a closed hypersurface in a Liouville domain
   bounding a relatively compact open `U`. If some DG local system `𝓕` on `𝓛₀W` and class
   `α ∈ H_*(W, ∂W; i_W^*𝓕)` satisfy `j_{U!}(α) ≠ 0` and `i_{W*}(α) = 0`, then the contractible
   almost existence property holds near `Σ`: for almost every `c` in a neighborhood of the level,
   the level set contains a periodic orbit contractible in `W` (for the Hamiltonians of
   Layer 6 item 5). Check: `α = 0` has `j_{U!}(α) = 0`, so the criterion rejects it. Proof
   through:
   - the relative capacity bound (Proposition 5.5);
   - the fast-orbit lemma (Lemma 5.7);
   - the spectral invariants `ρ(·, σ)` and their properties (Proposition 5.8).
2. **Theorem M (= Theorem 6.4)**: if some DG local system `𝓕` on `𝓛₀W` and class
   `α ∈ H_*(W, ∂W; i_W^*𝓕)` satisfy `j_!(α) ≠ 0` and `i_{W*}(α) = 0`, then the
   `π₁`-sensitive Hofer--Zehnder capacity is finite, `c°_HZ(W) < ∞`, and in particular the
   contractible almost existence property holds in `W`. Check: `α = 0` is rejected. Proof through
   the capacity bound `c°_HZ(W) ≤ c(α)` (Proposition 6.6).
   The cotangent form of Theorem M is Proposition 6.7.
3. **The cotangent criterion** (Proposition 5.9).
4. **The kernel of `i_{Q*}`.**
   - For a path-connected `Q`, `Ω²Q` is path-connected with the homology of a point if and only if `Q` is a `K(π,1)` (Lemma 3.41); the connectedness of `Ω²Q` supplies `H₀`.
   - Proposition 5.11: the kernel of `i_{Q*}` contains an infinite cyclic group, a copy of
     `π_k(Q)`, or a class that is not `d`-torsion, according to the first nonvanishing higher
     homotopy group.
   - `ker π_{U!}` is `d`-torsion (Proposition 5.13).
5. **Theorems A, B, C** in their general forms (Theorems 5.10, 5.14, 5.15), with the degree
   hypotheses stated homologically: `deg(π ∘ φ)` by `(π ∘ φ)_*[S] = d · [Q]` over `ℤ`, and the mod-2
   degree by the same equation with `𝔽₂`-fundamental classes from the algebraic topology
   roadmap's Stage 6. **Corollaries D and E**, from
   Layer 6. The `𝔽₂` stage of Layers 5 and 7--9 is enough for Theorem C.
   - **Multiple realization and Theorem5.14/TheoremB.** Consume the designated GC Thom/collapse/stabilization/finite-duality comparisons and G5 rational spectral Hurewicz, then TB B5's geometric PT and B6.3's rational SO-bordism orientation surjection, retaining their actual early mapping-path/Thom/Layer1.2/1.4 inputs. On a smooth boundaryless U lift α⊗1 to a finite rational bordism combination. Clear denominators and then kill the finite-order torsion difference to obtain a closed oriented finite disjoint union S and continuous f:S→U with f_*[S]=Nα, N≥1.

     Construct the compact-image embedding here: choose finitely many target charts φ_i and smooth supported cutoffs ρ_i near f(S), with Σρ_i>0 on W, and define e(x)=(ρ_i(x),ρ_i(x)φ_i(x))_i, extending each supported block by zero. Where ρ_i>0 the ratios recover φ_i; this proves injectivity, continuous local inverse and, by differentiation, immersion. Restrict a precompact neighborhood of the image if required. GT supplies the actual normal tube of this embedding, with positive uniform radius on the compact core. Smooth e∘f on S by partitions/mollifiers closely enough for the tube, project back and construct the small homotopy in U. A fixed-relative version supplies its own collar data. DG supplies the partition/smoothing floors; the finite-chart embedding is this application's construction, not GT's output. Then φ_*[S]=Nα and the representing-witness argument gives degree Nb≠0 from π_(U*)α=b[Q]≠0. Layer10's all-dimensional DG trajectory/chain inputs come from Layers7.2/8/9; its module-comparison corollaries use the actual common readout only on its specified overlap. No integral every-class realization is asserted.
   - **Theorem 5.15 (Theorem C)** uses the mod-2 vanishing theorem of Layer 1 item 4 in place of the
     source's class `{G | G ⊗ ℤ/2 = 0}`. With `Y = Ω₀Q`, simply connected because `π₂(Q) = 0`: if
     `H̃_*(Ω₀Q; 𝔽₂) = 0`, every `π_i(Ω₀Q) = π_{i+1}(Q)` is uniquely 2-divisible, contradicting
     `π_ℓ(Q) ⊗ ℤ/2 ≠ 0`. The rest of the proof is the source's.
   - **Proposition 5.11, second part,** uses the class of groups annihilated by some power of `d`.
6. Source: the source paper §§5, 6.1--6.2.

## Layer 11: manifolds abundant with 2-spheres, and knotted hypersurfaces

1. **Abundance** (Definitions 1.7 and 6.11), **Theorem H** (= Theorem 6.12), and stability under
   products (Proposition 6.13). A closed connected oriented `n`-manifold `Q` is *abundant with
   2-spheres* if there is a class `α ∈ H_*(Map(S²,Q))` in the total space of the evaluation
   fibration `Map(S²,Q) → Q` such that (i) `α` lives over the fundamental class, i.e. the shriek
   map to a point satisfies `j_!α ≠ 0` in `H_{*−n}(Map_*(S²,Q))`, and (ii) if `deg α = n`, then
   `j_!α ≠ 0` in reduced homology `H̃₀(Map_*(S²,Q))`. Theorem H: if `Q` is abundant with
   2-spheres, then `c°_HZ(D*Q) < ∞` and the contractible almost existence property holds in
   `T*Q`. Check: `Q = Tⁿ` (a `K(π,1)`) has no such `α`, since `Map(S²,Tⁿ) ≃ Tⁿ`.
2. **Fibered families of 2-spheres** (Definition 6.14, Proposition 6.15).
   - Even spheres: the Pontryagin ring `H_*(ΩSⁿ)` as a polynomial ring on the class of the DG
     Morse cocycle (Proposition 6.18). The ring itself is the homotopy spheres roadmap's James
     computation (Stage 3B item 3), using AlgebraicTopology Stage4.4's `reducedSuspensionSphereHomeomorph` and `compactReducedSuspensionCarrierComparison` with the fixed interval-last coordinate order and based reference class, and the sphere-specific comparison constructed above from HomotopySpheres §§3A.1–2's actual colimit-preserving inclusion and pointed suspension cocone, with its quotient/basepoint/reference-generator diagrams; what is proved here, through Layer 5, is that the DG Morse
     class is a generator. Also nonvanishing of the Stiefel class in `H_{2n−3}(Ω²Sⁿ)`
     (Proposition 6.17).
   - Spheres `S^{4k−1}`: the class in `H_{n−2}(Ω²Sⁿ) ≅ ℤ` is a generator (Proposition 6.21).
   - **Sphere bundles over highly connected bases (Proposition 6.23).** Work in the standing
     closed, connected, oriented total-space setting of §6.4.2. A smooth `Sⁿ`-bundle
     `Sⁿ ↪ Q → B`, `n≥2`, whose structure group reduces to `O(n+1)` is the unit-sphere bundle
     of a rank-`n+1` real vector bundle with a fiberwise metric; construct this equivalence and
     the vertical tangent bundle `TᵥQ`. Prove the two alternatives separately:
       * `n` even and `B` is `2n`-connected. The parameter fibre over `q∈Q` is the oriented
         manifold `Stiefel₂(Tᵥ,q)` of ordered orthonormal two-frames in the tangent space to the
         sphere fibre. Put the explicit Example6.16 sphere-family map into these fibres and
         include each sphere fibre into `Q` to obtain `Σ→Q` and `σ:Σ→Map(S²,Q)`.
       * `n≡3 (mod 4)` and `B` is `(n+1)`-connected, with two everywhere independent vertical
         vector fields `u,v`. Normalize them to an orthonormal pair. For `q` in the fibre, put
         `V_x=u(x)⊥` in the ambient rank-`n+1` Euclidean bundle and take the unit sphere in
         `V_x∩v(x)⊥`, the carrier `E_{V_x,x,v(x)}` of Example6.20. Here `x` and `v(x)` are
         orthogonal unit vectors in `V_x`, so this is the equator `S^{n−2}` through `x`; its
         points are sphere-fibre points, not tangent vectors at `x`. Use the explicit two-field
         sphere-family map and the sphere-fibre inclusion to construct
         the corresponding oriented `Σ→Q` and `σ:Σ→Map(S²,Q)`.
     In both cases prove the carrier's orientation and local triviality, continuity/smoothness
     of the family map, compatibility of the fibre map with the based loop inclusion
     `Ω²Sⁿ→Ω²Q`, and nonvanishing of its fibre class. For the even case the fibre class is in
     `H_(2n−3)(Ω²Sⁿ;ℤ)`; `2n`-connectivity gives `π_i(Ω²B)=0` for `i≤2n−2`, hence
     `H_i(Ω²B;ℤ)=0` for `1≤i≤2n−2`, and the Serre spectral sequence gives the inclusion
     isomorphism through degree `2n−3`. For the odd case the class is the generator in
     `H_(n−2)(Ω²Sⁿ;ℤ)`; `(n+1)`-connectivity gives `π_i(Ω²B)=0` for `i≤n−1` and the same
     spectral-sequence comparison through degree `n−2`. Include basepoint-change and coefficient
     maps in these comparisons; do not infer either conclusion from connectivity without its
     looped fibration, Hurewicz, and spectral-sequence argument. Since either connectedness
     assumption makes `B` simply connected and `Sⁿ` has trivial fundamental group, prove `Q` is
     simply connected; use this to trivialize the carrier's orientation local system over `Q`.
     The odd-case two-field condition
     is an actual hypothesis; quaternionic Hermitian sphere bundles are one verified source of
     such fields, not a substitute for the general target.
3. **Covering by diffeomorphisms** (Definitions 6.26 and 6.32, over geometric topology's `Diff(M)`).
   - Abundance of manifolds covered, or `ℓ`-covered, by diffeomorphisms (Propositions 6.29
     and 6.33).
   - **Compact connected Lie groups (Proposition6.31).** Consume LieGroups' public interfaces for the universal cover and discrete central kernel, compact Lie-algebra splitting into center and semisimple derived ideal, simply-connected integration, and Layer6 maximal-torus/root `SU(2)` structure. Build only the needed finite-cover decomposition. Split the compact Lie algebra into its center and semisimple derived ideal; integrate the simply connected factors to identify the simply connected cover as `ℝ^r×K`, where `K` is compact, connected, simply connected and semisimple. Prove `Z(K)` is finite. Its deck kernel `Γ` is discrete and central, hence lies in `ℝ^r×Z(K)`. Compactness of `(ℝ^r×K)/Γ` implies `Λ=Γ∩(ℝ^r×{1})` is a full lattice in `ℝ^r`; projection embeds `Γ/Λ` into the finite group `Z(K)`, so `Λ` has finite index in `Γ`. Since `Λ` is central, the quotient map `(ℝ^r/Λ)×K→(ℝ^r×K)/Γ≅G` is a finite covering `T×K→G`, with `T=ℝ^r/Λ` a torus. Prove finite coverings induce isomorphisms on `π_j` for every `j≥2`. For nontrivial `K`, choose a root `SU(2)` subgroup and prove its map on `π₃` has nonzero image (state the integral homology/`π₃` comparison that establishes this); hence `π₃(K)≠0`. Since higher homotopy of `T` vanishes, derive `G` is a `K(π,1)` exactly when `K` is trivial, equivalently when `G` is a torus; conversely, a finite quotient of a torus is a torus. This proves the non-`K(π,1)` hypothesis in Example6.30 for every non-torus compact connected `G`. Then use `G→Diff(G)` by left translation, its evaluation identity at `e`, and Proposition6.29 to prove Proposition6.31. The product decomposition and its homotopy consequence are the DGF-specific bridge absent from the pinned current LieGroups and CompactGroups statements; all generic Lie, compact representation, and Haar theory stays with those suppliers.
   - **Finite-rank odd-sphere group (Lemma6.35).** For every odd `n≥3`, prove torsion of `π_(n−1)(SO(n))` with finite-rank data, not stable periodicity alone. Give explicit low-rank computations
     `π₂(SO(3))=0`, `π₄(SO(5))=ℤ/2`, `π₆(SO(7))=0`, `π₈(SO(9))=(ℤ/2)²`, and
     `π₁₀(SO(11))=π₁₂(SO(13))=π₁₄(SO(15))=ℤ/2`, including maps/fibration exact sequences that certify each value. For odd `n≥17`, construct the finite-rank comparison/splitting
     `π_(n−1)(SO(n)) ≅ π_(n−1)(O) ⊕ π_n(V_(n+2,2)(ℝ))`; prove the stated stable term is `0` or `ℤ/2` by HomotopySpheres Stage4A–4B's stable real Bott computation and prove the Stiefel term is `ℤ/2` in this range from the named Stiefel fibration/extension data. State the comparison maps and the range in which stabilization applies. The source's Lemma6.35 proof prints `π₈(SO(9))=ℤ/4`; retain that literal value as a source error, not as a theorem target. The corrected value is `(ℤ/2)²`: construct the stabilization `π₈(SO(9))→π₈(SO)=ℤ/2`, its kernel `ℤ/2` and a splitting, as described in [Crowley–Schick–Steimle, proof of Lemma2.2](https://www.researchgate.net/publication/347965860_The_derivative_map_for_diffeomorphism_of_disks_An_example) (arXiv:2012.13634v1). Compare with the `SO(8)→SO(9)→S⁸` exact sequence and `π₈(SO(8))=(ℤ/2)³` to certify the exponent-two result. The other cited values and large-rank splitting remain construction targets with their actual maps, ranges and extension data; a source table alone does not prove them. The torsion conclusion and both proofs of Proposition6.34 retain their full scope.
   - **First proof of odd-sphere covering (Proposition6.34).** Use the evaluation fibration
     `SO(n)→SO(n+1)→Sⁿ` and its exact segment
     `π_n(SO(n+1))→π_n(Sⁿ)→π_(n−1)(SO(n))`. Since `π_n(Sⁿ)=ℤ` and the last group is torsion, the boundary map has a nonzero kernel; exactness gives a class mapping to `ℓ[Id_(Sⁿ)]`, `ℓ>0`. Carry it through the Hurewicz map to `H_n(SO(n+1);ℤ)`, then through the standard action `SO(n+1)→Diff(Sⁿ)` and evaluation to obtain `ev_*A=ℓ[Sⁿ]`. Apply Proposition6.33 using that `π_n(Sⁿ)=ℤ` is not `ℓ`-torsion. Retain the second geometric proof below as a separate complete route, including its degree-2 rotation family; neither proof may stand in for the other.
   - **Second proof of odd-sphere covering (Proposition6.34).** Retain the independent proof already specified: use GT3 and Layer1.6's local evaluation bundle, Layer1.8's fixed-`p` rotation family of degree `1+(-1)^(n−1)=2` for odd `n`, with domain `T¹_pSⁿ×S¹`; construct its homology class and verify its evaluation is `2[Sⁿ]`. Apply Proposition6.33 with the degree-2/non-2-torsion sphere class and its stated homological comparison. This is the direct degree/evaluation proof, with no Pontryagin–Thom or unstable Bott premise.
4. **Homogeneous spaces (Proposition6.36), including `S²=SO(3)/SO(2)`.** For a compact connected Lie group `G` and a closed, positive-dimensional Lie subgroup `H`, define the left actions
   `Φ_H:H×Ω²(G/H)→Ω²(G/H)` and
   `Φ:G×Map(S²,G/H)→Map(S²,G/H)`, and the evaluation fibration
   `ev:Map(S²,G/H)→G/H` with fibre `Ω²(G/H)` over `eH`. Given
   `α∈H_*(Ω²(G/H);ℤ)` such that `(Φ_H)_*([H]×α)≠0`, construct the map of fibrations induced by
   `H↪G→G/H` and `Map(S²,G/H)→G/H`. Prove `j_![G]=[H]` for the fibre inclusion and prove shriek naturality, with the coefficient maps, degree shifts, cross-product signs and basepoint identifications, to obtain
   `j_!Φ_*([G]×α)=(Φ_H)_*([H]×α)`. Because `dim H>0`, verify the source's reduced-homology condition after the degree shift; then show the class lies over the base fundamental class and satisfies Definition6.11.

   The source states the result for every closed `H`, even when `M=G/H` is not orientable, while Definition6.11 is stated for oriented manifolds. Preserve this generality with the evaluation-pullback orientation system `ev*or_M`. Choose a generator `o` of its fibre at `eH` and a left-invariant orientation of `G`. For `π:G→M`, construct the flat trivialization `τ(g)=d(L_g)_(eH)(o)` of `π*or_M`, and prove its compatibility with paths and the action's coefficient map. On `H` it is `τ(h)=χ(h)o`, where `χ(h)` is the sign of the isotropy action on `T_(eH)M`. Compute the fibre-coorientation sign relative to the left-invariant orientation of `H`; it is the same `χ(h)`. Thus the twisted shriek satisfies `j_![G]_τ=[H]` with the ordinary left-oriented fundamental cycle on all components: the two signs cancel. Ordinary untwisted `j_![G]` must not silently be identified with that cycle when the quotient is nonorientable.

   Form `β=Φ_*([G]_τ×α)` in `H_(dimG+degα)(Map(S²,M);ev*or_M)` using the actual action coefficient map, and prove the same square gives `j_!β=(Φ_H)_*([H]×α)` in ordinary homology after the chosen basepoint-fibre identification. Because `dim H>0`, the class has degree above `dim M` and its nonzero shriek has positive degree. Construct the twisted abundance implication by tensoring the path-fibration DG coefficient system in the Theorem6.12 proof with the evaluation-pullback `or_M`, including its restriction along constant loops and the actual chain/transport comparison. Identify the total path-space readout with `H_*(M;or_M)`, whose groups above `dim M` vanish; then apply the already stated nonorientable form of Proposition6.7 with the resulting nonzero shriek and zero constant-loop image. This is an assigned coefficient construction and proof, not an assumption that the oriented theorem already applies. Recover the ordinary oriented statement by an orientation trivialization; no connectedness of `H` is imposed.

   For `S²=SO(3)/SO(2)`, take `α` in `H₀(Ω²S²;ℤ)` represented by a degree-one map. Compute its `SO(2)` action class `α′∈H₁(Ω²S²;ℤ)` and prove it is nonzero by identifying it with the cycle `σ_{p*}[Σ′_p]` of Remark6.19. Under `β_*:H₁(Ω²S²)→H₂(ΩS²)`, identify the class with the Pontryagin square of the generator of `H₁(ΩS²)`. Then compare the resulting `SO(3)` action class in `H₃(Map(S²,S²);ℤ)` with `σ_*[Σ′]`, including orientation choices and the evaluation shriek map. This is the worked instance of the general action/shriek construction, not an appeal to Proposition6.36 alone.
5. **Projective spaces.** `CPᵈ` (Proposition 6.38) and `HPᵈ` and the Cayley plane `𝕆P²` (Proposition 6.39), from Layer 5 item 7. These give **Theorem I** within the scope boundary.
6. **Knotted hypersurfaces.** **Theorem G** (= Theorem 7.1): let `Q^n` be a closed orientable
   manifold containing an embedded sphere `X` of dimension `k ≥ 2` and an orientable
   `(n−k)`-submanifold `Y` with trivial normal bundle, meeting `X` transversely in one point,
   with `Y` `ℓ`-connected for `ℓ = 2k−2` if `k` is even and `ℓ = k−1` if `k` is odd. If `S` is a
   closed orientable `(n−k)`-manifold and `φ : S → π⁻¹(Y) ⊂ T*Q` is continuous with
   `π∘φ : S → Y` of degree `d ≠ 0`, then every hypersurface `Σ ⊂ T*Q` bounding a relatively
   compact domain `U ⊇ φ(S)` has the almost existence property for contractible closed
   characteristics. Check: `d = 0` is excluded. Proof through Proposition 7.5 and
   Lemmas 7.6 and 7.7, using the Pontryagin--Thom collapse of Layer 1.
7. Source: the source paper §§6.3--6.4 and §7.

## Acceptance criteria

1. **Cubical comparison.** The cubical and simplicial homology of `S¹` and of a point agree through
   the comparison map. The cross product of the fundamental chains of `I` and `I` is the
   fundamental chain of `I²`, on the nose.
2. **Sign and variance audit.** The twisting equation of Layer 4 is the DG roadmap's `(MC)` under
   the grading bridge, the opposite-algebra bridge and the shift identification of its Layer 5.
   Noncommutative regression test: `R` free on `a, b` in degree `0` and `c` in degree `1`
   (homological), with `∂a = ∂b = 0` and `∂c = −ab`; `ind x = 2`, `ind z = 1`, `ind y = 0`;
   `m_{x,z} = a`, `m_{z,y} = b`, `m_{x,y} = c`, all other entries zero.
   - The twisting equation and one-sidedness hold.
   - In `R ⊗_R K_m` (the regular module), `D²(1 ⊗ x) = (ab + ∂c) ⊗ y = 0`.
   - In `K_m`, `d²(x) = 0`; through the bridge, the right `R^op`-module complex has `d² = 0`.
   - The literal right-free reading `d(e_x) = e_z a + e_y c`, `d(e_z) = e_y b` gives
     `d²(e_x) = e_y(ba − ab) ≠ 0`, recorded as the reason for the variance convention.
   - Action dependence: `A = ℚ × ℚ` in degree `0` with zero differential, `M = ℚ` in degree `0`
     with the right action through the first, respectively the second projection; `ind x = 1`,
     `ind y = 0`, `m_{x,y} = (1, 0)`. The twisted differential of `Suggested.lean` gives
     `D(1 ⊗ x) = 1 ⊗ y` for the first action and `D(1 ⊗ x) = 0` for the second, and
     `#check @twistedDifferential` shows the right-action instance `[Module Aᵐᵒᵖ M]` and the
     commutation instance `[SMulCommClass R Aᵐᵒᵖ M]` among its arguments. The latter is what
     makes `D` `R`-linear: for `R = A = ℚ × ℚ` acting on `M = ℚ²` by `(a, b) • (u, v) = (au, bv)`
     on the left and `(u, v) · (a, b) = (au + (b − a)v, bv)` on the right, the actions do not
     commute and the formula is not `R`-linear.
3. **Classical recovery.** A DG local system concentrated in degree zero gives back the Morse
   complex with classical local coefficients, naturally in the choices.
4. **Fibration theorem on examples.**
   - The path-loop fibration over `Sⁿ`: `H_*(Sⁿ; C_*(ΩSⁿ)) ≅ H_*(pt)`.
   - The Hopf fibration `S¹ → S³ → S²`: gives `H_*(S³)`.
   - The trivial fibration: recovers Künneth.
5. **Mapping spaces.**
   - `π₀ Map_*(S², S²) ≅ ℤ`.
   - The kernel of `i_{S²*}` contains `ℤ` in degree zero.
   - `Ω²Tⁿ` has contractible components.
   - `H₁(Ω²S³) ≅ ℤ`, through Layer 1 item 1.
6. **Floer.** `FH_*(H) ≅ H_{*+n}(X)` for a `C²`-small Morse Hamiltonian on a closed aspherical
   `X`. Theorem J for the trivial fibration recovers it with coefficients.
7. **Viterbo on E².** For Q=S¹, compute η₀ trivial in degree zero and prove with trivial integral coefficients SH_k(T*S¹)≃H_k(𝓛S¹;ℤ): the groups in degrees0/1 are ℤ[ℤ] and negative degrees vanish. The graded η_gr would introduce a shift and is not the twist in this formula. Compute both sides and E² pages of TheoremK for 𝓕=C_*(Ω𝓛S¹) componentwise, with Layer3's chosen basepoints and η₀. Match the zero-energy Thom diagram of Layer9.4.
8. **End to end.**
   - For `Q = S²` and a bounded domain `U ⊆ T*S²` containing the zero section, `∂U` has the
     contractible almost existence property.
   - `c°_HZ(D*Sⁿ) < ∞` for every `n ≥ 2`.
   - `c°_HZ(D*SU(2)) < ∞`.
9. **Cotangent signs.** On `T*ℝ`:
   - `ω_can(∂_q, ∂_p) = 1` and `ω_can = −d(p dq)`; the Liouville field of `−p dq` is `p ∂_p`;
   - `ν^*ω_can = ω_src = d(p dq)`;
   - for `H = p²/2`, the source's vector field for `(ω_src, H)` is `p ∂_q`; its push-forward by `ν`
     is `−p ∂_q`, which is the vector field of `−H ∘ ν⁻¹ = −p²/2` for `ω_can` in the
     `ι_X ω = dH` convention;
   - on `T*ℝ` with `H = (q² + p²)/2`, the linearized flow and its Conley--Zehnder index are the
     same before and after transport along `ν`;
   - `Ψ'^*_σ ω_can = ω_can + π^*dσ` for `Ψ'_σ(q, p) = (q, p − σ(q))`.
10. **Loop approximation.** In the flat `S¹` and `T²`:
    - the unit-speed loops `γ_n` of the standing conventions converge in `𝓛T²` to the constant
      loop of duration `1`; the unit-speed loops are not closed;
    - for the constant loop `c` of duration `1` in `𝓛S¹`, `evᵣ(c)` is the constant tuple,
      `geoʳ ∘ evᵣ(c)` is the constant loop of duration `0`, and the homotopy of the compact-family
      lemma is the linear interpolation of durations;
    - for `K = {c}`, `r(K) = 1`.

## Source coverage

This section is provenance, not specification: it records where each numbered statement of the
source paper lands, so a reviewer can check that nothing is missing. Numbers follow the revised
version (TeX source of 13 May 2026, compiled).

| Source statements | Layer and item |
| --- | --- |
| Def 1.1 | 6.5 |
| Conj 1.2 | out of scope |
| Thm A, C | 10.5 (Thms 5.10, 5.15) |
| Thm B | 10.5: representing-map endpoint and GC/TB multiple-realization application |
| Cor D, E | 6.3,6.4,10.5, including the constructed multiple-realization TheoremB case |
| Cor F | out of scope |
| Thm G | 11.6 (Thm 7.1) |
| Def 1.7, Thm H | 11.1 (Def 6.11, Thm 6.12) |
| Thm I | 11.2--11.5 |
| Def 1.8 | 3.1 |
| Defs 1.9--1.11 | 4.1, 4.3 |
| Thm J | 8.6 |
| Thm K | 9.3 |
| Thm L | 10.1 (Thm 5.1) |
| Thm M | 10.2 (Thm 6.4) |
| Lem 2.1, Prop 2.2 | 3.4 |
| Def 2.3, Props 2.5, 2.6, Lem 2.9, Prop 2.12, Cor 2.13, Lem 2.14 | 5.5 |
| Lem 3.1, Prop 3.3 | 7.3 |
| Props 3.4, 3.6, Def 3.5 | 8.1 |
| Def 3.7, Props 3.8, 3.9 | 8.2 |
| Def 3.12, Prop 3.13 | 8.3 |
| Props 3.14, 3.16, Defs 3.15, 3.17, 3.21, Props 3.18, 3.19, 3.22, Cors 3.24, 3.25, Props 3.26, 3.27, Cor 3.28, Prop 3.29 | 8.4 |
| Prop 3.30, Def 3.31, Prop 3.32, Def 3.35 | 8.5 |
| Prop 3.36, Thm 3.37, Def 3.38, Thm 3.39 | 8.6 (filtration also 4.4) |
| Lem 3.41 | 10.4 |
| Props 3.44--3.46, Thm 3.49 | 8.7 |
| Prop 4.1, Cor 4.17 | 9.4 |
| Lem 4.5 | 9.3, part 2 on compact families; part 1 (the unit-speed retraction) is false on the Moore carrier and not consumed, dropped |
| Props 4.6, 4.7, 4.9--4.11, 4.13, 4.14, Lem 4.15, Prop 4.16 | 9.3 |
| Thm 5.1, Prop 5.5, Lem 5.7, Prop 5.8 | 10.1 |
| Def 5.3 | 6.5 |
| Prop 5.9 | 10.3 |
| Thm 5.10, Thm 5.15 | 10.5 (5.15 through the mod-2 vanishing theorem of 1.4) |
| Thm 5.14 | 10.5: representing-map endpoint and GC/TB multiple-realization application |
| Prop 5.11, Prop 5.13 | 10.4 |
| Thm 5.12 | 1.4, for genuine Serre classes; the source's mod-2 class is replaced there |
| Def 6.1, Prop 6.3 | 6.5 |
| Thm 6.4, Props 6.6, 6.7 | 10.2 |
| Def 6.11, Thm 6.12, Prop 6.13 | 11.1 |
| Def 6.14, Props 6.15, 6.17, 6.18, 6.21, 6.23 | 11.2 (degree computation 1.8) |
| Defs 6.26, 6.32, Props 6.29, 6.33 | 11.3 (evaluation fibration 1.6) |
| Prop 6.31 | 11.3, including the finite-cover proof that compact connected non-tori are not `K(π,1)` |
| Prop 6.34 | 11.3, both the Lemma6.35/LES proof and the independent degree-computation proof (1.8) |
| Lem 6.35 | 11.3, low ranks and stable-plus-Stiefel finite-rank comparison; used by the first proof of Prop6.34 |
| Prop 6.36 | 11.4 |
| Props 6.38, 6.39 | 11.5, consuming 5.7's Riem R2/R3 and MorseTheory M5 based-loop application and its actual index/perfectness/generators, including `𝕆P²` |
| Thm 7.1, Prop 7.5, Lems 7.6, 7.7 | 11.6 (collapse 1.5) |

### Classical capped-source requirements

| Source requirements | Construction target |
| --- | --- |
| Hutchings pages74–85: action, capped indices and variational equation | 7.C.0–2 |
| Hutchings pages86–88: capped generators, FHS, linearized/asymptotic operators, relative index and variational exercise | 7.C.1–2 |
| Hutchings pages89–93: cap/degree/monotone coefficient comparisons | 7.C.1,7.C.3–6 |
| Hutchings pages94–95: individual continuation, identity, relative homotopy/composition and small-autonomous setup | 7.C.2b,7.C.3c,7.C.4–5 |
| Hutchings pages96–101: classical Floer, autonomous symmetry, PSS/Novikov and Arnold applications | 7.C.2–7, with the explicit shifted/module/coefficient formulas |
| ℂPⁿ cyclic module and Γ=0 reflected comparison | 7.C convention/application checks and7.C.6f |

## Prior formalization

Audin--Damian, *Morse Theory and Floer Homology*, is formalized in Lean 4 on Mathlib `v4.34.1` in
[t4v1/damian_formalizare](https://github.com/t4v1/damian_formalizare), about 50 000
lines across all sixteen chapters, with one `sorry`, the Arnold conjecture on the torus. The
spaces of trajectories enter as explicit hypotheses, because there are no submanifolds with
tubular neighbourhoods to build them from. So the Morse and Floer complexes satisfy `∂ ∘ ∂ = 0`
*given* the broken-trajectory counts, and the moduli-space work of Lane M and Layer 7 item 2 is
not done there.

Material that is proved there and absent from Tau Ceti, with the target here that it would serve:

| There | Here |
| --- | --- |
| `Part2/CauchyPompeiu.lean`, `CauchyHolder.lean`, `FloerRegularity.lean`, `Ch6.lean`: Cauchy and Beurling transforms, Calderón--Zygmund and Schauder estimates on the Hölder scale, elliptic regularity of the Floer equation (`contDiff_of_isFloerSolution`), energy and gradient bounds, convergence at the ends, compactness for bounded energy (`compactness_of_energy_bounded`), on `ℝ²ⁿ` and the torus | Layer 7 items 1--2, flat case; a Hölder-scale alternative to the Sobolev route of Lanes F0--F1 |
| `Part2/Rho*.lean`, `Maslov*.lean`, `Ch7.lean`: `ρ : Sp(2n) → S¹` with all its properties (`exists_isRho`), Maslov index of symplectic paths and loops | Layer 7 item 1, the Conley--Zehnder index and the loop Maslov index behind the Chern condition |
| `Part2/Darboux.lean`, `Ch5.lean` (`darboux`): Darboux by Moser's method | a contribution to its owner, Heegaard Floer Lane F2.1; not a target here |
| `Part1/Ch3.lean`, `Ch4.lean`: algebra of the Morse complex from abstract trajectory counts, Künneth, duality | Layer 5 items 1--3, algebraic part |

The Morse lemma and Sard's theorem are formalized there too, but Tau Ceti already has them, so they
are not targets here.


## References

- Michael Hutchings, *Lecture notes on Morse homology, Floer theory, and pseudoholomorphic curves*, September 11, 2002; unfinished informal lecture notes. Layer7.C treats the action/capping and classical count/comparison applications on pages74–101, especially96–101.
- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Floer homology with DG coefficients.
  Applications to cotangent bundles*, [arXiv:2404.07953](https://arxiv.org/abs/2404.07953): the
  source paper.
- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Morse homology with differential graded
  coefficients*, Progress in Mathematics 360, Birkhäuser, 2025 (BDHO): Layers 0 and 3--5.
- J.-F. Barraud, O. Cornea, *Lagrangian intersections and the Serre spectral sequence*, Ann. of
  Math. 166 (2007), including Appendix A on corner structures; *Quantization of the Serre
  spectral sequence*, J. Symplectic Geom. 5 (2007).
- W. S. Massey, *Singular Homology Theory*, GTM 70, Springer, 1980: cubical singular chains.
- J.-P. Serre, *Homologie singulière des espaces fibrés. Applications*, Ann. of Math. 54 (1951);
  *Groupes d'homotopie et classes de groupes abéliens*, Ann. of Math. 58 (1953).
- R. Palais, *Local triviality of the restriction map for embeddings*, Comment. Math. Helv. 34
  (1960).
- R. Bott, *The stable homotopy of the classical groups*, Ann. of Math. 70 (1959); W. Ziller,
  *The free loop space of globally symmetric spaces*, Invent. Math. 41 (1977).
- M. Audin, M. Damian, *Morse Theory and Floer Homology*, Universitext, Springer, 2014.
- A. Floer, H. Hofer, D. Salamon, *Transversality in elliptic Morse theory for the symplectic action*, Duke Math. J.80(1) (1995),251–292, [DOI10.1215/S0012-7094-95-08010-7](https://doi.org/10.1215/S0012-7094-95-08010-7). Layer7.C.2 proves the stated orthogonality and symmetric-matrix lemma in its localized transversality application.
- S. Piunikhin, D. Salamon, M. Schwarz, *Symplectic Floer–Donaldson theory and quantum cohomology*, in *Contact and Symplectic Geometry*, ed.C.B.Thomas, Publications of the Newton Institute8, Cambridge University Press (1996),171–200: the punctured comparison construction with the coefficient/sign/regularity applications specified here.
- D. Salamon, *Lectures on Floer homology*, IAS/Park City Math. Ser. 7 (1999).
- M. Abouzaid, *Symplectic cohomology and Viterbo's theorem*, in *Free loop spaces in geometry and
  topology*, IRMA Lect. Math. Theor. Phys. 24 (2015).
- A. Abbondandolo, M. Schwarz, *On the Floer homology of cotangent bundles*, Comm. Pure Appl. Math.
  59 (2006), and corrigendum.
- H. Hofer, E. Zehnder, *Symplectic Invariants and Hamiltonian Dynamics*, Birkhäuser, 1994;
  M. Struwe, Bol. Soc. Brasil. Mat. 20 (1990).
- K. Irie, *Hofer--Zehnder capacity of unit disk cotangent bundles and the loop product*, JEMS 16
  (2014); P. Albers, U. Frauenfelder, A. Oancea, Math. Ann. 367 (2017).

## How to drive it

The construction has separate reusable and geometric stages. Layers0–4 build cubical/local-coefficient algebra, the direct weak-equivalence/CW/native-Serre interfaces, convenient path spaces and filtered complexes before Floer counts. Each designated GC/SBC/CKG/CC/Riem/Morse/HS input is consumed only by the item that uses it; GC's early raw path/Kelley interfaces precede its later model/LES applications. The lower DGF outputs used by those generic constructions precede the later DG geometric applications.

Floer analysis supplies actual regular differentiable loci, Fredholm/evaluation/orientation and conditional gluing estimates; the standing aspherical/atoroidal branch additionally constructs ALL-dimensional topological corner compactifications with product faces. Layers5/8 use their relative fundamental chains and twisting cocycles. Layer7.C instead constructs its stated classical count dimensions, supported continuation and the common PSS module comparison, with separate compatible/tame coefficient lanes. Its qualified virtual application supplies full punctured analytic atlas/equivariant/relative data before using ImplicitAtlases; closed GW inputs do not construct that atlas.

Layer6's Hamiltonian/Liouville constructions proceed with HamiltonianSystems, HF's symplectic/J-space floors and the actual support/completeness estimates. Layer5's finite-dimensional geodesic/MB and projective applications consume Riem R2/R3 and Morse M5 without making their early algebra inputs depend on those applications. Layer9's DG Viterbo comparison consumes the standing all-dimensional DG Floer and free-loop Morse packages. Layers8–10 retain those chain-space hypotheses independently of the smaller common FH=H module readout; their atoroidal/noncontractible and Liouville branches keep their own conditions.

The topological abundance and multiple-realization applications use their explicit lower cubical/CW/Hurewicz/Serre/filtered interfaces, named GC/TB/HS/GT/SBC/Lie inputs and actual degree/evaluation maps. They require no Floer counts. Source-owner coordination specifications for global flux/suspension, finite-rank/compact-Lie and TG applications are separate from supplied generic floors. The later projective abundance application uses Layer5's actual based-loop index/perfectness/generator calculation.
