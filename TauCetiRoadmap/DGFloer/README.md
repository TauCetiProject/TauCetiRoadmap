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
coefficients for cotangent bundles. This roadmap builds that package on the normalized cubical
chains, Moore paths, DG local systems and twisted complexes of the pinned Tau Ceti and on a few
general facts of algebraic topology that no other roadmap builds, through DG Morse homology,
Hamiltonian Floer homology of periodic orbits on the curve analysis of the Pseudoholomorphic
curve analysis roadmap and the analytic tower of the Heegaard Floer roadmap, and symplectic
homology, to its end theorems: the fibration theorem for DG Morse homology, the
DG Floer comparison `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` and Theorem J, the DG Viterbo isomorphism
(Theorem K), the capacity criteria (Theorems L and M), and the almost existence theorems for
contractible closed characteristics on hypersurfaces of `T*Q` (Theorems A and C). It also settles,
in a layer independent of the Floer theory, when a compact connected Lie group is aspherical.

Suggested homes:

| Layers | Home |
| --- | --- |
| 0 | `TauCeti/AlgebraicTopology/Singular/Cubical/` |
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

- fundamental chains rel boundary of topological manifolds with corners in normalized cubical
  chains (Layer 0);
- the cubical and universe-polymorphic forms of the degree-one Hurewicz isomorphism
  `π₁(X)ᵃᵇ ≅ H₁(X; ℤ)`, CW approximation of spaces that are not path-connected, invariance of
  cohomology under weak equivalences and the comparison for `k`-connected maps, lifting for
  arbitrary relative CW pairs and the fibration homotopy exact sequence of a Serre fibration, and
  the ordinary homological and multiplicative cohomological Serre spectral sequences over
  arbitrary CW and arbitrary bases, with their cubical transport (Layer 1 items 1–2);
- the homological regrading of Tau Ceti's filtered-complex spectral sequence and the complete
  convergence theorem for decreasing cochain filtrations (Layer 1 item 3);
- Hurewicz modulo a Serre class, the functorial Eilenberg–MacLane models `K(A, n)` for abelian
  `A` with their uniqueness, and the mod-2 vanishing theorem (Layer 1 item 4);
- independence of the Pontryagin–Thom collapse of a framed submanifold from the tube, its effect
  on fundamental classes and its compatibility with shriek maps (Layer 1 item 5);
- local triviality of evaluation `Diff(M) → O` onto the orbit of a chosen point (Layer 1 item 6);
- the positive-duration Moore loop maps of Hurewicz fibrations, Hurewicz fibrations from
  numerable bundles and coverings, the compatibility of the Moore comparison with the fibre
  actions, and the `π₀`-level shift of iterated loop spaces (Layer 2);
- basepoint change of DG local systems by the derived tensor product, and the arbitrary-CW
  Brown resolution (Layers 3–4);
- the Barraud–Cornea construction, DG Morse homology, its fibration theorem and its free-loop
  extension through broken geodesics (Layer 5);
- the Hamiltonian formalism beyond what the pinned Tau Ceti states: Hamiltonian vector fields
  of weakly nondegenerate forms, Hamiltonian functions and the Jacobi identity for their
  brackets, the Poisson bracket of strongly nondegenerate forms and first integrals on Banach
  manifolds, symplectic maps and symplectomorphisms between manifolds, the variational equation
  of autonomous and time-dependent flows and the symplecticity of maximal Hamiltonian flows
  (Layer 6 item 0);
- the action functional on contractible and free loops, symplectic asphericity and
  atoroidality, the completion of an abstract Liouville domain, the magnetic fibre translation as
  a symplectomorphism, the Liouville-flow argument for Corollary E, the ambient `π₁`-sensitive
  capacity of a subdomain, and almost existence on almost every level from a finite capacity
  (Layer 6);
- Hamiltonian Floer homology of periodic orbits, symplectic homology, the capped classical
  branch, the global-seam branch and the Floer–Novikov torsion (Layer 7);
- the DG Floer toolset and the DG Viterbo isomorphism (Layers 8–9);
- the criteria for almost existence and finiteness of `c°_HZ` and their cotangent applications
  (Layer 10);
- the invariant inner product, the semisimplicity of the derived ideal and the negative Killing
  form of the Lie algebra of a compact Lie group, the rank-one `SU(2)`
  homomorphisms of its roots, the finite cover `T × K → G` of a compact connected Lie group and
  the torus criterion (Layer 11).

**Already in the library.** The pinned Tau Ceti has much of the algebraic topology, DG algebra
and Hamiltonian dynamics that this package rests on, and this roadmap consumes it by name and
file (supplier contracts, From Tau Ceti) without restating it:

- Massey-normalized cubical singular chains, the strictly associative and unital cubical cross
  product with its cubical Eilenberg–Zilber and Künneth theorems, the natural chain homotopy
  equivalence with simplicial singular chains by acyclic models with its relative,
  cross-product and local-coefficient forms, and the DG algebra of chains on a topological monoid
  with the DG module of a space carrying a right action;
- the degree-one Hurewicz isomorphism for path-connected spaces in the smallest universe with its
  naturality, CW approximation of path-connected spaces, the invariance of singular, twisted and
  cubical homology under weak homotopy equivalences, Serre classes as Mathlib's
  `ObjectProperty.IsSerreClass` with the torsion and power-torsion classes, the attachment of
  cells killing higher homotopy groups, the first step of mod-2 vanishing, and the Pontryagin–Thom
  collapse of a framed tube;
- the Serre-fibration predicate `TauCeti.TopCat.serreFibrations` with its disc and cube
  characterizations, its closure under composition, base change, retracts and products, the
  covering-map, product-projection and locally-trivial-bundle instances, and lifting with a
  prescribed lift on the bottom and sides of a cube; the Hurewicz-fibration predicate
  `TauCeti.IsHurewiczFibration` with lifting functions, relative lifting for NDR pairs, fibre
  transport, the fixed-interval mapping-path carriers and loop maps, and the comparison with
  Serre fibrations; the spectral sequence of a filtered cochain complex, with its first page,
  naturality and convergence for finite and for exhaustive filtrations, and the Milnor `lim¹`
  sequence of a tower of complexes;
- Moore paths, Moore loops as a topological monoid and free Moore loops, transitive Moore
  lifting functions, the Moore-path replacement of an arbitrary map with its endpoint Hurewicz
  fibration, its strict right action of the Moore loops on the fibre and its fibre homotopy
  equivalence for a Hurewicz fibration, the homotopy equivalence of Moore and fixed-interval
  paths and loops, and the canonical homeomorphisms of mapping spaces out of spheres;
- DG local systems on a pointed space with their pullback, the DG local system of a map and
  of a transitive lifting function with the transport quasi-isomorphism, classical local systems
  as the DG local systems concentrated in degree zero, rank-one twisting, and the homology of a
  DG local system as a representation of `π₁`; twisting cocycles, the twisted complex,
  continuation and parametrized cocycles with their chain maps and homotopies, homologous
  cocycles, the index filtration with its spectral sequence and second page, and the row-finite
  twisted modules over an arbitrary graded basis;
- the Lemma 3.41 of the source, that a path-connected space is aspherical exactly when its
  double loop space has the integral homology of a point;
- the cotangent bundle of a manifold with its Liouville form and canonical symplectic form
  `ω = −dλ`, its codisc and cosphere bundles as a Liouville domain and its completion, fibre
  translation by a one-form; Liouville domains, Liouville vector fields, contact type and exact
  embeddings; periodic solutions of time-dependent vector fields and nondegenerate fixed points;
  the characteristic line of a regular level and the independence of closed characteristics
  from the defining function; the contractible almost existence property, the relative and the
  `π₁`-sensitive Hofer–Zehnder capacities, and closed characteristics on a dense set of levels
  below a finite capacity;
- the algebraic period group, cap classes and Novikov ring of a capped Floer theory;
- the local steps of Gromov compactness for pseudoholomorphic curves in a chart: energy
  quantization, finitely many bubbling points under an energy bound, locally uniform convergence
  away from them, and continuous removal of a finite-energy puncture.

AlgebraicTopology Stage 5.5 consumes the same Serre-fibration predicate.

**Numbering for citing roadmaps.** A citation of an item of this roadmap by number resolves as
follows. Layer 0 items 1–3: the cubical chains of the pinned Tau Ceti (From Tau Ceti); Layer 0
item 4: Layer 0 item 1. Layer 2 items 1–3 keep their numbers for what the pins lack about Moore
paths, Hurewicz fibrations and the canonical homeomorphisms; the Moore paths, Moore lifting
functions and Moore-path replacement are From Tau Ceti. Layer 3 item 1 keeps its number for
basepoint change; Layer 3 items 2, 3 and 4: `TauCeti.fibrationLocalSystem`,
`TauCeti.classicalDGLocalSystemEquivalence` and `TauCeti.RankOneLocalSystem`. Layer 4 items 1, 2,
3 and 4: `TauCeti.TwistingCocycle`, `TauCeti.TwistingCocycle.twistedCochainComplex`,
`TauCeti.ContinuationCocycle` with `TauCeti.ParametrizedCocycle`, and
`TauCeti.TwistingCocycle.indexSpectralSequence`; Layer 4 item 5: Layer 4 item 1.

**Left to named roadmaps.** The following objects are built elsewhere; this roadmap consumes
them by name and section (see the supplier contracts) and does not restate them.

| Object | Owner | Relation to this roadmap |
| --- | --- | --- |
| Morse–Smale pairs, compactified trajectory spaces with corners, the Morse complex over `𝔽₂` and `ℤ` | HeegaardFloer Lane M | consumed by Layer 5 |
| Local Sobolev maps on planar domains and half-discs, totally real boundary conditions, the Cauchy and Beurling operators, interior and boundary Cauchy–Riemann estimates, the similarity principle, the weak pseudoholomorphic equation with an inhomogeneous term (Floer's equation among its cases), elliptic bootstrapping and uniform estimates, real Cauchy–Riemann operators on compact bordered surfaces with their Fredholm theory, the Maslov index of a bundle pair and closed and bordered Riemann–Roch | PseudoholomorphicCurveAnalysis PH1–PH7 | consumed by Layer 7 |
| Fredholm theory, the sharp Sard–Smale theorem with its Banach-manifold adapters, Sobolev norms on strips and cylindrical ends, spectral flow, the Robbin–Salamon and Conley–Zehnder indices, determinant lines, relative `c₁` and Riemann–Roch on punctured surfaces with weighted ends, the clutching Chern number | HeegaardFloer Lanes F0–F1 | consumed by Layers 7–9 |
| Symplectic manifolds, the contraction inverse of a strongly nondegenerate two-form with its `df` specialization and the domain-local Moser lemma, almost complex structures, `J`-holomorphic curves, energy, local compactness, transversality and gluing | HeegaardFloer Lane F2 | consumed by Layers 6–9 |
| Product curves with a general closed source `Σ`, the product `J` and the slice-image classification in `[Σ] × [z₀]` | HeegaardFloer F2.6c | not consumed here |
| Stable maps of every genus with varying domain structure, their Hausdorff-graph topology, all-genus Gromov compactness, thickenings and implicit atlases | AnalyticStableMaps | its Layer 3 compactness at genus zero over compact tame families, with the evaluation maps of its §11.1, is consumed by Layer 7.C.2d through gap:genus-zero-stable-map-compactness (supplier contracts); thickenings and implicit atlases are not consumed |
| The general smooth symplectic suspension `Y_φ = (ℝ × M)/((t, x) ∼ (t + 1, φ⁻¹x))`, its seam-compatible block structure, periodic-orbit images and the compact horizontal-image theorem | SymplecticGeometry S0–S2 | S0's mapping torus is instantiated by Layer 7.T.1 at monodromy `f⁻¹`; S1–S2 are not consumed |
| The surface suspension, its vertical form, primitive orbit images and the point-count, product and zeta applications | TaubesGromov | not consumed here; TaubesGromov consumes SymplecticGeometry S0–S2, not this roadmap |
| Global flux of symplectic paths, the Hamiltonian kernel, the endpoint quotient `Ham → Symp₀ → H¹_dR/Γ_ω`, the area-normalized torus lattice and compact-support flux | HamiltonianReduction R1a.0–R1a.4 | R1a.0–R1a.1 and R1a.3–R1a.4 are not consumed; R1a.2's identity component `Symp₀(M, ω)` with its `C^∞` topology is consumed by Layer 7.T item 9 |
| The `Ad`-invariant orthogonal splitting `𝔨 = 𝔷 ⊕ [𝔨, 𝔨]` of the Lie algebra of a compact Lie group | HamiltonianReduction R5 | consumed by Layer 11 item 1; the rest of R5's gauge theory is not consumed |
| The `Sp(2, ℝ)` polar factorization `A = PU ↦ P^{1−t}U` and its symplectic polar factors | CotangentLagrangian C2.0–C2.1 | not consumed here |
| Period-controlled Novikov completions, finite-below convolution, total quotient rings and based torsion | MorseNovikov N1 and N4 | consumed by Layers 7.C and 7.T; N6's finite-dimensional bifurcation theorem is not a Floer theorem and is not consumed |
| Singular and twisted chains, CW pairs, Eilenberg–Zilber and Künneth, fundamental classes and duality, relative Hurewicz and Whitehead, the Hurewicz map of Stage 8.3, the bar construction of Stage 8.8 | AlgebraicTopology Stages 2–8 | consumed by Layers 0–1 and 5 |
| The restriction bundle of embeddings, collars and tubular neighbourhoods | GeometricTopology Layers 1, 3 and 7 | consumed by Layer 1 items 5–6; the group `Diff(M)` with its `C^∞` topology is the pinned `TauCeti.Diff` |
| Jacobi fields, the index form and the finite broken-geodesic carriers | RiemannianGeometry R2–R3 | consumed by Layer 5 item 6 |
| Compact Lie theory: Lie's third theorem and the integration of homomorphisms out of simply connected groups, universal covers and their central kernels, maximal tori, the Haar probability measure and averaging | LieGroups Layers 4–6, CompactGroups Layer 0 | consumed by Layer 11; the invariant inner product, the semisimplicity of the derived ideal, the negative Killing form and the rank-one `SU(2)` homomorphisms are Layer 11 items 1–2 |
| Covering spaces and their induced maps on homotopy groups | UniversalCovers (completed) | consumed by Layer 11 item 2 |
| The Lagrangian and polygon operations of the Fukaya category | FukayaTheory | not consumed; the graph and diagonal strip folding of Layer 7.G is the only Lagrangian construction here |

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
- The virtual, implicit-atlas comparison of the autonomous `S¹`-invariant sector of Floer
  cylinders with the regular time-dependent counts; the classical count and PSS branches of
  Layer 7.C are independent of it.

## Conventions

- **Cubical chains and the ordinary supplier.** The DG, Morse and Floer chains of this roadmap
  are Tau Ceti's normalized cubical singular chains `TauCeti.NormalizedCubicalChain`, as in the
  source and in BDHO §5.2. Layer 1 item 2's general ordinary-topology supplier uses
  AlgebraicTopology's native simplicial singular and twisted chains, and transports its homology
  and Serre sequence to cubical chains for the DG consumers.
  - A singular `n`-cube is a continuous map `Iⁿ → X`. It is degenerate when it does not depend
    on at least one coordinate (Massey's convention, which is BDHO §5.2's). The chain group is
    free on all cubes modulo the degenerate ones.
  - Serre's convention, which only asks independence of the last coordinate, is not used: it is
    not closed under the cross product.
  - The cross product `Iᵖ × I^q = I^{p+q}` is strictly associative and strictly unital. So
    `C_*(ΩB)` is a DG algebra under Moore concatenation with no Eilenberg–Zilber correction, and
    fundamental chains of products of trajectory spaces are cross products.
  - Every homological input from the algebraic topology roadmap is transported through Tau
    Ceti's comparison `TauCeti.cubicalSingularHomotopyEquiv` and its relative and
    local-coefficient forms, through named maps.
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
  fixed-interval loop space `Ω^{[0,1]}B = Map_*(S¹, B)`: for `B` a point, `ΩB ≅ [0, ∞)`
  (`TauCeti.MooreLoopSpace.lengthHomeomorph`). The comparison is Tau Ceti's homotopy equivalence
  `TauCeti.MooreLoopSpace.homotopyEquivPath`, multiplicative up to the homotopies
  `Path.transMooreLoopHomotopy` and `TauCeti.MooreLoopSpace.mulToPathHomotopy`, with its
  path-space form `TauCeti.MoorePath.fiberHomotopyEquivPathsBetween`, a fibre homotopy
  equivalence over the endpoint maps compatible with constant sections
  (`TauCeti.MoorePath.constantBetweenHomotopy`); its compatibility with the fibre actions used
  downstream is Layer 2 item 2's. Every homeomorphism with a mapping space in this roadmap is
  stated for the fixed-interval model and then composed with this comparison.
  - The duration `L` is a continuous function on the Moore space. On a Riemannian manifold, the
    geometric length of a Moore loop is only lower semicontinuous in the compact-open topology,
    and the loops parametrized at unit speed are **not** a closed subspace: in a flat torus, the
    unit-speed loops `γ_n(t) = (sin 2πnt, 1 − cos 2πnt)/(2πn)` of duration `1` converge to the
    constant loop of duration `1`, whose unit-speed representative has duration `0`. So no
    statement of this roadmap filters a Moore space by geometric length, and no subspace of
    unit-speed loops appears anywhere. The source's Lemma 4.5 is replaced by the compact-family
    approximation of Layer 5 item 6.
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
  Hurewicz lifts or fibre homotopy equivalences; those come from Tau Ceti's lifting functions
  `TauCeti.LiftingFunction` and its Moore-path replacement `TauCeti.MooreReplacement`.

  For metrizable `Y` the raw mapping and stopped-path carriers are metrizable, hence compactly
  generated, so that every k-ification comparison is a homeomorphism there: Mathlib's metric on
  `C(K, Y)` for a compact metric sphere or interval source, and Tau Ceti's `MetrizableSpace`
  instances on `TauCeti.MoorePath`, `TauCeti.MooreLoopSpace` and `TauCeti.MooreFreeLoopSpace`.
  For non-metrizable `Y` no such statement is made: for `Y = ℝ^J` with `J` uncountable the
  length-zero Moore paths form a closed copy of `Y`, and `ℝ^J` is not compactly generated.
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
  - *Hamiltonian vector fields* are Tau Ceti's: `TauCeti.SmoothTwoForm.IsHamiltonianVectorField`
    is the equation `ι_{X_H} ω = dH`, and `TauCeti.SmoothTwoForm.hamiltonianVectorField` is
    `X_H = (ω♭)⁻¹ dH` (Layer 6 item 0). The source's §3.2 uses `ω(X_H, ·) = −dH`. At a **fixed** form `ω`, the bridge is
    `X^{source}_{ω,H} = X_{ω,−H}`, proved once.
  - *The symplectic form of a cotangent bundle* is Tau Ceti's
    `TauCeti.CotangentBundle.symplecticForm`, `ω_can = −dλ_can` for the Liouville form
    `TauCeti.CotangentBundle.liouvilleForm`, `λ_can = p dq`. In bundle charts it is the linear
    `TauCeti.strongDualCotangentSymplecticForm`, `ω_can((v, α), (w, β)) = β(v) − α(w)`, so
    `ω_can(∂_q, ∂_p) = 1` on `T*ℝ`. No second canonical form is introduced. The source works with
    `ω_src = dλ_can = −ω_can`.
  - *Liouville domains* use `ω = dλ` and `ι_Z ω = λ`. On a cotangent bundle the Liouville
    primitive of `ω_can` is therefore `λ = −λ_can = −p dq`, and its Liouville field is the
    fibrewise radial field `Z = p ∂_p`, outward along `S*Q`
    (`TauCeti.CotangentBundle.symplecticForm_interior_vectorBundleEulerField`).
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
  built from a universal test object (Layer 1 item 2's all-CW testing, Tau Ceti's lifting
  functions) the statement names the universe of the test object and transports along `ULift`.
## Exact supplier contracts

Every declaration below exists at the pinned Mathlib and Tau Ceti. What the pins lack is a target
of this roadmap or of the named supplier; nothing listed here is restated as a target.

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
  object of a functor into the homotopy category exists. Mathlib has no filtration functor on
  cochain complexes and no convergence theorem; Tau Ceti has both (From Tau Ceti).
- `DirectSum.Decomposition`, `DirectSum.decomposeLinearEquiv`, `DirectSum.lmap`,
  `GradedAlgebra`, `Int.negOnePow`, `MulOpposite` (Layer 4).
- `ModelWithCorners`, `ChartedSpace`, `LieGroup`, the scoped `ContDiff` notation `∞`, `Circle`,
  `ContinuousMulEquiv` (written `≃ₜ*`), `Matrix.specialOrthogonalGroup` (Layer 11); integral
  curves and flows of vector fields on manifolds (`Mathlib/Geometry/Manifold/IntegralCurve/`).
- `Monotone.ae_differentiableAt` (`Mathlib/Analysis/Calculus/Monotone.lean`), for the
  Hofer–Zehnder–Struwe argument of Layer 6 item 5.
- For Layer 6 item 0: `mvfderiv` (the differential of a real function on a manifold),
  `extChartAt`, the pullback of vector fields `VectorField.mpullback` and its chart form
  `VectorField.mpullbackWithin` (`Mathlib/Geometry/Manifold/VectorField/Pullback.lean`),
  `VectorField.mlieBracket`, `IsMIntegralCurveOn` with local existence of integral curves
  `exists_isMIntegralCurveAt_of_contMDiffAt_boundaryless`, `ContinuousLinearMap.IsInvertible`,
  the Hahn–Banach theorem `exists_dual_vector`, diffeomorphisms `M ≃ₘ^n⟮I, I'⟯ M'` with
  `ContinuousLinearEquiv.toDiffeomorph`, and `LinearEquiv.toContinuousLinearEquiv` in finite
  dimension.

### From Tau Ceti

- Cubical chains (`TauCeti/AlgebraicTopology/Singular/Cubical/`): singular cubes
  `TauCeti.SingularCube` with Massey's degeneracy, the normalized chains
  `TauCeti.NormalizedCubicalChain` and their functor `TauCeti.normalizedCubicalChainComplex`; the
  cross product `TauCeti.NormalizedCubicalChain.crossProduct`, strictly associative and unital
  (`TauCeti.NormalizedCubicalChain.crossProduct_assoc`) with the Koszul Leibniz rule
  (`TauCeti.NormalizedCubicalChain.boundary_crossProduct`), its relative form on pairs, its chain
  map `TauCeti.cubicalCrossProduct` with `TauCeti.quasiIso_cubicalCrossProduct` and the cubical
  Künneth theorem `TauCeti.isIso_cubicalHomologyKunneth`; the natural chain homotopy equivalence
  `TauCeti.cubicalSingularHomotopyEquiv` with simplicial chains (acyclic models; points to points
  in degree zero), the homology isomorphism `TauCeti.singularCubicalHomologyIso`, the cross-product
  homotopy `TauCeti.cubicalSingularCrossProductHomotopy`, the cubical long exact sequence of a pair
  with `TopPair.cubicalHomologyδ` and excision, homotopy invariance
  `ContinuousMap.HomotopyEquiv.normalizedCubicalChainComplexHomotopyEquiv`, and the comparison
  with local coefficients `TauCeti.LocalCoefficientSystem.twistedCubicalToSingularMap`; for a
  topological monoid `G`, the DG algebra `TauCeti.normalizedCubicalChainAlgebra` with
  `TauCeti.cubicalChain_isDGAlgebra` (`C_n` in degree `−n`), and for a space with a strict right
  `G`-action the DG right module `TauCeti.cubicalChainModule` with
  `TauCeti.cubicalChainModule_isDGRightModule`, equivariant homotopy equivalences inducing
  quasi-isomorphisms (`TauCeti.isQuasiIso_cubicalChainModuleMap`). What Layers 0, 3 and 5
  assume: the chains are those of BDHO §5.2, and the comparison is used through these named maps.
- Layer 1 inputs. The degree-one Hurewicz isomorphism
  `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv : π₁(X, x)ᵃᵇ ≃+ H₁(X; ℤ)` for path-connected
  `X : TopCat.{0}` on simplicial singular chains
  (`TauCeti/AlgebraicTopology/Homotopy/Hurewicz/One/`), natural
  (`TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv`), and equal to minus the degree-one
  relative-class Hurewicz map (`HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁`). CW
  approximation of a path-connected space, `TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`,
  natural up to homotopy (`TauCeti/AlgebraicTopology/Homotopy/CWApproximation/`). Weak homotopy
  equivalences induce isomorphisms on singular homology with coefficients in any ring
  (`ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap`), on homology with local
  coefficients (`ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap`) and on
  cubical chains (`TauCeti/AlgebraicTopology/Singular/Homotopy/WeakHomotopyEquivalence.lean`);
  for a pair `(X, A)` with vanishing relative homotopy below `n`, relative homology vanishes below
  `n` (`TauCeti.isZero_singularHomology_ofSubset_of_relHomotopyGroup`). Serre classes are
  Mathlib's `CategoryTheory.ObjectProperty.IsSerreClass` (subobjects, quotients, extensions), with
  the classes `AddCommGrpCat.isTorsion` and `AddCommGrpCat.isKilledBySomePower`, their closure
  under `⊗` and `Tor`, and the `K(A, 1)` axiom for finite `A`
  (`TauCeti/AlgebraicTopology/SerreClass/`,
  `TauCeti/AlgebraicTopology/ClassifyingSpace/Torsion.lean`). Cell attachments killing the
  homotopy groups above a degree, `TauCeti.killHomotopyGroups`
  (`TauCeti/AlgebraicTopology/Homotopy/KillHomotopyGroups.lean`). The vanishing of positive
  mod-`m` homology of the classifying space of a finite group of order prime to `m`,
  `TauCeti.subsingleton_classifyingSpace_singularHomology_of_isUnit_natCard`, and of `ℤ[1/m]`,
  `TauCeti.isZero_classifyingSpace_singularHomology_localizationAway`, on Milnor's classifying
  space. The coefficient sequence `0 → ℤ → ℤ → ℤ/2 → 0` in singular homology, with
  `TopCat.isUniquelyTwoDivisible_singularHomology_of_isZero_mod_two` (vanishing mod-2 homology in
  degrees `i` and `i + 1` makes `H_i(−; ℤ)` uniquely 2-divisible), and the first step of mod-2
  vanishing, `TauCeti.isUniquelyTwoDivisible_homotopyGroup_of_isZero_mod_two`, for spaces in
  `Type` (`TauCeti/AlgebraicTopology/Homotopy/Hurewicz/TwoDivisible.lean`). The Pontryagin–Thom
  collapse `TauCeti.pontryaginThomCollapseMap` of a framed tube `TauCeti.IsFramedTube`, its
  homotopy class under an isotopy of tubes, and the existence of tubes for globally framed
  embeddings `TauCeti.SmoothEmbedding.exists_isFramedTube`
  (`TauCeti/Geometry/Manifold/PontryaginThom/`). The group `TauCeti.Diff` of a compact manifold
  with the weak Whitney topology `Diffeomorph.weakWhitneyTopology`, a topological group with
  continuous evaluation, and its transitivity on a connected manifold by diffeotopies
  (`TauCeti/Geometry/Diffeomorphism/`). The Milnor `lim¹` sequence of a tower of complexes,
  `TauCeti.ComplexTower` (`TauCeti/Algebra/Category/ModuleCat/Tower/Milnor/`).
- Moore paths (`TauCeti/Topology/PathSpace/Moore.lean` and `TauCeti/Topology/PathSpace/Moore/`):
  `TauCeti.MoorePath`, topologized in `ℝ≥0 × C(ℝ≥0, X)`, with strictly associative and unital
  concatenation `TauCeti.MoorePath.trans`, the paths from `A` to `B`
  `TauCeti.MoorePath.pathsBetween`, the Moore loops `TauCeti.MooreLoopSpace` as a topological
  monoid, and the free Moore loops `TauCeti.MooreFreeLoopSpace` with their constant loops (a
  closed embedding onto the loops of duration `0`) and contractible loops; `MetrizableSpace`
  instances for metrizable `X`. Moore lifting functions `TauCeti.MooreLiftingFunction`
  (continuous, duration-preserving, sending length-zero paths to length-zero paths) and their
  transitivity `TauCeti.MooreLiftingFunction.IsTransitive`; for an arbitrary map `p`, the
  Moore-path replacement `TauCeti.MooreReplacement` with its endpoint Hurewicz fibration
  `TauCeti.MooreReplacement.isHurewiczFibration_endpoint` and transitive lifting function by
  concatenation, the strict continuous right action of `TauCeti.MooreLoopSpace` on its fibre
  `TauCeti.MooreReplacement.Fiber`, transport `TauCeti.MooreLiftingFunction.transport`, strictly
  equivariant for a transitive lifting function, and for a Hurewicz fibration the fibre homotopy
  equivalence `TauCeti.MooreReplacement.fiberHomotopyEquiv`; the endpoint fibration
  `TauCeti.MoorePath.isHurewiczFibration_target`, and restriction along a closed cofibration
  `TauCeti.HasHomotopyExtensionProperty.isHurewiczFibration_restrict`. The comparison with fixed
  intervals: `TauCeti.MoorePath.homotopyEquivUnitPath`, `TauCeti.MooreLoopSpace.homotopyEquivPath`
  with its multiplicativity homotopies, `TauCeti.MoorePath.fiberHomotopyEquivPathsBetween`, and
  `TauCeti.MooreLoopSpace.homotopyGroupMulEquiv : π_{n+1}(ΩᴹX) ≃* π_{n+2}(X)`.
- Mapping spaces out of spheres (`TauCeti/Topology/MappingSpace/`):
  `TauCeti.BasedTopologicalSpace.basedMapCircleHomeomorph` (`Map_*(S¹, Y) ≅ ΩY`),
  `TauCeti.BasedTopologicalSpace.basedMapSphereHomeomorphIteratedLoopSpace`
  (`Map_*(Sᵏ, X) ≅ Ωᵏ X`), `TauCeti.basedMapSphere2HomeomorphBasedContractibleConstLoopPath` and
  `TauCeti.sphere2HomeomorphContractibleConstLoopPath` (`P_{⋆→Q}𝓛₀Q ≅ Map_*(S², Q)` and
  `P_{Q→Q}𝓛₀Q ≅ Map(S², Q)`), `TauCeti.BasedTopologicalSpace.loopSpace2ToMapCircle`
  (`Ω²X → Map(S¹, ΩX)`) with the degree-raising map `TauCeti.degreeRaising`
  (`TauCeti/AlgebraicTopology/Homotopy/DegreeRaising.lean`), the section by constant maps
  `TauCeti.mappingSpaceEval_comp_const'`, and for a topological group `G`,
  `TauCeti.mappingSpaceGroupHomeomorph` (`G × Map_*(X, G) ≅ Map(X, G)`) with its Moore form
  `TauCeti.sphere2GroupHomotopyEquivMoore`.
- DG local systems (`TauCeti/AlgebraicTopology/DGLocalSystem/`): the loop DG algebra
  `TauCeti.loopChainAlgebra` with `TauCeti.loopChain_isDGAlgebra`, its augmentation and
  functoriality `TauCeti.loopChainMap`; DG local systems `TauCeti.DGLocalSystem` (right DG
  modules over it, the source's Definition 1.8) with pullback `TauCeti.DGLocalSystem.pullback`,
  and families over chosen basepoints `TauCeti.DGLocalSystemFamily`; the chain bimodule of Moore
  paths between two basepoints `TauCeti.pathChain_isDGBimodule`; the DG local system of a map
  `TauCeti.fibrationLocalSystem` (the chains of the fibre of its Moore-path replacement), that of
  a transitive lifting function `TauCeti.liftingLocalSystem`, the transport quasi-isomorphism
  `TauCeti.isQuasiIso_transportLocalSystemHom` and the comparison zigzag
  `TauCeti.liftingLocalSystemRoof`; classical local systems as the DG local systems concentrated
  in degree zero, `TauCeti.classicalDGLocalSystemEquivalence`; rank-one twisting
  `TauCeti.RankOneLocalSystem` with `TauCeti.RankOneLocalSystem.twistedCochainComplexIso` (the
  source's Lemma 2.1 and Proposition 2.2) and `H(𝓕 ⊗ L) ≅ H(𝓕) ⊗ L`; and the action of `π₁` on
  the homology of a DG local system, `TauCeti.IsDGRightModule.cohomologyRepresentation`.
- Twisted complexes (`TauCeti/Algebra/Homology/DG/Twisted/`): twisting cocycles
  `TauCeti.TwistingCocycle` (the source's Definition 1.9, with
  `d (m x y) = Σ_z (−1)^{ind x − ind z} m x z · m z y` and one-sidedness as data, automatic over a
  cohomologically nonpositive algebra by `TauCeti.TwistingCocycle.one_sided_of_nonpos`); the
  twisted differential `TauCeti.twistedDifferential` with `TauCeti.twistedDifferential_sq_zero` and
  the twisted complex `TauCeti.TwistingCocycle.twistedCochainComplex`; continuation cocycles
  `TauCeti.ContinuationCocycle` (Definition 1.10,
  `d (ν x y) = Σ_z m⁺ x z · ν z y + Σ_z (−1)^{ind x − ind z − 1} ν x z · m⁻ z y`) with their chain
  maps `TauCeti.ContinuationCocycle.continuationHom`; parametrized cocycles
  `TauCeti.ParametrizedCocycle` (Definition 1.11) with their chain homotopies; homologous
  cocycles `TauCeti.Homologous` with `TauCeti.Homologous.homotopyEquiv`; the index filtration with
  its spectral sequence `TauCeti.TwistingCocycle.indexSpectralSequence`, finite convergence, first
  page and second page `TauCeti.TwistingCocycle.indexSpectralSequenceSecondPageXIso` (the homology
  of the classical complex with coefficients `H_q(𝓕)`), continuation maps of spectral sequences
  `TauCeti.ContinuationCocycle.indexSpectralSequenceMap`; the classical twisted complex of a
  classical local system `TauCeti.classicalTwistedCochainComplexIso`; and row-finite twisting
  cocycles over an arbitrary graded basis `TauCeti.RowFiniteTwistingCocycle` with their free
  modules, continuations, homotopies and cell filtration.
- Lemma 3.41 of the source, `TauCeti.isAspherical_iff_doubleLoopSpace_singularHomology`, with its
  cubical and Moore forms, for path-connected `X : Type`
  (`TauCeti/AlgebraicTopology/Homotopy/LoopSpace/Aspherical.lean`), and the first homology of the
  double loop space `TauCeti.MooreLoopSpace.doubleFirstCubicalHomologyAddEquiv`
  (`H₁(Ω²X) ≅ π₃(X)` when `π₂(X) = 0`).
- The integral fundamental class of a compact oriented topological manifold
  `TauCeti.HomologicalOrientation.fundamentalClass` and its image under a map
  `TauCeti.HomologicalOrientation.mapFundamentalClass`
  (`TauCeti/AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean`); it needs an
  orientation and has integer coefficients.
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
- Cotangent bundles (`TauCeti/Geometry/Symplectic/Cotangent/Bundle/`): the cotangent bundle
  `TauCeti.CotangentBundle I M` of a manifold, with or without boundary and in any dimension, its
  Liouville form `TauCeti.CotangentBundle.liouvilleForm` (`λ_p(v) = p(dπ v)`, `Σ pᵢ dqᵢ` in
  charts) and canonical form `TauCeti.CotangentBundle.symplecticForm = −dλ` (symplectic by
  `TauCeti.CotangentBundle.isSymplectic_symplecticForm`; in charts the linear
  `TauCeti.strongDualCotangentSymplecticForm`, so `ω(∂_q, ∂_p) = 1`), the fibrewise radial field
  with `ι_{p∂_p} ω = −λ` (`TauCeti.CotangentBundle.symplecticForm_interior_vectorBundleEulerField`),
  for a Riemannian metric the codisc and cosphere bundles `TauCeti.CotangentBundle.codiscBundle`
  and `TauCeti.CotangentBundle.cosphereBundle`, with
  `TauCeti.CotangentBundle.isLiouvilleDomain_codiscBundle` (for compact boundaryless `M` of
  finite dimension, `(D*M, −λ)` is a Liouville domain) and
  `TauCeti.CotangentBundle.isLiouvilleCompletion_codiscBundle`, and fibre translation by a
  one-form `α`, `p ↦ p + α`, with
  `TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm`
  (`τ_α^* ω = ω − π^* dα`). The linear models `cotangentSymplecticForm` and
  `cotangentLiouvilleForm` on `V × V^*` (`TauCeti/Geometry/Symplectic/Cotangent/`) with
  `cotangentSymplecticForm_apply` and the fibre negation `TauCeti.cotangentFiberNeg`; the linear
  `SymplecticForm` structure (`TauCeti/Geometry/Symplectic/AlmostComplex.lean`);
  `SmoothAlmostComplexStructure` and `IsPseudoholomorphicAt`
  (`TauCeti/Geometry/Symplectic/Manifold/`).
- Liouville domains, periodic orbits, closed characteristics and capacities
  (`TauCeti/Geometry/Symplectic/Liouville/`, `TauCeti/Geometry/Symplectic/Hamiltonian/`,
  `TauCeti/Geometry/Symplectic/Capacity/`, `TauCeti/Geometry/Manifold/Flow/Periodic.lean`).
  `TauCeti.IsLiouvilleDomain ω α W` for a compact subset `W` of an ambient manifold (`dα = ω`, a
  Liouville field `ι_Z ω = α` transverse outward to `W = {f ≤ c}`), its completion inside the
  ambient manifold `TauCeti.IsLiouvilleCompletion`, Liouville vector fields
  `TauCeti.IsLiouvilleVectorField` (`L_Z ω = ω`), contact type and restricted contact type
  `TauCeti.IsContactType` and `TauCeti.IsRestrictedContactType`, Hamiltonians linear at infinity
  `TauCeti.IsLinearAtInfinity`, and exact embeddings `TauCeti.IsExactLiouvilleEmbedding`. Periodic
  solutions of a time-dependent vector field `TauCeti.periodicSolutions`, nondegenerate fixed points
  `TauCeti.IsNondegenerateFixedPt`, and the finiteness of the 1-periodic orbits of a nondegenerate
  Hamiltonian on a closed manifold
  `TauCeti.SmoothTwoForm.IsNondegenerate.finite_periodicSolutions_hamiltonianVectorField`. The
  characteristic line of a regular level and the independence of closed characteristics from the
  defining function `TauCeti.SmoothTwoForm.IsNondegenerate.exists_homeomorph_isMIntegralCurve_comp`.
  Closed characteristics contractible in `W`,
  `TauCeti.SmoothTwoForm.HasContractibleClosedCharacteristic`, and the contractible almost existence
  property `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` (the source's Definition 1.1:
  almost every regular level near `c` carries one; properness and regularity of `c` are hypotheses
  of the theorems, not of the definition). The `π₁`-sensitive Hofer–Zehnder capacity
  `TauCeti.SmoothTwoForm.contractibleHZCapacity σ W`, whose admissible Hamiltonians may have fast
  periodic orbits that are not contractible **in `W`** (so it is the source's `c°_HZ(W)` of
  Definition 6.1 for the whole domain, conformal and invariant under symplectomorphisms, but not
  monotone under inclusions), the relative capacity
  `TauCeti.SmoothTwoForm.relContractibleHZCapacity` (Definition 5.3, contractibility tested in the
  ambient manifold, with nonnegative Hamiltonians where the source uses their negatives), and the
  existence of a closed characteristic on some level of every interval below a finite capacity,
  `TauCeti.SmoothTwoForm.IsNondegenerate.exists_mem_Ioo_hasContractibleClosedCharacteristic`, a
  dense set of levels, not almost every level. The action of a loop in a symplectic vector space,
  `TauCeti.SymplecticForm.hamiltonianAction` (`∫ D^*ω + ∫ H dt` for the cone cap `D`).
- Capped Floer algebra (`TauCeti/Geometry/Symplectic/Floer/`): for an abelian group `S` with area
  `ω : S →+ ℝ` and Chern number `c : S →+ ℤ`, the period group
  `TauCeti.Floer.PeriodGroup ω c = S / (ker ω ∩ ker c)`, the cap classes
  `TauCeti.Floer.CapClass` of an `S`-torsor with their recapping laws, and the Novikov ring
  `TauCeti.Floer.NovikovRing` with valuation `−ω`. These are algebraic: `S`, the torsor and the
  homomorphisms are supplied by the caller.
- Local compactness of pseudoholomorphic curves in a chart
  (`TauCeti/Geometry/Symplectic/JHolomorphic/Energy/` and
  `TauCeti/Geometry/Symplectic/JHolomorphic/RemovableSingularity.lean`), consumed by Layer
  7.C.3. The structure is one `C²` matrix-valued `J : V → (V →L[ℝ] V)` on an open set `W` of a
  real inner product space with `J(x)² = −1` on a compact `K ⊆ W`; curves are `C³` solutions of
  `∂ₜu = J(u) ∂ₛu` on an open `Ω ⊆ ℂ` with image in `K`, and energy is `∫ ‖∂ₛu‖²`. Energy
  quantization `TauCeti.exists_pos_forall_le_integral_norm_fderiv_one_sq_of_ne` (a nonconstant
  plane has energy at least a threshold `δ > 0` depending on `J` and `K`); finitely many
  bubbling points `TauCeti.exists_pos_forall_exists_strictMono_finset_norm_fderiv_le` (for a
  sequence with energy at most `E`, a subsequence and a finite `Z ⊆ Ω` with `#Z · δ ≤ E`, energy
  at least `δ` concentrating at each point of `Z`, and derivatives bounded on compact subsets of
  `Ω ∖ Z`); locally uniform convergence off `Z` to a continuous limit with image in `K`,
  `TauCeti.exists_pos_forall_tendstoLocallyUniformlyOn_subseq_off_finset`; and continuous removal
  of a finite-energy puncture for a uniformly tamed structure,
  `TauCeti.SymplecticForm.exists_continuousOn_update_of_finite_energy`. None of them lets `J`
  vary along the sequence, constructs the rescaled bubbles, or gives smoothness of the limit or at
  the puncture; for spheres those come with gap:genus-zero-stable-map-compactness (below), and
  for Floer cylinders they are 7.C.3's, with PseudoholomorphicCurveAnalysis PH5 and HeegaardFloer
  F2.3.
- The Hamiltonian formalism on manifolds (`TauCeti/Geometry/Symplectic/Manifold/`,
  `TauCeti/Geometry/Symplectic/Hamiltonian/`), consumed by Layer 6 item 0. Two-forms are the
  degree-two smooth forms `TauCeti.SmoothTwoForm`, with evaluation
  `TauCeti.SmoothBundleForm.eval₂`, the pullback `TauCeti.SmoothForm.mpullback` and
  `TauCeti.SmoothForm.eval₂_mpullback`, the flat maps `TauCeti.SmoothTwoForm.flat` and
  `TauCeti.SmoothTwoForm.isNondegenerate_iff_isInvertible_flat`, the predicates
  `TauCeti.SmoothTwoForm.IsNondegenerate` (injective flat maps) and
  `TauCeti.SmoothTwoForm.IsSymplectic`, and the restriction to open subsets
  `TauCeti.SmoothTwoForm.IsSymplectic.mpullback_subtype_val` with
  `TauCeti.Manifold.tangentSpaceOpenEquiv`. Hamiltonian vector fields:
  `TauCeti.SmoothTwoForm.IsHamiltonianVectorField` (`ι_X ω = df`, with
  `TauCeti.SmoothTwoForm.isHamiltonianVectorField_iff_interior_eq`), the field
  `TauCeti.SmoothTwoForm.hamiltonianVectorField` (`(ω♭)⁻¹ df`, junk `0` where `ω♭_x` is not
  invertible) with `TauCeti.SmoothTwoForm.hamiltonianVectorField_add`,
  `TauCeti.SmoothTwoForm.hamiltonianVectorField_const_smul` and
  `TauCeti.SmoothTwoForm.hamiltonianVectorField_comp`, and in finite dimension
  `TauCeti.SmoothTwoForm.IsNondegenerate.isHamiltonianVectorField_iff_eq` and
  `TauCeti.SmoothTwoForm.IsNondegenerate.contMDiff_hamiltonianVectorField_uncurry`;
  `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.mvfderiv_apply_self` and conservation of
  energy `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.apply_eq_of_isMIntegralCurveOn`. The
  Poisson bracket `TauCeti.SmoothTwoForm.poissonBracket` (`{f, g} = ω(X_f, X_g)`) with
  `TauCeti.SmoothTwoForm.neg_poissonBracket`, `TauCeti.SmoothTwoForm.poissonBracket_add_left`,
  and in finite dimension `TauCeti.SmoothTwoForm.IsNondegenerate.poissonBracket_eq_mvfderiv`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.hamiltonianVectorField_poissonBracket` and
  `TauCeti.SmoothTwoForm.IsNondegenerate.poissonBracket_jacobi`; the bracket of Hamiltonian
  vector fields of a closed form `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.mlieBracket`,
  with the differential of `ω(X, Y)`,
  `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.mvfderiv_eval₂`;
  first integrals `TauCeti.SmoothTwoForm.IsFirstIntegral` with
  `TauCeti.SmoothTwoForm.IsFirstIntegral.apply_maximalIntegralCurve`. Naturality in finite
  dimension: `TauCeti.SmoothTwoForm.IsNondegenerate.mfderiv_hamiltonianVectorField_comp`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.poissonBracket_comp` and
  `TauCeti.SmoothTwoForm.IsNondegenerate.isMIntegralCurve_comp_hamiltonianVectorField`.
  Complete Hamiltonian flows preserve a closed form,
  `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.mpullback_globalFlow`. The linear theory:
  `TauCeti.SymplecticForm`, `TauCeti.SymplecticForm.IsSymplectomorphism`,
  `TauCeti.SymplecticForm.constSmooth` and
  `TauCeti.SymplecticForm.hamiltonianVectorField_constSmooth`. Flows: the maximal flow
  `TauCeti.flowOf` on `TauCeti.flowDomain` with `TauCeti.contMDiffOn_flowOf`; the maximal
  time-dependent flow `TauCeti.timeDependentFlowOf` of a time-dependent vector field, built from
  its suspension `(t, x) ↦ (1, X_t x)` on `ℝ × M`, on `TauCeti.timeDependentFlowDomain`, with
  `TauCeti.contMDiffOn_timeDependentFlowOf`, `TauCeti.hasMFDerivAt_timeDependentFlowOf` and
  `TauCeti.timeDependentFlowOf_trans_of_mem`; on integral curves
  `IsMIntegralCurveOn.apply_eq_of_mvfderiv_apply_eq_zero` and
  `TauCeti.Manifold.hasDerivAt_comp_curve`; the vector-space variational equation
  `TauCeti.hasDerivAt_fderiv_timeDependentFlow`. What the pins lack of this formalism, in
  infinite dimension, for maps between manifolds and for incomplete or time-dependent flows, is
  Layer 6 item 0's.
- The Morse lemma `IsMorse.nonempty_morseChart` (`TauCeti/Geometry/Manifold/Morse/Lemma.lean`)
  and the Morse index (`TauCeti/Geometry/Manifold/Morse/Index.lean`); finite-dimensional Sard
  (`TauCeti/Analysis/Calculus/Sard/`). Sard–Smale for Fredholm maps on Banach spaces,
  `TauCeti.isMeagre_image_criticalPoints_of_isFredholm`
  (`TauCeti/Analysis/Fredholm/SardSmale.lean`), is at the pin; HeegaardFloer Lane F0 owns its
  sharp finite-order bound and the Banach-manifold, bundle and Fredholm-section adapters through
  which the Floer layers use it.
- Serre fibrations (`TauCeti/Topology/Homotopy/SerreFibration/`, with the homotopy lifting
  property `TauCeti.HasHomotopyLiftingProperty` in `TauCeti/Topology/Homotopy/Lifting/`):
  `TauCeti.TopCat.serreFibrations`, the `MorphismProperty` of `TopCat.{u}` given by the right
  lifting property against the bottom inclusions `Dⁿ → Dⁿ × I`; its characterizations
  `TauCeti.TopCat.mem_serreFibrations_iff` (homotopy lifting for the closed unit ball of every
  `ℝⁿ`) and `TauCeti.TopCat.mem_serreFibrations_iff_cube` (for every cube `Fin n → I`); the
  instances `IsMultiplicative`, `RespectsIso`, `IsStableUnderBaseChange`,
  `IsStableUnderRetracts` and `IsStableUnderProductsOfShape`;
  `TauCeti.TopCat.mem_serreFibrations_pullbackFst`, `TauCeti.TopCat.mem_serreFibrations_fst`,
  `IsCoveringMap.mem_serreFibrations` and
  `TauCeti.TopCat.exists_path_lift_of_mem_serreFibrations`;
  `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` and
  `TauCeti.TopCat.mem_serreFibrations_proj` (a locally trivial map, or the projection of a
  `FiberBundle`, is a Serre fibration, with no paracompactness hypothesis on the base; Hatcher
  Proposition 4.48); and `TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations` (a lift
  prescribed on the bottom face and the boundary cylinder of a finite cube `I × Iᴺ`, continuous on
  that union only, extends to the whole cylinder; `N` may be empty). What Layer 1 item 2 assumes
  of them: total space and base are objects of one `TopCat.{u}`, and the predicate builds in no
  surjectivity. Lifting against arbitrary relative CW pairs and the fibration homotopy exact
  sequence are not at the pin; they are Layer 1 item 2's.
- Hurewicz fibrations (`TauCeti/Topology/Homotopy/HurewiczFibration/`,
  `TauCeti/Topology/Homotopy/MappingPath/`, `TauCeti/Topology/Homotopy/LoopSpaceFibration.lean`):
  `TauCeti.IsHurewiczFibration.{w} p`, continuity and homotopy lifting for every test space in
  the universe `w`, with `TauCeti.IsHurewiczFibration.mem_serreFibrations`,
  `TauCeti.IsHurewiczFibration.comp`, `TauCeti.IsHurewiczFibration.pullback` and
  `TauCeti.isHurewiczFibration_fst`; lifting functions `TauCeti.LiftingFunction p` on the
  mapping-path space `TauCeti.MappingPathSpace p`, with
  `TauCeti.isHurewiczFibration_iff_nonempty_liftingFunction`; relative lifting for NDR pairs,
  `TauCeti.IsHurewiczFibration.exists_lift_of_ndrPair`; fibre transport
  `TauCeti.LiftingFunction.transport`; the mapping-path fibres `TauCeti.MappingPathFiber`, the
  homeomorphisms `TauCeti.mappingPathFiberConstHomeomorphPath` onto native `Path b k` and
  `TauCeti.mappingPathFiberConstHomeomorphLoopSpace` onto native `LoopSpace K k`, the endpoint
  fibration `TauCeti.MappingPathSpace.isHurewiczFibration_endpoint` and the contractibility of
  the based path space; and `TauCeti.IsHurewiczFibration.loopMap` and
  `TauCeti.IsHurewiczFibration.loopMap_loopMap` on fixed-interval loop spaces. The Moore-path
  forms are in the Moore-path bullet above.
- The spectral sequence of a filtered complex
  (`TauCeti/Algebra/Homology/SpectralSequence/Filtered/`): for an increasing filtration
  `F : ℤ → Subobject K` of a cochain complex in an abelian category, the `EInt`-indexed functor
  `CochainComplex.filtrationFunctor`, its spectral sequence `CochainComplex.spectralSequence`
  for Mathlib's `coreE₂Cohomological` (first page numbered `2`, object `H^{p+q}(F_{q+1}/F_q)`
  at `(p, q)`, differential to `(p + 2, q − 1)`), the first-page identifications
  `CochainComplex.spectralSequenceFirstPageXIsoCokernel` and
  `CochainComplex.spectralSequence_first_page_d_eq`, the abutment
  `CochainComplex.filtrationAbutmentIso`, strong convergence for a finite filtration
  (`CochainComplex.filtrationSpectralSequencePageXIsoGradedOfFinite`) and, over `ModuleCat R`,
  for an exhaustive one (`CochainComplex.filtrationSpectralSequencePageXIsoGradedOfExhaustive`),
  naturality `CochainComplex.filtrationFunctorMap` and the comparison theorem
  `CochainComplex.isIso_homologyMap_of_isIso_spectralSequence_page`; and its instance on singular
  chains, `TauCeti.singularChainFiltration` with `TauCeti.filteredSpaceSpectralSequence`
  (`TauCeti/AlgebraicTopology/Singular/FilteredSpace.lean`). Decreasing complete filtrations and
  their convergence are not at the pin; they are Layer 1 item 3's.

### From TauCetiRoadmap.PseudoholomorphicCurveAnalysis

- PH1–PH7: local `W^{k,p}` maps on planar domains and half-discs, totally real boundary
  conditions (PH2.2, PH3.4), the Cauchy and Beurling operators (PH3.1), interior and boundary
  estimates and the similarity principle (PH3), the weak pseudoholomorphic equation with an
  inhomogeneous term, of which Floer's equation is a case (PH4.2), elliptic bootstrapping and
  uniform estimates (PH5.1–PH5.2), real Cauchy–Riemann operators on compact bordered surfaces
  with their Fredholm theory and cokernel identification (PH6.3), the Maslov index of a bundle
  pair and closed and bordered Riemann–Roch (PH7.2). Consumed by Layer 7.

### From TauCetiRoadmap.HeegaardFloer

- Lane M: Morse–Smale pairs, compactified trajectory spaces with their corner structure and
  gluing, and the Morse complex over `𝔽₂` and `ℤ`, with its MorseTheory M1–M6 prerequisites
  (Layer 5, Layer 7.C.1a).
- Lane F0: Fredholm theory and the sharp Sard–Smale theorem with its Banach-manifold and bundle
  adapters, on Tau Ceti's Sard–Smale; Lane F1: Sobolev norms on strips and cylindrical ends,
  determinant lines, relative `c₁` and Riemann–Roch on punctured surfaces with weighted ends,
  F1.3's spectral flow, F1.4's Robbin–Salamon and Conley–Zehnder indices with `CZ = −μ_RS`,
  and F1.5's clutching Chern number and its equality
  with CharacteristicClasses C3.2's `c₁`.
- Lane F2: symplectic manifolds, F2.1's contraction inverse of a strongly nondegenerate
  two-form on arbitrary covectors with its smooth dependence on the base point, its `df`
  specialization `ι_{X_f} ω = df` and its domain-local Moser lemma (Layer 6 item 0), almost
  complex structures (F2.1's compatible-structure family
  and tame-to-compatible contraction), `J`-holomorphic maps, energy, compactness (F2.2a and
  F2.2c unique continuation and factorization; F2.3's interior mean-value and ε-regularity
  estimates, monotonicity and smooth removal of finite-energy punctures under compact-image
  hypotheses, for Layer 7.C.3), transversality and gluing; F2.6a–d sphere
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
  `f_*[S] = deg(f) · [Q]`, the only degree this roadmap uses.
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
- **CharacteristicClasses.** C3.2's topological `c₁` (through HeegaardFloer F1.5), and `w₁`,
  `w₂` for Layer 9 item 1.
- **DifferentialGeometry.** Layers 0–1: smooth differential forms, pullback, the exterior
  derivative `mextDeriv`, the Cartan calculus; item 0.4's migration of `SmoothTwoForm` onto the
  generic form carrier, which this roadmap uses. Layer 3: flows of vector fields.
- **GeometricTopology.** Layer 1: manifolds with boundary, collars, tubular neighbourhoods,
  connected sum. Layer 3: `Diff(M)` as a topological group with the `C^∞` topology, the
  smooth-families map, the inclusion `O(n+1) → Diff(Sⁿ)` and the compact-embedding restriction
  bundle. Layer 7: Riemannian structures.
- **UniversalCovers** (completed): covering spaces and their induced maps on homotopy groups.
- **LieGroups** Layers 4–6: Layer 4's Lie's third theorem and the bijection between Lie-group
  homomorphisms out of a simply connected group and Lie-algebra homomorphisms; Layer 5's
  universal cover of a connected Lie group with its discrete central kernel `≅ π₁(G)`; Layer 6's
  maximal tori with their maximal abelian Lie algebras. **CompactGroups** Layer 0: the Haar
  probability measure of a compact group and averaging against it. Consumed by Layer 11 only.
- **MorseNovikov.** N1: period-controlled completed group rings and modules, the support
  condition, finite-below convolution, geometric-series inverses. N4: based chain torsion,
  total quotient rings, determinant comparisons, finite-cyclic norms. N6's finite-dimensional
  bifurcation theorem is not consumed.
- **RiemannianGeometry.** R2: Jacobi fields and endpoint-exponential comparisons. R3: the
  index form, finite node-value reduction, complete-manifold finite broken-geodesic carriers and
  path-energy comparisons; its based-loop sphere calculation consumes Layer 1 item 2 only.
- **SmoothBundlesConnections** B6.0: uniform normal-radius and strong-convexity bounds on a
  compact Riemannian manifold (Layer 5 item 6).
- **MorseTheory** M4: the critical number `c(M)` (Layer 7.C.6h); M1–M6 through HeegaardFloer
  Lane M.
- **SymplecticGeometry** S0: the smooth mapping torus `Y_φ`, its quotient charts, descended
  `∂_t` flow and vertical form, instantiated by Layer 7.T.1 at `φ = f⁻¹`.
- **HamiltonianReduction** R1a.2: the identity component `Symp₀(M, ω)` of the symplectomorphism
  group in its compact-open `C^∞` topology, with its characterization as the endpoints of smooth
  symplectic paths from the identity, for the transport of `f` and of the component `C` under
  symplectic isotopy in Layer 7.T item 9. R5: the `Ad`-invariant orthogonal splitting
  `𝔨 = 𝔷 ⊕ [𝔨, 𝔨]` of the Lie algebra of a compact Lie group with a positive definite
  `Ad`-invariant inner product, for Layer 11 item 1. Nothing of R1a.0–R1a.1 and R1a.3–R1a.4
  (flux, the Hamiltonian kernel, the quotient `H¹_dR/Γ_ω`) or of R5's gauge theory is consumed.

### What AnalyticStableMaps must provide

Layer 7.C.2d consumes one declared gap of AnalyticStableMaps: the genus-zero, compact-family case
of its Layer 3 compactness theorem, which that roadmap proves in all genera (its §§3.2–3.4 and
3.7, with the evaluation maps of §11.1). This roadmap derives none of it from the Floer theory it
builds, and constructs no stable maps or stable-map topology of its own.

What AnalyticStableMaps must provide (gap:genus-zero-stable-map-compactness): for a closed
symplectic manifold `(X, ω)` of dimension `2n`, a compact metrizable space `P` and a continuous
map `p ↦ J_p` from `P` to the smooth `ω`-tame almost complex structures on `X` with the `C^∞`
topology, every class `A ∈ H₂(X; ℤ)` and every `k ≥ 0`:

- the space `M̄_(0,k)(A; P)` of pairs `(p, [u])`, with `[u]` an isomorphism class of `k`-marked
  genus-zero stable `J_p`-holomorphic maps of class `A` (no Hamiltonian term, components possibly
  multiply covered, every constant component carrying at least three special points), in the
  Hausdorff-graph topology, is compact, Hausdorff and second countable, hence metrizable, and its
  projection to `P` is continuous and proper;
- convergence in that topology is Gromov convergence, and every sequence `(p_ν, u^ν)` of
  `k`-marked genus-zero stable `J_(p_ν)`-maps of arbitrary classes with `sup_ν E(u^ν) < ∞` has a
  convergent subsequence (the form of Ivashkovich–Shevchishin, *Gromov compactness theorem for
  stable curves*, Theorem 1.1 with Remark 2 for marked points, `ivashkovich-shevchishin` lines
  299 and 314, whose area bound the energy bound gives through the uniformly equivalent metrics
  of the compact family);
- Gromov limits preserve the integral class and the energy, `[u^ν] = [u]` for all large `ν` and
  `E(u) = ω([u])`;
- there is `ħ > 0` with `E(v) ≥ ħ` for every nonconstant `J_p`-holomorphic sphere `v` and every
  `p ∈ P`;
- a stable map with `a` nonconstant components has at most `k − 2 + 2a` constant components and
  at most `k − 3 + 3a` nodes;
- the evaluation maps `ev_i(p, [u]) = u(z_i)` into `X`, `1 ≤ i ≤ k`, are continuous.

## How to read the build

Layers 0–4 are reusable algebraic topology and algebra, in build order, on the cubical chains,
Moore paths, DG local systems and twisted complexes of the pinned Tau Ceti: fundamental chains of
manifolds with corners (0); the general facts no other roadmap builds, among them the cubical
degree-one Hurewicz isomorphism, the exact sequence and spectral sequences of Tau Ceti's Serre
fibrations, the adapters and complete convergence of the filtered-complex spectral sequence,
Hurewicz modulo a Serre class and Eilenberg–MacLane spaces, the Pontryagin–Thom collapse and the
evaluation bundle of `Diff(M)` (1); the positive-duration Moore loop maps of Hurewicz fibrations,
Hurewicz fibrations from bundles and coverings, and the canonical homeomorphisms the pins lack
(2); basepoint change of DG local systems (3); the Brown resolution (4). Layer 5 is DG Morse
homology on closed manifolds and on the free loop space, with its fibration theorem. Layer
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

The chains of this roadmap are Tau Ceti's Massey-normalized cubical chains, with their strictly
associative cross product, their DG algebra on a topological monoid and their comparison with
simplicial singular chains (supplier contracts, From Tau Ceti). The cubical transport of the
Serre spectral sequences is part of Layer 1 item 2. This layer adds the fundamental chains of
manifolds with corners on which every representing chain system of Layers 5 and 8 rests.

### 0.1 Fundamental chains of manifolds with corners

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
not a hypothesis of the fundamental-chain theorem. *Needs:* Tau Ceti
`TauCeti.NormalizedCubicalChain`, its relative cross product and
`TauCeti.cubicalSingularHomotopyEquiv`, AlgebraicTopology Stage 6.3 (fundamental classes).

**Checks.**
- `I` has fundamental chain the identity cube, with boundary `(1) − (0)`.
- `I²` has fundamental chain the identity `2`-cube, with boundary the signed sum of its four
  edges, which is the cross-product formula for `∂(I × I)`.
- A compact `1`-manifold with boundary `[0, 1] ⊔ S¹` has fundamental chain the sum of the
  interval and a loop; its boundary is `(1) − (0)`, the fundamental chain of `∂`.

### Examples

- The interval, the square and `[0, 1] ⊔ S¹`, as in the Checks.
- `C^□_*(Ω(pt)) = C^□_*([0, ∞))`, a DG algebra under addition of durations, augmented to `A`
  (Tau Ceti `TauCeti.loopChainAlgebra` of a point).

### Dependencies

Tau Ceti's normalized cubical chains, relative cross product and cubical–simplicial comparison;
AlgebraicTopology Stage 6.3. Source: BDHO Appendix A; Barraud–Cornea, Appendix A.

## Layer 1: topological prerequisites

These are general facts that the later layers use, which no other roadmap builds.

### 1.1 Hurewicz in degree one

Consume Tau Ceti's degree-one Hurewicz isomorphism
`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv : π₁(X, x)ᵃᵇ ≃+ H₁(X; ℤ)` for a path-connected
`X : TopCat.{0}`, which sends a loop to the class of its singular `1`-simplex (Hatcher Theorem
2A.1), with its naturality and basepoint independence. AlgebraicTopology Stage 8.3's Hurewicz
map in degree one is its negative (`HomotopyGroup.hurewiczHom_hom_one_eq_neg_hurewicz₁`); this
roadmap uses Tau Ceti's sign. Own two extensions. First, the same isomorphism for a
path-connected space in an arbitrary universe, by the proof of the pinned one. Second, its
cubical form: compose with `TauCeti.singularCubicalHomologyIso`, so that a loop goes to the class
of the same path read as a `1`-cube, with no independent sign or map, naturally in based maps.
The source uses it for `H₁(Ω²Q) ≅ π₃(Q)` in Proposition 5.11, whose Moore-loop form is Tau Ceti's
`TauCeti.MooreLoopSpace.doubleFirstCubicalHomologyAddEquiv` when `π₂(Q) = 0`. *Needs:* Tau Ceti
`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` and `TauCeti.singularCubicalHomologyIso`.

**Checks.**
- `S¹`: `π₁ = ℤ = H₁`, and the cubical image of the standard loop is the `1`-cube
  `t ↦ e^{2πit}`, a cycle generating `H^□_1(S¹)`; a transport through Stage 8.3's map would send
  the loop to the negative of that generator.
- On `0`-chains Tau Ceti's comparison sends a point to the same point and on the model `1`-cube
  the image of the identity `1`-simplex is the identity `1`-cube, so a path and its cube agree
  in `H₁`, with no sign.
- `S¹ ∨ S¹`: `π₁` is free on `a, b`, `H₁ = ℤ²`, and the commutator `aba⁻¹b⁻¹` is nullhomologous
  (its `1`-cycle bounds the `2`-chain of a square with identified edges) but not nullhomotopic.
  Path-connectedness is needed for surjectivity: for `X = S¹ ⊔ pt`, `H₁(X) = ℤ` while
  `π₁(X, pt) = 0`.

### 1.2 Weak equivalences, CW approximation, Serre fibrations and their spectral sequences

**CW approximation.** Consume Tau Ceti's CW approximation of a path-connected space, a weak
homotopy equivalence from a CW complex with a single `0`-cell
(`TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`), natural up to homotopy
(`TauCeti.cwApproximationLift`) (Hatcher Proposition 4.13). Own its extension to an arbitrary
space, as the disjoint union of the approximations of its path components at chosen basepoints,
with its naturality up to homotopy. *Needs:* Tau Ceti
`TauCeti.isWeakHomotopyEquivalence_cwApproximationMap`, AlgebraicTopology Stage 4.

**The connected-map homology comparison.** The homology form for weak equivalences is Tau Ceti's: a
weak homotopy equivalence induces isomorphisms on singular homology with coefficients in any ring
and on homology with every local coefficient system
(`ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap` and
`ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap`; Hatcher Proposition 4.21), and
so is the pair form of the vanishing below the connectivity
(`TauCeti.isZero_singularHomology_ofSubset_of_relHomotopyGroup`). Own the comparison for maps,
consumed by CharacteristicClasses under the name connectedMapHomologyComparison: a `k`-connected map
induces isomorphisms on homology with every coefficient system below degree `k` and a surjection in
degree `k`; and the cohomology forms of both statements, for every coefficient system, on native
simplicial singular and twisted cochains. One route is the Eilenberg subcomplex argument: formulate
connectivity by relative disc and sphere compression and homotopy lifting; for a `k`-connected
mapping-cylinder pair generate the subcomplex by simplices carrying their `k`-skeleton into the
subspace; construct face-compatible homotopies `P(σ)`, fixing compressed simplices and relative
faces, and the prism chain equivalence; transport local coefficients along `P` at vertices with face
and prism compatibility. The complexes agree through degree `k`. For a weak equivalence compress
compatibly in every degree to obtain the coefficient-chain homotopy equivalence and its Hom and
cohomology comparison, for maps of pairs and their exact sequences. This route uses neither
AlgebraicTopology 8.1's relative homotopy groups nor 8.3's Hurewicz theorem; Hatcher's route through
the mapping cylinder and the relative Hurewicz theorem is another. *Needs:* AlgebraicTopology Stages
2 and 4, Tau Ceti twisted singular homology and
`ContinuousMap.IsWeakHomotopyEquivalence.isIso_twistedHomologyMap`.

**Serre fibrations and their homotopy exact sequence.** A Serre fibration is a morphism
`p : E ⟶ B` of `TopCat.{u}` in Tau Ceti's `TauCeti.TopCat.serreFibrations`: it has the
homotopy lifting property for every disc, equivalently for every cube `Iⁿ`, `n ≥ 0`
(`TauCeti.TopCat.mem_serreFibrations_iff_cube`; Hatcher, the maps of Theorem 4.41). Its
closure under base change, composition, products and retracts, the covering-map,
product-projection and locally-trivial-bundle instances (the last with no paracompactness
hypothesis, Hatcher Proposition 4.48), path lifting, and lifting with a prescribed lift on the
bottom and sides of a finite cube are the library's (supplier contracts, From Tau Ceti); this
item uses them as stated there and does not restate them. Construct the fibration homotopy
exact sequence directly by disc lifting and endpoint restriction, retaining group laws and
pointed-set exactness at `π₁` and `π₀` (Hatcher Theorem 4.41), without consuming
AlgebraicTopology 8.1's relative-pair sequence: construct the boundary by the relative lift
`TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations` and endpoint restriction, prove
representative and lift independence by a further relative cube lift, and naturality for
commuting based squares; pin all concatenation comparisons to the native `transAt` order. At
the low end retain pointed sets, component actions and image-equals-kernel exactness, with no
module carrier for `π₁` or components. Every-fibre weak contractibility, including
nonemptiness, gives a weak equivalence by this sequence and component lifting; homotopy
equivalence additionally uses CW-type witnesses and AlgebraicTopology 8.5's Whitehead theorem.
A chosen fibre alone gives no conclusion on unrelated base components. *Needs:* Tau Ceti
`TauCeti.TopCat.serreFibrations` with `TauCeti.TopCat.mem_serreFibrations_iff_cube` and
`TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations`; Mathlib `HomotopyGroup`;
AlgebraicTopology Stages 1–4.

**All-CW testing and the based fibration sequence.** Own homotopy lifting for a Serre fibration
against every relative CW pair, for every Hausdorff CW parameter in the displayed universe:
transport Tau Ceti's relative cube lifting
`TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations` to the cells through a
homeomorphism of pairs `(Dⁿ, Sⁿ⁻¹) ≅ (Iⁿ, ∂Iⁿ)` proved here, and extend cellwise over a native
relative CW pair, keeping arbitrary dimensions and cell sets; glue through attaching quotient
diagrams and prove the product weak-topology lemma for the compact Hausdorff interval (Hatcher,
the remarks after Theorem 4.41 and before Proposition 4.48). Empty pairs and `0`-cells are
included. This relative-CW lifting, not disc testing alone, fixes basepoint tracks for the
finite sphere and cube representatives and their homotopies. For NDR parameter pairs the
Hurewicz lane consumes Tau Ceti's `TauCeti.IsHurewiczFibration.exists_lift_of_ndrPair`.
Paracompactness is retained where Layer 2 asks for the stronger Hurewicz-fibration property.
*Needs:* the preceding paragraph, Tau Ceti
`TauCeti.TopCat.exists_lift_openBox_of_mem_serreFibrations`, AlgebraicTopology Stage 4.

**Checks (the fibration exact sequence).**
- The projection `B × F → B`, a Serre fibration as a product projection: a based sphere
  `α : (Iⁿ, ∂Iⁿ) → (B, b₀)` lifts relative to the bottom and sides to `(α, f)` with `f` constant
  at `e₀` there, so `f` is a homotopy rel boundary from the constant map to the top face, and the
  boundary `∂ : π_n(B) → π_{n−1}(F)` is zero; the sequence splits into
  `π_n(F) ↪ π_n(B × F) ↠ π_n(B)`. A boundary built from a lift prescribed on the bottom face
  only would send the boundary of the top face off `e₀`, and so would not be a based class.
- The double cover `S¹ → S¹`, `z ↦ z²`, a Serre fibration as a covering map: the sequence
  `0 = π₁(F) → π₁(S¹) → π₁(S¹) → π₀(F) → π₀(S¹) = pt` has middle map multiplication by `2`,
  and `∂` sends the generator to the component of `−1`, the endpoint of the lift `t ↦ e^{πit}`
  of `t ↦ e^{2πit}` from `1`; the kernel of `∂`, the integers whose lift closes up, is `2ℤ`, the
  image of the middle map, and `π₀(F) = {1, −1}` is `ℤ/2`.
- The Hopf fibration `S¹ → S³ → S²`, a Serre fibration as a locally trivial map: since
  `π₂(S³) = π₁(S³) = 0`, exactness forces `∂ : π₂(S²) → π₁(S¹) = ℤ` to be an isomorphism and
  `π_n(S³) ≅ π_n(S²)` for `n ≥ 3`, so `π₃(S²) ≅ ℤ`.
- Negative control: the inclusion `{1} → S¹` is not a Serre fibration, since the loop
  `t ↦ e^{2πit}` has no lift; its would-be sequence `0 = π₁({1}) → π₁(S¹) = ℤ → π₀(fibre) = pt`
  is not exact at `π₁(S¹)`, where the preimage of the base point is all of `ℤ` and the image is
  `0`. The fibration hypothesis is therefore not removable.

**The homological Serre spectral sequence over a CW base.** Own, for every path-connected CW
base, the spectral sequence consumed by AlgebraicTopology Stage 5.5 under the name
arbitraryCWSerreSpectralSequence, using AlgebraicTopology Stages 1–4 and the filtration
`E_p = p⁻¹(B^{(p)})`, with `E_{−1}` empty. Prove that singular chains are exhausted by this
filtration using compact simplex images and the cellular filtration comparison. Apply Tau
Ceti's spectral sequence of a filtered space, `TauCeti.filteredSpaceSpectralSequence` of the
family `p ↦ E_p`, through item 3's homological regrading. Construct the local system
`b ↦ H_q(p⁻¹(b); R)` of a Serre fibration by path transport through relative cube lifting
(Tau Ceti's `TauCeti.fiberLocalSystem` is built from a lifting function of a Hurewicz
fibration, and does not apply), and identify `E²_{p,q} = H_p(B; H_q(F; R))` with path-transport
monodromy, and prove convergence to `H_{p+q}(E; R)`. In each total degree the first-quadrant
filtration is finite, exhaustive and separated; identify its graded pieces with `E^∞`,
including the extension data. No finite-type or dimension bound is imposed on `B` or `F`.
Prove naturality under maps of fibrations and coefficient maps, and the componentwise version.
*Needs:* the exact sequence above, item 3, AlgebraicTopology Stages 1–4, Tau Ceti
`TauCeti.TopCat.serreFibrations`, `TauCeti.filteredSpaceSpectralSequence` and
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
model. Use the base-change and product stability of Tau Ceti's `serreFibrations`
(`IsStableUnderBaseChange`, `IsStableUnderProductsOfShape`), and
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

**Cubical transport.** Transport the homological Serre spectral sequence over a CW base, with its
local-coefficient `E²` term, to normalized cubical chains, for the DG consumers of Layer 5:
Tau Ceti's natural comparison `TauCeti.cubicalSingularHomotopyEquiv`, and its local-coefficient
form `TauCeti.LocalCoefficientSystem.twistedCubicalToSingularMap`, preserve the filtration by the
chains of the preimages `E_p`, being natural in inclusions, and are homotopy equivalences on
each `E_p` and on each relative quotient by the relative comparison, so they induce isomorphisms
of spectral sequences from the first page on. *Needs:* the preceding paragraphs, Tau Ceti's
cubical–simplicial comparison and its relative and local-coefficient forms.

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

Consume Tau Ceti's spectral sequence of a filtered cochain complex (supplier contracts, From
Tau Ceti): for an increasing filtration `F : ℤ → Subobject K`, the `EInt`-indexed functor
`CochainComplex.filtrationFunctor`, with `0` and `K` at its infinite endpoints, its spectral
sequence `CochainComplex.spectralSequence` for Mathlib's `coreE₂Cohomological`, whose first
page is numbered `2` and has `H^{a+b}(F_{b+1}/F_b)` at `(a, b)`, the first-page
identifications `CochainComplex.spectralSequenceFirstPageXIsoCokernel` and
`CochainComplex.spectralSequence_first_page_d_eq`, the abutment
`CochainComplex.filtrationAbutmentIso` with its image filtration, the convergence theorems for
finite and for exhaustive filtrations, the naturality `CochainComplex.filtrationFunctorMap` and
the comparison theorem. Own the homological adapter and the convergence beyond them. For an
increasing filtration of a module chain complex over a ring, assume degreewise filtration lower
bounds `∀ n, ∃ s(n), F_{s(n)} C_n = 0` and exhaustion `⋃_p F_p C_n = C_n`. Regrade
`C^{−n} = C_n` with the same differential and apply Tau Ceti's construction to the regraded
filtration. The stated homological `E_r^{p,q}`, with `E¹_{p,q} = H_{p+q}(F_p C / F_{p−1} C)`,
is its page `r + 1` at bidegree `(a, b) = (1 − 2p − q, p − 1)`, so `deg = a + b = −(p + q)`,
`i₁ = p − 1` and `i₂ = p`. For a decreasing cochain filtration `F^p`, use the increasing
functor `G_t = F^{−t}`; its cohomological `E_r^{p,q}` is page `r + 1` at
`(a, b) = (2p + q + 1, −p − 1)`, so `deg = p + q`, `i₁ = −p − 1` and `i₂ = −p`. Transport the
quotient-page identifications and the connecting-map formula for the first differential through
these reindexings, retaining the mapping-cone and reindexing signs. Prove natural strong
convergence in the following sense: the induced filtration `F_p H_n = im(H_n(F_p C) → H_n(C))`
is exhaustive (Tau Ceti's `CochainComplex.exists_mem_range_filtrationAbutmentFiltrationι`) and
vanishes at `s(n)` in degree `n`, from the degreewise lower bound alone (hence separated and
complete in its lower-filtration direction), and `E^∞_{p,q} ≅ F_p H_{p+q} / F_{p−1} H_{p+q}`
naturally; no finite upper filtration bound and no global lower bound are required (Weibel,
Classical Convergence Theorem 5.5.1(2); the lower bound concerns the filtration in each chain
degree, not the degrees in which the complex is nonzero). Own the cohomological form of
Weibel's Complete Convergence Theorem 5.5.10 for complete exhaustive decreasing cochain
filtrations with regular spectral sequence: prove weak convergence and its induced cohomology
filtration and `E∞` graded identification, and strong convergence under the theorem's
degreewise spectral boundedness after cohomological reindexing, using the Milnor `lim¹`
sequence of Tau Ceti's `TauCeti.ComplexTower`; the first-quadrant case is regular and degreewise
bounded. In the Serre instance
prove completeness of the inverse cochain filtration and the degreewise finite abutment
filtration. Cup pairings come from filtered cochain maps, independently of convergence.
*Needs:* Tau Ceti `CochainComplex.filtrationFunctor`, `CochainComplex.spectralSequence` and
their convergence and naturality API; Mathlib `coreE₂Cohomological`, `EInt`;
`HomologicalComplex`.

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

**Serre classes.** A Serre class is Mathlib's `CategoryTheory.ObjectProperty.IsSerreClass` on
abelian groups (closed under subobjects, quotients and extensions), with Serre's axioms for `⊗`,
`Tor` and the homology of `K(A, 1)` as separate hypotheses. The two classes used are Tau Ceti's
torsion class `AddCommGrpCat.isTorsion` (equivalently `G ⊗ ℚ = 0`) and, for a fixed integer
`d ≥ 1`, `AddCommGrpCat.isKilledBySomePower d`, the groups annihilated by **some** power of `d`,
`∃ m, dᵐ·G = 0`; Tau Ceti proves their closure under `⊗` and `Tor` and the `K(A, 1)` axiom for
finite `A`. Prove the `K(A, 1)` axiom for every member of the two classes, and Hurewicz modulo a
Serre class for simply connected spaces (Serre 1953, Theorem 1; the source's Theorem 5.12).
*Needs:* AlgebraicTopology Stages 2, 4 and 8.1–8.7, item 2, item 3, Tau Ceti's Serre classes.

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
the based maps and homotopies and prove their coefficient normalization. The general
higher-cell killing construction with its connectivity and preserved lower groups (Hatcher §4.1)
is Tau Ceti's `TauCeti.killHomotopyGroups`, for Hausdorff spaces. *Needs:* AlgebraicTopology
Stages 4 and 8.1–8.7, Tau Ceti `TauCeti.killHomotopyGroups`.

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

**Path and homotopy-fibre carriers.** Consume Tau Ceti's based path fibration and mapping-path
homotopy fibre: `TauCeti.MappingPathSpace` of a constant map with its contractibility, its
endpoint Hurewicz fibration `TauCeti.MappingPathSpace.isHurewiczFibration_endpoint`, the fibre
homeomorphism `TauCeti.mappingPathFiberConstHomeomorphLoopSpace` onto native `LoopSpace`, and
the Serre comparison `TauCeti.IsHurewiczFibration.mem_serreFibrations`. Apply item 2's
fibration homotopy sequence, including its component terms, to these Hurewicz fibrations.
Identify the loop fibre `ΩK(A, n)` with `K(A, n−1)` for `n ≥ 2` through the uniqueness target
above, after CW approximation, using the coefficient-natural connecting isomorphism on
`π_{n−1}`; this comparison consumes no Stage 8.11 result and no Eilenberg–MacLane
representability. *Needs:* Tau Ceti `TauCeti.MappingPathSpace`,
`TauCeti.mappingPathFiberConstHomeomorphLoopSpace` and `TauCeti.IsHurewiczFibration`, item 2,
the preceding paragraphs.

**Integral and mod-2 chain comparison.** The coefficient sequence `0 → ℤ → ℤ → ℤ/2 → 0` in
singular homology, with `ℤ/2` taken as a `ℤ`-module, is Tau Ceti's, and so is its consequence
`TopCat.isUniquelyTwoDivisible_singularHomology_of_isZero_mod_two`: vanishing of
`H_{i+1}(Z; ℤ/2)` and `H_i(Z; ℤ/2)` makes multiplication by `2` on `H_i(Z; ℤ)` bijective. Own the
natural surjection `H₁(Z; ℤ) → H₁(Z; ℤ/2)`, from the torsion-free `H₀(Z; ℤ)` term of that
sequence, and its identification with the quotient by `2`; the identification of the `ℤ`-module
coefficients `ℤ/2` with the `𝔽₂`-vector-space coefficients of AlgebraicTopology by restriction
of scalars. *Needs:* AlgebraicTopology Stage 2, Tau Ceti's coefficient sequence.

**Vanishing of `H̃_*(K(A, n); 𝔽₂)` for a `ℤ[1/2]`-module `A`.** For `n = 1`: `A` is the
directed union of its finitely generated `ℤ[1/2]`-submodules, which are finite sums of copies of
`ℤ[1/2]` and of finite cyclic groups of odd order, so by the directed-union property and Künneth
it suffices to treat these two. Construct the canonical map `|N(A × B)| → |N(A)| × |N(B)|`
induced by the two group projections; Stage 8.8 identifies its `π₁` map with the identity on
`A × B` and all higher groups with zero, so it is a weak equivalence, and item 2's homology
invariance and Stage 5.1's field Künneth theorem give the natural homology product formula. For
`ℤ[1/2]` and for a finite cyclic group of odd order the vanishing is Tau Ceti's on Milnor's
classifying space (`TauCeti.isZero_classifyingSpace_singularHomology_localizationAway` with
`m = 2`, and `TauCeti.subsingleton_classifyingSpace_singularHomology_of_isUnit_natCard`),
transported to the chosen model by the uniqueness paragraph and the weak-equivalence invariance
of homology. For `n ≥ 2`: induction through the
path-loop fibration `K(A, n−1) → P → K(A, n)` over the simply connected base `K(A, n)`; the
mod-2 Serre spectral sequence has `E²` concentrated in the bottom row, which is
`H_*(K(A, n); 𝔽₂)`, so `E² = E^∞`, and the total space is contractible. *Needs:* the preceding
paragraphs, item 2, AlgebraicTopology Stages 5.1 and 8.8, Tau Ceti's homology of classifying
spaces.

**The one-step lemma.** Let `n ≥ 2` and let `Z` be an `(n−1)`-connected space with
`H̃_*(Z; 𝔽₂) = 0`. Then `π_n Z` is uniquely 2-divisible: this is Tau Ceti's
`TauCeti.isUniquelyTwoDivisible_homotopyGroup_of_isZero_mod_two` for spaces in `Type`, through the
Hurewicz isomorphism and the chain comparison, and its proof gives it in every universe. After CW
approximation (item 2), attaching cells of dimension `≥ n + 2` to `Z` (`TauCeti.killHomotopyGroups`)
kills `π_k` for `k > n` and produces a `K(π_n Z, n)` containing `Z`, with `Z → K(π_n Z, n)` an
isomorphism on `π_n` (Hatcher §4.1). Let `Z' → Z` be its homotopy fibre. Then `Z'` is `n`-connected,
`π_k Z' ≅ π_k Z` for `k > n`, and the fibre of `Z' → Z` is `ΩK(π_n Z, n)`, a `K(π_n Z, n−1)`. Then
`H̃_*(Z'; 𝔽₂) = 0`: the mod-2 Serre spectral sequence of `K(π_n Z, n−1) → Z' → Z` has a simply
connected base, `H̃_*(Z; 𝔽₂) = 0`, and `H̃_*(K(π_n Z, n−1); 𝔽₂) = 0` by the previous paragraph, so
`E²` is concentrated at `(0, 0)`. The Eilenberg–MacLane fibre sits over the `(n−1)`-connected stage
`Z`, never over the original space: for `Y = S²` and `n = 3`, a 3-connected `E` in a fibre sequence
`K(π₃S², 2) → E → S²` would give `0 = π₂(E) → π₂(S²) = ℤ → π₁(K(π₃S², 2)) = 0` in the long exact
sequence, which is impossible. Iterating the lemma produces the Whitehead tower
`⋯ → Y⟨n+1⟩ → Y⟨n⟩ → ⋯ → Y⟨2⟩ = Y` with `K(π_n Y, n−1) → Y⟨n+1⟩ → Y⟨n⟩` between **successive**
stages; the tower as a whole is not needed. *Needs:* the preceding paragraphs, item 2,
AlgebraicTopology Stage 8.3.

**Mod-2 vanishing.** For a simply connected space `Y` with `H̃_*(Y; 𝔽₂) = 0`, every `π_i(Y)` is
uniquely 2-divisible (a `ℤ[1/2]`-module); no finite generation is assumed. In `Suggested.lean`
this is `bijective_sq_homotopyGroup_of_mod_two_acyclic`, for a space in an arbitrary universe,
with the coefficient group `ZMod 2` lifted to that universe and taken as a `ℤ`-module, and the
conclusion that squaring is bijective on `π_{n+2}(Y, y)`. The
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
bundle, the collapse map `M → S^k` of a framed tube `N × ℝ^k ↪ M` is Tau Ceti's
`TauCeti.pontryaginThomCollapseMap` (into the one-point compactification of `ℝ^k`, with the
sphere form `TauCeti.pontryaginThomSphereMap`); isotopic tubes give homotopic collapses
(`TauCeti.pontryaginThomCollapseMap_homotopic`), and a globally framed embedding has a tube
(`TauCeti.SmoothEmbedding.exists_isFramedTube`). A Euclidean ambient space is the special case in
which the ambient manifold is replaced by its one-point compactification. Own the independence
of the collapse from the tube up to based homotopy, through the isotopy of any two tubes
supplied by GeometricTopology Layer 1's uniqueness of tubular neighbourhoods, and the following
two interfaces. Write `c : M → S^k` for the collapse, `c_N : M → Th(ν)` for the collapse onto
the Thom space of the framed normal bundle, `Th(ν) = N₊ ∧ S^k` by the framing, so that `c` is
`c_N` followed by the map `N₊ ∧ S^k → S^k` that collapses `N`, and `u_k ∈ H^k(S^k; ℤ)` for the
class that takes the value `1` on the fundamental class of `S^k = (ℝ^k)^+` oriented by `ℝ^k`.
Let `M` be oriented, of dimension `n + k`, orient `ν` by the framing and orient `N` so that the
orientation of `N` followed by that of `ν` is the orientation of `M` (the convention of BDHO
Remark 9.2.4, `bdho-morse-dg` lines 4090–4093). Cap products are Hatcher's
(`σ ⌢ φ = φ(σ|[v₀, …, v_ℓ]) σ|[v_ℓ, …, v_m]`, `hatcher-at` lines 10391–10395), and Poincaré
duality is `D_M(φ) = [M] ⌢ φ` from AlgebraicTopology Stage 6.
- *Shriek maps.* The shriek map of the inclusion `i : N → M`,
  `i_!(x) = [N] ⌢ i^*(D_M^{−1} x)` from `H_j(M; ℤ)` to `H_{j−k}(N; ℤ)` (the form
  `i_! = D_N ∘ i^* ∘ D_M^{−1}` of BDHO Proposition 11.3.2, `bdho-morse-dg` lines 7870–7880), is
  `(c_N)_* : H_j(M; ℤ) → H̃_j(N₊ ∧ S^k; ℤ)` followed by the inverse of the suspension isomorphism
  `y ↦ y × [S^k]` of the framing, which is the Thom isomorphism of the trivial bundle
  `N × ℝ^k` (Hatcher Corollary 4D.9 and §4.D Exercise 8, `hatcher-at` lines 19035–19046 and
  19264–19267). In BDHO's Morse construction this is their Remark 9.2.5 (`bdho-morse-dg` lines
  4094–4100): the shriek map of a closed submanifold is the Thom isomorphism of its tube. The
  route: on the tube, `[M]` restricts to `[N] × [D^k, S^{k−1}]` by the orientation convention,
  and the shriek map is natural for the excision `H_*(M, M ∖ int U) ≅ H_*(D(ν), S(ν))`.
- *Effect on fundamental classes.* `[M] ⌢ c^*u_k = (−1)^{nk} i_*[N]` in `H_n(M; ℤ)`: the
  pullback of the sphere class is Poincaré dual, up to that sign, to the image of `[N]`. With `N`
  oriented by `ν` followed by `N` instead, the sign is `+1`. Evaluated on `H_k(M)` this is the
  shriek statement in degree `j = k` composed with the augmentation `H₀(N) → ℤ`:
  `⟨c^*u_k, x⟩ = ⟨D_M^{−1} x, i_*[N]⟩`, the cup-cap relation `ψ(σ ⌢ φ) = (φ ⌣ ψ)(σ)`
  (`hatcher-at` lines 10777–10779) and graded commutativity turning one sign into the other. A
  homological reading through `c_*[M] ∈ H_{n+k}(S^k)` sees nothing when `n > 0`, since that
  group is `0`.

*Needs:* Tau Ceti `TauCeti.pontryaginThomCollapseMap`, GeometricTopology Layer 1,
AlgebraicTopology Stage 6 (fundamental classes, cap products, Poincaré duality).

**Checks.**
- `N` a point in `Sⁿ` with the standard framing: the collapse `Sⁿ → Sⁿ` has degree `±1`
  according to the framing's orientation, and reversing one framing vector reverses the degree.
  In the notation of the interfaces `N` has dimension `0` and `k` is the dimension of the
  sphere, so `(−1)^{nk} = 1`; `[S^k] ⌢ c^*u_k` is `deg(c)` times the point class, and the point
  is oriented `+` exactly when the framing agrees with the orientation of `S^k`, so both sides
  are `±[pt]` with the same sign.
- `N = ∅`: the collapse is the constant map to the basepoint, `c^*u_k = 0` and `i_*[N] = 0`.
- `N` two points in `S¹` with framings of the same orientation: the collapse `S¹ → S¹` has
  degree `2`; with opposite orientations, degree `0`. The two points carry orientations `+, +`,
  respectively `+, −`, so `i_*[N]` is `2[pt]`, respectively `0`, as the formula says.
- The sign and the cohomological reading on the torus. Let `M = T²` with coordinates `(x, y)`,
  oriented by `(∂_x, ∂_y)`, `N = S¹ × {y₀}` framed by `∂_y` and oriented by `∂_x`, and
  `a = [S¹ × pt]`, `b = [pt × S¹]`. The collapse is `(x, y) ↦ y` near `N`, so `c^*u₁ = β` with
  `β(a) = 0`, `β(b) = 1`, and `c_*[T²] ∈ H₂(S¹) = 0` carries no information. Hatcher's Example
  3.31 on the torus (`hatcher-at` lines 10459–10480) gives `[T²] ⌢ β = −a`, which is
  `(−1)^{1·1} i_*[N]`: a statement without the sign `(−1)^{nk}` would be false here. The shriek
  map sends `b ↦ [pt]` (the circle `pt × S¹` crosses the tube once), `a ↦ 0` (a parallel copy of
  `N` misses the tube) and `[T²] ↦ [N]`, by either description. A direct computation on the
  square `[0, 1]²` cut along its diagonal, with `[T²] = [v₀₀, v₁₀, v₁₁] − [v₀₀, v₀₁, v₁₁]` and
  `β` the cocycle `Δy` on edges, gives the same `−a`: only the second simplex contributes, its
  back edge `[v₀₁, v₁₁]` being a copy of `a`.

### 1.6 Diffeomorphism groups and evaluation orbits

For a closed smooth manifold `M` with a chosen point `x₀` consume Tau Ceti's `TauCeti.Diff` with
the weak Whitney (`C^∞`) topology `Diffeomorph.weakWhitneyTopology`, a topological group with
continuous evaluation and a smooth-families map, and GeometricTopology Layer 3's orthogonal
sphere action and compact-embedding restriction bundle onto the `Diff` orbit.
Specialize that restriction construction to a point, identify its `C^∞` embedding space with
`M` through the evaluation and inverse maps, and let `O` be the orbit of `x₀` and
`H = {g | g(x₀) = x₀}`. Compare the resulting supported local sections with coordinate-ball
motions from compactly supported smooth vector fields. If `g(x₀) = y`, compose a local motion
taking `y` to `z` with `g` to obtain a continuous local section `s : U → Diff(M)` over an open
neighbourhood `U` of `y` in `O`. Export evaluation `Diff(M) → O` as a locally trivial principal
right-`H` bundle, with the mutually inverse maps `g ↦ (g(x₀), s(g(x₀))⁻¹ g)` and
`(z, h) ↦ s(z) h` (Palais 1960). For connected `M`, `O = M` by Tau Ceti's compactly supported
diffeotopies `TauCeti.exists_diffeotopy_final_apply_eq`; this gives the bundle over `M` without
an orientation hypothesis. For disconnected `M` retain the orbit
formulation: identify `O` with the union of the components reachable by a global
diffeomorphism (for a closed manifold, the components diffeomorphic to the component of `x₀`,
with the component-swap extensions constructed). It is an open-and-closed submanifold. State a
bundle over all `M` only with explicit transitivity data; otherwise fibres outside `O` are
empty. Retain the zero-dimensional and finite-component cases. A merely continuous family into
`Diff` is not identified with a jointly smooth family. *Needs:* Tau Ceti `TauCeti.Diff` and
`TauCeti.exists_diffeotopy_final_apply_eq`, GeometricTopology Layers 1 and 3, DifferentialGeometry
Layer 3 (flows of compactly supported fields).

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
spectral-object API, `ObjectProperty.IsSerreClass`, the Dold–Kan equivalence. Tau Ceti: twisted
singular homology, `LocalCoefficientSystem`, `IsEilenbergMacLaneSpaceOne`, the degree-one
Hurewicz isomorphism, CW approximation, weak-equivalence invariance, the Serre classes, the
cell-killing construction and the mod-2 coefficient sequence, the Serre- and Hurewicz-fibration
predicates with their lifting API, the mapping-path carriers, the filtered-complex and
filtered-space spectral sequences, the Pontryagin–Thom collapse, `TauCeti.Diff`, and the
cubical–simplicial comparison. AlgebraicTopology Stages 1–6 and 8.1–8.8; GeometricTopology
Layers 1 and 3; DifferentialGeometry Layer 3. Source: Hatcher, *Algebraic Topology*, §§2.A,
3.3, 4.1–4.3, 4.D, 4.J; BDHO §§9.2 and 11.3 (item 5); Weibel §5.5; Serre, *Groupes d'homotopie et classes de groupes abéliens*; Palais, *Local triviality of
the restriction map for embeddings*.
## Layer 2: path spaces, mapping spaces, and their fibrations

The Moore paths, Moore loops and free Moore loops, the Moore lifting functions, the Moore-path
replacement of an arbitrary map with its strict holonomy, the comparison of Moore and
fixed-interval paths, and the canonical homeomorphisms of mapping spaces out of spheres are Tau
Ceti's (supplier contracts, From Tau Ceti). This layer adds what the source uses beyond them.

### 2.1 Moore paths and loops

Own the Moore form of the loop-space fibration on loops of positive duration. For a space `X`
and `x ∈ X`, let `Ω^{>0}_x X` be the open subspace of Moore loops of positive duration (the
duration is continuous). Prove that the rescaling `(L, γ) ↦ (L, t ↦ γ(Lt))` is a homeomorphism
`Ω^{>0}_x X ≅ (0, ∞) × Ω^{[0,1]}_x X` onto the product with Mathlib's fixed-interval loop space,
with inverse `(L, δ) ↦ (L, t ↦ δ(min(t/L, 1)))`, natural in based maps. For a Hurewicz fibration
`p : E → B` and `e ∈ E`, the Moore loop map `TauCeti.MooreLoopSpace.map` of `p` preserves
durations, so it restricts to `Ω^{>0}_e E → Ω^{>0}_{p(e)} B`. Under the rescaling this
restriction is `id_{(0,∞)} × Ωp`, the pullback of the fixed-interval loop map along the second
projection, so it is a Hurewicz fibration by `TauCeti.IsHurewiczFibration.loopMap`,
`TauCeti.IsHurewiczFibration.pullback`, `TauCeti.IsHurewiczFibration.comp_homeomorph` and
`TauCeti.IsHurewiczFibration.comp`. One level up, let `c₁ ∈ Ω^{>0}_e E` be the constant loop
of duration `1`: the induced map of positive-duration Moore loops
`Ω^{>0}_{c₁}(Ω^{>0}_e E) → Ω^{>0}_{p∘c₁}(Ω^{>0}_{p(e)} B)` is, after rescaling at both levels,
`id_{(0,∞)} × id_{Ω^{[0,1]}_1(0,∞)} × Ω²p`, a Hurewicz fibration by
`TauCeti.IsHurewiczFibration.loopMap_loopMap` and the same pullback.

The unrestricted Moore loop map `Ω_e E → Ω_{p(e)} B` is in general neither a Hurewicz nor a Serre
fibration. Its fibre over the constant loop of duration `0` is a point. Its fibre over the
constant loop of duration `L > 0` is the Moore loops of duration `L` in the fibre
`F = p⁻¹(p(e))`, which is homeomorphic to `Ω^{[0,1]}_e F`. The constant loops of duration `sL`,
`s ∈ [0, 1]`, form a path joining the two base points (second Check). For the same reason the
fixed-interval statements do not transfer along `TauCeti.MooreLoopSpace.homotopyEquivPath`.
*Needs:* Tau Ceti `TauCeti.MooreLoopSpace` with `TauCeti.MooreLoopSpace.map`,
`TauCeti.IsHurewiczFibration.loopMap`, `TauCeti.IsHurewiczFibration.loopMap_loopMap`,
`TauCeti.IsHurewiczFibration.pullback`, `TauCeti.IsHurewiczFibration.comp_homeomorph` and
`TauCeti.IsHurewiczFibration.comp`; Mathlib's compact-open topology on `C(X, Y)` and `LoopSpace`.

**Checks.**
- The projection `B × F → B`: `Ω_{(b, f)}(B × F)` is the fibre product
  `Ω_b B ×_{[0, ∞)} Ω_f F` of pairs of Moore loops of equal duration, not the product, and the map
  is the first projection, whose fibre over a loop of duration `L > 0` is the Moore loops in `F`
  at `f` of duration `L`, homeomorphic to `Ω^{[0,1]}_f F` by the rescaling.
- Negative control: `E = B × S¹` with `p` the first projection, a Hurewicz fibration by
  `TauCeti.isHurewiczFibration_fst`. Over the constant loop of duration `0` the fibre of the
  unrestricted Moore map is a point. Over the constant loop of duration `1` it is `Ω^{[0,1]}S¹`,
  with `π₀ = ℤ` by winding number. The path `s ↦ (constant loop of duration s)` joins these base
  points, so no homotopy lifting is possible. Over every positive duration the fibre is
  `≃ Ω^{[0,1]}S¹`, as the restricted statement predicts.
- `p` the inclusion of the point `1` into `S¹` is not a fibration, and neither is
  `Ω₁{1} = [0, ∞) → Ω₁S¹`, whose image is the constant loops: a path in `Ω₁S¹` that starts at a
  constant loop and leaves the constant loops has no lift.
- `X` a point: `Ω^{>0}(pt) ≅ (0, ∞)` by `TauCeti.MooreLoopSpace.lengthHomeomorph`, matching
  `(0, ∞) × Ω^{[0,1]}(pt)`. A rescaling defined on all of `Ω_x X` would send the duration-`0`
  slice, a point, onto `{0} × Ω^{[0,1]}_x X`, which for `X = S¹` has `ℤ` components.

### 2.2 Hurewicz fibrations, transitive lifting functions and the Moore-path replacement

Consume Tau Ceti's Moore lifting functions `TauCeti.MooreLiftingFunction` with their
transitivity, the replacement `TauCeti.MooreReplacement` with its endpoint fibration, transitive
lifting function by concatenation and strict right action of the Moore loops on its fibre
`TauCeti.MooreReplacement.Fiber`, transport `TauCeti.MooreLiftingFunction.transport`, strictly
equivariant for a transitive lifting function, and for a Hurewicz fibration the fibre homotopy
equivalence `TauCeti.MooreReplacement.fiberHomotopyEquiv` (BDHO §7.1 cites the replacement of a
fibration by one with a transitive lifting function to the literature; Whitehead Chapter I).
Own:

- *Coverings.* For a covering map `E → B`, unique path lifting is a transitive Moore lifting
  function, and its transport is the monodromy of the fibre.
- *Numerable bundles.* A locally trivial bundle over a paracompact Hausdorff base, or with an
  explicit numerable trivializing cover, is a Hurewicz fibration (Hatcher's remark after
  Proposition 4.48 on the Huebsch–Hurewicz theorem; the proof is through the numerable cover).
  Tau Ceti has the Serre property of every locally trivial map,
  `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`, with no hypothesis on the base.
- *The comparison and the actions.* Under the Moore comparison of the conventions, the strict
  action of the Moore loops on `TauCeti.MooreReplacement.Fiber p b` corresponds, up to a specified
  homotopy, to the action of fixed-interval loops by concatenation on the mapping-path fibre
  `TauCeti.MappingPathFiber`.

*Needs:* Tau Ceti's Moore lifting functions and replacement, `IsCoveringMap`,
`TauCeti.IsHurewiczFibration`, `TauCeti.MappingPathFiber`,
`TauCeti.MooreLoopSpace.homotopyEquivPath`.

**Checks.**
- The double cover `S¹ → S¹`, `z ↦ z²`: the unique lift is transitive and keeps durations, and
  transport along the generator of `π₁(S¹)` swaps the two points of the fibre, so the DG local
  system `TauCeti.liftingLocalSystem` of this lifting function is `ℤ²` in degree `0` with the
  generator acting by the swap, the permutation module of `π₀F`, not the sign representation.
- The Hopf fibration `S³ → S²`, locally trivial over a compact metric base, is a Hurewicz
  fibration; over every base the trivial bundle's projection is one by
  `TauCeti.isHurewiczFibration_fst`, so paracompactness enters only for nontrivial bundles.
- On the path fibration of `S¹`, fixed-interval concatenation of a path with loops is not
  associative (`(x · γ) · δ` and `x · (γ · δ)` differ by a reparametrization), so it is not an
  action, and the comparison is asserted only up to the specified homotopy; the Moore action is
  strictly associative.

### 2.3 The canonical homeomorphisms

State every homeomorphism for the **fixed-interval** path and loop models (`P^{[0,1]}`,
`Ω^{[0,1]}`), never for the Moore carriers, and compose each with the Moore comparison of the
conventions. Consume Tau Ceti's canonical homeomorphisms (supplier contracts): `Map_*(S¹, X) ≅ ΩX`,
`Map_*(S^k, X) ≅ Ω^k X`, `P_{⋆→Q}𝓛₀Q ≅ Map_*(S², Q)` and `P_{Q→Q}𝓛₀Q ≅ Map(S², Q)`, the
adjunction `Ω²X → Map(S¹, ΩX)` with its degree-raising map `β_* : H_*(Ω²X) → H_{*+1}(ΩX)`, the
section of `Map(S², Q) → Q` by constant spheres, `G × Map_*(S², G) ≅ Map(S², G)` for a
topological group with its Moore form, and `π_{j+1}(Ω^k X) ≅ π_{j+1+k}(X)`. Own:

- the `π₀` form of the shift, `π₀(Ω^k X) ≅ π_k(X)` as pointed sets for every `k ≥ 1`, natural in
  based maps (Tau Ceti has the shift in positive degrees,
  `TauCeti.BasedTopologicalSpace.piIteratedLoopSpaceMulEquiv`, and the degree-zero Moore form
  `TauCeti.MooreLoopSpace.zerothHomotopyEquivFundamentalGroup` for `k = 1`);
- the degree-raising map `β_*` for spaces in every universe and with coefficients in every
  module (Tau Ceti's `TauCeti.degreeRaising` takes `X` in the smallest universe and the ring as
  coefficients).

*Needs:* Tau Ceti's mapping-space homeomorphisms and `TauCeti.degreeRaising`,
`HomotopyGroup.pathLoopSpaceMulEquiv`, AlgebraicTopology Stage 4.4.

**Checks.**
- `π₀ Map_*(S², S²) ≅ π₂(S²) ≅ ℤ` by degree; the unbased `Map(S², S²)` has the same components,
  since `S²` is simply connected.
- `Ω²Tⁿ` has contractible components: `π_j(Ω²Tⁿ) = π_{j+2}(Tⁿ) = 0` for `j ≥ 1`, and the
  components are indexed by `π₂(Tⁿ) = 0`, so there is one.
- `H₁(Ω²S³) ≅ ℤ`, through `π₁(Ω²S³) ≅ π₃(S³) ≅ ℤ` and Layer 1 item 1.
- For `G = S¹`, `Map(S², S¹) ≅ S¹ × Map_*(S², S¹)` and `Map_*(S², S¹)` is contractible, since
  `π_j(Ω²S¹) = π_{j+2}(S¹) = 0` for every `j ≥ 0`.

### Examples

- `Ω(pt) ≅ [0, ∞)` (`TauCeti.MooreLoopSpace.lengthHomeomorph`), with concatenation the addition
  of durations.
- The path-loop fibration `ΩS¹ → PS¹ → S¹`, the Moore-path replacement of the inclusion of a
  point, with its transitive lifting function by concatenation.
- For `Q = S¹`, `𝓛S¹` has components indexed by the winding number, and `𝓛₀S¹ ≃ S¹` through
  the constant loops.

### Dependencies

Mathlib's compact-open topology on `C(X, Y)`; Tau Ceti's Moore paths, Moore lifting functions,
Moore-path replacement and comparison, Hurewicz fibrations, lifting functions, mapping-path
carriers, mapping-space homeomorphisms and `HomotopyGroup.pathLoopSpaceMulEquiv`;
AlgebraicTopology Stage 4.4 (the based circle and sphere models). Source: the source paper
§§5.2, 6.3, 6.4; Whitehead, *Elements of Homotopy Theory*, Chapter I; BDHO §7.1.

## Layer 3: DG local systems

The loop DG algebra `C_*(Ω_b B)` of normalized cubical chains on Moore loops, DG local systems
(the source's Definition 1.8) with their pullback along based maps and their families over
chosen basepoints, the chain bimodule of Moore paths between two basepoints, the DG local system
`C_*(F')` of a map with the strict quasi-isomorphisms to the DG local system of a transitive
lifting function, classical local systems as the DG local systems concentrated in degree zero,
rank-one twisting with the source's Lemma 2.1 and Proposition 2.2, and the action of `π₁` on the
homology of a DG local system are Tau Ceti's (supplier contracts, From Tau Ceti). This layer adds
basepoint change.

### 3.1 The loop DG algebra and DG local systems

Own the change of basepoint and the pullback along maps that do not preserve chosen basepoints.

- **Basepoint change.** For `b, b'` in one path component, Tau Ceti's DG
  `(C_*(Ω_b B), C_*(Ω_{b'} B))`-bimodule `C_*(P_{b→b'} B)` (`TauCeti.pathChain_isDGBimodule`)
  defines basepoint change as the **derived** tensor product of the DG roadmap's Layer 5,
  `𝓕 ↦ 𝓕 ⊗^𝐋_{C_*(Ω_b B)} C_*(P_{b→b'} B)`, to right modules over `C_*(Ω_{b'} B)`. Concatenation
  `P_{b→b'} × P_{b'→b} → Ω_b B` and its reverse give the quasi-isomorphisms showing that
  `C_*(P_{b'→b} B)` induces the inverse, so it is an equivalence of derived categories. The
  composite of two changes is the change along the composite, through a specified
  quasi-isomorphism. Conjugation by a Moore path is not a strict monoid map, so it is not used.
- **Disconnected spaces.** For families `(𝓕_c)` over chosen basepoints (Tau Ceti's
  `TauCeti.DGLocalSystemFamily`), pullback along an arbitrary `f : B' → B` sends the component
  `c'` to `f(c')`, restricts scalars at `f(b_{c'})`, and changes basepoint to `b_{f(c')}`; for
  maps preserving the chosen basepoints it is Tau Ceti's `TauCeti.DGLocalSystemFamily.pullback`.
  Independence of the chosen basepoints is a theorem, through basepoint change. Twisted complexes
  are direct sums over components. Layers 5 and 7–9 use this for `𝓛Q`, whose components are the
  free homotopy classes; for `Q = S¹` they are indexed by winding number (worked example 7).

*Needs:* Tau Ceti's DG local systems and `TauCeti.pathChain_isDGBimodule`, DGAInfinity Layer 5
(derived tensor products).

**Checks.**
- For `B = S¹`, `H_*(Ω_b S¹) = ℤ[t, t⁻¹]` in degree `0`, so a DG local system with homology in
  degree `0` is a `ℤ[π₁]`-module; basepoint change along a path is the identity on such modules
  and conjugation by the path's class on the monodromy, which is the identity since `π₁(S¹)` is
  abelian.
- The bimodule `C_*(P_{b→b'} B)` for `b = b'` is the regular bimodule, and basepoint change
  along it is the identity functor up to the specified quasi-isomorphism.
- Pullback along a degree-`2` map `f : S¹ → S¹` of the regular local system `C_*(Ω S¹)`: in
  homology it is `ℤ[t, t⁻¹]` as a module through `t ↦ t²`, free of rank `2` with basis `1, t`;
  a pullback that ignored the basepoint change would be undefined when `f` moves the chosen
  basepoint.

### Examples

- `C_*(Ω(pt)) ≃ A`; the DG local systems on a point are the chain complexes.
- On `S¹`, the derived category of DG local systems with homology in degree `0` is that of
  `ℤ[t, t⁻¹]`-modules, and the path fibration gives the regular module.

### Dependencies

Tau Ceti's loop DG algebra, DG local systems, path bimodules, DG local system of a map, classical
and rank-one local systems; DGAInfinity Layers 1 and 5. Source: BDHO Chapters 2, 5.1 and 7; the
source paper §§1.4 and 2.3.

## Layer 4: twisting cocycles and the twisted complex

Twisting cocycles on a finite graded set `P` (the source's Definition 1.9), with the twisting
equation `∂m_{x,y} = Σ_z (−1)^{ind x − ind z} m_{x,z} m_{z,y}` in the source's homological sign
convention and one-sidedness as data; the twisted complex `𝓕 ⊗⟨P⟩` with
`D(α ⊗ x) = ∂α ⊗ x + (−1)^{|α|} Σ_y α·m_{x,y} ⊗ y` and `D² = 0`; continuation and parametrized
cocycles (Definitions 1.10–1.11) with their chain maps and homotopies `Ψ¹ − Ψ⁰ = D⁻h + hD⁺`;
homologous cocycles; the index filtration (Definition 3.38) with its convergent spectral
sequence, whose second page is the homology of the classical complex with coefficients
`H_q(𝓕)`, and its maps under continuation; and the row-finite twisted modules over an arbitrary
graded basis are Tau Ceti's (supplier contracts, From Tau Ceti). This layer adds the Brown
resolution over an arbitrary CW complex, which Layer 5's derived-coefficient comparisons consume.

### 4.1 Arbitrary-CW Brown resolution before derived coefficients

Let `A` be a commutative coefficient ring and `B` a pointed connected CW complex with an
arbitrary small cell set. Put `R = C_*(Ω_b B; A)` on the normalized cubical Moore-loop carrier,
with its augmentation `ε : R → A`; retain `π₁(B)`, all components of `Ω_b B` and their action,
rather than assuming `B` simply connected. Construct the following objects before Layer 5's
fibration-chain or derived-coefficient comparisons. *Needs:* Tau Ceti's twisted complexes and
row-finite twisted modules, `TauCeti.loopChainAlgebra`, the cubical cross product and
cubical–simplicial comparison and the Moore paths; AlgebraicTopology Stage 4 (CW structures);
DGAInfinity Layer 5 (semi-free modules, derived tensor products).

- Over an arbitrary small graded basis, consume Tau Ceti's row-finite twisting cocycles
  `TauCeti.RowFiniteTwistingCocycle`: the direct sum `K_m = ⊕_{x ∈ P} R[ind x]` (finitely
  supported functions with the shift signs, not the unrestricted product `P → R`), its
  differential with `D² = 0` from the Maurer–Cartan rows and the DG Leibniz rule, continuation
  maps and homotopies, the recovery of the finite prototype `TauCeti.TwistingCocycle`, and the
  cell filtration by generator index. Own the one-sided well-founded attaching filtration that
  makes such a module semi-free; row finiteness alone constructs a complex, not a resolution.
  Carry arbitrary scalar, module and basis universes through upward transport.
- Construct a cell-filtered augmented semi-free left `R`-module `P_B` and a compatible
  `R`-linear chain comparison to `C_*(P_b B; A)`, where `P_b B` is the space of paths starting
  at `b` and `Ω_b B` acts by concatenation in front. For a characteristic disc `χ : Dⁿ → B`
  choose a path to its centre and follow the radial paths `χ(tv)` to construct a continuous
  family `τ_v` from `b` to `χ(v)`. Concatenation `(γ, v) ↦ γ ⋆ τ_v` identifies its pulled-back
  path fibration with `Ω_b B × Dⁿ` up to left-loop-equivariant homotopy; the inverse appends
  `τ_v` reversed, and the cancellation homotopies use Tau Ceti's Moore-path constructions.
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
  versions; finite `P` remains the illustrative special case `TauCeti.TwistingCocycle`.
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

- The Brown resolution of `S¹` and of `S²`, as in the Checks.

### Dependencies

Tau Ceti `IsDGAlgebra`, `IsDGRightModule`, twisted complexes and row-finite twisted modules,
`TauCeti.loopChainAlgebra`, Moore paths and cubical chains; DGAInfinity Layers 1, 4 and 5;
AlgebraicTopology Stage 4. Source: the source paper §1.4; BDHO Chapters 3–4.
## Layer 5: Morse homology with DG coefficients

This layer consumes Lane M of the Heegaard Floer roadmap for moduli spaces, compactness, gluing
and corner structures.

### 5.1 Representing chain systems

Construct fundamental chains rel boundary (Layer 0 item 1) of the compactified trajectory spaces
`L̄(x, y)` of every dimension (BDHO Theorem 5.2.1, HeegaardFloer Lane M), coherent with the
boundary product decomposition `∂L̄(x, y) = ⋃_z L̄(x, z) × L̄(z, y)`. Prove that they exist (BDHO
Proposition 5.2.6) and that any two are homologous through a specified family (BDHO Proposition
5.2.8). This holds over `𝔽₂`, and over `ℤ` with the orientation conventions of BDHO Appendix A.
*Needs:* Layer 0 item 1, HeegaardFloer Lane M.

**Checks.**
- For `ind x − ind y = 1` the chain is the signed count of rigid trajectories; for
  `ind x − ind y = 2` every intermediate `z` has `ind x − ind z = 1`, so the boundary equation
  `∂s_{x,y} = Σ_z (−1)^{ind x − ind z} s_{x,z} × s_{z,y}` (BDHO (5.12)) reads
  `∂s_{x,y} = −Σ_z s_{x,z} × s_{z,y}`, minus the gluing of broken trajectories; this is the sign
  of the twisting equation of Layer 4 in index difference `2`.
- On the height function of `S¹` with two critical points the two trajectory spaces are
  points and the representing system is the two signed points.
- The constant function has no trajectory spaces and the empty system is the unique one.

### 5.2 The Barraud–Cornea cocycle

Choose an embedded tree joining the critical points to the basepoint and a homotopy inverse of the
collapse map; evaluate the representing chains into Moore paths, then into `C_*(ΩB)`. Prove that the
result is a twisting cocycle (Tau Ceti's `TauCeti.TwistingCocycle`; BDHO §§3.1 and 5.2) and that its
twisted homology is independent of all choices up to specified continuation isomorphisms (BDHO
Chapter 6). *Needs:* item 1, Tau Ceti `TauCeti.MooreLoopSpace`, `TauCeti.TwistingCocycle` and
`TauCeti.ContinuationCocycle`.

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
diagrams. For a map `f : X → Y` of degree `d` between closed oriented manifolds of equal
dimension and a DG local system `𝓕` on `Y`, prove `f_* f_! = d · Id` on `H_*(Y; 𝓕)` (BDHO
Proposition 10.6.1), and over `𝔽₂`, for closed `X` and `Y` with no orientation hypothesis,
`f_* f_! = deg₂(f) · Id` by the same chain homotopy with the orientation factors dropped
(Layer 10 items 4 and 5 use the first and the second). For maps of manifold pairs construct the
absolute and relative Poincaré–Lefschetz versions with their boundary and collar hypotheses, maps
and boundary naturality. All nonorientable targets remain in scope with the displayed twists.
*Needs:* items 1–2, Layer 4, AlgebraicTopology Stage 6 (orientation system, cap products,
duality).

**Checks.**
- For `𝓕` concentrated in degree `0`, `H_*(B; 𝓕)` is Morse homology with classical local
  coefficients (worked example 3).
- For `f = id`, `f_! = id` and `f_* = id`; for the inclusion of a point `i : pt → B^n`, `i_!`
  has degree `−n`.
- For `B = ℝP²` and `𝓕 = ℤ` trivial, `H_*(B; ℤ)` is `ℤ, ℤ/2, 0`, and the Umkehr of
  `pt → ℝP²` lands in `H_{*−2}(pt; or_{ℝP²}|_{pt}) = ℤ`, with the twist visible as the sign
  ambiguity of the local orientation.
- For the double cover `f : S¹ → S¹`, `z ↦ z²`, and `𝓕 = ℤ`: `f_![S¹] = [S¹]` and
  `f_*[S¹] = 2[S¹]` in degree `1`, and `f_![pt]` is the two preimages, so `f_* f_! = 2 · Id`
  in degrees `0` and `1`. The other composite is not `d · Id` in general: for the degree-one
  collapse `T² → S²`, `f_! f_*` kills `H₁(T²) = ℤ²`.

### 5.4 The fibration theorem

For a Hurewicz fibration `F → E → B` over a closed connected manifold with the DG local system
`C_*(F')` of Tau Ceti's `TauCeti.fibrationLocalSystem`, prove `H_*(B; C_*(F')) ≅ H_*(E') ≅ H_*(E)`
(BDHO Theorem 7.2.1), first for fibrations with a transitive lifting function, then for all Hurewicz
fibrations by transport along the Moore-path replacement `E → E'`, which is a fibre homotopy
equivalence and has a transitive lifting function. Prove that the index spectral sequence is
isomorphic to the Serre spectral sequence from `E²` on, and that direct maps correspond to maps of
total spaces. For pullbacks along `f : X^m → B^n` between manifold bases, construct the base-induced
fibration Umkehr comparison with degree `m − n` and the pulled-back degree-zero `or_X ⊗ f^*or_B`
factors from item 3. A total space or fibre need not be a manifold; the map is constructed through
the base Morse and fibration-chain model, with its absolute and relative and coefficient diagrams.
*Needs:* items 1–3, Tau Ceti `TauCeti.fibrationLocalSystem`,
`TauCeti.MooreReplacement.fiberHomotopyEquiv` and `TauCeti.TwistingCocycle.indexSpectralSequence`,
Layer 1 item 2 (Serre spectral sequence).

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
nonorientable base. *Needs:* items 3–4, Tau Ceti `TauCeti.TwistingCocycle.indexSpectralSequence`,
AlgebraicTopology Stage 6.

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
  source's Corollary 2.13: for a map `σ : E → E′` of Hurewicz fibrations over the closed orientable `Y`,
  restricting to `σ : F → F′` on the fibres, with `E` a closed orientable manifold (so that
  `[E]` exists and `j_![E] = [F]` by the source's Remark 2.10) and `σ_*[F] ≠ 0`, the class
  `σ_*[E]` lives over the fundamental class in `E′ → Y`. The orientation-twisted variant
  replaces `[E]` and `[F]` by their twisted top classes under the same hypothesis on `E`, with
  the corresponding coefficient morphisms. Without the hypothesis on `E` there is no `[E]`: the
  path-loop fibration over `S²` has contractible total space.

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
items 1–4, RiemannianGeometry R2–R3, SmoothBundlesConnections B6.0, Layer 1 item 2 (weak
equivalences), Tau Ceti `TauCeti.MooreFreeLoopSpace`.

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
  systems have the colimit property of BDHO §13.2 for `𝓛Q`, by the weak equivalence of the next
  bullet, so the DG Morse homology of `𝓛Q` is the same through either; the cut is a choice of
  cutoff, not a third model.
- **Compact-family approximation** (the source's §4.3; Abouzaid §3.2). Define the sampling maps
  `evᵣ : 𝓛Q → Qʳ`, `γ ↦ (γ(0), γ(L_γ/r), …, γ((r−1)L_γ/r))`, continuous on the Moore space
  because the duration `L_γ` is. Prove the **compact-family approximation lemma**: for a compact
  `K ⊆ 𝓛Q`, durations are bounded on `K` and `K` is equicontinuous (Arzelà–Ascoli), so there is
  `r(K)` with `evᵣ(K) ⊆ 𝓛ʳQ` for `r ≥ r(K)`, and `geoʳ ∘ evᵣ|_K` is homotopic to the inclusion of
  `K` through the canonical homotopy that moves each arc `γ|_{[(i−1)L_γ/r, iL_γ/r]}` to the
  minimizing geodesic between its endpoints inside a convex ball and interpolates the durations
  linearly. It is natural in `K`. Deduce that `colim geoʳ : colim 𝓛ʳQ → 𝓛Q` is a weak homotopy
  equivalence (Abouzaid Proposition 3.2.4 states the homotopy equivalence; the weak version
  suffices by Layer 1 item 2): surjectivity on `π_k` by applying the lemma to the image of a
  sphere; injectivity by applying it to the image of a nullhomotopy in `𝓛Q` of `geoʳ ∘ σ`, for
  `σ : S^k → 𝓛ʳQ`, together with a homotopy inside `𝓛^{r'}Q`, for `r' ≥ r` large, between
  `ev_{r'} ∘ geoʳ` and the iterated `ι`, which slides the sample vertices along the broken
  geodesic while the consecutive distances stay below the cut (this is where the monotonicity
  `δᵢʳ ≤ δⱼʳ⁺¹` of the cutoffs is used). The same holds for the based and contractible
  components, `𝓛₀Q` included.

**Checks.**
- For `Q = S¹` with `r = 1`, `𝓛¹S¹ = S¹` is the constant loops, and `𝓛ʳS¹` for `r ≥ 2` has
  components indexed by the winding numbers reachable with `r` segments of length below the
  cut; the colimit recovers `𝓛S¹ ≃ ⊔_k S¹` (worked example 7).
- For `Q = pt` every `𝓛ʳQ` is a point and `H_*(𝓛Q; 𝓕) = H_*(𝓕)`.
- The constant loop `c` of duration `1` in `𝓛S¹`: `evᵣ(c)` is the constant tuple,
  `geoʳ ∘ evᵣ(c)` is the constant loop of duration `0`, and the homotopy of the compact-family
  lemma is the linear interpolation of durations; for `K = {c}`, `r(K) = 1` (worked example 10).
  A lemma claiming `geoʳ ∘ evᵣ = id` on `K` would fail here, since the durations differ.
- The cut `δᵢʳ` must be generic: Abouzaid's Exercise 3.2.7 (Kragh) shows `𝓛⁴_{(1,1,1,1)}ℝ²` is
  not a manifold with corners.

### Examples

- The height function on `S¹` and the path-loop fibration over `S¹`: the twisted complex over
  `ℤ[t, t⁻¹]` with `d = 1 − t` computes `H_*(PS¹) = H_*(pt)`.
- The Hopf fibration over `S²` with its DG local system `C_*(S¹)`.

### Dependencies

HeegaardFloer Lane M; Layer 0 item 1; Layers 2–4 and Tau Ceti's Moore paths, DG local systems and
twisted complexes; AlgebraicTopology Stage 6; RiemannianGeometry R2–R3 and
SmoothBundlesConnections B6.0 (item 6); Layer 1 item 2. Source: BDHO Chapters 5–13; the source
paper §§2.1–2.4 and 4.3–4.4; Abouzaid §3.2.

## Layer 6: Hamiltonian dynamics, Liouville domains, and capacities

This layer consumes symplectic manifolds and almost complex structures from Lane F2.1 of the
Heegaard Floer roadmap, together with F2.1's contraction inverse of a strongly nondegenerate
form, and the Hamiltonian formalism and flows of the pinned Tau Ceti (From Tau Ceti). Item 0
completes that formalism where the pins stop: Hamiltonian vector fields of weakly nondegenerate
forms, the Poisson bracket and first integrals on Banach manifolds, symplectic maps between
manifolds, and the linearized and incomplete Hamiltonian flows. Items 1–5 build on Tau Ceti's
periodic solutions, cotangent bundles, Liouville domains, closed characteristics, capacities and
almost existence property (supplier contracts) and add the action functional, the completion of
an abstract Liouville domain, the magnetic fibre translation, the Liouville-flow argument for
Corollary E, the ambient capacity of a subdomain and almost existence on almost every level.

### 6.0 Hamiltonian vector fields, symplectic maps and linearized flows

Throughout, `M` is a manifold with `[IsManifold I ∞ M]` modelled on a real normed space `E`
through `I : ModelWithCorners ℝ E H`, and `ω : TauCeti.SmoothTwoForm I M`. The pinned objects
are the equation `ι_X ω = df` (`TauCeti.SmoothTwoForm.IsHamiltonianVectorField`), the field
`X_f = (ω♭)⁻¹ df` (`TauCeti.SmoothTwoForm.hamiltonianVectorField`), the bracket
`{f, g} = ω(X_f, X_g)` (`TauCeti.SmoothTwoForm.poissonBracket`), the predicate "`{g, f} = 0`
everywhere" (`TauCeti.SmoothTwoForm.IsFirstIntegral f g`), and the maximal flows
`TauCeti.flowOf` and `TauCeti.timeDependentFlowOf`; most pinned theorems about them assume a
finite-dimensional model or a complete flow. This item states what the Floer layers use beyond
that.

Two strengths of nondegeneracy are used. *Weak* nondegeneracy is
`TauCeti.SmoothTwoForm.IsNondegenerate`: every flat map `ω♭_x : T_x M → (T_x M →L[ℝ] ℝ)`,
`v ↦ ω_x(v, ·)` (`TauCeti.SmoothTwoForm.flat`), is injective. *Strong* nondegeneracy is the
unbundled hypothesis `∀ x, Function.Surjective (ω.flat x)`.
- Strong implies weak in any model: if `ω_x(w, ·) = 0`, then every `ω_x(v, ·)` vanishes at `w`
  by antisymmetry, hence so does every continuous linear form, and `w = 0` by the Hahn–Banach
  theorem.
- On a Banach model (`[CompleteSpace E]`) strong nondegeneracy therefore makes every `ω♭_x` an
  isomorphism of Banach spaces, by the open mapping theorem. Its inverse on arbitrary covectors,
  the smooth dependence of that inverse on `x` and the specialization `ι_{X_f} ω = df` to
  differentials are HeegaardFloer F2.1's contraction inverse, which this item consumes and does
  not rebuild.
- In finite dimension the two strengths agree
  (`TauCeti.SmoothTwoForm.isNondegenerate_iff_isInvertible_flat`).

For a weakly but not strongly nondegenerate form the pinned field `(ω♭)⁻¹ df` is the junk value
`0` wherever `ω♭_x` is not invertible, even when `df_x` is of the form `ω_x(v, ·)`. Every
statement below that holds for weak forms is therefore stated for the predicate, on whatever
Hamiltonian vector fields exist, and the statements about `X_f` and `{f, g}` carry strong
nondegeneracy or no nondegeneracy at all.

**Hamiltonian vector fields.** For weakly nondegenerate `ω` in any model:
- uniqueness: two Hamiltonian vector fields of the same function are equal;
- zeros: a Hamiltonian vector field `X` of `f` vanishes at `x` exactly when `df_x = 0`, so its
  zeros are the critical points of `f` (Layer 7.C.6h).

With no nondegeneracy:
- the predicate is linear and satisfies the Leibniz rule: for differentiable `f`, `g` with
  Hamiltonian vector fields `X`, `Y`, the field `X + Y` belongs to `f + g` and `f • Y + g • X`
  to `f * g`, and `c • X` belongs to `c • f` for every `f`;
- the pinned field satisfies `X_{fg}(x) = f(x) X_g(x) + g(x) X_f(x)` at every point where `f`
  and `g` are differentiable, and `X_f(x)` depends only on the germ of `f` at `x`; its
  additivity, homogeneity and chain rule are the pinned
  `TauCeti.SmoothTwoForm.hamiltonianVectorField_add`,
  `TauCeti.SmoothTwoForm.hamiltonianVectorField_const_smul` and
  `TauCeti.SmoothTwoForm.hamiltonianVectorField_comp`.

**Hamiltonian functions.** A function is *Hamiltonian* when it is smooth and has a smooth
Hamiltonian vector field.
- For a strongly nondegenerate form on a Banach model every smooth function is Hamiltonian, by
  F2.1's `df` specialization and the smooth dependence of its inverse.
- For a closed form on a Banach model, with no nondegeneracy, let `X`, `Y` be smooth Hamiltonian
  vector fields of smooth `f`, `g`. Then `ω(X, Y)` is Hamiltonian, with the smooth Hamiltonian
  vector field `−[X, Y]`. This is the pinned
  `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.mlieBracket` (`[X, Y]` is a Hamiltonian vector
  field of `−ω(X, Y)`) together with the smoothness of the bracket of smooth fields.
- *Jacobi identity*: for a closed form on a Banach model, with no nondegeneracy, and
  differentiable Hamiltonian vector fields `X`, `Y`, `Z` of `C²` functions `f`, `g`, `k`,
  `ω([X, Y], Z) + ω([Y, Z], X) + ω([Z, X], Y) = 0`. Since `ω(Z, ·) = dk`,
  `ω([X, Y], Z) = −dk([X, Y]) = −X(ω(Z, Y)) + Y(ω(Z, X))`, and the pinned
  `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.mvfderiv_eval₂`
  (`d(ω(U, V)) = −ι_{[U, V]} ω`) turns the two derivatives into the other two terms.
- So for a closed weakly nondegenerate form on a Banach model, with `X_f` the unique Hamiltonian
  vector field of a Hamiltonian function `f`, the bracket `(f, g) ↦ ω(X_f, X_g)` makes the
  Hamiltonian functions a real Lie algebra, and a subalgebra of the smooth functions for the
  pointwise product, related to the bracket by the Leibniz rule. The map `f ↦ X_f` is linear,
  sends the bracket to `−[X_f, X_g]`, and its kernel consists of the functions with `df = 0`, the
  constants when `M` is preconnected.

**The Poisson bracket.** For the pinned `{f, g} = ω(X_f, X_g)`:
- on a Banach model with strongly nondegenerate `ω`, `{f, g}(x) = df_x(X_g(x))`, and the
  bracket of two `C^{n+1}` functions is `C^n` for `n ≤ ∞`;
- on a Banach model with closed, strongly nondegenerate `ω` and `C²` functions,
  `X_{{f, g}} = −[X_f, X_g]` and `{f, {g, k}} + {g, {k, f}} + {k, {f, g}} = 0`, the strongly
  nondegenerate cases of the Hamiltonian-function statements above;
- in any model, the Leibniz rule in each argument at a point where the two factors are
  differentiable: `{fg, k} = f{g, k} + g{f, k}` and `{k, fg} = f{k, g} + g{k, f}`.

Antisymmetry and additivity are the pinned `TauCeti.SmoothTwoForm.neg_poissonBracket` and
`TauCeti.SmoothTwoForm.poissonBracket_add_left`; in finite dimension the identities
`{f, g} = df(X_g)`, `X_{{f, g}} = −[X_f, X_g]` and the Jacobi identity for a closed form are the
pinned `TauCeti.SmoothTwoForm.IsNondegenerate.poissonBracket_eq_mvfderiv`,
`TauCeti.SmoothTwoForm.IsNondegenerate.hamiltonianVectorField_poissonBracket` and
`TauCeti.SmoothTwoForm.IsNondegenerate.poissonBracket_jacobi`.

**Conservation along integral curves.**
- *Constancy on an interval of times*: let `γ` be an integral curve of a vector field `X` on an
  open set `s` of times and `T ⊆ s` preconnected. If `f` is differentiable at `γ t` and
  `df(X) = 0` at `γ t` for every `t ∈ T`, then `f ∘ γ` is constant on `T`. The pinned
  `IsMIntegralCurveOn.apply_eq_of_mvfderiv_apply_eq_zero` is the case `T = s`, with `s` open
  and preconnected. For `X` a Hamiltonian vector field of `f`,
  `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.mvfderiv_apply_self` (`df(X) = ω(X, X) = 0`)
  turns this into conservation of energy on every interval of times; no nondegeneracy is used.
- *Evolution of an observable*: along an integral curve `γ` of any vector field `X`, `f ∘ γ` has
  derivative `df(X)` at every time where `f` is differentiable at `γ t`, which is the pinned
  `TauCeti.Manifold.hasDerivAt_comp_curve`; for `X` a Hamiltonian vector field of `g` of a weakly
  nondegenerate form, `df(X)` is the bracket of `f` and `g`. For the pinned bracket: on a Banach
  model with strongly nondegenerate `ω`, along an integral curve `γ` of `X_g` on an open set of
  times, `f ∘ γ` has derivative `{f, g}(γ t)` at every time where `f` is differentiable at
  `γ t`.
- *First integrals*: on a boundaryless Banach manifold, for a `C¹` vector field `X` and a
  differentiable `f`, `df(X) = 0` everywhere exactly when `f` is constant along every integral
  curve of `X` on an open interval. No form enters; for a weakly nondegenerate `ω` and the
  Hamiltonian vector field of a Hamiltonian function `g`, it characterizes the first integrals of
  `g`. For the pinned bracket: with strongly nondegenerate `ω` and `g` of class `C²` (so that
  `X_g` is `C¹` and has local integral curves through every point), `{f, g} = 0` everywhere
  exactly when `f` is constant along every integral curve of `X_g` on an open interval.
- *Poisson's theorem*: for a closed `ω` on a Banach model, with no nondegeneracy, let `X`, `Y`,
  `Z` be Hamiltonian vector fields of `C²` functions `f`, `g`, `k`, with `X` and `Y`
  differentiable. If `df(Z) = 0` and `dg(Z) = 0` everywhere, then `ω(X, Y)` is stationary along
  `Z`. The route is the pinned `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.mlieBracket`,
  which reduces the claim to `dk([X, Y]) = X(dk(Y)) − Y(dk(X))`, where `dk(Y) = −dg(Z)` and
  `dk(X) = −df(Z)` vanish identically. For a weakly nondegenerate form this says that the first
  integrals of `k` are closed under `(f, g) ↦ ω(X_f, X_g)`, and with strong nondegeneracy under
  the pinned bracket.

**Symplectic maps and symplectomorphisms.** Let `ω'` be a smooth two-form on a second manifold
`M'`, modelled on `E'` through `I'`; the models may differ.
- A *symplectic map* from `ω` to `ω'` is a map `φ : M → M'` with
  `ω'_{φ x}(dφ v, dφ w) = ω_x(v, w)` for all `x`, `v`, `w`, where `dφ = mfderiv I I' φ x`. For
  smooth `φ` this is `φ^* ω' = ω` for the pinned pullback `TauCeti.SmoothForm.mpullback`.
- The identity is a symplectic map; a composite of differentiable symplectic maps is one; out
  of a weakly nondegenerate form the differential of a symplectic map is injective at every
  point.
- A *symplectomorphism* from `ω` to `ω'` is a Mathlib diffeomorphism `φ : M ≃ₘ^n⟮I, I'⟯ M'`
  that is a symplectic map, a predicate on the diffeomorphism. For `n ≠ 0` its inverse is a
  symplectomorphism from `ω'` to `ω`.
- *Transport of Hamiltonian vector fields*, with no nondegeneracy: a differentiable symplectic
  map whose differentials are all invertible (`ContinuousLinearMap.IsInvertible`), such as a
  symplectomorphism or the inclusion of an open subset, pulls a Hamiltonian vector field `V` of
  `h` back, through Mathlib's `VectorField.mpullback`, to a Hamiltonian vector field of `h ∘ φ`,
  wherever `h` is differentiable along `φ`. For a symplectomorphism of class `C¹` the converse
  holds as well, for every function `h`: where `h` is not differentiable neither is `h ∘ φ`,
  and both differentials vanish.
- For such a map into a strongly nondegenerate form on Banach models,
  `dφ(X_{h ∘ φ}(x)) = X_h(φ x)`, `{h ∘ φ, h' ∘ φ} = {h, h'} ∘ φ`, and `φ` carries integral
  curves of `X_{h ∘ φ}` to integral curves of `X_h`, wherever `h` and `h'` are differentiable.
  For a symplectomorphism of class `C¹` the differentiability hypotheses drop:
  `dφ(X_{h ∘ φ}(x)) = X_h(φ x)` for every `h`, since where `h` is not differentiable neither is
  `h ∘ φ` and both fields vanish, and with it the bracket identity and the transport of integral
  curves hold for all functions. These extend the pinned finite-dimensional
  `TauCeti.SmoothTwoForm.IsNondegenerate.mfderiv_hamiltonianVectorField_comp`,
  `TauCeti.SmoothTwoForm.IsNondegenerate.poissonBracket_comp` and
  `TauCeti.SmoothTwoForm.IsNondegenerate.isMIntegralCurve_comp_hamiltonianVectorField`.
- *Open subsets.* The restriction of `ω` to `U : TopologicalSpace.Opens M` is its pullback along
  `Subtype.val`, symplectic when `ω` is (pinned
  `TauCeti.SmoothTwoForm.IsSymplectic.mpullback_subtype_val`). The inclusion is a symplectic map
  from the restriction whose differentials are the invertible
  `TauCeti.Manifold.tangentSpaceOpenEquiv`, so the transport statements apply to it. A canonical
  transformation between open subsets `U ⊆ M` and `U' ⊆ M'` is a symplectomorphism between the
  restricted forms.
- *Linear symplectomorphisms*: for finite-dimensional normed spaces, a linear symplectomorphism
  `e` in the pinned sense `TauCeti.SymplecticForm.IsSymplectomorphism` is a symplectomorphism of
  the constant forms `TauCeti.SymplecticForm.constSmooth`, as the diffeomorphism
  `e.toContinuousLinearEquiv.toDiffeomorph`.

**Linearized flows.** Here the model is finite-dimensional, `I` is boundaryless and `M` is
Hausdorff.
- *The variational equation of a time-dependent flow*: let `X` be a time-dependent vector field,
  jointly `C¹` on `ℝ × M`, and `Φ_{s,t}` its maximal flow `TauCeti.timeDependentFlowOf X s t`,
  with `((s, t₀), x)` in its domain `TauCeti.timeDependentFlowDomain X`. Let
  `e = extChartAt I (Φ_{s,t₀} x)` and, for a tangent vector `w` at `x`, `J(t) = de(dΦ_{s,t} w)`,
  the coordinate vector of `dΦ_{s,t} w` in `E`.
  Then for `t` near `t₀`, `J'(t) = DX̃_t(e(Φ_{s,t} x)) J(t)`, where `X̃_t` is the chart
  expression of `X t`, Mathlib's `VectorField.mpullbackWithin` along `e.symm` on the range of
  `I`. Only the spatial derivative of `X t` enters. The proof writes the flow in the chart in
  integral form and differentiates under the integral, as for the pinned vector-space statement
  `TauCeti.hasDerivAt_fderiv_timeDependentFlow`, with the `C¹` regularity of `Φ` from
  `TauCeti.contMDiffOn_timeDependentFlowOf`.
- *The autonomous variational equation*: the same statement for a `C¹` vector field `v` and its
  maximal flow `TauCeti.flowOf v`, with `(t₀, x)` in `TauCeti.flowDomain v` and the chart at
  `flowOf v t₀ x`.
- *Time-dependent Hamiltonian flows are symplectic*: let `ω` be closed, with no nondegeneracy,
  and `X` a jointly `C¹` time-dependent vector field such that each `X_t` is a Hamiltonian vector
  field of a `C²` function `H_t`. Every map `Φ_{s,t}` of the flow of `X` satisfies
  `ω_{Φ_{s,t} x}(dΦ_{s,t} v, dΦ_{s,t} w) = ω_x(v, w)` at every `x` with `((s, t), x)` in the
  domain. In the chart of the variational equation, `d/dt ω(J, K)` is `(L_{X_t} ω)(J, K)`, and
  `L_{X_t} ω = d(ι_{X_t} ω) + ι_{X_t} dω = d(dH_t) = 0`; for symplectic `ω` it is also
  HeegaardFloer F2.1's domain-local Moser lemma for the constant family `ω` and `α_t = −dH_t`.
  For symplectic `ω` and `H` jointly `C²`, the fields `X_{H_t}` are jointly `C¹` by
  `TauCeti.SmoothTwoForm.IsNondegenerate.contMDiff_hamiltonianVectorField_uncurry`, which is the
  case of a time-dependent Hamiltonian.
- *Autonomous Hamiltonian flows are symplectic*: for closed `ω`, with no nondegeneracy, the
  maximal flow of a `C¹` Hamiltonian vector field of a `C²` function preserves
  `ω` at every point of its domain, with no completeness hypothesis; the pinned
  `TauCeti.SmoothTwoForm.IsHamiltonianVectorField.mpullback_globalFlow` is the complete case.
  Conservation of first integrals along these flows is the pinned
  `TauCeti.SmoothTwoForm.IsFirstIntegral.apply_maximalIntegralCurve`.

So the linearized return map `dΦ_{0,1}` at a 1-periodic orbit of item 1 is a linear
symplectomorphism of `(T_x M, ω_x)`, and along the orbit `t ↦ dΦ_{0,t}` solves the linear
equation whose asymptotic operator Layer 7 compares with the linearized Floer operator.

*Needs:* Tau Ceti's Hamiltonian formalism and flows (From Tau Ceti); HeegaardFloer F2.1 (the
contraction inverse of a strongly nondegenerate form with its `df` specialization, and the
domain-local Moser lemma); DifferentialGeometry Layers 0–1 (pullback, exterior derivative and
Cartan's formula); Mathlib `mvfderiv`, `extChartAt`, `VectorField.mpullback`,
`VectorField.mpullbackWithin`, `VectorField.mlieBracket`, `ContinuousLinearMap.IsInvertible`,
local existence of integral curves of `C¹` fields on boundaryless Banach manifolds
(`exists_isMIntegralCurveAt_of_contMDiffAt_boundaryless`), the Hahn–Banach separation of points
by continuous linear forms (`exists_dual_vector`), and diffeomorphisms. Sources: McDuff–Salamon,
*Introduction to Symplectic Topology*, §3.1; Abraham–Marsden, *Foundations of Mechanics*,
Chapter 3 (Hamiltonian vector fields, Poisson brackets and the Lie algebra of Hamiltonian
functions, canonical transformations); Chernoff–Marsden, *Properties of Infinite Dimensional
Hamiltonian Systems*, for weak and strong nondegeneracy on Banach spaces; Hartman, *Ordinary
Differential Equations*, Chapter V, Theorem 3.1, for the variational equation.

**Checks.**
- Weak against strong. On a Banach space `V` with the canonical form
  `ω((q, α), (q', β)) = β q − α q'` on `V × StrongDual ℝ V` (the pinned
  `TauCeti.strongDualCotangentSymplecticForm`, made a constant two-form by
  `TauCeti.SmoothTwoForm.const`), `ω♭` is injective, and its image
  consists of the functionals `(q', β) ↦ a(q') + β(q)` with `a ∈ V*`, `q ∈ V`; a functional
  `(q', β) ↦ Ψ(β)` with `Ψ` in the bidual but not in the image of `V` is not hit. So `ω` is
  strongly nondegenerate exactly when `V` is reflexive. For `V = c₀` and the linear function
  `f(q, α) = a(q)`, the field `(0, −a)` satisfies `ι_X ω = df`, while the pinned
  `(ω♭)⁻¹ df` is `0`: a statement about `X_f` that ignored strong nondegeneracy would be false
  there, which is why the weak statements above are stated for the predicate.
- The bracket of a weak form. On the same `V = c₀`, `g(q, α) = α(b)` for `b ∈ V` has the
  Hamiltonian vector field `(b, 0)`, and `ω((0, −a), (b, 0)) = a(b)`: the bracket
  `ω(X_f, X_g)` of Hamiltonian functions is the constant pairing `a(b)`, the canonical relation
  between position and momentum coordinates, while the pinned `{f, g}` is `0` because both pinned
  fields vanish.
- Nondegeneracy is needed for uniqueness and zeros: for `ω = 0` on `ℝ²` and `f` constant, every
  vector field, `∂_q` among them, is a Hamiltonian vector field of `f`, and `∂_q` vanishes
  nowhere although `df = 0`.
- Leibniz on `(ℝ², dq ∧ dp)`: `X_q = −∂_p`, `X_p = ∂_q`, and
  `X_{qp} = q X_p + p X_q = q ∂_q − p ∂_p`, which satisfies
  `ι_X(dq ∧ dp) = q dp + p dq = d(qp)`; the bracket `{q, p} = ω(X_q, X_p) = 1 = dq(X_p)`.
- Values on different components of `s` need not agree: for `H(q, p) = p` on `(ℝ², dq ∧ dp)`,
  `X_H = ∂_q`, and the curve equal to `(t, 0)` for `t ∈ (0, 1)` and to `(t, 5)` for
  `t ∈ (2, 3)` is an integral curve of `X_H` on `(0, 1) ∪ (2, 3)` along which `H` takes the
  values `0` and `5`.
- Invertible differentials are needed for transport: the inclusion
  `(q₁, p₁) ↦ (q₁, p₁, 0, 0)` of `(ℝ², dq₁ ∧ dp₁)` into `(ℝ⁴, dq₁ ∧ dp₁ + dq₂ ∧ dp₂)` is a
  symplectic map; for `h = q₂`, `h ∘ φ = 0` has Hamiltonian vector field `0`, while
  `X_h = −∂_{p₂} ≠ 0`.
- The variational equation on `(ℝ², dq ∧ dp)` with `H = (q² + p²)/2`: `X_H = p ∂_q − q ∂_p`,
  `φ_t(q, p) = (q cos t + p sin t, −q sin t + p cos t)`, and `J(t) = R(t) w` for the matrix
  `R(t)` of `φ_t`; `R'(t) = A R(t)` with `A = [[0, 1], [−1, 0]] = DX_H`. Reading the equation
  with the transpose `Aᵀ` gives the opposite rotation.
- A flow that is not Hamiltonian need not be symplectic: `X = q ∂_q` on `ℝ²` has flow
  `(e^t q, p)`, which pulls `dq ∧ dp` back to `e^t dq ∧ dp`. The time-dependent
  `H_t(q, p) = t q` has `X_{H_t} = −t ∂_p` and flow `Φ_{s,t}(q, p) = (q, p − (t² − s²)/2)`, a
  translation, hence symplectic.

### 6.1 Time-dependent flows, periodic orbits and the action functional

The time-dependent Hamiltonian flow of `H` is Tau Ceti's maximal flow
`TauCeti.timeDependentFlowOf` of the fields `X_{H_t}` of item 0, with `ι_{X_H} ω = dH`. Its
1-periodic orbits are Tau Ceti's `TauCeti.periodicSolutions`, in bijection with the fixed points
of the time-one map; an orbit is nondegenerate when its starting point is a nondegenerate fixed
point `TauCeti.IsNondegenerateFixedPt` of the time-one map, that is, the linearized return map, a
linear symplectomorphism by item 0, has no eigenvalue `1`; on a closed manifold a Hamiltonian all
of whose 1-periodic orbits are nondegenerate has finitely many
(`TauCeti.SmoothTwoForm.IsNondegenerate.finite_periodicSolutions_hamiltonianVectorField`). Define
symplectically aspherical and atoroidal manifolds (conventions) and the action functional `𝒜_H`
on the contractible free loops (aspherical) and on all free loops (atoroidal), with the reference
loops and trivializations of the conventions; Tau Ceti has the capped action only for loops in a
symplectic vector space, `TauCeti.SymplecticForm.hamiltonianAction`, which is Layer 7.C's
`A_H(γ, D) = ∫ H dt + ∫_D ω` for the cone cap `D`. *Needs:* item 0, HeegaardFloer F2.1, Tau Ceti
`TauCeti.timeDependentFlowOf`, `TauCeti.periodicSolutions`, `TauCeti.IsNondegenerateFixedPt` and
`TauCeti.MooreFreeLoopSpace`, DifferentialGeometry Layer 3 (flows).

**Checks.**
- On `T*ℝ` with `ω_can = dq ∧ dp` and `H = p²/2` the vector field in the `ι_X ω = dH`
  convention is `p ∂_q`, since `ι_{p ∂_q}(dq ∧ dp) = p dp = dH`; the source's convention
  `ω(X, ·) = −dH` at the same form gives `−p ∂_q`, which is also the `ν`-transport of the
  source's field `p ∂_q` for `(ω_src, p²/2)` (worked example 9). A missing bridge,
  `X^{source}_{ω,H} = X_{ω,H}`, would give `p ∂_q` for the source's field at `ω_can` and is
  excluded. A bridge that negated the form instead of the Hamiltonian is not a different model:
  `ι_X(−ω) = dH` exactly when `ι_X ω = −dH`, so `X_{−ω,H} = X_{ω,−H}`, both `−p ∂_q` here.
- On `(ℝ²ⁿ, ω_std)` with `H = (|q|² + |p|²)/2`, the flow is the rotation of period `2π`, every
  orbit of period `1` is the constant orbit at `0`, which is nondegenerate since the linearized
  time-one map has eigenvalues `e^{±i}`.
- `T²` with `ω = dx ∧ dy` is symplectically aspherical, since `π₂(T²) = 0`, but not
  atoroidal, since the identity `T² → T²` has `∫ ω = 1 ≠ 0`; a definition that conflated the
  two conditions would put the standing action functional on all of `𝓛T²`, where it is
  multivalued.

### 6.2 Liouville domains

Consume Tau Ceti's Liouville domains `TauCeti.IsLiouvilleDomain ω λ W`, compact subsets of an
ambient manifold with `dλ = ω` and an outward Liouville field `ι_Z ω = λ` transverse to the
boundary level, Liouville vector fields `TauCeti.IsLiouvilleVectorField`, Hamiltonians linear at
infinity `TauCeti.IsLinearAtInfinity`, exact embeddings `TauCeti.IsExactLiouvilleEmbedding`, and
completions inside an ambient manifold `TauCeti.IsLiouvilleCompletion`. Own the completion of an
abstract Liouville domain: for a compact manifold with boundary `W` with a one-form `λ` such that
`dλ` is symplectic and the Liouville field is outward along `∂W`, construct the smooth manifold
`Ŵ = W ∪ [1, ∞) × ∂W` with the form `r λ|_{∂W}` on the end (Seidel §2(a), equations
(2.2)–(2.3), with the collar coordinate `r = log` of the radial coordinate used here; Abouzaid
Chapter 1), and prove that `W ⊂ Ŵ` satisfies `TauCeti.IsLiouvilleDomain` and
`TauCeti.IsLiouvilleCompletion`. *Needs:* Tau Ceti's Liouville domains and completions,
HeegaardFloer F2.1, DifferentialGeometry Layers 0–1 and 3.

**Checks.**
- The unit disc `D²ⁿ` with `λ = ½ Σ (p dq − q dp)` is a Liouville domain with `Z = ½(q ∂_q + p ∂_p)`;
  its completion is `ℝ²ⁿ`.
- `(D*Q, −λ_can)` is a Liouville domain with `Z = p ∂_p` (Tau Ceti's
  `TauCeti.CotangentBundle.isLiouvilleDomain_codiscBundle`); with `+λ_can` the field would point
  inward and the definition would fail at the boundary.
- A closed symplectic manifold is not a Liouville domain: `ω = dλ` forces `∫ ωⁿ = 0`.

### 6.3 Cotangent bundles

Consume Tau Ceti's cotangent bundle `TauCeti.CotangentBundle` with the Liouville form
`λ_can = p dq` and the canonical form `ω_can = −dλ_can` (conventions), the codisc and cosphere
bundles `D*Q` and `S*Q` of a Riemannian metric, `(D*Q, −λ_can)` as a Liouville domain with
Liouville field `p ∂_p` and its completion `T*Q`
(`TauCeti.CotangentBundle.isLiouvilleDomain_codiscBundle` and
`TauCeti.CotangentBundle.isLiouvilleCompletion_codiscBundle`, for compact boundaryless `Q` of
finite dimension), and the fibre translation `τ_α(q, p) = (q, p + α_q)` by a one-form, with
`τ_α^*λ_can = λ_can + π^*α` and `τ_α^*ω_can = ω_can − π^*dα`. Own the exact magnetic forms and
the magnetic fibre translation as a symplectomorphism. The source's magnetic form
`ω_src + π^*dσ` is carried by `ν` to `ω_can + π^*dσ`, since `π ∘ ν = π`. The translation
`Ψ'_σ = τ_{−σ}`, `Ψ'_σ(q, p) = (q, p − σ_q)`, satisfies `Ψ'^*_σ λ_can = λ_can − π^*σ`, hence is a
symplectomorphism `(T*Q, ω_can + π^*dσ) ≅ (T*Q, ω_can)` in the sense of item 0, covering the
identity of `Q`; it is `ν ∘ Ψ_σ ∘ ν⁻¹` for the source's `Ψ_σ(q, p) = (q, p + σ_q)`. This proves
the Theorem A and Theorem C forms of Corollary D from Layer 10 item 5. *Needs:* Tau Ceti
`TauCeti.CotangentBundle.symplecticForm` and
`TauCeti.CotangentBundle.mpullback_vectorBundleTranslateDiffeomorph_symplecticForm`, item 0,
DifferentialGeometry Layers 0–1.

**Checks.**
- On `T*ℝ`: `ω_can(∂_q, ∂_p) = 1` and `ω_can = −d(p dq)`; `ν^*ω_can = ω_src = d(p dq)`
  (worked example 9).
- `Ψ'^*_σ ω_can = ω_can + π^*dσ` for `Ψ'_σ(q, p) = (q, p − σ(q))`: with `σ = f(q) dq` on
  `T*ℝ`, `Ψ'^*_σ(p dq) = (p − f) dq` and `−d((p − f) dq) = ω_can + f'(q) dq ∧ dq = ω_can`,
  while `π^*dσ = 0` on `T*ℝ`; on `T*ℝ²` with `σ = x dy`, `π^*dσ = dx ∧ dy ≠ 0` and the identity
  is a genuine check of the sign.
- `D*Q` is compact exactly when `Q` is; for `Q = ℝ` the disc bundle is not a Liouville domain.

### 6.4 Hypersurfaces

Consume Tau Ceti's characteristic line of a regular level and the independence of closed
characteristics from the defining function, up to reparametrization
(`TauCeti.SmoothTwoForm.IsNondegenerate.exists_homeomorph_isMIntegralCurve_comp`; Hofer–Zehnder
Chapter 4), its Liouville vector fields (`L_Z ω = ω`, which for a fixed primitive `λ` is weaker
than `ι_Z ω = λ`), and contact and restricted contact type `TauCeti.IsContactType` and
`TauCeti.IsRestrictedContactType`, with the primitive explicit. Own the Liouville-flow argument
that gives the Theorem A and Theorem C forms of Corollary E from Layer 10 item 5: for `Σ` of
contact type, the flow of a Liouville field transverse to `Σ` carries `Σ` onto the nearby levels
of a defining function and conjugates their characteristic foliations, so contractible almost
existence near `Σ` gives a contractible closed characteristic on `Σ` itself. *Needs:* Tau Ceti's
closed characteristics and contact type, DifferentialGeometry Layers 0–1 and 3, item 2.

**Checks.**
- The unit sphere `S²ⁿ⁻¹ ⊂ ℝ²ⁿ` has characteristic foliation the Hopf circles, which are the
  periodic orbits of `|z|²/2`.
- `S*Q` with `λ = −λ_can` is of restricted contact type with Liouville field `p ∂_p`, whose
  time-`t` flow maps `S*Q` onto the cosphere bundle of radius `eᵗ` and conjugates their
  characteristic foliations, the cogeodesic flows; so almost existence near `S*Q` gives a
  contractible closed geodesic, as for `Q = S²`.
- Ginzburg's smooth hypersurfaces in `ℝ²ⁿ`, `2n ≥ 6`, without closed characteristics lie in a
  ball, of finite capacity, so almost every nearby level carries one: without the contact-type
  hypothesis the step from almost existence to existence on `Σ` fails.

### 6.5 Almost existence and capacities

Consume Tau Ceti's contractible almost existence property
`TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` (the source's Definition 1.1), the relative
capacity `TauCeti.SmoothTwoForm.relContractibleHZCapacity` (Definition 5.3), and the
`π₁`-sensitive capacity `TauCeti.SmoothTwoForm.contractibleHZCapacity σ W` of a set `W`, whose
admissible Hamiltonians exclude only the fast orbits contractible in `W` (Definition 6.1 for the
whole domain), with the existence of closed characteristics on a dense set of levels below a
finite capacity, `TauCeti.SmoothTwoForm.IsNondegenerate.exists_mem_Ioo_hasContractibleClosedCharacteristic`.
Own:

- the source's capacity `c°_HZ(U; W)` of a relatively compact open `U ⊂ W` with smooth boundary,
  inside a Liouville domain `W`, whose admissible Hamiltonians exclude the fast orbits
  contractible in `W` (Definition 6.1). It is monotone in `U`, bounds the relative capacity,
  `c°_HZ(V, Z) ≤ c°_HZ(V; W)`, and equals `TauCeti.SmoothTwoForm.contractibleHZCapacity σ W` for
  `U = W` (the source's remarks after Definition 6.1);
- Proposition 6.3 (Hofer–Zehnder, Struwe): finite `c°_HZ(W)` implies the contractible almost
  existence property in `W` for every regular level of a proper function inside `W`, by the
  monotonicity argument through Mathlib's `Monotone.ae_differentiableAt` on top of Tau Ceti's
  dense-levels theorem, including its relative version near a hypersurface (Hofer–Zehnder
  Chapter 4; Struwe 1990).

*Needs:* items 1–2, Tau Ceti's capacities and almost existence property, Mathlib
`Monotone.ae_differentiableAt`.

**Checks.**
- The capacity of a set with contractibility tested in that set is not monotone: for the annulus
  `A = {1 < |z| < 2} ⊂ D = {|z| < 2}` in `ℝ²`, every nonconstant orbit of a radial Hamiltonian
  supported in `A` winds once around the hole and is not contractible in `A`, so
  `TauCeti.SmoothTwoForm.contractibleHZCapacity` of `A` is `∞`, while that of `D` is
  `c_HZ(D) = 4π`; the ambient capacity is monotone, `c°_HZ(A; D) ≤ c°_HZ(D; D) = 4π`. For the
  ball `B²ⁿ(r)` the ordinary `c_HZ` is `πr²` (Hofer–Zehnder Chapter 3), and the contractible
  version agrees since the ball is simply connected.
- For the torus `T^r` the standing capacity `c°_HZ(D*T^r) = ∞`: a flat torus has no
  contractible closed geodesics, so no contractible closed characteristics on `S*T^r`.
- The almost existence property is not existence: Proposition 6.3 produces closed
  characteristics on almost every level, and a single level can carry none (Ginzburg's
  counterexamples), which is why Conjecture 1.2 is out of scope; Tau Ceti's theorem gives them
  only on a dense set of levels, which does not have full measure in general.

### Examples

- `T*ℝ` with `H = p²/2` and the rotation Hamiltonian on `ℝ²`, as in worked example 9.
- `(D*S¹, −λ_can)` as a Liouville domain whose completion is `T*S¹`.

### Dependencies

HeegaardFloer F2.1; DifferentialGeometry Layers 0–1 and 3; Tau Ceti's Hamiltonian formalism and
flows (`TauCeti.SmoothTwoForm.hamiltonianVectorField`, `TauCeti.SmoothTwoForm.poissonBracket`,
`TauCeti.flowOf`, `TauCeti.timeDependentFlowOf`), periodic solutions, cotangent bundles,
Liouville domains, closed characteristics, capacities and almost existence property; Mathlib
`Monotone.ae_differentiableAt`. Source: Hofer–Zehnder, *Symplectic Invariants and Hamiltonian
Dynamics*, Chapters 1 and 4; the source paper §§1.2, 5.1 and 6.1.
## Layer 7: classical Hamiltonian Floer homology and symplectic homology

This layer consumes PseudoholomorphicCurveAnalysis PH1–PH7 and Lanes F0–F2 of the Heegaard
Floer roadmap. Floer cylinders have domain `ℝ × S¹` and no boundary. Half-cylinders with boundary
on the zero section use the totally real boundary conditions of PH2.2 and PH3.4. Items 1–5 are
the standing theory on symplectically aspherical and atoroidal targets and on Liouville domains,
with the all-dimensional compactifications that Layer 8 twists; the three classical branches
7.C, 7.G and 7.T that follow have the count dimensions of their own identities and do not extend
Layer 8.

### 7.1 Floer cylinders, energy and the Conley–Zehnder index

Define Floer cylinders `u : ℝ × S¹ → X` solving `u_s + J_t(u_t − X_H) = 0` with `ι_{X_H} ω = dH`,
negative-end input and positive-end output, and prove the energy identity: for the
reference-cylinder action `𝒜_H = ∫ γ̄^*ω − ∫ H dt`, the energy `E(u) = ∫ |u_s|² ds dt` of a
cylinder from `x₋` to `x₊` is `𝒜_H(x₋) − 𝒜_H(x₊)`, so `𝒜_H` decreases along `s`. Take
HeegaardFloer F1.4's Conley–Zehnder index `CZ = −μ_RS` in the trivializations fixed by the
conventions; for `ι_{X_H} ω = dH` and a `C²`-small autonomous Morse `H`, the constant orbit at a
critical point `x` with the constant cap has `CZ = n − ind_Morse(H, x) = ind_Morse(−H, x) − n`,
as F1.4 writes it, and 7.C.0's `μ = −CZ` is the opposite sign of the same index. With this
grading and the differential that decreases `𝒜_H` along `s`, the complex of such an `H` is the
Morse complex of `−H` in degree `ind_Morse(−H) − n`, which is what the normalization
`FH_*(H) ≅ H_{*+n}(X)` of item 4 requires. The Maslov index of symplectic paths and loops is derived from Lane F1.4's Maslov
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
- On `ℝ²` with `H = (q² + p²)/2 · ε`, `ε` small, the constant orbit at `0` has `CZ = +1`
  in the normalization `FH_* ≅ H_{*+1}`, since `CZ = n − ind_Morse` with `ind_Morse = 0`,
  `n = 1`: `ι_{X_H} ω = dH` gives `X_H = ε(p ∂_q − q ∂_p)`, the clockwise rotation, whose
  linearization is `exp(tJS)` with `S = −εI`, and F1.4's `CZ = −sign(S)/2 = +1`; replacing `H`
  by `−H` gives `CZ = −1`. The opposite formula `CZ = ind_Morse − n` would give `−1` here and
  would contradict 7.C.0's Check on the minimum of `S²`, where `μ = −CZ = −1`.
- For a loop of symplectic matrices the Maslov index of its graph equals the winding of
  `det` of its unitary part, and `c₁(TS²)[S²] = 2` is the Chern number of the clutching loop of
  degree `2`.

### 7.2 Compactness, transversality and gluing

Prove compactness, transversality for generic `J` and gluing for Floer cylinders (Salamon §§2.6,
3.1 and 3.3; Audin–Damian Chapters 6–9, which construct them for the zero- and one-dimensional
spaces the differential uses), with topological manifolds-with-corners compactifications in
every dimension under the standing aspherical and atoroidal hypotheses (Barraud–Cornea,
*Lagrangian intersections and the Serre spectral sequence*, Appendix A, which the source's
§3.3.1 cites for these compactifications, `bdho-cotangent` lines 1615–1617).
Layer 0 item 1 consumes their oriented product-face fundamental-chain systems. The regular
analytic loci additionally carry the differentiable charts, tangent-kernel identifications,
evaluation and action maps and determinant comparisons used in constructing those spaces;
topological corners alone do not supply that analysis. *Needs:* item 1, HeegaardFloer F0, F1 and
F2.2–F2.5, Layer 0 item 1.

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
- On the circle with the height function (Morse case) the two trajectories from the maximum to
  the minimum carry opposite signs, so `∂(max) = 0` and the homology is `ℤ` in degrees `0` and
  `1`, which is `H_*(S¹)`. Equal signs would give `∂(max) = ±2 min`, hence `H₁ = 0` and
  `H₀ = ℤ/2`; `∂² = 0` holds for every choice of signs on this two-term complex, so it is the
  homology, not `∂² = 0`, that the signs decide.
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
  (worked example 6): on `T²` the four critical points of the height function of the embedded
  torus give `FH_{−1}`, `FH_0` and `FH_1` of ranks `1`, `2`, `1`, which are `H_0(T²)`, `H_1(T²)`
  and `H_2(T²)`. `S²` is not aspherical and is not an instance: it is the capped branch's
  monotone example, with the `ℤ/4`-graded cyclic formula of 7.C.5b.
- The continuation map for a constant homotopy is the identity.
- The action filtration shift: for `H_s = H + ε(s)` with `ε` nondecreasing from `0` at
  `s = −∞` to `δ` at `s = +∞`, the ends are `H_− = H` and `H_+ = H + δ`, so
  `𝒜_{H_+} = 𝒜_H − δ` on the same orbits and the continuation map, the identity on generators,
  shifts the filtration by exactly `δ`. A bump `ε` with `ε(±∞) = 0` has equal ends and shifts it
  by `0`, whatever its integral: the shift is `ε(+∞) − ε(−∞)`, not `∫ ε`.

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

Consume PseudoholomorphicCurveAnalysis PH3 for the planar interior and totally real boundary estimates, PH4.2 for the weak Floer equation as its inhomogeneous case, PH5.1–PH5.2 for elliptic bootstrapping and uniform estimates, PH6.3 for Fredholm theory and adjoint regularity with the cokernel identification, and PH7.2 for closed and bordered Riemann–Roch. Consume HeegaardFloer F0 and F1.1–F1.5 for Sobolev sections on strips and cylindrical ends, finite-order Sard–Smale budgets, spectral flow, the single Maslov/CZ index, relative c₁, determinant lines and signed puncture Riemann–Roch; F2.1–5 and F2.6a–d supply their stated local curve/sphere/factorization/simple marked-regularity floors. Full marked unforced genus-zero stable-map compactness over compact tame-J families is 7.C.2d. This roadmap constructs the rooted attachment/matching, varying frozen-structure and inhomogeneous fixed-asymptotic applications, every Morse-incidence application and the unstable two-marked constant raw-core normalization. HeegaardFloer's minimal-area zero/one-marked compactness keeps its extra area hypothesis. Consume MorseNovikov N1 as the generic support/completion owner; this roadmap proves its geometric finite-below and graded-chain adapters. Consume Layer 6 items 0–1 here for the actual Hamiltonian fields, their linearized flows and the time-dependent flows.

Layer 7.C uses the following capped contractible convention. It is the contractible capped theory on the two hypotheses stated in its heading; it uses `μ=−CZ_HF` on the same path, spherical cap changes, and the action `A_H=∫Hdt+∫_Dω`. Its positive-end input and negative-end output satisfy `u_s+J_t(u_t−X_H)=0` and are upward for `A_H`. The standing convention uses `CZ`, a reference-loop cylinder oriented from the orbit to the reference, and `𝒜_H=∫γ̄^*ω−∫Hdt`. On the contractible aspherical overlap with constant reference and zero reference cap, the same-H actions satisfy `𝒜_H(γ̄)=−A_C(H,γ,D)` when `γ̄` is oriented from the orbit to the reference. A standing trajectory has negative-end input `x₋`, positive-end output `x₊`, and `E=𝒜_H(γ̄₋)−𝒜_H(γ̄₊)`; for the fixed PDE `u_s+J_t(u_t−X_H)=0`, `𝒜_H` decreases along s. The t-independent equation is the negative-gradient equation for `−H` and has the same Morse degree as the source branch after reflection. Under the reflected Hamiltonian and cap reflection, `A_C(H∨,reflected x)=−A_C(H,x)`, so the two energy conventions agree. These identities use the stated zero-reference normalization; other reference choices may add constants. The convention identification is only with the standing complex on 𝓛₀X under asphericity alone, on the `Γ=0` overlap and at the reflected Hamiltonian `H∨`. Its overlap comparison uses the reflected Hamiltonian and contractible aspherical sector specified here.

Use `ι_(X_H)ω=dH`, `g_t(v,w)=ω(v,J_t w)` for compatible `J_t`,
`A_H(γ,D)=∫₀¹H_t(γ(t))dt+∫_Dω`, and
`u_s+J_t(u_t−X_H)=0`. On smooth loops prove `dA_H(ξ)=∫ω(ξ,γ̇−X_H)` and the weak-L² identity `grad A_H=−J_t(γ̇−X_H)`: these are upward gradient cylinders. For any Hˢ realization, construct this differential expression with its derivative loss into H^(s−1); the differential expression has precisely this weak-metric and derivative-loss meaning. Both asymptotic limits are part of the carrier. The homological input is the positive end `x₊`, and the output is the negative end `x₋`. Write `μ(x,D)=−CZ_HF(x,D)` on the **same** symplectic path. Consequently a small positive plane rotation has μ=1, `μ(x,const)=ind_Morse(H,x)−n`, and a cap change `D′−D=A` gives `μ(x,D′)=μ(x,D)+2c₁(A)`. Prove this identity from the actual extending-frame clutching loop, whose winding in the old frame is `−c₁(A)`.

On the actual aspherical overlap, where Γ=0, retain the path-level dictionary given by `v(s,t)=u(−s,−t)`, `H∨_t=−H_(−t)`, `J∨_t=J_(−t)` and reflected cap boundary parametrizations. The index identity is `CZ_HF(H∨,reflected cap)=−CZ_HF(H,cap)=μ_H`; the physical negative end of v is the positive-end input of u. These are the reflected equation, capped path and index identities. The chain-level comparison is a downstream submilestone of 7.C.4. After both complexes, counts, continuation maps and orientation lines exist, construct the quotient-then-negative-flow orientation reversal and the degree-dependent chain sign, if any, from the actual determinant and boundary exact sequences, then prove that the map intertwines reflected continuation. The standing comparison is on 𝓛₀X under asphericity alone. The resulting chain comparison is at H∨. The coefficient comparison is on Γ=0. μ remains a notation for the single supplied index. For the cylindrical linear model `D=∂s+B_s`, `B_s=J₀∂t+S_s`, apply F1.3 to `−B_s`: `ind D=SF(B)=−SF(−B)`. Check the scalar `B=tanh s` kernel `sech s`, cokernel 0, and index 1. Use the L² common-domain self-adjoint realization and the actual Lᵖ elliptic transport for `1<p<∞`; coefficient norm convergence, end invertibility and graph estimates are hypotheses of that application. The puncture formula in μ notation is `nχ(Σ)+2c₁^τ+Σ_positive μ−Σ_negative μ`. Use complex-oriented end reversal, stabilized matching exact sequences and determinant gluing; use the determinant exact sequences for kernels and cokernels. The constant-sphere adjoint comparison uses `deg K_(S²)=−2` and `c₁(TS²)=2` as different bundles.

**Checks.**
- The reflected Hamiltonian on constant orbits: for an autonomous Morse `H` and a critical point
  `x` with the constant cap, `μ_H(x) = ind_H(x) − n`, and `H∨ = −H` has `ind_{H∨}(x) = 2n − ind_H(x)`,
  so `μ_{H∨}(x) = n − ind_H(x) = −μ_H(x)`, as the identity
  `CZ_HF(H∨, reflected cap) = −CZ_HF(H, cap)` requires; a dictionary with `μ_{H∨} = μ_H` would
  contradict it already on the minimum of `S²` (`μ = −1` against `μ = 1`).
- The action comparison on the aspherical overlap: for a constant orbit at `x` with the constant
  reference loop and the zero cap, `𝒜_H = ∫ γ̄^*ω − ∫ H dt = −H(x)` and
  `A_C(H, γ, D) = ∫ H dt + ∫_D ω = H(x)`, so `𝒜_H = −A_C`; the same-`H` identity `𝒜_H = A_C`
  fails whenever `H(x) ≠ 0`.
- The scalar model `D = ∂_s + tanh s`: the kernel is spanned by `sech s`, which decays at both
  ends; the formal adjoint `−∂_s + tanh s` has kernel `cosh s`, which does not, so the cokernel
  is `0` and the index is `1`, equal to the spectral flow `+1` of `B = tanh s` from `−1` to `1`;
  the sign convention `ind D = SF(B)` is fixed by this instance, and `−SF(B)` would give `−1`.

*Needs:* PseudoholomorphicCurveAnalysis PH3, PH4.2, PH5.1–PH5.2, PH6.3 and PH7.2; HeegaardFloer F0, F1.1–F1.5, F2.1–F2.5 and F2.6a–d; MorseNovikov N1; Layer 6 items 0–2; conventions (sign dictionary); Salamon §§1.4 and 2.4.

### 7.C.1 Capped loop cover, periods and the time-dependent variational equation

Let `S_sph⊂H₂(X;ℤ)` be the image of the spherical Hurewicz map and put `Γ=S_sph/(ker ω∩ker c₁)`, Tau Ceti's `TauCeti.Floer.PeriodGroup` of `S_sph` with the area and Chern homomorphisms. Define caps equivalent when their glued difference pairs to zero with both ω and c₁; the classes of caps are Tau Ceti's `TauCeti.Floer.CapClass` of the torsor of caps under `S_sph`, with its recapping laws. This item constructs the geometric inputs that Tau Ceti's algebra takes as parameters: `S_sph`, the area and Chern homomorphisms on it, and the torsor of caps. Construct the cap cover of the contractible loop component by local cap transport, prove its topology and path lifting, and identify each fibre with a Γ-torsor. Construct the forgetful, recapping, gluing, smooth/Sobolev and reference-cap comparison maps. Prove evaluation of contractible loops has a constant-loop section and that its based-loop fibre retains the π₂ term; retain the π₁(X) contribution in the evaluation sequence instead of identifying π₁(L₀X) with π₂(X). Show the period/Chern transgression factors through the stated Γ-cover. The generator sector of this construction consists of contractible loops.

Assume every contractible one-periodic orbit of H is nondegenerate. Prove the corresponding subset of the time-one fixed set compact: x↦(t↦φ_H^t(x)) is continuous into the smooth loop space, loop free-homotopy classes are locally constant by short-geodesic homotopies, and hence its contractible preimage is open and closed in the compact fixed set. End nondegeneracy makes this subset discrete, so it is finite. Choose one cap per such orbit; all breaking and cap transport remain in this contractible sector. Other standing orbit sectors retain their own stated nondegeneracy hypotheses. Construct the action, its recapping law `A_H(A·x̃)=A_H(x̃)+ω(A)`, critical-point/fixed-point bijection and index independence modulo `2c₁(S_sph)`. Put `c₁(S_sph)=N_Cℤ` with `N_C>0` when nonzero; otherwise use an integer grading, without a minimum of an empty positive set.

**Checks.**
- `ℂPⁿ` with the Fubini–Study form: `S_sph = H₂(ℂPⁿ; ℤ) ≅ ℤ`, generated by the line `L` with
  `ω(L) > 0` and `c₁(L) = n + 1`, so `ker ω ∩ ker c₁ = 0`, `Γ ≅ ℤ` through `c₁`, and
  `N_C = n + 1`; a cap change by `L` shifts `μ` by `2(n + 1)`.
- `T²ⁿ`: `π₂(T²ⁿ) = 0`, so `S_sph = 0` and `Γ = 0` although `H₂(T²ⁿ; ℤ) ≠ 0`; a definition
  quotienting all of `H₂` by `ker ω ∩ ker c₁` would give a nonzero group there. Likewise
  `π₁(𝓛₀T²ⁿ) ≅ π₁(T²ⁿ) = ℤ²ⁿ` because the evaluation sequence retains the `π₁(X)` term, while
  an identification of `π₁(𝓛₀X)` with `π₂(X)` would give `0`.
- `S² × S²` with areas `(1, 2)`: for `A = (a, b)`, `ω(A) = a + 2b` and `c₁(A) = 2a + 2b`, the
  joint kernel is `0`, `Γ ≅ ℤ²`, `c₁(S_sph) = 2ℤ` and `N_C = 2`; `ω = κ c₁` fails for every `κ`
  (`(1, 0)` needs `κ = 1/2`, `(0, 1)` needs `κ = 1`) and `c₁ ≠ 0`, so neither branch hypothesis
  holds and the branch makes no claim about this target. The caps differing by `(1, −1)` have
  the same `c₁` but `ω = −1`, so they are not equivalent: a definition using `c₁` alone would
  identify them and lose the action shift.

*Needs:* 7.C.0; Layer 6 items 0–1 (item 0 for the variational equation); Tau Ceti `TauCeti.MooreFreeLoopSpace`, `TauCeti.Floer.PeriodGroup` and `TauCeti.Floer.CapClass`; HeegaardFloer F1.5; AlgebraicTopology Stage 8.3 (the spherical Hurewicz image).

### 7.C.1(i) Coefficient-torsor datum

From this cap cover construct the typed datum `(Γ,ω,c₁,ν=−ω)`, on Tau Ceti's `TauCeti.Floer.PeriodGroup`, and its Γ-torsor of cap classes `TauCeti.Floer.CapClass` over each orbit, with reference-cap coordinates and diagonal monomial changes over R[Γ]. This datum is available before either branch-specific coefficient classification. Its monotone injective-Chern and spherical-c₁-zero injective-period specializations are proved separately in 7.C.6a and 7.C.6e; each concrete matrix construction consumes its own specialization.

For the actual time-dependent flow `φ_t` prove, with a torsion-free connection,
`∇_t(dφ_t v)=∇_(dφ_t v)X_(H_t)` by differentiating a two-parameter variation. Compare the actual symplectic-frame ODE, including connection and frame derivatives, with the asymptotic operator of the cylinder linearization. This is the connection/frame form of the time-dependent variational equation of Layer 6 item 0: in a chart the Christoffel terms of `∇_t` and `∇_(dφ_t v)` cancel by torsion-freeness, and what remains is the chart equation `J'(t) = DX̃_t J(t)`.

**Checks.**
- `ℂPⁿ` normalized by `ω(L) = 1`: `κ = 1/(n + 1)`, the positive Chern generator `t = e^{L}` has
  degree `2(n + 1)` and `ν(t) = −ω(L) = −1`, which agrees with 7.C.6a's `ν(t) = −κ N_C`; the
  opposite sign `ν = ω` would make `t` rather than `t⁻¹` of positive valuation and reverse the
  direction in which the completion is taken.
- On `S² × S²` with areas `(1, 2)` two caps of one orbit differing by `(1, −1)` have actions
  differing by `ω(1, −1) = −1` and the same index, since `c₁(1, −1) = 0`: the torsor records a
  shift that `Γ` would not see if it were defined through `c₁` alone.
- The variational equation on `(ℝ², dq ∧ dp)` with `H = (q² + p²)/2`: `X_H = p ∂_q − q ∂_p`, the
  flow is the rotation `R_{−t}`, and both sides of `∇_t(dφ_t v) = ∇_{dφ_t v} X_H` equal
  `−J R_{−t} v`, where `J ∂_q = ∂_p`; the plausible misreading `∇_t(dφ_t v) = ∇_{X_H}(dφ_t v)`
  has right-hand side `0` here, since `dφ_t v` is a constant vector field.

*Needs:* 7.C.1; MorseNovikov N1; Layer 6 item 0 (the variational equation).

### 7.C.1a Auxiliary Morse comparison complex

Fix an auxiliary Morse–Smale pair (f,g) independently of Hamiltonian H. Consume HeegaardFloer Lane M and its explicit MorseTheory M1–M6 and DifferentialGeometry flow prerequisites for the Morse-function, normal-form, sublevel, attachment and dynamics foundations. Consume that same Lane M1–M5 for the oriented homological Morse complex MC_j(f,g;R), its signed Morse/singular comparison and ordinary Morse continuation. Define M_i=MC_(i+n)(f,g;R), d_M=d_MC; a generator of Morse index j has degree j−n and its coefficient differential is zero. In the positive-monotone coefficient model give e^A degree 2c₁(A), so x⊗e^A has total degree j−n+2c₁(A). Build this comparison complex independently of autonomous Floer trajectories; PSS sections and equivalences use it. The small autonomous Hamiltonian construction in 7.C.5 is a later specialization: for H=εf with ε>0 sufficiently small and a realized compatible Morse–Smale metric, prove the positive-rescaling normalization and the ordinary Morse-continuation comparison between the realized metric and the auxiliary metric, using HeegaardFloer Lane M1–M5. this roadmap owns this Floer specialization and all PSS constructions. The auxiliary Morse complex precedes both PSS and the autonomous trajectory comparison; this metric-comparison target consumes ordinary Morse continuation.

**Checks.**
- `S²` with the height function (`n = 1`): the minimum and maximum have Morse indices `0` and `2`,
  so `M` has one generator in each of the degrees `−1` and `1`, matching the capped indices
  `μ = ind − n` of the two constant orbits of a `C²`-small `H = εf` (Examples).
- `ℂPⁿ` with the standard perfect Morse function: indices `0, 2, …, 2n` give degrees
  `−n, −n + 2, …, n`, and in the positive-monotone model `x ⊗ e^{L}` has degree `j − n + 2(n + 1)`,
  so `M ⊗ R[Γ]` is `R` in exactly the degrees `i` with `i + n ≡ 0, 2, …, 2n` modulo `2(n + 1)`,
  the degrees of the conventions Check above.
- Without the shift (`M_i = MC_i`) the minimum would sit in degree `0`, contradicting
  `μ(x, const) = −n` for the complex minimum that 7.C.2a uses as its reference.

*Needs:* HeegaardFloer Lane M with MorseTheory M1–M6; 7.C.0.

### 7.C.2 Cylinder and seam analysis

Construct the Banach configuration spaces with specified capped ends, exponential decay charts, the regularity bootstrap of PH5.1 applied to Floer's equation as the inhomogeneous case of PH4.2, and the Floer section. Its covariant derivative is

`∇sξ+J_t∇tξ−J_t∇ξX_H+(∇ξJ_t)(u_t−X_H)`.

Prove its end comparison, Fredholm index `μ(x̃₊)−μ(x̃₋)` for cap-matched ends, and, for fixed reference caps and cylinder class `A_cyl=D₋+u−D₊`, index `μ(x̃₊)−μ(x̃₋)+2c₁(A_cyl)`. Prove the fixed-H energy formula `E=A_H(x̃₊)−A_H(x̃₋)` for matched caps, where `E=∫ω(u_s,J_tu_s)`; choose compatible J throughout this closed capped branch, so this is its actual metric energy. The tame-data application and comparison are constructed in 7.C.2c.

For nonstationary cylinders prove the FHS injective-point/separation theorem for `(s,t)↦(u(s,t),t)`, including separation from asymptotic orbits, and the localized universal perturbation/adjoint argument for generic periodic J. State and prove the regularity budget on every parameter window. Treat `u(s,t)=γ(t)` separately: the identical nondegenerate end operator makes its constant-cylinder linearization invertible; the translation action is not free there. Any use of the symmetric-matrix lemma in the transversality proof must establish its orthogonality condition. With orthogonal J, symmetric S_mat, `C_J=S_matJ−JS_mat`, `L=C_J−aI−bJ`, `Lz=0`, prove `LJz=2bz−2aJz`; the adjustment `(α,β,ξ)↦(α−2tb,β+2ta,ξ−tJz)` preserves `Lξ−(α+βJ)z`. Choose t to make `ξ⊥Jz`, and construct the symmetric complex-linear matrix taking z to ξ. Use this algebra in the localized analytic proof with its actual range and regularity estimates.

For an arbitrary symplectomorphism ψ, construct the **linear seam application** with `u(s,t+1)=ψ⁻¹u(s,t)`, compatible `J_(t+1)=dψ⁻¹ J_t dψ`, bundle gluing, nondegenerate asymptotics, reference trivializations and the signed F1 index/determinant comparison. A cylinder joining constant fixed points lies in a specified seam component; an action is used only with a supplied period homomorphism/reference cap or cylinder and a proved energy identity. For `ψ=φ_H¹`, additionally construct the global equation identification in the contractible untwisted sector: `w(s,t)=φ_H^t(v(s,t))` takes the ψ⁻¹ seam to periodic w and transforms `v_s+J'_t v_t=0` to `w_s+J_t(w_t−X_H)=0`, with `J'_t=(dφ_H^t)⁻¹J_t dφ_H^t`. Prove the cap, action, class, asymptotic and determinant transport. The arbitrary-ψ output is this linear seam theorem; the global equation/cap transport here uses ψ=φ_H¹.

**Checks.**
- The stationary cylinder `u(s, t) = γ(t)` with matched caps has `A_cyl = 0`, index `0` and
  energy `0`, and its linearization is the invertible end operator; it is not a free orbit of
  the translation action, so it contributes to no count of positive dimension.
- For `ψ = φ_H¹` and `w = φ_H^t ∘ v`: `w_s = dφ_H^t v_s` and `w_t − X_H(w) = dφ_H^t v_t`, so
  `w_s + J_t(w_t − X_H) = dφ_H^t (v_s + J'_t v_t)` with `J'_t = (dφ_H^t)⁻¹ J_t dφ_H^t`; for `H = 0`
  the seam is plain periodicity and `J' = J`.
- The symmetric-matrix identity in dimension `2`: with `S_mat = diag(1, −1)` and `J ∂_q = ∂_p`,
  `C_J = S_mat J − J S_mat` has matrix `[[0, −2], [−2, 0]]`, with eigenvector `z = (1, −1)` of
  eigenvalue `2`; so `L = C_J − 2I` kills `z` with `(a, b) = (2, 0)`, `Jz = (1, 1)` and
  `LJz = (−4, −4) = −2aJz`, as `LJz = 2bz − 2aJz` predicts, whereas a `C_J` commuting with `J`
  would give `LJz = 0`.

*Needs:* 7.C.0–7.C.1; PseudoholomorphicCurveAnalysis PH4.2 and PH5.1; HeegaardFloer F0, F1.1–F1.4, F2.2a and F2.2c; Salamon §§2.1–2.7; Floer–Hofer–Salamon Lemma 6.5.

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

**Checks.**
- The cap-pairing coefficient `(−1)^{μ+n}` is `+1` at the complex minimum `μ = −n` and at the
  maximum `μ = n`, and `(−1)^{n+1}` at an index-`(n + 1)` Morse generator, where `μ = 1`; the
  swapped evaluation has coefficient `+1` throughout and differs from `γ_min` exactly at odd
  `μ + n`.
- The Morse zero face: the determinant `(−1)^k`, the readout `(−1)^{k−n}` and the family factor
  `(−1)^n` multiply to `+1` for every `k`; without the family factor the product is `(−1)^n`,
  which on `S²` would read the identity face as `−Id`.
- The parameter readout `(−1)^{i+j+ij}` at `j = 0` is `(−1)^i`, the coefficient of the identity
  functional, and at `(i, j) = (0, 1)` is `−1`, which with the family factor gives the
  degree-one inverse-homotopy readout `(−1)^{n+1}` stated above.

*Needs:* 7.C.2; 7.C.1a; HeegaardFloer F1 (determinant lines).

### 7.C.2b Raw individual continuation sections

Construct fixed-end data `(H_(s,t),J_(s,t))` with compatible J, nondegenerate Floer ends and finite `∫sup_X|∂sH|`. Raw configuration/section bundles, vertical linearizations, Fredholm/evaluation maps and cap classes may retain those ends as unselected parameters. Their selected instantiation consumes the regular cylinder/end data and shared t-parametrized sphere-evaluation families constructed in 7.C.3. Fix those selected ends before selecting the individual continuation section. Vary H_s by genuine compactly supported smooth interior variations, together with J, preserving the selected tails.

*Needs:* 7.C.2; the selected ends of 7.C.3.

#### 7.C.2b(0) Raw cylinder homotopy and composition templates

Before selecting interiors construct the parameterized cylinder domains for interpolation homotopies and composition: fixed capped asymptotic ends, end markers and cylindrical coordinates; finite neck length, neck/cutoff profiles and their compactified parameter coordinates; smooth one-forms H_(p,s,t)dt or the declared more general K, compatible J_(p,s,t), fixed-tail jets and matching cap/reference maps. At this raw stage face sections are unselected variables satisfying the stated restriction/corner equations. A zero-length identity uses the raw stationary cylinder, not a two-marked PSS sphere. Construct the raw Sobolev sections, compact-parameter K-curvature allowances, evaluation maps and determinant pullbacks. Establish raw energy-cutoff compactness and conditional gluing for these cylinder templates independently of any Morse/PSS data. After the cylinder ends and individual continuation sections are selected, insert those selected pieces as actual regular true faces, then perform the face-flat relative interior selection. The PSS comparison-domain templates below are separate carriers.

*Needs:* 7.C.2b.

#### 7.C.2b(i) Smooth perturbation synthesis and the continuation face-free carrier

Fix the domain/end metrics, target connections, parameter coordinate windows, bundle charts, end weights and configuration windows. At each finite F0 section/evaluation/projection differentiability budget record the finite mixed derivative list I_m, the finite list P_m⊂[1,∞) of integrability exponents, and the positive domain weights w_(m,α,β,γ,q). Include every derivative needed by the actual Sobolev multiplication and trace theorems for that budget. A perturbation direction is e=(A,δK), where A is a compatible-J bundle-chart direction and δK is a smooth domain Hamiltonian one-form (δH_sdt in the individual continuation instance). For each B=A,δK and each (α,β,γ)∈I_m include the linear coefficient seminorms

`sup_(p,z,x) w_(m,α,β,γ,∞)(p,z)|∂p^α∇z^β∇X^γ B(p,z,x)|`,

`sup_p (∫_Σ [sup_(x∈X) w_(m,α,β,γ,q)(p,z)|∂p^α∇z^β∇X^γ B(p,z,x)|]^q dvol_Σ)^(1/q)` for q∈P_m.

The lists include all mixed parameter/domain/target derivatives, for both A and δK, through the specified finite budgets; the weights and norms are fixed independently of the perturbation. Include C^m seminorms on the first m compact exhaustion charts. The global A₀ controls also include the unweighted compatible-J and δK C⁰ norms, `sup_(p,z,x)|∇_XδK|`, and `sup_p∫_Σ sup_X(|d_ΣδK|+|∇_XδK|)dvol_Σ`. The target supremum is inside every domain integral. Derive the corresponding linear multiplication/weighted-Sobolev operator bounds, using dense compactly supported test sections for their operator norms. Define A_m by the finite sum of these controls and all earlier A_j. Prove each compact testing-library element finite for these fixed norms, including its transported cutoffs and weights. Prove lower semicontinuity under C^∞_loc: coefficient suprema use suprema, coefficient integral norms use Fatou followed by sup_p, and linear operator norms use dense compact tests with the actual source/target norm comparisons.

For a countable dense local testing library e_ν set `w_ν=2^ν max(1,A₀(e_ν),…,A_ν(e_ν))`. Prove the ℓ¹(w_ν) series converges in C^∞_loc and in every controlled global seminorm, by applying the lower-semicontinuity bounds to its tails. Its closed-kernel quotient is a complete separable Banach space injected into smooth fields. Instantiate it first on the individual continuation cylinder with free compact interior δH_s and A directions. Using `J(A)=exp(A)J_base exp(−A)`, prove the finite-order chain-rule and Sobolev–Moser estimates for composition with every controlled configuration map, including evaluation, trace and parameter derivatives. These estimates establish the universal section and projection maps C^ℓ on each declared configuration window from the stated linear coefficient controls. The synthesis seminorms are the stated linear coefficient and linear operator controls. Require A to lie in the symplectic Lie algebra and satisfy AJ_base=−J_base A. Then exp(A) is symplectic and J(A)=exp(A)J_base exp(−A) is compatible; prove the compatible-J local chart and the uniform metric bounds on the specified small chart balls. Expanding the Hamiltonian curvature gives `sup_p∫_Σ sup_X|R_(K+δK)−R_K|≤C₁‖e‖+C₂‖e‖²`: the quadratic bracket is bounded by the global first-target-derivative supremum times its L¹ domain integral, and background brackets and d_ΣδK by the stated linear controls. This proves the global bound on tails and necks with the fixed metrics. The face-free construction uses only these coefficient/global norms.

Build the individual continuation universal section and its simple-sphere/marked-incidence families at the actual attachment structures J_(s,t), together with their shared core and matching evaluations. On each fixed end J_(s,t)=J_t, use the previously selected t-parametrized sphere/evaluation families: attachments with equal t share that same J_t even if their s coordinates differ. Vary the continuation core only in its allowed interior directions and make its evaluations transverse to these fixed end families. In free regions apply the conditional grouped theorem below with its actual domain-localized variations. Sphere tuples allow repeated classes and have pairwise-distinct simple images in the reduced incidence problem. Prove the combined adjoint range, finite F0 budgets, matching transversality and simple-image reductions; constant core solutions are detected by δH_s, while spheres receive no δH_s variation. Select simultaneously on countable class/energy/index/attachment windows. The s-independent identity has its separate invertible stationary operator with identical nondegenerate ends. These selected individual constructions precede homotopy/composition faces and retain the end incidence data in all subsequent restrictions.

For a domain-dependent Hamiltonian one-form `K=K_s ds+K_t dt`, define `X_K` componentwise with `ι_Xω=dH`. Set `{F,G}=ω(X_F,X_G)` and `R_K=∂sK_t−∂tK_s−{K_s,K_t}`. Derive `E_K=∫ω(u_s−X_(K_s),u_t−X_(K_t))=∫u*ω+∫∂ K(u)−∫R_K(u)dsdt` for `(du−X_K)^(0,1)=0`. With capped ends it gives the corresponding action/class identity; for K=H_sdt it is the displayed continuation formula. Prove uniform `∫sup_X|R_K|` bounds on each declared compact parameter window, including neck/stretching/cutoff ranges and the admissible perturbations, with actual end actions/periods and compact target giving the necessary energy cutoffs. Include domain-dependent K variations in this curvature budget.

*Needs:* 7.C.2b; HeegaardFloer F0 (Sobolev budgets).

#### 7.C.2b(ii) Raw PSS sections with common poles

Use two fixed globally parametrized planes with Morse pole z=0 and Floer puncture at infinity. Fix their complex coordinates, tangent frames and cylindrical end coordinates once. In the positive-end chart write z=exp(2π(s+it)), and in the negative-end chart z=exp(−2π(s+it)); use the corresponding fixed inversion coordinates at infinity. On the positive plane take β₊H_tdt, zero near0 and equal to H_tdt on its Floer end; use the corresponding negative-end cutoff on the negative plane. Prescribe K=0 and a common domain-independent compatible J_pole=J₀ on fixed discs at both poles, treating J₀ as unselected data at this raw stage. Pair compatible domain-dependent J outside these discs with genuine interior/core/neck Hamiltonian one-form variations δK, zero on the pole discs and fixed Floer tails. Each nonsphere plane of every matching configuration has its own nonempty free δK region. Construct the raw Banach fibre-product sections with the outgoing negative-gradient Morse ray to q on `[0,∞)` and incoming ray from p on `(−∞,0]`, capped ends and evaluation maps. For a single fixed basic datum, the pre-incidence Fredholm indices are n+μ(x̃₊) and n−μ(x̃₋), giving μ(x̃₊)−(ind q−n) and (ind p−n)−μ(x̃₋) after incidence, with all class and parameter corrections. The selected instantiation of these raw planes uses the earlier regular Floer ends and their full t-parametrized sphere-incidence/evaluation data from 7.C.3, together with the independently selected pole datum J₀. This selection occurs before regular plane data or inverse-family true faces are chosen.

*Needs:* 7.C.2b(i); 7.C.1a; the selected ends of 7.C.3.

#### 7.C.2b(iii) Unselected comparison-domain templates

Construct the finite Morse-segment, finite Floer-neck, middle-cutoff and cutoff-zero domains, positive nodal smoothing ray, compactified parameter faces, cap/evaluation carriers and cutoff formulas with J₀ and broken-face sections as unselected parameters. The domains, end labels, constraints and matching maps precede any lane's regularity/count theorem. Instantiate their jets and actual sections separately with compatible or uniformly tame J. For each raw finite-neck compact-sphere domain fix smooth K_*∈Ω¹(Σ;C^∞(X)), zero on fixed pole discs with prescribed cutoff/end matching. Near cutoff-zero use K_R^base=R K_* and J_R^base=J₀. The actual R=0 section is the full two-marked unforced J₀-sphere section with its explicit unstable-constant normalization; the other templates retain their fixed nondegenerate Floer asymptotics. Substitute selected continuation/PSS/Morse pieces only in later true-face constructions with their actual regularity and matching corner jets. True-face flatness is all-order vanishing at the face.

*Needs:* 7.C.2b(ii).

#### 7.C.2b(iv) Distinct-image separation and conditional joint evaluation

Consume HeegaardFloer F2.2a and F2.2c for the two-map unique-continuation and accumulation-to-factorization floors, and F2.6a–d for sphere domains, single-map factorization and marked quotient/evaluation carriers. Construct the application theorem that two simple maps with distinct images share no open image germ. For a finite tuple for one common J, either ω-compatible or ω-tame, prove that each map has a dense set of injective regular points avoiding all other full simple images and the prescribed finite marked test values. Remove the finite union of the closed other-image preimages with empty interior and the noninjective/critical locus. Specify the actual allowed variation space: a J-tangent Y satisfies YJ+JY=0; in the compatible lane ω(v,Yw) is additionally symmetric, while the tame lane has no such symmetry constraint and is restricted by the chosen open uniformly tame chart. Prove the localized range theorem separately in these two spaces. With disjoint allowed target/domain-localized tests, the combined adjoint equation first kills sphere cokernels; unique continuation and actual matching equations then kill the remaining finite evaluation dual variables. State the finite-F0 theorem for the supplied sphere quotient/evaluation carriers, smooth incidence maps, matching rank conditions, orientations and relative parameter restrictions. Class tuples may repeat while reduced simple images are distinct. This conditional theorem does not select data or construct a Morse datum. Its pure cylinder application uses core/orbit evaluations; Morse-chain, critical-point and broken-Morse applications separately supply HeegaardFloer Lane M and 7.C.1a strata with their actual dimensions.

For a supplied domain-parametrized problem with specified variation space, fixed regions, collision strata and face restrictions, group sphere attachments by their actual common structure in the chosen tame or compatible lane. Wherever the structure depends only on t, every equal-t attachment belongs to the same group, including distinct s or domain points. Fixed pole groups use J₀. Free domain attachment points admit independent localized directions only when those directions belong to the supplied variation space. Apply the common-J theorem within a group and prove the resulting conditional combined range and restriction laws. Actual continuation/PSS applications instantiate this theorem after their carriers and strata exist: fixed end/tail groups consume the selected t-families, free groups consume their actual interior directions, and relative true faces consume their previously selected face data. Their collision, matching, smooth-selection and corner laws are construction outputs of those applications. The grouped theorem uses the selected lane’s actual tangent space and coefficient/coercivity bounds; a compatible-only range theorem is not an input to the arbitrary-tame conclusion.

*Needs:* HeegaardFloer F2.2a, F2.2c and F2.6a–d; 7.C.2b(i).

#### 7.C.2b(v) Compact exhaustion within each actual stratum

For every finite component/class tuple, normalized domain type, incidence stratum and equality partition of attachment structures, construct countably many closed quantitative windows indexed by positive integers. Class tuples may repeat. Distinct reduced simple images define that stratum; equal-image vertices are retained in their separate simple-image/cover reduction strata. The equality partition records exactly which times, domain points, marks or target values coincide. Preserve its diagonal equations, and impose a positive lower bound only on distinctions required in that stratum. Equal-t groups are allowed. Marks that collide in the compactification are retained in the corresponding marked/nodal collision stratum.

For each distinct-image simple component choose an injective regular source anchor z_* in a normalized source disc whose image avoids every other reduced image, the required marked test values and fixed forbidden regions. On its normalized closed domain fix the reference source metric g_Σ independently of the map, using the fixed round metric for spheres and the declared slice identifications for varying domain representatives. For a quantitative window with K≥1 require the GLOBAL self-point floor `inf_(ζ∈Σ, ζ≠z_*) d_X(u(z_*),u(ζ))/d_(g_Σ)(z_*,ζ)≥1/K`, together with `‖du‖∞≤K` in these fixed source/target metrics. The infimum ranges over the ENTIRE source, including points outside the anchor disc. Retain separately the regular derivative lower bound, inverse-chart radius and controlled derivative bounds, distance from u(z_*) to every OTHER FULL reduced component image, required marked test value and spatially fixed region, and the slice/automorphism normalization bounds. Impose only the fixed-region separations required for the actual relative variation problem. Nonsphere inhomogeneous section components retain their separately stated FHS graph/core-evaluation window conditions; the closed simple-component floor does not replace those conditions. Record slice/automorphism normalization bounds. Bound domain/parameter coordinates and derivatives and impose distances from the boundary of the domain, mark, incidence and equality-partition chart only where that boundary is excluded from this stratum. For Morse strata use compact subsets of each actual smooth unbroken or broken trajectory stratum, with ranks and separation bounds for the already supplied incidence charts/maps, not regularity of the moduli equation being selected; shared or equal critical values are retained in the stratum allowing them. These are quantitative window inputs, not consequences of single-map bounds.

Prove exhaustion using distinct-image injective-point separation, local slices and the actual allowed diagonal/incidence relations. At an injective regular anchor, the local immersion/inverse estimate gives the ratio floor near z_*, while compactness of the complement of that source neighborhood and uniqueness of its anchor preimage give a positive ratio lower bound there; hence some finite K contains every relevant simple component. Prove relative compactness inside that stratum for convergent smooth structures and data with fixed window bounds: elliptic compactness and normalization preserve the GLOBAL self-point floor, regular derivative, full-other-image/fixed-region and slice bounds. Thus the limiting anchor remains globally injective and regular, preventing degeneration of that simple component to a multiple cover as well as image merger or a forbidden collision. Allowed boundaries have their own strata/windows, with compatible restriction and refinement maps. Derive openness of regularity/evaluation transversality on each proper window, density by the conditional finite-F0 range theorem and relative smooth approximation, then Taubes countable-intersection selection. The abstract smooth-selection theorem takes the declared section/variation spaces, stratum windows, fixed regions and already regular face restrictions as hypotheses. Instantiate it separately for J₀, J_t, J_(s,t), J_(p,s,t) and J_(p,z) only after each actual carrier, conditional range theorem, shared group and matching/incidence problem is constructed, retaining fixed ends/poles and parameter dimensions. Relative exhaustion/refinements commute with prescribed face restrictions; regular true faces remain inputs. No distinctness condition is imposed beyond its defining stratum.

*Needs:* 7.C.2b(iv).

#### 7.C.2b(vi) Select the common sphere datum first

Choose one domain-independent compatible smooth J₀ for the simple-sphere finite class tuples (with repetitions allowed and pairwise-distinct simple images), two-marked Morse-chain incidences and one-marked incidences at all critical points of the auxiliary Morse pair. Prove the joint universal section and finite F0 budgets using the actual compatible-J tangent linear algebra and localized simple injective points. Consume HeegaardFloer F2.6d's smooth-J route: use the actual-stratum compact exhaustion of 7.C.2b(v), including the fixed-metric GLOBAL self-point floor, regular derivative and full-other-image/fixed-region anchor bounds, slices and incidence/equality-partition bounds; prove openness on each proper window, density from finite-C^ℓ Sard–Smale and relative smooth approximation, and apply the Taubes countable-intersection argument in the smooth compatible-J topology. Apply the same method to these marked/evaluation fibre products with their actual Morse constraints. Obtain a residual subset of smooth J₀ simultaneously for all declared windows. In spherical c₁-zero the one-marked critical-point strata have the avoidance consequence used below. Fix this J₀ and its regular strata before selecting the planes.

*Needs:* 7.C.2b(v); HeegaardFloer F2.6d; 7.C.1a.

#### 7.C.2b(vii) PSS face-free Banach carrier and basic selection

Instantiate the testing-series/closed-kernel synthesis separately on the raw planes, using the space of smooth Hamiltonian one-forms Ω¹(Σ;C^∞(X)) with the specified pole/end restrictions, compatible-J chart directions and the actual finite F0 budgets. Use each plane's independent free δK directions and compatible-J chart directions zero on the fixed pole discs and Floer tails. Use the plane metrics and end weights in every mixed coefficient supremum and weighted L^q norm specified above, for both A and δK, with the actual plane finite F0 section/evaluation/projection lists. Retain the global curvature controls and derive the plane allowance `sup_p∫_Σ sup_X|R_(K+δK)−R_K|≤C₁‖e‖+C₂‖e‖²`. This is an independent face-free plane instance. Prove local detection, lower semicontinuity, complete separable synthesis and the section/evaluation differentiability budgets in this named plane instance. With the independent J₀ strata and the earlier selected regular Floer ends/t-parametrized sphere-evaluation families fixed, prove universal plane evaluation submersivity using free interior δK, the adjoint matching equations and unique continuation; this includes constant planes where J variation vanishes. Select positive/negative plane data and their two pole/matching evaluations transverse to the fixed J₀ sphere/Morse strata. At fixed Floer-tail attachments use the selected J_t families, grouping all equal-t attachments even at different s values; use the free core directions to obtain the required transversality to those fixed families. At free nonpole attachments construct the actual grouped J_z sphere/evaluation problems with only their allowed variations. Prove the matching and collision laws with the prescribed pole/end restrictions. Thus plane selection, its node matching and its sphere-incidence outputs are actual theorems before inverse-family faces are formed.

*Needs:* 7.C.2b(i)–(vi).

**Checks (7.C.2b, all steps).**
- Curvature and energy, step (i): for `K = H_(s,t) dt`, `K_s = 0` and `K_t = H`, so
  `R_K = ∂_s H` and the identity reads
  `E = ∫u^*ω + ∫_∂ K(u) − ∫∫ ∂_s H(s, t, u) = A_{H₊}(x̃₊) − A_{H₋}(x̃₋) − ∫∫ ∂_s H(s, t, u)` in
  the capped convention `A_H(x, D) = ∫ H dt + ∫_D ω`, 7.C.4's continuation formula. For
  `H_s = H + ε(s)` with `ε` nondecreasing from `0` to `δ` and a critical point `x` of `H` with
  constant cap, the stationary cylinder has `E = 0`, `A_{H₊}(x̃) − A_{H₋}(x̃) = δ` and
  `∫∫ ∂_s H = δ`; a curvature `R_K = −∂_s H` would give `0 = 2δ`.
- Tame and compatible directions, step (iv): at `J₀` on `ℝ²ⁿ` the tame tangent space
  `{Y | YJ₀ + J₀Y = 0}` of complex-antilinear maps has real dimension `2n²`, and the compatible
  one, where `ω(v, Yw)` is also symmetric, has dimension `n(n + 1)`. They agree exactly for
  `n = 1`, where every `ω`-tame structure is `ω`-compatible
  (`ω(Jv, Jw) = det(J) ω(v, w) = ω(v, w)`). For `n = 2`, `J₀ = j ⊕ j` and `Y` with upper right
  block `diag(1, −1)` and lower left block `0` anticommutes with `J₀`, but `ω(·, Y·)` is not
  symmetric; so the range theorem is proved separately in the two lanes.
- The global self-point floor, step (v): the identity of the round `S²` has ratio identically
  `1` and lies in the window `K = 1`. The double cover `u(z) = z²` of `ℂ ∪ {∞}` has
  `u(−z_*) = u(z_*)` for every anchor `z_* ≠ 0, ∞`, so its ratio is `0` and it lies in no simple
  window, although near `z_*` it is an injective immersion with local ratio bounded below; a
  floor taken over the anchor disc only would admit this multiple cover.
- PSS indices, step (ii): with `H = εf` `C²`-small and constant caps, `μ(x) = ind_f(x) − n`
  (7.C.5), so the positive plane to `x̃₊` with outgoing ray to `q` has dimension
  `μ(x̃₊) − (ind q − n) = ind_f(x₊) − ind q`, and the negative plane from `p` has
  `(ind p − n) − μ(x̃₋) = ind p − ind_f(x₋)`: rigid planes pair critical points of equal index,
  as a degree-preserving PSS map needs. Reading `CZ_HF = −μ` in place of `μ` would pair index `k`
  with index `2n − k`.

### 7.C.2c Periodic tame data and the compatible-model comparison

For a smooth periodic ω-tame J_t on closed X, construct the same capped raw equation and section with the same nondegenerate contractible Hamiltonian ends. Put g_J^sym(v,w)=(ω(v,Jw)+ω(w,Jv))/2 and prove it is a positive symmetric metric. On each specified compact tame-data parameter family prove uniform positive coercivity and coefficient bounds. The equation gives u_t−X_H=J_tu_s, hence E=∫ω(u_s,J_tu_s)=A_H(x̃₊)−A_H(x̃₋), with its continuation/K-curvature versions. The action variation is dA_H(ξ)=∫ω(ξ,γ̇−X_H); construct its actual weak-gradient expression using g_J^sym, distinguishing it from −J_t(γ̇−X_H) for merely tame J_t.

Build the tame Sobolev section/evaluation charts, local/removal estimates and elliptic/end Fredholm theory from PseudoholomorphicCurveAnalysis PH3–PH6 and HeegaardFloer F0/F1/F2 on actual compact uniformly tame coefficient windows. In the asymptotic linear theory identify the action Hessian and the actual positive-symmetric-part mobility; prove the spectral-gap/exponential-end estimate and its uniform compact-family version from nondegenerate Hamiltonian ends. Do not assert self-adjointness for a nonsymmetric pairing. Transport the Fredholm index and determinant line by the fixed-end tame-to-compatible operator homotopy, and apply the supplied self-adjoint spectral-flow comparison only at the compatible realization. Prove cap, puncture-index and orientation transport on that actual homotopy.

**Tame synthesis and staged selection.** Use general anti-J directions A, AJ_base+J_baseA=0, and J(A)=exp(A)J_base exp(−A) on a quantified small C⁰ ball. Prove that these give local tame charts and uniform positive tameness bounds; A is not required to be symplectic. In the actual mixed coefficient/linear-operator norms of 7.C.2b(i), use D exp_A(B)=∫₀¹exp((1−t)A)B exp(tA)dt, its iterated derivatives and Sobolev multiplication/trace/composition to prove every finite mixed parameter/domain/target chain-rule and Moser bound. Record the actual lists, constants and section/evaluation/projection C^ℓ budget before applying F0. The testing-series and global curvature estimates are instantiated in these tame norms, independently of compatible selection/counts.

Construct tame raw cylinder/continuation/plane/comparison sections, unforced tree convergence by 7.C.2d and the attached inhomogeneous compactifications and conditional gluing with uniform tame coefficients. Prove grouped conditional evaluation in the actual tame tangent space and actual-stratum proper-window openness/density/smoothing before each selection. First select regular ends with all shared t-parametrized sphere/evaluation data, including equal-t groups and stationary incidences. Independently select J₀ with its actual Morse/critical-point sphere incidences. With selected ends fixed select individual continuations; with ends and J₀ fixed select basic planes and node/sphere incidences. For homotopies and inverse/composition families insert the previously selected geometric pieces as actual regular true faces, construct their corner restrictions and select relative interiors with all parameter dimensions included. The independent pole choice is not a premise of pure cylinders or individual continuation. Conditional gluing supplies face-flat weights and per-energy collars before branch exclusion and fixed-class boundaries. Geometric support precedes each matrix and its equations. Full tame-to-compatible module comparison occurs only after both lanes' supported complexes exist.

**Tame raw sign realization.** Before tame counts, instantiate the complete formal system of 7.C.2a on the actual tame operators, with the same ordered input kernels, both pole targets, stable Morse complex, γ_min and q_min, matching exact sequences, cap/frame/recapping and parameter/flow order. Transport the complex-minimum and each finite-index reference by the fixed-end tame-to-compatible Fredholm OPERATOR homotopy of 7.C.2c; this construction has no chain-comparison or compatible-count premise. Prove its determinant homotopy, stabilization and gluing-reference diagrams. Pure tame cylinder parameter boundaries consume the universal readout (−1)^(i+j+ij) and quotient/negative-flow order without Morse/PSS data. Tame PSS parameter and endpoint boundaries additionally consume the actual raw cap/Morse calibration: j=1 gives −1, the inverse-family readout is (−1)^(n+1), the stationary cap and functional readout give (−1)^n before the fixed family factor, and the Morse zero-face exponent k+(k−n)+n is even. Prove agreement of these raw references with the actual tame regular-gluing boundaries before support/matrix equations.

Consume HeegaardFloer F2.1’s tame/compatible contraction fixing a compatible structure and relative smooth-family extension, and F2.6d’s corresponding localized single-sphere range and smooth selection floors. Apply them to the actual periodic/continuation/PSS end/pole/true-face data with the declared uniform tame budgets. Arbitrary periodic tame data retain their raw equation, energy, conditional local compactness and Fredholm interfaces; counts require selected regular data in the preceding tame construction. After both tame and compatible supported module complexes and continuation maps exist, select regular tame-to-compatible continuation and relative homotopy/composition data with their prescribed tails, true faces and K-curvature allowances. Prove the comparison’s own energy-cutoff compactness, exclusion, gluing, coefficient support and determinant diagrams; use its supported matrices and oriented boundaries to obtain the filtered chain-homotopy equivalence and cap-change naturality in each coefficient lane. This is a module comparison, with no quantum-operation construction or generic index/flow duplication.

**Checks.**
- In dimension `2` every `ω`-tame `J` is compatible: `J² = −1` forces `det J = 1`, so
  `J ∈ SL(2, ℝ) = Sp(2, ℝ)` and `ω(Jv, Jw) = ω(v, w)`; the tame lane differs from the
  compatible one only in dimension `≥ 4`.
- A tame non-compatible structure on `(ℝ⁴, ω₀ ⊕ ω₀)`: `J_ε = A J₀ A⁻¹` with
  `A = [[I, B], [0, I]]`, `B = diag(1, −1)`, that is `J_ε = [[J₀, εC], [0, J₀]]` with
  `C = [[0, −2], [−2, 0]]`. Then `ω(v, J_ε v) = |v₁|² + |v₂|² + ε ω₀(v₁, Cv₂) ≥ (1 − |ε|)|v|²`, so
  `J_ε` is tame for `|ε| < 1`, while `ω(J_ε e₃, J_ε e₄) = 1 − 4ε² ≠ 1 = ω(e₃, e₄)` for `ε ≠ 0`, so
  it is not compatible and `−J_ε(γ̇ − X_H)` is not the `g_{J_ε}^sym`-gradient of `A_H`.
- The energy `E = ∫ ω(u_s, J_t u_s) = ∫ g_J^sym(u_s, u_s)` is nonnegative for every tame `J` and
  vanishes exactly on stationary cylinders, so with `u_t − X_H = J_t u_s` every solution has
  `A_H(x̃₊) ≥ A_H(x̃₋)`, with equality only when `x̃₊ = x̃₋`.

*Needs:* 7.C.2, 7.C.2b and 7.C.2d; PseudoholomorphicCurveAnalysis PH3–PH6; HeegaardFloer F0–F2 (F1.3 spectral flow, F2.1 tame-to-compatible contraction, F2.6d).

### 7.C.2d Genus-zero stable-map compactness over compact tame families

Let `(X, ω)` be a closed symplectic manifold of dimension `2n`, let `P` be a compact metrizable
space, and let `p ↦ J_p` be a continuous map from `P` to the smooth `ω`-tame almost complex
structures on `X` with the `C^∞` topology. In 7.C.3, `P` parametrizes the frozen structures
`J_t`, `J_(s,t)` or `J_(p,s,t)` at which spheres attach. Continuation structures equal the end
structures `J_t` outside a compact `s`-interval (7.C.2b(i)), so a compact `P` covers them. For
`k ≥ 0` and `A ∈ H₂(X; ℤ)`, write `M̄_(0,k)(A; P)` for the space of pairs `(p, [u, z])` with
`[u, z]` an isomorphism class of `k`-marked genus-zero stable `J_p`-holomorphic maps of class `A`
with no Hamiltonian term, components possibly multiply covered and every constant component
carrying at least three special points (Salamon, *Lectures on Floer homology*, Definitions
4.3–4.4, `salamon-lectures` lines 1780 and 1822, for one compatible `J`).

Consume, for these families, the compactness of `M̄_(0,k)(A; P)` with its Hausdorff-graph
topology, sequential compactness under an energy bound, uniqueness of limits, the uniform energy
threshold `ħ > 0`, the graph bounds, conservation of the integral class and of the energy
`E(u) = ω([u])`, and continuity of the evaluation maps, all at genus zero
(gap:genus-zero-stable-map-compactness, supplier contracts). This roadmap does not construct
stable maps or their topology. Prove from the contract the consequence 7.C.3 uses beyond it:
for every `c`, only finitely many classes `A` with `ω(A) ≤ c` carry a stable `J_p`-map with
`p ∈ P`. An infinite sequence of distinct such classes would, by the energy-bounded sequential
compactness, have a convergent subsequence, whose classes are eventually constant by
conservation. HeegaardFloer F2.6c's compactness of the zero- and one-marked quotient under a
minimal-area hypothesis is the case of a single nonconstant component; it does not cover multiple
covers, several nonconstant components or arbitrary `k`, which 7.C.3's sphere trees need.

**Checks.**
- On `S² = ℂ ∪ {∞}` with `J = i` and `ω([S²]) = L`, the degree-two maps
  `u_ε(z) = z + ε/z = (z² + ε)/z` (class `2[S²]`, energy `2L`) Gromov converge as `ε → 0`. The
  limit is the two-vertex tree of `u₀(z) = z`, with node `z = 0`, and the bubble `v(w) = 1/w`,
  the limit of `u_ε(εw) = εw + 1/w`, with node `w = ∞`; the matching is `u₀(0) = 0 = v(∞)`. Class
  `[S²] + [S²] = 2[S²]` and energy `L + L = 2L` are conserved. The pointwise limit `z` alone has
  class `[S²]` and energy `L`, so a convergence without the bubble and the branch-energy condition
  loses half of both.
- Constant class: `M̄_(0,k)(0; P)` is empty for `k ≤ 2`, since the graph bound allows at most
  `k − 2 < 1` constant components when `a = 0`. It is `P × X` for `k = 3`, and
  `P × X × M̄_(0,4)` with `M̄_(0,4) ≅ ℂP¹` for `k = 4`. The three boundary points of
  `M̄_(0,4)` are the trees of two constant spheres with two marks each, which meet the bounds
  `k − 2 + 2a = 2` and `k − 3 + 3a = 1` exactly. A definition that admitted a constant sphere with
  two special points would make `M̄_(0,2)(0; P) = P × X` nonempty.
- Stability is what makes limits unique. Suppose constant spheres with two special points were
  admitted, dropping condition (iii) of Definition 4.3. Insert a constant sphere with nodes `0`
  and `∞` into the edge of the limit in the first Check, reparametrized by `w ↦ √ε w`. Since
  `u_ε(√ε w) = √ε (w + 1/w) → 0` on compact subsets of `ℂ ∖ {0}`, the sequence of that Check
  would also converge, in the sense of Definition 4.5, to this three-vertex configuration, which
  is not equivalent to the two-vertex limit.
- Energy threshold on `ℂPⁿ`, with the Fubini–Study form normalized by `ω(L) = π` for the line
  class `L` and its integrable `J`. Every nonconstant sphere has class `dL` with `d ≥ 1` and
  energy at least `π`. So `M̄_(0,0)(L; {J})` has no configuration with two nonconstant components,
  since that would need `π ≥ 2π`; it is the compact space of lines. For class `2L` and `n ≥ 2`,
  the limits of smooth conics include line pairs, with `a = 2 ≤ 2π/π`.
- For a constant family `J_p = J`, `M̄_(0,k)(A; P) = P × M̄_(0,k)(A; {J})` with the product
  topology, and for `P` a point it is Salamon's `M̄_(0,k,A)(X, J)`. A family theorem stated only
  pointwise in `p` would not give properness of the projection, which 7.C.3's parameter families
  use.
- The finiteness is of the classes that carry stable maps, not of the classes below `c`: on
  `T⁴` with a symplectic form whose periods are rationally independent, infinitely many
  `A ∈ H₂(T⁴; ℤ)` have `|ω(A)| ≤ c`, but only `A = 0` carries a stable map, since every
  `J`-holomorphic sphere lifts to the universal cover `ℝ⁴`, where `ω` is exact, and so has energy
  `0` and is constant. On `ℂPⁿ` with `ω(L) = π` the classes carrying stable maps with
  `ω(A) ≤ c` are the `dL` with `0 ≤ d ≤ c/π`.

*Needs:* gap:genus-zero-stable-map-compactness; AlgebraicTopology Stage 2 (singular homology
`H₂(X; ℤ)` and its homotopy invariance); Salamon §4.2.

### 7.C.3 Raw compactness, conditional gluing and analytic branch exclusion

Apply 7.C.2d's full marked unforced stable-map compactness at genus 0, with its uniqueness of limits and integral class conservation, to the compact families of frozen attachment structures. Construct the rooted attachment/equal-parameter matching application for the declared raw inhomogeneous cylinder, continuation and PSS sections with uniform K-curvature/end bounds: finite-cutoff convergence to broken cores and sphere trees, removal, no-neck/end convergence, integral class splitting, topology and Hausdorffness. Each bubble subtree has its attachment's frozen J; separate roots retain their actual shared-structure partition and matching evaluations. Normalize/contract unstable constant raw components, in particular the two-marked zero-cutoff core, rather than identify them with a stable two-marked moduli space. At supplied regular broken configurations construct the actual conditional gluing, surjective matching, determinant and onto-neighborhood theorem, with inverse/derivative/cutoff/error bounds on each finite-energy window. These estimates supply weights/collars before relative-family selection. Contractible-sector persistence and the finite nondegenerate end theorem of 7.C.1 are explicit inputs in both coefficient lanes. HeegaardFloer local removal/factorization/index estimates are consumed with their actual scope; its minimal-area single-component compactness is not a replacement for the full marked compactness of 7.C.2d.

Keep the branch hypothesis records separate from their analytic consequences: positive spherical monotonicity is the equality ω=κc₁ with κ>0 on S_sph; spherical-c₁-zero is c₁|S_sph=0 with no sphere-area vanishing. Actual bubble exclusion additionally consumes the raw sections/compactness, common universal parameter spaces, compatible-J curve floors and marked/core incidence, as well as the cap quotient.

**Separate finite counting budgets.** For pure cylinders, individual continuation, cylinder homotopy and composition, use the finite contractible Hamiltonian ends of 7.C.1, their reference cap actions/degrees, the declared finite parameter/count dimensions and actual global K-curvature allowance. In positive monotonicity the cap/index equation bounds the relevant spherical Chern numbers and hence energy at that fixed counting budget. Prove the resulting cylinder/continuation energy ceiling and per-budget collar bounds without a Morse datum. For PSS, the nodal correspondence and the two inverse families, additionally supply the independent finite Morse critical set, its indices/actions and the actual finite Morse-segment/end data; derive their own cap/index/energy ceiling and endpoint collar bounds. Morse finiteness is a premise only of this second budget. In spherical c₁-zero, neither index equation bounds sphere energy; use a declared finite energy cutoff in each lane and retain the resulting cutoff-dependent collars.

For cylinders construct and select one shared countable universal parameter problem for regular cylinders, sphere tuples, their marks, attachment times and matching evaluations, using the cylinder FHS range and the conditional two-/multi-map sphere theorem of 7.C.2b. Keep the actual t-parametrized evaluation families, not only regularity at a single t. At each common t use one shared-J tuple problem; repeated classes and distinct reduced images are included. Include the stationary cylinder through its invertible end operator and the required joint sphere incidence. Complete the finite-C^ℓ budgets, bounded-piece openness, smoothing and countable smooth selection for these strata. Fix the resulting regular end/tail data before selecting actual individual continuation or plane data. Their frozen end/tail restrictions reuse this same selected sphere/evaluation theorem; this step has no premise from the independent J₀ pole selection.

In the positive-monotone branch, prove the stationary Chern-one attachment exclusion at total index 2 by its joint orbit/sphere evaluation theorem and actual parameter dimension. Combine this with the positive-area Chern lower bound for nonstationary cores.

In the c₁-zero branch the simple-sphere evaluation with its mark/time has codimension 4 in X×S¹, and an index-k nonstationary quotient with attachment has dimension k+1, giving k−3; the stationary incidence has dimension−3. Prove the joint transversality, simple-image/cover reductions and absence of these strata at k≤2.

For individual continuation and relative parameter families construct their own simple-sphere and marked-incidence section problems frozen at the actual attachment structures J_(s,t) and J_(p,s,t). Include core, marked sphere and matching equations with shared variations, class tuples with repetition and pairwise-distinct simple-image chains, constant-core cases, simple-image/cover reductions and the actual total parameter dimensions. The selected individual continuation problem supplies its J_(s,t) output; relative families supply their J_(p,s,t) theorem through their own face-flat carrier and already-selected true-face incidence data. Joint selection and those face compatibility laws precede the corresponding branch exclusions and signed boundaries. PSS uses its already-constructed J₀ pole strata and actual frozen J_z problems. These are the distinct parameter/PSS incidence and exclusion constructions. On every fixed end/tail restriction the earlier selected J_t sphere/evaluation families supply regularity, with equal-t attachments grouped regardless of s. Only free core structures vary in these later problems. Actual relative selection uses this fixed end output and previously regular true-face incidence data before proving its branch exclusion.


**Checks.**
- Positive monotonicity: a nonconstant `J`-sphere has `ω(A) > 0`, hence `c₁(A) ≥ 1`, and
  bubbling it off an index-`k` cylinder leaves a core of index `k − 2c₁(A) ≤ k − 2`. For the
  differential and its boundary, `k ≤ 2`, so a nonstationary core would have index `≤ 0` and a
  translation quotient of dimension `≤ −1`: there is none for regular data. In the
  spherical-`c₁`-zero branch the core keeps index `k`, so this index count excludes nothing and
  the incidence count of the next Check is used instead.
- Spherical `c₁`-zero: a simple one-marked sphere family has dimension `2n − 6 + 2 = 2n − 4`, and
  with its attachment time it sweeps `2n − 3` dimensions of `X × S¹`, codimension `4`; an
  index-`k` nonstationary quotient with its attachment point has dimension `k + 1`, so the
  incidence has expected dimension `k − 3`, that is `−2` and `−1` for `k = 1, 2`, and the
  stationary cylinder, a circle in `X × S¹`, gives `1 − 4 = −3`.
- The two-marked zero-cutoff core is normalized, not identified with a stable moduli space: the
  constant class with two marks has `M̄_(0,2)(0; P) = ∅` (7.C.2d), so such an identification would
  lose the endpoint `Wᵘ(p) ∩ Wˢ(p) = {p}` that 7.C.3a counts.

*Needs:* 7.C.1; 7.C.2; 7.C.2b; 7.C.2d; Salamon §3.1.

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

**Checks.**
- On `ℂP¹` (`n = 1`) a reduced chain with one simple image of class `L` (`c₁ = 2`) and
  `A_end = L` has joint dimension `2(2 − 2) − 2 = −2`, and the rigid equation
  `ind q − ind p = 2c₁(A_end) = 4` already exceeds `dim ℂP¹ = 2`: no such endpoint exists.
- In positive monotonicity a nonconstant tree has `ω(A_end) > 0`, hence `c₁(A_end) > 0` and
  `ind q > ind p`, so the only degree-zero endpoint with `p = q` is the constant core; in the
  spherical-`c₁`-zero branch `ind p = ind q` for every tree, and a one-marked simple sphere
  through a critical point has dimension `(2n + 0 − 6 + 2) − 2n = −4`, as stated.
- A constant two-marked sphere has an automorphism group of positive dimension, so reading it
  as a point of a stable two-marked moduli space would miscount the endpoint's dimension by `2`;
  contracting it leaves the transverse intersection `Wᵘ(p) ∩ Wˢ(p) = {p}` of dimensions `k` and
  `2n − k`, a single point.

*Needs:* 7.C.2b(vi); 7.C.3; 7.C.1a; 7.C.2a.

### 7.C.3b Floer inverse through one nodal correspondence

With the selected basic PSS data construct the degree-zero geometric correspondence 𝒩 from the pair of planes with equal pole evaluations at L=0. Construct its matching fibre product, compactification, coherent determinant orientation and rigid coefficients at fixed cap/class. The oriented one-dimensional boundary is the finite geometric end-breaking formula, using the actual cylinder breaking/gluing/bubble-exclusion theorem and plane matching. Prove geometric finite-below support before assembling its matrix. In each branch the resulting supported matrix is a chain map by that boundary formula after the cylinder differential exists. Retain the same cap classes and normalized 𝒩 readout in both families below.

First join the two pole evaluations by a negative-gradient segment of length L≥0. Its L→∞ boundary is the broken PSS/Morse composition and its L=0 boundary is 𝒩. Second, use the common J₀/K=0 pole discs and frames to smooth the nodal pair by `z₊z₋=τ≥0`. On the two punctured local discs put `z₊=exp(2π(s₊+it₊))` and `z₋=exp(−2π(s₋+it₋))`; positive τ implies t₊=t₋ modulo 1. Construct the positive-ray smoothing family and its deformation to the s-independent continuation identity. All ends use Hdt and the fixed markers; coordinate changes have specified comparison, face/cocycle and determinant laws. At each finite energy prove the actual gluing neighborhoods for both sides using their own analytic bubble exclusion, cylinder breaking/gluing, Morse gluing and stationary inverse.

Orient the Morse-length interval by increasing L and the smoothing/identity interval by decreasing τ, with the nodal end as its positive boundary. Use the full standard kernel/functionals/coevaluations and fixed family readouts of 7.C.2a. At L→∞ use the actual first-projection Morse graph χ_M and its stable-complex comparison, retaining both pole normal factors. At L=0 and τ=0 use the identical positive-first matching `ev₊−ev₋`; both yield the same normalized 𝒩, including cap classes. The stationary reference comparison consumes the separately proved inverse for the identical nondegenerate stationary cylinder of 7.C.2; the Morse-side two-marked sphere endpoint is a different input. At the stationary end use γ_min and the specified family factor, giving Id_CF. Prove these simultaneous raw determinant identifications from their stabilized exact sequences, then their agreement with actual regular gluing. At fixed total cap/class and finite energy the resulting geometric Hom boundary readouts have the forms `d𝓗_L+𝓗_Ld=F∘G−𝒩` and `d𝓗_τ+𝓗_τd=𝒩−Id_CF`, with degree-one raw count-functional readout `(-1)^(n+1)`. Their geometric nodal terms cancel. After support and matrices exist, these are the corresponding module equations and their sum is the Floer inverse homotopy. Resolve every matrix product by the finite-below convolution before making that algebraic interpretation. The Morse inverse separately uses its two-pole zero core and q_min broken-face insertion. Every family uses the fixed convention before counting.

The true endpoint data and finite-energy gluing estimates are inputs to relative-family regularity and each branch’s PSS geometric inverse boundaries. Cylinder fixed-class boundaries, ordinary continuation data and the Γ=0 reflection bridge use only their own cylinder/continuation constructions. The geometric inverse boundaries feed PSS support, then its matrices, and then the R[Γ] or completed inverse equations in 7.C.6; they are not already equations between undefined matrix series.

**Checks.**
- On the stationary fibre the unscaled functional is `γ_min`, with ordinary readout `(−1)^n Id`;
  the family factor `(−1)^n` makes `𝒩` read `Id` there. On `S²` the unscaled readout is `−Id`,
  and without the factor the `τ`-equation would read `d𝓗_τ + 𝓗_τ d = −2 Id_CF`, which would
  force `2 = 0` on the homology of `CF`.
- The nodal terms cancel because `𝒩` enters the two equations with opposite signs:
  `(d𝓗_L + 𝓗_L d) + (d𝓗_τ + 𝓗_τ d) = F∘G − Id_CF`; reversing the orientation of the `τ`
  interval would add the two `𝒩` terms instead and give no inverse equation.
- The smoothing `z₊ z₋ = τ` with `z₊ = e^{2π(s₊ + it₊)}` and `z₋ = e^{−2π(s₋ + it₋)}` forces
  `t₊ ≡ t₋ (mod 1)` and `s₊ − s₋ = (log τ)/2π`, which tends to `−∞` as `τ → 0`: the nodal end is
  the infinite-neck limit, the positive boundary of the interval oriented by decreasing `τ`.

*Needs:* 7.C.3a; 7.C.2a; 7.C.2; Piunikhin–Salamon–Schwarz §4.

### 7.C.3c Face-flat relative perturbations

For each branch construct the selected regular individual continuation sections, their rigid geometric count coefficients, zero-/one-dimensional oriented compactifications and finite-below support from their own Morse-free cylinder/continuation data. Assemble their actual maps and chain-map equations only in the matrix stage. Construct homotopy/composition true faces from these selected geometric pieces, raw cylinder comparison templates, cylinder breaking/gluing, stationary identity and that branch’s analytic exclusion; no algebraic composition equation is needed to specify a broken face. PSS relative faces separately insert their selected plane/Morse pieces and endpoint theorems. Prove each prescribed true-face operator and matching problem regular. Compatible raw jets extend to a base family in the actual product-collar and compatible-J charts before generic face-flat interior selection.

Construct the relative separable complete real Banach carrier using smooth local Hamiltonian one-form/δH_s and compatible-J chart directions in free domain/target/interior parameter charts. Each testing element vanishes on its own neighborhood of the true faces and the fixed pole/end regions; their supports together meet every free interior parameter arbitrarily close to the faces. Retain all face-free mixed coefficient derivative suprema, weighted L^q norms, linear operator controls, exhaustion seminorms and global integrated curvature controls above. Conditional gluing gives positive locally bounded functions G_(E,j)≥1 on specified larger collars `0<x<2x₀(E)`, and on larger product collars `0<x_i<2x₀,i(E)` at corners. Take their weighted suprema on the closed outer subcollars `0<x≤x₀(E)` and `0<x_i≤x₀,i(E)`: `sup G_(E,j)(x)(∏_i x_i^(−m))|∇^j e|`, with the declared domain/target/parameter charts and derivatives. Specify a smooth cutoff ϑ valued in [0,1], equal to 1 on this closed outer subcollar and supported in the larger collar with x_i<3x₀,i/2. Define the global extension Ĝ=1+ϑ(G−1) there and Ĝ=1 off that support. Include the corresponding global weighted norms using the declared chart cutoffs and the ordinary face-distance weights; use a locally finite fixed chart system and its stated norm comparison constants. Thus the global norm is defined everywhere, and its weights are positive and locally bounded away from true faces. A compact-library support away from true faces meets each closed outer subcollar in a compact subset of its larger open collar, so all these weighted norms are finite. Use coefficient suprema/Fatou and dense tests for linear operators to prove their lower semicontinuity. The same ℓ¹ synthesis and closed-kernel quotient give the complete separable smooth carrier, convergence in every controlled norm, all-order face flatness and compatible corner jets. Derive its finite-C^ℓ nonlinear section/evaluation estimates by the stated chain-rule/Sobolev–Moser theorem. Small balls preserve the global curvature and energy allowances. Its G weights come from the earlier conditional gluing estimates.

At every interior parameter the localized δK or δH_s directions detect adjoint cokernels, including constant maps and matching constraints. Form the actual J_(p,s,t) simple-sphere/marked-incidence families frozen at each attachment, and the PSS J_(p,z) versions, with shared core/sphere/evaluation variations and prescribed true-face strata. Prove their combined universal transversality, simple-image reductions, finite differentiability budgets and countable simultaneous selection; with their own shared-J theorem. At true faces use their previously selected regular operators and sphere-incidence data. Perturbations have all-order flat jets on true faces. From these weighted errors and conditional gluing construct a cutoff width ε(E)>0 at R=0, a Floer-neck threshold T(E), and a Morse-length threshold L(E), in their respective declared charts, below every inverse/contraction/onto-neighborhood error tolerance and within every required derivative budget. Counts/boundaries are coefficientwise at finite energy. Positive monotonicity supplies the separately proved cylinder/continuation or PSS finite counting-budget ceiling, with Morse data used only by the latter; spherical-c₁-zero keeps cutoff dependence.

Now prove the branch-specific regular compact zero-dimensional and oriented one-dimensional boundary theorems. The cylinder theorem has index 1 rigid quotients and index 2 broken boundaries, removing trivial levels by their actual equivalence.

Per branch, continuation/homotopy, PSS and inverse-endpoint geometric boundaries consume cylinder breaking/gluing, their own analytic exclusion, actual regular true faces and finite-energy neighborhoods, shared orientations, Morse factors and stationary identity exactly where used. Prove the cylinder fixed-class boundary theorem before parameter/PSS boundaries and geometric rigid support. After the relevant support theorem constructs the matrices, these same oriented boundaries give their chain-map, square-zero, composition and inverse equations. The two branches share earlier floors but retain independent analytic consequences and concrete exports. Compactifications here have precisely the dimensions needed for these classical counts and identities.


**Checks.**
- Face flatness: on a collar `0 < x ≤ x₀`, `e(x) = exp(−1/x)` has `x^{−m} |∇^j e| → 0` as
  `x → 0` for every `m` and `j`, so every weighted norm `sup G x^{−m} |∇^j e|` is finite; `e(x) = x`
  has `x^{1−m} → ∞` for `m ≥ 2` and is excluded, although it vanishes on the face.
- The global weight `Ĝ = 1 + ϑ(G − 1)` equals `G` on the closed outer subcollar and `1` off the
  support of `ϑ`, and `Ĝ ≥ 1` everywhere since `G ≥ 1` and `0 ≤ ϑ ≤ 1`; the product `ϑG` would
  vanish off the support, where the weighted expression would then not be a norm.
- Cylinder windows: the translation quotient of a regular index-`r` cylinder has dimension
  `r − 1`, so index-`1` cylinders are rigid and index-`2` quotients are one-dimensional, with
  boundary the broken pairs of indices `(1, 1)`; the index-`0` stationary cylinders at the orbits
  are the trivial levels removed by their equivalence, not rigid counts.

*Needs:* 7.C.3a–b; 7.C.2b; Salamon §3.3.

### 7.C.4 Coherent counts and continuation

Work first over 𝔽₂, then use the shared cap/determinant/Morse orientation lines of 7.C.2a for integer counts and outward-first broken boundaries. Use its quotient-then-negative-flow ordering and explicit parameter/end-reversal laws; convert a translation-first auxiliary formula by the specified (−1)^(dim quotient) factor. Extend counts by actual scalar maps to each commutative ground ring R. Orientation generators give matrices and their changes give explicit diagonal sign maps.

For each fixed generator pair and recapping class define the rigid index-one quotient count coefficient with the ordered orientation lines. First prove its geometric finite-below support in 7.C.6 and assemble the degree−1 matrix d over that branch’s ring. The signed index-two fixed-class boundary then gives d²=0, with sums interpreted through the proved support/convolution theorem. For previously selected individual continuation data retain the energy formula
`E=A_(H₊)(x̃₊)−A_(H₋)(x̃₋)−∫∂sH(s,t,u)`,
count the compact rigid index-zero sections on their parametrized domain at each cap/class, prove their own support and assemble the degree-zero continuation matrix after the differential’s coefficient module exists. Constant data give the stationary identity through its actual inverse/orientation comparison. Homotopy/composition true-face selection uses those earlier geometric sections; its fixed-class boundary theorem and support construct the degree-one homotopy matrices. Only after all participating matrices exist prove chain-map, composition, independence and inverse equations in the branch ring. Derive actual Hofer cutoff shifts, cap equivariance and support bounds from the raw energy and count geometry; no completed identity is a support premise.


**Checks.**
- The continuation energy formula on a stationary cylinder: for `H_s = H + ε(s)` with `ε`
  nondecreasing from `0` to `δ` and a critical point `x` of `H` with constant cap, `E = 0`,
  `A_{H₊}(x̃) − A_{H₋}(x̃) = δ` and `∫∫ ∂_s H = δ`, so the formula holds; the opposite sign of the
  last term would give `0 = 2δ`.
- On `ℂP¹` with a `C²`-small Morse `H` with two critical points, constant caps give `μ = −1` and
  `μ = 1`, and recapping by the line class adds `2c₁ = 4`, so every capped generator has odd
  degree and `d`, of degree `−1`, vanishes: one copy of `R` in each degree `≡ ±1 (mod 4)`, the
  cyclic formula of 7.C.
- Constant continuation data count the stationary cylinders with sign `+1`, so the continuation
  map is the identity. With sign `−1` it would be `−Id`, and composing the constant data with
  itself would give `Id ≃ −Id`, that is, twice the identity nullhomotopic, false over `ℤ` for
  nonzero homology.

*Needs:* 7.C.2a; 7.C.3c; the support theorems of 7.C.6; Salamon §3.4.

### 7.C.5 Small autonomous trajectories and the later Morse specialization

For sufficiently C²-small autonomous Morse H construct compatible J with `(H,g_J)` Morse–Smale by a localized positive-gradient realization. Prove all one-periodic orbits are constant and compute μ=`ind(H)−n` using the cap frame. For an actual t-independent Morse trajectory prove its Floer linearization is surjective: in a t-independent trivialization the zero Fourier mode is the Morse operator, while nonzero modes have the `2π` gap and the proved small-coefficient perturbation estimate. Include its right inverse and determinant orientation comparison. This proves regularity of the t-independent trajectory locus.
Use the independent auxiliary pair `(f,g)` and comparison complex M of 7.C.1a. For H=εf with ε>0 sufficiently small prove the positive-rescaling normalization and compatible Morse–Smale realization. Construct the bijection between t-independent Floer cylinders and upward trajectories of the realized Morse metric, using τ=εs, with the induced cap classes, quotient translations and the determinant orientations fixed in 7.C.2a; prove the ordinary Morse-continuation comparison between the realized metric and the auxiliary metric, using HeegaardFloer Lane M1–M5, with its signs. The comparison concerns this t-independent trajectory locus. The PSS homology comparison is a separate construction with its own branch prerequisites.


**Checks.**
- On `S²` with the height function `f` and `H = εf`, the two constant orbits have
  `μ = ind − n = −1` and `+1`, as in 7.C.0's Check at the minimum.
- Smallness is needed: on `ℂ` with `H = (a/2)|z|²` the time-one map is the rotation by the angle
  `a`, so for `a = 2π` every point is a `1`-periodic orbit and the constant orbit at `0` is
  degenerate, while for `0 < a < 2π` it is the only one and is nondegenerate; this is the `2π`
  gap of the nonzero Fourier modes.
- Direction: since `ι_{X_H} ω = dH` and `g_J = ω(·, J·)` give `J X_H = ∇_{g_J} H`, the
  `t`-independent cylinder `u(s, t) = γ(εs)` solves `u_s + J(u_t − X_H) = 0` exactly when
  `γ′ = ∇_{g_J} f`, an upward trajectory of `f`; `ε < 0` would give downward trajectories.

*Needs:* 7.C.1a; 7.C.2; HeegaardFloer Lane M; Salamon §3.5.

### 7.C.5a Autonomous translation and time-rotation dimensions

On smooth finite-energy cylinders for these autonomous data with the fixed constant asymptotic ends and fixed capped relative class, define commuting actions `T_a u(s,t)=u(s+a,t)` for `a∈R` and `R_θu(s,t)=u(s,t+θ)` for `θ∈R/Z`. They preserve the equation; their isotopies preserve the capped class relative to the constant end caps. Prove smoothness on the actual finite-dimensional regular moduli spaces after PH5.1's elliptic bootstrapping. The fixed locus of the whole `S¹` time-rotation action is exactly `u_t=0`; its Floer equation is the specified positive-gradient Morse equation, so its elements are the upward Morse trajectories already treated above.

For a non-time-invariant cylinder, `u_s` and `u_t` are linearly independent as global tangent vectors. If `a u_s+b u_t=0` with constants `(a,b)≠(0,0)`, `a=0` gives time invariance, while `b=0` makes the map independent of `s` and hence constant by its asymptotic ends. If both are nonzero, `u` is constant along the domain flow in direction `(a,b)`; iterating toward a constant asymptotic end and using uniform convergence in `t` forces the whole cylinder to be constant. If a stabilizer element has nonzero `s`-translation, iterate it in the direction of one constant asymptotic end. The end convergence is uniform in `t`, so the stabilizer equation forces the entire cylinder to equal that constant end; this excludes every such element without assuming an `s`-period. Thus on the non-time-invariant locus the `R×S¹` orbit has dimension two and its remaining time-rotation stabilizer is finite. Conditional on surjectivity of the actual autonomous linearization, a non-time-invariant cylinder has Fredholm index at least two; regular index-one cylinders are time-independent. The dimension conclusion is conditional on that actual regularity. The homology comparison is the separate PSS theorem.

**Checks.**
- A time-independent cylinder solves `u_s = J X_H = grad_{g_J} H`, since
  `g_J(J X_H, w) = ω(J X_H, J w) = ω(X_H, w) = dH(w)`: it is an upward gradient line. For
  `H = εf` with `f` the height function on `S²`, the lines from the minimum to the maximum form a
  two-dimensional family, matching the index difference `μ(max) − μ(min) = 1 − (−1) = 2`.
- A nonconstant cylinder has trivial translation stabilizer: `T_a u = u` with `a ≠ 0` gives
  `u(s + ka, t) = u(s, t)` for all `k`, and `k → ∞` along the end where `u → x₊` uniformly in `t`
  forces `u ≡ x₊`; the constant cylinder is fixed by all of `ℝ × S¹`.
- A time-independent nonconstant cylinder has `u_t = 0` and `u_s ≠ 0`, so its `ℝ × S¹`-orbit is
  one-dimensional and the translation-quotient count `r − 1` applies, giving `0` at `r = 1`; the
  two-dimensional orbit, and the exclusion at `r = 1`, concern only the non-time-invariant locus.

*Needs:* 7.C.5; PseudoholomorphicCurveAnalysis PH5.1.

### 7.C.5b PSS maps and equivalence

Construct the PSS/inverse matrices from the regular basic punctured sections and their branch-specific energy/support bounds. The Morse-side inverse uses its broken PSS composition and the true zero-cutoff Morse identity end, with the full ordered Morse/cap calibration of 7.C.2a and its explicitly constructed equation d𝓗_M+𝓗_Md=PSS⁻¹∘PSS−Id_M. The Floer-side inverse uses the same nodal chain map 𝒩 in the finite-Morse-length and positive-smoothing-ray homotopies; their signed nodal boundaries cancel, leaving the stationary Floer identity. Face-flat relative regularity, the finite-energy neighborhoods and signed boundary theorems give both coefficientwise homotopy equations. Obtain the branch-specific chain-homotopy equivalence: integer-graded at the finite Laurent stage, complete ν-filtered and ℤ/(2N_C)-graded after nonzero-monotone completion, and integer-graded in the c₁-zero and Γ=0 lanes. The specified output is the module chain-homotopy equivalence.

In the spherical-c₁-zero completed lane, the integer-graded homology comparison is HF_i≅H_(i+n)(X;Λ_R). Over a field 𝕜 it identifies with H_(i+n)(X;𝕜)⊗_𝕜Λ_𝕜; over other R such a tensor description requires a proved homology base-change hypothesis. Use the actual base-changed chain homotopies for their equations.

In the nonzero positive-monotone Laurent lane, write HF_i^cyc for homology after t↦1 and prove HF_i^cyc≅⊕_(j≡i+n mod 2N_C)H_j(X;R). On Γ=0 choose the spherical-c₁-zero PSS construction of this item as the single common MODULE-comparison construction for HF_i≅H_(i+n)(X;R). Its phase inputs are the independent auxiliary Morse comparison, actual raw cylinder/plane/nodal/inverse operators, finite end/Morse data, selected regular true faces/interiors, branch compactness, simultaneous determinant realization, geometric support and both inverse boundaries. None is obtained from standing Layer 7.4's comparison readout. First construct that equivalence and common continuation/PSS data, then compare the Γ=0 finite-Laurent readout and the standing reflected complex through the actual equation/cap/reference/degree/determinant dictionary of 7.C.0, quotient-then-negative-flow orientation reversal and coefficient identity Γ=0. Prove the chain and continuation diagrams, including their actual degree sign, before the two displayed homology readouts. The integer formula has no premise from two separately assumed equivalences. Standing all-dimensional corner-chain, all-free-loop atoroidal and Liouville outputs retain their distinct construction hypotheses and scope.

**Checks.**
- `ℂPⁿ`: `HF_i^cyc ≅ ⊕_{j ≡ i+n mod 2(n+1)} H_j(ℂPⁿ; R)` is `R` for `i + n` even and `0` for
  `i + n` odd, since each even residue class modulo `2(n + 1)` contains exactly one of
  `0, 2, …, 2n`; the total rank `n + 1` is the number of contractible orbits of a `C²`-small
  Morse Hamiltonian.
- `S²` (`Γ = ℤ`, `N_C = 2`, `d_C = 4`) with a `C²`-small `H = εf`: the cyclic formula gives `R`
  in the residues of `−1` and `1` modulo `4`, the two constant orbits (Examples); the integer
  formula `HF_i ≅ H_{i+1}(S²; R)` is the `Γ = 0` formula and does not apply there, since
  `S_sph = H₂(S²; ℤ) ≠ 0`. On `T²` (`Γ = 0`, `n = 1`) the integer formula gives `R`, `R²`, `R` in
  degrees `−1`, `0`, `1`, the four constant orbits of the height function of the embedded torus.
- Over a field the completed `c₁`-zero formula `HF_i ≅ H_{i+n}(X; Λ_𝕜) ≅ H_{i+n}(X; 𝕜) ⊗ Λ_𝕜`
  holds because `Λ_𝕜` is a `𝕜`-vector space, and over `R = ℤ` as well, because `Λ_ℤ` is
  torsion-free, hence flat over `ℤ`; over a general `R` the flatness of `Λ_R` over `R` is the
  base-change hypothesis named here, and it is not automatic.

*Needs:* 7.C.3a–c; 7.C.4; 7.C.6; Layer 7 item 4 (the standing comparison on the overlap); Piunikhin–Salamon–Schwarz §4.

### 7.C.6 Geometric support, finite Laurent and completed matrices

Apply MorseNovikov N1 with ν=−ω:Γ→ℝ only after the geometric support hypotheses are proved. For output recapping B the matched-cap energy is `E=A_H(x̃₊)−A_H(x̃₋)+ν(B)`; continuation, PSS, nodal and homotopy versions retain their actual global error bounds. At a fixed ν cutoff use their own energy-cutoff compactness and rigid-dimensional exclusion of nontrivial breaking/bubbling/parameter-boundary limits to prove finitely many rigid coefficients below that cutoff, including dense period image. These inputs are the geometric sections, fixed-class oriented boundaries where needed and cap/index data, not completed chain equations. First prove cylinder/individual-continuation/relative-cylinder support; separately prove PSS/nodal/both-inverse-homotopy support with their own endpoint/Morse/parameter data. Construct the actual finite-orbit modules, reference-cap coordinates and diagonal monomial changes. Build the differential and all participating maps/homotopies as supported matrices in their concrete ring, then read the finite geometric boundary identities as matrix equations using N1’s finite-below convolution. Aggregate support is an export of the independent concrete support results.


**Checks.**
- Support from energy: `E = A_H(x̃₊) − A_H(x̃₋) + ν(B) ≥ 0` with `ν = −ω` bounds the
  contributing recappings by `ω(B) ≤ A_H(x̃₊) − A_H(x̃₋)`, so `ν(B)` is bounded below for fixed
  generators, and above each cutoff only finitely many classes contribute by energy-cutoff
  compactness; this is MorseNovikov N1's support condition for the valuation `ν`.
- Dense periods: on a K3 surface with a generic Kähler form, `c₁ = 0` and `ω(π₂)` is dense in
  `ℝ`, so `Γ` has no smallest positive period, and finiteness below a cutoff comes from
  compactness and 7.C.2d's finiteness of sphere classes, not from a discrete period group.
- Products need the support condition: `Σ_{m ≥ 0} t^{mA}` times `Σ_{m ≥ 0} t^{−mA}` would have
  coefficient `Σ_m 1` at `t⁰`, which is undefined, whereas for supported matrices every
  coefficient of a product is a finite sum.

*Needs:* MorseNovikov N1; 7.C.1(i); 7.C.3–7.C.4; Salamon §3.7; Hofer–Salamon §4.

### 7.C.6a Positive-monotone bare coefficient model

Before matrices specialize the early datum: ω=κc₁ implies kerω∩kerc₁=kerc₁, so c₁ identifies Γ with N_Cℤ, or Γ=0. Give e^B degree 2c₁(B). This algebra uses cap/branch data alone and is available to fixed-class geometry without any completed count package.

**Positive-monotone finite Laurent matrices.** Use the respective geometric support to construct cylinder/continuation matrices and, separately, PSS/inverse matrices over R[Γ]. A homogeneous entry has at most one exponent by the degree equation. For Γ≠0 choose the positive-Chern generator t, deg t=2N_C and ν(t)=−κN_C<0, so t⁻¹ has positive valuation. The coefficient differential is zero and a Morse tensor generator has degree j−n+2c₁(B). Construct each finite homogeneous matrix before reading its own boundary identities or extending coefficients.

**Checks.**
- `ℂPⁿ` with `ω(L) = 1`: `Γ = ℤ·L`, `κ = 1/(n + 1)`, `t = e^{L}`, `deg t = 2(n + 1)`,
  `ν(t) = −1`; an entry `x ↦ y · t^k` of the degree-`(−1)` differential needs
  `μ(y) + 2(n + 1)k = μ(x) − 1`, which fixes `k`.
- `S² × S²` with areas `(1, 1)` (`κ = 1/2`): `c₁(a, b) = 2(a + b)`, so `ker c₁ = ker ω = ℤ(1, −1)`,
  `Γ = ℤ²/ℤ(1, −1) ≅ ℤ` through `c₁/2`, `N_C = 2` and `deg t = 4`; the class `(1, −1)` has zero
  area and zero Chern number and is invisible to `Γ`, as it must be.
- `Γ = 0` (for instance `T²ⁿ`, where `S_sph = 0`): the ring is `R` with integer grading and no
  generator `t` is chosen; a definition picking "the" positive Chern generator would fail there.

*Needs:* 7.C.1(i).

### 7.C.6b Finite-Laurent chain identities

Prove `d²`, continuation chain-map/composition/homotopy equations and their orientation-line signs over `R[Γ]`, using the monotone cylinder/count and parameter-boundary targets. This proof is the finite-Laurent monotone construction.


**Checks.**
- Positive monotonicity fixes each entry's class: `μ(y, D + B) = μ(x, D) − 1` determines `c₁(B)`,
  and in the injective-Chern model `c₁` determines `B ∈ Γ`, so every matrix entry is a monomial
  and the identities live over `R[Γ]`. In the spherical-`c₁`-zero branch `c₁(B) = 0` for every
  `B`, the index fixes nothing, and the entries need the completion of 7.C.6e.
- On `ℂP¹` with two-point Morse Hamiltonians `εf` and `εf′`, a continuation entry with
  recapping `t^{mA}` needs `μ(y) + 4m = μ(x)` with `μ(x), μ(y) ∈ {−1, 1}`, so `m = 0`: every
  continuation entry lies in `R`.
- The specialization `t ↦ 1` is a ring map `R[Γ] → R`, so every identity proved here descends to
  the cyclically graded complex over `R`; on the completion no such unital map exists (7.C.6f),
  which is why these identities are proved before completion.

*Needs:* 7.C.6 and 7.C.6a; 7.C.4.

### 7.C.6c Finite-Laurent PSS equivalence

With the actual injective-Chern Γ model and monotone matrices/support, prove PSS and inverse matrices are chain maps. Prove the Morse-side inverse from its broken composition and zero-cutoff Morse identity end; prove the Floer-side inverse from its broken composition and its separately constructed nodal/positive-ray/stationary identity end. Each consumes its own monotone endpoint/parameter boundaries together with monotone cylinder identities. Use the two constructed finite-Laurent homotopies for the inverse equations. This gives the chain-homotopy equivalence to M⊗_R R[Γ] before completion.


**Checks.**
- On `ℂP¹` with `H = εf`, a PSS plane with recapping `t^{mA}` needs
  `ind_f(x₊) − 1 + 4m = ind q − 1`, impossible for `m ≠ 0` with indices in `{0, 2}`, and for
  `m = 0` pairs the two critical points only with themselves: the PSS matrix is diagonal with
  entries in `R`.
- `1 − t` is not a unit of `R[t, t⁻¹]` for a domain `R`, whose units are the `u t^k`, so a PSS
  matrix `Id − N` with `N` raising the energy cannot be inverted by a geometric series before
  completion; the inverse is the constructed `PSS⁻¹` with its two homotopies.
- On `ℂPⁿ` with a perfect Morse function, `M ⊗_R R[Γ]` and `CF` both have zero differential (all
  degrees of one parity, since recapping shifts `μ` by `2(n + 1)`) and rank `n + 1` over `R[Γ]`,
  as a chain-homotopy equivalence of complexes with zero differential, an isomorphism, requires.

*Needs:* 7.C.6b; 7.C.5b.

### 7.C.6d Complete filtered cyclic grading after monotone completion

After 7.C.6b–c, extend the finite matrices and specified homotopies along R[Γ]→Λ_R=Nov(R,Γ,ν), ν=−ω, Tau Ceti's `TauCeti.Floer.NovikovRing`, using N1. For Γ≠0 set d_C=2N_C. Give Λ_R degree zero modulo d_C and each finite reference orbit/Morse generator its μ or j−n residue. The completed module is finite free over Λ_R with these residues. Define F^aΛ_R by support in ν≥a, give the finite generator module its product filtration and prove it complete and separated. A map T has its proved finite shift δ_T, meaning T(F^a)⊂F^(a−δ_T); the differential and specified homotopies carry their own such shifts. Cap changes give diagonal monomial maps with their actual finite shifts. A series may have infinitely many integer degrees; this completed theory is ℤ/d_C-graded. Differential, maps and specified homotopies are continuous with the proved filtration shifts and residue degrees −1,0,+1. Prove completeness, cap-change compatibility and continuity from the finite matrices/support bounds. Extend the finite-Laurent equivalence and both actual homotopies to a complete ν-filtered ℤ/d_C-graded Λ_R-module chain-homotopy equivalence with correspondingly regraded M⊗_RΛ_R. Γ=0 retains integer grading and R coefficients. The integer finite-Laurent theory and its cyclic t↦1 specialization remain separate outputs; no t↦1 map on Λ_R is asserted.

**Checks.**
- `ℂPⁿ`: `d_C = 2(n + 1)`, `ν(t⁻¹) = +1`, and `Σ_{k ≥ 0} t^{−k}` converges in `Λ_R` (finitely many
  terms below each `ν`-level) while `Σ_{k ≥ 0} t^{k}` does not; so `(1 − t⁻¹)⁻¹ = Σ_{k ≥ 0} t^{−k}`,
  and `1 − t = −t(1 − t⁻¹)` is a unit as well, with inverse `−Σ_{k ≥ 1} t^{−k}`. The completion in
  the opposite direction (`ν = ω`) would instead invert `1 − t` through `Σ_{k ≥ 0} t^{k}`: the
  convergent expansion, not the unit itself, pins the direction of completion.
- Separatedness: a nonzero series lies outside `F^a` for `a` above its least period, so
  `∩_a F^a = 0`; on `Γ = 0` the filtration is `F^a = M` for `a ≤ 0` and `0` for `a > 0`.
- The residue grading identifies the degrees `i` and `i + 2(n + 1)` on `ℂPⁿ`, so a generator
  `x` and `x · t` have the same residue; the finite-Laurent complex, which distinguishes them, is
  the separate integer-graded output of 7.C.6a–c, not a quotient of this one.

*Needs:* 7.C.6b–c; MorseNovikov N1.

### 7.C.6e Spherical-c₁-zero bare model and completion

Before counts, c₁|S_sph=0 gives kerω∩kerc₁=kerω, so ν=−ω identifies Γ with its real period subgroup; all coefficient degrees are zero. This is an early datum, not a matrix theorem. Use cylinder/continuation support to construct their completed matrices and only then read their own finite-cutoff boundaries as d²/continuation equations. Independently construct the PSS/inverse matrices from their support and derive their equations from the c₁-zero PSS boundaries and BOTH endpoints. Finitely many orbit generators give the usual integer grading with a finite underlying degree set. This separate completed lane includes positive sphere areas; index alone supplies no energy bound.

**Checks.**
- A `c₁`-zero target with `Γ ≠ 0`, for instance a K3 surface with a Kähler form: `Γ = S_sph/ker ω`
  and `ν = −ω` identifies it with the period subgroup `−ω(S_sph) ⊂ ℝ`, which can be dense; all
  coefficient degrees are `0`, so the completed complex is integer-graded by `μ` alone.
- `T²ⁿ`: `c₁ = 0` and `S_sph = 0`, so `Γ = 0`, `Λ_R = R`, and this lane and the monotone lane at
  `Γ = 0` are the same complex.
- Index gives no energy bound: a cylinder between caps differing by `B` has index shift
  `2c₁(B) = 0` whatever `ω(B)` is, so cylinders of every area have the same index and a finite
  energy cutoff is required, whereas on `ℂPⁿ` the index equation fixes the exponent `k` and
  bounds the energy.

*Needs:* 7.C.1(i); 7.C.6.

### 7.C.6f Laurent cyclic specialization and the completed-unit obstruction

On the finite ring `R[t,t⁻¹]`, the ungraded map `t↦1` gives the finite cyclic complex and PSS comparison graded modulo `2N_C`; retain the integer grading when `Γ=0`. For any nonzero unital `R` and `ν(B)>0`, N1 makes `1−e^B` a unit, so a unital map from the entire completion to `R` sending every monomial to 1 cannot exist. The cyclic specialization is consequently defined on the finite Laurent ring.

**Checks.**
- On `R[t, t⁻¹]` the element `1 − t` is not a unit (its image under `t ↦ 1` is `0`), while in the
  completion with `ν(t⁻¹) > 0` the element `1 − t⁻¹` is a unit with inverse `Σ_{k ≥ 0} t^{−k}`; a
  unital map from the completion to a nonzero `R` sending `t ↦ 1` would send this unit to `0`.
- `ℂPⁿ`: after `t ↦ 1` the cyclic complex has rank `n + 1`, all generators in degrees of the
  parity of `n` modulo `2(n + 1)`, so the differential vanishes and the cyclic homology has
  total rank `n + 1`.
- `Γ = 0`: there is nothing to specialize and the integer grading is retained.

*Needs:* 7.C.6d; MorseNovikov N1.

### 7.C.6g Field adapter and Arnold bound

Assume every contractible one-periodic orbit of H is nondegenerate. For a field 𝕜 and injective ν, factor a nonzero series at its unique least-period element B₀ as `c e^(B₀)(1+b)` and invert the strictly-positive-support `1+b` by N1, including dense period image. This field adapter applies only where ν:Γ→ℝ is proved injective; Γ=0 gives 𝕜. For the positive-monotone Arnold bound use the finite-Laurent PSS equivalence, followed by the permitted `t↦1` specialization: the resulting cyclic 𝕜-chain complex has rank equal to the number of contractible periodic orbits, and its homology is the cyclic direct sum of H_j(X;𝕜), with total dimension the total 𝕜-Betti rank. The finite-dimensional chain-rank inequality gives `#{contractible 1-periodic orbits}≥Σ_j dim_𝕜 H_j(X;𝕜)`. For spherical-c₁-zero use the actual Novikov field adapter and completed PSS equivalence, which has that finite homology rank; Γ=0 is the ordinary 𝕜 case. The monotone comparison uses its Laurent-only specialization and the c₁-zero comparison uses its field adapter. Over arbitrary rings retain `H_(i+n)(X;Λ_R)` separately and require a proved base-change hypothesis for any tensor-product homology description.

**Checks.**
- `ℂPⁿ` with a `C²`-small Morse Hamiltonian: `n + 1` nondegenerate contractible orbits and
  `Σ_j dim H_j(ℂPⁿ; 𝕜) = n + 1`, so the bound is sharp.
- `T²` (`Γ = 0`): the Betti sum is `4`, attained by the height function of the standard embedded
  torus; the bound `≥ 4` is the nondegenerate Arnold conjecture there.
- `ν` is injective on `Γ` in both branches, since `ker ω ∩ ker c₁ = ker ω` when `c₁ = 0` on
  spheres and when `ω = κ c₁` with `κ > 0`; on `S² × S²` with areas `(1, 2)` it is not:
  `(2, −1)` has `ω = 0` and `c₁ = 2`, so it is nonzero in `Γ` with `ν = 0`, and the field
  adapter does not apply, as neither branch hypothesis holds there.

*Needs:* 7.C.6c–f; MorseNovikov N1; 7.C.1 (finiteness of the nondegenerate contractible orbits).

### 7.C.6h Arbitrary critical number and the degenerate comparison statement

Consume MorseTheory M4's single `c(M)` construction: the attained minimum of the finite critical-point counts of all smooth real functions on a compact boundaryless manifold, with infinite critical sets counted in ℕ∞. It is not the minimum restricted to Morse functions. That owner also constructs the arbitrary-function LS lower bound from the AlgebraicTopology categorical-cover/cup-length supplier, without a Morse approximation of the function being bounded.

For any closed finite-dimensional symplectic M, state the degenerate critical-number comparison statement: every smooth Hamiltonian isotopy from the identity to φ satisfies `c(M) ≤ #Fix(φ)` in `ℕ∞`, where fixed points count once. Retain this as the precise source conjecture/comparison statement, separate from the nondegenerate theorem of 7.C.6g; no general theorem or present research-status conclusion is asserted here. Any theorem realization requires its actual additional scope and proof, not nondegenerate perturbation followed by a fixed-point count limit.

Construct the autonomous case independently of Floer counts. For smooth time-independent H on closed M, `dH=ι_(X_H)ω` and nondegeneracy give `dH(p)=0 iff X_H(p)=0` (Layer 6 item 0). ODE uniqueness makes the orbit through such p constant, so `Crit(H)⊆Fix(φ_H^1)`. If Crit(H) is finite, M4's minimum gives `c(M)≤#Crit(H)≤#Fix(φ_H^1)`; if it is infinite, the inclusion makes the fixed-point count∞. This proves the stated autonomous lower bound, including empty, disconnected and zero-dimensional cases through M4's own conventions. Conversely, time-one fixed points need not be equilibrium points. The general time-dependent comparison retains all source scope but is not inferred from this autonomous argument, LS alone, or the earlier Betti-rank estimate.

**Checks.**
- `S²`: `c(S²) = 2` (every function has a maximum and a minimum, and the height function has
  exactly two critical points), so the statement asks for two fixed points; a rotation has
  exactly two, so it is sharp, and it agrees with the Betti-sum bound `2` of 7.C.6g.
- `T²`: `c(T²) = 3` (the cup-length bound gives `≥ 3`, and a function with three critical points
  exists) while the Betti sum is `4`: the degenerate and nondegenerate bounds differ, so the
  degenerate statement is not the limit of the nondegenerate theorem.
- Autonomous: for `H = εf` with `f` the height function on `T²`, `Crit(H)` has four points and
  `Crit(H) ⊆ Fix(φ_H^1)` gives `3 ≤ 4`; conversely the Hamiltonian generating a full rotation of
  `S²` in time one has `Fix(φ_H^1) = S²` but only two equilibria, so time-one fixed points need
  not be critical points.

*Needs:* MorseTheory M4; AlgebraicTopology (the categorical-cover and cup-length supplier of MorseTheory M4); Layer 6 items 0–1.

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
  `ψ = id` on `T² = ℝ²/ℤ²` the loop of sections `γ_s(t) = (t, s)` sweeps `T²` once, so
  `I_ω = ∫_{T²} ω ≠ 0` although every sphere has zero area; hence `Γ_a ≠ 0` and the Novikov
  completion is genuinely needed, while `Γ = 0` for the contractible sector of 7.C. A loop of
  constant sections `γ_s ≡ x_s` sweeps only the circle `s ↦ x_s` in `T²` and has `I_ω = 0`.

*Needs:* Layer 6 item 1; Layer 7 items 1–2; 7.C.1–7.C.4 (cylinder analysis, continuation and
support, instantiated with the seam); 7.C.2 (the linear seam application and the Hamiltonian
untwisting); MorseNovikov N1; HeegaardFloer F1 (the relative index and determinant); Layer 2
item 1; Lee I §3.1.

### 7.T Floer–Novikov torsion and its periodic-flow correction

Construct the abelian Floer–Novikov torsion application for a nonempty closed connected boundaryless smooth symplectic manifold `(M^(2n),ω)`, n≥1, and a smooth symplectomorphism f, with a chosen component C of its twisted loop space. Require the actual finite-dimensional Hausdorff second-countable structures. The main geometric range is **w⁺-monotonicity**: `ω(A)>0` for each spherical integral class A with `0<c₁(TM)(A)≤n−2`, in the source's specified symplectic/Chern convention. Construct the convention comparison below before using this hypothesis in a native index or bubble calculation. The zero-dimensional point model is separate. Construct the regular-data and Hamiltonian-connected invariance theorem in 7.T.8; the stronger monotone symplectic-isotopy theorem is a separate7.T.9 target.

This is a classical count-dimensional application, not an extension of Layer 8's all-dimensional DG-coefficient theory. Layer 7.G supplies its reusable seamed carrier and local analytic comparisons, not a w⁺ compactness/exclusion theorem; 7.C supplies reusable raw operators and orientation templates, not its contractible cap quotient, branch exclusions, PSS equivalence or a torsion invariant. No noncompact/no-escape, general virtual, unrestricted Lagrangian, nonabelian Whitehead, arbitrary integral-zeta or higher-parametric torsion theorem is inferred.

**Checks.**
- For `n ≤ 2` the range `0 < c₁(A) ≤ n − 2` is empty, so every closed symplectic manifold of
  dimension `2` or `4` is `w⁺`-monotone.
- On `(S²)⁴`, `n = 4`, with areas `1, 3, 1, 1` on the factors, the spherical class
  `A₁ − A₂ + A₃` has `c₁ = 2 − 2 + 2 = 2 ≤ n − 2` and `ω = 1 − 3 + 1 = −1 < 0`, so the form is
  not `w⁺`-monotone; with four equal areas `a` it is monotone with `κ = a/2` and `w⁺`-monotone.
- A spherically aspherical target satisfies the condition vacuously, since no spherical class
  has `c₁ > 0`, and a positive monotone one has `ω(A) = κ c₁(A) > 0` throughout the range.

### 7.T.0 Exact suppliers and construction direction

Consume MorseNovikov N1,N4 for period-controlled Novikov rings, finite convolution, completed finite-orbit modules, rational exp/log, total quotients and their field components, ordered determinant/torsion comparisons, finite-cyclic norms and cutoff topology. N6 owns the finite-dimensional closed-one-form bifurcation application. Reuse its algebraic identities where their hypotheses are established, not its finite-dimensional moduli argument as a Floer theorem. Construct the finite-parity application of the determinant comparisons in 7.T.4; do not call a two-periodic complex a bounded integer complex. Consume HeegaardFloer F0,F1,F2's actual Banach/Sobolev, unique-continuation, index and determinant interfaces, and PseudoholomorphicCurveAnalysis PH3–PH6's local Cauchy–Riemann estimates, similarity principle, linear unique continuation and compact Fredholm interfaces. HeegaardFloer's invertible-end exponential theorem does not supply the degenerate polynomial-end theory constructed in 7.T.6. Use the existing DifferentialGeometry, SmoothBundlesConnections and AlgebraicTopology compact smooth-manifold and covering interfaces for mapping tori, section bundles, finite CW homology and characteristic classes. This application owns the seamed nonlinear, sphere-incidence, periodic-flow and bifurcation constructions at the range below. Construct them before invariance; an invariant value or later torsion computation is never a regularity, compactness or gluing premise.

*Needs:* MorseNovikov N1 and N4; HeegaardFloer F0–F2; PseudoholomorphicCurveAnalysis PH3–PH6; AlgebraicTopology Stages 2–6; DifferentialGeometry Layers 0–3; SmoothBundlesConnections.

### 7.T.1 Actual section cover, finitely generated deck group and index

Instantiate SymplecticGeometry S0’s same mapping-torus carrier at native monodromy `ψ_native=f⁻¹`, construct its displayed closed-interval comparison `T_f=(M×[0,1])/((x,0)~(f(x),1))`, and construct the W^(1,2) component C of its sections containing a specified smooth γ₀, with smooth/Sobolev and seam comparisons. This has source seam `γ(1)=fγ(0)`: the equivalence is `(x,0)~(f(x),1)`. The native SymplecticGeometry S0 and 7.G carrier has seam `γ(1)=ψ_native⁻¹γ(0)`, so it is instantiated at `ψ_native=f⁻¹`, not at f. Construct the actual quotient/seam identification `[γ(t),t]↦[t,γ(t)]`, its inverse and local smooth charts. Its vertical bundle transition is df, matching `dψ_native⁻¹`; pull back the fibre form, seam-matched X/J, reference section/frame, sweep/period maps and covering/deck/Chern data through this identification. A loop of sections s↦γ_s sweeps `F(t,s)=[γ_s(t),t]` in T_f. Orient its source by **dt∧ds**, the circle coordinate t before the loop-of-sections coordinate s, and define `im:π₁(C,γ₀)→H₂(T_f;Z)` by this oriented torus and `H=im(im)`. Construct the mapping-torus boundary map ∂f with `∂f(im[γ_s])=[s↦γ_s(0)]`. Let V=ker(dπ:T(T_f)→TS¹) with its fibre symplectic form ω^f. Choose a native positive compatible I on V, with metric ω^f(·,I·), and define the canonical symplectic Chern class `c₁^f=c₁(V,I)` and `ψ_c(A)=⟨c₁^f,A⟩`. Prove independence of I by the compatible-structure homotopy. This pins the source canonical c₁(K) comparison: the metric variable J_L used below is −I, so `c₁(V,J_L)=−c₁^f` and is not silently substituted for c₁^f. Pin `c₁(TM)` in w⁺ by the same positive-compatible fibre restriction. Prove H finitely generated as a subgroup of the finitely generated abelian H₂ of this compact finite-CW-type mapping torus; do not assume π₁(C) itself is finitely generated or replace H by its torsion-free quotient. Construct the actual H-cover by the kernel of im, path lifting, local reference transport and the deck action.

Let X_t be a smooth seam-matched symplectic vector field. Put `θ_(X,t)=ι_(X_t)ω`, retain its flux and define the closed action one-form

`Y_X(γ)(ξ)=−∫₀¹ω(γdot,ξ)dt+∫₀¹θ_(X,t)(ξ)dt`.

Construct its period character `P_X:H→R` from the actual swept integral, prove it factors through H, and construct a primitive A_X on the H-cover with `dA_X=Y_X`. Pin the deck convention by `A_X(A·x̃)=A_X(x̃)+P_X(A)`; then `N_X=−P_X` is the Novikov character. For `θ_X=∫₀¹θ_(X,t)dt`, derive the exact source area/flux formula `P_X(A)=−⟨[ω^f],A⟩+⟨[θ_X],∂f A⟩` from this dt∧ds sweep. Changing its orientation changes the character and its explicit exponent isomorphism, not the same completion by fiat. The reference section/frame determines the relative index. Define the deck spectral-flow character `ψ:H→2Z` on the actual self-adjoint end family; prove the source identity `ψ=2ψ_c` with the above canonical complex-bundle and dt∧ds conventions, its evenness and relative-index recapping formula. Construct its comparison with HeegaardFloer's single frame/Chern/CZ construction, retaining every actual change of source, end and frame convention. Set `K=ker ψ`. Retain torsion in H and K and all finite ties or dense images of N. Neither K nor this cover is the spherical cap quotient Γ of 7.C.

**Checks.**
- `f = id` on `T² = ℝ²/ℤ²` with `X = 0`: `T_f = T² × S¹`, and the loop of sections
  `γ_s(t) = (t, s)` sweeps `F(t, s) = [(t, s), t]`, whose projection to `T²` is the identity in the
  orientation `dt ∧ ds`; so `⟨[ω^f], A⟩ = ∫_{T²} ω = 1`, `P_0(A) = −1` and `N_0(A) = 1 > 0`. A
  loop of constant sections `γ_s ≡ x_s` sweeps a circle in `T²` and has `P_0 = 0`.
- `f = id` on `S²`: a loop of sections whose sweep `T² → S²` has degree one gives
  `A = [S²] ∈ H₂(S² × S¹)`, `ψ_c(A) = ⟨c₁(TS²), [S²]⟩ = 2` and `ψ(A) = 4`, the index shift of a
  cap change by the line in 7.C; a definition with `ψ = ψ_c` would give the odd value `2`.
- Torsion is retained: for `f = id` on a symplectic four-manifold with `H₁(M; ℤ) = ℤ/2` (an
  Enriques surface), `H₂(M × S¹; ℤ)` contains `H₁(M) ⊗ H₁(S¹) = ℤ/2`, swept by a loop of
  constant sections along the nontrivial loop; `P_X` and `ψ` vanish on it, and a definition
  replacing `H` by its torsion-free quotient would lose it.

*Needs:* SymplecticGeometry S0 (the mapping torus at `φ = f⁻¹`); Layer 7.G (the seamed carrier); HeegaardFloer F1.3–F1.5; AlgebraicTopology Stages 5–6 (the mapping-torus homology and finite generation of `H₂`); Layer 6 item 1.

### 7.T.2 Metric, flow, end and determinant dictionary

Construct the source-compatible complex directly. Its compatible structure J_L defines the positive-definite symmetric metric `g_L(v,w)=ω(J_L v,w)`. Use the actual metric dual `V_X=Y_X^sharp`, the elliptic formal-gradient equation `u_s+V_X(u)=0`, and the energy `E=∫|u_s|²`. Construct the loop-space weak differential and derivative-loss statement, not an ODE flow on an infinite-dimensional Banach manifold. In these conventions prove `θ_X^sharp=−J_L X` and

`u_s+J_L(u_t−X_t)=0`,  `E=A_X(x̃_−)−A_X(x̃_+)`.

The source-compatible input is the negative end, output the positive end. For `J_D=−J_L`, prove `g_L(v,w)=ω(v,J_Dw)` and that `v(s,t)=u(−s,t)` solves the displayed this roadmap PDE with J_D and the same X. In a Hamiltonian chart, Y_X agrees with the differential expression of 7.C's A_H; reference constants remain explicit. Write the source arrow as `x_−→x_+`, with u(−∞)=x_− and u(+∞)=x_+. Then v(+∞)=x_− and v(−∞)=x_+: the native capped7.C positive-input arrow is `v_+→v_−=x_−→x_+`, the same generator arrow. In contrast the standing negative-input arrow is `v_−→v_+=x_+→x_−`, so that comparison requires the actual transpose/dualization. Do not force dualization in the capped branch merely from s reversal. For a closed source sweep write `F(t,s)=[u(s,t),t]` on the ordered domain `(t,s)` with orientation dt∧ds. After reflection define `G(s,t)=[v(s,t),t]=F(t,−s)` on the native ordered domain `(s,t)` with orientation ds∧dt. The coordinate map `(s,t)↦(t,−s)` has determinant +1, so these two oriented swept classes agree under the actual quotient identification; their ω-densities agree because `ω(v_s,v_t)=ω(u_t,u_s)`. In contrast the fixed-order sweep `F_v(t,s)=[v(s,t),t]=F(t,−s)` on `(t,s)` reverses orientation and negates the source class. These are different ordered carriers, not a blanket negative native class. For an open cylinder define the relative swept class with its actual end boundaries and attach the chosen source reference caps; transport those caps, their boundary orientations and extending frames through the displayed quotient map and the positive-determinant `(s,t)↦(t,−s)` identification to define the corresponding native capped carrier. Prove its equality to the transported source capped class in that declared reference system, recording separately any deck/reference-cap changes. A standing negative-input dual-complex readout still reverses the generator arrow and requires its own basis/deck/determinant comparison; it does not negate a native ds∧dt swept class merely by naming the opposite input. Construct the resulting actual maps of section/cap covers, deck characters, coefficient rings/localizations, reference bases and determinant lines. Compute the induced dual-complex, parity-shift and torsion inversion/sign formula using N4's ordered determinants, including the sign/deck ambiguity and the nonacyclic-zero components. Do not assert unchanged torsion or I_F from identical orbit sets, parity, or an ordinary continuation equivalence.

Construct the Chern comparison for the positive-compatible vertical bundle (V,I) on source T_f and native `Y_(f⁻¹)`, its conjugate symbol bundle (V,J_L), and the actual extending-frame loop; it must verify the pinned source c₁^f/ψ formula and fix the signed native-index equality, not introduce a second CZ invariant or leave a free ± convention. Use a fixed end trivialization, the native small-rotation and scalar-crossing references, and the quotient-followed-by-negative-flow and outward-first parameter conventions of 7.C.2a to fix the comparison. Derive closed-orbit determinant orientations and the finite-cyclic action sign from these actual reference diagrams. Source s-parametrizations and classes may be used throughout the torsion construction until this uniquely specified native comparison is proved. No convention adapter is a hypothesis that grants the final invariant.

**Checks.**
- On `(ℝ², dq ∧ dp)` with `J₀ ∂_q = ∂_p`: `ω(J₀ v, v) = −|v|²`, so `g_L(v, w) = ω(J_L v, w)` is
  positive definite for `J_L = −J₀` and negative definite for `J_L = J₀`; this is why
  `J_D = −J_L` is the compatible structure of 7.C and `g_L(v, w) = ω(v, J_D w)`.
- With `X = 0` and `J_L = −J₀` the source equation `u_s − J₀ u_t = 0` makes `u` antiholomorphic
  in `s + it`, and the reflected `v(s, t) = u(−s, t)` holomorphic, which is the 7.C equation
  `v_s + J_D v_t = 0`; using `J_L` in the 7.C equation without the reflection would give
  antiholomorphic cylinders and the opposite sign in the energy identity.
- The identification `(s, t) ↦ (t, −s)` has Jacobian determinant `+1` and `(t, s) ↦ (t, −s)`
  has `−1`: the reflected cylinder sweeps the same class on the native ordered domain and the
  negative class on the source-ordered one, so the two carriers must be kept apart.

*Needs:* 7.T.1; 7.C.2a (orientation conventions); 7.C.0 (the action dictionary); MorseNovikov N4.

### 7.T.3 w⁺ raw cylinders and regular-data theorem

Construct seam-compatible J/X coefficient spaces and their localized Hamiltonian variations, all finite-order Sobolev section/evaluation charts and Fredholm/adjoint estimates, with the actual common-domain end realizations and explicit parameter/Sobolev differentiability budgets from F0/F1. Raw fixed-class energy-cutoff compactness, conditional gluing and the sphere-incidence problems precede regular selection. Construct the w⁺ semipositive sphere reductions and the joint t-parametrized sphere/orbit/core evaluation theorem, retaining equal-t shared structures, simple-image/cover reduction and the limiting bubble trees. For end orbits construct the low-Chern sphere avoidance needed by the count-dimensional theorem; do not assume it from nondegeneracy. Pin the finite count range explicitly. Write r for the source capped relative Fredholm index, p∈{0,1} for the finite external parameter dimension counted once, and reserve q>2 for the Sobolev exponent. A nonconstant translation-invariant cylinder has unreduced dimension r+p and reduced dimension r−1+p. Fixed differential/broken-boundary windows are (r,p)=(1,0),(2,0); slide/adjacent-family-boundary windows are (0,1),(1,1). An s-dependent continuation equation has no translation quotient: use dimension r+p, with (0,0),(1,0) for map/boundary and (−1,1),(0,1) for chain-homotopy/boundary. Prove negative-dimensional emptiness only for the actual regular realizations. Degenerate endpoints use the upper/lower end indices and polynomial realization of 7.T.6, not the nondegenerate formula by declaration. The periodic-flow windows are specified in 7.T.5. No all-index or higher-parameter simultaneous regularity is asserted by this lane.

Construct the joint sphere matching in these actual windows, not a blanket parametric avoidance assertion. A simple one-marked sphere of Chern number c in the common t and P fibre has dimension 2n+2c−3+p before matching to the end-orbit graph; its incidence with that graph has expected dimension **2c−3+p**. For fixed data c≤1 gives a negative dimension; for p=1,c=1 it is zero. Retain those possible zero-dimensional family end incidences in the admissible stratification and prove their actual exclusion from, or contribution/description in, the required compactified count/event boundaries. Do not infer their absence from the fixed-data inequality. Distinguish avoidance of the Chern-zero sphere-image set M₀(J_t) by the selected cores and ends from fixed-data Chern-one end avoidance. For an interior sphere bubble on a regular nonconstant cylinder, the remaining core has index r−2c; adding its free attachment point and the marked sphere and matching gives r−3+p, two below the main reduced dimension. Prove the analogous two-dimension drop for a regular nonstationary periodic core. These expectations do not settle covers, stationary/collapsed cores, trees or degenerate-end matching: construct their reductions, positivity/energy and index comparisons separately. Include stationary and constant-core configurations through their actual invertible or degenerate models. The positive-monotone energy ceiling, c₁-zero index argument and spherical-aspherical exclusion from other lanes are not this proof.

On each fixed class/energy window within the preceding finite index/parameter range prove the actual conditional range theorem, proper-window openness, density/smoothing and countable simultaneous selection in its stated constrained coefficient spaces, preserving seam/end/relative germs. Closed orbits require7.T.5's extra multiple-cover theorem. Prove existence of the regular pairs and endpoint-relative admissible homotopies used below from these constructions. “Regular” records specified operator transversality and nondegenerate finite asymptotics; it must not be defined to mean that compactness, all bifurcation conclusions or invariance already hold. Prove the finite critical-section theorem by identifying the generator component as a clopen subset of the compact fixed-point set of `f⁻¹∘Φ_X¹`, where Φ_X is the actual time-dependent symplectic flow; nondegeneracy then gives finiteness.

For regular fixed data construct the cylinder zero-dimensional translation quotient, compactified one-dimensional quotient with its broken boundary and coherent orientation lines. Prove finite rigid counts at every energy cutoff, integral class addition, reference changes, support and the signed square-zero equation after the matrices exist. Construct the actual supported w⁺ continuation and homotopy maps needed for comparisons of regular data and for endpoint/event limits, with finite integrated Hamiltonian derivative/curvature budgets. This does not import PSS or a module comparison into a non-Hamiltonian component. No all-dimensional corner or higher-DG export is asserted by these count-dimensional outputs.


**Checks.**
- Sphere–orbit incidence: a simple one-marked sphere of Chern number `c` has a family of
  dimension `2n + 2c − 6 + 2`, and with the time `t` and the external parameter it has
  `2n + 2c − 3 + p`; matching with the end-orbit graph, of codimension `2n`, leaves `2c − 3 + p`:
  `−1` for `(c, p) = (1, 0)`, `0` for `(1, 1)`, and `−3 + p < 0` for `c = 0`.
- Bubbling costs two dimensions: a core of index `r − 2c` has reduced dimension `r − 2c − 1 + p`;
  adding `2` for the attachment point and `2n + 2c − 4` for the one-marked sphere and subtracting
  `2n` for the matching gives `r − 3 + p`, two below the main reduced dimension `r − 1 + p`. In the
  count windows `(r, p) = (1, 0), (2, 0), (0, 1), (1, 1)` it is `−2, −1, −2, −1`.
- Continuation equations have no translation quotient: their dimension is `r + p`, so `(0, 0)`
  gives the rigid continuation counts and `(−1, 1)` the rigid homotopy counts; dividing by a
  translation would give dimension `−1` at `(0, 0)` and no continuation map.

*Needs:* HeegaardFloer F0–F2; 7.C.2b(iv)–(v) (conditional evaluation and compact exhaustion); 7.T.1–7.T.2; 7.C.3 (compactness and conditional gluing templates).

### 7.T.4 Finite based parity complex and total quotients

Apply N1 to the actual finite-orbit cover and N_X|K. Construct the source-compatible finite free parity complex `CF_even↔CF_odd` over `Λ_F=Nov(Z,K,N_X|K)`, using integer lifts in a fundamental index interval and a generator for ψ(H) when that subgroup is nonzero; treat ψ=0 without choosing a nonexistent positive generator. Construct its differential by the actual deck/reference index selection, not by infinite summation of all integer shifts into one parity generator. Prove every reference/lift/order change and the relation to the relative integer complex. This is a finite parity object, not the infinite repeated Z-graded complex viewed as finite.

For each field component of `Q(Λ_F)`, apply N4's short-exact-sequence determinant comparisons to the two cycle/boundary sequences, in the fixed even-then-odd order. Construct the resulting parity determinant readout and its basis-change and dualization formulas. On an acyclic component take its scalar torsion, normalized by `τ(0→F --a→ F→0)=a⁻¹` for the odd-to-even differential. On a nonacyclic component set the scalar0 and retain the determinant-line refinement separately. The zero chain complex is acyclic and has τ=1. Define τ_F in the WHOLE total quotient with its sign/deck-monomial orbit action, not in its units; mixed zero/nonzero components are allowed. Construct its ambiguity under reference frames, index shifts, orientations and chosen lifts.

Use N4's actual `Localization(nonZeroDivisors)` and finite characteristic-zero field decomposition. Construct the maps from the integral completion to its rational-coefficient completion and their total quotients, proving preservation of nonzerodivisors and component compatibility from the finite-torsion/kernel splitting and actual support. Do not identify rationalized completed series with an unrestricted algebraic tensor product. For cutoff limits use N4's embedding into the larger Novikov rings over kernel-field coefficients, with the specified splitting-independence; no unsupported valuation on the raw total quotient is assumed. Generic Novikov/localization/determinant theorems stay with MorseNovikov; this lane owns their parity and Floer reference/basis application.

**Checks.**
- The connected zero-dimensional model: `M` a point, `f = id`, `C` with one section, `H = K = 0`,
  `N_X = ψ = 0`. With the fixed zero-index reference the parity complex is `CF_even = ℤ`,
  `CF_odd = 0`; after localization its even homology is `ℚ`, so `τ_F = 0`. A field ground change
  gives the same calculation with that field as the even module. This is not the zero chain
  complex.
- The zero complex is acyclic with `τ = 1`; a nonacyclic field component has `τ = 0`; the
  elementary acyclic complex `0 → F → F → 0` with odd-to-even map `a` has `τ = a⁻¹`.
- Mixed components: for `K = ℤ ⊕ ℤ/2` with `N_X` vanishing on the torsion, the rationalized
  completion contains `ℚ[ℤ/2] ≅ ℚ × ℚ` (idempotents `(1 ± g)/2`), so `Q(Λ_F)` has at least two
  field components, and a complex acyclic on one and not the other has `τ_F = (a⁻¹, 0)`, which
  is why `τ_F` lives in the whole total quotient and not in its units.

*Needs:* MorseNovikov N1 and N4; 7.T.3.

### 7.T.5 Periodic formal flow and rational zeta

Construct solutions on `S¹_T×S¹`, T>0, with seam f in t, in the specified C sector. Include T as an actual parameter by rescaling s/T and computing the period derivative of the section. Remove stationary solutions before the circle quotient. The s-translation circle may have a finite stabilizer of order mult(u); construct local slices and distinguish a simple closed formal flow from its parametrized covers. These objects are not merely fixed points of f or geometric unparametrized tori with their multiplicities forgotten. The torus map to T_f defines A∈H. With the actual period T variable the unreduced Fredholm dimension is ψ(A)+1+p and the locally-free translation-circle quotient has dimension ψ(A)+p; no additional period dimension is added afterward. Fixed rigid counts use ψ(A)=0,p=0 and their family cobordisms ψ(A)=0,p=1. Because ψ is even, negative ψ gives negative reduced dimension in these p≤1 regular windows. Prove the rigid closed-flow classes therefore lie in K, with energy `E=N_X(A)>0`, using the signed comparison of 7.T.2. Higher periodic indices remain in the raw carrier but are not assigned an all-index regularity theorem here.

Own the Taubes-type simultaneous multiple-cover regularity application: decompose the linearized operators on all finite cyclic covers of a simple periodic flow into actual representation spaces, construct the allowed localized variations and their coupled annihilator/range theorem, and achieve simultaneous regularity for the required class/period/cutoff windows. Ordinary simple-cylinder injective-point regularity is not this theorem. Prove the determinant orientation is grading-compatible, compute the stabilizer action, and define the signed rational weight `sign(u)/mult(u)` only on the resulting isolated reduced solutions.

Construct energy-cutoff compactness with period and derivative bounds, exclusion/description of T→0 and T→∞ limits, sphere attachment/breaking and the w⁺ low-dimensional incidence exclusions of 7.T.3. For T→∞ retain cyclically broken trajectories and their class/period matching; no compact fixed-domain torus theorem supplies this end. Prove finitely many rigid reduced solutions below each energy cutoff and that the coefficient sum has strictly positive finite-below N-support. Use N1 to define

`η_F=Σ_(A∈K,A≠0)(Σ_[u]∈Mhat_O(A) sign(u)/mult(u)) e^A`,

`ζ_F=exp(η_F)∈1+Nov^{>0}(Q,K,N_X|K)`.

Construct ζ_F's actual reference/gauge laws and rational coefficient map. Integral cylinder counts do not make ζ_F integral: no integral product formula or integral virtual/stabilizer cancellation is asserted. Compare the geometric torus in `S¹×T_f` with its formal-flow class and orientations, without identifying this count with an arbitrary genus-one Gromov–Witten or TaubesGromov zeta invariant.

**Checks.**
- `N_X|_K = 0`: the positive-energy identity `E = N_X(A) > 0` excludes nonconstant closed formal
  flows, so `η_F = 0` and `ζ_F = 1`.
- A single simple closed flow of class `A` whose `m`-fold covers are all regular with sign `+1`
  contributes `Σ_{m ≥ 1} e^{mA}/m = −log(1 − e^{A})`, so `ζ_F = (1 − e^{A})⁻¹`, a unit of the
  completion because `N_X(A) > 0`; with alternating signs `(−1)^{m+1}` it contributes
  `log(1 + e^{A})` and `ζ_F = 1 + e^{A}`. Counting each parametrized cover with weight `1`
  instead of `1/m` would give `exp(Σ e^{mA})`, which has neither form.
- `f = id` on `T²` with `X = 0`: the class `A` of the degree-one sweep of 7.T.1 has `ψ(A) = 0`
  (as `c₁(T²) = 0`) and `N_0(A) = 1 > 0`, so it is an admissible class for rigid closed flows;
  on `S² × S¹` the class `[S²]` has `ψ = 4`, so its reduced dimension is `4 + p > 0` in every
  window and it carries no rigid closed flow.

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

**Checks.**
- The scalar crossing: with the stated value `CZ_HF(A − ε) − CZ_HF(A + ε) = −1`,
  `ind₊ − ind₋ = ν_L(A − ε) − ν_L(A + ε) = −(CZ_HF(A − ε) − CZ_HF(A + ε)) = +1`, independently
  of `c_ref`; a definition with `ind₊ = ν_L(A + ε)` would give `−1`, and strong exponential
  decay at `k_d` degenerate ends would then raise the index by `k_d` instead of lowering it, so
  the emptiness `r − k_d − 1 < 0` below would not follow.
- The fold model `β′ = −κβ²` has `β(s) = 1/(κs + c)`, so `β ≍ (1 + s)⁻¹`, `β′ ≍ (1 + s)⁻²` and
  `β″ ≍ (1 + s)⁻³`, the exponents `−k − 1` for `k = 0, 1, 2`; then `σ_u ≍ (1 + s)²`,
  `σ_u^{1/2} μ ≍ 1` is not in `L^q` on an infinite tail, while the translation variation
  `u_s ≍ (1 + s)⁻²` has `σ_u^{1/2} u_s ≍ (1 + s)⁻¹` and `σ_u ∇_s(Π_L u_s) ≍ (1 + s)⁻¹`, both in
  `L^q` for `q > 1`.
- NEP covers: for `div(A) = 2` and `m = 3` the monodromy of `A` is `2 ≢ 0 (mod 3)`, so the slide
  class does not lift to a closed loop and the Type II self-slide becomes a slide between distinct
  generators upstairs; with `m = 2` it would lift and the cover would not break the slide; a
  non-primitive `ν` with `ν(A) = 4` and `m = 2` has image `0` in `ℤ/2` and a disconnected cover,
  which the adapted-cover comparison handles componentwise.

*Needs:* 7.T.3–7.T.5; HeegaardFloer F0–F1; Lee I §§5–6 and Lee II.

### 7.T.7 Event formulas, zero branches and completion limits

Derive the actual oriented boundary identities for the regular homotopy before claiming invariance. A TypeI slide gives the specified elementary based change and no zeta jump. Fix increasing parameter λ and first an actual **death** at λ₀, with regular λ_−<λ₀<λ_+. On the minus side choose the disappearing lifted generators z⁺,z⁻ of source integer indices i,i−1, respectively, with local differential z⁺→z⁻ and reference sign normalized so its coefficient is 1+b. Define b, of strictly positive N-order, by the actual oriented return words in that entry. The plus complex has the pair removed. In the ordered block differential `[[1+b,v],[w,N]]` construct its Schur complement `N−w(1+b)⁻¹v` using N1. Prove the componentwise multiplication identities

`τ_+=(1+b)^((-1)^(i+1)) τ_−`,  `ζ_+=(1+b)^((-1)^i) ζ_−`.

Ratios are permitted only in a nonzero acyclic field component. For an increasing-parameter **birth**, use the same pair/reference data on the plus side and prove the inverse factors, equivalently the preceding identities with plus and minus interchanged. For an odd upper index i, the elementary disappearing odd-to-even map a=1+b has τ_−=a⁻¹ and τ_+=1, so the death torsion factor is a. These two factors cancel in I_F, but are not separate torsion invariances.

At a TypeII slide construct the full positive-order self-slide series and the changed based differential, retaining all higher coefficients. Prove its zeta factor cancels its determinant/torsion factor by NEP on the finite cyclic covers and the N4 norm/trace/log identities, using the geometric leading coefficient and cutoff stability. A first-order coefficient calculation is not an all-order cancellation proof. Where a component torsion is nonzero, cancel only in that field component with N4's proved nonvanishing norm comparison. For a nonacyclic component use the actual event chain equivalence to retain nonacyclicity and prove `0·ζ_+=0·ζ_-=0`, with no quotient by τ=0. Retain partially acyclic components rather than replacing the whole value by 0. Use the same multiplication identities in reference/lift transports.

Construct cutoff-compatible endpoint/event-limit matrices and their supported chain homotopies to neighboring regular complexes to establish that the acyclic component set remains fixed at those limits. Prove total-quotient cutoff continuity and convergence of the successive event products in N4's larger componentwise Novikov embeddings. Derive invariance on the whole compact parameter interval from the finite-cutoff identities; do not apply a finite-event induction globally or assume completeness of the total quotient from completeness of Λ_F. Finally quotient the result by its actual simultaneous sign/deck ambiguity.

**Checks.**
- A death at odd upper index `i` with `b = 0`: the disappearing pair is the elementary complex
  `0 → F → F → 0` with map `1`, so `τ_− = 1 · τ_+` and `ζ_− = ζ_+`; with `b ≠ 0` the factors
  `(1 + b)^{(−1)^{i+1}}` on `τ` and `(1 + b)^{(−1)^i}` on `ζ` multiply to `1` in `I_F`, and
  neither alone is invariant.
- A birth is the same event read with the parameter reversed, so its factors are the inverses:
  a death followed by a birth of the same pair with the same `b` returns `τ` and `ζ` to their
  values, while reading the birth with the death's factors would multiply by `(1 + b)^{±2}`.
- First-order truncation: for `b = βe^{A}` with `N_X(A) > 0`, `1 + b` has no higher term while
  `(1 + b)⁻¹ = 1 − βe^{A} + β²e^{2A} − ⋯` and `log(1 + b) = βe^{A} − β²e^{2A}/2 + ⋯`, so the `τ`
  and `ζ` factors of a death cancel only to all orders (their first-order truncations multiply
  to `1 − β²e^{2A}`, not to `1`); the Type II cancellation is an all-order statement.

*Needs:* 7.T.4–7.T.6; MorseNovikov N1 and N4; Hutchings §7.5.

### 7.T.8 Corrected Hamiltonian-connected invariant

After the preceding constructions define

`I_F=τ_F ζ_F ∈ Q(Nov(Q,K,N_X|K))/(±e^K)`.

Prove that for fixed w⁺ M,f,C and any two constructed regular pairs `(J₁,X+χ_H₁)` and `(J₂,X+χ_H₂)`, the two I_F values agree after the explicit reference/coefficient identification. The actual endpoint-relative admissible-path existence theorem, with genericity only inside its constructed constrained perturbation classes, produces the comparison; no theorem hypothesis is an arbitrary record containing all desired compactifications or the final equality. Derive independence from the auxiliary regular J and Hamiltonian perturbation and the corresponding Hamiltonian-isotopy transport of f,C, with the actual loop-component action and deck/flux diagrams. An ordinary continuation chain homotopy equivalence alone is not an invariance proof for τ_F; the correction and event calculations are essential. This is the bounded Floer analogue of the source's torsion remark, independent of Layer 8's Serre/family endpoints.

**Checks.**
- The zero-dimensional model of 7.T.4: `τ_F = 0`, `ζ_F = 1`, `I_F = 0`.
- Reference and lift changes and `s`-reversal act on the based determinant formulas by the sign
  and deck-monomial ambiguity `±e^K`, and by nothing else.
- Hamiltonian-connected pairs share their period character: a change `X ↦ X + X_H` leaves the
  flux class `[θ_X]` and hence `P_X` fixed, so both `I_F` values live in one ring; on `T²` with
  `f = id` the non-Hamiltonian change `X = 0 ↦ X = c ∂_x` has `θ_X = c dy`, and on the class
  swept by a loop of constant sections along the `y`-circle `P_X = c ≠ 0 = P_0`, so the rings
  differ and the comparison is 7.T.9's, not this item's.

*Needs:* 7.T.3–7.T.7; Lee I §§2.2–2.3 and 4.

### 7.T.9 Separate monotone strengthening and checks

When M is positively monotone in the source's actual spherical sense, construct the additional period/flux comparison and co-directional-family argument giving a rational group-ring value

`I_F^{f,C}(M)∈Q(Z[K])/(±e^K)`

whose image under `i_(−P_X)` is the constructed completed I_F for every regular pair. Include the zero-character to nonzero-character comparison through N1/N4's actual group-ring/total-quotient embeddings; arbitrary changing flux does not give identical completions. Prove invariance under symplectic isotopies with transport of f and of C by the actual π₁(Symp₀) action. Keep this stronger statement distinct from 7.T.8's fixed-period Hamiltonian-connected equality. Construct the source's identity-isotopic, basepoint-orbit specialization to the included classical abelian torsion of M only after its actual reference/period and finite-dimensional MorseNovikov comparison; it is not a definition of I_F or a generic PSS consequence.

**Checks.**
- `M` a point: the group-ring value is `0 ∈ ℚ(ℤ[0]) = ℚ` and its image is the completed
  `I_F = 0` of 7.T.8.
- `T²` with `f = id`: the characters of `X = 0` and `X = c ∂_x` differ on the class swept by a
  loop of constant sections along the `y`-circle (`0` against `c`, 7.T.8's Check), so the two
  completed rings are different completions of the one group ring `ℚ(ℤ[K])`, and the two
  completed `I_F` values are comparable only through the common group-ring value; a statement
  identifying the two completions by fiat would be false.
- The translation of `T²` by `(c, 0)` is the time-one map of `X = c ∂_x`, symplectically but not
  Hamiltonian isotopic to the identity, so its comparison with `f = id` is this item's and not
  7.T.8's. The loop `t ↦` translation by `(t, 0)` in `Symp₀(T²)` sends the component of the
  constant sections of `T_id` to that of the sections `t ↦ x + (t, 0)`, a different free homotopy
  class of loops: the invariance statement transports `C` and cannot fix it.

These checks do not assert an integral zeta formula, a quantitative fixed-point bound, a
nonabelian `s`-cobordism theorem or equality with a general genus-one curve count. Lee I,
§§2.1–2.3, 3.3 and 4–6, and Lee II give the degenerate gluing and orientation constructions.
*Needs:* 7.T.8, MorseNovikov N1 and N4, HamiltonianReduction R1a.2 (the identity component
`Symp₀` and its topology, for the transport of `f` and `C`).

### Examples

- The `C²`-small autonomous Morse Hamiltonian on `T²` (aspherical, `Γ = 0`): four constant
  orbits of indices `−1`, `0`, `0`, `1` and `FH_* ≅ H_{*+1}(T²)`, with the capped branch on
  `Γ = 0` reproducing it through the PSS comparison. On `S²`, monotone with `Γ = ℤ` and
  `d_C = 4`, the capped branch's cyclic formula places the two constant orbits of indices `−1`
  and `1` in the residues `±1` modulo `4`.
- `ℂPⁿ` with the standard positive monotone form: the cyclic module formula of 7.C.5b.
- The degree-two maps `z + ε/z` on `S²`, which Gromov converge to a pair of degree-one spheres
  with conserved class and energy (7.C.2d).
- `SH_*(D²ⁿ) = 0` and `SH_*(T*S¹) ≅ H_*(𝓛S¹)`.
- The zero-dimensional torsion model `M = pt`, `I_F = 0`.

### Dependencies

PseudoholomorphicCurveAnalysis PH1–PH7; HeegaardFloer Lanes F0–F2 and Lane M; Tau Ceti's local
compactness of pseudoholomorphic curves; MorseNovikov N1 and N4;
MorseTheory M4; SymplecticGeometry S0; CharacteristicClasses
C3.2; Layer 6; Tau Ceti's Moore loops; Layer 0 item 1 (for the fundamental chains consumed by Layer 8).
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
all-dimensional carrier input. *Needs:* Layer 7 item 2, Layer 0 item 1.

**Checks.**
- In index difference `1` the chain is the signed count of rigid cylinders modulo translation;
  in index difference `2` its boundary is minus the sum of the products over broken cylinders,
  the sign `(−1)^{|x| − |z|} = −1` of the source's Proposition 3.4.
- For a `C²`-small autonomous Morse Hamiltonian the Floer trajectory spaces are the Morse
  trajectory spaces and the systems of Layer 5 item 1 are representing chain systems.
- A system in which one chain is replaced by a homologous chain is again a representing chain
  system, and the two are homologous through the specified family.

### 8.2 The Barraud–Cornea twisting cocycle

Construct the twisting cocycle in `C_*(Ω𝓛X)` (the source's Definition 3.7), prove the twisting
equation of Proposition 3.8 and uniqueness up to homology (Proposition 3.9). *Needs:* item 1,
Tau Ceti `TauCeti.MooreLoopSpace` and `TauCeti.TwistingCocycle`.

**Checks.**
- The degree-`0` part is the classical Floer differential with `π₁(𝓛X)`-monodromy.
- The cocycle is one-sided because `C_*(Ω𝓛X)` is homologically nonnegative (Tau Ceti's
  `TauCeti.TwistingCocycle.one_sided_of_nonpos`).
- For the small autonomous Hamiltonian the cocycle is the Morse cocycle of Layer 5 item 2
  pulled back along the constant-loop inclusion `X → 𝓛₀X`.

### 8.3 The DG Floer complex

Define the DG Floer complex `FC_*(H, J, Ξ; 𝓕)` (the source's Definition 3.12) and prove its
independence of `(J, Ξ)` up to chain homotopy equivalence (Proposition 3.13). *Needs:* items
1–2, Tau Ceti `TauCeti.TwistingCocycle.twistedCochainComplex` and
`TauCeti.Homologous.homotopyEquiv`.

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
(Proposition 3.29). *Needs:* items 1–3, Layer 7 items 2 and 4, Tau Ceti `TauCeti.ContinuationCocycle`.

**Checks.**
- A constant continuation datum gives the identity cocycle and the identity map.
- In the standing direction of 7.1 (negative-end input, so the continuation map goes
  `FC(H₋) → FC(H₊)` and `𝒜_{H₊}(x₊) = 𝒜_{H₋}(x₋) − E(u) − ∫∫ ∂_s H_s(u) ds dt`), a monotone
  homotopy with `∂_s H ≥ 0` preserves the action filtration, and a general homotopy raises it by
  at most `∫ max_{X × S¹}(−∂_s H_s) ds`, a bound that is positive as soon as `∂_s H < 0`
  somewhere. The source's Corollary 3.24 reads `∂_s H ≤ 0` because its continuation map goes
  `FC(H₊) → FC(H₋)` (`bdho-cotangent` lines 2131–2138 and 2180–2184); the two correspond under
  `s ↦ −s`. For `H_s = H + ε(s)` with `ε` nondecreasing from `0` to `δ`, the bound is `0` and
  the shift is `−δ`, as in 7.4's Check; reading the source's `∂_s H ≤ 0` in the standing
  direction would predict a rise of `δ`.
- The composition of two continuation cocycles is a continuation cocycle for the composed
  homotopy, up to a parametrized cocycle.

### 8.5 Homotopies

Construct representing chain systems for parametrized moduli spaces (Proposition 3.30),
parametrized cocycles (Definition 3.31, Proposition 3.32) and the chain homotopy between
continuation maps (Definition 3.35). *Needs:* item 4, Tau Ceti `TauCeti.ParametrizedCocycle`.

**Checks.**
- A constant family of continuation data gives the zero homotopy.
- The homotopy between a continuation map and its composite with a reparametrized one is the
  one induced by the one-parameter family of reparametrizations.
- The chain-homotopy equation `Ψ¹ − Ψ⁰ = D⁻h + hD⁺` holds with the signs of Tau Ceti's
  `TauCeti.ParametrizedCocycle` (the source's Definition 1.11).

### 8.6 Closed manifolds

Prove that continuation maps are homotopy equivalences (Proposition 3.36) and the comparison
`FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` in the contractible component (Theorem 3.37), where
`i_X : X → 𝓛₀X` is the constant-loop inclusion; construct the canonical filtration (Definition
3.38) and the spectral sequence with `E² = FH_*(H; H_q(𝓕))` (Theorem 3.39); prove **Theorem J**:
for a Hurewicz fibration `F → E → 𝓛₀X`, `FH_*(H; C_*(F)) ≅ H_{*+n}(E|_X)`, compatibly with the
Serre spectral sequence. *Needs:* items 3–5, Layer 7 item 4, Layer 5 items 2–4, Tau Ceti
`TauCeti.TwistingCocycle.indexSpectralSequence` and `TauCeti.fibrationLocalSystem`.

**Checks.**
- Theorem J for the trivial fibration recovers `FH_*(H) ≅ H_{*+n}(X)` with coefficients (worked
  example 6).
- For `𝓕` concentrated in degree `0` the comparison is the classical `FH_*(X; L) ≅ H_{*+n}(X; i_X^*L)`.
- The degree shift is `n = ½ dim X`: on `X = T²` (`n = 1`), which is symplectically
  aspherical since `π₂(T²) = 0`, the contractible-component comparison applies (it needs
  asphericity alone, as 7.C.0 records; `T²` is not atoroidal, so the vanishing of `FH_*` on the
  other components of `𝓛T²` is not asserted for it), and the four constant orbits of the height
  function of the embedded torus have Conley–Zehnder indices `n − ind_Morse`, that is `+1`,
  `0`, `0`, `−1`, which the comparison sends to `H₂(T²)`, `H₁(T²)` (rank `2`) and `H₀(T²)`, as
  7.4's Check records. `S²` is an instance of neither statement, since the identity `S² → S²`
  has `∫ ω ≠ 0`; it stays the capped branch's `ℤ/4`-graded example of 7.C.5b.

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
homology); Layer 0 item 1; Layers 3–5 and Tau Ceti's DG local systems and twisted complexes. Source: the source paper §§3.3–3.7.

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
conventions. *Needs:* Layer 3 item 1, Tau Ceti `TauCeti.classicalDGLocalSystemEquivalence` and
`TauCeti.RankOneLocalSystem`, AlgebraicTopology Stage 6 (orientation system),
CharacteristicClasses (`w₁`, `w₂`), Layer 6 item 3.

**Checks.**
- For `Q` orientable and spin, `η₀` is trivial; for `Q = S¹`, `η₀` is trivial in degree zero
  (worked example 7).
- For `Q = ℝP²`, `w = −1` on the component of the orientation-reversing loops, where
  `ev₀^*(o_Q^{−1}) ⊗ ev₀^*(o_Q^{1})` is trivial, so `η₀ = σ` there (`bdho-cotangent` lines
  2995–3007). The loop of loops that rotates such a loop `γ` once around itself has adjoint
  `(θ, t) ↦ γ(θ + t)`, which factors through `S¹`, so `w₂` evaluates to `0` on it and `η₀` has
  monodromy `+1`. The factor `ev₀^*(o_Q^{−1})` alone has monodromy `−1` along it, since its
  evaluation loop is `γ` itself; so the factor `ev₀^*(o_Q^{−w})` is needed.
- The shift comparison: for `n = 1` and `α` of degree `1`, the Koszul factor is `−1`; a
  comparison without it would make the DG Viterbo map fail to be a chain map in degree `1`.

### 9.2 Classical Viterbo with local coefficients

For every classical local system `L` on `𝓛Q`, prove `SH_*(T*Q; Π^*L) ≅ H_*(𝓛Q; L ⊗ η₀)` (the
source's Viterbo isomorphism with local coefficients in §1.5, `bdho-cotangent` lines 671–681,
which it derives from Abouzaid's proof). The route is Abouzaid's, with coefficients in `L`
throughout: the map from symplectic homology to loop homology counts discs with one interior
puncture, asymptotic to the Hamiltonian orbits, with boundary on the zero section, evaluated at
equidistant boundary points into the piecewise-geodesic approximation of Layer 5 item 6 and its
Morse complex (Abouzaid Theorem 4.1.1 and §4.1, `abouzaid-viterbo` lines 3595–3614, with the
local-coefficient form in Remark 4.1.2, lines 3600–3603), and it is an isomorphism by the left inverse of Chapter 5 and the surjectivity
of Chapter 6 (Theorem 5.1.1 and Corollary 6.1.2, lines 4610–4614 and 6464–6468). Abouzaid's
grading is cohomological, `SH^* → H_{−*}`, and is read here through the homological conventions.
Abbondandolo–Schwarz Theorem 3.1 with its corrigendum (`abbondandolo-schwarz` lines 1771–1789) is
the untwisted statement, a chain isomorphism between the Morse complex of the energy functional
and the Floer complex of a Legendre-transform Hamiltonian; it is not the local-coefficient
statement. *Needs:* Layer 7 item 5, Layer 5 item 6, Tau Ceti
`TauCeti.classicalDGLocalSystemEquivalence`, item 1.

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
`E²` map is item 2. *Needs:* items 1–2, Layer 8 item 7, Layer 5 item 6, Tau Ceti
`TauCeti.TwistingCocycle.indexSpectralSequence` and `TauCeti.MooreFreeLoopSpace`, Layer 1 item 2.

- **Finite-dimensional approximation** (the source's §4.3; Abouzaid §3.2). Use the manifolds
  `𝓛ʳQ`, the maps `ιʳ`, `geoʳ`, the sampling maps `evᵣ`, the compact-family approximation lemma
  and the weak equivalence `colim geoʳ : colim 𝓛ʳQ → 𝓛Q` of Layer 5 item 6; the lemma replaces
  the source's Lemma 4.5. Part 1 of the source's Lemma 4.5, the retraction of the Moore loops of
  length `≤ L` onto the unit-speed ones, is false on the Moore carrier (conventions) and is not
  consumed by the source: its only use, in the proof of Lemma 4.15, is `geoʳ ∘ evᵣ ≃ id` on the
  compact set `⋃_x π ∘ Im ∘ q̄_x(𝓜̄(x))`, which the compact-family lemma supplies.

**Checks.**
- For `Q = S¹` the `E²` pages of both sides for `𝓕 = C_*(Ω𝓛S¹)` agree componentwise, with
  Layer 3's chosen basepoints and `η₀` (worked example 7).
- The finite-dimensional reduction (Lemma 4.15) uses `geoʳ ∘ evᵣ ≃ id` only on the compact set
  `⋃_x π ∘ Im ∘ q̄_x(𝓜̄(x))`: a reduction asking for a retraction of all Moore loops of duration
  `≤ L` onto the unit-speed ones would be false, since in a flat torus the unit-speed loops
  `(sin 2πnt, 1 − cos 2πnt)/(2πn)` of duration `1` converge to the constant loop of duration `1`,
  whose unit-speed representative has duration `0` (conventions).
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

Layers 5 (item 6), 7 (item 5) and 8 (item 7); Tau Ceti's classical and rank-one local systems; Layer 1 item 2 (weak
equivalences); AlgebraicTopology Stage 6 and CharacteristicClasses for `o_Q`, `w₁`, `w₂`.
Source: the source paper §§1.5 and 4; Abouzaid Chapters 3–6; Abbondandolo–Schwarz, *On the Floer
homology of cotangent bundles* and its corrigendum, for the untwisted case.

## Layer 10: the criteria and their applications to cotangent bundles

### 10.1 Theorem L

Prove **Theorem L** (= the source's Theorem 5.1, `bdho-cotangent` lines 735–739 and
3843–3846), the criterion for contractible almost existence. Let `W` be a Liouville domain of
dimension `2n`, `i_W : W → 𝓛₀W` the inclusion of the constant loops, and `Σ ⊂ W` a closed
hypersurface bounding a relatively compact open set `U` with inclusion `j_U`. If some DG local
system `𝓕` on `𝓛₀W` and some class `α ∈ H_*(W, ∂W; i_W^*𝓕)` satisfy `j_{U!}(α) ≠ 0` in
`H_*(U, ∂U; j_U^* i_W^*𝓕)` and `i_{W*}(α) = 0` in `SH_{*−n}(W; 𝓕)`, where `j_{U!}` is the
codimension-zero shriek map of Layer 5 item 3 and `i_{W*}` the map from the zero-energy sector
of Layer 8 item 7, then the contractible almost existence property holds near `Σ`; concisely,
`ker i_{W*} ⊄ ker j_{U!}` (Remark 5.2, lines 3847–3849). Prove it through the relative capacity
bound (Proposition 5.5), the fast-orbit lemma (Lemma 5.7) and the spectral invariants
`ρ(·, σ)` with their properties (Proposition 5.8).
*Needs:* Layer 8 item 7, Layer 6 items 2, 4 and 5.

**Checks.**
- For `W = D²ⁿ` and `𝓕 = ℤ`, `SH_*(D²ⁿ) = 0` (7.5), so `α = [W, ∂W]` has `i_{W*}α = 0`, while
  `j_{U!}α = [U, ∂U] ≠ 0` for every `U` bounded by `Σ`: the criterion applies to every closed
  hypersurface of the ball, consistently with the finite Hofer–Zehnder capacity of the ball
  (source's Theorem 5.1, `bdho-cotangent` lines 3843–3846). A criterion asking `i_{W*}α ≠ 0`
  instead would give nothing on the ball.
- The spectral invariant of a class is attained: `ρ(σ) = inf {c | σ ∈ im SH^{<c}}` is a
  critical value of the action when `σ ≠ 0`.
- The fast-orbit lemma bounds the period of the produced characteristic by the action window,
  so the capacity bound of Proposition 5.5 is finite when such a class exists.

### 10.2 Theorem M

Prove **Theorem M** (= the source's Theorem 6.4, `bdho-cotangent` lines 753–757 and
4382–4385), the criterion for finiteness of `c°_HZ(W)`: for a Liouville domain `W` of dimension
`2n`, if some DG local system `𝓕` on `𝓛₀W` and some `α ∈ H_*(W, ∂W; i_W^*𝓕)` satisfy
`j_!(α) ≠ 0`, where `j_! : H_{*+n}(W, ∂W; i_W^*𝓕) → H_{*−n}(𝓕)` is the shriek map of the
inclusion of a point, and `i_{W*}(α) = 0`, then `c°_HZ(W) < ∞`, so that the contractible almost
existence property holds in `W`. Prove it through the capacity bound `c°_HZ(W) ≤ c(α)`
(Proposition 6.6, lines 4394–4396). Prove its cotangent form, Proposition 6.7 (lines 4429–4432):
for a closed manifold `Q`, a DG local system `𝓕` on `𝓛₀Q` and `α ∈ H_*(Q; i_Q^*𝓕)` with
`j_!(α) ≠ 0` in `H_{*−n}(𝓕 ⊗ |Q|)` and `i_{Q*}(α) = 0`, `c°_HZ(D*Q) < ∞`; this includes the
nonorientable form, with the orientation twist `|Q|` of Layer 5 item 5. Irie's finiteness
of the ordinary `c_HZ(D*Q)` and the local-system finiteness of Albers–Frauenfelder–Oancea are
earlier results of the same type and are consumed by nothing here. *Needs:* Layer 8 items 6–7,
Layer 9 item 4, Layer 6 item 5, Layer 5 item 5.

**Checks.**
- For `W = D*Q` with `Q` a torus the hypothesis of Theorem M fails (no class with
  `j_!(α) ≠ 0` and `i_{Q*}(α) = 0` exists, since `Ω²T^r` is contractible) and
  `c°_HZ(D*T^r) = ∞`, as Layer 6 item 5's check shows directly.
- The bound `c(α)` is monotone in `α` under the action filtration: a class of smaller action
  gives a smaller capacity bound.
- For `Q = S²` the degree-`0` class of Proposition 5.11 (worked example 5) does not satisfy
  Proposition 6.7: `j_!` has degree `−n = −2`, so `j_!(α) ∈ H_{−2}(𝓕 ⊗ |Q|) = 0` for every
  degree-zero class, and the hypothesis `j_!(α) ≠ 0` needs a class of positive degree. The
  fibered families of 2-spheres that supply one (the source's Example 6.16) are DGFloerPartII's,
  so this roadmap proves nothing about `c°_HZ(D*S²)`; its `S²` statement is Theorem A through
  Propositions 5.9, 5.11 and 5.13 (item 3).

### 10.3 The cotangent criterion

Prove the cotangent criterion, the source's Proposition 5.9 (`bdho-cotangent` lines 4107–4117).
Let `Q` be a closed orientable smooth `n`-manifold and `Σ ⊂ T*Q` a closed hypersurface bounding a
relatively compact open set `U`. Let `i_Q : Q → 𝓛₀Q` be the inclusion of the constant loops into
the component of contractible loops, and `π_U : U → Q` the restriction of the projection. If for
some DG local system `𝓕` on `𝓛₀Q` the kernel of the direct map
`i_{Q*} : H_*(Q; i_Q^*𝓕) → H_*(𝓛₀Q; 𝓕)` is not contained in the kernel of the shriek map
`π_{U!} : H_*(Q; i_Q^*𝓕) → H_{*+n}(U, ∂U; π_U^* i_Q^*𝓕)`, then `Σ` has the contractible almost
existence property. No hypothesis places the zero section in `U`. The route applies Theorem L
(item 1) to a disc bundle `W = D*Q` whose interior contains the closure of `U`, with the DG local
system on `𝓛T*Q` transferred from `𝓕` (Layer 9 item 4, the source's Corollary 4.17): `π_{U!}` is
the Thom isomorphism `π_! : H_*(Q; i_Q^*𝓕) ≅ H_{*+n}(D*Q, S*Q; π^*i_Q^*𝓕)` followed by the
codimension-zero shriek map `j_{U!}` of `U ⊂ D*Q`, which is defined for every such `U`, and the
zero-energy diagram of Layer 9 item 4 with Theorem K identifies `i_{(D*Q)*}` with `i_{Q*}`
(`bdho-cotangent` lines 4118–4137). For non-orientable `Q` the same criterion holds for the DG
local systems `𝓕 ⊗ ℤ/2`, which is the form item 5 uses for Theorem 5.15 (`bdho-cotangent` lines
4299–4302). *Needs:* item 1, Layer 9 items 3–4, Layer 5 item 3 (shriek maps of manifold pairs).

**Checks.**
- For `Q = S²` and the unit disc bundle the criterion applies with the class of worked example
  5.
- For `Q = T^r` it does not apply, since `i_{Q*}` is injective.
- The criterion applies to domains that miss the zero section. `S³` is parallelizable, so it
  carries a nowhere-vanishing one-form `α`; for `λ > 0` the graph `φ(S³)` of `λα` misses the zero
  section, and so does a thin tube `U ≅ S³ × D³` around it, with `∂U ≅ S³ × S²`. Here
  `π ∘ φ = id` has degree `1`, so `ker π_{U!}` is `1`-torsion, that is zero (Proposition 5.13,
  item 4), while `ker i_{Q*}` contains `H₁(Ω²S³) = π₃(S³) = ℤ` (item 4); the criterion applies,
  and `∂U` has the contractible almost existence property. This is the source's remark that its
  theorems cover every domain containing the graph of a one-form (`bdho-cotangent` lines
  256–260). A version of the criterion restricted to domains containing the zero section would
  say nothing here.
- The orientability hypothesis enters through the integral Thom isomorphism `π_!`: for
  `Q = ℝP²` the disc bundle `D*ℝP²` is non-orientable (it is isomorphic to the tangent disc
  bundle), so it has no Thom class over `ℤ` and the untwisted integral form of `π_!` is not
  defined, while over `ℤ/2` every disc bundle has a Thom class and the `𝓕 ⊗ ℤ/2` form applies
  (Hatcher Theorem 4D.10 and §4.D Exercise 7, `hatcher-at` lines 19073–19074 and 19262–19263).

### 10.4 The kernel of `i_{Q*}`

Consume Lemma 3.41 from Tau Ceti, `TauCeti.isAspherical_iff_doubleLoopSpace_singularHomology`:
a path-connected space `Q`, not only a closed manifold, is a `K(π, 1)` (`TauCeti.IsAspherical`)
exactly when its double loop space `Ω(ΩQ, refl)` is path-connected (its `H₀ ≅ ℤ`) with vanishing
integral singular homology in every positive degree, with its cubical and Moore-loop forms. Then
prove Proposition 5.11 (`bdho-cotangent` lines 4154–4161). Let `π_k(Q)` be the first nontrivial
group among the `π_j(Q)`, `j ≥ 2`.
- If `k = 2`, `ker i_{Q*}` contains an infinite cyclic subgroup.
- If `k > 2`, `ker i_{Q*}` contains a subgroup isomorphic to `π_k(Q)`.
- If `k > 2` (so `π₂(Q) = 0`), `d ≥ 2` is an integer, and some `π_ℓ(Q)` with `ℓ > 2` is
  annihilated by no power `d^m`, `m ≥ 1`, then `ker i_{Q*}` is not `d`-torsion, that is, some
  element of it is not killed by `d`.

The third case uses the class of groups annihilated by some power of `d` (Layer 1 item 4).
Theorem 5.10 uses the first case when `π₂(Q) ≠ 0`, the second under its condition 1 and the
third, for `|d| ≥ 2`, under its condition 2 (`bdho-cotangent` lines 4252–4258); for `d = ±1` every
nonzero element of the kernel serves. Prove also Proposition 5.13: for
`φ : S → U` with `S` a closed smooth oriented `n`-manifold and `π ∘ φ` of degree `d ≠ 0`,
`ker π_{U!}` is `d`-torsion: `(π ∘ φ)_! = φ_! ∘ π_{U!}`, so `ker π_{U!} ⊆ ker (π ∘ φ)_!`, and
`(π ∘ φ)_* (π ∘ φ)_! = d · Id` (Layer 5 item 3; `bdho-cotangent` lines 4231–4242). *Needs:* Tau Ceti
`TauCeti.isAspherical_iff_doubleLoopSpace_singularHomology`, Layer 1 items 1, 2 and 4, Layer 2
item 3, Layer 5 item 3 (`f_* f_! = d · Id`) and item 5.

**Checks.**
- `Q = T^r`: `Ω²T^r` is contractible and `i_{Q*}` is injective.
- Lemma 3.41 needs `Q` path-connected, a hypothesis of the pinned statement: for `Q` two points,
  `Ω²Q` at either point is a point and has the homology of a point, while `Q` is not aspherical,
  since `TauCeti.IsAspherical` includes path-connectedness.
- Lemma 3.41 on `Q = S²`: `Ω²S²` has `π₀ = π₂(S²) = ℤ`, so `H₀(Ω²S²)` has rank `ℵ₀` and `S²`
  is not a `K(π, 1)`; on `Q = S³`, `Ω²S³` is path-connected but `H₁(Ω²S³) = π₃(S³) = ℤ`.
- `Q = S²`: `π₂(S²) = ℤ` is the first nonvanishing higher group; the source's proof identifies
  `ker i_{Q*}` with the homology of `P_{⋆→Q}𝓛₀Q ≃ Map_*(S², Q)` away from the unit, and
  `Map_*(S², S²)` has `π₀ = ℤ`, so the kernel contains an infinite cyclic subgroup in degree
  `0` (worked example 5).
- `Q = S³`: `π₃(S³) = ℤ` and `H₁(Ω²S³) = ℤ` (worked example 5). With `d = 2`, `k = 3` and
  `π₃(S³) = ℤ` is annihilated by no `2^m`, so the third case applies, and indeed the kernel
  contains `H₁(Ω²S³) = ℤ`, which is not `2`-torsion.
- The third case's hypothesis is on every power of `d` at once: for `d = 2`, the group `ℤ/4` is
  not `2`-torsion but is `2²`-torsion, so a `Q` whose higher homotopy groups are all `ℤ/4` or `0`
  does not meet it; a reading with "not `d`-torsion" in place of "annihilated by no `d^m`" would
  wrongly admit it.
- The third case needs `k > 2`: for `Q = S²`, `Ω₀S²` is not simply connected
  (`π₁(Ω₀S²) = π₂(S²) = ℤ`), so Serre's theorem modulo a class does not apply to it, and the
  first case (an infinite cyclic subgroup in degree `0`) is what holds.

### 10.5 Theorems A and C

Prove **Theorems A and C** in their general forms, the source's Theorems 5.10 and 5.15
(`bdho-cotangent` lines 4140–4150 and 4293–4298), and derive Theorems A and C from them as the
source does (lines 4260–4265 and 4330). The integral degree is stated homologically,
`(π ∘ φ)_*[S] = d · [Q]` over `ℤ`, and the mod-2 degree as the map that `π ∘ φ` induces on
`H_n(−; ℤ/2)`. In both, `S` is a closed **smooth** manifold, as in the source's Theorem 5.10: the
route goes through the Umkehr map `(π ∘ φ)_!` of Layer 5 item 3, which is built from Morse data
on `S`. Prove **Corollaries D and E** in their Theorem A and Theorem C forms, from Layer 6 items
3–4.

- *Theorem 5.10.* Let `Q` be closed and orientable, `S` closed, smooth and orientable, and
  `π ∘ φ` of nonzero degree `d`. Assume that `π₂(Q) ≠ 0`, or that the first nonzero `π_k(Q)`
  with `k ≥ 3` has an element not of `d`-torsion, or that some `π_ℓ(Q)` with `ℓ ≥ 3` is of
  `d^m`-torsion for no `m ≥ 1`. Then every hypersurface bounding a relatively compact domain
  that contains `φ(S)` has the contractible almost existence property. The route is items 3–4:
  `ker i_{Q*}` contains an element that is not of `d`-torsion (Proposition 5.11, its three cases
  matching the three alternatives), and `ker π_{U!}` is of `d`-torsion (Proposition 5.13). In
  `Suggested.lean` this is `hasContractibleAlmostExistence_of_degree_ne_zero`, with the
  alternatives as one disjunction: `π₂(Q)` nontrivial; or `π₃(Q), …, π_{k+2}(Q)` trivial and some
  `a ∈ π_{k+3}(Q)` with `a^d ≠ 1`; or some `π_{ℓ+3}(Q)` containing, for every `m ≥ 1`, an `a` with
  `a^(d^m) ≠ 1`.
- *Theorem A* is its two special cases. If `d = ±1`, the alternatives say that some `π_j(Q)`,
  `j ≥ 2`, is nontrivial, which for connected `Q` is that `Q` is not aspherical:
  `hasContractibleAlmostExistence_of_not_isAspherical`. If `d ≠ 0` and some `π_ℓ(Q)`, `ℓ ≥ 2`,
  is not a torsion group, equivalently `π_ℓ(Q) ⊗ ℚ ≠ 0`, then either `ℓ = 2` and `π₂(Q) ≠ 0`, or
  `π_ℓ(Q)` is of `d^m`-torsion for no `m`:
  `hasContractibleAlmostExistence_of_not_isTorsion_homotopyGroup`.
- *Theorem 5.15.* Let `Q` be closed and non-orientable, `S` closed and smooth, and `π ∘ φ` of
  nonzero mod-2 degree. Assume that `π₂(Q) ≠ 0`, or that `π_ℓ(Q) ⊗ ℤ/2 ≠ 0` for some `ℓ ≥ 3`.
  Then the same conclusion holds. When `π₂(Q) ≠ 0`, `Ω²Q` is disconnected, so `ker i_{Q*}` is
  nonzero in degree `0` with `ℤ/2` coefficients, while `ker π_{U!} = 0` (`bdho-cotangent` lines
  4303–4314). Otherwise the route uses the mod-2 vanishing theorem of Layer 1 item 4 in place of
  the source's class `{G | G ⊗ ℤ/2 = 0}`, which is not a Serre class: with `Y = Ω₀Q`, simply
  connected because `π₂(Q) = 0`, if `H̃_*(Ω₀Q; 𝔽₂) = 0` then every `π_i(Ω₀Q) = π_{i+1}(Q)` is
  uniquely 2-divisible, contradicting `π_ℓ(Q) ⊗ ℤ/2 ≠ 0`; the rest of the proof is the source's.
  In `Suggested.lean` this is `hasContractibleAlmostExistence_of_mod_two_degree_ne_zero`, with
  the hypothesis on `Q` that `π₂(Q)` is nontrivial or that squaring is not surjective on some
  `π_{ℓ}(Q)`, `ℓ ≥ 3`.
- *Theorem C* is its case where `Q` is not a `ℤ/2`-`K(π, 1)`, that is, `π_ℓ(Q) ⊗ ℤ/2 ≠ 0` for some
  `ℓ ≥ 2` (for `ℓ = 2` this forces `π₂(Q) ≠ 0`):
  `hasContractibleAlmostExistence_of_not_surjective_sq_homotopyGroup`.

The Lean statements share Tau Ceti's carriers: `Q` a compact connected smooth manifold and `S` a
compact smooth manifold, both Hausdorff and modelled on one finite-dimensional `E`; for Theorems
5.10 and A, homological orientations of both, and `d` defined by `(π ∘ φ)_*[S] = d • [Q]` through
`TauCeti.HomologicalOrientation.mapFundamentalClass`; the hypersurface the regular level
`F⁻¹(c)` of a smooth `F : T*Q → ℝ` with compact sublevel sets and `F < c` on `φ(S)`, so that it
bounds the relatively compact domain `{F < c}` containing `φ(S)`; and the conclusion
`TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` of
`TauCeti.CotangentBundle.symplecticForm`, with contractibility in `T*Q`. The source's form
`Σ dpᵢ ∧ dqᵢ = −ω_can` gives the same statement, since almost existence is invariant under
`ω ↦ −ω` (`TauCeti.SmoothTwoForm.IsNondegenerate.hasContractibleAlmostExistence_smul_iff`). For
Theorems 5.15 and C, `Q` is non-orientable (it has no `TauCeti.HomologicalOrientation`) and `S`
unoriented. The mod-2 degree needs no mod-2 fundamental class: the hypothesis is that `π ∘ φ`
induces a nonzero map `H_n(S; ℤ/2) → H_n(Q; ℤ/2)` on Mathlib's singular homology with
coefficients in `ZMod 2`. Since `H_n(Q; ℤ/2) = ℤ/2` for `Q` closed and connected, for connected
`S` this is the mod-2 degree `1`; for disconnected `S` it says that some component of `S` has
mod-2 degree `1`, and the source's statement for that component gives the same conclusion. The
`𝔽₂` stage of Layers 5 and 7–9 is enough for Theorems 5.15 and C. Layer 10's all-dimensional DG
trajectory and chain inputs come from Layers 7.2, 8 and 9; its module-comparison corollaries use
the common readout of Layer 7.C.5b only on its specified overlap. *Needs:* items 1–4, Layer 1 item 4, Layer 5 item 3 (the Umkehr map
of `π ∘ φ` and `f_* f_! = d · Id`), Layer 6 items 3–4, AlgebraicTopology Stage 6 (the homological
degree), Tau Ceti `TauCeti.HomologicalOrientation.mapFundamentalClass`, Mathlib
`AlgebraicTopology.singularHomologyFunctor`.

**Checks.**
- For `Q = S²`, `S = Q`, `φ` the zero section and `d = 1`: `∂U` has the contractible almost
  existence property for every bounded `U ⊆ T*S²` containing the zero section (worked example
  8).
- For `Q = T^r` no hypothesis of Theorem A holds, and indeed `S*T^r` carries no contractible
  closed characteristic. No alternative of Theorem 5.10 holds either, since every `π_j(T^r)`,
  `j ≥ 2`, is trivial.
- Theorem 5.10 is strictly wider than Theorem A in its hypotheses on `(Q, d)`. For `d = 2` and a
  first nonzero higher group `π₃(Q) = ℤ/3` with `π₂(Q) = 0`, a generator `a` has `a² = a⁻¹ ≠ 1`,
  so the second alternative holds, while Theorem A's first case needs `d = ±1` and its second a
  non-torsion group. For `d = 2` and `π₃(Q) = ℤ/2` the second alternative fails, since `a² = 1`
  for every `a`.
- For `d = ±1` the alternatives of Theorem 5.10 say exactly that some `π_j(Q)`, `j ≥ 2`, is
  nontrivial: `a^{±1} ≠ 1` says `a ≠ 1`. On `Q = S³` with `d = 1`, `π₂ = 0` and the second
  alternative holds with `k = 0` and the generator of `π₃(S³) = ℤ`; on the aspherical `T³` every
  alternative fails. So for connected `Q` the case `d = ±1` is Theorem A's first case.
- Theorem 5.15 is strictly wider than Theorem C: it accepts `π₂(Q) = ℤ/3`, on which doubling is
  bijective, so that `π₂ ⊗ ℤ/2 = 0` and Theorem C's hypothesis can fail at `ℓ = 2`. The source's
  proof covers this case: `Ω²Q` has `π₀ = π₂(Q)`, three components, so
  `H₀(Ω²Q; ℤ/2) = (ℤ/2)³ → H₀(pt; ℤ/2) = ℤ/2` has a two-dimensional kernel.
- Connectedness of `Q` is needed in the Lean statement: for `Q = T² ⊔ T²` and `φ` the zero
  section, `¬ TauCeti.IsAspherical Q q` holds because `Q` is not path-connected and `d = 1`, while
  the flat `S*Q` carries no contractible closed characteristic.
- The mod-2 vanishing theorem is applied to `Ω₀Q` and not to `Q`: for the non-orientable
  `Q = ℝP⁴`, `π₂(Q) = 0` and `Q` is not simply connected, but `Ω₀ℝP⁴ ≃ ΩS⁴` is, and
  `H₃(ΩS⁴; 𝔽₂) = 𝔽₂ ≠ 0`, which is what Theorem C needs; `π₄(ℝP⁴) = ℤ` gives
  `π₄ ⊗ ℤ/2 ≠ 0`.
- Theorem C on `Q = S = ℝP²` with `φ` the zero section: `ℝP²` has no orientation,
  `π₂(ℝP²) = ℤ` and squaring (doubling) is not surjective on it, and `π ∘ φ = id` induces the
  identity of `H₂(ℝP²; ℤ/2) = ℤ/2`, so every bounded `U ⊆ T*ℝP²` containing the zero section has
  the property. Over `ℤ` the hypothesis could never hold, since `H₂(ℝP²; ℤ) = 0`: the degree has
  to be read mod 2.
- Theorem C's hypothesis on `Q` is needed: for the Klein bottle `K`, `π_ℓ(K) = 0` for `ℓ ≥ 2`,
  so squaring is surjective on each and the hypothesis fails, and indeed the flat `S*K` carries
  no contractible closed characteristic.
- Disconnected `S` in Theorem C: for `S = ℝP² ⊔ ℝP²` with `φ` the zero section on both
  components, the total mod-2 degree is `1 + 1 = 0`, while the induced map
  `(ℤ/2)² → ℤ/2`, `(a, b) ↦ a + b`, is nonzero; the conclusion holds through either component,
  so the Lean hypothesis is the right one.
- `S` smooth: a closed topological manifold with no smooth structure, such as Freedman's `E₈`
  manifold in dimension `4`, has no Morse function, so the Umkehr map of Layer 5 item 3 is not
  available for it; the source's Theorem 5.10 assumes `S` smooth, and so do the Lean statements.

### Examples

- `Q = S²`: almost existence on every bounded hypersurface around the zero section.
- `Q = ℝP²`: the same through Theorem C, with the degree read mod 2.
- `Q = T^r`: the criteria are silent and the conclusion is false.

### Dependencies

Layers 6, 8, 9; Layer 1 items 1, 2 and 4; Layer 2 item 3; Layer 5 item 5; AlgebraicTopology
Stage 6; Tau Ceti `TauCeti.HomologicalOrientation.mapFundamentalClass`,
`TauCeti.CotangentBundle.symplecticForm` and `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence`.
Source: the source paper §§5 and 6.1–6.2.

## Layer 11: the finite cover of a compact connected Lie group

Let `G` be a compact connected Lie group. The applications of the continuation roadmap need to
know exactly when `G` is aspherical, and the string-orientation roadmap needs the same
criterion; this layer settles it from the Lie-theoretic suppliers, and nothing in it depends on
the Floer theory above.

### 11.1 The finite cover `T × K → G`

Consume LieGroups Layer 5 for the universal cover and its discrete central kernel, and Layer 4
for Lie's third theorem and the integration of Lie-algebra homomorphisms out of simply connected
groups. For the Lie algebra `𝔤` of a compact Lie group:
- own the existence of an `Ad`-invariant inner product, the average of any inner product
  against CompactGroups Layer 0's Haar probability measure (Meinrenken Corollary 8.16,
  `meinrenken-lie` lines 1892–1903);
- consume HamiltonianReduction R5's `Ad`-invariant orthogonal splitting `𝔤 = 𝔷 ⊕ [𝔤, 𝔤]` for
  such an inner product, with `𝔷` the centre; own that `[𝔤, 𝔤]` is a direct sum of simple
  ideals, hence semisimple, by the same argument (the orthogonal complement of an ideal is an
  ideal; Meinrenken Theorem 8.22, lines 1946–1959);
- own the sign of the Killing form: the Killing form `B` of `𝔤` (Mathlib `killingForm`) is negative semidefinite with kernel `𝔷`:
  each `ad X` is skew for the invariant inner product, so `B(X, X) = tr((ad X)²) ≤ 0`, with
  equality exactly when `ad X = 0` (Meinrenken Proposition 8.33, lines 2131–2140). On a
  semisimple `𝔨 = [𝔨, 𝔨]`, whose centre is `0`, it is negative definite.

Integrate the abelian factor `𝔷 ≅ ℝʳ` and the semisimple factor `[𝔤, 𝔤]` to simply connected
groups (LieGroups Layer 4), identifying the universal cover with `ℝʳ × K`, where `K` is compact,
connected, simply connected and semisimple (Bröcker–tom Dieck Chapter V for the compactness of
`K`). Prove `Z(K)` is finite. The deck kernel `Γ` is discrete and central, hence lies in `ℝʳ × Z(K)`; compactness of
`(ℝʳ × K)/Γ` makes `Λ = Γ ∩ (ℝʳ × {1})` a full lattice in `ℝʳ`, and projection embeds `Γ/Λ` into
the finite group `Z(K)`, so `Λ` has finite index in `Γ`. Since `Λ` is central, the quotient map
`(ℝʳ/Λ) × K → (ℝʳ × K)/Γ ≅ G` is a finite covering `T × K → G` with `T = ℝʳ/Λ` a torus
(Bröcker–tom Dieck Chapter V). *Needs:* LieGroups Layers 4–5, CompactGroups Layer 0,
HamiltonianReduction R5 (the orthogonal splitting), Mathlib `killingForm`.

**Checks.**
- `G = U(n)`: the cover is `S¹ × SU(n) → U(n)`, `(z, A) ↦ zA`, of degree `n`, with kernel the
  `n`-th roots of unity embedded diagonally. On the Lie algebra, `𝔷 = iℝ · I` and
  `[𝔤, 𝔤] = 𝔰𝔲(n)`, and the Killing form `B(X, X) = 2n tr(X²) − 2(tr X)²` is `0` at `X = iI`
  (`−2n² + 2n²`) and `2n tr(X²) = −2n Σ|x_{ij}|² < 0` at nonzero `X ∈ 𝔰𝔲(n)`.
- Compactness is needed for the sign of the Killing form: on `𝔰𝔩(2, ℝ)` the diagonal
  `h = diag(1, −1)` has `B(h, h) = 4 tr(h²) = 8 > 0`, while on `𝔰𝔲(2)`, with
  `[e₂, e₃] = e₁` and its cyclic permutations, `ad e₁` rotates the plane of `e₂, e₃`, so
  `B(e₁, e₁) = tr((ad e₁)²) = −2 < 0`.
- `G = SO(3)`: `r = 0`, `K = SU(2)` and the cover is the double cover `SU(2) → SO(3)`.
- `G = T^r`: `K` is trivial and the cover is the identity; a construction that produced
  `ℝʳ → T^r` would not be finite.

### 11.2 Higher homotopy across the cover

Prove that finite coverings induce isomorphisms on `π_j` for every `j ≥ 2`, through
UniversalCovers' induced maps on homotopy groups. Prove that `π₃(K) ≠ 0` for nontrivial `K`:
for a compact connected simply connected Lie group `π₃` is free abelian, and `ℤ` for a simple
one (Bott, *An application of the Morse theory to the topology of Lie-groups*, §1, as a
corollary of its Theorems A and B, `bott-lie-groups` lines 92–93). The route here detects a root
subgroup by the Cartan 3-form, with no Morse theory of loop spaces.
- Let `B` be the Killing form of the Lie algebra `𝔨` (Mathlib `killingForm`), negative definite
  since `K` is compact semisimple (item 1), and `ω(X, Y, Z) = B(X, [Y, Z])` the
  corresponding left-invariant 3-form. It is
  bi-invariant, and closed by the `ad`-invariance of `B` and the Jacobi identity.
- *Root homomorphisms*, owned here. Choose a maximal torus `T ⊆ K` with Lie algebra `𝔱`
  (LieGroups Layer 6). The weights of `T` on `𝔨_ℂ` give `𝔨_ℂ = 𝔱_ℂ ⊕ ⨁_{α ∈ R} 𝔨_α`, the
  weight-zero space being `𝔱_ℂ` (Meinrenken Definition 11.11, `meinrenken-lie` lines
  3189–3205), and the set `R` of roots is nonempty, since `𝔨 = [𝔨, 𝔨] ≠ 0` is not abelian. For a
  root `α` the spaces `𝔨_α`, `𝔨_{−α}` and `[𝔨_α, 𝔨_{−α}]` are lines, spanned by `e_α`, `f_α`,
  `h_α` with `[h_α, e_α] = 2e_α`, `[h_α, f_α] = −2f_α` and `[e_α, f_α] = h_α`; these can be
  chosen with `ē_α = −f_α` and `h̄_α = −h_α` for the conjugation of `𝔨_ℂ` fixing `𝔨`, so that
  `𝔰𝔲(2)_α = span_ℝ(e_α − f_α, i(e_α + f_α), i h_α)` lies in `𝔨` (Meinrenken Theorem 12.4 and
  Proposition 12.5, lines 3466–3534; the complex triple is also Mathlib's
  `LieAlgebra.IsKilling.exists_isSl2Triple_of_weight_isNonZero` for `𝔨_ℂ` and its splitting
  Cartan subalgebra `𝔱_ℂ`). The injective Lie-algebra map `𝔰𝔲(2) → 𝔨` onto `𝔰𝔲(2)_α`
  integrates to `f : SU(2) → K` because `SU(2)` is simply connected (LieGroups Layer 4;
  Meinrenken Theorem 7.8 and Remark 12.6, lines 1592–1594 and 3537–3543), and the
  differential of `f` is injective. On a basis `e₁, e₂, e₃` of `𝔰𝔲(2)` with `[e₂, e₃] = e₁` and its
  cyclic permutations, `f^*ω(e₁, e₂, e₃) = B(df e₁, df e₁) < 0`. So `f^*ω` is a left-invariant,
  nowhere-vanishing top form on `SU(2) ≅ S³`, and `∫_{S³} f^*ω ≠ 0`.
- If `f : S³ → K` were null-homotopic, smooth the null-homotopy: embed `K` in a Euclidean space
  (Mathlib `exists_embedding_euclidean_of_compact`), approximate by a smooth map
  (`exists_contMDiffMap_forall_mem_convex_of_local`) and project back by GeometricTopology
  Layer 1's tubular retraction. DifferentialGeometry Layer 5's homotopy operator and Stokes
  theorem on the boundaryless `S³` then give `∫_{S³} f^*ω = 0`, since `dω = 0` and a map close to
  a constant lands in a chart ball, where `ω` is exact. This contradicts the previous step, so
  `f` represents a nonzero element of `π₃(K)`.

*Needs:* UniversalCovers, item 1 (the invariant inner product and the Killing form), LieGroups
Layer 6 (maximal tori) and Layer 4 (integration out of `SU(2)`), DifferentialGeometry Layers 0–1
and 5 (integration, Stokes and the homotopy operator), GeometricTopology Layer 1 (tubular neighbourhoods), Mathlib `killingForm`,
`exists_embedding_euclidean_of_compact` and `exists_contMDiffMap_forall_mem_convex_of_local`.

**Checks.**
- `π₃(SU(2)) = π₃(S³) = ℤ`, and the root `SU(2)` of `SU(2)` is the identity.
- The normalization of the rank-one subalgebra on `K = SU(3)` with its diagonal torus and the
  root `α = ε₁ − ε₂`: the conjugation fixing `𝔰𝔲(3)` is `X ↦ −X*`, so `e_α = E₁₂` gives
  `f_α = −ē_α = E₂₁` and `h_α = [E₁₂, E₂₁] = E₁₁ − E₂₂`, with `α(h_α) = 2` and
  `h̄_α = −h_α`; `𝔰𝔲(2)_α` is the upper-left `2 × 2` block and `f` is the block inclusion
  `SU(2) → SU(3)`. With the sign `f_α = +ē_α = −E₂₁` instead, `e_α − f_α = E₁₂ + E₂₁` is
  Hermitian, not in `𝔰𝔲(3)`, so the real-form condition excludes that choice.
- `π₃(SO(3)) = π₃(SU(2)) = ℤ` through the double cover; `π₂(SO(3)) = 0`.
- `π₃(T^r) = 0`: the criterion of item 3 separates `T^r` from every other compact connected
  Lie group. On a torus the Killing form is `0`, so `ω = 0` and the Cartan 3-form detects
  nothing, as it must.
- `K = SU(2) × SU(2)`: `π₃(K) = ℤ²`, one generator for each root subgroup `SU(2) × 1` and
  `1 × SU(2)`, free as Bott's corollary says; `∫ f^*ω ≠ 0` for each of the two root
  homomorphisms.

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

LieGroups Layers 4–6, CompactGroups Layer 0, UniversalCovers (completed), DifferentialGeometry
Layers 0–1 and 5, GeometricTopology Layer 1; Mathlib `LieGroup`, `Circle`, `ContinuousMulEquiv`,
`killingForm`, `exists_embedding_euclidean_of_compact`,
`exists_contMDiffMap_forall_mem_convex_of_local`; HamiltonianReduction R5; Tau Ceti
`IsAspherical`. Source: the source
paper §6.4 (Example 6.30 and the proof of Proposition 6.31); Bröcker–tom Dieck, *Representations
of Compact Lie Groups*, Chapter V; Meinrenken, *Lie groups and Lie algebras*, §§7–8 and 11–12;
Bott, *An application of the Morse theory to the topology of Lie-groups*, §1.

## Downstream consumers

- **AlgebraicTopology.** Stage 5.5 consumes Layer 1 item 2's fibration homotopy exact sequence
  and Serre spectral sequences; Stage 8.10 consumes Layer 1 item 1's degree-one Hurewicz
  isomorphism and item 4's abelian Eilenberg–MacLane family; Stages 8.9, 8.11 and 8.12 consume
  Layer 1 item 2's fibre transport, CW approximation and Serre sequence, and Layer 2 item 3's
  loop comparison. Where those items consume Tau Ceti (the degree-one Hurewicz isomorphism, CW
  approximation of path-connected spaces, the canonical homeomorphisms), the citing stage can
  consume Tau Ceti directly.
- **GeneralizedCohomology.** G2.10's fibration-sequence applications and G5's rational
  Hurewicz consume Layer 1 item 2's exact sequence and multiplicative Serre spectral sequence.
- **CharacteristicClasses** consumes Layer 1 item 2's connected-map homology comparison.
- **MorseTheory** M5 consumes Layer 1 item 3's filtered-complex algebra; **ComplexKahlerGeometry**
  and **RiemannianGeometry** R3 consume Layer 1 item 2's spectral sequence and early
  weak-equivalence comparison.
- **StableHomotopyKTheory** consumes Layer 1 items 1–4; **StringOrientation** consumes Layer
  11's finite cover and torus criterion.
- **HeegaardFloer** consumes Layer 1 item 2's Serre spectral sequence and multiplicative
  cohomological Serre sequence, and Layer 7 consumes nothing back from this use.
- **MorseNovikov** consumes Layer 1 item 1's natural `H₁ ≅ π₁ᵃᵇ`. Layer 7.C and 7.T consume its
  N1 and N4 back, and Layer 1 item 1 consumes nothing from MorseNovikov, so the two directions
  are acyclic item by item; where the degree-one Hurewicz isomorphism is Tau Ceti's
  (`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv`, path-connected spaces in the smallest
  universe), MorseNovikov can consume Tau Ceti directly.
- **TopologicalKTheory** (T1.5), **SeibergWittenTheory** (SW3.3a), **ReductiveGroups**,
  **BordismFormalGroups** and **SpinRepresentations** consume Layer 1 item 2: the homotopy exact
  sequence of a Serre fibration with its bundle-to-Serre comparison, and the ordinary
  cohomological Serre spectral sequence with local coefficients.
- **GeometricCurrents** consumes Layer 0: the coherent corner fundamental chains of Layer 0
  item 1, and the normalized cubical chains, cross product and simplicial comparison, which are
  Tau Ceti's and which it can consume from Tau Ceti directly.
- **HamiltonianFloerOperations** consumes the capped classical branch 7.C: its cap cover and
  period datum, cylinders, continuation maps, ordered orientation conventions and the PSS module
  comparison with both inverse homotopies (7.C.5b, 7.C.6c).
- **DGFloerPartII** consumes Layer 1 items 1–6, Layer 2, Layer 4 item 1, Layer 5 items 4–6,
  Layer 6 items 3–4, Layer 10 and Layer 11, for Theorem B, the manifolds abundant with
  2-spheres, the projective loop-space computations and the knotted hypersurfaces.

## Worked examples

1. **Cubical comparison.** The cubical and simplicial homology of `S¹` and of a point agree
   through Tau Ceti's comparison `TauCeti.cubicalSingularHomotopyEquiv`. The cross product of the fundamental chains of `I` and `I` is
   the fundamental chain of `I²`, on the nose.
2. **Sign and variance audit.** The twisting equation of Tau Ceti's `TauCeti.TwistingCocycle`
   (Layer 4) is the DG roadmap's `(MC)`
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
     `ind x = 1`, `ind y = 0`, `m_{x,y} = (1, 0)`. Tau Ceti's twisted differential
     `TauCeti.twistedDifferential` gives `D(1 ⊗ x) = 1 ⊗ y` for the first action and `D(1 ⊗ x) = 0` for the second, and its
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
| Def 1.1 | Tau Ceti `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence`, consumed by 6.5 |
| Conj 1.2 | out of scope |
| Thm A, C | 10.5 (Thms 5.10, 5.15) |
| Cor D, E | 6.3, 6.4, 10.5, in their Theorem A and Theorem C forms |
| Cor F | out of scope |
| Def 1.8 | Tau Ceti `TauCeti.DGLocalSystem`; basepoint change 3.1 |
| Defs 1.9–1.11 | Tau Ceti `TauCeti.TwistingCocycle`, `TauCeti.ContinuationCocycle`, `TauCeti.ParametrizedCocycle` |
| Thm J | 8.6 |
| Thm K | 9.3 |
| Thm L | 10.1 (Thm 5.1) |
| Thm M | 10.2 (Thm 6.4) |
| Lem 2.1, Prop 2.2 | Tau Ceti `TauCeti.RankOneLocalSystem` |
| Def 2.3, Props 2.5, 2.6, Lem 2.9, Prop 2.12, Cor 2.13, Lem 2.14 | 5.5 |
| Lem 3.1, Prop 3.3 | 7.3 |
| Props 3.4, 3.6, Def 3.5 | 8.1 |
| Def 3.7, Props 3.8, 3.9 | 8.2 |
| Def 3.12, Prop 3.13 | 8.3 |
| Props 3.14, 3.16, Defs 3.15, 3.17, 3.21, Props 3.18, 3.19, 3.22, Cors 3.24, 3.25, Props 3.26, 3.27, Cor 3.28, Prop 3.29 | 8.4 |
| Prop 3.30, Def 3.31, Prop 3.32, Def 3.35 | 8.5 |
| Prop 3.36, Thm 3.37, Def 3.38, Thm 3.39 | 8.6 (the filtration is Tau Ceti's index filtration) |
| Lem 3.41 | Tau Ceti `TauCeti.isAspherical_iff_doubleLoopSpace_singularHomology`, consumed by 10.4 |
| Props 3.44–3.46, Thm 3.49 | 8.7 |
| Prop 4.1, Cor 4.17 | 9.4 |
| Lem 4.5 | 5.6, part 2 on compact families, consumed by 9.3; part 1 (the unit-speed retraction) is false on the Moore carrier and not consumed |
| Props 4.6, 4.7, 4.9–4.11, 4.13, 4.14, Lem 4.15, Prop 4.16 | 9.3 |
| Thm 5.1, Prop 5.5, Lem 5.7, Prop 5.8 | 10.1 |
| Def 5.3 | Tau Ceti `TauCeti.SmoothTwoForm.relContractibleHZCapacity`, consumed by 6.5 |
| Prop 5.9 | 10.3 |
| Thm 5.10, Thm 5.15 | 10.5 (5.15 through the mod-2 vanishing theorem of 1.4) |
| Prop 5.11, Prop 5.13 | 10.4 |
| Thm 5.12 | 1.4, for genuine Serre classes; the source's mod-2 class is replaced there |
| Def 6.1, Prop 6.3 | 6.5 (Def 6.1 for the whole domain is Tau Ceti's `TauCeti.SmoothTwoForm.contractibleHZCapacity`) |
| Thm 6.4, Props 6.6, 6.7 | 10.2 |
| Ex 6.30 (the aspherical hypothesis), the finite cover in the proof of Prop 6.31 | 11 |

### Classical sources of Layer 7.C and 7.T

| Source statements | Construction target |
| --- | --- |
| Salamon, *Lectures on Floer homology*, §1.4 (symplectic action), §2.4 (Conley–Zehnder index), §2.5 (spectral flow) | 7.C.0–7.C.2 |
| Salamon §2.6 (transversality), §2.7 (exponential convergence); Floer–Hofer–Salamon, *Transversality in elliptic Morse theory*, Lemma 6.5 (the symmetric-matrix lemma) | 7.C.2 |
| Salamon §4.2 (Definitions 4.3–4.5, Theorems 4.8–4.10, Corollary 4.11: genus-zero stable maps, Gromov convergence and compactness); Ivashkovich–Shevchishin, *Gromov compactness theorem for stable curves*, Theorem 1.1 and Remark 2 | consumed through gap:genus-zero-stable-map-compactness; 7.C.2d |
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
| `Part2/CauchyPompeiu.lean`, `CauchyHolder.lean`, `FloerRegularity.lean`, `Ch6.lean`: Cauchy and Beurling transforms, Calderón–Zygmund and Schauder estimates on the Hölder scale, elliptic regularity of the Floer equation, energy and gradient bounds, convergence at the ends, compactness for bounded energy, on `ℝ²ⁿ` and the torus | Layer 7 items 1–2, flat case; a Hölder-scale alternative to the Sobolev route of PH3–PH5 and Lanes F0–F1. The Cauchy and Beurling transforms with their Hölder estimates are a contribution to their owner, PseudoholomorphicCurveAnalysis PH3.1, which cites `CauchyPompeiu.lean` and `CauchyHolder.lean`; they are not a target here |
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
  (BDHO): Layers 0 and 3–5, and Remarks 9.2.4–9.2.5 and Proposition 11.3.2 for Layer 1 item 5.
  Statement numbers follow the arXiv version.
- J.-F. Barraud, O. Cornea, *Lagrangian intersections and the Serre spectral sequence*, Ann. of
  Math. 166 (2007), arXiv:math/0401094, Appendix A on corner structures: Layer 0 item 1.
- W. S. Massey, *Singular Homology Theory*, GTM 70, Springer, 1980, Chapters II and VII:
  cubical singular chains.
- J.-P. Serre, *Homologie singulière des espaces fibrés. Applications*, Ann. of Math. 54 (1951),
  Chapter II; *Groupes d'homotopie et classes de groupes abéliens*, Ann. of Math. 58 (1953),
  Theorem 1: Layer 0 and Layer 1 item 4.
- A. Hatcher, *Algebraic Topology*, Cambridge University Press, 2002 (the author's online
  edition): Theorem 2A.1, §3.3 (the cap product and Example 3.31), §4.1 (Propositions 4.13,
  4.21, 4.30, Lemma 4.31), §4.2 (Theorem 4.41, Proposition 4.48), §4.3 (pullbacks of
  fibrations), §4.D (Corollary 4D.9, Theorem 4D.10 and Exercises 7–8: Thom classes, Layer 1
  item 5 and Layer 10 item 3), §4.J.
- C. Weibel, *An Introduction to Homological Algebra*, Cambridge University Press, 1994,
  Theorems 5.5.1 and 5.5.10: Layer 1 item 3.
- G. W. Whitehead, *Elements of Homotopy Theory*, GTM 61, Springer, 1978, Chapter I: Layer 2.
- R. Palais, *Local triviality of the restriction map for embeddings*, Comment. Math. Helv. 34
  (1960): Layer 1 item 6.
- M. Audin, M. Damian, *Morse Theory and Floer Homology*, Universitext, Springer, 2014 (the
  authors' online edition), Chapters 6–11: Layer 7 items 1–4.
- D. Salamon, *Lectures on Floer homology*, IAS/Park City Math. Ser. 7 (1999), §§1.4, 2.4–2.7,
  3.1–3.7 and 4.1–4.2: Layer 7.C.
- S. Ivashkovich, V. Shevchishin, *Gromov compactness theorem for stable curves*,
  arXiv:math/9903047 (version 1), Theorem 1.1 and Remark 2: the compactness of genus-zero stable
  maps over a family of structures, the contract gap:genus-zero-stable-map-compactness.
- H. Hofer, D. Salamon, *Floer homology and Novikov rings*, in *The Floer Memorial Volume*,
  Birkhäuser, 1995, §4: Layer 7.C.6.
- A. Floer, H. Hofer, D. Salamon, *Transversality in elliptic Morse theory for the symplectic
  action*, Duke Math. J. 80 (1995), 251–292, Lemma 6.5: Layer 7.C.2's symmetric-matrix lemma.
- S. Piunikhin, D. Salamon, M. Schwarz, *Symplectic Floer–Donaldson theory and quantum
  cohomology*, in *Contact and Symplectic Geometry*, Publications of the Newton Institute 8,
  Cambridge University Press, 1996, 171–200, §4: the PSS maps of Layer 7.C.3b and 7.C.5b.
- P. Seidel, *A biased view of symplectic cohomology*, arXiv:0704.2055, §2(a) (Liouville
  domains and their completions, Layer 6 item 2) and §3 (Layer 7 item 5).
- M. Abouzaid, *Symplectic cohomology and Viterbo's theorem*, arXiv:1312.3354 (version 2);
  in *Free loop spaces in geometry and topology*, IRMA Lect. Math. Theor. Phys. 24 (2015).
  Chapter numbers follow the arXiv version: Chapter 1 (Layer 7 item 5), Chapter 3 (Layers 5
  item 6 and 9 item 3), Chapter 4 (Theorem 4.1.1 and Remark 4.1.2) and Chapters 5–6
  (Theorem 5.1.1 and Corollary 6.1.2): Layer 9 item 2.
- A. Abbondandolo, M. Schwarz, *On the Floer homology of cotangent bundles*, Comm. Pure Appl.
  Math. 59 (2006), arXiv:math/0408280, Theorem 3.1, and its corrigendum: the untwisted case of
  Layer 9 item 2.
- D. McDuff, D. Salamon, *Introduction to Symplectic Topology*, 3rd ed., Oxford Graduate Texts
  in Mathematics 27, Oxford University Press, 2017, §3.1: Layer 6 item 0.
- R. Abraham, J. E. Marsden, *Foundations of Mechanics*, 2nd ed., Benjamin/Cummings, 1978,
  Chapter 3: Layer 6 item 0.
- P. R. Chernoff, J. E. Marsden, *Properties of Infinite Dimensional Hamiltonian Systems*,
  Lecture Notes in Mathematics 425, Springer, 1974: weak and strong nondegeneracy, Layer 6
  item 0.
- P. Hartman, *Ordinary Differential Equations*, 2nd ed., Classics in Applied Mathematics 38,
  SIAM, 2002, Chapter V, Theorem 3.1: the variational equation, Layer 6 item 0.
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
- E. Meinrenken, *Lie groups and Lie algebras*, lecture notes, University of Toronto (the
  author's online notes, version of Winter 2026): Theorem 7.8 (integration of Lie-algebra
  homomorphisms), Corollary 8.16 (invariant inner products), Theorem 8.22 (centre and simple
  ideals), Proposition 8.33 (the Killing form), Definition 11.11 (roots), Theorem 12.4,
  Proposition 12.5 and Remark 12.6 (the rank-one subalgebras `𝔰𝔲(2)_α` and their
  homomorphisms `SU(2) → G`): Layer 11 items 1–2.
- R. Bott, *An application of the Morse theory to the topology of Lie-groups*, Bull. Soc. Math.
  France 84 (1956), 251–281, §1 (the corollary to Theorems A and B: `π₃` of a compact simply
  connected Lie group is free, and `ℤ` for a simple one): Layer 11 item 2.
