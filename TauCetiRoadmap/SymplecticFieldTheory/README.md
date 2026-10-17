# Contact homology and the symplectic field theory formalism

Construct rational contact homology of closed cooriented contact manifolds, its
exact symplectic cobordism maps and symmetric monoidal functor on homology.
Build the punctured-curve analysis, coherent virtual count comparisons and
orientation-line algebra that make this construction work for multiply covered
curves. Develop the multiple-input and arbitrary-genus SFT algebra on explicit
coefficient carriers, together with its geometric realization data and conditional
comparison theorems. These are separate levels of the theory: a contact differential
counts one-positive-end spheres, while the SFT formalism also describes fusion of
several inputs and higher genus.

The definitive specification is this README. `Suggested.lean` gives selected
interface prototypes, not an exhaustive checklist. The basic contact construction
is over ℚ and is unconditionally a construction target. The general SFT realization
assertion in S8 is a precisely stated research-level assertion; the required
deliverables there are its data, statement and conditional algebraic consequences.
Its existence is not a premise hidden in the contact-homology theorem.

## Scope, conventions and suppliers

Work with a closed smooth cooriented contact manifold Y of dimension 2n−1,
n≥2, and a contact form λ with ker λ=ξ. Every covered closed Reeb orbit must
be nondegenerate. An exact cobordism has a compact core, specified positive and
negative contact boundaries, a global primitive, and its cylindrical completion.
Its ends carry fixed cylindrical almost complex structures, with
Ĵ∂s=Rλ and Ĵ|ξ compatible with dλ. Families retain uniform end data and
compactly supported changes on their cores. Disjoint unions and empty ends are
included. Nonexact coefficient-valued constructions have the additional support
and class data in S9; exact-cobordism theorems retain their exactness hypothesis.

| Datum | Convention |
| --- | --- |
| Morphism direction | A cobordism from Y+ to Y− gives a map from the positive contact algebra to the negative one |
| Principal coefficients | ℚ; orbit orientation lines are formed integrally before scalar extension |
| Principal grading | Parity, without an assumed global integer Conley–Zehnder lift |
| Integer comparison | For a specified compatible lift, homological degree of qγ is CZSFT(γ)+n−3 and the differential has degree −1 |
| Native DG comparison | Reindex C^k=CC−k, so the differential has degree +1 |
| Signs | Koszul signs use actual parity; orientation and normal factors retain their displayed order |
| Multiplicities | κγ is the positive covering multiplicity; marker and permutation factors are derived from the labelled/unlabelled comparison |
| Symplectization energy | Hofer's bounded energy, not the generally infinite integral of d(e^sλ) |
| Full SFT normalization | Normal-ordered q then p; [pγ,qη]super=δγη κγℏ, with ℏ even |

Use the following single owners at their stated scope.

- [ContactGeometry, CG1–CG6](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1049)
  supplies contact forms, Reeb vector fields, symplectizations, contact-type ends
  and the elementary contact transformations. This roadmap constructs the orbit
  and punctured-count applications of that geometry.
- [HeegaardFloer, F0 and F1.1–F1.5](https://github.com/TauCetiProject/TauCetiRoadmap/pull/957)
  supplies Banach/Fredholm, cylindrical Sobolev, elliptic/adjoint/UCP,
  common-domain spectral flow, the single Maslov/CZ and determinant-line theory,
  punctured weighted Riemann–Roch and finite-dimensional zero-mode extensions.
  F2's ordinary curve regularity and conditional gluing are inputs only at their
  actual hypotheses. S2–S4 construct the nonlinear Reeb-end and building adapters.
- [ImplicitAtlases, V0–V6](https://github.com/TauCetiProject/TauCetiRoadmap/pull/974)
  supplies topological atlas data, orientation sheaves, relative virtual
  complexes, normalized global obstruction traces, specified refinement and
  concordance comparisons, and finite cell-like strata/products. Its principal
  VFC is a functional on cohomology. S5 constructs the contact-specific
  coherent chain diagrams and comparisons needed before extracting counts.
- [DGAInfinity](../DGAInfinity/README.md) supplies generic graded modules,
  signed tensor operations, DG/A∞ algebra and category vocabulary. Use the
  implemented `TauCeti.InternalGrading`, `TauCeti.IsDGAlgebra` and ordinary
  cochain-complex assembly where their hypotheses hold.
  [StablePeriodicCurved](../StablePeriodicCurved/README.md) supplies parity
  complexes and their integer/parity comparisons. The contact differential has
  square zero; ℏ is a genus parameter, not a curved-module curvature element.
- [MorseTheory](../MorseTheory/README.md) supplies finite-dimensional Morse
  operations used in the explicit comparison examples. SFT does not introduce
  another Morse complex or another linear index construction.
- [GromovWittenTheory](https://github.com/TauCetiProject/TauCetiRoadmap/pull/990)
  supplies closed-curve comparison targets when S8 has no punctures. Its closed
  stable-map compactification does not establish the Reeb-end compactification.

Use native manifolds, vector bundles, flows, `ModuleCat`, tensor algebras,
quotients, direct sums, cochain complexes and homology. Construct missing
application adapters here. No implementation or merger of a supplier proposal
is required before constructing its specified objects.

## S0. Orbit lines and usable signed algebras

Construct parametrized periodic Reeb trajectories, their periods and iterates,
unparametrized orbits, covering multiplicities, asymptotic markers and their
finite reparametrization groups. Prove a positive lower bound for periods and
finiteness of nondegenerate unparametrized orbits below each fixed action bound.
State the compactness/isolation argument including covered orbits. Construct
generic nondegenerate contact forms using the actual parameterized Reeb return
map and its iterates; a generic-J theorem is not this assertion.

From S3's determinant transport construct the integral rank-one orbit line oγ
and its cyclic marker action. Good means this action is trivial; bad means it
is nontrivial. Prove this agrees with the usual even-cover parity criterion,
including its invariance under changing auxiliary trivializations. Construct
V=⊕γ good (ℚ⊗ℤ oγ), with the actual parity of each summand. The orientation
line is retained until a temporary basis is chosen for a coordinate formula.

Construct the free unital supercommutative algebra A(V) as the native tensor
algebra quotient by xy=(−1)^(|x||y|)yx for homogeneous generators. Prove the
universal property, functoriality, homogeneous decomposition, basis independence,
and the comparison with Sym(Veven)⊗Exterior(Vodd) over ℚ. In particular odd
squares vanish. Mathlib's ordinary unsigned `SymmetricAlgebra` is used only
on the even part. Supply inclusions, projection onto each word length, finite
signed monomial expansions, permutation/braid identities, coefficient extension
and the disjoint-orbit tensor-product comparison. These are the specialized
free orbit-algebra adapters; the generic DG interface remains with its owner.

Use the signed `GradedTensorProduct` carrier and its total-degree grading for
the disjoint-orbit comparison, following
[Mathlib #42879](https://github.com/leanprover-community/mathlib4/pull/42879)
and its two-index tensor-decomposition prerequisites in
[Mathlib #42365](https://github.com/leanprover-community/mathlib4/pull/42365).
Construct the tensor input-degree grading and the signed quotient grading by
images of homogeneous tensor pieces, following the homogeneous-quotient design
included in [Mathlib #39356](https://github.com/leanprover-community/mathlib4/pull/39356).
For an existing integer lift, push its grading along ℤ→ℤ/2 by the same
proposal's fibre-sum construction and compare with the directly constructed
parity-only algebra. This comparison does not produce an integer lift from
parity data. Prove compatibility of generators, multiplication, differentials
and coefficient maps. Construct the missing scoped adapters here in that API
shape; adopt the upstream implementation when available.

Prove that a parity-odd linear assignment V→A(V) extends uniquely to an odd
Leibniz map d, and that d²=0 is equivalent to its vanishing on generators.
Construct the corresponding integer-graded statements when an integer lift is
supplied. The latter theorem reduces the geometric boundary identity to a
checkable algebraic statement; it does not supply that boundary identity.

## S1. Punctured maps, energy and compactification

Define stable punctured maps into completed cobordisms and symplectizations:
ordered positive and negative punctures with orbit and marker data, complex
domains, nodes, relative homotopy/homology labels, and their actual finite
automorphisms. Construct normalization and domain deformations. In the contact
core use connected genus-zero maps with one positive end and any finite number
of negative ends, including planes. Define the target translation quotient
where it acts, and identify the remaining isotropy; an ℝ quotient is not a
finite group quotient.

Construct the bounded dλ/Hofer energy and its cobordism-core extension. Prove
positivity, the end Stokes formula, action bounds, and the exclusion of
nonconstant closed components in the exact case. Prove finite-energy
exponential convergence to the specified nondegenerate orbit with phase,
marker and coordinate comparisons, using S2's end operators. A genuine Reeb
end is not a removable puncture under a finite ordinary-area hypothesis.

Build the topology of holomorphic buildings with actual level and matching
data, domain convergence, neck stretching and componentwise target translations.
Prove sequential/compact Hausdorff bounded energy/topology pieces with the
appropriate finite type and class statements. Establish the compactness theorem
before imposing smooth-J regularity. Keep fixed genus, ends and the necessary
energy/class window in the nonexact statement; no finite global orbit set is
asserted across all action levels.

For the contact theorem construct Pardon's smaller compactification: omit
trivial cylinders and forget relative vertical positions as specified by its
tree model. Prove its relation to the retained-level building compactification,
its actual cell-like stratification and all codimension-one faces used in S5.
Prove the effect of forgotten faces on the count comparison rather than
identifying the two compactifications by terminology. Families of cobordisms
and composition necks have their own compactifications and relative faces.

## S2. Weighted linear and nonlinear Reeb-end analysis

Identify the normal asymptotic operator along a Reeb orbit with F1's actual
selfadjoint graph-domain carrier. Prove its spectral gap, coefficient
regularity and frame-change laws. Split off the ℝ/Reeb tangential directions
and construct the finite-dimensional phase/translation extensions. For every
fixed finite list of ends choose weights smaller than its nonzero spectral
gaps. Construct the weighted Banach charts and nonlinear Cauchy–Riemann
section, with explicit differentiability budgets, its derivative and adjoint,
elliptic bootstrap and compact inclusions on localized regions.

Use map variations and compactly supported domain-complex-structure variations,
quotiented by the actual infinitesimal automorphisms. Construct all slice and
stabilization comparisons; a normal section alone is not the whole tangent
domain. Prove the exponential convergence theorem in S1 from the end equation,
spectral estimates and nonlinear remainder control, first locally and then
with the bounded family uniformity actually used in gluing. The raw energy
compactness construction and this local convergence analysis do not consume
generic surjectivity of multiply covered problems.

Instantiate the punctured Fredholm index and determinant gluing. In the
conventional SFT index the unquotiented virtual dimension is

`(n−3)(2−2g−k+−k−)+2c₁^τ(u*TX)+Σ+ CZ^τSFT−Σ− CZ^τSFT`.

Construct the domain-deformation contribution and prove this formula from
F1.5. Compare actual linearized Reeb paths with F1.4's normalization
CZHF=−μRS: prove the crossing/trivialization dictionary before replacing a
CZSFT symbol by −CZHF. Retain relative c₁, cap and recapping data. Subtract
each genuinely free target-translation factor and add actual family dimensions;
do not subtract one for every arbitrary disconnected building. Prove the
index and orientation comparisons for trivial cylinders, planes and broken
configurations, and the independence of the full index from τ.

## S3. Stabilization, local gluing and orientation descent

Construct incidence stabilization and finite-dimensional compactly supported
obstruction spaces equivariantly under the retained finite groups. Prove
surjectivity of the augmented operator by adjoint elliptic regularity and
unique continuation, retaining the allowed support region. For a specified
surjective augmented problem, build pregluing, calibrated kernel comparisons,
uniform right inverses in the chosen neck/end norms, quadratic estimates,
Newton correction and converse recovery/uniqueness. Include node and Reeb
matching parameters, domain deformations and family directions.

Prove the resulting local homeomorphism with the appropriate cell-like
gluing space, nodal complex parameters, free real parameters and obstruction
directions. Prove compatibility with forgetting auxiliary obstruction spaces
and stabilizations and with group actions. No globally smooth corner structure
is inferred from these topological charts. Generic somewhere-injective
regularity has its stated witnesses; covered curves use the augmented/virtual
construction, not a claim of generic regularity for all covers.

Construct determinant orientation gluing and compare it with the topological
virtual orientation line. Order source/domain, translation/marker, obstruction,
normal and parameter factors explicitly. Construct cyclic marker actions and
prove good-orbit descent and bad-orbit cancellation in the actual boundary
diagram. Derive the labelled/unlabelled count formulas, negative-end permutation
denominators and intermediate covering factors. Prove the formula for repeated
negative orbits, including odd repetitions. A single unexplained 1/|Aut| factor
is not a substitute for these comparisons.

## S4. Actual contact implicit atlases

For every bounded contact tree type construct all of V1's thickenings,
obstruction representations, regular loci, zero-fiber maps, quotient and
extra-factor-freeness data. Prove regular-cover openness, extra-obstruction
projection models and finite subatlas coverage using S3. Include compact
parameter families and the boundary-atlas identifications, with the actual
cell-like face poset and normal orientation lines. Verify every V1/V6 axiom;
the existence of a Fredholm section alone is not an implicit atlas.

Construct compatible restriction, product, stabilization and tree-concatenation
diagrams. Auxiliary choices compare through specified common atlases,
refinements or concordances; different arbitrary atlases on the same zero set
need not have equal virtual weights. Apply V2–V6 to these actual inputs. Prove
regular-locus count normalization and the contact orientation comparison,
including ineffective isotropy and boundary-normal signs.

## S5. Coherent counts, differential and exact functor

Construct the tree-indexed chain-level virtual diagrams for symplectizations,
exact cobordisms, their one-parameter deformations and stretched compositions.
Retain disconnected configurations needed for the family homotopies. Construct
the comparison maps and the inversions of quasi-isomorphisms used to choose
coherent relative representatives. Prove compatibility with tree concatenation,
products, boundary incidence, obstruction generators and auxiliary-choice
comparisons. The V4 cohomology-level trace alone supplies none of these strict
diagram choices. Prove their required homotopies and independence on homology.

Extract the actual rational orientation-line counts from this system. Prove
finite output for each generator in the exact case, the signed boundary
identity with all marker/permutation factors, and its equality with d² on a
generator. Extend by S0, proving d is odd, d1=0, signed Leibniz and d²=0.
Planes contribute length-zero terms and are retained. Prove independence of
temporary orientation bases and the integer/cohomological DG comparison.

Construct unital algebra chain maps for exact cobordisms in the positive-to-
negative direction. Prove chain-map, identity-cylinder and stretched-composition
relations, with the ordinary chain homotopies supplied by these parameterized
systems. Prove independence on homology, rescaling comparisons, contact-form
and compatible-J invariance, and naturality under contactomorphisms. Give the
specified deformation category of exact cobordisms and prove the resulting
symmetric monoidal functor to parity-supercommutative ℚ-algebras. Construct the
empty-object/unit, disjoint union/tensor product, symmetry and composition
coherence maps. Ordinary chain homotopy is the scope of this assertion.

## S6. Augmentations, linearization and computations

For an actual chain algebra augmentation ε:A→ℚ prove I=ker ε and I² are
d-stable and construct the linearized complex I/I². Prove its differential
formula, basis independence, functoriality for augmentation-preserving maps and
the integer/parity comparisons. Construct the stronger algebra-homotopy data
needed for augmented invariance and prove invariance under that specified data.
S5's ordinary chain homotopies are not assumed to possess this strengthening.
Exact-filling augmentation comparisons have their actual additional coherent
family/count data as hypotheses.

For hypertight forms prove the absence of the plane-rooted boundary branches,
construct the cylindrical complex and compare it with the corresponding
length-one contact construction. Give the asymptotically hypertight filtered
version with its cofinal compatibility and limit maps. No augmentation sending
every generator to zero is used without proving its constant-term condition.

Prove the algebra examples da=bc, db=dc=0 with a odd, b,c even, and the
constant-term example da=1. In the latter construct a contracting homotopy,
deduce zero homology and prove there is no unital chain augmentation to ℚ.
Show explicitly why projecting an arbitrary contact differential onto its
length-one part can lose square zero when constant terms are present.

For irrational ellipsoid boundaries, compute the closed Reeb orbits, periods,
covering multiplicities, good-orbit lines and CZ indices in the chosen
trivializations. Prove every contact generator has even parity, hence d=0,
and identify its rational contact algebra and grading with their change-of-
trivialization laws. Derive the sphere/contact-form comparison through S5;
the degenerate round form is not an input to a nondegenerate-orbit count.

## S7. Multiple-input Poisson and arbitrary-genus Weyl algebra

Construct the normal-ordered coefficient algebra with formal p-words and
polynomial q-coefficients, and then formal nonnegative ℏ powers. Coefficients
are on finite signed orbit monomials; odd p or q repetitions vanish. Prove
each multiplication and contraction coefficient is a finite sum. For the Weyl
product, a fixed output p-word bounds the right p-subword; the corresponding
right q-polynomial bounds the possible contractions. Prove this finite-support
argument also for infinitely many orbit labels, signs and the ℏ coefficient.
Do not complete indiscriminately in both p and q.

Construct the graded Poisson bracket with {pγ,qη}=δγη κγ and its Jacobi,
Leibniz and continuity laws. Construct the associative Weyl product with the
displayed supercommutator relation, normal-order basis/universal property and
classical-limit comparison. In the integer lane set
|pγ|=2(n−3)−|qγ| and |ℏ|=2(n−3); prove the bracket has degree −2(n−3).
Give the parity-only versions without imposing integer gradability.

For an odd rational Hamiltonian h with no p-free part and {h,h}=0, construct
the Hamiltonian differential and prove square zero. Construct its iterated-
bracket coderivation on the reduced symmetric coalgebra, the correct shifts,
unshuffle signs, and the comparison of its unary operation with the one-positive
contact differential. These algebraic constructions are conditional on the
displayed Hamiltonian equation and have no unstated analytic hypothesis.

Use the genus-normalized series K=Σg≥0 ℏ^g Hg and H=ℏ⁻¹K. Prove graded
commutators are ℏ-divisible on the specified Weyl carrier. From K⋆K=0 derive
the well-defined operator D=[K,−]/ℏ, its continuity and D²=0; give the equivalent
Laurent-normalized H formulation. Square zero of an inner differential alone
does not imply this master equation. Construct cobordism potential modules,
left/right endpoint actions and contraction-based composition, with a proved
finite-support domain for every exponential and contraction used. Put
`H±=ℏ⁻¹K±`. The even cobordism potential has normalization
`F=ℏ⁻¹Σg≥0 ℏ^g Fg` and integer degree zero when an integer lift is present;
prove these properties from the virtual index. In the mixed p+,q− module,
the left negative-end action has q− acting by multiplication and
`pγ−=κγ−ℏ ∂qγ−` with the left super derivative. The right positive-end action
has p+ acting by right multiplication and q+ by `κγ+ℏ ∂pγ+` with the right
super derivative. For homogeneous m use
`∂R_p m=(−1)^(|p|(|m|−1)) ∂L_p m` and prove the actual opposite-action and
super-bimodule identities. Define
`DX(m)=H−·m−(−1)^|m| m·H+`, and prove DX²=0 from the endpoint master
equations. The potential equation is `DX(exp(F))=0`, equivalently
`H−·exp(F)−exp(F)·H+=0` for even F. Cobordism potentials are not in general
multiplicative maps between endpoint Weyl algebras. Establish the classical
rational limit and the one-positive comparison with its exact multiplicity
normalization.

For these potentials construct the following larger exact-sector carrier.
For a normal-ordered positive p-word I and integer ℏ exponent N, put
`w(I,N)=N+length(I)`. Require a global integer lower bound on w and a
q-polynomial coefficient at each (I,N). Thus ℏ poles may grow with the
positive word length; a single global lower bound on N would exclude exp(F).
Prove the weighted carrier's product and endpoint-module laws: contractions
preserve additive w, the right p-word is a subword of a fixed output p-word,
and the two lower bounds make its possible w-values finite. The corresponding
finitely many right q-polynomials then bound contraction choices. Include the
signs and coefficient topologies in this argument.

In this exact punctured sector write the potentials as H>0 and F>0: every
counted connected domain has at least one positive puncture. There are no
p-free summands, standalone connected closed-map domains or interior marked-form/descendant
insertions in this sector, including no connected stable constant no-end maps.
Retain all ghost components attached to a counted punctured domain. Prove
exactness excludes nonconstant no-positive-end components; exclusion of
standalone constant maps is part of the specified punctured carrier, not a
consequence of the energy identity. Consequently F>0 has positive p-length
and w≥0, with the even parity and genus normalization just specified.

Construct exp(F>0) in the mixed commutative carrier: its coefficient at positive
word I uses only powers at most length(I). The empty configuration gives its
unit term and is distinct from a geometric vacuum count. Construct the endpoint
actions and contraction pairing, proving preservation of their stated domains.
For composition along k≥1 intermediate ends prove the weights add, that the
finite intermediate q-polynomial bounds k and its orbit labels, and that
`gout=g1+g2+k−1` for two connected pieces. A self-loop adds one genus and
one ℏ. These prove the endpoint-pairing finiteness and exponent law independently
of merely asserting closure of the ordinary Weyl product.

Retain p-free/no-positive-end and marked closed-map contributions as a separately
named vacuum/closed-GW sector. Construct its coefficient families with actual
evaluation/compact-support data and its comparison to the closed-GW owner where
that comparison applies. Specify a complete separated multiplicative filtration
in which its even connected vacuum potential has strictly positive filtration,
and prove convergence and the usual identities for its exponential under that
hypothesis. A scalar of zero filtration, or an unweighted ℏ⁻¹ vacuum term,
does not satisfy it. The joint energy/genus/insertion support comparison and
the mixed-sector combination/sewing theorems retain that hypothesis and the
actual virtual compatibility data. The unrefined exact punctured construction
uses F>0; it does not silently set an independently specified vacuum sector to
zero. Nonexact sectors also retain S9's additional class and support data.

## S8. Geometric realization assertion and conditional sewing

Define realization data on the actual graph-indexed punctured moduli problems:
all permitted positive/negative ends and genera; compact energy/topology pieces;
retained finite isotropy, nodes, level and marker data; the augmented gluing
models; virtual orientation lines; relative chain systems and trace comparisons;
and their actual graph-concatenation, family and parameter-face maps. Include
multiple matching edges, cycles and genus addition. A contact tree system is
not definitionally such a graph system.

State the realization assertion that these data can be constructed coherently
for the specified nondegenerate exact contact/cobordism problems. Treat it as a
mathematical statement in its own right, distinct from S5's established-model
construction. The formalization here includes this exact statement and the
conditional theorems below; it does not identify a historical foundational
sketch, an abstract claiming a construction, or unrelated virtual numbers with
a proof of this assertion.

Given those geometric data, prove the raw signed codimension-one boundary and
Stokes identities, coefficient finiteness and orientation/covering comparisons.
Derive {h,h}=0 and K⋆K=0 from those identities, rather than adding the master
equations themselves as unspecified fields in the geometric datum. Derive
the cobordism-potential equation, gluing, parameter homotopies and invariance
under the supplied coherent comparisons, and apply S7. Prove the agreement with
S5 only after constructing the smaller-contact/full-building comparison and
showing that every extra boundary contribution has the asserted effect.

Construct the genus-zero multiple-input and higher-genus examples of the
formalism: two inputs joining one output, one input splitting into two, and
two matching edges producing a handle. Compute their graph automorphisms,
genus/ℏ exponents, multiplicity and orientation contractions. These demonstrate
the loop fusion/separation idea on actual indexed data, without claiming every
formal graph has a nonzero holomorphic curve count. The no-end comparison with
closed GW theory retains its actual evaluation/virtual compatibility inputs.

## S9. Class coefficients and support comparisons

Construct the coefficient extension with actual relative classes, area and
Chern homomorphisms, capping/reference changes and recapping maps. Use the
[MorseNovikov N1 coefficient theory](https://github.com/TauCetiProject/TauCetiRoadmap/pull/890) for its native finite-sublevel group-ring
carrier, and construct the additional signed-word convolution adapter here.
Track full class labels even when the area homomorphism is noninjective.
For a rigid curve with output word w derive the energy identity in the chosen
cap convention, and prove the change from area to energy-normalized generators.

For an energy-normalized contact completion require finitely many nonzero
full (class, energy, word) coefficients below every real cutoff, with a lower
support bound. Prove convolution finiteness, separatedness, completeness,
polynomial density and the coefficient comparison. Prove the actual generator
count supports satisfy this condition, and prove the nonnegative energy
estimate that makes d preserve the descending energy filtration before
extending it continuously. An arbitrary completion in increasing orbit action
does not have this property automatically. The differential changes word
length, so an Adams completion preserving a nonnegative grading is not this
construction. A completed element can also have infinitely many integer degrees;
use homogeneous closed pieces and ordinary complexes where appropriate, not a
false internal direct-sum decomposition of the whole completed algebra.

For nonexact cobordisms retain the required energy/class windows and compatible
systems in S1, S4 and S5. Prove the corresponding completed map theorem with
its exact support hypotheses. In S7/S8's multiple-input/genus constructions,
state and prove the joint energy/genus/word admissibility needed for each Weyl
contraction and potential; the contact completion alone supplies no such
product. Compare with the exact polynomial construction where finite sums
apply. These coefficient comparisons do not extend the exact-cobordism functor
to every strong cobordism without the stated data.

## Construction order and verification

Construct the orbit algebra and raw energy topology first, using the local end
analysis in parallel with raw compactness. Prove augmented local gluing and
orientation transport, then actual contact atlases, then coherent relative
diagrams, rational counts and the contact functor. Algebraic linearization uses
that functor with its own stronger homotopy inputs. The Poisson/Weyl algebra is
independent algebra; its geometric comparison uses the separately stated S8
realization data. Completed coefficient theorems consume their support proofs.
There is no covered-curve genericity → full gluing → genericity cycle, and no
reverse dependency from a generic virtual engine to this application.

Verify all finite-group/marker/permutation factors on a simple orbit, its good
and bad covers, repeated ends and an ineffective stabilizer. Verify the CZ sign
dictionary on a small rotation, the zero modes of a trivial cylinder, the plane
constant term and both ends of a one-parameter cobordism. Verify the signed
algebra examples, the ellipsoid computation, disjoint union symmetry and empty
object. In S7 verify one contraction, two-edge genus addition, ℏ divisibility,
the master-to-square-zero implication and a failure of an indiscriminate
two-sided completion. Every virtual count comparison retains its actual chain
map or proven homology effect.

## References

- J. Pardon, [Contact homology and virtual fundamental cycles](https://arxiv.org/abs/1508.03873),
  §§1–5: rational one-positive genus-zero contact algebra, exact cobordism maps,
  coherent virtual systems, compactification and count identities. Its §1.8
  distinguishes stronger homotopies and other SFT levels.
- Y. Eliashberg, A. Givental and H. Hofer,
  [Introduction to Symplectic Field Theory](https://arxiv.org/abs/math/0010059),
  §§2.1–2.5: Poisson/Weyl formalism and cobordism potentials. The geometric
  realization assertion and its algebraic consequences are distinguished above.
- F. Bourgeois, Y. Eliashberg, H. Hofer, K. Wysocki and E. Zehnder,
  [Compactness results in Symplectic Field Theory](https://arxiv.org/abs/math/0308183):
  punctured convergence, buildings and compactness.
- J. Latschev, [Remarks on the rational SFT formalism](https://arxiv.org/abs/2212.01814),
  §2: formal p-series with polynomial q-coefficients, weighted brackets,
  coderivations, morphisms, composition and linearization.
- R. Hind and K. Siegel, [Symplectic field theory: an overview](https://arxiv.org/abs/2410.19936),
  §§3–5: the analytical, algebraic and conditional realization boundaries.
- S. Ishikawa, [Construction of general symplectic field theory](https://arxiv.org/abs/1807.09455):
  a distinct Kuranishi approach to the general realization problem; it is not
  substituted for the contact-specific atlas and compatibility proofs here.
