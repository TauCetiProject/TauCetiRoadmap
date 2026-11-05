# Roadmap: Morse and Floer homology with DG local coefficients

**Summary.** Classical Morse and Floer homology count only the zero- and one-dimensional spaces
of connecting trajectories. Barraud and Cornea observed that the compactified trajectory spaces
of *every* dimension, evaluated into a space of paths, assemble into a Maurer–Cartan element over
the cubical chains on a loop space. Twisting by that element gives Morse and Floer complexes with
coefficients in any differential graded module over `C_*(ΩB)`: a *DG local system*. The basic
source of such systems is Hurewicz fibrations over `B`, and in that case the twisted Morse complex
computes the homology of the total space. Barraud, Damian, Humilière and Oancea turned this into
a full homological package, first for Morse theory on manifolds and on the free loop space, then
for Hamiltonian Floer theory and symplectic homology, and proved a Viterbo isomorphism with DG
coefficients for cotangent bundles. This roadmap builds that package, from cubical singular
chains, a few general facts of algebraic topology that no other roadmap builds, path and mapping
spaces, DG local systems and the algebra of twisting cocycles, through DG Morse homology,
Hamiltonian Floer homology of periodic orbits on the analytic tower of the Heegaard Floer roadmap,
and symplectic homology, to its end theorems: the fibration theorem for DG Morse homology, the
DG Floer comparison `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` and Theorem J, the DG Viterbo isomorphism
(Theorem K), the capacity criteria (Theorems L and M), and the almost existence theorems for
contractible closed characteristics on hypersurfaces of `T*Q` (Theorems A and C). It also settles,
in a layer independent of the Floer theory, when a compact connected Lie group is aspherical.

Suggested homes:

| Layers | Home |
| --- | --- |
| 0 | `TauCeti/AlgebraicTopology/Cubical/` |
| 1 | `TauCeti/AlgebraicTopology/` and `TauCeti/Geometry/Manifold/`, beside the material they extend |
| 2 | `TauCeti/Topology/PathSpace/` and `TauCeti/Topology/MappingSpace/` |
| 3–4 | `TauCeti/AlgebraicTopology/DGLocalSystem/` |
| 5 | `TauCeti/Geometry/Manifold/Morse/DG/` |
| 6–10 | `TauCeti/Geometry/Symplectic/Hamiltonian/` and `TauCeti/Geometry/Symplectic/Floer/` |
| 11 | `TauCeti/Geometry/Manifold/LieGroup/` |

## Scope and ownership

**In scope.** Every numbered statement of §§1–6.2 of the source paper (Barraud, Damian,
Humilière, Oancea, *Floer homology with DG coefficients. Applications to cotangent bundles*,
arXiv:2404.07953) other than Theorem B (Theorem 5.14), subject to the deferrals and exclusions
below. The [source coverage](#source-coverage) section assigns each of them to a layer. Layer
7.C additionally builds the classical capped Hamiltonian Floer theory of closed positive
spherically monotone and spherically `c₁`-zero targets in the contractible sector, with ordinary
finite Laurent and completed Novikov coefficients, and its PSS comparison and Arnold bound;
Layer 7.G builds the fixed-point Floer theory of an arbitrary symplectomorphism of a closed
spherically aspherical target; Layer 7.T builds the Floer–Novikov torsion of a symplectomorphism
in the w⁺-monotone range. None of these three classical branches extends Layer 8's
all-dimensional DG-coefficient theory beyond that layer's own aspherical and atoroidal
hypotheses.

**Continuation.** The applications of this package to manifolds abundant with 2-spheres,
knotted hypersurfaces and the multiple-realization criterion (the source's Theorem B, Theorem I,
§§6.3–6.4 and §7), together with the homogeneous carriers, projective loop-space computations and
explicit degree computations they rest on, are the subject of the continuation roadmap
DGFloerPartII. DGFloerPartII consumes this roadmap and supplies nothing to it.

**Owned here.** This roadmap owns everything it states that the deferrals below do not assign
elsewhere. In particular it owns:

- cubical singular chains and their comparison with simplicial singular chains (Layer 0);
- the degree-one Hurewicz isomorphism `π₁(X)ᵃᵇ ≅ H₁(X; ℤ)`, CW approximation, homology
  invariance under weak equivalences with local coefficients, the Serre-fibration predicate with
  its fibration homotopy exact sequence, and the ordinary homological and multiplicative
  cohomological Serre spectral sequences over arbitrary CW and arbitrary bases (Layer 1 items
  1–2);
- the homological and cohomological adapters and the convergence theory extending the native
  filtered-cochain spectral objects (Layer 1 item 3);
- Serre classes, Hurewicz modulo a Serre class, the functorial Eilenberg–MacLane models
  `K(A, n)` for abelian `A` with their uniqueness, and the mod-2 vanishing theorem (Layer 1
  item 4);
- the Pontryagin–Thom collapse for framed submanifolds of an arbitrary closed ambient manifold
  (Layer 1 item 5);
- local triviality of evaluation `Diff(M) → O` onto the orbit of a chosen point (Layer 1 item 6);
- Moore path and loop spaces, transitive lifting functions, the Moore-path replacement with its
  strict holonomy, and the mapping spaces out of spheres (Layer 2);
- DG local systems and the algebra of twisting cocycles, including the arbitrary-CW Brown
  resolution (Layers 3–4);
- the Barraud–Cornea construction, DG Morse homology, its fibration theorem and its free-loop
  extension through broken geodesics (Layer 5);
- time-dependent Hamiltonian flows and their 1-periodic orbits, Liouville domains, the
  cotangent bundle with its canonical Liouville form, the capacities and the almost existence
  property (Layer 6);
- Hamiltonian Floer homology of periodic orbits, symplectic homology, the capped classical
  branch, the global-seam branch and the Floer–Novikov torsion (Layer 7);
- the DG Floer toolset and the DG Viterbo isomorphism (Layers 8–9);
- the criteria for almost existence and finiteness of `c°_HZ` and their cotangent applications
  (Layer 10);
- the finite cover `T × K → G` of a compact connected Lie group and the torus criterion
  (Layer 11).

**Left to named roadmaps.** The following objects are built elsewhere; this roadmap consumes
them by name and section (see the supplier contracts) and does not restate them.

| Object | Owner | Relation to this roadmap |
| --- | --- | --- |
| Morse–Smale pairs, compactified trajectory spaces with corners, the Morse complex over `𝔽₂` and `ℤ` | HeegaardFloer Lane M | consumed by Layer 5 |
| Fredholm theory, Sard–Smale, the Cauchy–Riemann package, the Robbin–Salamon and Conley–Zehnder indices, the clutching Chern number | HeegaardFloer Lanes F0–F1 | consumed by Layers 7–9 |
| Symplectic manifolds, almost complex structures, `J`-holomorphic curves, energy, local compactness, transversality and gluing | HeegaardFloer Lane F2 | consumed by Layers 6–9 |
| Product curves with a general closed source `Σ`, the product `J` and the slice-image classification in `[Σ] × [z₀]` | HeegaardFloer F2.6c | not consumed here |
| Marked, multiply covered, unforced genus-zero stable-map compactness over compact tame families | AnalyticStableMaps M3 | consumed by Layer 7.C.3 |
| The general smooth symplectic suspension `Y_φ = (ℝ × M)/((t, x) ∼ (t + 1, φ⁻¹x))`, its seam-compatible block structure, periodic-orbit images and the compact horizontal-image theorem | SymplecticGeometry S0–S2 | S0's mapping torus is instantiated by Layer 7.T.1 at monodromy `f⁻¹`; S1–S2 are not consumed |
| The surface suspension, its vertical form, primitive orbit images and the point-count, product and zeta applications | TaubesGromov | not consumed here; TaubesGromov consumes SymplecticGeometry S0–S2, not this roadmap |
| Global flux of symplectic paths, the Hamiltonian kernel, the endpoint quotient `Ham → Symp₀ → H¹_dR/Γ_ω`, the area-normalized torus lattice and compact-support flux | HamiltonianReduction R1a.0–R1a.4 | not consumed here |
| The `Sp(2, ℝ)` polar factorization `A = PU ↦ P^{1−t}U` and its symplectic polar factors | CotangentLagrangian C2.0–C2.1 | not consumed here |
| Period-controlled Novikov completions, finite-below convolution, total quotient rings and based torsion | MorseNovikov N1 and N4 | consumed by Layers 7.C and 7.T; N6's finite-dimensional bifurcation theorem is not a Floer theorem and is not consumed |
| The Hurewicz-fibration predicate, continuous lifting functions, mapping-path carriers and the path-loop fibration | GeneralizedCohomology G2.10 | consumed by Layers 1–2 |
| Singular and twisted chains, CW pairs, Eilenberg–Zilber and Künneth, fundamental classes and duality, relative Hurewicz and Whitehead, the Hurewicz map of Stage 8.3, the bar construction of Stage 8.8 | AlgebraicTopology Stages 2–8 | consumed by Layers 0–1 and 5 |
| The restriction bundle of embeddings, `Diff(M)` with its `C^∞` topology, collars and tubular neighbourhoods | GeometricTopology Layers 1, 3 and 7 | consumed by Layer 1 items 5–6 |
| Jacobi fields, the index form and the finite broken-geodesic carriers | RiemannianGeometry R2–R3 | consumed by Layer 5 item 6 |
| Compact Lie theory: universal covers, central kernels, maximal tori, root `SU(2)` subgroups, Haar measure and Peter–Weyl | LieGroups Layers 5–6, CompactGroups | consumed by Layer 11 |
| Covering spaces and their induced maps on homotopy groups | UniversalCovers (completed) | consumed by Layer 11 item 2 |
| The Lagrangian and polygon operations of the Fukaya category | FukayaTheory | not consumed; the graph and diagonal strip folding of Layer 7.G is the only Lagrangian construction here |
| The virtual, implicit-atlas comparison of the autonomous `S¹`-invariant sector of Floer cylinders with the regular time-dependent counts | none in this roadmap | it consumes ImplicitAtlases, which is later in the merge order; the classical count and PSS branches of Layer 7.C are independent of it |

**Out of scope**, so nobody mistakes them for targets:

- **Conjecture 1.2** (every closed hypersurface in `T*Q` has the contractible almost existence
  property when `Q` is not a `K(π, 1)`). It is open.
- **Corollary F.** It consumes the Ginzburg–Niche theorem on uniquely ergodic Hamiltonian
  structures, which nothing here builds.
- Chain-level higher structures: `A∞` refinements of the DG Floer maps, products, and the BV
  and loop-product structures on either side of the Viterbo isomorphism.
- Floer homotopy theory, and Lagrangian Floer theory with DG coefficients.
- All-dimensional compactifications in the monotone and `c₁`-zero branches of Layer 7.C: that
  branch has the count dimensions of its classical identities only.
- The virtual comparison of the autonomous sector named in the table above.

## Conventions

- **Cubical chains and the ordinary supplier.** The DG, Morse and Floer chains of this roadmap
  are normalized cubical singular chains, as in the source and in BDHO §5.2. Layer 1 item 2's
  general ordinary-topology supplier uses AlgebraicTopology's native simplicial singular and
  twisted chains; Layer 0 item 3 transports its homology and Serre sequence to cubical chains
  for the DG consumers.
  - A singular `n`-cube is a continuous map `Iⁿ → X`. It is degenerate when it does not depend
    on at least one coordinate (Massey's convention, which is BDHO §5.2's). The chain group is
    free on all cubes modulo the degenerate ones.
  - Serre's convention, which only asks independence of the last coordinate, is not used: it is
    not closed under the cross product.
  - The cross product `Iᵖ × I^q = I^{p+q}` is strictly associative and strictly unital. So
    `C_*(ΩB)` is a DG algebra under Moore concatenation with no Eilenberg–Zilber correction, and
    fundamental chains of products of trajectory spaces are cross products.
  - Every homological input from the algebraic topology roadmap is transported through the
    comparison of Layer 0, which is proved once and then used through named maps.
- **Grading bridge.** The source uses homological grading. The DG roadmap is cohomological, with
  right modules primary.
  - Every DG object here is a cochain object through `C^{-n} = C_n`. A homological differential
    of degree `−1` is a cohomological differential of degree `+1` with the same sign, and parity
    is unchanged.
  - The source's formulas are stated in homological notation through one named equivalence.
  - The sign comparison of the twisting equation with the DG roadmap's `(MC)` is proved once
    (worked example 2).
- **Moore loops.** `ΩB` is the space of Moore loops `γ : [0, L] → B` with `L ≥ 0`, which is the
  carrier of the strict concatenation used throughout. It is **not** homeomorphic to the
  fixed-interval loop space `Ω^{[0,1]}B = Map_*(S¹, B)`: for `B` a point, `ΩB ≅ [0, ∞)`. The
  comparison is a homotopy equivalence of `H`-spaces `Ω^{[0,1]}B → ΩB`, proved once, together
  with its versions for path spaces, compatible with the endpoint maps (a fibre homotopy
  equivalence over them), with constant sections, and with the actions used downstream. Every
  homeomorphism with a mapping space in this roadmap is stated for the fixed-interval model and
  then composed with this comparison.
  - The duration `L` is a continuous function on the Moore space. On a Riemannian manifold, the
    geometric length of a Moore loop is only lower semicontinuous in the compact-open topology,
    and the loops parametrized at unit speed are **not** a closed subspace: in a flat torus, the
    unit-speed loops `γ_n(t) = (sin 2πnt, 1 − cos 2πnt)/(2πn)` of duration `1` converge to the
    constant loop of duration `1`, whose unit-speed representative has duration `0`. So no
    statement of this roadmap filters a Moore space by geometric length, and no subspace of
    unit-speed loops appears anywhere. The source's Lemma 4.5 is replaced by the compact-family
    approximation of Layer 9 item 3.
- **Mapping-space topology.** Path, loop and mapping spaces carry Mathlib's compact-open
  topology on `C(X, Y)`. Two kinds of source occur.
  - Sphere and interval models have a compact Hausdorff source.
  - A Moore path is a pair `(L, γ)` with `γ ∈ C([0, ∞), X)` stopped at `L`, topologized as a
    subspace of `[0, ∞) × C([0, ∞), X)`. The source `[0, ∞)` is locally compact Hausdorff but
    not compact.

  In both cases local compactness of the source supplies the ordinary compact-open evaluation
  and currying law. These raw topologies are kept for arbitrary target spaces. A comparison with
  a compactly generated (k-ified) mapping-space carrier is not a construction of this roadmap:
  a roadmap that consumes both carriers constructs it from the counit `kZ → Z` and the
  compact-Hausdorff test and currying maps. Weak comparisons of that kind do not create
  Hurewicz lifts or fibre homotopy equivalences; those come from GeneralizedCohomology G2.10's
  lifting maps and the explicit Layer 2 Moore replacement maps and homotopies.

  Layer 2 item 1 proves that the raw mapping and stopped-path carriers are themselves compactly
  generated, so that every k-ification comparison is a homeomorphism there: for metrizable `Y`
  and compact metric sphere or interval source, through the uniform compact-open metric; for
  `[0, ∞)`, through the countable exhaustion by `[0, m]` and the corresponding compact-open
  metric, the stopped Moore and fixed-end carriers being metrizable subspaces of the resulting
  products.
- **Coefficients.** The algebraic Layers 0, 3 and 4 work over an arbitrary commutative ring. The
  geometric Layers 5 and 7–9 are built over `𝔽₂` first. Integer coefficients, with the source's
  orientation conventions of §3.1, form a separate milestone inside each of those layers. Every
  `𝔽₂` theorem is stated so the ring can be generalized without restating the geometry.
- **Floer grading.** The standing degree of a nondegenerate 1-periodic orbit is its
  Conley–Zehnder index, normalized so that for a `C²`-small autonomous Morse Hamiltonian on a
  closed `2n`-manifold, `FH_*(H) ≅ H_{*+n}(X)`. The grading needs, besides the area condition, a
  Chern condition and chosen trivializations, as in the source's §3.2. Layer 7.C uses
  `μ = −CZ_HF` on the same symplectic path and states its conversion explicitly there.
  - **First Chern number of a surface map.** For a closed oriented surface `Σ` and smooth
    `f : Σ → X`, the Chern number is HeegaardFloer F1.5's clutching number `wind(det g)`, equal
    by F1.5 to CharacteristicClasses C3.2's `c₁(f^*TX)[Σ]`. Its graph-loop Maslov number is twice
    this winding, and `c₁(TS²)[S²] = 2`. F1.5 owns the disc and complement trivializations,
    their choice and homotopy independence and the topological comparison.
  - **Symplectically aspherical** means `∫ f^*ω = 0` and `c₁(f^*TX)[S²] = 0` for every smooth
    `f : S² → X`. **Symplectically atoroidal** means the same for every smooth `f : T² → X`. The
    source writes `f^*[ω] = f^*(2c₁) = 0` for continuous `f`; since `H²(S²; ℤ)` and `H²(T²; ℤ)`
    are torsion-free, `f^*(2c₁) = 0` is the vanishing of the Chern number. This roadmap uses the
    smooth formulation throughout, which is what the Floer layers consume; for cotangent bundles
    it is verified directly in Layer 9 item 1.
  - **Trivializations.** In each free homotopy class of loops one reference loop is fixed, with
    a unitary trivialization of `TX` along it. Trivializations along 1-periodic orbits are
    induced through cylinders to the reference loop; the Chern condition on tori makes the
    induced Conley–Zehnder index independent of the cylinder. For contractible orbits the
    reference loop is constant and the condition on spheres suffices. Layer 7.C is a separate
    contractible capped branch: it constructs cap trivializations and the spherical quotient `Γ`
    and does not assume the atoroidal hypothesis of the standing noncontractible theory.
  - These conditions are separate named hypotheses on every statement of the standing Layers
    7–9 and on the general Liouville-domain results. Layer 7.C instead states its own positive
    spherical-monotone or spherical-`c₁`-zero hypothesis in the contractible capped sector.
    Exactness of a Liouville domain gives the area condition only; the Chern condition stays a
    hypothesis there. For cotangent bundles, `2c₁(T(T*Q)) = 0` holds globally, and the canonical
    grading of Layer 9 item 1 is compared with this one separately; it is not assumed for
    arbitrary domains.
- **Sign dictionary.** Two conventions differ between the source and Tau Ceti, and they are
  fixed together here.
  - *Hamiltonian vector fields* are those of the Hamiltonian systems roadmap, `ι_{X_H} ω = dH`.
    The source's §3.2 uses `ω(X_H, ·) = −dH`. At a **fixed** form `ω`, the bridge is
    `X^{source}_{ω,H} = X_{ω,−H}`, proved once.
  - *The symplectic form of a cotangent bundle* is Tau Ceti's: `cotangentSymplecticForm` gives
    `ω_can((v, α), (w, β)) = β(v) − α(w)`, so `ω_can = −dλ_can` for the tautological form
    `λ_can = p dq`, and `ω_can(∂_q, ∂_p) = 1` on `T*ℝ`. No second canonical form is introduced.
    The source works with `ω_src = dλ_can = −ω_can`.
  - *Liouville domains* use `ω = dλ` and `ι_Z ω = λ`. On a cotangent bundle the Liouville
    primitive of `ω_can` is therefore `λ = −λ_can = −p dq`, and its Liouville field is the
    fibrewise radial field `Z = p ∂_p`, outward along `S*Q`.
  - *Cotangent transport.* The fibrewise negation `ν(q, p) = (q, −p)` satisfies
    `ν^*λ_can = −λ_can` and `π ∘ ν = π`, and preserves the zero section, `D*Q`, `S*Q` and
    `p ∂_p`. So `ν : (T*Q, ω_src, λ_can) → (T*Q, ω_can, −λ_can)` is an exact symplectomorphism
    of Liouville manifolds. All of the source's cotangent data is transported along `ν`:
    Hamiltonians `H ↦ H ∘ ν⁻¹`, almost complex structures `J ↦ ν_*J` (compatibility is
    preserved), Floer cylinders `u ↦ ν ∘ u`, actions, and trivializations. Since `ν` is
    symplectic, the Floer equation, the energy identity and Conley–Zehnder indices carry over
    unchanged; no anti-symplectic identification is used anywhere.
  - *The two changes combined.* After transport along `ν`, the source's cotangent data live on
    `(T*Q, ω_can)` in the source's Hamiltonian convention, and the fixed-form bridge
    `X^{source}_{ω,H} = X_{ω,−H}` finishes the translation, exactly as on a closed `(X, ω)`. So
    there is one Hamiltonian bridge in the whole roadmap, and on cotangent bundles it is
    preceded by `ν`.
  - *Downstream quantities.* The standing action functional is the source's
    `𝒜_H(γ) = ∫ γ̄^*ω − ∫ H(t, γ(t)) dt` (§3.2), with `γ̄` oriented from `γ` to the reference
    loop, in the source normalization after the substitutions above. Layer 7.C instead writes
    `A_H(γ, D) = ∫ H dt + ∫_D ω`; on its aspherical overlap the standing comparison uses the
    reflected Hamiltonian `H∨`, not a same-`H` identity. Conley–Zehnder indices in the standing
    convention retain `FH_*(H) ≅ H_{*+n}(X)`. The magnetic fibre translation is fixed in Layer 6
    item 3. Worked example 9 checks the model evaluations.
- **Hypotheses stay unbundled**, as in the Heegaard Floer roadmap: nondegeneracy, regularity of
  `J`, admissibility at infinity, asphericity and atoroidality are separate named hypotheses.
- **Maps are specified, not merely existent.** Continuation maps, direct and shriek maps, the
  Viterbo transfer and the Viterbo map are constructed from explicit data. Their independence of
  choices is a theorem about specified chain homotopies, never a quotient taken silently.
- **Universes.** Spaces, modules and bases live in arbitrary universes; where a carrier is
  built from a universal test object (Layer 1 item 2's all-CW testing, Layer 2 item 2's lifting
  functions) the statement names the universe of the test object and transports along `ULift`.
## Exact supplier contracts

Every declaration below was checked at the pinned Mathlib and Tau Ceti; what the pins lack is a
target of this roadmap or of the named supplier, never a "native" API.

### From Mathlib

- Singular homology `AlgebraicTopology.singularHomologyFunctor` with coefficients in an abelian
  category, and its homotopy invariance (`Mathlib/AlgebraicTopology/SingularHomology/`);
  `ModuleCat` as the coefficient category. The mod-2 vanishing theorem of Layer 1 item 4 is
  stated with coefficients in the `ℤ`-module `ZMod 2`.
- Cubical homotopy groups `HomotopyGroup`, written `π_ n X x`, with their group structure for
  `n ≥ 1` and commutative group structure for `n ≥ 2`; `SimplyConnectedSpace`; `Path`,
  `unitInterval`.
- The compact-open topology `ContinuousMap.compactOpen` on `C(X, Y)`, its evaluation and
  currying laws for locally compact sources; `IsCoveringMap`.
- `HomologicalComplex`, `Homotopy`, `CochainComplex`, and the abelian spectral-object API:
  `CategoryTheory.Abelian.SpectralObject`, `SpectralObject.spectralSequence`,
  `SpectralSequenceDataCore`, `coreE₂Cohomological`, `HasSpectralSequence`, `IsFirstQuadrant`
  (`Mathlib/Algebra/Homology/SpectralObject/`), the index type `EInt`, and
  `HomotopyCategory.spectralObjectMappingCone`
  (`Mathlib/Algebra/Homology/HomotopyCategory/SpectralObject.lean`). What Layer 1 item 3
  assumes of them: a spectral object indexed by `EInt` has pages, differentials and an `E₂`
  cohomological spectral sequence through `coreE₂Cohomological`, and the mapping-cone spectral
  object of a functor into the homotopy category exists; no filtration functor on cochain
  complexes and no convergence theorem exist at the pin.
- `DirectSum.Decomposition`, `DirectSum.decomposeLinearEquiv`, `DirectSum.lmap`,
  `GradedAlgebra`, `Int.negOnePow`, `MulOpposite` (Layer 4).
- `ModelWithCorners`, `ChartedSpace`, `LieGroup`, the scoped `ContDiff` notation `∞`, `Circle`,
  `ContinuousMulEquiv` (written `≃ₜ*`), `Matrix.specialOrthogonalGroup` (Layer 11); integral
  curves and flows of vector fields on manifolds (`Mathlib/Geometry/Manifold/IntegralCurve/`).
- `Monotone.ae_differentiableAt` (`Mathlib/Analysis/Calculus/Monotone.lean`), for the
  Hofer–Zehnder–Struwe argument of Layer 6 item 5.

### From Tau Ceti

- `TauCeti.IsDGAlgebra` (`TauCeti/Algebra/Homology/DG/Algebra/Defs.lean`): an internally
  `ℤ`-graded `R`-algebra with an `R`-linear differential of degree `+1`, square zero and the
  left graded Leibniz rule with sign `Int.negOnePow`. `TauCeti.IsDGRightModule`
  (`TauCeti/Algebra/Homology/DG/Module/Right/Defs.lean`): degree `+1`, square zero and the
  right graded Leibniz rule, under `[IsScalarTower R Aᵐᵒᵖ M]`, `[SetLike.GradedSMul …]` and
  `[DirectSum.Decomposition ℳ]`. `DGRightModuleCat` and `DGAlgHom`
  (`TauCeti/Algebra/Homology/DG/`) for restriction of scalars.
- `HomotopyGroup.pathLoopSpaceMulEquiv : π_(m+1)(Ω X) ≃* π_(m+2)(X)`
  (`TauCeti/Topology/Homotopy/HomotopyGroup/LoopSpace.lean`), the loop-space shift of Layer 2
  item 3.
- `TauCeti.IsAspherical X x` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean`):
  `PathConnectedSpace X` and `Subsingleton (π_(n+2) X x)` for every `n`, with no Hausdorff or
  CW condition; `IsEilenbergMacLaneSpaceOne` (same file), the degree-one Eilenberg–MacLane
  property interface of Layer 1 item 4.
- `LocalCoefficientSystem R X` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`), the functor
  category from the fundamental groupoid, and twisted singular homology
  (`TauCeti/AlgebraicTopology/Singular/Twisted/`), consumed by Layer 1 item 2 and Layer 3
  item 3.
- `cotangentSymplecticForm` and `cotangentLiouvilleForm` on the model space `V × V^*`
  (`TauCeti/Geometry/Symplectic/Cotangent/`), with `cotangentSymplecticForm_apply`; the linear
  `SymplecticForm` structure (`TauCeti/Geometry/Symplectic/AlmostComplex.lean`);
  `SmoothAlmostComplexStructure` and `IsPseudoholomorphicAt`
  (`TauCeti/Geometry/Symplectic/Manifold/`).
- The Morse lemma `IsMorse.nonempty_morseChart` (`TauCeti/Geometry/Manifold/Morse/Lemma.lean`)
  and the Morse index (`TauCeti/Geometry/Manifold/Morse/Index.lean`); finite-dimensional Sard
  (`TauCeti/Analysis/Calculus/Sard/`). Sard–Smale is not at the pin; it is HeegaardFloer Lane
  F0's.

Not at the pins, and therefore targets here or of the named supplier: the Serre-fibration
predicate (Layer 1 item 2), the spectral sequence of a filtered complex (Layer 1 item 3),
Sard–Smale (HeegaardFloer F0), Hurewicz fibrations (GeneralizedCohomology G2.10).

### From TauCetiRoadmap.HeegaardFloer

- Lane M: Morse–Smale pairs, compactified trajectory spaces with their corner structure and
  gluing, and the Morse complex over `𝔽₂` and `ℤ`, with its MorseTheory M1–M6 prerequisites
  (Layer 5, Layer 7.C.1a).
- Lane F0: Fredholm theory and Sard–Smale; Lane F1: the Cauchy–Riemann package, totally real
  boundary conditions, Riemann–Roch, F1.3's spectral flow, F1.4's Robbin–Salamon and
  Conley–Zehnder indices with `CZ = −μ_RS`, and F1.5's clutching Chern number and its equality
  with CharacteristicClasses C3.2's `c₁`.
- Lane F2: symplectic manifolds, almost complex structures (F2.1's compatible-structure family
  and tame-to-compatible contraction), `J`-holomorphic maps, energy, compactness (F2.2a and
  F2.2c unique continuation and factorization), transversality and gluing; F2.6a–d sphere
  domains, factorization, marked quotient and evaluation carriers and the smooth-`J` selection
  route; F2.6c's minimal-area compactness retains its area hypothesis.

### From TauCetiRoadmap.AlgebraicTopology

- Stage 2: relative singular homology, local coefficient systems and their transport along
  paths.
- Stage 4: CW pairs, cellular approximation, cofibrations, 4.4's based circle and sphere models,
  4.5's CW structure on `k(B × B)` and its product-cell filtration.
- Stages 5.1–5.4: Eilenberg–Zilber, the Künneth theorems and transfer. Stage 5.5 consumes
  Layer 1 item 2 and supplies nothing to it.
- Stage 6: 6.0–6.2's cochains and cup product, fundamental classes (6.3), the orientation local
  system, cap products, Poincaré and Poincaré–Lefschetz duality, and 6.5's homological degree
  `f_*[S] = deg(f) · [Q]` with its comparison to DifferentialGeometry Layer 10's smooth degree.
- Stages 8.1–8.7: relative homotopy groups, 8.2's Kan and Moore comparison and the
  cube-simplex orientation comparison, 8.3's Hurewicz map `h : π_n(X, x) → H_n(X; ℤ)` for every
  `n ≥ 1` (of which Layer 1 item 1 proves the degree-one isomorphism), the absolute and relative
  Hurewicz theorems in degrees `≥ 2`, 8.5's Whitehead theorem, 8.6's positive sphere
  orientation; Stage 8.8 and 8.8a's bar construction `|nerve (SingleObj G)|` with its
  contractible cover and fundamental-group normalization. Nothing from Stages 8.9–8.12 is
  consumed.

### From other roadmaps

- **DGAInfinity.** Layer 1: DG algebras, right DG modules, restriction of scalars, tensor
  products, the opposite-algebra bridge. Layer 4: Maurer–Cartan elements in the strictly
  upper-triangular regime. Layer 5: one-sided twisted complexes, semi-free modules and derived
  tensor products.
- **GeneralizedCohomology.** Early G2.1: compact generation, the product and Kelley comparison
  of realizations. G2.10: `IsHurewiczFibration`, continuous lifting for every parameter space,
  the compact-open interval path, loop and mapping-path carriers (`MappingPathSpace`,
  `MappingPathFiber`, `mappingPathFiberConstHomeomorphPath`,
  `mappingPathFiberConstHomeomorphLoopSpace`), the path-loop fibration, and the comparison of
  Hurewicz fibrations with Layer 1 item 2's Serre fibrations. G2.10's applications of the
  fibration exact sequence consume Layer 1 item 2; G5 consumes Layer 1 item 2's multiplicative
  Serre spectral sequence.
- **CharacteristicClasses.** C3.2's topological `c₁` (through HeegaardFloer F1.5), and `w₁`,
  `w₂` for Layer 9 item 1.
- **DifferentialGeometry.** Layers 0–1: smooth differential forms, pullback, the exterior
  derivative `mextDeriv`, the Cartan calculus; item 0.4's migration of `SmoothTwoForm` onto the
  generic form carrier, which this roadmap uses. Layer 3: flows of vector fields. Layer 10: the
  smooth degree, consumed only through AlgebraicTopology 6.5's homological characterization.
- **GeometricTopology.** Layer 1: manifolds with boundary, collars, tubular neighbourhoods,
  connected sum. Layer 3: `Diff(M)` as a topological group with the `C^∞` topology, the
  smooth-families map, the inclusion `O(n+1) → Diff(Sⁿ)` and the compact-embedding restriction
  bundle. Layer 7: Riemannian structures.
- **UniversalCovers** (completed): covering spaces and their induced maps on homotopy groups.
- **LieGroups** Layers 5–6 and **CompactGroups**: the universal cover and its central kernel,
  compact Lie-algebra structure, simply connected integration, maximal tori and root `SU(2)`
  subgroups, Haar measure and Peter–Weyl, consumed by Layer 11 only.
- **MorseNovikov.** N1: period-controlled completed group rings and modules, the support
  condition, finite-below convolution, geometric-series inverses. N4: based chain torsion,
  total quotient rings, determinant comparisons, finite-cyclic norms. N6's finite-dimensional
  bifurcation theorem is not consumed.
- **HamiltonianSystems** Layers 1–2: Hamiltonian vector fields with `ι_{X_H} ω = dH`, the
  Poisson bracket, conservation of energy, symplectomorphisms and their action on Hamiltonian
  vector fields and integral curves; its variational equation (Layer 7.C.1).
- **RiemannianGeometry.** R2: Jacobi fields and endpoint-exponential comparisons. R3: the
  index form, finite node-value reduction, complete-manifold finite broken-geodesic carriers and
  path-energy comparisons; its based-loop sphere calculation consumes Layer 1 item 2 only.
- **SmoothBundlesConnections** B6.0: uniform normal-radius and strong-convexity bounds on a
  compact Riemannian manifold (Layer 5 item 6).
- **AnalyticStableMaps** M3: full marked, multiply covered, unforced genus-zero stable-map
  compactness, integral splitting and topology over compact smooth tame-`J` families
  (Layer 7.C.3).
- **MorseTheory** M4: the critical number `c(M)` (Layer 7.C.6h); M1–M6 through HeegaardFloer
  Lane M.
- **SymplecticGeometry** S0: the smooth mapping torus `Y_φ`, its quotient charts, descended
  `∂_t` flow and vertical form, instantiated by Layer 7.T.1 at `φ = f⁻¹`.

## How to read the build

Layers 0–4 are reusable algebraic topology and algebra, in build order: cubical chains and
their comparison with simplicial chains (0); the general facts no other roadmap builds, among
them degree-one Hurewicz, CW approximation, Serre fibrations with their exact sequence and
spectral sequences, the spectral sequence of a filtered complex, Serre classes and
Eilenberg–MacLane spaces, the Pontryagin–Thom collapse and the evaluation bundle of `Diff(M)`
(1); Moore paths, Hurewicz fibrations and the mapping spaces out of spheres (2); DG local
systems (3); twisting cocycles, twisted complexes and the Brown resolution (4). Layer 5 is DG
Morse homology on closed manifolds and on the free loop space, with its fibration theorem. Layer
6 is the Hamiltonian and Liouville dynamics the Floer layers need. Layer 7 is classical
Hamiltonian Floer homology and symplectic homology on the analytic tower of HeegaardFloer, with
three classical branches: the capped monotone and `c₁`-zero theory with its PSS comparison and
Arnold bound (7.C), the fixed-point theory of an arbitrary symplectomorphism on a spherically
aspherical target (7.G) and the Floer–Novikov torsion (7.T). Layer 8 twists Layer 7's
all-dimensional moduli spaces into the DG Floer toolset, Layer 9 proves the DG Viterbo
isomorphism for cotangent bundles, and Layer 10 derives the criteria and the theorems on almost
existence and capacities. Layer 11, independent of Layers 2–10, decides when a compact connected
Lie group is aspherical. Each layer ends with its examples and its dependencies; a `*Needs:*`
line lists what a target's statement and route need, item by item, so that a different proof
route is not blocked behind an unrelated layer.

## Layer 0: cubical singular chains

### 0.1 Singular cubes and the normalized cubical complex

Define singular `n`-cubes `Iⁿ → X`, their faces `∂^ε_i` (`ε ∈ {0, 1}`, `1 ≤ i ≤ n`) and
degeneracies, and the normalized cubical chain complex `C^□_*(X; A)` over a commutative ring `A`:
the free module on the cubes modulo the degenerate ones (conventions), with
`∂ = Σ_i (−1)^i (∂^0_i − ∂^1_i)`. Prove functoriality, define relative chains of pairs and the
augmentation (Massey, *Singular Homology Theory*, Chapter II). *Needs:* Mathlib `ContinuousMap`,
`unitInterval`.

- `∂² = 0` on all chains, and `∂` preserves the degenerate subcomplex, so the normalized complex
  is a quotient complex.
- A map `f : X → Y` induces a chain map `f_♯`, functorially; a pair `(X, A)` has the short exact
  sequence of normalized chains.
- The augmentation `C^□_0(X) → A` sends every `0`-cube to `1`.

**Checks.**
- A point has one nondegenerate cube in degree `0` and none above, so `H^□_*(pt) = A` in
  degree `0`; without the quotient by degenerate cubes every degree would be free of rank one
  and the homology would be `A` in every degree (BDHO §5.2, the footnote on cubical homology of
  a point).
- `H^□_1(S¹) = A`: the loop `t ↦ e^{2πit}` is a cycle generating it (worked example 1).
- The `2`-cube `(s, t) ↦ γ(s)` is degenerate (independent of `t`) in Massey's convention and
  also in Serre's; the cube `(s, t) ↦ γ(t)` is degenerate in Massey's convention but not in
  Serre's, which only tests the last coordinate.

### 0.2 The cross product

Define the cross product `C^□_p(X) ⊗ C^□_q(Y) → C^□_{p+q}(X × Y)` by `(σ × τ)(s, t) = (σ(s), τ(t))`.
Prove that it is strictly associative, strictly unital, well defined on normalized chains and
satisfies the Leibniz rule `∂(σ × τ) = ∂σ × τ + (−1)^p σ × ∂τ`. For a topological monoid `G` with
strict unit, prove that `C^□_*(G)` is a DG algebra under the product induced by multiplication
(Massey Chapter VII; BDHO §5.2). *Needs:* item 1.

**Checks.**
- The cross product of the fundamental chains of `I` and `I` is the fundamental chain of `I²`,
  on the nose (worked example 1), where the fundamental chain of `Iⁿ` is the identity cube.
- Leibniz on two `1`-cubes: `∂(σ × τ) = ∂σ × τ − σ × ∂τ`, with the four boundary edges of the
  square carrying the signs of `∂ = −(∂^0_1 − ∂^1_1) + (∂^0_2 − ∂^1_2)`.
- The product of a Massey-degenerate cube with any cube is Massey-degenerate (the unused
  coordinate stays unused), so the cross product descends to normalized chains; in Serre's
  convention the product of a cube independent of its first coordinate with a cube depending
  on its last coordinate is not Serre-degenerate, which is why Serre's normalization is not
  used.

### 0.3 Comparison with simplicial singular chains

Construct the comparison with AlgebraicTopology's simplicial singular chains as a natural chain
homotopy equivalence, by acyclic models on cubes and simplices (Massey Chapter VII). Prove that
it is compatible with cross products up to a specified natural chain homotopy, through
Eilenberg–Zilber, and with relative chains. Derive, through the comparison and not by a second
proof: homotopy invariance; the long exact sequence of a pair; excision; the Künneth theorems;
cubical local coefficients; Layer 1 item 2's Serre spectral sequence, transported to cubical
chains by its filtered comparison and local-coefficient chain maps. *Needs:* items 1–2,
AlgebraicTopology Stages 2 and 5.1–5.4, Layer 1 item 2 (for the last consequence).

**Checks.**
- The cubical and simplicial homology of `S¹` and of a point agree through the comparison map
  (worked example 1).
- On `0`-chains the comparison is the identity on points, and on `1`-chains it sends a path to
  the same path viewed as a `1`-simplex, so the degree-one Hurewicz isomorphism of Layer 1
  item 1 transports with no sign.
- The comparison is not compatible with cross products on the nose: the cubical product of two
  `1`-cubes is one `2`-cube, while the simplicial Eilenberg–Zilber product of two `1`-simplices
  is the sum of two `2`-simplices.

### 0.4 Fundamental chains of manifolds with corners

Prove that a compact oriented topological manifold with corners whose boundary is a union of
products of lower-dimensional ones has a fundamental chain rel boundary in `C^□_*`, whose
boundary is the signed sum of the cross products of the fundamental chains of the faces
(Barraud–Cornea, *Lagrangian intersections and the Serre spectral sequence*, Appendix A; BDHO
Appendix A). This is the chain-level input of every representing chain system in Layers 5 and
8. The only homological fact used is that the connecting map `H_n(M, ∂M) → H_{n−1}(∂M)` sends
the fundamental class rel boundary to the fundamental class of the boundary. Topological
manifolds with corners suffice for these representing-chain systems; regular analytic moduli
loci still require their differentiable charts, tangent-kernel identifications, smooth group
actions and oriented Fredholm gluing, and a smooth atlas on every compactification stratum is
not a hypothesis of the fundamental-chain theorem. *Needs:* items 1–3, AlgebraicTopology Stage
6.3 (fundamental classes).

**Checks.**
- `I` has fundamental chain the identity cube, with boundary `(1) − (0)`.
- `I²` has fundamental chain the identity `2`-cube, with boundary the signed sum of its four
  edges, which is the cross-product formula for `∂(I × I)`.
- A compact `1`-manifold with boundary `[0, 1] ⊔ S¹` has fundamental chain the sum of the
  interval and a loop; its boundary is `(1) − (0)`, the fundamental chain of `∂`.

### Examples

- `H^□_*(pt)` and `H^□_*(S¹)`, through items 1 and 3.
- `C^□_*(Ω(pt)) = C^□_*([0, ∞))`, a DG algebra under addition of durations, augmented to `A`.

### Dependencies

Mathlib `ContinuousMap`, `unitInterval`; AlgebraicTopology Stages 2, 5.1–5.4 and 6.3; Layer 1
item 2 for the transported Serre sequence. Source: Massey, *Singular Homology Theory*, Chapters
II and VII; Serre, *Homologie singulière des espaces fibrés*, Chapter II; BDHO §5.2 and Appendix
A; Barraud–Cornea, Appendix A.

## Layer 1: topological prerequisites

These are general facts that the later layers use, which no other roadmap builds.

### 1.1 Hurewicz in degree one

Consume AlgebraicTopology Stage 8.3's Hurewicz map `h : π₁(X, x) → H₁(X; ℤ)`, sending a loop to
the class of its singular `1`-simplex, on AlgebraicTopology's native simplicial singular
`H₁(X; ℤ)`. Prove that for a path-connected space `h` is surjective with kernel the commutator
subgroup, so that it induces a natural isomorphism `π₁(X, x)ᵃᵇ ≅ H₁(X; ℤ)` (Hatcher Theorem
2A.1). Transport the isomorphism to cubical chains through Layer 0 item 3, with no independent
sign or map. The source uses it for `H₁(Ω²Q) ≅ π₃(Q)` in Proposition 5.11. *Needs:*
AlgebraicTopology Stage 8.3 (the map), Stage 2 (singular homology), Layer 0 item 3.

**Checks.**
- `S¹`: `π₁ = ℤ = H₁`, and `h` sends the standard loop to the generating `1`-cycle.
- `S¹ ∨ S¹`: `π₁` is free on `a, b`, `H₁ = ℤ²`, and the commutator `aba⁻¹b⁻¹` is nullhomologous
  (its `1`-cycle bounds the `2`-chain of a square with identified edges) but not nullhomotopic.
- `ℝP²`: `π₁ = ℤ/2 = H₁`. Path-connectedness is needed for surjectivity: for `X = S¹ ⊔ pt`,
  `H₁(X) = ℤ` while `π₁(X, pt) = 0`.

### 1.2 Weak equivalences, CW approximation, Serre fibrations and their spectral sequences

**CW approximation.** Prove that every space has a CW approximation `Z → X`, a weak homotopy
equivalence from a CW complex, natural up to homotopy, with a single `0`-cell when `X` is path
connected (Hatcher Proposition 4.13). *Needs:* AlgebraicTopology Stage 4.

**The connected-map homology comparison.** Own the comparison, consumed by CharacteristicClasses
under the name connectedMapHomologyComparison, and its weak-equivalence specialization on native
simplicial singular and twisted chains: a weak homotopy equivalence induces isomorphisms on
homology and cohomology with every coefficient system (Hatcher Proposition 4.21), and a
`k`-connected map induces isomorphisms below degree `k` and a surjection in degree `k`. One
route is the Eilenberg subcomplex argument: formulate connectivity by relative disc and sphere
compression and homotopy lifting; for a `k`-connected mapping-cylinder pair generate the
subcomplex by simplices carrying their `k`-skeleton into the subspace; construct face-compatible
homotopies `P(σ)`, fixing compressed simplices and relative faces, and the prism chain
equivalence; transport local coefficients along `P` at vertices with face and prism
compatibility. The complexes agree through degree `k`. For a weak equivalence compress
compatibly in every degree to obtain the coefficient-chain homotopy equivalence and its Hom and
cohomology comparison, for maps of pairs and their exact sequences. This route uses neither
AlgebraicTopology 8.1's relative homotopy groups nor 8.3's Hurewicz theorem; Hatcher's route
through the mapping cylinder and the relative Hurewicz theorem is another. *Needs:*
AlgebraicTopology Stages 2 and 4, Tau Ceti twisted singular homology.

**Serre fibrations.** Define a **Serre fibration** as a continuous map `p : E → B` with the
homotopy lifting property for every cube `Iⁿ`, `n ≥ 0`: every homotopy `Iⁿ × I → B` with a lift
of its initial slice lifts to `E` (Hatcher, the maps of Theorem 4.41, with the terminology at
p. 376). Prove that cube lifting is equivalent to disc lifting and to lifting for the pairs
`(Iⁿ, ∂Iⁿ)`, and to lifting for every CW pair (Hatcher, the remarks after Theorem 4.41 and
before Proposition 4.48). Prove: the class is stable under pullback along any continuous map
(the lift into the pullback is the pair of the base homotopy and a lift into `E`; Hatcher §4.3,
the paragraph introducing pullback fibrations), under composition, under finite products and
under retracts; the projection `B × F → B` and every covering map are Serre fibrations; a
locally trivial bundle is a Serre fibration with no paracompactness hypothesis (Hatcher
Proposition 4.48). Construct the fibration homotopy exact sequence directly by disc lifting
and endpoint restriction, retaining group laws and pointed-set exactness at `π₁` and `π₀`
(Hatcher Theorem 4.41), without consuming AlgebraicTopology 8.1's relative-pair sequence:
construct the boundary by the relative lift and endpoint restriction, prove representative and
lift independence by a further relative cube lift, and naturality for commuting based squares;
pin all concatenation comparisons to the native `transAt` order. At the low end retain pointed
sets, component actions and image-equals-kernel exactness, with no module carrier for `π₁` or
components. Every-fibre weak contractibility, including nonemptiness, gives a weak equivalence
by this sequence and component lifting; homotopy equivalence additionally uses CW-type
witnesses and AlgebraicTopology 8.5's Whitehead theorem. A chosen fibre alone gives no
conclusion on unrelated base components. *Needs:* Mathlib `ContinuousMap`, `unitInterval`,
`IsCoveringMap`; AlgebraicTopology Stages 1–4.

**All-CW testing and the based fibration sequence.** Own the comparison between cube testing
and homotopy lifting for every Hausdorff CW parameter, in the displayed universe: prove the
finite disc-cylinder pair homeomorphism from bottom to bottom-and-boundary-cylinder, use it for
prescribed boundary and bottom lifts, and extend cellwise over a native relative CW pair,
keeping arbitrary dimensions and cell sets; glue through attaching quotient diagrams and prove
the product weak-topology lemma for the compact Hausdorff interval. Empty pairs and `0`-cells
are included. This relative-CW lifting, not disc testing alone, fixes basepoint tracks for the
finite sphere and cube representatives and their homotopies. For arbitrary well-pointed
parameters the Hurewicz lane consumes GeneralizedCohomology G2.10's fixed-data closed-NDR
relative lifting. Paracompactness is retained where Layer 2 asks for the stronger
Hurewicz-fibration property. *Needs:* the preceding paragraph, AlgebraicTopology Stage 4.

**Checks (Serre fibrations).**
- The projection `B × F → B` lifts a homotopy `g_t : Iⁿ → B` with initial lift `(g_0, h)` by
  `(g_t, h)`.
- The plus sign `P = {(x, y) ∈ [−1, 1]² | xy = 0}` projected to `[−1, 1]` by `(x, y) ↦ x` is not
  a Serre fibration: the path `t ↦ t` from `0` has no lift starting at `(0, 1)`, since for
  `t > 0` the only points over `t` have `y = 0`, so cube lifting fails already for `n = 0`.
- The double cover `S¹ → S¹`, `z ↦ z²`, is a Serre fibration by unique path lifting, and its
  exact sequence gives `π₁(S¹) → π₁(S¹)` multiplication by `2` with cokernel `π₀` of the fibre,
  `ℤ/2`.
- The pullback of the Hopf map `S³ → S²` along a constant map is the product `S¹ × pt`, and
  the pullback along the identity is the Hopf map; a definition of pullback that forgot the
  second coordinate's lift would fail the homotopy lifting property for the first.

**The homological Serre spectral sequence over a CW base.** Own, for every path-connected CW
base, the spectral sequence consumed by AlgebraicTopology Stage 5.5 under the name
arbitraryCWSerreSpectralSequence, using AlgebraicTopology Stages 1–4 and the filtration
`E_p = p⁻¹(B^{(p)})`, with `E_{−1}` empty. Prove that singular chains are exhausted by this
filtration using compact simplex images and the cellular filtration comparison. Apply item 3's
filtered-complex construction; identify `E²_{p,q} = H_p(B; H_q(F; R))` with path-transport
monodromy, and prove convergence to `H_{p+q}(E; R)`. In each total degree the first-quadrant
filtration is finite, exhaustive and separated; identify its graded pieces with `E^∞`,
including the extension data. No finite-type or dimension bound is imposed on `B` or `F`.
Prove naturality under maps of fibrations and coefficient maps, and the componentwise version.
*Needs:* the Serre-fibration targets above, item 3, AlgebraicTopology Stages 1–4, Tau Ceti
`LocalCoefficientSystem`.

**The arbitrary-base sequence.** For a Serre fibration over an arbitrary path-connected space
`B`, pull back along a CW approximation `B' → B`. Prove the induced total-space map is a weak
equivalence by the fibration homotopy sequence, including components, and identify its
local-coefficient homology maps and the base local-coefficient homology comparison. Transport
the preceding spectral sequence, its `E²` page, convergence and abutment filtration to the
original fibration (the sequence consumed by AlgebraicTopology under the name
arbitraryBaseSerreSpectralSequence). Prove independence of the CW approximation via comparison
refinements and naturality from `E²` onward; give the disconnected-base version. These targets
use AlgebraicTopology Stages 1–4 and item 3, with no Stage 5.5 or GeneralizedCohomology input,
and precede item 4. The source applies them over `Ω₀Q`, `Ω²B` and `Y`. *Needs:* the two
preceding paragraphs.

**The cohomological and multiplicative sequences.** Own the cohomological Serre spectral
sequences over CW and arbitrary bases on the same skeletal filtration, using the dual filtered
cochain complex and its relative quotients, including the cellular and singular filtration
comparison; cohomology pages are not identified by naive duality of homology pages. The
cohomological sequence has `E₂^{p,q} = H^p(B; H^q(F; M))`, with path-transport local
coefficients, and converges to `H^{p+q}(E; M)`. Prove first-quadrant strong convergence: the
induced abutment filtration in each total degree is finite, exhaustive and separated, with
`E_∞` its graded module. Prove completeness of the cochain inverse filtration and vanishing of
the relevant inverse-limit obstruction; retain the absence of finite-type or dimension
restrictions. Construct coefficient and fibration naturality, arbitrary-base pullback comparison
and independence, and componentwise forms. For a commutative ring `R` and local-system pairing
`M ⊗_R N → P`, own the multiplicative comparison: consume AlgebraicTopology 4.5's CW structure
on `k(B × B)`, its product-cell filtration `(B × B)_m = ⋃_{i+j ≤ m} B^i × B^j` and cellular
approximation `D` of `Δ_B`; own a compatible filtered CW approximation `q : E' → E` with CW
subcomplexes `E'_p` and `q_p : E'_p → E_p` weak equivalences, including relative pair
comparisons and filtered local-cochain maps that are quasi-isomorphisms on the relative
filtration quotients; first pull back `p × p` along `k(B × B) → B × B` and then along `D`; lift
the diagonal-to-`D` homotopy only on the CW source `E'`, cell by cell with the fixed faces;
construct its product-filtered cup map and transport through those filtered comparisons; do not
assert the ordinary Alexander–Whitney product is filtered on `E_p`. Own the preimage excision
consumed under the name serrePreimageSubcomplexExcision: preimages of CW subcomplexes `A, B`
under a Serre fibration over a CW base form an excisive couple for native singular and twisted
chains and relative-cochain products; consume AlgebraicTopology 4.5's compatible open
neighbourhoods of `A`, `B` and their intersection and union, prove each preimage inclusion over
the deformation retraction is a weak equivalence by the fibration sequence and component path
lifting, apply the weak-equivalence coefficient-chain comparison and AlgebraicTopology Stage 3's
open excision to the intersection-union diagram, and construct the small-chain
quasi-isomorphism `C(E_A) + C(E_B) → C(E_{A∪B})` and the relative cochain map, with chosen
inverses and homotopies only up to specified natural homotopy; iterate it for the finite
product-skeletal union in each `m` to define the product-filtered cup on a small-chain relative
model. Use the pullback stability and finite-product stability of Serre fibrations above, and
identify `g^*(M ⊠ N)` with `q^*(M ⊗ N)` by inverse transport along the lifted diagonal-to-`g`
homotopy, using AlgebraicTopology Stage 2's transport of local systems along paths; retain
that identification in cups. Own comparison prisms raising the base filtration by at most one,
giving independence and naturality of the resulting pairings from `E₂` onward and preserving
the abutment cup product. For fixed choices construct all `E_r` pairings; the `E₂` pairing is
`(−1)^{q p'}` times the local-coefficient cup pairing in every bidegree. In trivial-monodromy
tensor coordinates the product has Koszul sign `(a ⊗ x)(b ⊗ y) = (−1)^{q p'} (ab ⊗ xy)`, with `x`
in fibre degree `q` and `b` in base degree `p'`. State `d_r : E_r^{p,q} → E_r^{p+r,q−r+1}` and
`d_r(uv) = d_r(u) v + (−1)^{p+q} u d_r(v)`, and prove multiplicative abutment and extension
compatibility. For a field `k`, a simply connected base and degreewise finite-dimensional
`H^q(F; k)`, own the natural `E₂` graded-algebra identification `H^*(B; k) ⊗_k H^*(F; k)`,
proving the local tensor and cohomology comparison that gives the algebra, not just its vector
space. For the ring sequence take constant `R` and its multiplication. Use AlgebraicTopology
6.0–6.2's cochain and cup API and item 3's cohomological filtered construction, independently
of duality, Eilenberg–MacLane constructions and GeneralizedCohomology G5, which consumes this
supplier for rational `K(ℤ, n)`. *Needs:* the preceding paragraphs, item 3, AlgebraicTopology
Stages 2, 3, 4.5 and 6.0–6.2.

**Checks (spectral sequences).**
- The trivial fibration `B × F → B` with `F` connected: `E² = H_*(B) ⊗ H_*(F)` over a field and
  the sequence collapses to Künneth; a monodromy convention that transported along the inverse
  path would still collapse here, so the next check pins it.
- The double cover `S¹ → S¹`: `E²_{p,q} = H_p(S¹; ℤ[ℤ/2])` with the swap action, `H_0 = ℤ`,
  `H_1 = ℤ`, converging to `H_*(S¹)`; with the trivial action the abutment would be
  `H_*(S¹ ⊔ S¹)`, which is wrong.
- The Hopf fibration `S¹ → S³ → S²`: `E²` has `ℤ` at `(0,0), (2,0), (0,1), (2,1)`, and
  `d²: E²_{2,0} → E²_{0,1}` is an isomorphism, leaving `H_*(S³)`; the cohomological sequence
  has the same shape with `d₂(x) = y` for the fibre generator `x ∈ E₂^{0,1}` and the base
  generator `y ∈ E₂^{2,0}`, and the product `xy ∈ E₂^{2,1}` is the class that survives to
  generate `H³(S³)`.
- The path-loop fibration over `S²`: `E²_{p,q} = H_p(S²) ⊗ H_q(ΩS²)` with `H_q(ΩS²) = ℤ` in
  every `q ≥ 0`, and the sequence converges to `H_*(pt)`, which forces `H_q(ΩS²) = ℤ` for every
  `q` by induction on the transgression; this is the computation of worked example 4.

### 1.3 The spectral sequence of a filtered complex

Reuse Mathlib's `CategoryTheory.Abelian.SpectralObject`, `SpectralObject.spectralSequence`,
`coreE₂Cohomological` and `HomotopyCategory.spectralObjectMappingCone`, and own the filtration
functor and the convergence theory. For an increasing filtration of a module chain complex over
a ring, assume degreewise filtration lower bounds `∀ n, ∃ s(n), F_{s(n)} C_n = 0` and exhaustion
`⋃_p F_p C_n = C_n`. Construct the sequence `E¹_{p,q} = H_{p+q}(F_p C / F_{p−1} C)` as an
instance of Mathlib's spectral object: regrade `C^{−n} = C_n` with the same differential,
construct the `EInt`-indexed increasing filtration functor with `0` and `C` at its infinite
endpoints, pull `HomotopyCategory.spectralObjectMappingCone` back along it and compose with the
degreewise cohomology homological functor; use `coreE₂Cohomological`. The stated homological
`E_r^{p,q}` is its page `r + 1` at bidegree `(a, b) = (1 − 2p − q, p − 1)`, so
`deg = a + b = −(p + q)`, `i₁ = p − 1` and `i₂ = p`. For a decreasing cochain filtration `F^p`,
use the increasing functor `G_t = F^{−t}`; its cohomological `E_r^{p,q}` is page `r + 1` at
`(a, b) = (2p + q + 1, −p − 1)`, so `deg = p + q`, `i₁ = −p − 1` and `i₂ = −p`. Prove the
quotient-page identifications and the representative-boundary differential formula, retaining
the mapping-cone and reindexing signs. Prove natural strong convergence in the following sense:
the induced filtration `F_p H_n = im(H_n(F_p C) → H_n(C))` is exhaustive and bounded below
(hence separated and complete in its lower-filtration direction), and
`E^∞_{p,q} ≅ F_p H_{p+q} / F_{p−1} H_{p+q}` naturally; no finite upper filtration bound is
required (Weibel, Classical Convergence Theorem 5.5.1(2); the lower bound concerns the
filtration in each chain degree, not the degrees in which the complex is nonzero). Own the
cohomological form of Weibel's Complete Convergence Theorem 5.5.10 for complete exhaustive
decreasing cochain filtrations with regular spectral sequence: prove weak convergence and its
induced cohomology filtration and `E∞` graded identification, and strong convergence under the
theorem's degreewise spectral boundedness after cohomological reindexing, using the Milnor
`lim¹` sequence; the first-quadrant case is regular and degreewise bounded. In the Serre
instance prove completeness of the inverse cochain filtration and the degreewise finite
abutment filtration. Cup pairings come from filtered cochain maps, independently of
convergence. *Needs:* Mathlib `CategoryTheory.Abelian.SpectralObject`,
`SpectralObject.spectralSequence`, `coreE₂Cohomological`,
`HomotopyCategory.spectralObjectMappingCone`, `EInt`; `HomologicalComplex`.

**Checks.**
- A two-step filtration `0 ⊆ F_0 C ⊆ F_1 C = C` gives `E¹` the homologies of `F_0 C` and
  `C/F_0 C`, `d¹` the connecting map, `E² = E^∞`, and the abutment the long exact sequence of
  the pair; a reindexing error in `(a, b)` would place the connecting map in the wrong bidegree.
- The filtration of a complex by its skeleta `F_p C_n = C_n` for `n ≤ p` and `0` otherwise
  gives `E¹_{p,q} = C_p` for `q = 0`, `d¹ = ∂`, `E² = H_*(C)` concentrated on the row `q = 0`,
  and the identification `E^∞_{p,0} = H_p(C)` is the identity.
- The trivial filtration `F_p C = C` for `p ≥ 0` and `F_p C = 0` for `p < 0` is bounded below
  and exhaustive, with `E¹` concentrated in `p = 0` and equal to `H_*(C)`; the filtration
  `F_p C = C` for every integer `p` is exhaustive but not bounded below, every `E^r` page is
  zero, and a convergence statement that dropped the lower bound would wrongly conclude
  `H_*(C) = 0`.

### 1.4 Serre classes, Eilenberg–MacLane spaces and mod-2 vanishing

**Serre classes.** Define a Serre class as a class of abelian groups closed under subgroups,
quotients and extensions, and satisfying Serre's axioms for `⊗`, `Tor` and the homology of
`K(A, 1)`. Prove Hurewicz modulo a Serre class for simply connected spaces (Serre 1953, Theorem
1; the source's Theorem 5.12). Instances: the torsion groups (equivalently `G ⊗ ℚ = 0`), and,
for a fixed integer `d ≥ 1`, the groups annihilated by **some** power of `d`, `∃ m, dᵐ·G = 0`.
*Needs:* AlgebraicTopology Stages 2, 4 and 8.1–8.7, item 2, item 3.

**Checks (Serre classes).**
- The groups annihilated by one fixed `dᵐ`, for `d ≥ 2` and `m ≥ 1`, do not form a class: they
  are not closed under extensions (`ℤ/4` is an extension of `ℤ/2` by `ℤ/2`).
- The class `{G | G ⊗ ℤ/2 = 0}` used in the source's proof of Theorem 5.15 is not a Serre
  class: `ℚ` belongs to it and its subgroup `ℤ` does not. It is replaced by the mod-2 vanishing
  theorem below.
- The torsion groups form a Serre class, and Hurewicz modulo it gives
  `π_n(X) ⊗ ℚ ≅ H_n(X; ℚ)` for `n` up to the first rational homotopy group.

**Eilenberg–MacLane spaces.** Pin one functorial abelian model in each degree. For `n = 1` set
`K(A, 1) = B(Multiplicative A)`, an alias of AlgebraicTopology Stage 8.8's native
`|nerve (SingleObj (Multiplicative A))|`; that stage owns the generic contractible `Eπ`,
covering, CW structure and fundamental-group edge normalization, and has no dependency on this
item. For `n ≥ 2` use the realization of the simplicial abelian group `Γ(A[n])` from Mathlib's
Dold–Kan equivalence, with `A[n]` the nonnegative chain complex concentrated in degree `n`.
Consume AlgebraicTopology Stage 4's generic simplicial-realization CW structure. Construct the
coefficient-natural identification `π_n ≅ A` through Stage 8.2's simplicial-group Kan and Moore
theorem and Kan realization-unit comparison, followed by the cubical comparison and the
degree-`n` homology map of the native Dold–Kan counit `NΓ(A[n]) ≅ A[n]`; thus the distinguished
class from a normalized simplex labelled `a` maps to `a`. Pin the positive sphere orientation
by Stage 8.6. In degree one compare `Γ(A[1])` with the abelian nerve as simplicial abelian
groups, with the edge labelled `a` corresponding to `a`; use the bar carrier throughout. Prove
all other positive homotopy groups vanish. Thus Stage 8.10 consumes a fixed constructor and
normalized identification, without constructing another abelian model; the construction uses
only Stages 8.1–8.8, not 8.9–8.12. For a **directed union** `A = ⋃ A_i` of subgroups, prove the
corresponding simplicial inclusions are subcomplexes with union the chosen model, so
`H_*(K(A, n)) = colim H_*(K(A_i, n))` by compact supports. No statement about arbitrary
topological filtered colimits is made: the topological colimit of `S¹ → S¹ → ⋯` under degree-2
maps is indiscrete and is not `K(ℤ[1/2], 1)` (its mapping telescope is one, but is not used).
Native `IsEilenbergMacLaneSpaceOne` supplies the degree-one interface. *Needs:* AlgebraicTopology
Stages 4, 8.2, 8.6 and 8.8; Mathlib's Dold–Kan equivalence; Tau Ceti `IsEilenbergMacLaneSpaceOne`.

**Presentation model and skeletal extension.** Own a second, comparison CW construction of
`K(A, n)` from a presentation of `A`: for `n ≥ 2` start with a wedge of positively oriented
`n`-spheres for its generators, attach `(n+1)`-cells along its relations, and kill successive
higher homotopy groups by cells in dimensions `≥ n + 2`; for `n = 1` use the group-presentation
`2`-complex of `A` and kill higher homotopy in dimensions `≥ 3`. Prove each stage preserves `π_n`
and the lower groups, and prove the limit's homotopy groups by compact-family factorization
through the CW tower. Give the coefficient-normalized comparison to the chosen bar and Dold–Kan
model, using the skeletal extension below and Whitehead; the chosen functorial carrier stays
that single model. Own Hatcher's Lemma 4.31 skeletal extension: realize a supplied homomorphism
on `π_n` by maps of the generator spheres, extend over the presentation cells using their null
relations, and over every higher cell using the target's vanishing higher homotopy; construct
the based maps and homotopies and prove their coefficient normalization. Likewise own the
general higher-cell killing construction with its connectivity and preserved lower-group
claims (Hatcher §4.1), using AlgebraicTopology Stage 4's cell attachments and Stages 8.1–8.7.
*Needs:* AlgebraicTopology Stages 4 and 8.1–8.7.

**Uniqueness.** For the CW complex `K(A, n)` above and any space `Z` with `π_n Z ≅ A` and all
other homotopy groups zero, a map `K(A, n) → Z` realizing a given isomorphism on `π_n` exists by
the presentation and skeletal extension and is a weak equivalence (Hatcher Proposition 4.30).
Construct it first on the presentation model, and precompose with a based homotopy inverse of
the coefficient-normalized presentation-to-bar comparison to obtain the map on the chosen
functorial carrier. Use Whitehead's theorem from Stages 8.1–8.7 and CW approximation from item 2
for the CW comparison. The normalized identification uses Stage 8.2's ordered-simplex and cube
orientation comparison: a spherical `n`-simplex labelled `a` has cubical Hurewicz image the
relative class `σ_*[Δⁿ, ∂Δⁿ]`, transported to absolute homology by the point-pair sequence for
`n ≥ 1`; separately its normalized Moore class maps to `a` under the native Dold–Kan counit,
which does not act directly on the topological singular homology class. This fixes the
constructor's sign. Stage 8.10 proves the downstream universal-class evaluation `e_a ↦ a`; this
item consumes no such class. Through item 2, every `K(A, n)` has the homology of the chosen
degree-one bar or higher-degree Dold–Kan model. The chosen models and the targets `Z` are path
connected; `π₀` is included explicitly. *Needs:* the two preceding paragraphs, item 2.

**Path and homotopy-fibre carriers.** Consume GeneralizedCohomology G2.10 for the based
path-loop fibration and mapping-path homotopy fibre, including its endpoint-evaluation Hurewicz
fibration, comparison with item 2's Serre fibrations and contractibility of the based path
space. Apply item 2's fibration homotopy sequence, including its component terms, to these
Hurewicz fibrations; G2.10's constructions need only early G2.1, so the order is item 2, then
G2.10's exact-sequence applications, then this item. Identify the loop fibre `ΩK(A, n)` with
`K(A, n−1)` for `n ≥ 2` through the uniqueness target above, after CW approximation, using the
coefficient-natural connecting isomorphism on `π_{n−1}`; this comparison consumes no Stage 8.11
result and no Eilenberg–MacLane representability. *Needs:* GeneralizedCohomology G2.10, item 2,
the preceding paragraphs.

**Integral and mod-2 chain comparison.** Own the homology Bockstein sequence needed here. For
AlgebraicTopology's native simplicial integral singular chain complex `C_ℤ`, prove degreewise
freeness and the natural degreewise short exact sequence `0 → C_ℤ → C_ℤ → C_ℤ ⊗_ℤ 𝔽₂ → 0`, the
first map multiplication by `2`; identify the quotient complex with the native simplicial `𝔽₂`
singular chains, restricted from `𝔽₂`-modules to `ℤ`-modules. Prove the restriction-of-scalars
homology comparison and instantiate the native homology long exact sequence over `ℤ`; export its
maps, exactness and naturality. In particular, vanishing of `H_{i+1}(Z; 𝔽₂)` and `H_i(Z; 𝔽₂)`
makes multiplication by `2` on `H_i(Z; ℤ)` bijective. This comparison precedes the one-step
lemma and uses no homology universal-coefficient theorem. Export also the natural surjection
`H₁(Z; ℤ) → H₁(Z; 𝔽₂)` from the torsion-free `H₀(Z; ℤ)` term, and its identification with the
quotient by `2`. *Needs:* AlgebraicTopology Stage 2.

**Vanishing of `H̃_*(K(A, n); 𝔽₂)` for a `ℤ[1/2]`-module `A`.** For `n = 1`: `A` is the
directed union of its finitely generated `ℤ[1/2]`-submodules, which are finite sums of copies of
`ℤ[1/2]` and of finite cyclic groups of odd order, so by the directed-union property and Künneth
it suffices to treat these two. Construct the canonical map `|N(A × B)| → |N(A)| × |N(B)|`
induced by the two group projections; Stage 8.8 identifies its `π₁` map with the identity on
`A × B` and all higher groups with zero, so it is a weak equivalence, and item 2's homology
invariance and Stage 5.1's field Künneth theorem give the natural homology product formula. For
`ℤ[1/2] = ⋃_r 2^{−r}ℤ`: each `2^{−r}ℤ ≅ ℤ`, and under these identifications the inclusion
`2^{−r}ℤ ⊂ 2^{−r−1}ℤ` is multiplication by `2`; by uniqueness, `K(ℤ, 1)` has the homology of
`S¹`, and `H₁(K(G, 1)) ≅ Gᵃᵇ` naturally in `G` (item 1); the chain comparison identifies the
induced mod-2 `H₁` map as multiplication by `2`, hence zero, so
`H̃_*(K(ℤ[1/2], 1); 𝔽₂) = colim(𝔽₂ → 𝔽₂ → ⋯) = 0` along zero maps. For a finite cyclic group of
odd order, consume Stage 8.8's bar-space and group-cohomology comparison and construct the
finite-group averaging contraction on its positive-degree bar cochain complex: its order is
invertible in `𝔽₂`, so its positive group cohomology with trivial `𝔽₂` coefficients vanishes;
Stage 6's field universal-coefficient comparison identifies this cohomology with the dual of
homology, and a vector space with zero dual is zero. For `n ≥ 2`: induction through the
path-loop fibration `K(A, n−1) → P → K(A, n)` over the simply connected base `K(A, n)`; the
mod-2 Serre spectral sequence has `E²` concentrated in the bottom row, which is
`H_*(K(A, n); 𝔽₂)`, so `E² = E^∞`, and the total space is contractible. *Needs:* the preceding
paragraphs, item 2, AlgebraicTopology Stages 5.1, 6 and 8.8.

**The one-step lemma.** Let `n ≥ 2` and let `Z` be an `(n−1)`-connected space with
`H̃_*(Z; 𝔽₂) = 0`. Then `π_n Z ≅ H_n(Z; ℤ)` (Stage 8.3's Hurewicz theorem, on the native
simplicial integral carrier) is uniquely 2-divisible, since the chain comparison and the
vanishing of mod-2 homology in degrees `n` and `n + 1` make `×2` on `H_n(Z; ℤ)` bijective.
After CW approximation (item 2), attaching cells of dimension `≥ n + 2` to `Z` kills `π_k` for
`k > n` and produces a `K(π_n Z, n)` containing `Z`, with `Z → K(π_n Z, n)` an isomorphism on
`π_n` (Hatcher §4.1). Let `Z' → Z` be its homotopy fibre. Then `Z'` is `n`-connected,
`π_k Z' ≅ π_k Z` for `k > n`, and the fibre of `Z' → Z` is `ΩK(π_n Z, n)`, a `K(π_n Z, n−1)`.
Then `H̃_*(Z'; 𝔽₂) = 0`: the mod-2 Serre spectral sequence of `K(π_n Z, n−1) → Z' → Z` has a
simply connected base, `H̃_*(Z; 𝔽₂) = 0`, and `H̃_*(K(π_n Z, n−1); 𝔽₂) = 0` by the previous
paragraph, so `E²` is concentrated at `(0, 0)`. The Eilenberg–MacLane fibre sits over the
`(n−1)`-connected stage `Z`, never over the original space: for `Y = S²` and `n = 3`, a
3-connected `E` in a fibre sequence `K(π₃S², 2) → E → S²` would give
`0 = π₂(E) → π₂(S²) = ℤ → π₁(K(π₃S², 2)) = 0` in the long exact sequence, which is impossible.
Iterating the lemma produces the Whitehead tower `⋯ → Y⟨n+1⟩ → Y⟨n⟩ → ⋯ → Y⟨2⟩ = Y` with
`K(π_n Y, n−1) → Y⟨n+1⟩ → Y⟨n⟩` between **successive** stages; the tower as a whole is not
needed. *Needs:* the preceding paragraphs, item 2, AlgebraicTopology Stage 8.3.

**Mod-2 vanishing.** For a simply connected space `Y` with `H̃_*(Y; 𝔽₂) = 0`, every `π_i(Y)` is
uniquely 2-divisible (a `ℤ[1/2]`-module); no finite generation is assumed. In `Suggested.lean`
this is `bijective_sq_homotopyGroup_of_mod_two_acyclic`, with the coefficient group `ZMod 2`
taken as a `ℤ`-module and the conclusion that squaring is bijective on `π_{n+2}(Y, y)`. The
proof is the induction: start with `Z = Y`, which is 1-connected, and `n = 2`; the lemma shows
that `π_2 Y` is uniquely 2-divisible and gives a 2-connected `Z'` with `H̃_*(Z'; 𝔽₂) = 0` and
`π_k Z' ≅ π_k Y` for `k ≥ 3`; applying it to `Z'` with `n = 3`, and so on, shows that every
`π_i(Y)`, `i ≥ 2`, is uniquely 2-divisible, and `π_1 Y = 0`. Only this direction is used. A
uniquely 2-divisible group has `G ⊗ ℤ/2 = 0`, which is how Layer 10 item 5 applies it. *Needs:*
the one-step lemma.

**Checks (Eilenberg–MacLane spaces and mod-2 vanishing).**
- `K(ℤ, 1) = S¹` up to weak equivalence and `K(ℤ/2, 1) = ℝP^∞`; `H̃_*(ℝP^∞; 𝔽₂) ≠ 0`, and
  `ℤ/2` is not a `ℤ[1/2]`-module, so the vanishing theorem's hypothesis correctly excludes it.
- `K(ℤ/3, 1)` has `H̃_*(−; 𝔽₂) = 0`, since `H_*(ℤ/3; 𝔽₂)` vanishes in positive degrees (the
  order `3` is a unit in `𝔽₂`), and `ℤ/3` is uniquely 2-divisible.
- A point satisfies the mod-2 vanishing hypothesis and the conclusion trivially; the Moore
  space `M(ℤ/3, 2)` is simply connected with `H̃_*(−; 𝔽₂) = 0`, and its `π_2 = ℤ/3` is uniquely
  2-divisible, as the theorem predicts; `S³` has `H̃_3(S³; 𝔽₂) ≠ 0` and `π_3 = ℤ` is not
  2-divisible.
- The fibre placement check above: `K(π₃S², 2) → E → S²` with `E` 3-connected is impossible.

### 1.5 Pontryagin–Thom collapse

For a closed codimension-`k` submanifold `N` of a closed manifold `M` with a framed normal
bundle, construct the collapse map `M → S^k` determined by a chosen tubular neighbourhood (from
GeometricTopology Layer 1) and the framing: the tube's normal-bundle identification and the
framing identify a closed tube with `N × D^k`; collapse the complement of its interior to the
basepoint of `S^k = D^k/∂D^k`. A Euclidean ambient space is the special case in which the
ambient manifold is replaced by its one-point compactification. Prove independence of the
choices up to based homotopy, the effect on fundamental classes, and compatibility with shriek
maps. *Needs:* GeometricTopology Layer 1, AlgebraicTopology Stage 6.

**Checks.**
- `N` a point in `Sⁿ` with the standard framing: the collapse `Sⁿ → Sⁿ` has degree `±1`
  according to the framing's orientation, and reversing one framing vector reverses the degree.
- `N = ∅`: the collapse is the constant map to the basepoint.
- `N` two points in `S¹` with framings of the same orientation: the collapse `S¹ → S¹` has
  degree `2`; with opposite orientations, degree `0`.

### 1.6 Diffeomorphism groups and evaluation orbits

For a closed smooth manifold `M` with a chosen point `x₀` consume GeometricTopology Layer 3's
`C^∞` topological group `Diff(M)`, its composition and inverse continuity, smooth-families map,
orthogonal sphere action and compact-embedding restriction bundle onto the `Diff` orbit.
Specialize that restriction construction to a point, identify its `C^∞` embedding space with
`M` through the evaluation and inverse maps, and let `O` be the orbit of `x₀` and
`H = {g | g(x₀) = x₀}`. Compare the resulting supported local sections with coordinate-ball
motions from compactly supported smooth vector fields. If `g(x₀) = y`, compose a local motion
taking `y` to `z` with `g` to obtain a continuous local section `s : U → Diff(M)` over an open
neighbourhood `U` of `y` in `O`. Export evaluation `Diff(M) → O` as a locally trivial principal
right-`H` bundle, with the mutually inverse maps `g ↦ (g(x₀), s(g(x₀))⁻¹ g)` and
`(z, h) ↦ s(z) h` (Palais 1960). For connected `M`, join `x₀` to `y` by a path covered by
finitely many coordinate balls and compose the supported motions to prove `O = M`; this gives
the bundle over `M` without an orientation hypothesis. For disconnected `M` retain the orbit
formulation: identify `O` with the union of the components reachable by a global
diffeomorphism (for a closed manifold, the components diffeomorphic to the component of `x₀`,
with the component-swap extensions constructed). It is an open-and-closed submanifold. State a
bundle over all `M` only with explicit transitivity data; otherwise fibres outside `O` are
empty. Retain the zero-dimensional and finite-component cases. A merely continuous family into
`Diff` is not identified with a jointly smooth family. *Needs:* GeometricTopology Layers 1 and
3, DifferentialGeometry Layer 3 (flows of compactly supported fields).

**Checks.**
- `M = S¹`: evaluation `Diff(S¹) → S¹` is the bundle with fibre `Diff(S¹, 1)`, and the section
  over a neighbourhood of `y` is rotation by the angle from `y`.
- `M` two points: `O = M`, since the swap is a diffeomorphism, and `H` is trivial.
- `M = S¹ ⊔ S²`: `O` is the component of `x₀`, and the fibre over the other component is
  empty; a statement of a bundle over all `M` would be false.

### Examples

- Degree-one Hurewicz on `S¹`, `S¹ ∨ S¹` and `ℝP²`.
- The Serre spectral sequences of the double cover, the Hopf fibration and the path-loop
  fibration over `S²`.
- `K(ℤ/3, 1)` and `M(ℤ/3, 2)` for the mod-2 vanishing theorem.

### Dependencies

Mathlib: singular homology, `HomotopyGroup`, `SimplyConnectedSpace`, `IsCoveringMap`, the
spectral-object API, the Dold–Kan equivalence. Tau Ceti: twisted singular homology,
`LocalCoefficientSystem`, `IsEilenbergMacLaneSpaceOne`. AlgebraicTopology Stages 1–6 and
8.1–8.8; GeneralizedCohomology G2.10; GeometricTopology Layers 1 and 3; DifferentialGeometry
Layer 3; Layer 0 item 3. Source: Hatcher, *Algebraic Topology*, §§2.A, 4.1–4.3, 4.J; Weibel
§5.5; Serre, *Groupes d'homotopie et classes de groupes abéliens*; Palais, *Local triviality of
the restriction map for embeddings*.
## Layer 2: path spaces, mapping spaces, and their fibrations

### 2.1 Moore paths and loops

Define the space `P_{A→B} X` of Moore paths in `X` from `A ⊆ X` to `B ⊆ X` as the pairs `(L, γ)`
with `L ≥ 0` and `γ ∈ C([0, ∞), X)` constant on `[L, ∞)`, with `γ(0) ∈ A` and `γ(L) ∈ B`,
topologized as a subspace of `[0, ∞) × C([0, ∞), X)` (conventions, mapping-space topology).
Define the duration `(L, γ) ↦ L`, the endpoints, concatenation `(L, γ) · (L', γ')` for
`γ(L) = γ'(0)` by `t ↦ γ(t)` for `t ≤ L` and `γ'(t − L)` for `t ≥ L`, the length-zero paths as
units, and the Moore loop space `ΩX = Ω_x X = P_{x→x} X`, the free Moore loop space `𝓛X` and its
component `𝓛₀X` of contractible loops. Prove that the raw carriers are compactly generated by the
metric argument of the conventions. *Needs:* Mathlib `ContinuousMap`, `ContinuousMap.compactOpen`,
`Set.Ici`.

- Duration and the endpoint maps are continuous; concatenation is continuous where defined, by
  gluing of continuous maps on the closed cover `[0, L] ∪ [L, ∞)`.
- Concatenation is strictly associative and strictly unital, so `ΩX` is a topological monoid
  and `𝓛X` carries the continuous `S¹`-reparametrization only through the fixed-interval
  comparison, never on the Moore carrier.
- The constant loops embed `X ↪ 𝓛₀X` as the loops of duration `0`.
- The duration is a continuous function `ΩX → [0, ∞)`; on a Riemannian manifold the geometric
  length is only lower semicontinuous.

**Checks.**
- For `X` a point, `ΩX` is homeomorphic to `[0, ∞)` through the duration; a definition that
  identified Moore loops of equal duration or quotiented by reparametrization would give a point.
- Associativity holds on the nose: `((γ · δ) · ε)(t) = (γ · (δ · ε))(t)` for every `t`, with
  the three cases `t ≤ L_γ`, `L_γ ≤ t ≤ L_γ + L_δ`, `t ≥ L_γ + L_δ`; the fixed-interval
  concatenation fails this, since `((γ · δ) · ε)(1/2) = δ(0)` while `(γ · (δ · ε))(1/2) = δ(1)`.
- In the flat torus the unit-speed loops `γ_n` of the conventions converge in `𝓛T²` to the
  constant loop of duration `1`, so the unit-speed loops are not closed; a definition filtering
  by geometric length would not be a closed condition.
- The space of Moore loops at a point of duration `≤ 1` is contractible, but the loops of
  duration exactly `1` form a copy of the fixed-interval loop space.

### 2.2 Hurewicz fibrations, transitive lifting functions and the Moore-path replacement

Consume GeneralizedCohomology G2.10's `IsHurewiczFibration` with its explicit continuous homotopy
lifts for every parameter space, and its comparison with the Serre-fibration predicate of Layer 1
item 2. Define a **transitive lifting function** for `p : E → B` as additional continuous data
`Φ : E ×_B PB → PE` on Moore paths, where `Φ(e, γ)` starts at `e`, has `γ`'s duration, projects
to `γ`, satisfies `Φ(e, length-zero path at p(e)) = length-zero path at e` and
`Φ(e, γ · λ) = Φ(e, γ) · Φ(end Φ(e, γ), λ)`. A homotopy lifting property alone does not supply
a transitive lifting function. *Needs:* GeneralizedCohomology G2.10, item 1.

- **Moore-path replacement** (BDHO §7.1, Proposition 7.1.1). For any map `p : E → B` put
  `E' = {(e, γ) | γ a Moore path in B starting at p(e)}` and `p'(e, γ) = γ(end)`. Prove that `p'`
  is a Hurewicz fibration with the transitive lifting function given by concatenation, and that
  its fibre `F'` over the basepoint carries the strict right action `(e, γ) · λ = (e, γ · λ)` of
  `ΩB`. When `p` is a Hurewicz fibration, prove that the inclusion `E → E'`,
  `e ↦ (e, length-zero path at p(e))`, is a fibre homotopy equivalence over `B` and that
  `F → F'` is a homotopy equivalence. Prove the fixed-interval and Moore continuity adapters
  explicitly. For the replacement prove the all-parameter lifting property directly by appending
  the initial segment of the base homotopy at time `t`, of Moore length `t`; at `t = 0` this is
  the strict length-zero unit. For a general Hurewicz `p` and a Moore path `γ` of length `r`,
  use its normalized interval path `s ↦ γ(rs)` and G2.10's interval lift `Λ`, including `r = 0`.
  The return map sends `(e, γ)` to `Λ(e, s ↦ γ(rs))(1)`. Its composite with the constant-path
  inclusion is homotopic to the identity through `t ↦ Λ(e, const)(t)`; the opposite composite is
  homotopic to the identity through the lifted point at time `t` paired with `γ`'s remaining
  segment of length `r(1 − t)` starting at `rt`. Prove these maps and homotopies continuous in
  all parameters and over `B`. An arbitrary `Λ` need not fix constant paths, so no strict
  length-`r` regular lift is asserted by rescaling `Λ`'s output at `r = 0`.
- When `p` itself has a transitive lifting function `Φ`, prove that transport `F' → F`,
  `(e, γ) ↦ Φ(e, γ)(end)`, is strictly `ΩB`-equivariant and a homotopy equivalence.
- The endpoint evaluation `P_{A→X} X → X` is a Hurewicz fibration. So is evaluation
  `C(K, X) → C(L, X)` along a closed cofibration `L ⊆ K` of compact Hausdorff spaces.
- Applying `Ω` or `Ω²` to a Hurewicz fibration gives a Hurewicz fibration.
- A locally trivial bundle over a paracompact Hausdorff base, or with an explicit numerable
  trivializing cover, is a Hurewicz fibration (Hatcher's remark after Proposition 4.48 on the
  Huebsch–Hurewicz theorem; the proof is through the numerable cover).

**Checks.**
- For the product `B × F → B`, `Φ((b, f), γ) = (γ, f)` is a transitive lifting function; the
  replacement `E'` is `F × PB`, and `F → F'` is the inclusion of `F` at the constant paths.
- For a covering map `E → B`, the unique path lifting is a transitive lifting function, and
  transport `F' → F` is the monodromy of the fibre, so `C_*(F)_Φ` is the permutation module
  `ℤ[π₀F]` in degree `0`.
- For the path-loop fibration `PB → B`, `(e, γ) ↦ e · γ` is a transitive lifting function with
  `F' → F = ΩB` the concatenation `(λ, γ) ↦ λ · γ`; this is the strict right action of item 1,
  which a lifting function that fixed a parametrization would not produce.
- For `p` the inclusion of a point into `S¹`, `p'` is the path fibration of `S¹` over the
  endpoint, whose fibre is homotopy equivalent to `ℤ`, so the replacement is not a fibre
  homotopy equivalence when `p` is not a fibration.

### 2.3 The canonical homeomorphisms

State every homeomorphism for the **fixed-interval** path and loop models (`P^{[0,1]}`,
`Ω^{[0,1]}`), never for the Moore carriers, and compose each with the Moore comparison of the
conventions. Identify every fixed-start interval path carrier `P^{[0,1]}` with G2.10's
`MappingPathSpace (const b)`. Consume its endpoint-fibre homeomorphism
`mappingPathFiberConstHomeomorphPath b k` with native `Path b k` and its evaluation laws, and at
`k = b` its specialization `mappingPathFiberConstHomeomorphLoopSpace` with target native
`LoopSpace X b`. For arbitrary start and endpoint subsets `A, B ⊆ X`, identify the free-start
carrier `P^{[0,1]}_{A→B} X` with G2.10's `MappingPathSpace (Subtype.val : A → X)` restricted over
`B`, with its inherited topology and endpoint maps. Own the homeomorphism from that native loop
carrier to `Map_*(S¹, X)` through `I/∂I` and AlgebraicTopology Stage 4.4's based circle model,
and the iterated sphere comparisons below, with continuity and inverse laws in the declared
compact-open topologies. *Needs:* GeneralizedCohomology G2.10, AlgebraicTopology Stage 4.4,
Tau Ceti `HomotopyGroup.pathLoopSpaceMulEquiv`, item 1.

- `P^{[0,1]}_{⋆→Q} 𝓛₀Q ≅ Map_*(S², Q)` and `P^{[0,1]}_{Q→Q} 𝓛₀Q ≅ Map(S², Q)`;
- `Map_*(S^k, X) ≅ (Ω^{[0,1]})^k X`;
- `π_j(Ω^k X) ≅ π_{j+k}(X)`, by iterating `pathLoopSpaceMulEquiv`;
- the adjunction `Ω²X → Map(S¹, ΩX)` and the induced degree-raising map
  `β_* : H_*(Ω²X) → H_{*+1}(ΩX)`;
- the section of `Map_*(S², Q) → Map(S², Q) → Q` by constant spheres;
- the homeomorphism `G × Map_*(S², G) ≅ Map(S², G)` for a topological group `G`,
  `(g, f) ↦ g · f`, and through it the homotopy equivalence with `G × Ω²G` for the Moore model.

**Checks.**
- `π₀ Map_*(S², S²) ≅ ℤ` by degree, through `π₂(S²) ≅ ℤ`; the unbased `Map(S², S²)` has the same
  components, since `S²` is connected.
- `Ω²Tⁿ` has contractible components: `π_j(Ω²Tⁿ) = π_{j+2}(Tⁿ) = 0` for `j ≥ 0`, and the
  components are indexed by `π₂(Tⁿ) = 0`, so there is one.
- `H₁(Ω²S³) ≅ ℤ`, through `π₁(Ω²S³) ≅ π₃(S³) ≅ ℤ` and Layer 1 item 1.
- For `G = S¹`, `Map(S², S¹) ≅ S¹ × Map_*(S², S¹)` and `Map_*(S², S¹)` is contractible, since
  `π_j(Ω²S¹) = π_{j+2}(S¹) = 0`.

### Examples

- `Ω(pt) ≅ [0, ∞)` and `𝓛(pt) ≅ [0, ∞)`, with concatenation the addition of durations.
- The path-loop fibration `ΩS¹ → PS¹ → S¹` with its transitive lifting function by
  concatenation; its Moore-path replacement is itself.
- For `Q = S¹`, `𝓛S¹` has components indexed by the winding number, and `𝓛₀S¹ ≃ S¹` through
  the constant loops.

### Dependencies

Mathlib's compact-open topology on `C(X, Y)`; GeneralizedCohomology G2.10 (Hurewicz fibrations,
mapping-path carriers, the path-loop fibration); AlgebraicTopology Stage 4.4 (the based circle
and sphere models); Tau Ceti `HomotopyGroup.pathLoopSpaceMulEquiv` (loop-space shift of homotopy
groups); Layer 1 item 2 (the Serre comparison consumed by G2.10). Source: the source paper
§§5.2, 6.3, 6.4; Whitehead, *Elements of Homotopy Theory*, Chapter I; BDHO §7.1.

## Layer 3: DG local systems

### 3.1 The loop DG algebra and DG local systems

Define the augmented DG algebra `C_*(Ω_b B)` of normalized cubical chains on Moore loops at `b`
(Layer 0 items 1–2), with product the cross product followed by concatenation, augmentation
`C_*(Ω_b B) → A` induced by `Ω_b B → pt`, and functoriality along based maps. *Needs:* Layer 0
items 1–2, Layer 2 item 1, DGAInfinity Layer 1 (DG algebras, right DG modules, restriction of
scalars).

- **Connected case first.** For a pointed path-connected space `(B, b)`, a **DG local system**
  is a right DG module over `C_*(Ω_b B)` in the DG roadmap's sense through the grading bridge
  (the source's Definition 1.8). Pullback along a based map `f` is restriction of scalars along
  `C_*(Ωf)`.
- **Basepoint change.** For `b, b'` in one component, Moore paths from `b` to `b'` form a
  `(C_*(Ω_b B), C_*(Ω_{b'} B))`-bimodule `C_*(P_{b→b'} B)`: loops at `b` act on the left by
  concatenation in front, loops at `b'` on the right. Basepoint change is the **derived** tensor
  product of the DG roadmap's Layer 5, `𝓕 ↦ 𝓕 ⊗^𝐋_{C_*(Ω_b B)} C_*(P_{b→b'} B)`, to right
  modules over `C_*(Ω_{b'} B)`. Concatenation `P_{b→b'} × P_{b'→b} → Ω_b B` and its reverse give
  the quasi-isomorphisms showing that `C_*(P_{b'→b} B)` induces the inverse, so it is an
  equivalence of derived categories. The composite of two changes is the change along the
  composite, through a specified quasi-isomorphism. Conjugation by a Moore path is not a strict
  monoid map, so it is not used.
- **Disconnected spaces.** A space with chosen basepoints `b_c`, one per path component `c`,
  carries the DG local systems given by families `(𝓕_c)` of modules over `C_*(Ω_{b_c} B)`.
  Twisted complexes are direct sums over components. Pullback along `f : B' → B` sends the
  component `c'` to `f(c')`, restricts scalars at `f(b_{c'})`, and changes basepoint to
  `b_{f(c')}`. Independence of the chosen basepoints is a theorem, through basepoint change.
  Layers 5 and 7–9 use this for `𝓛Q`, whose components are the free homotopy classes; for
  `Q = S¹` they are indexed by winding number (worked example 7).

**Checks.**
- For `B` a point, `C_*(ΩB)` is the chains on `[0, ∞)`, quasi-isomorphic to `A` in degree `0`,
  and a DG local system is a chain complex; the augmentation is a quasi-isomorphism, which a
  model that forgot the degenerate-cube quotient would fail (worked example 1).
- For `B = S¹`, `H_*(ΩS¹) = ℤ[t, t⁻¹]` in degree `0`, so a DG local system with homology in
  degree `0` is a `ℤ[π₁]`-module; basepoint change along a path is the identity on such modules
  and conjugation by the path's class on the monodromy.
- For `B = S²`, `H_*(ΩS²)` is the polynomial ring on a class of degree `1` with the Pontryagin
  product, nonzero in all degrees: a DG local system is not determined by a `π₁`-module.
- The bimodule `C_*(P_{b→b'} B)` for `b = b'` is the regular bimodule, and basepoint change
  along it is the identity functor up to the specified quasi-isomorphism.

### 3.2 The DG local system of a Hurewicz fibration

For a Hurewicz fibration `F → E → B` on a path-connected base (on each component otherwise),
define its DG local system as `C_*(F')`, for the strict action on the fibre of the Moore-path
replacement (Layer 2 item 2). It needs no choice of lifting function. *Needs:* Layer 2 item 2,
item 1, Layer 0 item 2.

- When a transitive lifting function `Φ` is given, transport `F' → F` induces a **strict**
  quasi-isomorphism of DG modules `C_*(F') → C_*(F)_Φ`.
- Two transitive lifting functions `Φ₀, Φ₁` are compared by the specified zigzag of strict
  quasi-isomorphisms `C_*(F)_{Φ₀} ← C_*(F') → C_*(F)_{Φ₁}`, an isomorphism in the derived
  category of the DG roadmap's Layer 5. A homotopy between lifting functions is not used.

**Checks.**
- The trivial fibration `B × F → B` gives `C_*(F)` with the trivial action through the
  augmentation; a definition acting through the base loop's endpoint would still give this.
- A covering `E → B` gives the permutation module `ℤ[π₀F]` in degree `0` with the monodromy
  action; for the double cover `S¹ → S¹`, `z ↦ z²`, the fibre has two points and the generator
  of `π₁(S¹)` swaps them, so the module is `ℤ²` with the generator acting by the swap, not the
  sign representation.
- The Hopf fibration `S¹ → S³ → S²` gives `C_*(S¹)` with the action of `ΩS²` through the
  connecting map `ΩS² → S¹`, inducing on `H_*` the action of the degree-`1` generator by the
  generator of `H₁(S¹)`; a trivial action would give `H_*(S³) = H_*(S²) ⊗ H_*(S¹)` in the
  fibration theorem (Layer 5 item 4), which is wrong.

### 3.3 Classical local systems

Classical local systems are DG local systems concentrated in degree zero. Prove that they
correspond, naturally, to Tau Ceti's `LocalCoefficientSystem` through `H₀(ΩB) ≅ ℤ[π₁(B)]`.
*Needs:* item 1, Tau Ceti `LocalCoefficientSystem`.

**Checks.**
- The constant system is the module `A` with the augmentation action.
- The orientation system of a nonorientable manifold (the sign of `π₁` on local orientations)
  is a rank-one system with monodromy `−1` on orientation-reversing loops; for `ℝP²` it is
  `ℤ` with the generator acting by `−1`.
- A DG local system concentrated in degree `0` whose action does not factor through `H₀(ΩB)`
  does not exist: the action of a degree-`1` chain on a degree-`0` module lands in degree `1`,
  which is zero.

### 3.4 Twisting by a rank-one local system

For a rank-one local system `L`, construct the DG algebra map `Φ^L` (the source's Lemma 2.1),
the twisted cocycle `m^L_{x,y}`, and the isomorphism of twisted complexes between
`𝓕 ⊗ L`-coefficients and `m^L`-twisted `𝓕`-coefficients (Proposition 2.2); prove
`H_q(𝓕 ⊗ L) ≅ H_q(𝓕) ⊗ L`. *Needs:* items 1 and 3, Layer 4 items 1–2.

**Checks.**
- For `L` trivial, `Φ^L` is the identity and `m^L = m`.
- For `B = S¹` and `L` with monodromy `−1`, `Φ^L` multiplies a loop of winding `k` by
  `(−1)^k`; the twisted complex of the circle with `m^L` is `ℤ → ℤ`, `d = 1 − (−1) = 2`, with
  `H₀ = ℤ/2` and `H₁ = 0`, while the untwisted one has `H₀ = H₁ = ℤ`.
- `Φ^L` is multiplicative because `L` is rank one: for a rank-two system the analogous map is
  not an algebra map, which is why the construction stops at rank one.

### Examples

- `C_*(Ω(pt)) ≃ A`; the DG local systems on a point are the chain complexes.
- On `S¹`, the derived category of DG local systems with homology in degree `0` is that of
  `ℤ[t, t⁻¹]`-modules, and the path fibration gives the regular module.

### Dependencies

Layer 0 items 1–2 (cubical chains, cross product), Layer 2 items 1–2, DGAInfinity Layers 1 and
5, Tau Ceti `LocalCoefficientSystem`. Source: BDHO Chapters 2, 5.1 and 7; the source paper
§§1.4 and 2.3.

## Layer 4: twisting cocycles and the twisted complex

This layer is pure algebra over a DG algebra `R`. It consumes the DG roadmap's Layers 1, 4 and 5.

### 4.1 Twisting cocycles

Define a **twisting cocycle** (the source's Definition 1.9) on a finite set `P` graded by
`ind : P → ℤ` as a family `m_{x,y} ∈ R_{ind x − ind y − 1}` satisfying
`∂m_{x,y} = Σ_z (−1)^{ind x − ind z} m_{x,z} m_{z,y}` and the **one-sidedness condition**
`m_{x,y} = 0` whenever `ind x ≤ ind y`. In `Suggested.lean` this is `TwistingCocycle`, over
Tau Ceti's `IsDGAlgebra` through the grading bridge: `m x y` lies in cohomological degree
`ind y − ind x + 1`. *Needs:* Tau Ceti `IsDGAlgebra`, DGAInfinity Layer 4.

- One-sidedness does not follow from the degree and the twisting equation over an arbitrary DG
  algebra; it is automatic when `R` is homologically nonnegative, since then
  `R_{ind x − ind y − 1} = 0` for `ind x ≤ ind y`. Every `C_*(ΩB)` is, so for all geometric
  cocycles here the condition is a lemma, not an extra hypothesis.
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
  order of multiplication and is not a complex in general (worked example 2).

**Checks.**
- Over `ℚ[ε]/(ε²)` with `|ε| = −1` (homological), one generator and `m_{x,x} = ε` satisfy the
  degree condition and the twisting equation `∂ε = 0 = (−1)^0 ε²`, and violate one-sidedness:
  the condition is independent data.
- Over a homologically nonnegative `R` (cohomologically nonpositive), `ind x ≤ ind y` forces
  `m_{x,y} ∈ R_{ind x − ind y − 1} = 0`.
- The noncommutative regression test of worked example 2: `R` free on `a, b` in degree `0` and
  `c` in degree `1` with `∂c = −ab`, `ind x = 2 > ind z = 1 > ind y = 0`, `m_{x,z} = a`,
  `m_{z,y} = b`, `m_{x,y} = c`: the twisting equation at `(x, y)` reads `∂c = (−1)^{2−1} ab`,
  which holds, and with `∂c = +ab` it fails, so the sign `(−1)^{ind x − ind z}` is forced.
- For `P` a single generator the twisting equation reads `∂m_{x,x} = m_{x,x}²` with
  `m_{x,x} = 0` by one-sidedness, and `K_m = R[ind x]`.

### 4.2 The twisted complex

For a DG local system `𝓕` (a right module), define the twisted complex
`𝓕 ⊗⟨P⟩ := 𝓕 ⊗_R K_m` of the DG roadmap's Layer 1, with
`D(α ⊗ x) = ∂α ⊗ x + (−1)^{|α|} Σ_y α·m_{x,y} ⊗ y`, and prove `D² = 0`. Its total degree is
`|α| + ind x`, and `D` lowers it by one (raises it by one cohomologically). In `Suggested.lean`
the carrier `M ⊗ ⟨P⟩` is `P → M`, the Koszul sign is the grading involution
`gradingInvolution` (`α ↦ (−1)^{|α|} α` through the decomposition), the total grading is
`totalGrading`, and the differential is `twistedDifferential`; `twistedDifferential_sq` and
`twistedDifferential_mem_totalGrading` are `D² = 0` and the degree statement. *Needs:* item 1,
Tau Ceti `IsDGRightModule`, Mathlib `DirectSum.Decomposition`.

- The twisted differential is `R`-linear exactly when the ground-ring and the right actions on
  `M` commute (`SMulCommClass R Aᵐᵒᵖ M`); the instance is part of the definition's signature.
- The right `A`-action enters the construction itself: the differential depends on it.

**Checks.**
- Action dependence (worked example 2): `A = ℚ × ℚ` in degree `0` with zero differential,
  `M = ℚ` in degree `0` with the right action through the first, respectively the second
  projection; `ind x = 1`, `ind y = 0`, `m_{x,y} = (1, 0)`. The twisted differential gives
  `D(1 ⊗ x) = 1 ⊗ y` for the first action and `D(1 ⊗ x) = 0` for the second.
- Noncommuting actions: for `R = A = ℚ × ℚ` acting on `M = ℚ²` by `(a, b) • (u, v) = (au, bv)`
  on the left and `(u, v) · (a, b) = (au + (b − a)v, bv)` on the right, the two actions do not
  commute and the formula is not `R`-linear; the signature's commutation instance excludes it.
- Degree: with `M = A = ℚ[ε]/(ε²)`, `|ε| = 1` cohomologically and zero differential,
  `P = {x, y}` with `ind x = 1`, `ind y = 0` and `m_{x,y} = 1` (of the required degree
  `ind y − ind x + 1 = 0`), the element `ε ⊗ x` has total degree `|ε| − ind x = 0` and
  `D(ε ⊗ x) = (−1)^{|ε|} ε ⊗ y = −ε ⊗ y` has total degree `1`.
- `D² = 0` fails without the twisting equation: with `m_{x,y} = r` for a single pair and
  `∂r ≠ 0`, `D²(α ⊗ x) = (−1)^{|α|+1} α · ∂r ⊗ y ≠ 0` for `α = 1`.

### 4.3 Continuation and parametrized cocycles

Define **continuation cocycles** (the source's Definition 1.10) and prove that they induce chain
maps between twisted complexes; define **parametrized cocycles** (Definition 1.11) and prove the
chain homotopy `Ψ¹ − Ψ⁰ = D⁻h + hD⁺`. Prove that continuation cocycles compose, and that
homologous twisting cocycles give chain homotopy equivalent twisted complexes, through a
specified equivalence. *Needs:* items 1–2.

**Checks.**
- The identity continuation cocycle `ν_{x,x} = 1`, `ν_{x,y} = 0` otherwise, induces the
  identity.
- For `P = ∅` on either side every continuation cocycle is empty and the induced map is zero.
- The chain-map equation for `ν` is `∂ν_{x,y} = Σ_z (−1)^{…} (m⁺_{x,z} ν_{z,y} − ν_{x,z} m⁻_{z,y})`
  with the source's signs; dropping the sign on the second term fails on the regression test of
  item 1 with `ν` the identity.

### 4.4 The index filtration

Define the **index filtration** `F_p = ⊕_{ind x ≤ p} 𝓕 ⊗ ⟨x⟩` (the source's Definition 3.38),
and construct its spectral sequence from Layer 1 item 3. Prove that the `E²` page is the homology
of the classical complex with local coefficients `H_q(𝓕)`, and that continuation maps induce
morphisms of spectral sequences. *Needs:* items 1–3, Layer 1 item 3, Layer 3 item 3.

**Checks.**
- The filtration is a filtration by subcomplexes exactly because of one-sidedness: `D` sends
  `𝓕 ⊗ ⟨x⟩` into `⊕_{ind y < ind x} 𝓕 ⊗ ⟨y⟩` plus `𝓕 ⊗ ⟨x⟩`.
- For `𝓕` concentrated in degree `0` the spectral sequence collapses at `E²` to the classical
  complex with local coefficients.
- Each total degree sees finitely many filtration steps, so the convergence hypotheses of Layer
  1 item 3 hold with no finite-type assumption on `𝓕`.

### 4.5 Arbitrary-CW Brown resolution before derived coefficients

Let `A` be a commutative coefficient ring and `B` a pointed connected CW complex with an
arbitrary small cell set. Put `R = C_*(Ω_b B; A)` on the normalized cubical Moore-loop carrier,
with its augmentation `ε : R → A`; retain `π₁(B)`, all components of `Ω_b B` and their action,
rather than assuming `B` simply connected. Construct the following objects before Layer 5's
fibration-chain or derived-coefficient comparisons. *Needs:* items 1–4, Layer 0 items 2–3,
Layer 2 item 1, AlgebraicTopology Stage 4 (CW structures), DGAInfinity Layer 5 (semi-free
modules, derived tensor products).

- Extend items 1–4 from finite `P` to an arbitrary small graded basis using the direct sum
  `K_m = ⊕_{x ∈ P} R[ind x]` (degreewise finitely supported functions with the shift signs),
  not the unrestricted product `P → R`. Specify each row `m_x` as a finitely supported family of
  coefficients, its degree and Maurer–Cartan identity. The differential of a finite-support
  vector is a finite sum of finite-support rows; prove `D² = 0` on generators and extend by the
  DG Leibniz rule. State exactly the one-sided well-founded attaching filtration used for a
  semi-free model; row finiteness alone constructs a complex, not a resolution. Recover the
  finite prototype by the finite direct-sum and function equivalence, with all tensor and
  opposite-algebra signs. Carry arbitrary scalar, module and basis universes through upward
  transport.
- Construct a cell-filtered augmented semi-free left `R`-module `P_B` and a compatible
  `R`-linear chain comparison to `C_*(P_b B; A)`, where `P_b B` is the space of paths starting
  at `b` and `Ω_b B` acts by concatenation in front. For a characteristic disc `χ : Dⁿ → B`
  choose a path to its centre and follow the radial paths `χ(tv)` to construct a continuous
  family `τ_v` from `b` to `χ(v)`. Concatenation `(γ, v) ↦ γ ⋆ τ_v` identifies its pulled-back
  path fibration with `Ω_b B × Dⁿ` up to left-loop-equivariant homotopy; the inverse appends
  `τ_v` reversed, and the cancellation homotopies use the Moore-path constructions of Layer 2.
  With relative disc and prism chains, Eilenberg–Zilber and excision, construct the resulting
  `R`-linear relative-cell quasi-isomorphism with `R[n]`. If `P_prev → C_prev` is the previously
  constructed quasi-isomorphism, the connecting class of that relative generator has a finite
  cycle representative `a ∈ P_prev`. Choose a correcting target chain `c` with `∂c = f(a)`,
  attach the free `R`-generator `e` in degree `n` by `de = a` and map `e ↦ c`. Prove `d²e = 0`
  and the relative comparison, and record the finite coefficients of `a` as the Brown row `m_x`.
  Carry out this induction with the attaching and basepoint-change homotopies. An arbitrary
  choice of a matrix satisfying the Maurer–Cartan equation is not this constructor.
- Build the comparison first on finite subcomplexes and relative cell attachments, with
  compatible maps and homotopies under inclusions; prove independence of the paths,
  characteristic data and representatives. Extend to arbitrary cell sets by the filtered-colimit
  and direct-sum comparison. Each chain and differential row has finite support; no completion
  or product over all cells is introduced. Since `R` is homologically nonnegative and cell
  degrees are nonnegative, the base-skeleton filtration in each total degree has the bounded
  range needed for the relative-cell comparison. Keep the separate arbitrary-cell-set colimit
  proof, not an unstated finite-type assumption.
- Prove `P_B → C_*(P_b B; A)` is a quasi-isomorphism from that relative-cell construction.
  Contract `P_b B` to its constant path by rescaling and truncating Moore paths, construct the
  induced chain homotopy, and conclude that its augmentation and `P_B → A` are
  quasi-isomorphisms. This contraction need not be `R`-linear; the augmentation and comparison
  maps must be `R`-linear for the trivial action on `A`. Establish the semi-free (K-flat) lifting
  and tensor-invariance property with the DG derived-module supplier. If using a bar replacement,
  construct its split normalized free resolution and its augmentation contraction, then the
  topological and cellular comparison; a topological Brown theorem is not inferred from a bar or
  cobar name, and no simply-connected cobar hypothesis is imposed on arbitrary `π₁`.
- Define the Brown twisting object by this constructor and prove its singular, cellular and
  basepoint-change comparisons (BDHO Theorem 3.3.5 compares it with the Barraud–Cornea cocycle
  over `ℤ`). Then, for every right DG `R`-module `𝓕`, prove `𝓕 ⊗_R P_B` represents
  `𝓕 ⊗^𝐋_R A` and hence the stated Tor groups, with natural maps and the comparison to the
  designated twisted complex. For disconnected CW spaces use the chosen basepoint in each path
  component, the corresponding loop DG algebras and the direct sum of the component
  constructions. Preserve all general coefficient modules, infinite cell sets and relative
  versions; finite `P` remains the illustrative special case of items 1–4.
- The filtered comparisons that DGFloerPartII Layer 2 item 4 needs for the based-loop
  computations on projective spaces are constructed there with a specified base filtration; an
  unfiltered derived equivalence alone grants none.

**Checks.**
- `B = S¹` with one `0`-cell and one `1`-cell: `P_B` has generators `e₀, e₁` with
  `de₁ = (t − 1)·e₀` for the loop `t`, the nontrivial loop-minus-unit boundary with the
  `π₁`-action; its augmentation is a quasi-isomorphism, since `H_*(P_{b}S¹) = 0` in positive
  degrees.
- The zero-cocycle two-generator complex `R·e₀ ⊕ R·e₁` with `de₁ = 0` is rejected as a
  resolution: its augmentation has `H₁ = H₁(ΩS¹) ⊗ … ≠ 0`, unwanted positive homology.
- `B = pt`: `P_B = R = C_*(Ω pt) ≃ A`, and `𝓕 ⊗_R P_B = 𝓕`.
- `B = S²` with cells in degrees `0` and `2`: `de₂ = a·e₀` for the degree-`1` generator `a` of
  `H_1(ΩS²)` (a cycle), and `H_*(𝓕 ⊗_R P_B)` for `𝓕 = R` is `A` in degree `0`.

### Examples

- The regression test of worked example 2, through items 1–2.
- The Brown resolution of `S¹` and of `S²` as above.

### Dependencies

Tau Ceti `IsDGAlgebra`, `IsDGRightModule`; Mathlib `DirectSum.Decomposition`, `Int.negOnePow`;
DGAInfinity Layers 1, 4 and 5; Layer 1 item 3 (spectral sequence of a filtered complex); Layer 0
items 2–3 and Layer 2 item 1 (for item 5). Source: the source paper §1.4; BDHO Chapters 3–4.
## Layer 5: Morse homology with DG coefficients

This layer consumes Lane M of the Heegaard Floer roadmap for moduli spaces, compactness, gluing
and corner structures.

### 5.1 Representing chain systems

Construct fundamental chains rel boundary (Layer 0 item 4) of the compactified trajectory spaces
`L̄(x, y)` of every dimension (BDHO Theorem 5.2.1, HeegaardFloer Lane M), coherent with the
boundary product decomposition `∂L̄(x, y) = ⋃_z L̄(x, z) × L̄(z, y)`. Prove that they exist (BDHO
Proposition 5.2.6) and that any two are homologous through a specified family (BDHO Proposition
5.2.8). This holds over `𝔽₂`, and over `ℤ` with the orientation conventions of BDHO Appendix A.
*Needs:* Layer 0 item 4, HeegaardFloer Lane M.

**Checks.**
- For `ind x − ind y = 1` the chain is the signed count of rigid trajectories; for
  `ind x − ind y = 2` its boundary is `Σ_z s_{x,z} × s_{z,y}`, the gluing of broken
  trajectories, which a chain with the wrong Koszul sign would not satisfy.
- On the height function of `S¹` with two critical points the two trajectory spaces are
  points and the representing system is the two signed points.
- The constant function has no trajectory spaces and the empty system is the unique one.

### 5.2 The Barraud–Cornea cocycle

Choose an embedded tree joining the critical points to the basepoint and a homotopy inverse of
the collapse map; evaluate the representing chains into Moore paths, then into `C_*(ΩB)`. Prove
that the result is a twisting cocycle (Layer 4 item 1; BDHO §§3.1 and 5.2) and that its twisted
homology is independent of all choices up to specified continuation isomorphisms (BDHO Chapter
6). *Needs:* item 1, Layer 2 item 1, Layer 4 items 1 and 3.

**Checks.**
- The cocycle's degree-`0` part (for `ind x − ind y = 1`) is the Morse differential with the
  `π₁(B)`-monodromy of the trajectories: for `B = S¹` with the height function the two
  trajectories evaluate to the two half-loops, whose classes in `H₀(ΩS¹) = ℤ[t, t⁻¹]` are `1`
  and `t`, so the twisted complex over `ℤ[t, t⁻¹]` has `d = 1 − t` up to the sign convention.
- Changing the tree changes the cocycle by a gauge transformation (a continuation cocycle),
  not by zero: the twisted homology is unchanged but the cocycle is not.
- For a Morse function with one critical point (a point) the cocycle is zero.

### 5.3 DG Morse homology and its functoriality

Define DG Morse homology `H_*(B; 𝓕)` on closed manifolds and the absolute and relative complexes
for compact manifolds with boundary (BDHO §5.3). Direct maps `f_*` retain their specified
coefficient morphism. For `f : X^m → Y^n` and a DG local system `𝓕` on `Y`, construct the
integral Umkehr `f_! : H_k(Y; 𝓕) → H_{k+m−n}(X; f^*𝓕 ⊗ or_X ⊗ f^*or_Y)`, with all orientation
local systems concentrated in degree zero (BDHO Chapters 9–12). Use AlgebraicTopology's
orientation-system transport and canonical square normalization. Construct the DG-coefficient
Poincaré–Lefschetz and cap comparison, its cochain pullback and the resulting `f_!`, rather than
applying ordinary local-coefficient duality to a DG system without an adapter. Build this from
the finite Morse and skeletal filtration and the chain-level diagonal and cap comparison; its
graded-classical comparison and bounded base filtration give the homology equivalence. These
constructions use the chain and filtered interfaces of Layers 0–4 and AlgebraicTopology, not the
fibration theorem below. Chosen orientations trivialize the two factors and recover
`f_! : H_k(Y; 𝓕) → H_{k+m−n}(X; f^*𝓕)`; over `𝔽₂` the factors disappear. Prove identity and
composition, naturality in coefficients, basepoints and continuation, and the degree and sign
diagrams. For maps of manifold pairs construct the absolute and relative Poincaré–Lefschetz
versions with their boundary and collar hypotheses, maps and boundary naturality. All
nonorientable targets remain in scope with the displayed twists. *Needs:* items 1–2, Layer 4,
AlgebraicTopology Stage 6 (orientation system, cap products, duality).

**Checks.**
- For `𝓕` concentrated in degree `0`, `H_*(B; 𝓕)` is Morse homology with classical local
  coefficients (worked example 3).
- For `f = id`, `f_! = id` and `f_* = id`; for the inclusion of a point `i : pt → B^n`, `i_!`
  has degree `−n`.
- For `B = ℝP²` and `𝓕 = ℤ` trivial, `H_*(B; ℤ)` is `ℤ, ℤ/2, 0`, and the Umkehr of
  `pt → ℝP²` lands in `H_{*−2}(pt; or_{ℝP²}|_{pt}) = ℤ`, with the twist visible as the sign
  ambiguity of the local orientation.

### 5.4 The fibration theorem

For a Hurewicz fibration `F → E → B` over a closed connected manifold with the DG local system
`C_*(F')` of Layer 3 item 2, prove `H_*(B; C_*(F')) ≅ H_*(E') ≅ H_*(E)` (BDHO Theorem 7.2.1),
first for fibrations with a transitive lifting function, then for all Hurewicz fibrations by
transport along the Moore-path replacement `E → E'`, which is a fibre homotopy equivalence and
has a transitive lifting function. Prove that the index spectral sequence is isomorphic to the
Serre spectral sequence from `E²` on, and that direct maps correspond to maps of total spaces.
For pullbacks along `f : X^m → B^n` between manifold bases, construct the base-induced fibration
Umkehr comparison with degree `m − n` and the pulled-back degree-zero `or_X ⊗ f^*or_B` factors
from item 3. A total space or fibre need not be a manifold; the map is constructed through the
base Morse and fibration-chain model, with its absolute and relative and coefficient diagrams.
*Needs:* items 1–3, Layer 3 item 2, Layer 2 item 2, Layer 1 item 2 (Serre spectral sequence),
Layer 4 item 4.

**Checks.**
- The path-loop fibration over `Sⁿ`: `H_*(Sⁿ; C_*(ΩSⁿ)) ≅ H_*(pt)` (worked example 4); a
  twisted complex with the trivial action would give `H_*(Sⁿ) ⊗ H_*(ΩSⁿ) ≠ H_*(pt)`.
- The Hopf fibration `S¹ → S³ → S²` gives `H_*(S³)`, and the trivial fibration recovers
  Künneth.
- For the double cover `S¹ → S¹`, `H_*(S¹; ℤ[ℤ/2])` with the swap action is `H_*(S¹)`, the
  homology of the total space.

### 5.5 Classes living over the fundamental class

Construct the source's Definition 2.3 and the chain characterization of Proposition 2.5 with
the coefficient and orientation data. For an oriented closed connected `B^n` (or over `𝔽₂`),
recover its ordinary top class and the `E^∞_{n,*}` characterization (Proposition 2.6). For
arbitrary `B` use `[B]_or ∈ H_n(B; or_B)`, the corresponding twisted top column and the
pulled-back orientation system on `E`; no untwisted integral fundamental class is asserted on a
nonorientable base. *Needs:* items 3–4, Layer 4 item 4, AlgebraicTopology Stage 6.

- For the inclusion `i : {b} → B`, its shriek map has degree `−n`. With untwisted total-space
  coefficients it takes values in `H_{*−n}(F_b) ⊗ (or_B)_b`; a chosen local orientation
  identifies the last line with the ground ring. With `π^*or_B` coefficients on `E` its two
  point-orientation factors contract canonically, giving `H_*(E; π^*or_B) → H_{*−n}(F_b)`.
  Construct a compatible Morse and CW model with one top `n`-cell containing `b`, using the
  supplied Morse and handle comparison, and denote its lower skeleton by `B_{n−1}`. Construct
  the relative skeletal quotient and orientation-twisted Thom and cell comparison underlying the
  source's Lemma 2.9 for this chosen model; an arbitrary skeleton with several top cells is not
  identified with a single fibre. Under the oriented or mod-2 trivialization this is
  `H_*(E) → H_*(E, E|_{B_{n−1}}) ≅ H_{*−n}(F_b)`.
- Prove shriek naturality for maps of fibrations (Proposition 2.12, Lemma 2.14), and the
  source's Corollary 2.13: if `σ_*[F] ≠ 0` then `σ_*[E]` lives over the fundamental class,
  using oriented classes or their orientation-twisted replacements and the corresponding
  coefficient morphisms.

**Checks.**
- For the trivial fibration `B × F → B` the class `[B] × α` lives over the fundamental class
  for every `α ≠ 0`, and `i_!([B] × α) = α`.
- For the Hopf fibration, `[S³]` lives over `[S²]` and `i_![S³] = [S¹]`.
- For `B = ℝP²` over `ℤ`, no class in `H₂(E; ℤ)` lives over an (untwisted) fundamental class,
  since `H₂(ℝP²; ℤ) = 0`; the twisted statement with `or_B` applies instead.

### 5.6 The free loop space

Define DG Morse homology of `𝓛₀Q` and `𝓛Q` for a closed manifold `Q` through the
finite-dimensional approximations by broken geodesics and the colimit over them (BDHO Chapter
13: Propositions 13.2.2, 13.2.3, Definition 13.3.1, Propositions 13.3.2–13.3.3). *Needs:*
items 1–4, RiemannianGeometry R2–R3, SmoothBundlesConnections B6.0, Layer 9 item 3 (the weak
equivalence of the colimit), Layer 2 item 1.

- Consume RiemannianGeometry R3's finite-vertex short-segment path construction. For closed `Q`
  construct the cyclic vertex carrier, its seam charts and energy, its comparison and
  deformation to the free-loop energy sublevel, and subdivision maps. The based and cyclic
  versions share the designated short-segment maps and topology; the cyclic comparison is proved
  rather than identified with the based-path theorem.
- A closed broken geodesic with `r` breaks is determined by its vertices, an `r`-tuple of points
  of `Q` for R3's chosen smooth metric. Choose `ρ > 0` below the uniform normal-radius and
  strong-convexity bounds on compact `Q`, supplied by SmoothBundlesConnections B6.0 for that
  metric. Exponential coordinates are injective there, and the required short segment is the
  unique smoothly varying minimizing segment. Consecutive distances are below `ρ`; the carrier
  cuts these tuples by an energy bound. The Viterbo proof (Layer 9 item 3) uses the same tuples
  with Abouzaid's cut, `𝓛ʳQ = {q ∈ Qʳ | d(q_i, q_{i−1}) ≤ δᵢʳ}`, a compact manifold with corners
  for generic `δᵢʳ ∈ (δ/2, δ)` and `0 < δ < ρ` (Abouzaid Lemma 3.2.6, Definition 3.2.8), with the
  embeddings `ιʳ : 𝓛ʳQ → 𝓛ʳ⁺¹Q` that repeat `q_0` and the maps `geoʳ : 𝓛ʳQ → 𝓛Q` sending a
  tuple to the broken geodesic through it, parametrized at unit speed as a Moore loop. Both
  systems have the colimit property of BDHO §13.2 for `𝓛Q`, by the weak equivalence of Layer 9
  item 3, so the DG Morse homology of `𝓛Q` is the same through either; the cut is a choice of
  cutoff, not a third model.

**Checks.**
- For `Q = S¹` with `r = 1`, `𝓛¹S¹ = S¹` is the constant loops, and `𝓛ʳS¹` for `r ≥ 2` has
  components indexed by the winding numbers reachable with `r` segments of length below the
  cut; the colimit recovers `𝓛S¹ ≃ ⊔_k S¹` (worked example 7).
- For `Q = pt` every `𝓛ʳQ` is a point and `H_*(𝓛Q; 𝓕) = H_*(𝓕)`.
- The cut `δᵢʳ` must be generic: Abouzaid's Exercise 3.2.7 (Kragh) shows `𝓛⁴_{(1,1,1,1)}ℝ²` is
  not a manifold with corners.

### Examples

- The height function on `S¹` and the path-loop fibration over `S¹`: the twisted complex over
  `ℤ[t, t⁻¹]` with `d = 1 − t` computes `H_*(PS¹) = H_*(pt)`.
- The Hopf fibration over `S²` with its DG local system `C_*(S¹)`.

### Dependencies

HeegaardFloer Lane M; Layer 0 item 4; Layers 2–4; AlgebraicTopology Stage 6; RiemannianGeometry
R2–R3 and SmoothBundlesConnections B6.0 (item 6); Layer 9 item 3 (the colimit weak equivalence
used by item 6). Source: BDHO Chapters 5–13; the source paper §§2.1–2.4 and 4.3–4.4.

## Layer 6: Hamiltonian dynamics, Liouville domains, and capacities

This layer consumes symplectic manifolds and almost complex structures from Lane F2.1 of the
Heegaard Floer roadmap, and Hamiltonian vector fields, the Poisson bracket and symplectomorphisms
from Layers 1–2 of the Hamiltonian systems roadmap. It adds the time-dependent and dynamical
material that roadmap leaves out: periodic orbits, action functionals, Liouville domains,
capacities, and almost existence.

### 6.1 Time-dependent flows, periodic orbits and the action functional

Define time-dependent Hamiltonian flows on the Hamiltonian vector fields of HamiltonianSystems,
with `ι_{X_H} ω = dH`; 1-periodic orbits and their nondegeneracy (the linearized return map has
no eigenvalue `1`); symplectically aspherical and atoroidal manifolds (conventions); the action
functional `𝒜_H` on `𝓛₀X` (aspherical) and on `𝓛X` (atoroidal), with the reference loops and
trivializations of the conventions. *Needs:* HamiltonianSystems Layers 1–2, HeegaardFloer F2.1,
Layer 2 item 1, DifferentialGeometry Layer 3 (flows).

**Checks.**
- On `T*ℝ` with `H = p²/2` the vector field in the `ι_X ω = dH` convention is `−p ∂_q` (worked
  example 9); the source's convention gives `p ∂_q`.
- On `(ℝ²ⁿ, ω_std)` with `H = (|q|² + |p|²)/2`, the flow is the rotation of period `2π`, every
  orbit of period `1` is the constant orbit at `0`, which is nondegenerate since the linearized
  time-one map has eigenvalues `e^{±i}`.
- `T²` with `ω = dx ∧ dy` is symplectically aspherical, since `π₂(T²) = 0`, but not
  atoroidal, since the identity `T² → T²` has `∫ ω = 1 ≠ 0`; a definition that conflated the
  two conditions would put the standing action functional on all of `𝓛T²`, where it is
  multivalued.

### 6.2 Liouville domains

Define Liouville domains `(W, λ)` with `ω = dλ` and the outward Liouville field `Z` given by
`ι_Z ω = λ`, their completions `Ŵ = W ∪ [1, ∞) × ∂W`, Hamiltonians linear at infinity, and
exact codimension-zero embeddings. *Needs:* HeegaardFloer F2.1, DifferentialGeometry Layers 0–1
and 3.

**Checks.**
- The unit disc `D²ⁿ` with `λ = ½ Σ (p dq − q dp)` is a Liouville domain with `Z = ½(q ∂_q + p ∂_p)`;
  its completion is `ℝ²ⁿ`.
- `(D*Q, −λ_can)` is a Liouville domain with `Z = p ∂_p` (item 3); with `+λ_can` the field
  would point inward and the definition would fail at the boundary.
- A closed symplectic manifold is not a Liouville domain: `ω = dλ` forces `∫ ωⁿ = 0`.

### 6.3 Cotangent bundles

Construct the cotangent bundle `T*Q` of a smooth manifold with the tautological form
`λ_can = p dq` as a smooth 1-form of the differential geometry roadmap, and
`ω_can = −mextDeriv λ_can`. On the model space these are Tau Ceti's `cotangentLiouvilleForm` and
`cotangentSymplecticForm`, by the latter's `cotangentSymplecticForm_apply`. Define the unit disc
and sphere bundles `D*Q` and `S*Q` of a Riemannian metric; prove `(D*Q, −λ_can)` is a Liouville
domain with Liouville field `p ∂_p` (conventions). Define exact magnetic forms: the source's
magnetic form `ω_src + π^*dσ` is carried by `ν` to `ω_can + π^*dσ`, since `π ∘ ν = π`. Prove
that the fibre translation `Ψ'_σ(q, p) = (q, p − σ_q)` by a 1-form `σ` satisfies
`Ψ'^*_σ λ_can = λ_can − π^*σ`, hence is a symplectomorphism `(T*Q, ω_can + π^*dσ) ≅ (T*Q, ω_can)`;
it is `ν ∘ Ψ_σ ∘ ν⁻¹` for the source's `Ψ_σ(q, p) = (q, p + σ_q)`. This proves the Theorem A and
Theorem C forms of Corollary D from Layer 10 item 5. *Needs:* Tau Ceti `cotangentSymplecticForm`,
`cotangentLiouvilleForm`; DifferentialGeometry Layers 0–1; item 2.

**Checks.**
- On `T*ℝ`: `ω_can(∂_q, ∂_p) = 1` and `ω_can = −d(p dq)`; `ν^*ω_can = ω_src = d(p dq)`
  (worked example 9).
- `Ψ'^*_σ ω_can = ω_can + π^*dσ` for `Ψ'_σ(q, p) = (q, p − σ(q))`: with `σ = f(q) dq` on
  `T*ℝ`, `Ψ'^*_σ(p dq) = (p − f) dq` and `−d((p − f) dq) = ω_can + f'(q) dq ∧ dq = ω_can`,
  while `π^*dσ = 0` on `T*ℝ`; on `T*ℝ²` with `σ = x dy`, `π^*dσ = dx ∧ dy ≠ 0` and the identity
  is a genuine check of the sign.
- `D*Q` is compact exactly when `Q` is; for `Q = ℝ` the disc bundle is not a Liouville domain.

### 6.4 Hypersurfaces

Define characteristic foliations of regular hypersurfaces and prove that closed characteristics
correspond to periodic orbits of any defining Hamiltonian, up to reparametrization. Define
Liouville vector fields: for a fixed primitive `λ`, `ι_Z ω = λ` implies `L_Z ω = ω` by Cartan's
formula. The converse fails for a fixed `λ`: with `λ = p dq`, `ω = dλ` and `Z = p ∂_p + ∂_q`,
`L_Z ω = ω` but `ι_Z ω = λ − dp`. What holds is that `L_Z ω = ω` makes `ι_Z ω` a primitive of `ω`,
whose Liouville field is `Z`. Define contact type and restricted contact type with the primitive
explicit. Prove the Liouville-flow argument that gives the Theorem A and Theorem C forms of
Corollary E from Layer 10 item 5, using the flows of DifferentialGeometry Layer 3. *Needs:*
DifferentialGeometry Layers 0–1 and 3, item 2.

**Checks.**
- The unit sphere `S²ⁿ⁻¹ ⊂ ℝ²ⁿ` has characteristic foliation the Hopf circles, which are the
  periodic orbits of `|z|²/2`.
- The counterexample `Z = p ∂_p + ∂_q` above: `L_Z ω = ω` and `ι_Z ω ≠ λ`.
- A hypersurface of contact type in `T*Q` disjoint from the zero section: `S*Q` with
  `λ = −λ_can` restricted; the zero section itself is not a hypersurface of contact type
  (`λ_can` vanishes on it).

### 6.5 Almost existence and capacities

Define the contractible almost existence property (the source's Definition 1.1), the relative
capacity `c°_HZ(V, Z)` (Definition 5.3) and the `π₁`-sensitive Hofer–Zehnder capacity
`c°_HZ(W)` (Definition 6.1). Prove Proposition 6.3 (Hofer–Zehnder, Struwe): finite `c°_HZ(W)`
implies contractible almost existence in `W`, by the monotonicity argument through Mathlib's
`Monotone.ae_differentiableAt`, including its relative version near a hypersurface
(Hofer–Zehnder Chapter 4; Struwe 1990). *Needs:* items 1–2, Mathlib
`Monotone.ae_differentiableAt`.

**Checks.**
- `c°_HZ` is monotone under exact embeddings and homogeneous of degree one under rescaling of
  `ω`; for the ball `B²ⁿ(r)` the ordinary `c_HZ` is `πr²` (Hofer–Zehnder Chapter 3), and the
  contractible version agrees since the ball is simply connected.
- For the torus `T^r` the standing capacity `c°_HZ(D*T^r) = ∞`: a flat torus has no
  contractible closed geodesics, so no contractible closed characteristics on `S*T^r`.
- The almost existence property is not existence: Proposition 6.3 produces closed
  characteristics on almost every level, and a single level can carry none (Ginzburg's
  counterexamples), which is why Conjecture 1.2 is out of scope.

### Examples

- `T*ℝ` with `H = p²/2` and the rotation Hamiltonian on `ℝ²`, as in worked example 9.
- `(D*S¹, −λ_can)` as a Liouville domain whose completion is `T*S¹`.

### Dependencies

HeegaardFloer F2.1; HamiltonianSystems Layers 1–2; DifferentialGeometry Layers 0–1 and 3; Tau
Ceti `cotangentSymplecticForm`, `cotangentLiouvilleForm`; Mathlib `Monotone.ae_differentiableAt`.
Source: Hofer–Zehnder, *Symplectic Invariants and Hamiltonian Dynamics*, Chapters 1 and 4; the
source paper §1.2.
## Layer 7: classical Hamiltonian Floer homology and symplectic homology

This layer consumes Lanes F0–F2 of the Heegaard Floer roadmap. Floer cylinders have domain
`ℝ × S¹` and no boundary. Half-cylinders with boundary on the zero section use Lane F1's totally
real boundary conditions. Items 1–5 are the standing theory on symplectically aspherical and
atoroidal targets and on Liouville domains, with the all-dimensional compactifications that
Layer 8 twists; the three classical branches 7.C, 7.G and 7.T that follow have the count
dimensions of their own identities and do not extend Layer 8.

### 7.1 Floer cylinders, energy and the Conley–Zehnder index

Define Floer cylinders `u : ℝ × S¹ → X` solving `u_s + J_t(u_t − X_H) = 0` with `ι_{X_H} ω = dH`,
negative-end input and positive-end output, and prove the energy identity: for the
reference-cylinder action `𝒜_H = ∫ γ̄^*ω − ∫ H dt`, the energy `E(u) = ∫ |u_s|² ds dt` of a
cylinder from `x₋` to `x₊` is `𝒜_H(x₋) − 𝒜_H(x₊)`, so `𝒜_H` decreases along `s`. Take
HeegaardFloer F1.4's Conley–Zehnder index `CZ = −μ_RS` in the trivializations fixed by the
conventions. The Maslov index of symplectic paths and loops is derived from Lane F1.4's Maslov
index of Lagrangian paths through graphs (`Ψ ↦ graph Ψ ⊂ (ℝ²ⁿ × ℝ²ⁿ, −ω ⊕ ω)`, relative to the
diagonal, after Robbin–Salamon); it is not a second construction. Consume F1.5's identification
of the clutching-loop first Chern number with CharacteristicClasses' topological `c₁`, with the
same trivializations and factor-2 convention. The contractible complex is defined under
asphericity alone; the all-free-loop construction uses the separate atoroidality hypothesis.
Asphericity rules out sphere bubbling in `𝓛₀X`, and atoroidality does the same in all of `𝓛X`.
*Needs:* Layer 6 item 1, HeegaardFloer F1.4–F1.5 and F2.1, CharacteristicClasses C3.2,
conventions (Floer grading, sign dictionary).

**Checks.**
- The constant cylinder at a 1-periodic orbit has energy `0`, consistently with the identity
  `E = 𝒜_H(x₋) − 𝒜_H(x₊)`; a sign error in the action would make nonconstant cylinders have
  negative energy.
- On `ℝ²` with `H = (q² + p²)/2 · ε`, `ε` small, the constant orbit at `0` has `CZ = −1`
  in the normalization `FH_* ≅ H_{*+1}`, since `CZ = ind_Morse − n` with `ind_Morse = 0`,
  `n = 1`; replacing `H` by `−H` gives `CZ = +1`.
- For a loop of symplectic matrices the Maslov index of its graph equals the winding of
  `det` of its unitary part, and `c₁(TS²)[S²] = 2` is the Chern number of the clutching loop of
  degree `2`.

### 7.2 Compactness, transversality and gluing

Prove compactness, transversality for generic `J` and gluing for Floer cylinders (Salamon §§2.6,
3.1 and 3.3; Audin–Damian Chapters 6–9), with topological manifolds-with-corners
compactifications in every dimension under the standing aspherical and atoroidal hypotheses.
Layer 0 item 4 consumes their oriented product-face fundamental-chain systems. The regular
analytic loci additionally carry the differentiable charts, tangent-kernel identifications,
evaluation and action maps and determinant comparisons used in constructing those spaces;
topological corners alone do not supply that analysis. *Needs:* item 1, HeegaardFloer F0, F1 and
F2.2–F2.5, Layer 0 item 4.

**Checks.**
- A sequence of cylinders of bounded energy between fixed orbits has a subsequence converging to
  a broken cylinder; under asphericity no sphere bubbles off, and the example of `S²` with a
  nonzero-area sphere shows the hypothesis is needed.
- The gluing of two rigid cylinders through an intermediate orbit produces the two ends of a
  one-dimensional moduli space, which is why `∂² = 0` in item 4.
- The all-dimensional compactification of the moduli space of cylinders of index difference
  `k` is a `(k−1)`-dimensional manifold with corners whose codimension-`j` stratum consists of
  `j`-times broken cylinders.

### 7.3 Orientations over `ℤ`

Construct coherent orientations through determinant lines of stabilized Cauchy–Riemann
operators (HeegaardFloer F1); prove the gluing sign `(−1)^{dim V₂ · ind D₁}` (the source's Lemma
3.1) and the boundary-orientation comparison on `𝓜(x, z) × 𝓜(z, y)` (Proposition 3.3).
*Needs:* item 2, HeegaardFloer F1 (determinant lines).

**Checks.**
- With `dim V₂ = 0` or `ind D₁` even the gluing sign is `+1`.
- On the circle with the height function (Morse case) the two trajectories carry opposite
  signs, and `∂² = 0` holds over `ℤ` only with those signs.
- Reversing the orientation of one end line changes the orientation of every moduli space with
  that end by a global sign, and the complex by an isomorphism.

### 7.4 The Floer complex

Define the complex, continuation maps and homotopies; prove that the action filtration is
preserved by monotone homotopies and shifted by at most the Hofer-norm bound by general ones.
For closed aspherical `X` in the contractible sector, construct `FH_*(X) ≅ H_{*+n}(X)` by the
common module-comparison construction specified in 7.C.5b on `Γ = 0`: its inputs are the
independent Morse complex, raw capped and reflected cylinder and PSS carriers, conditional
estimates, selected data, orientations, support and both inverse boundaries; neither
module-comparison readout is an input to those constructions. Construct the reflection, cap and
coefficient chain transport before reading this standing convention. The all-dimensional
corner-chain package of item 2 is a separate output and remains available to Layer 8; the
module comparison does not replace it. *Needs:* items 1–3, 7.C.5b, Layer 6 item 1.

**Checks.**
- `FH_*(H) ≅ H_{*+n}(X)` for a `C²`-small Morse Hamiltonian on a closed aspherical `X`
  (worked example 6): on `S²` the two critical points of the height function give `FH_{−1}` and
  `FH_{1}`, which are `H_0(S²)` and `H_2(S²)`.
- The continuation map for a constant homotopy is the identity.
- The action filtration shift: for `H_s = H + ε(s)` with `ε` a bump of integral `δ`, the
  continuation map shifts the filtration by exactly `δ`.

### 7.5 Symplectic homology

Define `SH_*(W)` of a Liouville domain as a direct limit over slopes, with classical local
coefficients (Abouzaid Chapter 1, §§1.5–1.6; Seidel §3); the zero-energy and positive-energy
parts and the long exact sequence between them; the Viterbo transfer `ι_!` for exact
codimension-zero embeddings. *Needs:* items 1–4, Layer 6 item 2.

**Checks.**
- `SH_*(D²ⁿ) = 0`: a linear Hamiltonian of slope not in `2πℤ` has only the constant orbit at
  the origin, whose index rises by `2n` each time the slope crosses `2πℤ`, so the direct limit
  over slopes vanishes.
- `SH_*(T*S¹) ≅ H_*(𝓛S¹)` (worked example 7).
- The transfer for `W ⊆ W` is the identity, and for `D²ⁿ ⊆ W` it is zero.
### 7.C Capped classical Floer theory on closed spherically monotone and spherically c₁-zero targets

This branch constructs classical Hamiltonian Floer complexes, continuation and PSS comparison for a closed connected symplectic manifold `(X²ⁿ,ω)` in the contractible orbit sector. Its target hypotheses are either **positive spherical monotonicity**, `ω(A)=κ c₁(A)` for every spherical integral class, with a specified `κ>0`, or **spherical c₁-zero**, `c₁(A)=0` for every spherical integral class, with no assumption that sphere areas vanish. Its compactifications have the dimensions required by the counts, chain identities, homotopies and PSS comparisons below. Layer 7 items 1–5 and Layer 8 retain their stated aspherical/atoroidal and Liouville hypotheses and their separate all-dimensional corner-space requirements. The monotone outputs here are ordinary/Novikov classical counts in these stated dimensions; the standing DG-coefficient and symplectic-homology outputs retain their own hypotheses.

**Checks (conventions of the capped branch).**
- A small positive plane rotation has `μ = 1`, and for a `C²`-small autonomous Morse Hamiltonian
  `μ(x, const) = ind_Morse(H, x) − n`; with `CZ_HF` in place of `μ = −CZ_HF` both signs flip.
- A cap change `D′ − D = A` gives `μ(x, D′) = μ(x, D) + 2c₁(A)`; on `ℂP¹` with `A` the line,
  `c₁(A) = 2` and the index jumps by `4`.
- The two inverse homotopies of 7.C.5b have distinct signed identity endpoints, `d𝓗_M + 𝓗_M d = PSS⁻¹∘PSS − Id_M`
  and `d𝓗_τ + 𝓗_τ d = 𝒩 − Id_CF`; a construction with a single homotopy would identify `Id_M` with `Id_CF`.
- On `ℂPⁿ` with positive spherical monotonicity and Chern generator `n + 1`, the cyclic module
  formula of 7.C.5b gives one copy of `R` in precisely the degrees `i` for which `i + n` is one of
  `0, 2, …, 2n` modulo `2(n+1)`, and zero in the other degrees; the positive-monotone Laurent
  theory before `t ↦ 1` has `R[t, t⁻¹]` in those degrees.
- On `Γ = 0` the integer formula `HF_i ≅ H_{i+n}(X; R)` agrees with the reflected standing
  contractible complex of item 4 at the reflected Hamiltonian `H∨`.
- Finite-Laurent identities are proved before completion: over `R[Γ]` with `Γ ≠ 0` the
  specialization `t ↦ 1` exists, whereas on the completion no unital map sending every monomial
  to `1` exists (7.C.6f).

### 7.C.0 Suppliers and literal convention transport

Consume HeegaardFloer F0 and F1.1–F1.5 for Sobolev sections, finite-order Sard–Smale budgets, elliptic/adjoint regularity, spectral flow, the single Maslov/CZ index, relative c₁, determinant lines and signed puncture Riemann–Roch; F2.1–5 and F2.6a–d supply their stated local curve/sphere/factorization/simple marked-regularity floors. Consume AnalyticStableMaps M3 for full marked unforced genus-zero stable-map compactness over compact tame-J families. this roadmap constructs the rooted attachment/matching, varying frozen-structure and inhomogeneous fixed-asymptotic applications, every Morse-incidence application and the unstable two-marked constant raw-core normalization. HeegaardFloer's minimal-area zero/one-marked compactness keeps its extra area hypothesis. Consume MorseNovikov N1 as the generic support/completion owner; this roadmap proves its geometric finite-below and graded-chain adapters. Consume HamiltonianSystems Layers 1–2 and Layer 6 here for the actual Hamiltonian fields and time-dependent flows.

Layer 7.C uses the following capped contractible convention. It is the contractible capped theory on the two hypotheses stated in its heading; it uses `μ=−CZ_HF` on the same path, spherical cap changes, and the action `A_H=∫Hdt+∫_Dω`. Its positive-end input and negative-end output satisfy `u_s+J_t(u_t−X_H)=0` and are upward for `A_H`. The standing convention uses `CZ`, a reference-loop cylinder oriented from the orbit to the reference, and `𝒜_H=∫γ̄^*ω−∫Hdt`. On the contractible aspherical overlap with constant reference and zero reference cap, the same-H actions satisfy `𝒜_H(γ̄)=−A_C(H,γ,D)` when `γ̄` is oriented from the orbit to the reference. A standing trajectory has negative-end input `x₋`, positive-end output `x₊`, and `E=𝒜_H(γ̄₋)−𝒜_H(γ̄₊)`; for the fixed PDE `u_s+J_t(u_t−X_H)=0`, `𝒜_H` decreases along s. The t-independent equation is the negative-gradient equation for `−H` and has the same Morse degree as the source branch after reflection. Under the reflected Hamiltonian and cap reflection, `A_C(H∨,reflected x)=−A_C(H,x)`, so the two energy conventions agree. These identities use the stated zero-reference normalization; other reference choices may add constants. The convention identification is only with the standing complex on 𝓛₀X under asphericity alone, on the `Γ=0` overlap and at the reflected Hamiltonian `H∨`. Its overlap comparison uses the reflected Hamiltonian and contractible aspherical sector specified here.

Use `ι_(X_H)ω=dH`, `g_t(v,w)=ω(v,J_t w)` for compatible `J_t`,
`A_H(γ,D)=∫₀¹H_t(γ(t))dt+∫_Dω`, and
`u_s+J_t(u_t−X_H)=0`. On smooth loops prove `dA_H(ξ)=∫ω(ξ,γ̇−X_H)` and the weak-L² identity `grad A_H=−J_t(γ̇−X_H)`: these are upward gradient cylinders. For any Hˢ realization, construct this differential expression with its derivative loss into H^(s−1); the differential expression has precisely this weak-metric and derivative-loss meaning. Both asymptotic limits are part of the carrier. The homological input is the positive end `x₊`, and the output is the negative end `x₋`. Write `μ(x,D)=−CZ_HF(x,D)` on the **same** symplectic path. Consequently a small positive plane rotation has μ=1, `μ(x,const)=ind_Morse(H,x)−n`, and a cap change `D′−D=A` gives `μ(x,D′)=μ(x,D)+2c₁(A)`. Prove this identity from the actual extending-frame clutching loop, whose winding in the old frame is `−c₁(A)`.

On the actual aspherical overlap, where Γ=0, retain the path-level dictionary given by `v(s,t)=u(−s,−t)`, `H∨_t=−H_(−t)`, `J∨_t=J_(−t)` and reflected cap boundary parametrizations. The index identity is `CZ_HF(H∨,reflected cap)=−CZ_HF(H,cap)=μ_H`; the physical negative end of v is the positive-end input of u. These are the reflected equation, capped path and index identities. The chain-level comparison is a downstream submilestone of 7.C.4. After both complexes, counts, continuation maps and orientation lines exist, construct the quotient-then-negative-flow orientation reversal and the degree-dependent chain sign, if any, from the actual determinant and boundary exact sequences, then prove that the map intertwines reflected continuation. The standing comparison is on 𝓛₀X under asphericity alone. The resulting chain comparison is at H∨. The coefficient comparison is on Γ=0. μ remains a notation for the single supplied index. For the cylindrical linear model `D=∂s+B_s`, `B_s=J₀∂t+S_s`, apply F1.3 to `−B_s`: `ind D=SF(B)=−SF(−B)`. Check the scalar `B=tanh s` kernel `sech s`, cokernel 0, and index 1. Use the L² common-domain self-adjoint realization and the actual Lᵖ elliptic transport for `1<p<∞`; coefficient norm convergence, end invertibility and graph estimates are hypotheses of that application. The puncture formula in μ notation is `nχ(Σ)+2c₁^τ+Σ_positive μ−Σ_negative μ`. Use complex-oriented end reversal, stabilized matching exact sequences and determinant gluing; use the determinant exact sequences for kernels and cokernels. The constant-sphere adjoint comparison uses `deg K_(S²)=−2` and `c₁(TS²)=2` as different bundles.

*Needs:* HeegaardFloer F0, F1.1–F1.5, F2.1–F2.5 and F2.6a–d; AnalyticStableMaps M3; MorseNovikov N1; HamiltonianSystems Layers 1–2; Layer 6 items 1–2; conventions (sign dictionary); Salamon §§1.4 and 2.4.

### 7.C.1 Capped loop cover, periods and the time-dependent variational equation

Let `S_sph⊂H₂(X;ℤ)` be the image of the spherical Hurewicz map and put `Γ=S_sph/(ker ω∩ker c₁)`. Define caps equivalent when their glued difference pairs to zero with both ω and c₁. Construct the cap cover of the contractible loop component by local cap transport, prove its topology and path lifting, and identify each fibre with a Γ-torsor. Construct the forgetful, recapping, gluing, smooth/Sobolev and reference-cap comparison maps. Prove evaluation of contractible loops has a constant-loop section and that its based-loop fibre retains the π₂ term; retain the π₁(X) contribution in the evaluation sequence instead of identifying π₁(L₀X) with π₂(X). Show the period/Chern transgression factors through the stated Γ-cover. The generator sector of this construction consists of contractible loops.

Assume every contractible one-periodic orbit of H is nondegenerate. Prove the corresponding subset of the time-one fixed set compact: x↦(t↦φ_H^t(x)) is continuous into the smooth loop space, loop free-homotopy classes are locally constant by short-geodesic homotopies, and hence its contractible preimage is open and closed in the compact fixed set. End nondegeneracy makes this subset discrete, so it is finite. Choose one cap per such orbit; all breaking and cap transport remain in this contractible sector. Other standing orbit sectors retain their own stated nondegeneracy hypotheses. Construct the action, its recapping law `A_H(A·x̃)=A_H(x̃)+ω(A)`, critical-point/fixed-point bijection and index independence modulo `2c₁(S_sph)`. Put `c₁(S_sph)=N_Cℤ` with `N_C>0` when nonzero; otherwise use an integer grading, without a minimum of an empty positive set.

*Needs:* 7.C.0; Layer 6 item 1; Layer 2 item 1; HeegaardFloer F1.5 and HamiltonianSystems Layer 2 (the variational equation); AlgebraicTopology Stage 8.3 (the spherical Hurewicz image).

### 7.C.1(i) Coefficient-torsor datum

From this cap cover construct the typed datum `(Γ,ω,c₁,ν=−ω)` and its Γ-torsor of caps over each orbit, with reference-cap coordinates and diagonal monomial changes over R[Γ]. This datum is available before either branch-specific coefficient classification. Its monotone injective-Chern and spherical-c₁-zero injective-period specializations are proved separately in 7.C.6a and 7.C.6e; each concrete matrix construction consumes its own specialization.

For the actual time-dependent flow `φ_t` prove, with a torsion-free connection,
`∇_t(dφ_t v)=∇_(dφ_t v)X_(H_t)` by differentiating a two-parameter variation. Compare the actual symplectic-frame ODE, including connection and frame derivatives, with the asymptotic operator of the cylinder linearization. This is the time-dependent connection/frame application of HamiltonianSystems' variational equation.

*Needs:* 7.C.1; MorseNovikov N1.

### 7.C.1a Auxiliary Morse comparison complex

Fix an auxiliary Morse–Smale pair (f,g) independently of Hamiltonian H. Consume HeegaardFloer Lane M and its explicit MorseTheory M1–M6 and DifferentialGeometry flow prerequisites for the Morse-function, normal-form, sublevel, attachment and dynamics foundations. Consume that same Lane M1–M5 for the oriented homological Morse complex MC_j(f,g;R), its signed Morse/singular comparison and ordinary Morse continuation. Define M_i=MC_(i+n)(f,g;R), d_M=d_MC; a generator of Morse index j has degree j−n and its coefficient differential is zero. In the positive-monotone coefficient model give e^A degree 2c₁(A), so x⊗e^A has total degree j−n+2c₁(A). Build this comparison complex independently of autonomous Floer trajectories; PSS sections and equivalences use it. The small autonomous Hamiltonian construction in 7.C.5 is a later specialization: for H=εf with ε>0 sufficiently small and a realized compatible Morse–Smale metric, prove the positive-rescaling normalization and the ordinary Morse-continuation comparison between the realized metric and the auxiliary metric, using HeegaardFloer Lane M1–M5. this roadmap owns this Floer specialization and all PSS constructions. The auxiliary Morse complex precedes both PSS and the autonomous trajectory comparison; this metric-comparison target consumes ordinary Morse continuation.

*Needs:* HeegaardFloer Lane M with MorseTheory M1–M6; 7.C.0.

### 7.C.2 Cylinder and seam analysis

Construct the Banach configuration spaces with specified capped ends, exponential decay charts, regularity bootstrap and the Floer section. Its covariant derivative is

`∇sξ+J_t∇tξ−J_t∇ξX_H+(∇ξJ_t)(u_t−X_H)`.

Prove its end comparison, Fredholm index `μ(x̃₊)−μ(x̃₋)` for cap-matched ends, and, for fixed reference caps and cylinder class `A_cyl=D₋+u−D₊`, index `μ(x̃₊)−μ(x̃₋)+2c₁(A_cyl)`. Prove the fixed-H energy formula `E=A_H(x̃₊)−A_H(x̃₋)` for matched caps, where `E=∫ω(u_s,J_tu_s)`; choose compatible J throughout this closed capped branch, so this is its actual metric energy. The tame-data application and comparison are constructed in 7.C.2c.

For nonstationary cylinders prove the FHS injective-point/separation theorem for `(s,t)↦(u(s,t),t)`, including separation from asymptotic orbits, and the localized universal perturbation/adjoint argument for generic periodic J. State and prove the regularity budget on every parameter window. Treat `u(s,t)=γ(t)` separately: the identical nondegenerate end operator makes its constant-cylinder linearization invertible; the translation action is not free there. Any use of the symmetric-matrix lemma in the transversality proof must establish its orthogonality condition. With orthogonal J, symmetric S_mat, `C_J=S_matJ−JS_mat`, `L=C_J−aI−bJ`, `Lz=0`, prove `LJz=2bz−2aJz`; the adjustment `(α,β,ξ)↦(α−2tb,β+2ta,ξ−tJz)` preserves `Lξ−(α+βJ)z`. Choose t to make `ξ⊥Jz`, and construct the symmetric complex-linear matrix taking z to ξ. Use this algebra in the localized analytic proof with its actual range and regularity estimates.

For an arbitrary symplectomorphism ψ, construct the **linear seam application** with `u(s,t+1)=ψ⁻¹u(s,t)`, compatible `J_(t+1)=dψ⁻¹ J_t dψ`, bundle gluing, nondegenerate asymptotics, reference trivializations and the signed F1 index/determinant comparison. A cylinder joining constant fixed points lies in a specified seam component; an action is used only with a supplied period homomorphism/reference cap or cylinder and a proved energy identity. For `ψ=φ_H¹`, additionally construct the global equation identification in the contractible untwisted sector: `w(s,t)=φ_H^t(v(s,t))` takes the ψ⁻¹ seam to periodic w and transforms `v_s+J'_t v_t=0` to `w_s+J_t(w_t−X_H)=0`, with `J'_t=(dφ_H^t)⁻¹J_t dφ_H^t`. Prove the cap, action, class, asymptotic and determinant transport. The arbitrary-ψ output is this linear seam theorem; the global equation/cap transport here uses ψ=φ_H¹.

*Needs:* 7.C.0–7.C.1; HeegaardFloer F0, F1.1–F1.4, F2.2a and F2.2c; Salamon §§2.1–2.7; Floer–Hofer–Salamon Lemma 6.5.

### 7.C.2a Ordered determinant kernels, count functionals and family conventions

Construct abstract Fredholm determinant bundles and stabilized kernel/cokernel, direct-sum, duality, evaluation and recapping isomorphisms for fixed topological domain, puncture, cap and end types. Factor the unselected domain, cap, marker and matching templates from the choice of compatible or tame J. Pull the abstract determinant interfaces back to each lane's actual raw endpoint, cylinder, plane, nodal, smoothing and cutoff-zero operators, including both pole constraints, before the constant-reference calculation. The downstream regular-gluing theorem compares these raw references with actual analytic gluing. Pure-cylinder determinant and quotient-followed-by-negative-flow interfaces use arbitrary supplied oriented end lines, HeegaardFloer F0/F1 and the raw cylinder/end carrier, without Morse or PSS data. Formal tensor/dual/evaluation identities are universal identities of complexes before either lane's actual differential exists; independent Morse and raw plane data are supplied only for their PSS instantiation.

Use the standard homological tensor category, with differential of degree −1, Koszul symmetry and dual differential `d(f)=(-1)^(|f|+1)f d`. Let `U` be the oriented Morse complex before its degree shift, `o_x` the Floer end line of degree μ(x̃), `λ` a fixed oriented zero-differential line of degree n, and `V` the complex-oriented line of degree 2n. Fix positive degree-zero maps `b_λ:λ→λ∨∨` and `φ_p:λ⊗λ∨∨→det(T_pX)`. Set `m=U⊗λ∨`, with `d_m=d_U⊗id`, and the formal stable complex `S_st=U∨⊗V`. Construct the comparison of the actual stable Morse boundary orientations with this complex and its basis-positive stable solving map. In particular its basis differential is `d s_k=(-1)^(k+1)Σ a_(k+1,k)s_(k+1)` when `d_U u_(k+1)=Σ a_(k+1,k)u_k`.

The orientation specification precedes the actual Floer differential. Its tensor/dual calculations are universal formal identities; the later oriented-boundary and count construction establishes the actual differential, its square-zero and chain equations, and instantiates these identities.

Fix cap lines `C_x^+=o_x⊗λ` and `C_x^−=λ∨∨⊗o_x∨`, of degrees n+μ and n−μ. Define their degree-zero cap pairing `γ_min:C^+⊗C^−→V` to have coefficient `(-1)^(μ+n)` on the specified positive bases. This is positive in the complex quadratic-minimum reference, where μ=−n. Its sewing map is the right-dual **coevaluation** `q_min:V→C^−⊗C^+`, with the same coefficient `(-1)^(μ+n)`; prove its snake identities and differential compatibility. The swapped negative-first evaluation has coefficient +1 and is a different map. Use the coevaluation in composing count functionals. Prove these laws from the actual end/cap determinant isomorphisms, including frame and recapping cocycles. Recapping changes μ by an even integer.

For each operation from A to B use the input-first external orientation kernel `𝒦(A,B)=A⊗B∨`. Its count is a functional on 𝒦(A,B). The chain-compatible identification `𝒦(A,B)∨=B∨∨⊗A∨→B⊗A∨=Hom(A,B)` uses `j_ch,B^−1`, where `j_ch(x)=(-1)^|x|j₀(x)` for the positive-basis bidual map j₀. Thus a degree-zero count functional has ordinary operator coefficient `(-1)^|B|` times its coefficient in the positive kernel bases. The identity functional is right evaluation, with coefficient `(-1)^|A|`; the identity vector is left coevaluation. Construct both APIs with their actual variances.

Write `F:M→CF` for the negative-plane map and `G:CF→M` for the positive-plane map. Their raw kernels are `E_F=U_p⊗C_x^−⊗V_p∨` and `E_G=C_x^+⊗S_st,q⊗V_q∨`. Fix the positive vector readouts `E_F→m_p⊗o_x∨` and `E_G→o_x⊗m_q∨`: the first contracts `λ∨∨⊗λ∨` by left evaluation of λ∨, and the second uses the stable solving map, even V evaluation and b_λ. Prove the readouts are chain isomorphisms on adjacent generators. On count functionals their ordinary operator coefficients are respectively `(-1)^μ` and `(-1)^(ind(q)−n)`. These fix the conversion from plane count functionals to ordinary operators before counting. The degree-zero external readouts of the Morse inverse family, the finite-Morse-length family and the smoothing/identity family each have the further fixed factor `(-1)^n`; retain that factor on every face of each family. The normalized nodal map 𝒩 uses that same family readout.

For a nodal pair order the matching sequence as

`0→ker D_N→ker D₊⊕ker D₋→TX→coker D_N→coker D₊⊕coker D₋→0`,

with `ev₊−ev₋`, positive-plane factor first, and complex-oriented TX. Its external kernel is `C_x^+⊗C_y^−⊗V∨`. Use this identical sequence at the L=0 and positive-ray τ=0 faces. On the stationary fibre the unscaled functional is γ_min; its ordinary readout is `(-1)^n Id`, so the specified family factor gives Id. Construct the stationary Fredholm comparison with these maps.

At the Morse inverse zero face retain both ordered pole targets. In domain order `U_p⊕V⊕S_st,q` and target order `V_p⊕V_q`, the constant-core matching map is `(u,v,s)↦(u−v,v−s)`. Compute its determinant `(-1)^k` for every k=ind(p)=ind(q), using both constraint duals. The count-functional readout into Hom(M,M) contributes `(-1)^(k−n)` and the fixed family factor contributes `(-1)^n`, giving the positive identity. Calibrate the complex minimum by its actual cap operators of indices 0 and 2n, and prove the comparison for every k by its own stabilized exact-sequence diagram. The constant two-marked core is contracted as in 7.C.3a.

At the broken Morse inverse face insert q_min for the intermediate Floer end. At the Floer inverse long face orient the negative-gradient graph by its first projection. For the stable/unstable splitting its canonical map is `χ_M:V→S_st⊗U`, with coefficient `(-1)^k` on `s_k⊗u_k`. Prove its adjacent-generator differential identity and the actual Morse gluing comparison; the two pole-normal factors retain their order and have even degree. Together with the functional readouts and fixed family factors above these give positive GF and FG composition faces. Construct these simultaneous raw determinant diagrams before counts, then prove their agreement with actual regular gluing at the corresponding endpoint theorem. The reference computation and the per-index finite-block computations fix the convention; its full geometric realization is a construction target.

Construct the pure-cylinder quotient/negative-flow orientation comparison on HeegaardFloer F1 determinant lines, with quotient orientation followed by the negative-flow tangent. In the actual Morse applications compare this convention with HeegaardFloer M.3, using the auxiliary Morse datum there. Along the positive-end-input arrow this tangent is −u_s; the translation generator is +u_s. A translation-first convention changes by `(-1)^d` when its line moves past a d-dimensional quotient. Use outward normal first at parameter boundaries. For an oriented j-dimensional parameter chain P and input of degree i, the raw count kernel is `A⊗det(P)⊗B∨` with output degree i+j. The Hom degree is +j. Its parameter-first operator readout has coefficient `(-1)^(i+j+ij)` on positive bases; the three inverse families also retain their fixed factor `(-1)^n`. Once an input-first operator readout has already been taken, the further parameter-first conversion is `(-1)^(ij)`. Prove the actual ordered boundary comparison giving `D T_P=dT_P−(-1)^jT_Pd=T_(∂P)`. A degree-one inverse homotopy therefore has raw functional readout `(-1)^(n+1)` and differential d𝓗+𝓗d.

Prove the simultaneous Morse/Fredholm realization of this complete system, including the actual stable Morse differential, cap pairing and sewing coevaluation, both pole constraints, graph χ_M, identical nodal sequences, raw endpoint data, parameter/flow order, frame changes, recapping and stabilization. Orient the Morse comparison from its zero-cutoff identity face toward its broken GF face, L increasingly and τ decreasingly. At each fixed total cap/class and finite energy window the oriented boundary readouts have the formal shapes `D𝓗_M=GF−Id_M`, `D𝓗_L=FG−𝒩` and `D𝓗_τ=𝒩−Id_CF`, where D is the specified graded Hom boundary readout. First these are finite geometric boundary identities of the actual cutdown spaces, with end counts and matching multiplicities. After support and the corresponding matrices exist, 7.C.6 interprets them as the displayed chain-homotopy equations in the finite-Laurent or completed module. Use the same determinant realization in both branches, with their own actual compactness and endpoint theorems.

*Needs:* 7.C.2; 7.C.1a; HeegaardFloer F1 (determinant lines).

### 7.C.2b Raw individual continuation sections

Construct fixed-end data `(H_(s,t),J_(s,t))` with compatible J, nondegenerate Floer ends and finite `∫sup_X|∂sH|`. Raw configuration/section bundles, vertical linearizations, Fredholm/evaluation maps and cap classes may retain those ends as unselected parameters. Their selected instantiation consumes the regular cylinder/end data and shared t-parametrized sphere-evaluation families constructed in 7.C.3. Fix those selected ends before selecting the individual continuation section. Vary H_s by genuine compactly supported smooth interior variations, together with J, preserving the selected tails.

*Needs:* 7.C.2; the selected ends of 7.C.3.

### 7.C.2b(0) Raw cylinder homotopy and composition templates

Before selecting interiors construct the parameterized cylinder domains for interpolation homotopies and composition: fixed capped asymptotic ends, end markers and cylindrical coordinates; finite neck length, neck/cutoff profiles and their compactified parameter coordinates; smooth one-forms H_(p,s,t)dt or the declared more general K, compatible J_(p,s,t), fixed-tail jets and matching cap/reference maps. At this raw stage face sections are unselected variables satisfying the stated restriction/corner equations. A zero-length identity uses the raw stationary cylinder, not a two-marked PSS sphere. Construct the raw Sobolev sections, compact-parameter K-curvature allowances, evaluation maps and determinant pullbacks. Establish raw energy-cutoff compactness and conditional gluing for these cylinder templates independently of any Morse/PSS data. After the cylinder ends and individual continuation sections are selected, insert those selected pieces as actual regular true faces, then perform the face-flat relative interior selection. The PSS comparison-domain templates below are separate carriers.

*Needs:* 7.C.2b.

### 7.C.2b(i) Smooth perturbation synthesis and the continuation face-free carrier

Fix the domain/end metrics, target connections, parameter coordinate windows, bundle charts, end weights and configuration windows. At each finite F0 section/evaluation/projection differentiability budget record the finite mixed derivative list I_m, the finite list P_m⊂[1,∞) of integrability exponents, and the positive domain weights w_(m,α,β,γ,q). Include every derivative needed by the actual Sobolev multiplication and trace theorems for that budget. A perturbation direction is e=(A,δK), where A is a compatible-J bundle-chart direction and δK is a smooth domain Hamiltonian one-form (δH_sdt in the individual continuation instance). For each B=A,δK and each (α,β,γ)∈I_m include the linear coefficient seminorms

`sup_(p,z,x) w_(m,α,β,γ,∞)(p,z)|∂p^α∇z^β∇X^γ B(p,z,x)|`,

`sup_p (∫_Σ [sup_(x∈X) w_(m,α,β,γ,q)(p,z)|∂p^α∇z^β∇X^γ B(p,z,x)|]^q dvol_Σ)^(1/q)` for q∈P_m.

The lists include all mixed parameter/domain/target derivatives, for both A and δK, through the specified finite budgets; the weights and norms are fixed independently of the perturbation. Include C^m seminorms on the first m compact exhaustion charts. The global A₀ controls also include the unweighted compatible-J and δK C⁰ norms, `sup_(p,z,x)|∇_XδK|`, and `sup_p∫_Σ sup_X(|d_ΣδK|+|∇_XδK|)dvol_Σ`. The target supremum is inside every domain integral. Derive the corresponding linear multiplication/weighted-Sobolev operator bounds, using dense compactly supported test sections for their operator norms. Define A_m by the finite sum of these controls and all earlier A_j. Prove each compact testing-library element finite for these fixed norms, including its transported cutoffs and weights. Prove lower semicontinuity under C^∞_loc: coefficient suprema use suprema, coefficient integral norms use Fatou followed by sup_p, and linear operator norms use dense compact tests with the actual source/target norm comparisons.

For a countable dense local testing library e_ν set `w_ν=2^ν max(1,A₀(e_ν),…,A_ν(e_ν))`. Prove the ℓ¹(w_ν) series converges in C^∞_loc and in every controlled global seminorm, by applying the lower-semicontinuity bounds to its tails. Its closed-kernel quotient is a complete separable Banach space injected into smooth fields. Instantiate it first on the individual continuation cylinder with free compact interior δH_s and A directions. Using `J(A)=exp(A)J_base exp(−A)`, prove the finite-order chain-rule and Sobolev–Moser estimates for composition with every controlled configuration map, including evaluation, trace and parameter derivatives. These estimates establish the universal section and projection maps C^ℓ on each declared configuration window from the stated linear coefficient controls. The synthesis seminorms are the stated linear coefficient and linear operator controls. Require A to lie in the symplectic Lie algebra and satisfy AJ_base=−J_base A. Then exp(A) is symplectic and J(A)=exp(A)J_base exp(−A) is compatible; prove the compatible-J local chart and the uniform metric bounds on the specified small chart balls. Expanding the Hamiltonian curvature gives `sup_p∫_Σ sup_X|R_(K+δK)−R_K|≤C₁‖e‖+C₂‖e‖²`: the quadratic bracket is bounded by the global first-target-derivative supremum times its L¹ domain integral, and background brackets and d_ΣδK by the stated linear controls. This proves the global bound on tails and necks with the fixed metrics. The face-free construction uses only these coefficient/global norms.

Build the individual continuation universal section and its simple-sphere/marked-incidence families at the actual attachment structures J_(s,t), together with their shared core and matching evaluations. On each fixed end J_(s,t)=J_t, use the previously selected t-parametrized sphere/evaluation families: attachments with equal t share that same J_t even if their s coordinates differ. Vary the continuation core only in its allowed interior directions and make its evaluations transverse to these fixed end families. In free regions apply the conditional grouped theorem below with its actual domain-localized variations. Sphere tuples allow repeated classes and have pairwise-distinct simple images in the reduced incidence problem. Prove the combined adjoint range, finite F0 budgets, matching transversality and simple-image reductions; constant core solutions are detected by δH_s, while spheres receive no δH_s variation. Select simultaneously on countable class/energy/index/attachment windows. The s-independent identity has its separate invertible stationary operator with identical nondegenerate ends. These selected individual constructions precede homotopy/composition faces and retain the end incidence data in all subsequent restrictions.

For a domain-dependent Hamiltonian one-form `K=K_s ds+K_t dt`, define `X_K` componentwise with `ι_Xω=dH`. Set `{F,G}=ω(X_F,X_G)` and `R_K=∂sK_t−∂tK_s−{K_s,K_t}`. Derive `E_K=∫ω(u_s−X_(K_s),u_t−X_(K_t))=∫u*ω+∫∂ K(u)−∫R_K(u)dsdt` for `(du−X_K)^(0,1)=0`. With capped ends it gives the corresponding action/class identity; for K=H_sdt it is the displayed continuation formula. Prove uniform `∫sup_X|R_K|` bounds on each declared compact parameter window, including neck/stretching/cutoff ranges and the admissible perturbations, with actual end actions/periods and compact target giving the necessary energy cutoffs. Include domain-dependent K variations in this curvature budget.

*Needs:* 7.C.2b; HeegaardFloer F0 (Sobolev budgets).

### 7.C.2b(ii) Raw PSS sections with common poles

Use two fixed globally parametrized planes with Morse pole z=0 and Floer puncture at infinity. Fix their complex coordinates, tangent frames and cylindrical end coordinates once. In the positive-end chart write z=exp(2π(s+it)), and in the negative-end chart z=exp(−2π(s+it)); use the corresponding fixed inversion coordinates at infinity. On the positive plane take β₊H_tdt, zero near0 and equal to H_tdt on its Floer end; use the corresponding negative-end cutoff on the negative plane. Prescribe K=0 and a common domain-independent compatible J_pole=J₀ on fixed discs at both poles, treating J₀ as unselected data at this raw stage. Pair compatible domain-dependent J outside these discs with genuine interior/core/neck Hamiltonian one-form variations δK, zero on the pole discs and fixed Floer tails. Each nonsphere plane of every matching configuration has its own nonempty free δK region. Construct the raw Banach fibre-product sections with the outgoing negative-gradient Morse ray to q on `[0,∞)` and incoming ray from p on `(−∞,0]`, capped ends and evaluation maps. For a single fixed basic datum, the pre-incidence Fredholm indices are n+μ(x̃₊) and n−μ(x̃₋), giving μ(x̃₊)−(ind q−n) and (ind p−n)−μ(x̃₋) after incidence, with all class and parameter corrections. The selected instantiation of these raw planes uses the earlier regular Floer ends and their full t-parametrized sphere-incidence/evaluation data from 7.C.3, together with the independently selected pole datum J₀. This selection occurs before regular plane data or inverse-family true faces are chosen.

*Needs:* 7.C.2b(i); 7.C.1a; the selected ends of 7.C.3.

### 7.C.2b(iii) Unselected comparison-domain templates

Construct the finite Morse-segment, finite Floer-neck, middle-cutoff and cutoff-zero domains, positive nodal smoothing ray, compactified parameter faces, cap/evaluation carriers and cutoff formulas with J₀ and broken-face sections as unselected parameters. The domains, end labels, constraints and matching maps precede any lane's regularity/count theorem. Instantiate their jets and actual sections separately with compatible or uniformly tame J. For each raw finite-neck compact-sphere domain fix smooth K_*∈Ω¹(Σ;C^∞(X)), zero on fixed pole discs with prescribed cutoff/end matching. Near cutoff-zero use K_R^base=R K_* and J_R^base=J₀. The actual R=0 section is the full two-marked unforced J₀-sphere section with its explicit unstable-constant normalization; the other templates retain their fixed nondegenerate Floer asymptotics. Substitute selected continuation/PSS/Morse pieces only in later true-face constructions with their actual regularity and matching corner jets. True-face flatness is all-order vanishing at the face.

*Needs:* 7.C.2b(ii).

### 7.C.2b(iv) Distinct-image separation and conditional joint evaluation

Consume HeegaardFloer F2.2a and F2.2c for the two-map unique-continuation and accumulation-to-factorization floors, and F2.6a–d for sphere domains, single-map factorization and marked quotient/evaluation carriers. Construct the application theorem that two simple maps with distinct images share no open image germ. For a finite tuple for one common J, either ω-compatible or ω-tame, prove that each map has a dense set of injective regular points avoiding all other full simple images and the prescribed finite marked test values. Remove the finite union of the closed other-image preimages with empty interior and the noninjective/critical locus. Specify the actual allowed variation space: a J-tangent Y satisfies YJ+JY=0; in the compatible lane ω(v,Yw) is additionally symmetric, while the tame lane has no such symmetry constraint and is restricted by the chosen open uniformly tame chart. Prove the localized range theorem separately in these two spaces. With disjoint allowed target/domain-localized tests, the combined adjoint equation first kills sphere cokernels; unique continuation and actual matching equations then kill the remaining finite evaluation dual variables. State the finite-F0 theorem for the supplied sphere quotient/evaluation carriers, smooth incidence maps, matching rank conditions, orientations and relative parameter restrictions. Class tuples may repeat while reduced simple images are distinct. This conditional theorem does not select data or construct a Morse datum. Its pure cylinder application uses core/orbit evaluations; Morse-chain, critical-point and broken-Morse applications separately supply HeegaardFloer Lane M and 7.C.1a strata with their actual dimensions.

For a supplied domain-parametrized problem with specified variation space, fixed regions, collision strata and face restrictions, group sphere attachments by their actual common structure in the chosen tame or compatible lane. Wherever the structure depends only on t, every equal-t attachment belongs to the same group, including distinct s or domain points. Fixed pole groups use J₀. Free domain attachment points admit independent localized directions only when those directions belong to the supplied variation space. Apply the common-J theorem within a group and prove the resulting conditional combined range and restriction laws. Actual continuation/PSS applications instantiate this theorem after their carriers and strata exist: fixed end/tail groups consume the selected t-families, free groups consume their actual interior directions, and relative true faces consume their previously selected face data. Their collision, matching, smooth-selection and corner laws are construction outputs of those applications. The grouped theorem uses the selected lane’s actual tangent space and coefficient/coercivity bounds; a compatible-only range theorem is not an input to the arbitrary-tame conclusion.

*Needs:* HeegaardFloer F2.2a, F2.2c and F2.6a–d; 7.C.2b(i).

### 7.C.2b(v) Compact exhaustion within each actual stratum

For every finite component/class tuple, normalized domain type, incidence stratum and equality partition of attachment structures, construct countably many closed quantitative windows indexed by positive integers. Class tuples may repeat. Distinct reduced simple images define that stratum; equal-image vertices are retained in their separate simple-image/cover reduction strata. The equality partition records exactly which times, domain points, marks or target values coincide. Preserve its diagonal equations, and impose a positive lower bound only on distinctions required in that stratum. Equal-t groups are allowed. Marks that collide in the compactification are retained in the corresponding marked/nodal collision stratum.

For each distinct-image simple component choose an injective regular source anchor z_* in a normalized source disc whose image avoids every other reduced image, the required marked test values and fixed forbidden regions. On its normalized closed domain fix the reference source metric g_Σ independently of the map, using the fixed round metric for spheres and the declared slice identifications for varying domain representatives. For a quantitative window with K≥1 require the GLOBAL self-point floor `inf_(ζ∈Σ, ζ≠z_*) d_X(u(z_*),u(ζ))/d_(g_Σ)(z_*,ζ)≥1/K`, together with `‖du‖∞≤K` in these fixed source/target metrics. The infimum ranges over the ENTIRE source, including points outside the anchor disc. Retain separately the regular derivative lower bound, inverse-chart radius and controlled derivative bounds, distance from u(z_*) to every OTHER FULL reduced component image, required marked test value and spatially fixed region, and the slice/automorphism normalization bounds. Impose only the fixed-region separations required for the actual relative variation problem. Nonsphere inhomogeneous section components retain their separately stated FHS graph/core-evaluation window conditions; the closed simple-component floor does not replace those conditions. Record slice/automorphism normalization bounds. Bound domain/parameter coordinates and derivatives and impose distances from the boundary of the domain, mark, incidence and equality-partition chart only where that boundary is excluded from this stratum. For Morse strata use compact subsets of each actual smooth unbroken or broken trajectory stratum, with ranks and separation bounds for the already supplied incidence charts/maps, not regularity of the moduli equation being selected; shared or equal critical values are retained in the stratum allowing them. These are quantitative window inputs, not consequences of single-map bounds.

Prove exhaustion using distinct-image injective-point separation, local slices and the actual allowed diagonal/incidence relations. At an injective regular anchor, the local immersion/inverse estimate gives the ratio floor near z_*, while compactness of the complement of that source neighborhood and uniqueness of its anchor preimage give a positive ratio lower bound there; hence some finite K contains every relevant simple component. Prove relative compactness inside that stratum for convergent smooth structures and data with fixed window bounds: elliptic compactness and normalization preserve the GLOBAL self-point floor, regular derivative, full-other-image/fixed-region and slice bounds. Thus the limiting anchor remains globally injective and regular, preventing degeneration of that simple component to a multiple cover as well as image merger or a forbidden collision. Allowed boundaries have their own strata/windows, with compatible restriction and refinement maps. Derive openness of regularity/evaluation transversality on each proper window, density by the conditional finite-F0 range theorem and relative smooth approximation, then Taubes countable-intersection selection. The abstract smooth-selection theorem takes the declared section/variation spaces, stratum windows, fixed regions and already regular face restrictions as hypotheses. Instantiate it separately for J₀, J_t, J_(s,t), J_(p,s,t) and J_(p,z) only after each actual carrier, conditional range theorem, shared group and matching/incidence problem is constructed, retaining fixed ends/poles and parameter dimensions. Relative exhaustion/refinements commute with prescribed face restrictions; regular true faces remain inputs. No distinctness condition is imposed beyond its defining stratum.

*Needs:* 7.C.2b(iv).

### 7.C.2b(vi) Select the common sphere datum first

Choose one domain-independent compatible smooth J₀ for the simple-sphere finite class tuples (with repetitions allowed and pairwise-distinct simple images), two-marked Morse-chain incidences and one-marked incidences at all critical points of the auxiliary Morse pair. Prove the joint universal section and finite F0 budgets using the actual compatible-J tangent linear algebra and localized simple injective points. Consume HeegaardFloer F2.6d's smooth-J route: use the actual-stratum compact exhaustion of 7.C.2b(v), including the fixed-metric GLOBAL self-point floor, regular derivative and full-other-image/fixed-region anchor bounds, slices and incidence/equality-partition bounds; prove openness on each proper window, density from finite-C^ℓ Sard–Smale and relative smooth approximation, and apply the Taubes countable-intersection argument in the smooth compatible-J topology. Apply the same method to these marked/evaluation fibre products with their actual Morse constraints. Obtain a residual subset of smooth J₀ simultaneously for all declared windows. In spherical c₁-zero the one-marked critical-point strata have the avoidance consequence used below. Fix this J₀ and its regular strata before selecting the planes.

*Needs:* 7.C.2b(v); HeegaardFloer F2.6d; 7.C.1a.

### 7.C.2b(vii) PSS face-free Banach carrier and basic selection

Instantiate the testing-series/closed-kernel synthesis separately on the raw planes, using the space of smooth Hamiltonian one-forms Ω¹(Σ;C^∞(X)) with the specified pole/end restrictions, compatible-J chart directions and the actual finite F0 budgets. Use each plane's independent free δK directions and compatible-J chart directions zero on the fixed pole discs and Floer tails. Use the plane metrics and end weights in every mixed coefficient supremum and weighted L^q norm specified above, for both A and δK, with the actual plane finite F0 section/evaluation/projection lists. Retain the global curvature controls and derive the plane allowance `sup_p∫_Σ sup_X|R_(K+δK)−R_K|≤C₁‖e‖+C₂‖e‖²`. This is an independent face-free plane instance. Prove local detection, lower semicontinuity, complete separable synthesis and the section/evaluation differentiability budgets in this named plane instance. With the independent J₀ strata and the earlier selected regular Floer ends/t-parametrized sphere-evaluation families fixed, prove universal plane evaluation submersivity using free interior δK, the adjoint matching equations and unique continuation; this includes constant planes where J variation vanishes. Select positive/negative plane data and their two pole/matching evaluations transverse to the fixed J₀ sphere/Morse strata. At fixed Floer-tail attachments use the selected J_t families, grouping all equal-t attachments even at different s values; use the free core directions to obtain the required transversality to those fixed families. At free nonpole attachments construct the actual grouped J_z sphere/evaluation problems with only their allowed variations. Prove the matching and collision laws with the prescribed pole/end restrictions. Thus plane selection, its node matching and its sphere-incidence outputs are actual theorems before inverse-family faces are formed.

*Needs:* 7.C.2b(i)–(vi).

### 7.C.2c Periodic tame data and the compatible-model comparison

For a smooth periodic ω-tame J_t on closed X, construct the same capped raw equation and section with the same nondegenerate contractible Hamiltonian ends. Put g_J^sym(v,w)=(ω(v,Jw)+ω(w,Jv))/2 and prove it is a positive symmetric metric. On each specified compact tame-data parameter family prove uniform positive coercivity and coefficient bounds. The equation gives u_t−X_H=J_tu_s, hence E=∫ω(u_s,J_tu_s)=A_H(x̃₊)−A_H(x̃₋), with its continuation/K-curvature versions. The action variation is dA_H(ξ)=∫ω(ξ,γ̇−X_H); construct its actual weak-gradient expression using g_J^sym, distinguishing it from −J_t(γ̇−X_H) for merely tame J_t.

Build the tame Sobolev section/evaluation charts, local/removal estimates and elliptic/end Fredholm theory from HeegaardFloer F0/F1/F2 on actual compact uniformly tame coefficient windows. In the asymptotic linear theory identify the action Hessian and the actual positive-symmetric-part mobility; prove the spectral-gap/exponential-end estimate and its uniform compact-family version from nondegenerate Hamiltonian ends. Do not assert self-adjointness for a nonsymmetric pairing. Transport the Fredholm index and determinant line by the fixed-end tame-to-compatible operator homotopy, and apply the supplied self-adjoint spectral-flow comparison only at the compatible realization. Prove cap, puncture-index and orientation transport on that actual homotopy.

**Tame synthesis and staged selection.** Use general anti-J directions A, AJ_base+J_baseA=0, and J(A)=exp(A)J_base exp(−A) on a quantified small C⁰ ball. Prove that these give local tame charts and uniform positive tameness bounds; A is not required to be symplectic. In the actual mixed coefficient/linear-operator norms of 7.C.2b(i), use D exp_A(B)=∫₀¹exp((1−t)A)B exp(tA)dt, its iterated derivatives and Sobolev multiplication/trace/composition to prove every finite mixed parameter/domain/target chain-rule and Moser bound. Record the actual lists, constants and section/evaluation/projection C^ℓ budget before applying F0. The testing-series and global curvature estimates are instantiated in these tame norms, independently of compatible selection/counts.

Construct tame raw cylinder/continuation/plane/comparison sections, AnalyticStableMaps-based unforced tree convergence and the attached inhomogeneous compactifications and conditional gluing with uniform tame coefficients. Prove grouped conditional evaluation in the actual tame tangent space and actual-stratum proper-window openness/density/smoothing before each selection. First select regular ends with all shared t-parametrized sphere/evaluation data, including equal-t groups and stationary incidences. Independently select J₀ with its actual Morse/critical-point sphere incidences. With selected ends fixed select individual continuations; with ends and J₀ fixed select basic planes and node/sphere incidences. For homotopies and inverse/composition families insert the previously selected geometric pieces as actual regular true faces, construct their corner restrictions and select relative interiors with all parameter dimensions included. The independent pole choice is not a premise of pure cylinders or individual continuation. Conditional gluing supplies face-flat weights and per-energy collars before branch exclusion and fixed-class boundaries. Geometric support precedes each matrix and its equations. Full tame-to-compatible module comparison occurs only after both lanes' supported complexes exist.

**Tame raw sign realization.** Before tame counts, instantiate the complete formal system of 7.C.2a on the actual tame operators, with the same ordered input kernels, both pole targets, stable Morse complex, γ_min and q_min, matching exact sequences, cap/frame/recapping and parameter/flow order. Transport the complex-minimum and each finite-index reference by the fixed-end tame-to-compatible Fredholm OPERATOR homotopy of 7.C.2c; this construction has no chain-comparison or compatible-count premise. Prove its determinant homotopy, stabilization and gluing-reference diagrams. Pure tame cylinder parameter boundaries consume the universal readout (−1)^(i+j+ij) and quotient/negative-flow order without Morse/PSS data. Tame PSS parameter and endpoint boundaries additionally consume the actual raw cap/Morse calibration: j=1 gives −1, the inverse-family readout is (−1)^(n+1), the stationary cap and functional readout give (−1)^n before the fixed family factor, and the Morse zero-face exponent k+(k−n)+n is even. Prove agreement of these raw references with the actual tame regular-gluing boundaries before support/matrix equations.

Consume HeegaardFloer F2.1’s tame/compatible contraction fixing a compatible structure and relative smooth-family extension, and F2.6d’s corresponding localized single-sphere range and smooth selection floors. Apply them to the actual periodic/continuation/PSS end/pole/true-face data with the declared uniform tame budgets. Arbitrary periodic tame data retain their raw equation, energy, conditional local compactness and Fredholm interfaces; counts require selected regular data in the preceding tame construction. After both tame and compatible supported module complexes and continuation maps exist, select regular tame-to-compatible continuation and relative homotopy/composition data with their prescribed tails, true faces and K-curvature allowances. Prove the comparison’s own energy-cutoff compactness, exclusion, gluing, coefficient support and determinant diagrams; use its supported matrices and oriented boundaries to obtain the filtered chain-homotopy equivalence and cap-change naturality in each coefficient lane. This is a module comparison, with no quantum-operation construction or generic index/flow duplication.

*Needs:* 7.C.2 and 7.C.2b; HeegaardFloer F0–F2 (F1.3 spectral flow, F2.1 tame-to-compatible contraction, F2.6d).

### 7.C.3 Raw compactness, conditional gluing and analytic branch exclusion

Consume AnalyticStableMaps M3's full marked unforced stable-map compactness at genus 0, with its compact smooth tame-J family and integral splitting hypotheses. Construct the rooted attachment/equal-parameter matching application for the declared raw inhomogeneous cylinder, continuation and PSS sections with uniform K-curvature/end bounds: finite-cutoff convergence to broken cores and sphere trees, removal, no-neck/end convergence, integral class splitting, topology and Hausdorffness. Each bubble subtree has its attachment's frozen J; separate roots retain their actual shared-structure partition and matching evaluations. Normalize/contract unstable constant raw components, in particular the two-marked zero-cutoff core, rather than identify them with a stable two-marked moduli space. At supplied regular broken configurations construct the actual conditional gluing, surjective matching, determinant and onto-neighborhood theorem, with inverse/derivative/cutoff/error bounds on each finite-energy window. These estimates supply weights/collars before relative-family selection. Contractible-sector persistence and the finite nondegenerate end theorem of 7.C.1 are explicit inputs in both coefficient lanes. HeegaardFloer local removal/factorization/index estimates are consumed with their actual scope; its minimal-area single-component compactness is not a replacement for AnalyticStableMaps' full marked supplier.

Keep the branch hypothesis records separate from their analytic consequences: positive spherical monotonicity is the equality ω=κc₁ with κ>0 on S_sph; spherical-c₁-zero is c₁|S_sph=0 with no sphere-area vanishing. Actual bubble exclusion additionally consumes the raw sections/compactness, common universal parameter spaces, compatible-J curve floors and marked/core incidence, as well as the cap quotient.

**Separate finite counting budgets.** For pure cylinders, individual continuation, cylinder homotopy and composition, use the finite contractible Hamiltonian ends of 7.C.1, their reference cap actions/degrees, the declared finite parameter/count dimensions and actual global K-curvature allowance. In positive monotonicity the cap/index equation bounds the relevant spherical Chern numbers and hence energy at that fixed counting budget. Prove the resulting cylinder/continuation energy ceiling and per-budget collar bounds without a Morse datum. For PSS, the nodal correspondence and the two inverse families, additionally supply the independent finite Morse critical set, its indices/actions and the actual finite Morse-segment/end data; derive their own cap/index/energy ceiling and endpoint collar bounds. Morse finiteness is a premise only of this second budget. In spherical c₁-zero, neither index equation bounds sphere energy; use a declared finite energy cutoff in each lane and retain the resulting cutoff-dependent collars.

For cylinders construct and select one shared countable universal parameter problem for regular cylinders, sphere tuples, their marks, attachment times and matching evaluations, using the cylinder FHS range and the conditional two-/multi-map sphere theorem of 7.C.2b. Keep the actual t-parametrized evaluation families, not only regularity at a single t. At each common t use one shared-J tuple problem; repeated classes and distinct reduced images are included. Include the stationary cylinder through its invertible end operator and the required joint sphere incidence. Complete the finite-C^ℓ budgets, bounded-piece openness, smoothing and countable smooth selection for these strata. Fix the resulting regular end/tail data before selecting actual individual continuation or plane data. Their frozen end/tail restrictions reuse this same selected sphere/evaluation theorem; this step has no premise from the independent J₀ pole selection.

In the positive-monotone branch, prove the stationary Chern-one attachment exclusion at total index 2 by its joint orbit/sphere evaluation theorem and actual parameter dimension. Combine this with the positive-area Chern lower bound for nonstationary cores.

In the c₁-zero branch the simple-sphere evaluation with its mark/time has codimension 4 in X×S¹, and an index-k nonstationary quotient with attachment has dimension k+1, giving k−3; the stationary incidence has dimension−3. Prove the joint transversality, simple-image/cover reductions and absence of these strata at k≤2.

For individual continuation and relative parameter families construct their own simple-sphere and marked-incidence section problems frozen at the actual attachment structures J_(s,t) and J_(p,s,t). Include core, marked sphere and matching equations with shared variations, class tuples with repetition and pairwise-distinct simple-image chains, constant-core cases, simple-image/cover reductions and the actual total parameter dimensions. The selected individual continuation problem supplies its J_(s,t) output; relative families supply their J_(p,s,t) theorem through their own face-flat carrier and already-selected true-face incidence data. Joint selection and those face compatibility laws precede the corresponding branch exclusions and signed boundaries. PSS uses its already-constructed J₀ pole strata and actual frozen J_z problems. These are the distinct parameter/PSS incidence and exclusion constructions. On every fixed end/tail restriction the earlier selected J_t sphere/evaluation families supply regularity, with equal-t attachments grouped regardless of s. Only free core structures vary in these later problems. Actual relative selection uses this fixed end output and previously regular true-face incidence data before proving its branch exclusion.

*Needs:* AnalyticStableMaps M3; 7.C.1; 7.C.2; 7.C.2b; Salamon §3.1.

### 7.C.3a Zero-cutoff fibre and all-tree exclusion

Define the endpoint of both coefficient branches' Morse-side PSS inverse identity as the complete two-marked sphere with its two ordered Morse attachments, or equivalently the same two removable cylindrical poles. Require finite energy and prove removal at them. Match the two evaluations to the outgoing and incoming Morse rays, without adding further incidence marks.

Use the single J₀ and its sphere/Morse/one-marked strata already selected independently in 7.C.2b. The basic plane data have subsequently been chosen transverse to those fixed strata, using their own face-free Hamiltonian carrier. Substitute these selected pieces into the true zero-cutoff and broken-face templates here and in 7.C.3c. Keep the class-tuples with repetition, pairwise-distinct simple images, fixed auxiliary Morse pair and closed broken stable/unstable loci. The one-marked regularity theorem is common to both branches; only its spherical-c₁-zero critical-point avoidance consequence is used below. This keeps the common sphere selection before the basic plane selection.

Write `A_end` for the total spherical class at this endpoint, `B_rec=−A_end` for the output recap, and `A_simple` for the class of a simple image through which a nonconstant component factors with degree `d≥1`; thus `A_end=d A_simple` for a single covered component. The rigid degree-zero equation is `ind_f(q)−ind_f(p)=2c₁(A_end)`. These are sphere classes; the cylinder class `A_cyl` and its matched-cap case `A_cyl=0` are treated in 7.C.2. Prove finite stabilizers and the two-marked incidence theorem on the nonconstant locus; the residual `ℂ*` quotient is used only there. A constant two-marked sphere is unstable and has infinite `ℂ*` automorphisms. Treat its constant core by contracting the unstable component and using the two Morse constraints at `p=q`: on the sphere, `∂̄` has kernel `TX` and zero cokernel, while transverse `Wᵘ(p)∩Wˢ(p)` cuts the value to the isolated index-zero diagonal term. Derive the determinant-line gluing and Morse orientation identification that makes this term exactly the identity on `M`; use the cap/stationary calibration of 7.C.2a.

Treat all sphere-tree strata: ghosts, critical values, multiple covers and repeated/shared simple images. For distinct external marked values, reduce the finite image-incidence graph to a chain of pairwise-distinct simple images joining them. Contract repeated-image vertices only in that graph, remove excursions and shorten a retained image with identical entry and exit values until every retained image has two distinct incident values. Prove preservation of the connecting incidence. For coincident external values use the common-value incidence on the closed broken Morse loci. A critical-point incidence reaching a nonconstant component through ghosts is a one-marked simple-image incidence; apply avoidance to it only in the spherical-c₁-zero branch. The single J₀ theorem above covers the entire reduced-image problem.

Index every nonconstant component of the full tree by v, with simple-image class A_v and covering multiplicity d_v≥1; include off-chain components and repeated images in A_end=Σ_v d_v A_v. Ghosts have class zero. Separately let B_j, 1≤j≤r, be the classes of the distinct simple images retained on the reduced chain. Then Σ_j c₁(B_j)≤c₁(A_end) in the positive-monotone case because each retained image is represented among the full-tree components and all nonconstant components have positive Chern number; in the spherical-c₁-zero branch both sides vanish. The joint unparametrized dimension is

Σ_j(2n+2c₁(B_j)−6)+4r−2n(r−1)−(2n−ind_f(p)+ind_f(q))

=2(Σ_j c₁(B_j)−c₁(A_end))−2r≤−2r.

Prove emptiness using the shared-J incidence theorem, the full-tree class accounting and compactness. For coincident external values use `cl Wᵘ(p)∩cl Wˢ(q)`: it is empty when ind p<ind q, since a broken negative-gradient trajectory decreases Morse index. Positive monotonicity with nonzero total sphere class gives this strict inequality by the degree equation. In the spherical-c₁-zero branch equal indices force p=q; a nonconstant tree through the common value then contains a simple image through that critical point, whose one-marked incidence has dimension −4. Prove its absence with covers, ghosts and repeated images included, and with the additional dimensions of the finite parameter problems under consideration. Monotone spheres may pass through critical points; their excluded endpoint configurations are ruled out by the compactified Morse incidence and index argument instead.

**Regular true endpoint and energy-dependent neighborhood.** Prove regularity and identity orientation of the actual R=0 fibre from the constant-core model and branch-specific all-tree exclusion. At each finite energy/index/parameter budget use raw compactness and quantitative conditional gluing to find ε(E)>0 so the actual face-flat family near R=0 has precisely the glued identity-end configurations, with its error/inverse/derivative estimates. This PSS endpoint uses the PSS budget above, including the finite Morse critical set from 7.C.1a and finite contractible ends. Positive monotonicity gives a bounded-energy collar for its fixed counting budget; c₁-zero retains ε(E) separately. Pure cylinder/continuation collars use their own Morse-free budget instead.

*Needs:* 7.C.2b(vi); 7.C.3; 7.C.1a; 7.C.2a.

### 7.C.3b Floer inverse through one nodal correspondence

With the selected basic PSS data construct the degree-zero geometric correspondence 𝒩 from the pair of planes with equal pole evaluations at L=0. Construct its matching fibre product, compactification, coherent determinant orientation and rigid coefficients at fixed cap/class. The oriented one-dimensional boundary is the finite geometric end-breaking formula, using the actual cylinder breaking/gluing/bubble-exclusion theorem and plane matching. Prove geometric finite-below support before assembling its matrix. In each branch the resulting supported matrix is a chain map by that boundary formula after the cylinder differential exists. Retain the same cap classes and normalized 𝒩 readout in both families below.

First join the two pole evaluations by a negative-gradient segment of length L≥0. Its L→∞ boundary is the broken PSS/Morse composition and its L=0 boundary is 𝒩. Second, use the common J₀/K=0 pole discs and frames to smooth the nodal pair by `z₊z₋=τ≥0`. On the two punctured local discs put `z₊=exp(2π(s₊+it₊))` and `z₋=exp(−2π(s₋+it₋))`; positive τ implies t₊=t₋ modulo 1. Construct the positive-ray smoothing family and its deformation to the s-independent continuation identity. All ends use Hdt and the fixed markers; coordinate changes have specified comparison, face/cocycle and determinant laws. At each finite energy prove the actual gluing neighborhoods for both sides using their own analytic bubble exclusion, cylinder breaking/gluing, Morse gluing and stationary inverse.

Orient the Morse-length interval by increasing L and the smoothing/identity interval by decreasing τ, with the nodal end as its positive boundary. Use the full standard kernel/functionals/coevaluations and fixed family readouts of 7.C.2a. At L→∞ use the actual first-projection Morse graph χ_M and its stable-complex comparison, retaining both pole normal factors. At L=0 and τ=0 use the identical positive-first matching `ev₊−ev₋`; both yield the same normalized 𝒩, including cap classes. The stationary reference comparison consumes the separately proved inverse for the identical nondegenerate stationary cylinder of 7.C.2; the Morse-side two-marked sphere endpoint is a different input. At the stationary end use γ_min and the specified family factor, giving Id_CF. Prove these simultaneous raw determinant identifications from their stabilized exact sequences, then their agreement with actual regular gluing. At fixed total cap/class and finite energy the resulting geometric Hom boundary readouts have the forms `d𝓗_L+𝓗_Ld=F∘G−𝒩` and `d𝓗_τ+𝓗_τd=𝒩−Id_CF`, with degree-one raw count-functional readout `(-1)^(n+1)`. Their geometric nodal terms cancel. After support and matrices exist, these are the corresponding module equations and their sum is the Floer inverse homotopy. Resolve every matrix product by the finite-below convolution before making that algebraic interpretation. The Morse inverse separately uses its two-pole zero core and q_min broken-face insertion. Every family uses the fixed convention before counting.

The true endpoint data and finite-energy gluing estimates are inputs to relative-family regularity and each branch’s PSS geometric inverse boundaries. Cylinder fixed-class boundaries, ordinary continuation data and the Γ=0 reflection bridge use only their own cylinder/continuation constructions. The geometric inverse boundaries feed PSS support, then its matrices, and then the R[Γ] or completed inverse equations in 7.C.6; they are not already equations between undefined matrix series.

*Needs:* 7.C.3a; 7.C.2a; 7.C.2; Piunikhin–Salamon–Schwarz §4.

### 7.C.3c Face-flat relative perturbations

For each branch construct the selected regular individual continuation sections, their rigid geometric count coefficients, zero-/one-dimensional oriented compactifications and finite-below support from their own Morse-free cylinder/continuation data. Assemble their actual maps and chain-map equations only in the matrix stage. Construct homotopy/composition true faces from these selected geometric pieces, raw cylinder comparison templates, cylinder breaking/gluing, stationary identity and that branch’s analytic exclusion; no algebraic composition equation is needed to specify a broken face. PSS relative faces separately insert their selected plane/Morse pieces and endpoint theorems. Prove each prescribed true-face operator and matching problem regular. Compatible raw jets extend to a base family in the actual product-collar and compatible-J charts before generic face-flat interior selection.

Construct the relative separable complete real Banach carrier using smooth local Hamiltonian one-form/δH_s and compatible-J chart directions in free domain/target/interior parameter charts. Each testing element vanishes on its own neighborhood of the true faces and the fixed pole/end regions; their supports together meet every free interior parameter arbitrarily close to the faces. Retain all face-free mixed coefficient derivative suprema, weighted L^q norms, linear operator controls, exhaustion seminorms and global integrated curvature controls above. Conditional gluing gives positive locally bounded functions G_(E,j)≥1 on specified larger collars `0<x<2x₀(E)`, and on larger product collars `0<x_i<2x₀,i(E)` at corners. Take their weighted suprema on the closed outer subcollars `0<x≤x₀(E)` and `0<x_i≤x₀,i(E)`: `sup G_(E,j)(x)(∏_i x_i^(−m))|∇^j e|`, with the declared domain/target/parameter charts and derivatives. Specify a smooth cutoff ϑ valued in [0,1], equal to 1 on this closed outer subcollar and supported in the larger collar with x_i<3x₀,i/2. Define the global extension Ĝ=1+ϑ(G−1) there and Ĝ=1 off that support. Include the corresponding global weighted norms using the declared chart cutoffs and the ordinary face-distance weights; use a locally finite fixed chart system and its stated norm comparison constants. Thus the global norm is defined everywhere, and its weights are positive and locally bounded away from true faces. A compact-library support away from true faces meets each closed outer subcollar in a compact subset of its larger open collar, so all these weighted norms are finite. Use coefficient suprema/Fatou and dense tests for linear operators to prove their lower semicontinuity. The same ℓ¹ synthesis and closed-kernel quotient give the complete separable smooth carrier, convergence in every controlled norm, all-order face flatness and compatible corner jets. Derive its finite-C^ℓ nonlinear section/evaluation estimates by the stated chain-rule/Sobolev–Moser theorem. Small balls preserve the global curvature and energy allowances. Its G weights come from the earlier conditional gluing estimates.

At every interior parameter the localized δK or δH_s directions detect adjoint cokernels, including constant maps and matching constraints. Form the actual J_(p,s,t) simple-sphere/marked-incidence families frozen at each attachment, and the PSS J_(p,z) versions, with shared core/sphere/evaluation variations and prescribed true-face strata. Prove their combined universal transversality, simple-image reductions, finite differentiability budgets and countable simultaneous selection; with their own shared-J theorem. At true faces use their previously selected regular operators and sphere-incidence data. Perturbations have all-order flat jets on true faces. From these weighted errors and conditional gluing construct a cutoff width ε(E)>0 at R=0, a Floer-neck threshold T(E), and a Morse-length threshold L(E), in their respective declared charts, below every inverse/contraction/onto-neighborhood error tolerance and within every required derivative budget. Counts/boundaries are coefficientwise at finite energy. Positive monotonicity supplies the separately proved cylinder/continuation or PSS finite counting-budget ceiling, with Morse data used only by the latter; spherical-c₁-zero keeps cutoff dependence.

Now prove the branch-specific regular compact zero-dimensional and oriented one-dimensional boundary theorems. The cylinder theorem has index 1 rigid quotients and index 2 broken boundaries, removing trivial levels by their actual equivalence.

Per branch, continuation/homotopy, PSS and inverse-endpoint geometric boundaries consume cylinder breaking/gluing, their own analytic exclusion, actual regular true faces and finite-energy neighborhoods, shared orientations, Morse factors and stationary identity exactly where used. Prove the cylinder fixed-class boundary theorem before parameter/PSS boundaries and geometric rigid support. After the relevant support theorem constructs the matrices, these same oriented boundaries give their chain-map, square-zero, composition and inverse equations. The two branches share earlier floors but retain independent analytic consequences and concrete exports. Compactifications here have precisely the dimensions needed for these classical counts and identities.

*Needs:* 7.C.3a–b; 7.C.2b; Salamon §3.3.

### 7.C.4 Coherent counts and continuation

Work first over 𝔽₂, then use the shared cap/determinant/Morse orientation lines of 7.C.2a for integer counts and outward-first broken boundaries. Use its quotient-then-negative-flow ordering and explicit parameter/end-reversal laws; convert a translation-first auxiliary formula by the specified (−1)^(dim quotient) factor. Extend counts by actual scalar maps to each commutative ground ring R. Orientation generators give matrices and their changes give explicit diagonal sign maps.

For each fixed generator pair and recapping class define the rigid index-one quotient count coefficient with the ordered orientation lines. First prove its geometric finite-below support in 7.C.6 and assemble the degree−1 matrix d over that branch’s ring. The signed index-two fixed-class boundary then gives d²=0, with sums interpreted through the proved support/convolution theorem. For previously selected individual continuation data retain the energy formula
`E=A_(H₊)(x̃₊)−A_(H₋)(x̃₋)−∫∂sH(s,t,u)`,
count the compact rigid index-zero sections on their parametrized domain at each cap/class, prove their own support and assemble the degree-zero continuation matrix after the differential’s coefficient module exists. Constant data give the stationary identity through its actual inverse/orientation comparison. Homotopy/composition true-face selection uses those earlier geometric sections; its fixed-class boundary theorem and support construct the degree-one homotopy matrices. Only after all participating matrices exist prove chain-map, composition, independence and inverse equations in the branch ring. Derive actual Hofer cutoff shifts, cap equivariance and support bounds from the raw energy and count geometry; no completed identity is a support premise.

*Needs:* 7.C.2a; 7.C.3c; the support theorems of 7.C.6; Salamon §3.4.

### 7.C.5 Small autonomous trajectories and the later Morse specialization

For sufficiently C²-small autonomous Morse H construct compatible J with `(H,g_J)` Morse–Smale by a localized positive-gradient realization. Prove all one-periodic orbits are constant and compute μ=`ind(H)−n` using the cap frame. For an actual t-independent Morse trajectory prove its Floer linearization is surjective: in a t-independent trivialization the zero Fourier mode is the Morse operator, while nonzero modes have the `2π` gap and the proved small-coefficient perturbation estimate. Include its right inverse and determinant orientation comparison. This proves regularity of the t-independent trajectory locus.
Use the independent auxiliary pair `(f,g)` and comparison complex M of 7.C.1a. For H=εf with ε>0 sufficiently small prove the positive-rescaling normalization and compatible Morse–Smale realization. Construct the bijection between t-independent Floer cylinders and upward trajectories of the realized Morse metric, using τ=εs, with the induced cap classes, quotient translations and the determinant orientations fixed in 7.C.2a; prove the ordinary Morse-continuation comparison between the realized metric and the auxiliary metric, using HeegaardFloer Lane M1–M5, with its signs. The comparison concerns this t-independent trajectory locus. The PSS homology comparison is a separate construction with its own branch prerequisites.

*Needs:* 7.C.1a; 7.C.2; HeegaardFloer Lane M; Salamon §3.5.

### 7.C.5a Autonomous translation and time-rotation dimensions

On smooth finite-energy cylinders for these autonomous data with the fixed constant asymptotic ends and fixed capped relative class, define commuting actions `T_a u(s,t)=u(s+a,t)` for `a∈R` and `R_θu(s,t)=u(s,t+θ)` for `θ∈R/Z`. They preserve the equation; their isotopies preserve the capped class relative to the constant end caps. Prove smoothness on the actual finite-dimensional regular moduli spaces after elliptic bootstrapping. The fixed locus of the whole `S¹` time-rotation action is exactly `u_t=0`; its Floer equation is the specified positive-gradient Morse equation, so its elements are the upward Morse trajectories already treated above.

For a non-time-invariant cylinder, `u_s` and `u_t` are linearly independent as global tangent vectors. If `a u_s+b u_t=0` with constants `(a,b)≠(0,0)`, `a=0` gives time invariance, while `b=0` makes the map independent of `s` and hence constant by its asymptotic ends. If both are nonzero, `u` is constant along the domain flow in direction `(a,b)`; iterating toward a constant asymptotic end and using uniform convergence in `t` forces the whole cylinder to be constant. If a stabilizer element has nonzero `s`-translation, iterate it in the direction of one constant asymptotic end. The end convergence is uniform in `t`, so the stabilizer equation forces the entire cylinder to equal that constant end; this excludes every such element without assuming an `s`-period. Thus on the non-time-invariant locus the `R×S¹` orbit has dimension two and its remaining time-rotation stabilizer is finite. Conditional on surjectivity of the actual autonomous linearization, a non-time-invariant cylinder has Fredholm index at least two; regular index-one cylinders are time-independent. The dimension conclusion is conditional on that actual regularity. The homology comparison is the separate PSS theorem.

*Needs:* 7.C.5.

### 7.C.5b PSS maps and equivalence

Construct the PSS/inverse matrices from the regular basic punctured sections and their branch-specific energy/support bounds. The Morse-side inverse uses its broken PSS composition and the true zero-cutoff Morse identity end, with the full ordered Morse/cap calibration of 7.C.2a and its explicitly constructed equation d𝓗_M+𝓗_Md=PSS⁻¹∘PSS−Id_M. The Floer-side inverse uses the same nodal chain map 𝒩 in the finite-Morse-length and positive-smoothing-ray homotopies; their signed nodal boundaries cancel, leaving the stationary Floer identity. Face-flat relative regularity, the finite-energy neighborhoods and signed boundary theorems give both coefficientwise homotopy equations. Obtain the branch-specific chain-homotopy equivalence: integer-graded at the finite Laurent stage, complete ν-filtered and ℤ/(2N_C)-graded after nonzero-monotone completion, and integer-graded in the c₁-zero and Γ=0 lanes. The specified output is the module chain-homotopy equivalence.

In the spherical-c₁-zero completed lane, the integer-graded homology comparison is HF_i≅H_(i+n)(X;Λ_R). Over a field 𝕜 it identifies with H_(i+n)(X;𝕜)⊗_𝕜Λ_𝕜; over other R such a tensor description requires a proved homology base-change hypothesis. Use the actual base-changed chain homotopies for their equations.

In the nonzero positive-monotone Laurent lane, write HF_i^cyc for homology after t↦1 and prove HF_i^cyc≅⊕_(j≡i+n mod 2N_C)H_j(X;R). On Γ=0 choose the spherical-c₁-zero PSS construction of this item as the single common MODULE-comparison construction for HF_i≅H_(i+n)(X;R). Its phase inputs are the independent auxiliary Morse comparison, actual raw cylinder/plane/nodal/inverse operators, finite end/Morse data, selected regular true faces/interiors, branch compactness, simultaneous determinant realization, geometric support and both inverse boundaries. None is obtained from standing Layer 7.4's comparison readout. First construct that equivalence and common continuation/PSS data, then compare the Γ=0 finite-Laurent readout and the standing reflected complex through the actual equation/cap/reference/degree/determinant dictionary of 7.C.0, quotient-then-negative-flow orientation reversal and coefficient identity Γ=0. Prove the chain and continuation diagrams, including their actual degree sign, before the two displayed homology readouts. The integer formula has no premise from two separately assumed equivalences. Standing all-dimensional corner-chain, all-free-loop atoroidal and Liouville outputs retain their distinct construction hypotheses and scope.

*Needs:* 7.C.3a–c; 7.C.4; 7.C.6; Layer 7 item 4 (the standing comparison on the overlap); Piunikhin–Salamon–Schwarz §4.

### 7.C.6 Geometric support, finite Laurent and completed matrices

Apply MorseNovikov N1 with ν=−ω:Γ→ℝ only after the geometric support hypotheses are proved. For output recapping B the matched-cap energy is `E=A_H(x̃₊)−A_H(x̃₋)+ν(B)`; continuation, PSS, nodal and homotopy versions retain their actual global error bounds. At a fixed ν cutoff use their own energy-cutoff compactness and rigid-dimensional exclusion of nontrivial breaking/bubbling/parameter-boundary limits to prove finitely many rigid coefficients below that cutoff, including dense period image. These inputs are the geometric sections, fixed-class oriented boundaries where needed and cap/index data, not completed chain equations. First prove cylinder/individual-continuation/relative-cylinder support; separately prove PSS/nodal/both-inverse-homotopy support with their own endpoint/Morse/parameter data. Construct the actual finite-orbit modules, reference-cap coordinates and diagonal monomial changes. Build the differential and all participating maps/homotopies as supported matrices in their concrete ring, then read the finite geometric boundary identities as matrix equations using N1’s finite-below convolution. Aggregate support is an export of the independent concrete support results.

*Needs:* MorseNovikov N1; 7.C.1(i); 7.C.3–7.C.4; Salamon §3.7; Hofer–Salamon §4.

### 7.C.6a Positive-monotone bare coefficient model

Before matrices specialize the early datum: ω=κc₁ implies kerω∩kerc₁=kerc₁, so c₁ identifies Γ with N_Cℤ, or Γ=0. Give e^B degree 2c₁(B). This algebra uses cap/branch data alone and is available to fixed-class geometry without any completed count package.

**Positive-monotone finite Laurent matrices.** Use the respective geometric support to construct cylinder/continuation matrices and, separately, PSS/inverse matrices over R[Γ]. A homogeneous entry has at most one exponent by the degree equation. For Γ≠0 choose the positive-Chern generator t, deg t=2N_C and ν(t)=−κN_C<0, so t⁻¹ has positive valuation. The coefficient differential is zero and a Morse tensor generator has degree j−n+2c₁(B). Construct each finite homogeneous matrix before reading its own boundary identities or extending coefficients.

*Needs:* 7.C.1(i).

### 7.C.6b Finite-Laurent chain identities

Prove `d²`, continuation chain-map/composition/homotopy equations and their orientation-line signs over `R[Γ]`, using the monotone cylinder/count and parameter-boundary targets. This proof is the finite-Laurent monotone construction.

*Needs:* 7.C.6 and 7.C.6a; 7.C.4.

### 7.C.6c Finite-Laurent PSS equivalence

With the actual injective-Chern Γ model and monotone matrices/support, prove PSS and inverse matrices are chain maps. Prove the Morse-side inverse from its broken composition and zero-cutoff Morse identity end; prove the Floer-side inverse from its broken composition and its separately constructed nodal/positive-ray/stationary identity end. Each consumes its own monotone endpoint/parameter boundaries together with monotone cylinder identities. Use the two constructed finite-Laurent homotopies for the inverse equations. This gives the chain-homotopy equivalence to M⊗_R R[Γ] before completion.

*Needs:* 7.C.6b; 7.C.5b.

### 7.C.6d Complete filtered cyclic grading after monotone completion

After 7.C.6b–c, extend the finite matrices and specified homotopies along R[Γ]→Λ_R=Nov(R,Γ,ν), ν=−ω, using N1. For Γ≠0 set d_C=2N_C. Give Λ_R degree zero modulo d_C and each finite reference orbit/Morse generator its μ or j−n residue. The completed module is finite free over Λ_R with these residues. Define F^aΛ_R by support in ν≥a, give the finite generator module its product filtration and prove it complete and separated. A map T has its proved finite shift δ_T, meaning T(F^a)⊂F^(a−δ_T); the differential and specified homotopies carry their own such shifts. Cap changes give diagonal monomial maps with their actual finite shifts. A series may have infinitely many integer degrees; this completed theory is ℤ/d_C-graded. Differential, maps and specified homotopies are continuous with the proved filtration shifts and residue degrees −1,0,+1. Prove completeness, cap-change compatibility and continuity from the finite matrices/support bounds. Extend the finite-Laurent equivalence and both actual homotopies to a complete ν-filtered ℤ/d_C-graded Λ_R-module chain-homotopy equivalence with correspondingly regraded M⊗_RΛ_R. Γ=0 retains integer grading and R coefficients. The integer finite-Laurent theory and its cyclic t↦1 specialization remain separate outputs; no t↦1 map on Λ_R is asserted.

*Needs:* 7.C.6b–c; MorseNovikov N1.

### 7.C.6e Spherical-c₁-zero bare model and completion

Before counts, c₁|S_sph=0 gives kerω∩kerc₁=kerω, so ν=−ω identifies Γ with its real period subgroup; all coefficient degrees are zero. This is an early datum, not a matrix theorem. Use cylinder/continuation support to construct their completed matrices and only then read their own finite-cutoff boundaries as d²/continuation equations. Independently construct the PSS/inverse matrices from their support and derive their equations from the c₁-zero PSS boundaries and BOTH endpoints. Finitely many orbit generators give the usual integer grading with a finite underlying degree set. This separate completed lane includes positive sphere areas; index alone supplies no energy bound.

*Needs:* 7.C.1(i); 7.C.6.

### 7.C.6f Laurent cyclic specialization and the completed-unit obstruction

On the finite ring `R[t,t⁻¹]`, the ungraded map `t↦1` gives the finite cyclic complex and PSS comparison graded modulo `2N_C`; retain the integer grading when `Γ=0`. For any nonzero unital `R` and `ν(B)>0`, N1 makes `1−e^B` a unit, so a unital map from the entire completion to `R` sending every monomial to 1 cannot exist. The cyclic specialization is consequently defined on the finite Laurent ring.

*Needs:* 7.C.6d; MorseNovikov N1.

### 7.C.6g Field adapter and Arnold bound

Assume every contractible one-periodic orbit of H is nondegenerate. For a field 𝕜 and injective ν, factor a nonzero series at its unique least-period element B₀ as `c e^(B₀)(1+b)` and invert the strictly-positive-support `1+b` by N1, including dense period image. This field adapter applies only where ν:Γ→ℝ is proved injective; Γ=0 gives 𝕜. For the positive-monotone Arnold bound use the finite-Laurent PSS equivalence, followed by the permitted `t↦1` specialization: the resulting cyclic 𝕜-chain complex has rank equal to the number of contractible periodic orbits, and its homology is the cyclic direct sum of H_j(X;𝕜), with total dimension the total 𝕜-Betti rank. The finite-dimensional chain-rank inequality gives `#{contractible 1-periodic orbits}≥Σ_j dim_𝕜 H_j(X;𝕜)`. For spherical-c₁-zero use the actual Novikov field adapter and completed PSS equivalence, which has that finite homology rank; Γ=0 is the ordinary 𝕜 case. The monotone comparison uses its Laurent-only specialization and the c₁-zero comparison uses its field adapter. Over arbitrary rings retain `H_(i+n)(X;Λ_R)` separately and require a proved base-change hypothesis for any tensor-product homology description.

*Needs:* 7.C.6c–f; MorseNovikov N1; 7.C.1 (finiteness of the nondegenerate contractible orbits).

### 7.C.6h Arbitrary critical number and the degenerate comparison statement

Consume MorseTheory M4's single `c(M)` construction: the attained minimum of the finite critical-point counts of all smooth real functions on a compact boundaryless manifold, with infinite critical sets counted in ℕ∞. It is not the minimum restricted to Morse functions. That owner also constructs the arbitrary-function LS lower bound from the AlgebraicTopology categorical-cover/cup-length supplier, without a Morse approximation of the function being bounded.

For any closed finite-dimensional symplectic M, define `degenerateArnoldCriticalNumberStatement` to assert that every smooth Hamiltonian isotopy from the identity to φ satisfies `((c(M):ℕ):ℕ∞)≤(Fix(φ)).encard`, where fixed points count once. Retain this as the precise source conjecture/comparison statement, separate from the nondegenerate theorem of 7.C.6g; no general theorem or present research-status conclusion is asserted here. Any theorem realization requires its actual additional scope and proof, not nondegenerate perturbation followed by a fixed-point count limit.

Construct the autonomous case independently of Floer counts. For smooth time-independent H on closed M, `dH=ι_(X_H)ω` and nondegeneracy give `dH(p)=0 iff X_H(p)=0`. ODE uniqueness makes the orbit through such p constant, so `Crit(H)⊆Fix(φ_H^1)`. If Crit(H) is finite, M4's minimum gives `c(M)≤#Crit(H)≤#Fix(φ_H^1)`; if it is infinite, the inclusion makes the fixed-point count∞. This proves the stated autonomous lower bound, including empty, disconnected and zero-dimensional cases through M4's own conventions. Conversely, time-one fixed points need not be equilibrium points. The general time-dependent comparison retains all source scope but is not inferred from this autonomous argument, LS alone, or the earlier Betti-rank estimate.

*Needs:* MorseTheory M4; AlgebraicTopology (the categorical-cover and cup-length supplier of MorseTheory M4); HamiltonianSystems Layer 1; Layer 6 item 1.

### 7.C.7 Scope and application interfaces

Export the cap/seam/index dictionaries, rigid counts, specified continuation maps/homotopies, cutoff estimates, finite Laurent specialization, completed PSS equivalence and Arnold inequality. Keep target hypotheses, nondegeneracy, compatible data, actual regular true faces, face-flat interiors, per-energy gluing neighborhoods and coherent orientations as separate inputs/conclusions. The scope exclusions are those stated at the beginning of this roadmap. Export the early cap/coefficient-torsor datum independently of the later injective-Chern and injective-period branch models; Laurent or completed matrix consumers use the model proved in their own branch.

*Needs:* 7.C.0–7.C.6h.

### 7.G Fixed-point Floer theory of a symplectomorphism on a closed spherically aspherical target

This branch builds the Floer theory of an arbitrary symplectomorphism `ψ` of a closed connected `X` with `ω` and `c₁` zero on spherical classes; Layer 7.T consumes its seamed carrier and local analytic comparisons. It is the only Lagrangian construction of this roadmap (the graph and diagonal strip folding below); the general Lagrangian and polygon operations stay with FukayaTheory.

Construct this application on closed connected X with ω and c₁ zero on spherical classes and an arbitrary symplectomorphism ψ. Define the actual ψ⁻¹-seamed path/configuration space, retain generator components and a reference section/frame per such component, and construct the area/Chern reference-cylinder cover by the joint kernel of the two transgressions on loops of sections. A loop is a torus in the mapping torus Y_ψ, not automatically a sphere or torus inside X. Construct Γ_a=im(I_ω,I_c), cap/reference transport and the actual covering/path lifting; asphericity excludes sphere energy but need not kill these transgressions. Choose seam-compatible J with all seam jets. Nondegenerate fixed points are finite; degenerate ψ uses actual seam-compatible Hamiltonian K_t and the fixed-point dictionary ψ∘φ_K¹, not an unperturbed count.

Use reference-to-orbit cylinders and A_ψ=∫ω_v+∫K_tdt, positive-end input, the actual end/reference energy and recapping laws and the supplied single HeegaardFloer relative index and determinant, with the extending-frame proof of the +2I_c shift. Apply MorseNovikov N1 with ν=−I_ω, without injectivity or a field assumption. Use complete filtered residue grading modulo the nonzero positive generator of 2I_c(Γ_a), and integer grading when I_c=0; no integer direct-sum grading of arbitrary completed series is asserted. Prove the nonlinear seamed Sobolev/universal section, seam unfolding and FHS separation/adjoint range for the actual split/seam data, including the stationary inverse separately. Construct raw energy-cutoff compactness, class splitting and conditional linear gluing before smooth-stratum openness/selection; then nonlinear gluing, orientations, finite-cutoff counts/d² and the stated continuation homotopies. Prove geometric finite-below support before completion. Folding gives the graph/diagonal strip with the conformal rescaling of both s and t; doubling boundary discs proves weak exactness from spherical asphericity. Construct relative-spin/orientation-line and count comparisons on the actual split-data carriers. No whole Fukaya or PSS theorem is used as an undefined replacement for this seamed analysis.

Construct J/K continuation with fixed nondegenerate ends, actual energy/support bounds and coherent reference/cover/local-system transports, including specified Hamiltonian deformations of ψ. For the Hamiltonian overlap consume the actual 7.C contractible spherical-aspherical Γ=0 cylinder complex and supported compatible continuation, together with the untwisting of 7.C.2. Identify the selected reference cylinders/caps and their zero-period normalization, transport the single index, end orientation and spin data, and prove the equation/count/continuation diagrams. Reflection changes ψ to ψ⁻¹ and uses its actual reference/period-sign transport. This comparison has no arbitrary-ψ PSS or Arnold conclusion. An unrestricted nonaspherical closed-target extension of Layer 7.G requires its seamed sphere-incidence/multicover and coherent punctured virtual-boundary construction. The separate bounded w⁺ torsion/count-dimensional application7.T constructs its own classical sphere-incidence/exclusion and bifurcation theorems; it is not this all-scope extension. A noncompact extension requires seam-invariant asymptotic/support data, finite generators in declared windows and an actual uniform no-escape/compact-image theorem for solutions and continuation.

**Checks.**
- For `ψ = id` the seamed configuration space is the free loop space, the fixed points are all
  of `X`, and after the Hamiltonian perturbation `K_t` the complex is the contractible-sector
  complex of 7.C on `Γ = 0`, through the dictionary `w(s, t) = φ_H^t(v(s, t))` of 7.C.2.
- For `X = T²` and `ψ` a translation by a non-lattice vector there are no fixed points, no
  generators, and the complex is zero; the Lefschetz number `0` agrees.
- The transgressions `I_ω`, `I_c` on loops of sections are not killed by asphericity: for
  `ψ = id` on `T²` a loop of constant sections sweeping a torus has `I_ω ≠ 0`, so `Γ_a ≠ 0` and
  the Novikov completion is genuinely needed, while `Γ = 0` for the contractible sector of 7.C.

*Needs:* Layer 6 item 1; Layer 7 items 1–2; 7.C.1–7.C.4 (cylinder analysis, continuation and
support, instantiated with the seam); 7.C.2 (the linear seam application and the Hamiltonian
untwisting); MorseNovikov N1; HeegaardFloer F1 (the relative index and determinant); Layer 2
item 1; Lee I §3.1.

### 7.T Floer–Novikov torsion and its periodic-flow correction

Construct the abelian Floer–Novikov torsion application for a nonempty closed connected boundaryless smooth symplectic manifold `(M^(2n),ω)`, n≥1, and a smooth symplectomorphism f, with a chosen component C of its twisted loop space. Require the actual finite-dimensional Hausdorff second-countable structures. The main geometric range is **w⁺-monotonicity**: `ω(A)>0` for each spherical integral class A with `0<c₁(TM)(A)≤n−2`, in the source's specified symplectic/Chern convention. Construct the convention comparison below before using this hypothesis in a native index or bubble calculation. The zero-dimensional point model is separate. Construct the regular-data and Hamiltonian-connected invariance theorem in 7.T.8; the stronger monotone symplectic-isotopy theorem is a separate7.T.9 target.

This is a classical count-dimensional application, not an extension of Layer 8's all-dimensional DG-coefficient theory. Layer 7.G supplies its reusable seamed carrier and local analytic comparisons, not a w⁺ compactness/exclusion theorem; 7.C supplies reusable raw operators and orientation templates, not its contractible cap quotient, branch exclusions, PSS equivalence or a torsion invariant. No noncompact/no-escape, general virtual, unrestricted Lagrangian, nonabelian Whitehead, arbitrary integral-zeta or higher-parametric torsion theorem is inferred.

### 7.T.0 Exact suppliers and construction direction

Consume MorseNovikov N1,N4 for period-controlled Novikov rings, finite convolution, completed finite-orbit modules, rational exp/log, total quotients and their field components, ordered determinant/torsion comparisons, finite-cyclic norms and cutoff topology. N6 owns the finite-dimensional closed-one-form bifurcation application. Reuse its algebraic identities where their hypotheses are established, not its finite-dimensional moduli argument as a Floer theorem. Construct the finite-parity application of the determinant comparisons in 7.T.4; do not call a two-periodic complex a bounded integer complex. Consume HeegaardFloer F0,F1,F2's actual Banach/Sobolev, unique-continuation, local CR, index and determinant interfaces. HeegaardFloer's invertible-end exponential theorem does not supply the degenerate polynomial-end theory constructed in 7.T.6. Use the existing DifferentialGeometry, SmoothBundlesConnections and AlgebraicTopology compact smooth-manifold and covering interfaces for mapping tori, section bundles, finite CW homology and characteristic classes. This application owns the seamed nonlinear, sphere-incidence, periodic-flow and bifurcation constructions at the range below. Construct them before invariance; an invariant value or later torsion computation is never a regularity, compactness or gluing premise.

*Needs:* MorseNovikov N1 and N4; HeegaardFloer F0–F2; AlgebraicTopology Stages 2–6; DifferentialGeometry Layers 0–3; SmoothBundlesConnections.

### 7.T.1 Actual section cover, finitely generated deck group and index

Instantiate SymplecticGeometry S0’s same mapping-torus carrier at native monodromy `ψ_native=f⁻¹`, construct its displayed closed-interval comparison `T_f=(M×[0,1])/((x,0)~(f(x),1))`, and construct the W^(1,2) component C of its sections containing a specified smooth γ₀, with smooth/Sobolev and seam comparisons. This has source seam `γ(1)=fγ(0)`: the equivalence is `(x,0)~(f(x),1)`. The native SymplecticGeometry S0 and 7.G carrier has seam `γ(1)=ψ_native⁻¹γ(0)`, so it is instantiated at `ψ_native=f⁻¹`, not at f. Construct the actual quotient/seam identification `[γ(t),t]↦[t,γ(t)]`, its inverse and local smooth charts. Its vertical bundle transition is df, matching `dψ_native⁻¹`; pull back the fibre form, seam-matched X/J, reference section/frame, sweep/period maps and covering/deck/Chern data through this identification. A loop of sections s↦γ_s sweeps `F(t,s)=[γ_s(t),t]` in T_f. Orient its source by **dt∧ds**, the circle coordinate t before the loop-of-sections coordinate s, and define `im:π₁(C,γ₀)→H₂(T_f;Z)` by this oriented torus and `H=im(im)`. Construct the mapping-torus boundary map ∂f with `∂f(im[γ_s])=[s↦γ_s(0)]`. Let V=ker(dπ:T(T_f)→TS¹) with its fibre symplectic form ω^f. Choose a native positive compatible I on V, with metric ω^f(·,I·), and define the canonical symplectic Chern class `c₁^f=c₁(V,I)` and `ψ_c(A)=⟨c₁^f,A⟩`. Prove independence of I by the compatible-structure homotopy. This pins the source canonical c₁(K) comparison: the metric variable J_L used below is −I, so `c₁(V,J_L)=−c₁^f` and is not silently substituted for c₁^f. Pin `c₁(TM)` in w⁺ by the same positive-compatible fibre restriction. Prove H finitely generated as a subgroup of the finitely generated abelian H₂ of this compact finite-CW-type mapping torus; do not assume π₁(C) itself is finitely generated or replace H by its torsion-free quotient. Construct the actual H-cover by the kernel of im, path lifting, local reference transport and the deck action.

Let X_t be a smooth seam-matched symplectic vector field. Put `θ_(X,t)=ι_(X_t)ω`, retain its flux and define the closed action one-form

`Y_X(γ)(ξ)=−∫₀¹ω(γdot,ξ)dt+∫₀¹θ_(X,t)(ξ)dt`.

Construct its period character `P_X:H→R` from the actual swept integral, prove it factors through H, and construct a primitive A_X on the H-cover with `dA_X=Y_X`. Pin the deck convention by `A_X(A·x̃)=A_X(x̃)+P_X(A)`; then `N_X=−P_X` is the Novikov character. For `θ_X=∫₀¹θ_(X,t)dt`, derive the exact source area/flux formula `P_X(A)=−⟨[ω^f],A⟩+⟨[θ_X],∂f A⟩` from this dt∧ds sweep. Changing its orientation changes the character and its explicit exponent isomorphism, not the same completion by fiat. The reference section/frame determines the relative index. Define the deck spectral-flow character `ψ:H→2Z` on the actual self-adjoint end family; prove the source identity `ψ=2ψ_c` with the above canonical complex-bundle and dt∧ds conventions, its evenness and relative-index recapping formula. Construct its comparison with HeegaardFloer's single frame/Chern/CZ construction, retaining every actual change of source, end and frame convention. Set `K=ker ψ`. Retain torsion in H and K and all finite ties or dense images of N. Neither K nor this cover is the spherical cap quotient Γ of 7.C.

*Needs:* SymplecticGeometry S0 (the mapping torus at `φ = f⁻¹`); Layer 7.G (the seamed carrier); HeegaardFloer F1.3–F1.5; AlgebraicTopology Stages 5–6 (the mapping-torus homology and finite generation of `H₂`); Layer 6 item 1.

### 7.T.2 Metric, flow, end and determinant dictionary

Construct the source-compatible complex directly. Its compatible structure J_L defines the positive-definite symmetric metric `g_L(v,w)=ω(J_L v,w)`. Use the actual metric dual `V_X=Y_X^sharp`, the elliptic formal-gradient equation `u_s+V_X(u)=0`, and the energy `E=∫|u_s|²`. Construct the loop-space weak differential and derivative-loss statement, not an ODE flow on an infinite-dimensional Banach manifold. In these conventions prove `θ_X^sharp=−J_L X` and

`u_s+J_L(u_t−X_t)=0`,  `E=A_X(x̃_−)−A_X(x̃_+)`.

The source-compatible input is the negative end, output the positive end. For `J_D=−J_L`, prove `g_L(v,w)=ω(v,J_Dw)` and that `v(s,t)=u(−s,t)` solves the displayed this roadmap PDE with J_D and the same X. In a Hamiltonian chart, Y_X agrees with the differential expression of 7.C's A_H; reference constants remain explicit. Write the source arrow as `x_−→x_+`, with u(−∞)=x_− and u(+∞)=x_+. Then v(+∞)=x_− and v(−∞)=x_+: the native capped7.C positive-input arrow is `v_+→v_−=x_−→x_+`, the same generator arrow. In contrast the standing negative-input arrow is `v_−→v_+=x_+→x_−`, so that comparison requires the actual transpose/dualization. Do not force dualization in the capped branch merely from s reversal. For a closed source sweep write `F(t,s)=[u(s,t),t]` on the ordered domain `(t,s)` with orientation dt∧ds. After reflection define `G(s,t)=[v(s,t),t]=F(t,−s)` on the native ordered domain `(s,t)` with orientation ds∧dt. The coordinate map `(s,t)↦(t,−s)` has determinant +1, so these two oriented swept classes agree under the actual quotient identification; their ω-densities agree because `ω(v_s,v_t)=ω(u_t,u_s)`. In contrast the fixed-order sweep `F_v(t,s)=[v(s,t),t]=F(t,−s)` on `(t,s)` reverses orientation and negates the source class. These are different ordered carriers, not a blanket negative native class. For an open cylinder define the relative swept class with its actual end boundaries and attach the chosen source reference caps; transport those caps, their boundary orientations and extending frames through the displayed quotient map and the positive-determinant `(s,t)↦(t,−s)` identification to define the corresponding native capped carrier. Prove its equality to the transported source capped class in that declared reference system, recording separately any deck/reference-cap changes. A standing negative-input dual-complex readout still reverses the generator arrow and requires its own basis/deck/determinant comparison; it does not negate a native ds∧dt swept class merely by naming the opposite input. Construct the resulting actual maps of section/cap covers, deck characters, coefficient rings/localizations, reference bases and determinant lines. Compute the induced dual-complex, parity-shift and torsion inversion/sign formula using N4's ordered determinants, including the sign/deck ambiguity and the nonacyclic-zero components. Do not assert unchanged torsion or I_F from identical orbit sets, parity, or an ordinary continuation equivalence.

Construct the Chern comparison for the positive-compatible vertical bundle (V,I) on source T_f and native `Y_(f⁻¹)`, its conjugate symbol bundle (V,J_L), and the actual extending-frame loop; it must verify the pinned source c₁^f/ψ formula and fix the signed native-index equality, not introduce a second CZ invariant or leave a free ± convention. Use a fixed end trivialization, the native small-rotation and scalar-crossing references, and the quotient-followed-by-negative-flow and outward-first parameter conventions of 7.C.2a to fix the comparison. Derive closed-orbit determinant orientations and the finite-cyclic action sign from these actual reference diagrams. Source s-parametrizations and classes may be used throughout the torsion construction until this uniquely specified native comparison is proved. No convention adapter is a hypothesis that grants the final invariant.

*Needs:* 7.T.1; 7.C.2a (orientation conventions); 7.C.0 (the action dictionary); MorseNovikov N4.

### 7.T.3 w⁺ raw cylinders and regular-data theorem

Construct seam-compatible J/X coefficient spaces and their localized Hamiltonian variations, all finite-order Sobolev section/evaluation charts and Fredholm/adjoint estimates, with the actual common-domain end realizations and explicit parameter/Sobolev differentiability budgets from F0/F1. Raw fixed-class energy-cutoff compactness, conditional gluing and the sphere-incidence problems precede regular selection. Construct the w⁺ semipositive sphere reductions and the joint t-parametrized sphere/orbit/core evaluation theorem, retaining equal-t shared structures, simple-image/cover reduction and the limiting bubble trees. For end orbits construct the low-Chern sphere avoidance needed by the count-dimensional theorem; do not assume it from nondegeneracy. Pin the finite count range explicitly. Write r for the source capped relative Fredholm index, p∈{0,1} for the finite external parameter dimension counted once, and reserve q>2 for the Sobolev exponent. A nonconstant translation-invariant cylinder has unreduced dimension r+p and reduced dimension r−1+p. Fixed differential/broken-boundary windows are (r,p)=(1,0),(2,0); slide/adjacent-family-boundary windows are (0,1),(1,1). An s-dependent continuation equation has no translation quotient: use dimension r+p, with (0,0),(1,0) for map/boundary and (−1,1),(0,1) for chain-homotopy/boundary. Prove negative-dimensional emptiness only for the actual regular realizations. Degenerate endpoints use the upper/lower end indices and polynomial realization of 7.T.6, not the nondegenerate formula by declaration. The periodic-flow windows are specified in 7.T.5. No all-index or higher-parameter simultaneous regularity is asserted by this lane.

Construct the joint sphere matching in these actual windows, not a blanket parametric avoidance assertion. A simple one-marked sphere of Chern number c in the common t and P fibre has dimension 2n+2c−3+p before matching to the end-orbit graph; its incidence with that graph has expected dimension **2c−3+p**. For fixed data c≤1 gives a negative dimension; for p=1,c=1 it is zero. Retain those possible zero-dimensional family end incidences in the admissible stratification and prove their actual exclusion from, or contribution/description in, the required compactified count/event boundaries. Do not infer their absence from the fixed-data inequality. Distinguish avoidance of the Chern-zero sphere-image set M₀(J_t) by the selected cores and ends from fixed-data Chern-one end avoidance. For an interior sphere bubble on a regular nonconstant cylinder, the remaining core has index r−2c; adding its free attachment point and the marked sphere and matching gives r−3+p, two below the main reduced dimension. Prove the analogous two-dimension drop for a regular nonstationary periodic core. These expectations do not settle covers, stationary/collapsed cores, trees or degenerate-end matching: construct their reductions, positivity/energy and index comparisons separately. Include stationary and constant-core configurations through their actual invertible or degenerate models. The positive-monotone energy ceiling, c₁-zero index argument and spherical-aspherical exclusion from other lanes are not this proof.

On each fixed class/energy window within the preceding finite index/parameter range prove the actual conditional range theorem, proper-window openness, density/smoothing and countable simultaneous selection in its stated constrained coefficient spaces, preserving seam/end/relative germs. Closed orbits require7.T.5's extra multiple-cover theorem. Prove existence of the regular pairs and endpoint-relative admissible homotopies used below from these constructions. “Regular” records specified operator transversality and nondegenerate finite asymptotics; it must not be defined to mean that compactness, all bifurcation conclusions or invariance already hold. Prove the finite critical-section theorem by identifying the generator component as a clopen subset of the compact fixed-point set of `f⁻¹∘Φ_X¹`, where Φ_X is the actual time-dependent symplectic flow; nondegeneracy then gives finiteness.

For regular fixed data construct the cylinder zero-dimensional translation quotient, compactified one-dimensional quotient with its broken boundary and coherent orientation lines. Prove finite rigid counts at every energy cutoff, integral class addition, reference changes, support and the signed square-zero equation after the matrices exist. Construct the actual supported w⁺ continuation and homotopy maps needed for comparisons of regular data and for endpoint/event limits, with finite integrated Hamiltonian derivative/curvature budgets. This does not import PSS or a module comparison into a non-Hamiltonian component. No all-dimensional corner or higher-DG export is asserted by these count-dimensional outputs.

*Needs:* HeegaardFloer F0–F2; 7.C.2b(iv)–(v) (conditional evaluation and compact exhaustion); 7.T.1–7.T.2; 7.C.3 (compactness and conditional gluing templates).

### 7.T.4 Finite based parity complex and total quotients

Apply N1 to the actual finite-orbit cover and N_X|K. Construct the source-compatible finite free parity complex `CF_even↔CF_odd` over `Λ_F=Nov(Z,K,N_X|K)`, using integer lifts in a fundamental index interval and a generator for ψ(H) when that subgroup is nonzero; treat ψ=0 without choosing a nonexistent positive generator. Construct its differential by the actual deck/reference index selection, not by infinite summation of all integer shifts into one parity generator. Prove every reference/lift/order change and the relation to the relative integer complex. This is a finite parity object, not the infinite repeated Z-graded complex viewed as finite.

For each field component of `Q(Λ_F)`, apply N4's short-exact-sequence determinant comparisons to the two cycle/boundary sequences, in the fixed even-then-odd order. Construct the resulting parity determinant readout and its basis-change and dualization formulas. On an acyclic component take its scalar torsion, normalized by `τ(0→F --a→ F→0)=a⁻¹` for the odd-to-even differential. On a nonacyclic component set the scalar0 and retain the determinant-line refinement separately. The zero chain complex is acyclic and has τ=1. Define τ_F in the WHOLE total quotient with its sign/deck-monomial orbit action, not in its units; mixed zero/nonzero components are allowed. Construct its ambiguity under reference frames, index shifts, orientations and chosen lifts.

Use N4's actual `Localization(nonZeroDivisors)` and finite characteristic-zero field decomposition. Construct the maps from the integral completion to its rational-coefficient completion and their total quotients, proving preservation of nonzerodivisors and component compatibility from the finite-torsion/kernel splitting and actual support. Do not identify rationalized completed series with an unrestricted algebraic tensor product. For cutoff limits use N4's embedding into the larger Novikov rings over kernel-field coefficients, with the specified splitting-independence; no unsupported valuation on the raw total quotient is assumed. Generic Novikov/localization/determinant theorems stay with MorseNovikov; this lane owns their parity and Floer reference/basis application.

*Needs:* MorseNovikov N1 and N4; 7.T.3.

### 7.T.5 Periodic formal flow and rational zeta

Construct solutions on `S¹_T×S¹`, T>0, with seam f in t, in the specified C sector. Include T as an actual parameter by rescaling s/T and computing the period derivative of the section. Remove stationary solutions before the circle quotient. The s-translation circle may have a finite stabilizer of order mult(u); construct local slices and distinguish a simple closed formal flow from its parametrized covers. These objects are not merely fixed points of f or geometric unparametrized tori with their multiplicities forgotten. The torus map to T_f defines A∈H. With the actual period T variable the unreduced Fredholm dimension is ψ(A)+1+p and the locally-free translation-circle quotient has dimension ψ(A)+p; no additional period dimension is added afterward. Fixed rigid counts use ψ(A)=0,p=0 and their family cobordisms ψ(A)=0,p=1. Because ψ is even, negative ψ gives negative reduced dimension in these p≤1 regular windows. Prove the rigid closed-flow classes therefore lie in K, with energy `E=N_X(A)>0`, using the signed comparison of 7.T.2. Higher periodic indices remain in the raw carrier but are not assigned an all-index regularity theorem here.

Own the Taubes-type simultaneous multiple-cover regularity application: decompose the linearized operators on all finite cyclic covers of a simple periodic flow into actual representation spaces, construct the allowed localized variations and their coupled annihilator/range theorem, and achieve simultaneous regularity for the required class/period/cutoff windows. Ordinary simple-cylinder injective-point regularity is not this theorem. Prove the determinant orientation is grading-compatible, compute the stabilizer action, and define the signed rational weight `sign(u)/mult(u)` only on the resulting isolated reduced solutions.

Construct energy-cutoff compactness with period and derivative bounds, exclusion/description of T→0 and T→∞ limits, sphere attachment/breaking and the w⁺ low-dimensional incidence exclusions of 7.T.3. For T→∞ retain cyclically broken trajectories and their class/period matching; no compact fixed-domain torus theorem supplies this end. Prove finitely many rigid reduced solutions below each energy cutoff and that the coefficient sum has strictly positive finite-below N-support. Use N1 to define

`η_F=Σ_(A∈K,A≠0)(Σ_[u]∈Mhat_O(A) sign(u)/mult(u)) e^A`,

`ζ_F=exp(η_F)∈1+Nov^{>0}(Q,K,N_X|K)`.

Construct ζ_F's actual reference/gauge laws and rational coefficient map. Integral cylinder counts do not make ζ_F integral: no integral product formula or integral virtual/stabilizer cancellation is asserted. Compare the geometric torus in `S¹×T_f` with its formal-flow class and orientations, without identifying this count with an arbitrary genus-one Gromov–Witten or TaubesGromov zeta invariant.

*Needs:* 7.T.3; 7.T.2; MorseNovikov N1; Hutchings §7.6.

### 7.T.6 Relative bifurcation and degenerate-end analysis

For arbitrary regular endpoints with fixed f,C and Hamiltonian-connected X, construct the existence of a specially admissible one-parameter J/X path relative to whole endpoint collars. First construct a semipositive path and regular critical-section family, isolate its kernel-one birth/death points and impose the required local normalizations; then prove genericity only in the successive declared constrained perturbation spaces preserving the already fixed endpoint, critical-set and finite-jet data. No genericity theorem for every unconstrained path or automatic normal form of such a path is asserted. Retain the actual fixed-cohomology action character, finite derivative budgets and simultaneous cylinder, closed-flow and sphere-incidence equations. At each energy/period cutoff prove event isolation and control; do not assume the full parameter interval has only finitely many events. Construct the regular homotopy of Floer systems with simple birth/death points, TypeI slides between distinct generators and TypeII self-slides to deck translates, and its broken-trajectory/closed-orbit strata.

At a birth/death prove the actual kernel-one crossing and nonzero quadratic fold normal form of the nonlinear section, including parameter transversality. In a fixed end chart write the formal gradient as A_y μ+n_y(μ). Choose a unit e_y∈ker A_y with positive projected quadratic coefficient κ, and construct the center graph tangent to e_y and its exponentially controlled transverse complement. Construct the permitted endpoint-relative changes giving J integrable and parameter-independent near the finite degenerate critical graphs, positive quadratic coefficient, the required vanishing mixed/cubic center jets and a nonzero parameter derivative along e_y supported away from other critical points. These are finite-jet normalization/application targets with actual section and error estimates, not assumptions hidden in “admissible”. If using substitute local charts instead, prove the same derivative-loss and nonlinear estimates rather than inferring them from a formal normal form.

For a nonzero center-amplitude positive-end trajectory, prove in the declared end chart, for s sufficiently large and k=0,1,2, the two-sided bounds `c_k(1+s)^(−k−1)≤||∂_s^k μ(s)||_(H^(2−k)_t)≤C_k(1+s)^(−k−1)`. The scalar center equation β′=−κβ²+O(β³) and the transverse decay estimates supply this route. A nonconstant trajectory approaching in a transverse stable direction can instead decay exponentially: do not claim the polynomial lower bound from kernel-one degeneracy alone. Construct the separate exponentially weighted realization for this branch. Derive the source endpoint grading ν_L from the single HeegaardFloer index, rather than introducing a second CZ invariant. In the chosen frame use `A=−I∂t−S`, source operator `E_L=∂s+A` and, after s reflection with exchanged ends, the HeegaardFloer operator `D_HF=∂s−A`. Construct their actual seam/frame/reflection and extending-reference comparison and define `ν_L(A)=c_ref−CZ_HF(A)` in that transported reference system. Fix c_ref before counts from one chosen nondegenerate reference and the scalar-crossing/frame calibration, and prove its compatibility with deck, cap and frame changes; it is not an independently adjustable constant at each end. For ε>0 smaller than the nonzero spectral gap put `ind_+(y)=ν_L(A_y−ε)` and `ind_−(y)=ν_L(A_y+ε)`. The HeegaardFloer normalization is `CZ_HF=−μ_RS`: shifting A to A−ε shifts S to S+ε, so the one-dimensional zero crossing gives `CZ_HF(A−ε)−CZ_HF(A+ε)=−1`, and therefore `ind_+−ind_−=+1`. Prove this scalar-crossing/sign comparison with the same HeegaardFloer index and actual reflected end order; do not assert the positive jump for CZ_HF itself. The upper relative index is `r=ind_+(x)−ind_−(y)`; for nondegenerate ends this agrees with the earlier r. Strong exponential decay uses `e^(ε|s|)` on each selected degenerate tail and therefore changes the negative-end index from ind_+ to ind_− or the positive-end index from ind_− to ind_+, one unit per such end. Construct these conjugation/index comparisons on the actual domains. In the selected fixed-degenerate windows with upper relative index r≤1 and no external parameter, prove the actual spectral-shift, range and regularity comparison: imposing strong exponential decay at k_d≥1 degenerate ends lowers the unreduced index by k_d, so its free-translation quotient has dimension r−k_d−1<0. Establish this emptiness only where the actual end realization and constrained perturbations give that formula. Outside such a proved exclusion retain and analyze the exponential branch. This is not a higher-parameter exclusion theorem.

On the polynomial branch set `Π_L(s)ξ=||u_s(s)||_(L²_t)^(−2)⟨u_s(s),ξ(s)⟩_(L²_t)u_s(s)`, and Π_T=1−Π_L. Choose a positive locally Lipschitz weight σ_u, constant on the nondegenerate far end and equal to `||u_s(s)||_(L²_t)^(−1)` on the degenerate tail, with a positive compact interpolation. Prove `σ_u(s)≍(1+s)²` and the required derivative/projection bounds from the fold estimates; pin connection/chart changes and any smoothing of the weight. For q>2 define W_u and L_u by completing compactly supported smooth sections in the actual distinct norms

`||ξ||_(W_u)=||σ_u^(1/2)ξ||_(W^(1,q))+||σ_u ∇_s(Π_L ξ)||_(L^q)`,

`||η||_(L_u)=||σ_u^(1/2)η||_(L^q)+||σ_u Π_Lη||_(L^q)`.

These W_u norms are norms for differences and tangent sections relative to a polynomial reference germ, not for displacement from the zero-end constant y: μ(s)≍s⁻¹ has σ_u^(1/2)μ≍1 and does not belong to that L^q space on an infinite tail. Construct actual affine local configuration charts `u(s)=exp_(u_ref(λ;s))(ξ(s))` on the tail, with an explicitly constructed polynomial reference germ u_ref, its residual in the declared target and ξ in the weighted difference space. Translation variations u_s≍s⁻² fit the model. Leading asymptotic coefficients or moving ends not represented by W_u are separate finite-dimensional reference-germ parameters, with their actual derivative, matching and index contribution; include each existing external parameter only once. Prove the residual/parameter maps, transition differences and nonlinear section derivative are bounded into the claimed target, including cancellations required for a varying leading1/s term. Do not assert that exp_y⁻¹(u) lies in a growing-weight zero-end space, or infer this affine realization from a printed fixed-reference commensurability claim. Prove that the linearized operator W_u→L_u is bounded/Fredholm with the declared upper/lower end index, and construct its kernel/cokernel splitting, adjoint estimates, these parameter-dependent affine charts and nonlinear remainder bounds. A reference-end realization or another equivalent weight requires an actual norm-equivalence proof with the projection derivatives, not substitution of a reciprocal power. At a negative degenerate end use the reversed coordinate; when both ends degenerate construct compatible tail weights and longitudinal projections independently. Pin finite differentiability orders and constants uniformly only on the chosen quantitative finite-cutoff chart families, allowing the explicit pregluing rescalings. HeegaardFloer's zero-end exponential obstruction is not repaired by merely adjoining an exponentially weighted kernel variable. Construct these degenerate-end spaces and their actual nonlinear chart comparisons before pregluing.

Construct pregluing, approximate cokernel/Kuranishi projections where needed, scaled right inverses, nonlinear correction, uniqueness and onto-neighborhood theorems at birth/death and handle-slide configurations. Include the long-period closed-orbit limits through the degenerate point, all multiply broken return words and their cutoff estimates. Prove determinant orientation/gluing with the actual parameter, translation, end and cyclic-stabilizer factors. Use the source-compatible degree order fixed in 7.T.2–4 before deriving event signs, not an unspecified post-count sign. These are new nonlinear application constructions, not an assumed theorem package attached to the name RHFS.

For each TypeII slide in A with N_X(A)>0, let T be the finite torsion subgroup of H and define div(A)>0 as the divisibility of its nonzero image in H/T. Construct the **nonequivariant perturbation property NEP**. For every prescribed finite cutoff and sufficiently small isolating parameter window, and every H-adapted slide-breaking finite cyclic cover of C with monodromy `π_m∘ν∘im`, a primitive integral homomorphism `ν:H→Z`, `ν(A)=div(A)` and `m>1` with `m∤div(A)`, construct an endpoint-relative cutoff-regular perturbation of the lifted formal flow. Derive its actual section/compactness/error controls, including any nonlocal loop-chart Hamiltonian variation needed to separate the lifted branches; an arbitrary configuration-space vector field is not an admissible elliptic perturbation by declaration. It need not descend to a local Hamiltonian on M. Prove its agreement with the unperturbed lift outside the chosen inner parameter window and its compatibility with the finite-cutoff deck/reference comparisons. Construct such connected degree-m covers using a primitive ν on the nonzero free part of A; N_X(A)>0 excludes torsion A. Retain the source-adapted cover comparison for a nonprimitive integral ν as well: use its actual image in Z/m, actual connected-component degrees and relabeled deck actions, and assemble the componentwise perturbations and orientation/norm comparisons. Do not call a non-surjective monodromy cover connected of degree m. Prove the reduction rather than discarding the additional adapted covers. For norm/cancellation arguments select the covers killing the finite torsion subgroup, as required by N4. Reuse N6's finite-cyclic algebra only after these Floer-specific perturbation and gluing hypotheses are established.

*Needs:* 7.T.3–7.T.5; HeegaardFloer F0–F1; Lee I §§5–6 and Lee II.

### 7.T.7 Event formulas, zero branches and completion limits

Derive the actual oriented boundary identities for the regular homotopy before claiming invariance. A TypeI slide gives the specified elementary based change and no zeta jump. Fix increasing parameter λ and first an actual **death** at λ₀, with regular λ_−<λ₀<λ_+. On the minus side choose the disappearing lifted generators z⁺,z⁻ of source integer indices i,i−1, respectively, with local differential z⁺→z⁻ and reference sign normalized so its coefficient is 1+b. Define b, of strictly positive N-order, by the actual oriented return words in that entry. The plus complex has the pair removed. In the ordered block differential `[[1+b,v],[w,N]]` construct its Schur complement `N−w(1+b)⁻¹v` using N1. Prove the componentwise multiplication identities

`τ_+=(1+b)^((-1)^(i+1)) τ_−`,  `ζ_+=(1+b)^((-1)^i) ζ_−`.

Ratios are permitted only in a nonzero acyclic field component. For an increasing-parameter **birth**, use the same pair/reference data on the plus side and prove the inverse factors, equivalently the preceding identities with plus and minus interchanged. For an odd upper index i, the elementary disappearing odd-to-even map a=1+b has τ_−=a⁻¹ and τ_+=1, so the death torsion factor is a. These two factors cancel in I_F, but are not separate torsion invariances.

At a TypeII slide construct the full positive-order self-slide series and the changed based differential, retaining all higher coefficients. Prove its zeta factor cancels its determinant/torsion factor by NEP on the finite cyclic covers and the N4 norm/trace/log identities, using the geometric leading coefficient and cutoff stability. A first-order coefficient calculation is not an all-order cancellation proof. Where a component torsion is nonzero, cancel only in that field component with N4's proved nonvanishing norm comparison. For a nonacyclic component use the actual event chain equivalence to retain nonacyclicity and prove `0·ζ_+=0·ζ_-=0`, with no quotient by τ=0. Retain partially acyclic components rather than replacing the whole value by 0. Use the same multiplication identities in reference/lift transports.

Construct cutoff-compatible endpoint/event-limit matrices and their supported chain homotopies to neighboring regular complexes to establish that the acyclic component set remains fixed at those limits. Prove total-quotient cutoff continuity and convergence of the successive event products in N4's larger componentwise Novikov embeddings. Derive invariance on the whole compact parameter interval from the finite-cutoff identities; do not apply a finite-event induction globally or assume completeness of the total quotient from completeness of Λ_F. Finally quotient the result by its actual simultaneous sign/deck ambiguity.

*Needs:* 7.T.4–7.T.6; MorseNovikov N1 and N4; Hutchings §7.5.

### 7.T.8 Corrected Hamiltonian-connected invariant

After the preceding constructions define

`I_F=τ_F ζ_F ∈ Q(Nov(Q,K,N_X|K))/(±e^K)`.

Prove that for fixed w⁺ M,f,C and any two constructed regular pairs `(J₁,X+χ_H₁)` and `(J₂,X+χ_H₂)`, the two I_F values agree after the explicit reference/coefficient identification. The actual endpoint-relative admissible-path existence theorem, with genericity only inside its constructed constrained perturbation classes, produces the comparison; no theorem hypothesis is an arbitrary record containing all desired compactifications or the final equality. Derive independence from the auxiliary regular J and Hamiltonian perturbation and the corresponding Hamiltonian-isotopy transport of f,C, with the actual loop-component action and deck/flux diagrams. An ordinary continuation chain homotopy equivalence alone is not an invariance proof for τ_F; the correction and event calculations are essential. This is the bounded Floer analogue of the source's torsion remark, independent of Layer 8's Serre/family endpoints.

*Needs:* 7.T.3–7.T.7; Lee I §§2.2–2.3 and 4.

### 7.T.9 Separate monotone strengthening and checks

When M is positively monotone in the source's actual spherical sense, construct the additional period/flux comparison and co-directional-family argument giving a rational group-ring value

`I_F^{f,C}(M)∈Q(Z[K])/(±e^K)`

whose image under `i_(−P_X)` is the constructed completed I_F for every regular pair. Include the zero-character to nonzero-character comparison through N1/N4's actual group-ring/total-quotient embeddings; arbitrary changing flux does not give identical completions. Prove invariance under symplectic isotopies with transport of f and of C by the actual π₁(Symp₀) action. Keep this stronger statement distinct from 7.T.8's fixed-period Hamiltonian-connected equality. Construct the source's identity-isotopic, basepoint-orbit specialization to the included classical abelian torsion of M only after its actual reference/period and finite-dimensional MorseNovikov comparison; it is not a definition of I_F or a generic PSS consequence.

**Checks.**
- The connected zero-dimensional model: `M` a point, `f = id`, `C` with one section, `H = K = 0`,
  `N_X = ψ = 0`. With the fixed zero-index reference the parity complex is `CF_even = ℤ`,
  `CF_odd = 0`; after localization its even homology is `ℚ`, so `τ_F = 0`; there are no
  nonstationary periodic formal flows, so `ζ_F = 1` and `I_F = 0`. A field ground change gives
  the same calculation with that field as the even module. This is not the zero chain complex.
- `N_X|_K = 0`: the positive-energy identity excludes nonconstant closed formal flows, so
  `ζ_F = 1`; the zero complex has `τ = 1`; a nonacyclic field factor has `τ = 0`; the acyclic
  elementary odd-to-even map `a` has `τ = a⁻¹`; mixed field components keep each component’s
  value.
- Finite torsion in the deck group, a birth/death with nonzero return series `b`, and a Type II
  event whose all-order correction is visible: the death factor `(1 + b)^{(−1)^{i+1}}` on `τ` and
  `(1 + b)^{(−1)^i}` on `ζ` cancel in `I_F`, and a first-order truncation of `b` would not cancel
  the Type II factor.
- Reference and lift changes and `s`-reversal act on the based determinant formulas by the
  sign and deck-monomial ambiguity `±e^K`, and by nothing else.

These checks do not assert an integral zeta formula, a quantitative fixed-point bound, a
nonabelian `s`-cobordism theorem or equality with a general genus-one curve count. Lee I,
§§2.1–2.3, 3.3 and 4–6, and Lee II give the degenerate gluing and orientation constructions.
*Needs:* 7.T.8, MorseNovikov N1 and N4, HamiltonianReduction R1a.2 (the identity component
`Symp₀` and its topology, for the transport of `f` and `C`).

### Examples

- The `C²`-small autonomous Morse Hamiltonian on `S²`: two constant orbits of indices `−1` and
  `1`, `FH_* ≅ H_{*+1}(S²)`, and the capped branch on `Γ = 0` reproducing it through the PSS
  comparison.
- `ℂPⁿ` with the standard positive monotone form: the cyclic module formula of 7.C.5b.
- `SH_*(D²ⁿ) = 0` and `SH_*(T*S¹) ≅ H_*(𝓛S¹)`.
- The zero-dimensional torsion model `M = pt`, `I_F = 0`.

### Dependencies

HeegaardFloer Lanes F0–F2 and Lane M; AnalyticStableMaps M3; MorseNovikov N1 and N4;
HamiltonianSystems Layers 1–2; MorseTheory M4; SymplecticGeometry S0; CharacteristicClasses
C3.2; Layer 6; Layer 2 item 1; Layer 0 item 4 (for the fundamental chains consumed by Layer 8).
Source: Salamon, *Lectures on Floer homology*; Audin–Damian, Chapters 6–11; Seidel, *A biased
view of symplectic cohomology*, §3; Abouzaid, Chapter 1; Hofer–Salamon; Piunikhin–Salamon–Schwarz;
Floer–Hofer–Salamon; Hutchings §§7.5–7.6 and 8.2; Lee I–II.
## Layer 8: the DG Floer toolset

### 8.1 Representing chain systems for Floer moduli spaces

Consume Layer 7 item 2's all-dimensional aspherical and atoroidal topological corner
compactifications, ordered orientations and product faces, then Layer 0's relative
fundamental-chain theorem, and construct representing chain systems for the Floer moduli
spaces: existence (the source's Proposition 3.4, Definition 3.5) and uniqueness up to homology
(Proposition 3.6). The count-dimensional module equivalence of Layer 7.C.5b is not this
all-dimensional carrier input. *Needs:* Layer 7 item 2, Layer 0 item 4.

**Checks.**
- In index difference `1` the chain is the signed count of rigid cylinders modulo translation;
  in index difference `2` its boundary is the sum of the products over broken cylinders.
- For a `C²`-small autonomous Morse Hamiltonian the Floer trajectory spaces are the Morse
  trajectory spaces and the systems of Layer 5 item 1 are representing chain systems.
- A system in which one chain is replaced by a homologous chain is again a representing chain
  system, and the two are homologous through the specified family.

### 8.2 The Barraud–Cornea twisting cocycle

Construct the twisting cocycle in `C_*(Ω𝓛X)` (the source's Definition 3.7), prove the twisting
equation of Proposition 3.8 and uniqueness up to homology (Proposition 3.9). *Needs:* item 1,
Layer 2 item 1, Layer 4 item 1.

**Checks.**
- The degree-`0` part is the classical Floer differential with `π₁(𝓛X)`-monodromy.
- The cocycle is one-sided because `C_*(Ω𝓛X)` is homologically nonnegative (Layer 4 item 1).
- For the small autonomous Hamiltonian the cocycle is the Morse cocycle of Layer 5 item 2
  pulled back along the constant-loop inclusion `X → 𝓛₀X`.

### 8.3 The DG Floer complex

Define the DG Floer complex `FC_*(H, J, Ξ; 𝓕)` (the source's Definition 3.12) and prove its
independence of `(J, Ξ)` up to chain homotopy equivalence (Proposition 3.13). *Needs:* items
1–2, Layer 4 items 2–3.

**Checks.**
- For `𝓕 = C_*(Ω𝓛X)` itself the complex is the regular module twisted by the cocycle.
- For `𝓕` concentrated in degree `0` the complex is the classical Floer complex with local
  coefficients.
- Changing `Ξ` by a homologous representing system changes the complex by a continuation
  isomorphism, not by the identity.

### 8.4 Continuation

Construct representing chain systems for continuation moduli spaces (Proposition 3.14,
Definition 3.15) and their uniqueness (Proposition 3.16); continuation cocycles (Definition 3.17,
Propositions 3.18 and 3.19); the continuation map (Definition 3.21) and its filtration estimate
(Proposition 3.22), including the functions that correct the action along continuation
cylinders; the monotone and Hofer-norm corollaries (Corollaries 3.24 and 3.25); uniqueness up to
homotopy (Proposition 3.26); the identity (Proposition 3.27, Corollary 3.28) and composition
(Proposition 3.29). *Needs:* items 1–3, Layer 7 items 2 and 4, Layer 4 item 3.

**Checks.**
- A constant continuation datum gives the identity cocycle and the identity map.
- A monotone homotopy `∂_s H ≤ 0` preserves the action filtration; a general homotopy shifts it
  by `∫ max_X ∂_s H ds`, and a homotopy with `∂_s H ≥ 0` at a single time already shifts
  it.
- The composition of two continuation cocycles is a continuation cocycle for the composed
  homotopy, up to a parametrized cocycle.

### 8.5 Homotopies

Construct representing chain systems for parametrized moduli spaces (Proposition 3.30),
parametrized cocycles (Definition 3.31, Proposition 3.32) and the chain homotopy between
continuation maps (Definition 3.35). *Needs:* item 4, Layer 4 item 3.

**Checks.**
- A constant family of continuation data gives the zero homotopy.
- The homotopy between a continuation map and its composite with a reparametrized one is the
  one induced by the one-parameter family of reparametrizations.
- The chain-homotopy equation `Ψ¹ − Ψ⁰ = D⁻h + hD⁺` holds with the signs of Layer 4 item 3.

### 8.6 Closed manifolds

Prove that continuation maps are homotopy equivalences (Proposition 3.36) and the comparison
`FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` in the contractible component (Theorem 3.37), where
`i_X : X → 𝓛₀X` is the constant-loop inclusion; construct the canonical filtration (Definition
3.38) and the spectral sequence with `E² = FH_*(H; H_q(𝓕))` (Theorem 3.39); prove **Theorem J**:
for a Hurewicz fibration `F → E → 𝓛₀X`, `FH_*(H; C_*(F)) ≅ H_{*+n}(E|_X)`, compatibly with the
Serre spectral sequence. *Needs:* items 3–5, Layer 7 item 4, Layer 5 items 2–4, Layer 4 item 4,
Layer 3 item 2.

**Checks.**
- Theorem J for the trivial fibration recovers `FH_*(H) ≅ H_{*+n}(X)` with coefficients (worked
  example 6).
- For `𝓕` concentrated in degree `0` the comparison is the classical `FH_*(X; L) ≅ H_{*+n}(X; i_X^*L)`.
- The degree shift is `n = ½ dim X`: on `X = S²` with the small Morse Hamiltonian the
  generators have Conley–Zehnder indices `−1` and `+1` and the comparison sends them to
  `H₀` and `H₂`.

### 8.7 Symplectic homology with DG coefficients

Define `SH_*(W; 𝓕)` for a Liouville domain as a direct limit over slopes; prove the zero-energy
identification `SH^{=0}_*(W; 𝓕) ≅ H_{*+n}(W, ∂W; i_W^*𝓕)` (Proposition 3.44), which defines
`i_{W*}`; the long exact sequence (Proposition 3.45); the Viterbo transfer (Proposition 3.46);
the spectral sequence (Theorem 3.49). *Needs:* items 3–6, Layer 7 item 5, Layer 6 item 2.

**Checks.**
- For `𝓕` concentrated in degree `0` this is Layer 7 item 5's symplectic homology with local
  coefficients.
- For the ball `D²ⁿ`, `SH_*(D²ⁿ; 𝓕) = 0` for every `𝓕` pulled back from a point, since the
  classical `SH_*(D²ⁿ) = 0` and the spectral sequence of Theorem 3.49 has zero `E²`.
- The Viterbo transfer for `W ⊆ W` is the identity.

### Examples

- Theorem J on the trivial fibration and on the path-loop fibration over `𝓛₀X`.
- `SH_*(D²ⁿ) = 0`.

### Dependencies

Layer 7 items 2, 4 and 5 (all-dimensional compactifications, the Floer complex, symplectic
homology); Layer 0 item 4; Layers 3–5. Source: the source paper §§3.3–3.7.

## Layer 9: the Viterbo isomorphism

### 9.1 The Viterbo twist and the canonical grading

Construct the degree-zero Viterbo twist `η₀` on `𝓛Q`, equal to the source's underlined `η` in
§§1.5 and 4.1, and the canonical grading of Floer homology of `T*Q` (§4.2). Let `o_Q` be
AlgebraicTopology's orientation local system in degree zero. Define `σ` by monodromy
`(−1)^{⟨w₂(TQ), Γ_*[T²]⟩}` along a loop of loops with adjoint `Γ : T² → Q`. Put `w(γ) = 0` when
`γ^*TQ` is orientable and `−1` otherwise, and `η₀ = σ ⊗ ev₀^*(o_Q^{−1}) ⊗ ev₀^*(o_Q^{−w})`. Prove
the component, local-system, monodromy, tensor and coefficient-extension laws using `w₁`, `w₂`
and orientation-line transport, including nonorientable `Q`. Keep the source's graded twist
`η_gr = η₀[n]`, supported in degree `−n`, separate from `η₀`. Fix homological shifts
`C[n]_j = C_{j+n}`, `d_{[n]} = (−1)^n d` and construct the tensor and shift comparison: on a
homogeneous fibre element `α` of degree `p` its map `𝓕 ⊗ η_gr → (𝓕 ⊗ η₀)[n]` has the Koszul
factor `(−1)^{np}`. Compare the DG action, differentials and raw determinant equations through
this same map. All unshifted Viterbo formulas below use `η₀`, with the index and determinant
normalization proved accordingly. Verify the smooth asphericity and atoroidality conditions:
`T*Q` with `ω_can` is exact, and `T(T*Q)` restricted to the zero section is `TQ ⊗ ℂ`, so the
Chern numbers of all surface maps vanish. Compare the canonical grading with the grading of the
conventions. *Needs:* Layer 3 items 1 and 3–4, AlgebraicTopology Stage 6 (orientation system),
CharacteristicClasses (`w₁`, `w₂`), Layer 6 item 3.

**Checks.**
- For `Q` orientable and spin, `η₀` is trivial; for `Q = S¹`, `η₀` is trivial in degree zero
  (worked example 7).
- For `Q = ℝP²`, `w = −1` on the loops reversing orientation, and `η₀` has monodromy `−1` on
  the loop of loops that rotates such a loop once around itself.
- The shift comparison: for `n = 1` and `α` of degree `1`, the Koszul factor is `−1`; a
  comparison without it would make the DG Viterbo map fail to be a chain map in degree `1`.

### 9.2 Classical Viterbo with local coefficients

For every classical local system `L` on `𝓛Q`, prove `SH_*(T*Q; Π^*L) ≅ H_*(𝓛Q; L ⊗ η₀)`, by
hybrid Floer-to-Morse moduli spaces in the finite-dimensional approximation
(Abbondandolo–Schwarz Theorem 3.1 and its corrigendum, as organized in Abouzaid Chapters 5–6).
*Needs:* Layer 7 item 5, Layer 5 item 6, Layer 3 item 3, item 1.

**Checks.**
- For `Q = S¹` and `L` trivial: `SH_k(T*S¹) ≅ H_k(𝓛S¹; ℤ)`, which is `ℤ[ℤ]` in degrees `0`
  and `1` and zero in negative degrees (worked example 7).
- For `Q = pt`, both sides are `ℤ` in degree `0`.
- For `L` the sign system of `η₀⁻¹` the right-hand side is the untwisted `H_*(𝓛Q)`, which is
  the classical statement for orientable spin `Q` only after `η₀` is accounted for.

### 9.3 Theorem K

For a DG local system `𝓕` on `𝓛Q` with `H_*(𝓕)` bounded below, prove
`SH_*(T*Q; Π^*𝓕) ≅ H_*(𝓛Q; 𝓕 ⊗ η₀)` through the source's steps:
the half-cylinder moduli spaces `𝓜(x)` and their dimension and orientation lines
(Proposition 4.6); their representing chains `s_x` (Proposition 4.7) and the equation
`∂m_x = Σ m^{η₀⁻¹}_{x,y} m_y`, where `m^{η₀⁻¹}_{x,y} = Φ^{η₀⁻¹}(m_{x,y})` uses the degree-zero
inverse-monodromy local system (the source abbreviates `Φ^{η₀⁻¹}` by `Φ^η`; the graded `η_gr`
and item 1's tensor and shift comparison enter only the graded determinant readouts)
(Proposition 4.9); the hybrid moduli spaces `𝓑(x; y)` (Proposition 4.10), their representing
chains (Proposition 4.11), evaluation maps (Proposition 4.13) and the equation for `b_{x,y}`
(Proposition 4.14); the finite-dimensional reduction (Lemma 4.15); and the chain map `Ψ̃ʳ`
(Proposition 4.16). The map is an isomorphism by comparison of index spectral sequences, whose
`E²` map is item 2. *Needs:* items 1–2, Layer 8 item 7, Layer 5 item 6, Layer 4 item 4, Layer 2
item 1, Layer 1 item 2.

- **Finite-dimensional approximation** (the source's §4.3; Abouzaid §3.2). Use the manifolds
  `𝓛ʳQ` and the maps `ιʳ`, `geoʳ` of Layer 5 item 6, and the sampling maps `evᵣ : 𝓛Q → Qʳ`,
  `γ ↦ (γ(0), γ(L_γ/r), …, γ((r−1)L_γ/r))`, which are continuous on the Moore space because the
  duration `L_γ` is. The source's Lemma 4.5 is replaced by the **compact-family approximation
  lemma**: for a compact `K ⊆ 𝓛Q`, durations are bounded on `K` and `K` is equicontinuous
  (Arzelà–Ascoli), so there is `r(K)` with `evᵣ(K) ⊆ 𝓛ʳQ` for `r ≥ r(K)`, and `geoʳ ∘ evᵣ|_K` is
  homotopic to the inclusion of `K` through the canonical homotopy that moves each arc
  `γ|_{[(i−1)L_γ/r, iL_γ/r]}` to the minimizing geodesic between its endpoints inside a convex
  ball and interpolates the durations linearly. It is natural in `K`. It shows that
  `colim geoʳ : colim 𝓛ʳQ → 𝓛Q` is a weak homotopy equivalence (Abouzaid Proposition 3.2.4
  states the homotopy equivalence; the weak version suffices by Layer 1 item 2): surjectivity on
  `π_k` by applying it to the image of a sphere; injectivity by applying it to the image of a
  nullhomotopy in `𝓛Q` of `geoʳ ∘ σ`, for `σ : S^k → 𝓛ʳQ`, together with a homotopy inside
  `𝓛^{r'}Q`, for `r' ≥ r` large, between `ev_{r'} ∘ geoʳ` and the iterated `ι`, which slides the
  sample vertices along the broken geodesic while the consecutive distances stay below the cut
  (this is where the monotonicity `δᵢʳ ≤ δⱼʳ⁺¹` of the cutoffs is used). Part 1 of the source's
  Lemma 4.5, the retraction of the Moore loops of length `≤ L` onto the unit-speed ones, is
  false on the Moore carrier (conventions) and is not consumed by the source: its only use, in
  the proof of Lemma 4.15, is `geoʳ ∘ evᵣ ≃ id` on the compact set `⋃_x π ∘ Im ∘ q̄_x(𝓜̄(x))`,
  which the compact-family lemma supplies.

**Checks.**
- For `Q = S¹` the `E²` pages of both sides for `𝓕 = C_*(Ω𝓛S¹)` agree componentwise, with
  Layer 3's chosen basepoints and `η₀` (worked example 7).
- The constant loop `c` of duration `1` in `𝓛S¹`: `evᵣ(c)` is the constant tuple,
  `geoʳ ∘ evᵣ(c)` is the constant loop of duration `0`, and the homotopy of the compact-family
  lemma is the linear interpolation of durations; for `K = {c}`, `r(K) = 1` (worked example 10).
- The bounded-below hypothesis on `H_*(𝓕)` is used in the spectral-sequence comparison: for
  `𝓕` the chains on a fibre of a Hurewicz fibration it holds, and for an unbounded-below `𝓕`
  the index spectral sequences need not converge.

### 9.4 The zero-energy part and the transfer of local systems

Construct the zero-energy part of Theorem K (the source's Proposition 4.1), including
`i_Q^*η₀ ≃ o_Q` for the constant-loop inclusion and its Thom and shriek diagram:
`SH_k^{=0}(T*Q; Π^*𝓕) ≅ H_k(Q; i_Q^*𝓕 ⊗ o_Q)` and
`SH_k^{=0} ≅ H_{k+n}(D*Q, S*Q; π^*i_Q^*𝓕)`. Identify the first map with the orientation-twisted
zero-section Thom map of Layer 5 item 3, and prove its inverse and compatibility with the
tautological map to full `SH`. Construct the transfer of DG local systems `𝓛Q → 𝓛T*Q`
(Corollary 4.17) with the same `η₀` normalization. *Needs:* items 1–3, Layer 8 item 7, Layer 5
item 3.

**Checks.**
- For `Q = S¹` the zero-energy diagram matches worked example 7.
- For orientable `Q` and `𝓕` trivial, `SH^{=0}_k(T*Q) ≅ H_k(Q)`, the Thom isomorphism of the
  disc bundle.
- For `Q = ℝP²` and `𝓕` trivial, the twist `o_Q` is nontrivial and `SH^{=0}_2(T*ℝP²; ℤ) ≅ H_2(ℝP²; o) = ℤ`,
  while the untwisted `H_2(ℝP²; ℤ) = 0`.

### Examples

- `Q = S¹`: both sides of Theorem K componentwise (worked example 7).
- `Q = pt`: `T*Q` is a point and Theorem K is the identity `ℤ = ℤ`.

### Dependencies

Layers 5 (item 6), 7 (item 5) and 8 (item 7); Layer 3 items 3–4; Layer 1 item 2 (weak
equivalences); AlgebraicTopology Stage 6 and CharacteristicClasses for `o_Q`, `w₁`, `w₂`.
Source: the source paper §4; Abbondandolo–Schwarz, *On the Floer homology of cotangent bundles*
and its corrigendum; Abouzaid Chapters 3, 5 and 6.

## Layer 10: the criteria and their applications to cotangent bundles

### 10.1 Theorem L

Prove **Theorem L** (= the source's Theorem 5.1), the criterion for contractible almost
existence, through the relative capacity bound (Proposition 5.5), the fast-orbit lemma
(Lemma 5.7) and the spectral invariants `ρ(·, σ)` with their properties (Proposition 5.8).
*Needs:* Layer 8 item 7, Layer 6 items 2, 4 and 5.

**Checks.**
- For `W` the ball, every nonzero class of `SH^{<c}` is zero and the criterion gives nothing,
  consistently with the ball having no nontrivial symplectic homology.
- The spectral invariant of a class is attained: `ρ(σ) = inf {c | σ ∈ im SH^{<c}}` is a
  critical value of the action when `σ ≠ 0`.
- The fast-orbit lemma bounds the period of the produced characteristic by the action window,
  so the capacity bound of Proposition 5.5 is finite exactly when such a class exists.

### 10.2 Theorem M

Prove **Theorem M** (= Theorem 6.4), the criterion for finiteness of `c°_HZ(W)`, through the
capacity bound `c°_HZ(W) ≤ c(α)` (Proposition 6.6); prove its cotangent form, Proposition 6.7,
including the nonorientable form with the orientation twist of Layer 5 item 5. Irie's finiteness
of the ordinary `c_HZ(D*Q)` and the local-system finiteness of Albers–Frauenfelder–Oancea are
earlier results of the same type and are consumed by nothing here. *Needs:* Layer 8 items 6–7,
Layer 9 item 4, Layer 6 item 5, Layer 5 item 5.

**Checks.**
- For `W = D*Q` with `Q` a torus the hypothesis of Theorem M fails (no class with
  `j_!(α) ≠ 0` and `i_{Q*}(α) = 0` exists, since `Ω²T^r` is contractible) and
  `c°_HZ(D*T^r) = ∞`, as Layer 6 item 5's check shows directly.
- The bound `c(α)` is monotone in `α` under the action filtration: a class of smaller action
  gives a smaller capacity bound.
- Proposition 6.7 for `Q = S²` through Proposition 5.11: `ker i_{S²*}` contains `ℤ` in degree
  `0` (worked example 5), so `c°_HZ(D*S²) < ∞`.

### 10.3 The cotangent criterion

Prove the cotangent criterion (Proposition 5.9). *Needs:* item 1, Layer 9 items 3–4.

**Checks.**
- For `Q = S²` and the unit disc bundle the criterion applies with the class of worked example
  5.
- For `Q = T^r` it does not apply, since `i_{Q*}` is injective.
- The criterion is stated for a bounded open `U` containing the zero section; for `U` not
  containing the zero section the transfer map is not available and the criterion is silent.

### 10.4 The kernel of `i_{Q*}`

Prove that `Ω²Q` has the homology of a point if and only if `Q` is a `K(π, 1)` (Lemma 3.41);
Proposition 5.11: the kernel of `i_{Q*}` contains an infinite cyclic group, a copy of `π_k(Q)`,
or a class that is not `d`-torsion, according to the first nonvanishing higher homotopy group;
and that `ker π_{U!}` is `d`-torsion (Proposition 5.13). The second part of Proposition 5.11 uses
the class of groups annihilated by some power of `d` (Layer 1 item 4). *Needs:* Layer 1 items 1,
2 and 4, Layer 2 item 3, Layer 5 item 5.

**Checks.**
- `Q = T^r`: `Ω²T^r` is contractible and `i_{Q*}` is injective.
- `Q = S²`: `π₂(S²) = ℤ` is the first nonvanishing higher group; the source's proof identifies
  `ker i_{Q*}` with the homology of `P_{⋆→Q}𝓛₀Q ≃ Map_*(S², Q)` away from the unit, and
  `Map_*(S², S²)` has `π₀ = ℤ`, so the kernel contains an infinite cyclic subgroup in degree
  `0` (worked example 5).
- `Q = S³`: `π₃(S³) = ℤ` and `H₁(Ω²S³) = ℤ` (worked example 5).

### 10.5 Theorems A and C

Prove **Theorems A and C** in their general forms (Theorems 5.10 and 5.15), with the degree
hypotheses stated homologically: `deg(π ∘ φ)` by `(π ∘ φ)_*[S] = d · [Q]` over `ℤ`, and the mod-2
degree by the same equation with `𝔽₂`-fundamental classes from AlgebraicTopology Stage 6. Prove
**Corollaries D and E** in their Theorem A and Theorem C forms, from Layer 6 items 3–4. The `𝔽₂`
stage of Layers 5 and 7–9 is enough for Theorem C. Layer 10's all-dimensional DG trajectory and
chain inputs come from Layers 7.2, 8 and 9; its module-comparison corollaries use the common
readout of Layer 7.C.5b only on its specified overlap. Theorem 5.15 (Theorem C) uses the mod-2
vanishing theorem of Layer 1 item 4 in place of the source's class `{G | G ⊗ ℤ/2 = 0}`: with
`Y = Ω₀Q`, simply connected because `π₂(Q) = 0`, if `H̃_*(Ω₀Q; 𝔽₂) = 0` then every
`π_i(Ω₀Q) = π_{i+1}(Q)` is uniquely 2-divisible, contradicting `π_ℓ(Q) ⊗ ℤ/2 ≠ 0`; the rest of
the proof is the source's. *Needs:* items 1–4, Layer 1 item 4, Layer 6 items 3–4,
AlgebraicTopology Stage 6, DifferentialGeometry Layer 10 (through the homological degree).

**Checks.**
- For `Q = S²`, `S = Q`, `φ` the zero section and `d = 1`: `∂U` has the contractible almost
  existence property for every bounded `U ⊆ T*S²` containing the zero section (worked example
  8).
- For `Q = T^r` no hypothesis of Theorem A holds, and indeed `S*T^r` carries no contractible
  closed characteristic.
- The mod-2 vanishing theorem is applied to `Ω₀Q` and not to `Q`: for `Q = ℝP³`, `Q` is not
  simply connected but `Ω₀ℝP³ ≃ ΩS³` is, and `H̃_*(ΩS³; 𝔽₂) ≠ 0`, which is what Theorem C
  needs.

### Examples

- `Q = S²`: almost existence on every bounded hypersurface around the zero section.
- `Q = T^r`: the criteria are silent and the conclusion is false.

### Dependencies

Layers 6, 8, 9; Layer 1 items 1, 2 and 4; Layer 2 item 3; Layer 5 item 5; AlgebraicTopology
Stage 6; DifferentialGeometry Layer 10. Source: the source paper §§5 and 6.1–6.2.

## Layer 11: the finite cover of a compact connected Lie group

Let `G` be a compact connected Lie group. The applications of the continuation roadmap need to
know exactly when `G` is aspherical, and the string-orientation roadmap needs the same
criterion; this layer settles it from the Lie-theoretic suppliers, and nothing in it depends on
the Floer theory above.

### 11.1 The finite cover `T × K → G`

Consume LieGroups' interfaces for the universal cover and its discrete central kernel, the
splitting of a compact Lie algebra into its centre and its semisimple derived ideal, and simply
connected integration. Integrate the simply connected factors to identify the universal cover
with `ℝʳ × K`, where `K` is compact, connected, simply connected and semisimple. Prove `Z(K)` is
finite. The deck kernel `Γ` is discrete and central, hence lies in `ℝʳ × Z(K)`; compactness of
`(ℝʳ × K)/Γ` makes `Λ = Γ ∩ (ℝʳ × {1})` a full lattice in `ℝʳ`, and projection embeds `Γ/Λ` into
the finite group `Z(K)`, so `Λ` has finite index in `Γ`. Since `Λ` is central, the quotient map
`(ℝʳ/Λ) × K → (ℝʳ × K)/Γ ≅ G` is a finite covering `T × K → G` with `T = ℝʳ/Λ` a torus
(Bröcker–tom Dieck Chapter V). *Needs:* LieGroups Layers 5–6, CompactGroups.

**Checks.**
- `G = U(n)`: the cover is `S¹ × SU(n) → U(n)`, `(z, A) ↦ zA`, of degree `n`, with kernel the
  `n`-th roots of unity embedded diagonally.
- `G = SO(3)`: `r = 0`, `K = SU(2)` and the cover is the double cover `SU(2) → SO(3)`.
- `G = T^r`: `K` is trivial and the cover is the identity; a construction that produced
  `ℝʳ → T^r` would not be finite.

### 11.2 Higher homotopy across the cover

Prove that finite coverings induce isomorphisms on `π_j` for every `j ≥ 2`, through
UniversalCovers' induced maps on homotopy groups. For nontrivial `K`, choose a root `SU(2)`
subgroup from LieGroups' maximal-torus and root interfaces and prove that its map on `π₃` has
nonzero image (state the integral homology and `π₃` comparison that establishes this); hence
`π₃(K) ≠ 0`. *Needs:* UniversalCovers, LieGroups Layers 5–6, Layer 1 item 1 (for the homology
comparison).

**Checks.**
- `π₃(SU(2)) = π₃(S³) = ℤ`, and the root `SU(2)` of `SU(2)` is the identity.
- `π₃(SO(3)) = π₃(SU(2)) = ℤ` through the double cover; `π₂(SO(3)) = 0`.
- `π₃(T^r) = 0`: the criterion of item 3 separates `T^r` from every other compact connected
  Lie group.

### 11.3 The torus criterion

Since the higher homotopy of `T` vanishes, `G` is a `K(π, 1)` exactly when `K` is trivial,
equivalently when `G` is a torus; conversely a finite quotient of a torus is a torus. So a
compact connected Lie group with `π₃(G) = 0` is a torus. In `Suggested.lean` this is
`isAspherical_iff_exists_continuousMulEquiv_torus`: for a compact connected Lie group `G`
modelled on a real normed space, `TauCeti.IsAspherical G 1` holds exactly when `G` is isomorphic
as a topological group to `(S¹)ʳ` for some `r`. This item owns the finite-cover decomposition and
the criterion; the generic Lie, compact-representation and Haar theory stays with LieGroups and
CompactGroups. *Needs:* items 1–2, Tau Ceti `IsAspherical`, Mathlib `LieGroup`, `Circle`,
`ContinuousMulEquiv`.

**Checks.**
- `G = T^r` is aspherical and is a torus: both sides hold.
- `G = SO(3)`: `π₃ ≠ 0`, not aspherical, not a torus: both sides fail.
- The Lie hypothesis is needed: `G = ℕ → S¹`, the product of countably many circles, is a
  compact connected topological group with `π_j(G) = ∏ π_j(S¹) = 0` for `j ≥ 2`, but is not
  isomorphic to any finite torus, since its 2-torsion subgroup `(ℤ/2)^ℕ` is uncountable.
  The statement carries the Lie-group instance explicitly for this reason.

### Examples

- `U(n)`, `SO(3)`, `T^r` as above.

### Dependencies

LieGroups Layers 5–6, CompactGroups, UniversalCovers (completed), Layer 1 item 1; Mathlib
`LieGroup`, `Circle`, `ContinuousMulEquiv`; Tau Ceti `IsAspherical`. Source: the source paper
§6.4 (Example 6.30 and the proof of Proposition 6.31); Bröcker–tom Dieck, *Representations of
Compact Lie Groups*, Chapter V.

## Downstream consumers

- **AlgebraicTopology.** Stage 5.5 consumes Layer 1 item 2's fibration homotopy exact sequence
  and Serre spectral sequences; Stage 8.10 consumes Layer 1 item 1's degree-one Hurewicz
  isomorphism and item 4's abelian Eilenberg–MacLane family; Stages 8.9, 8.11 and 8.12 consume
  Layer 1 item 2's fibre transport, CW approximation and Serre sequence, and Layer 2 item 3's
  loop comparison.
- **GeneralizedCohomology.** G2.10's fibration-sequence applications and G5's rational
  Hurewicz consume Layer 1 item 2's exact sequence and multiplicative Serre spectral sequence.
- **CharacteristicClasses** consumes Layer 1 item 2's connected-map homology comparison.
- **MorseTheory** M5 consumes Layer 1 item 3's filtered-complex algebra; **ComplexKahlerGeometry**
  and **RiemannianGeometry** R3 consume Layer 1 item 2's spectral sequence and early
  weak-equivalence comparison.
- **StableHomotopyKTheory** consumes Layer 1 items 1–4; **HomotopySpheres** consumes Layer 1
  item 4's Hurewicz modulo a Serre class; **StringOrientation** consumes Layer 11's finite cover
  and torus criterion.
- **HeegaardFloer** consumes Layer 1 item 2's Serre spectral sequence and multiplicative
  cohomological Serre sequence, and Layer 7 consumes nothing back from this use.
- **DGFloerPartII** consumes Layer 1 items 1–6, Layer 2, Layer 4 item 5, Layer 5 items 4–6,
  Layer 6 items 3–4, Layer 10 and Layer 11, for Theorem B, the manifolds abundant with
  2-spheres, the projective loop-space computations and the knotted hypersurfaces.

## Worked examples

1. **Cubical comparison.** The cubical and simplicial homology of `S¹` and of a point agree
   through the comparison map. The cross product of the fundamental chains of `I` and `I` is
   the fundamental chain of `I²`, on the nose.
2. **Sign and variance audit.** The twisting equation of Layer 4 is the DG roadmap's `(MC)`
   under the grading bridge, the opposite-algebra bridge and the shift identification of its
   Layer 5. Noncommutative regression test: `R` free on `a, b` in degree `0` and `c` in degree
   `1` (homological), with `∂a = ∂b = 0` and `∂c = −ab`; `ind x = 2`, `ind z = 1`, `ind y = 0`;
   `m_{x,z} = a`, `m_{z,y} = b`, `m_{x,y} = c`, all other entries zero.
   - The twisting equation and one-sidedness hold.
   - In `R ⊗_R K_m` (the regular module), `D²(1 ⊗ x) = (ab + ∂c) ⊗ y = 0`.
   - In `K_m`, `d²(x) = 0`; through the bridge, the right `R^op`-module complex has `d² = 0`.
   - The literal right-free reading `d(e_x) = e_z a + e_y c`, `d(e_z) = e_y b` gives
     `d²(e_x) = e_y(ba − ab) ≠ 0`, recorded as the reason for the variance convention.
   - Action dependence: `A = ℚ × ℚ` in degree `0` with zero differential, `M = ℚ` in degree
     `0` with the right action through the first, respectively the second projection;
     `ind x = 1`, `ind y = 0`, `m_{x,y} = (1, 0)`. The twisted differential `twistedDifferential`
     gives `D(1 ⊗ x) = 1 ⊗ y` for the first action and `D(1 ⊗ x) = 0` for the second, and its
     signature carries the right-action instance `[Module Aᵐᵒᵖ M]` and the commutation instance
     `[SMulCommClass R Aᵐᵒᵖ M]`. The latter is what makes `D` `R`-linear: for `R = A = ℚ × ℚ`
     acting on `M = ℚ²` by `(a, b) • (u, v) = (au, bv)` on the left and
     `(u, v) · (a, b) = (au + (b − a)v, bv)` on the right, the actions do not commute and the
     formula is not `R`-linear.
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
7. **Viterbo on `E²`.** For `Q = S¹`, compute `η₀` trivial in degree zero and prove with trivial
   integral coefficients `SH_k(T*S¹) ≅ H_k(𝓛S¹; ℤ)`: the groups in degrees `0` and `1` are
   `ℤ[ℤ]` and negative degrees vanish. The graded `η_gr` would introduce a shift and is not the
   twist in this formula. Compute both sides and the `E²` pages of Theorem K for
   `𝓕 = C_*(Ω𝓛S¹)` componentwise, with Layer 3's chosen basepoints and `η₀`. Match the
   zero-energy Thom diagram of Layer 9 item 4.
8. **End to end.** For `Q = S²` and a bounded domain `U ⊆ T*S²` containing the zero section,
   `∂U` has the contractible almost existence property, by Theorem A with `S = Q`, `φ` the zero
   section and `d = 1`, through Proposition 5.11.
9. **Cotangent signs.** On `T*ℝ`:
   - `ω_can(∂_q, ∂_p) = 1` and `ω_can = −d(p dq)`; the Liouville field of `−p dq` is `p ∂_p`;
   - `ν^*ω_can = ω_src = d(p dq)`;
   - for `H = p²/2`, the source's vector field for `(ω_src, H)` is `p ∂_q`; its push-forward
     by `ν` is `−p ∂_q`, which is the vector field of `−H ∘ ν⁻¹ = −p²/2` for `ω_can` in the
     `ι_X ω = dH` convention;
   - on `T*ℝ` with `H = (q² + p²)/2`, the linearized flow and its Conley–Zehnder index are the
     same before and after transport along `ν`;
   - `Ψ'^*_σ ω_can = ω_can + π^*dσ` for `Ψ'_σ(q, p) = (q, p − σ(q))`.
10. **Loop approximation.** In the flat `S¹` and `T²`:
    - the unit-speed loops `γ_n` of the conventions converge in `𝓛T²` to the constant loop of
      duration `1`; the unit-speed loops are not closed;
    - for the constant loop `c` of duration `1` in `𝓛S¹`, `evᵣ(c)` is the constant tuple,
      `geoʳ ∘ evᵣ(c)` is the constant loop of duration `0`, and the homotopy of the
      compact-family lemma is the linear interpolation of durations;
    - for `K = {c}`, `r(K) = 1`.
11. **Lie groups.** `U(n)` is covered by `S¹ × SU(n)`, `SO(3)` by `SU(2)`, and the product
    `ℕ → S¹` of countably many circles is aspherical but not a torus, so the torus criterion
    needs the Lie-group hypothesis.

## Source coverage

This section is provenance, not specification: it records where each numbered statement of the
source paper within this roadmap's scope lands, so a reader can check that nothing is missing.
Numbers follow arXiv version 3 of the source paper.

| Source statements | Layer and item |
| --- | --- |
| Def 1.1 | 6.5 |
| Conj 1.2 | out of scope |
| Thm A, C | 10.5 (Thms 5.10, 5.15) |
| Cor D, E | 6.3, 6.4, 10.5, in their Theorem A and Theorem C forms |
| Cor F | out of scope |
| Def 1.8 | 3.1 |
| Defs 1.9–1.11 | 4.1, 4.3 |
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
| Props 3.44–3.46, Thm 3.49 | 8.7 |
| Prop 4.1, Cor 4.17 | 9.4 |
| Lem 4.5 | 9.3, part 2 on compact families; part 1 (the unit-speed retraction) is false on the Moore carrier and not consumed |
| Props 4.6, 4.7, 4.9–4.11, 4.13, 4.14, Lem 4.15, Prop 4.16 | 9.3 |
| Thm 5.1, Prop 5.5, Lem 5.7, Prop 5.8 | 10.1 |
| Def 5.3 | 6.5 |
| Prop 5.9 | 10.3 |
| Thm 5.10, Thm 5.15 | 10.5 (5.15 through the mod-2 vanishing theorem of 1.4) |
| Prop 5.11, Prop 5.13 | 10.4 |
| Thm 5.12 | 1.4, for genuine Serre classes; the source's mod-2 class is replaced there |
| Def 6.1, Prop 6.3 | 6.5 |
| Thm 6.4, Props 6.6, 6.7 | 10.2 |
| Ex 6.30 (the aspherical hypothesis), the finite cover in the proof of Prop 6.31 | 11 |

### Classical sources of Layer 7.C and 7.T

| Source statements | Construction target |
| --- | --- |
| Salamon, *Lectures on Floer homology*, §1.4 (symplectic action), §2.4 (Conley–Zehnder index), §2.5 (spectral flow) | 7.C.0–7.C.2 |
| Salamon §2.6 (transversality), §2.7 (exponential convergence); Floer–Hofer–Salamon, *Transversality in elliptic Morse theory*, Lemma 6.5 (the symmetric-matrix lemma) | 7.C.2 |
| Salamon §3.1 (compactness), §3.3 (gluing), §3.4 (invariance and continuation) | 7.C.3–7.C.4 |
| Salamon §3.5 (the isomorphism with Morse homology), §3.7 (Novikov rings); Hofer–Salamon, *Floer homology and Novikov rings*, §4 | 7.C.5–7.C.6 |
| Piunikhin–Salamon–Schwarz, §4 (the PSS maps) | 7.C.3b, 7.C.5b |
| Hutchings, *Lecture notes on Morse homology*, §§7.5–7.6 (Reidemeister torsion, periodic orbits and the zeta function) and §8.2 (Floer homology); Lee I–II | 7.T |

## Provenance: prior formalization

The proposer has formalized Audin–Damian, *Morse Theory and Floer Homology*, in Lean 4 on
Mathlib `v4.34.1`: [t4v1/damian_formalizare](https://github.com/t4v1/damian_formalizare),
about 50 000 lines across all sixteen chapters. One `sorry` remains, the Arnold conjecture on
the torus. The spaces of trajectories enter as explicit hypotheses, because there are no
submanifolds with tubular neighbourhoods to build them from. So the Morse and Floer complexes
satisfy `∂ ∘ ∂ = 0` *given* the broken-trajectory counts, and the moduli-space work of Lane M
and Layer 7 item 2 is not done there.

Material that is proved there and absent from Tau Ceti, and that this roadmap can port:

| There | Here |
| --- | --- |
| `Part2/CauchyPompeiu.lean`, `CauchyHolder.lean`, `FloerRegularity.lean`, `Ch6.lean`: Cauchy and Beurling transforms, Calderón–Zygmund and Schauder estimates on the Hölder scale, elliptic regularity of the Floer equation, energy and gradient bounds, convergence at the ends, compactness for bounded energy, on `ℝ²ⁿ` and the torus | Layer 7 items 1–2, flat case; a Hölder-scale alternative to the Sobolev route of Lanes F0–F1 |
| `Part2/Rho*.lean`, `Maslov*.lean`, `Ch7.lean`: `ρ : Sp(2n) → S¹` with all its properties, Maslov index of symplectic paths and loops | Layer 7 item 1, the Conley–Zehnder index and the loop Maslov index behind the Chern condition |
| `Part2/Darboux.lean`, `Ch5.lean`: Darboux by Moser's method | a contribution to its owner, Heegaard Floer Lane F2.1; not a target here |
| `Part1/Ch3.lean`, `Ch4.lean`: algebra of the Morse complex from abstract trajectory counts, Künneth, duality | Layer 5 items 1–3, algebraic part |

The Morse lemma and Sard's theorem are formalized there too, but Tau Ceti already has them, so
they are not ported. Porting is ordinary Tau Ceti work: one claimed item at a time, adapted to
Tau Ceti's Mathlib and conventions.

## References

- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Floer homology with DG coefficients.
  Applications to cotangent bundles*, arXiv:2404.07953 (version 3): the source paper.
- J.-F. Barraud, M. Damian, V. Humilière, A. Oancea, *Morse homology with differential graded
  coefficients*, arXiv:2308.06104 (version 3); Progress in Mathematics 360, Birkhäuser, 2025
  (BDHO): Layers 0 and 3–5. Statement numbers follow the arXiv version.
- J.-F. Barraud, O. Cornea, *Lagrangian intersections and the Serre spectral sequence*, Ann. of
  Math. 166 (2007), arXiv:math/0401094, Appendix A on corner structures: Layer 0 item 4.
- W. S. Massey, *Singular Homology Theory*, GTM 70, Springer, 1980, Chapters II and VII:
  cubical singular chains.
- J.-P. Serre, *Homologie singulière des espaces fibrés. Applications*, Ann. of Math. 54 (1951),
  Chapter II; *Groupes d'homotopie et classes de groupes abéliens*, Ann. of Math. 58 (1953),
  Theorem 1: Layer 0 and Layer 1 item 4.
- A. Hatcher, *Algebraic Topology*, Cambridge University Press, 2002 (the author's online
  edition): Theorem 2A.1, §4.1 (Propositions 4.13, 4.21, 4.30, Lemma 4.31), §4.2 (Theorem 4.41,
  Proposition 4.48), §4.3 (pullbacks of fibrations), §4.J.
- C. Weibel, *An Introduction to Homological Algebra*, Cambridge University Press, 1994,
  Theorems 5.5.1 and 5.5.10: Layer 1 item 3.
- G. W. Whitehead, *Elements of Homotopy Theory*, GTM 61, Springer, 1978, Chapter I: Layer 2.
- R. Palais, *Local triviality of the restriction map for embeddings*, Comment. Math. Helv. 34
  (1960): Layer 1 item 6.
- M. Audin, M. Damian, *Morse Theory and Floer Homology*, Universitext, Springer, 2014 (the
  authors' online edition), Chapters 6–11: Layer 7 items 1–4.
- D. Salamon, *Lectures on Floer homology*, IAS/Park City Math. Ser. 7 (1999), §§1.4, 2.4–2.7,
  3.1–3.7: Layer 7.C.
- H. Hofer, D. Salamon, *Floer homology and Novikov rings*, in *The Floer Memorial Volume*,
  Birkhäuser, 1995, §4: Layer 7.C.6.
- A. Floer, H. Hofer, D. Salamon, *Transversality in elliptic Morse theory for the symplectic
  action*, Duke Math. J. 80 (1995), 251–292, Lemma 6.5: Layer 7.C.2's symmetric-matrix lemma.
- S. Piunikhin, D. Salamon, M. Schwarz, *Symplectic Floer–Donaldson theory and quantum
  cohomology*, in *Contact and Symplectic Geometry*, Publications of the Newton Institute 8,
  Cambridge University Press, 1996, 171–200, §4: the PSS maps of Layer 7.C.3b and 7.C.5b.
- P. Seidel, *A biased view of symplectic cohomology*, arXiv:0704.2055, §3: Layer 7 item 5.
- M. Abouzaid, *Symplectic cohomology and Viterbo's theorem*, arXiv:1312.3354 (version 2);
  in *Free loop spaces in geometry and topology*, IRMA Lect. Math. Theor. Phys. 24 (2015).
  Chapter numbers follow the arXiv version: Chapter 1 (Layer 7 item 5), Chapter 3 (Layers 5
  item 6 and 9 item 3), Chapters 5–6 (Layer 9 items 2–3).
- A. Abbondandolo, M. Schwarz, *On the Floer homology of cotangent bundles*, Comm. Pure Appl.
  Math. 59 (2006), arXiv:math/0408280, Theorem 3.1, and its corrigendum: Layer 9 item 2.
- H. Hofer, E. Zehnder, *Symplectic Invariants and Hamiltonian Dynamics*, Birkhäuser, 1994,
  Chapters 1, 3 and 4; M. Struwe, *Existence of periodic solutions of Hamiltonian systems on
  almost every energy surface*, Bol. Soc. Brasil. Mat. 20 (1990): Layer 6 item 5.
- K. Irie, *Hofer–Zehnder capacity of unit disk cotangent bundles and the loop product*,
  J. Eur. Math. Soc. 16 (2014), arXiv:1110.2244; P. Albers, U. Frauenfelder, A. Oancea, *Local
  systems on the free loop space and finiteness of the Hofer–Zehnder capacity*, Math. Ann. 367
  (2017), arXiv:1509.02455: earlier finiteness results, Layer 10 item 2.
- Y.-J. Lee, *Reidemeister torsion in Floer–Novikov theory and counting pseudo-holomorphic
  tori, I*, arXiv:math/0111313, §§2.1–2.3, 3.3, 4–6, and *II*, arXiv:math/0505013: Layer 7.T.
- M. Hutchings, *Lecture notes on Morse homology (with an eye towards Floer theory and
  pseudoholomorphic curves)*, 2002, §§7.5–7.6 and 8.2: the torsion and zeta-function
  background of Layer 7.T.
- T. Bröcker, T. tom Dieck, *Representations of Compact Lie Groups*, GTM 98, Springer, 1985,
  Chapter V: the structure of compact connected Lie groups behind the finite cover of Layer 11.
